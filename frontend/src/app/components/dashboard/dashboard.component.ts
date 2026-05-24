import { Component, OnInit } from '@angular/core';
import { TitheService } from '../tithe/service/tithe.service';
import { OfferingService } from '../offering/service/offering.service';
import { MemberService } from '../member/service/member.service';
import { Tithe } from '../../models/tithe';
import { Offering } from '../../models/offering';
import { Router } from '@angular/router';

interface Transaction {
  tipo: string;
  descricao: string;
  membro: string;
  valor: number;
  data: string | null | undefined;
}

interface ProjetoTotal {
  nome: string;
  total: number;
}

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  totalTithes: number = 0;
  totalOfferings: number = 0;
  totalGeral: number = 0;
  totalMembers: number = 0;

  tithes: Tithe[] = [];
  offerings: Offering[] = [];
  recentTransactions: Transaction[] = [];
  projetosTotais: ProjetoTotal[] = [];

  loading: boolean = true;

  constructor(
    private titheService: TitheService,
    private offeringService: OfferingService,
    private memberService: MemberService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadAll();
  }

  loadAll(): void {
    this.loading = true;
    let tithesDone = false;
    let offeringsDone = false;
    let membersDone = false;

    this.titheService.getAllTithes(0, 1000).subscribe({
      next: (res: any) => {
        this.tithes = res.content || [];
        this.totalTithes = this.tithes.reduce((s, t) => s + (t.value || 0), 0);
        tithesDone = true;
        if (tithesDone && offeringsDone && membersDone) this.finalize();
      },
      error: () => { tithesDone = true; if (tithesDone && offeringsDone && membersDone) this.finalize(); }
    });

    this.offeringService.getAllOfferings(0, 1000).subscribe({
      next: (res: any) => {
        this.offerings = res.content || [];
        this.totalOfferings = this.offerings.reduce((s, o) => s + (o.value || 0), 0);
        offeringsDone = true;
        if (tithesDone && offeringsDone && membersDone) this.finalize();
      },
      error: () => { offeringsDone = true; if (tithesDone && offeringsDone && membersDone) this.finalize(); }
    });

    this.memberService.getAllMembers().subscribe({
      next: (res: any) => {
        this.totalMembers = (res.content || []).length;
        membersDone = true;
        if (tithesDone && offeringsDone && membersDone) this.finalize();
      },
      error: () => { membersDone = true; if (tithesDone && offeringsDone && membersDone) this.finalize(); }
    });
  }

  finalize(): void {
    this.totalGeral = this.totalTithes + this.totalOfferings;
    this.buildRecentTransactions();
    this.buildProjetosTotais();
    this.loading = false;
  }

  buildRecentTransactions(): void {
    const titheTx: Transaction[] = this.tithes.map(t => ({
      tipo: 'Dízimo',
      descricao: 'Dízimo',
      membro: t.member?.name || '—',
      valor: t.value || 0,
      data: t.titheDate
    }));

    const offeringTx: Transaction[] = this.offerings.map(o => ({
      tipo: 'Oferta',
      descricao: o.churchProject || '—',
      membro: o.member?.name || '—',
      valor: o.value || 0,
      data: o.offeringDate
    }));

    this.recentTransactions = [...titheTx, ...offeringTx]
      .sort((a, b) => {
        const da = a.data ? new Date(a.data).getTime() : 0;
        const db = b.data ? new Date(b.data).getTime() : 0;
        return db - da;
      })
      .slice(0, 20);
  }

  buildProjetosTotais(): void {
    const map: { [key: string]: number } = {};
    this.offerings.forEach(o => {
      const projeto = o.churchProject || 'Sem projeto';
      map[projeto] = (map[projeto] || 0) + (o.value || 0);
    });
    this.projetosTotais = Object.entries(map)
      .map(([nome, total]) => ({ nome, total }))
      .sort((a, b) => b.total - a.total);
  }

  getBarWidth(valor: number): number {
    if (this.totalOfferings === 0) return 0;
    return Math.round((valor / this.totalOfferings) * 100);
  }

  voltarHome(): void {
    this.router.navigate(['/']);
  }
}
