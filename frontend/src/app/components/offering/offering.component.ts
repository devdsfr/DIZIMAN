import { Component, OnInit } from '@angular/core';
import { Offering } from '../../models/offering';
import { OfferingService } from './service/offering.service';
import { MemberService } from '../member/service/member.service';
import { Member } from '../../models/member';
import { Router } from '@angular/router';

@Component({
  selector: 'app-offering',
  templateUrl: './offering.component.html',
  styleUrls: ['./offering.component.css']
})
export class OfferingComponent implements OnInit {

  offerings: Offering[] = [];
  members: Member[] = [];
  offering: Offering = new Offering();
  selectedMemberId: number | null = null;
  selectedOffering: Offering | null = null;
  successMessage: string = '';
  errorMessage: string = '';

  constructor(
    private offeringService: OfferingService,
    private memberService: MemberService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadOfferings();
    this.loadMembers();
    this.offering.offeringDate = new Date().toISOString().substring(0, 10);
  }

  get totalOfferings(): number {
    return this.offerings.reduce((sum, o) => sum + (o.value || 0), 0);
  }

  loadOfferings(): void {
    this.offeringService.getAllOfferings().subscribe({
      next: (response: any) => {
        this.offerings = response.content || [];
      },
      error: (err: any) => {
        console.error('Erro ao carregar ofertas:', err);
        this.errorMessage = 'Erro ao carregar as ofertas.';
      }
    });
  }

  loadMembers(): void {
    this.memberService.getAllMembers().subscribe({
      next: (response: any) => {
        this.members = response.content || [];
      },
      error: (err: any) => console.error('Erro ao carregar membros:', err)
    });
  }

  onSubmit(): void {
    if (!this.offering.value || !this.offering.offeringDate || !this.offering.churchProject) {
      this.errorMessage = 'Preencha todos os campos obrigatórios.';
      return;
    }
    const payload: Offering = {
      value: this.offering.value,
      offeringDate: this.offering.offeringDate,
      churchProject: this.offering.churchProject,
      member: this.selectedMemberId ? { id: this.selectedMemberId } : undefined
    };

    if (this.selectedOffering) {
      this.offeringService.updateOffering(this.selectedOffering.id, payload).subscribe({
        next: () => {
          this.successMessage = 'Oferta atualizada com sucesso!';
          this.resetForm();
          this.loadOfferings();
        },
        error: (err: any) => {
          console.error('Erro ao atualizar:', err);
          this.errorMessage = 'Erro ao atualizar a oferta.';
        }
      });
    } else {
      this.offeringService.addOffering(payload).subscribe({
        next: () => {
          this.successMessage = 'Oferta registrada com sucesso!';
          this.resetForm();
          this.loadOfferings();
        },
        error: (err: any) => {
          console.error('Erro ao registrar:', err);
          this.errorMessage = 'Erro ao registrar a oferta.';
        }
      });
    }
  }

  editOffering(offering: Offering): void {
    this.selectedOffering = offering;
    this.offering = { ...offering };
    this.offering.offeringDate = offering.offeringDate
      ? new Date(offering.offeringDate).toISOString().substring(0, 10)
      : new Date().toISOString().substring(0, 10);
    this.selectedMemberId = offering.member?.id ?? null;
    this.successMessage = '';
    this.errorMessage = '';
  }

  deleteOffering(id: number | undefined): void {
    if (!confirm('Deseja realmente excluir esta oferta?')) return;
    this.offeringService.deleteOffering(id).subscribe({
      next: () => {
        this.successMessage = 'Oferta excluída com sucesso!';
        this.offerings = this.offerings.filter(o => o.id !== id);
      },
      error: (err: any) => {
        console.error('Erro ao excluir:', err);
        this.errorMessage = 'Erro ao excluir a oferta.';
      }
    });
  }

  resetForm(): void {
    this.offering = new Offering();
    this.offering.offeringDate = new Date().toISOString().substring(0, 10);
    this.selectedMemberId = null;
    this.selectedOffering = null;
    this.errorMessage = '';
  }

  voltarHome(): void {
    this.router.navigate(['/']);
  }

  getMemberName(offering: Offering): string {
    return offering.member?.name || '—';
  }
}
