import { Component, OnInit } from '@angular/core';
import { Tithe } from '../../models/tithe';
import { TitheService } from './service/tithe.service';
import { MemberService } from '../member/service/member.service';
import { Member } from '../../models/member';
import { Router } from '@angular/router';

@Component({
  selector: 'app-tithe',
  templateUrl: './tithe.component.html',
  styleUrls: ['./tithe.component.css']
})
export class TitheComponent implements OnInit {

  tithes: Tithe[] = [];
  members: Member[] = [];
  tithe: Tithe = new Tithe();
  selectedMemberId: number | null = null;
  selectedTithe: Tithe | null = null;
  successMessage: string = '';
  errorMessage: string = '';

  constructor(
    private titheService: TitheService,
    private memberService: MemberService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadTithes();
    this.loadMembers();
    this.tithe.titheDate = new Date().toISOString().substring(0, 10);
  }

  get totalTithes(): number {
    return this.tithes.reduce((sum, t) => sum + (t.value || 0), 0);
  }

  loadTithes(): void {
    this.titheService.getAllTithes().subscribe({
      next: (response: any) => {
        this.tithes = response.content || [];
      },
      error: (err: any) => {
        console.error('Erro ao carregar dízimos:', err);
        this.errorMessage = 'Erro ao carregar os dízimos.';
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
    if (!this.tithe.value || !this.tithe.titheDate) {
      this.errorMessage = 'Preencha todos os campos obrigatórios.';
      return;
    }
    const payload: Tithe = {
      value: this.tithe.value,
      titheDate: this.tithe.titheDate,
      member: this.selectedMemberId ? { id: this.selectedMemberId } : undefined
    };

    if (this.selectedTithe) {
      this.titheService.updateTithe(this.selectedTithe.id, payload).subscribe({
        next: () => {
          this.successMessage = 'Dízimo atualizado com sucesso!';
          this.resetForm();
          this.loadTithes();
        },
        error: (err: any) => {
          console.error('Erro ao atualizar:', err);
          this.errorMessage = 'Erro ao atualizar o dízimo.';
        }
      });
    } else {
      this.titheService.addTithe(payload).subscribe({
        next: () => {
          this.successMessage = 'Dízimo registrado com sucesso!';
          this.resetForm();
          this.loadTithes();
        },
        error: (err: any) => {
          console.error('Erro ao registrar:', err);
          this.errorMessage = 'Erro ao registrar o dízimo.';
        }
      });
    }
  }

  editTithe(tithe: Tithe): void {
    this.selectedTithe = tithe;
    this.tithe = { ...tithe };
    this.tithe.titheDate = tithe.titheDate
      ? new Date(tithe.titheDate).toISOString().substring(0, 10)
      : new Date().toISOString().substring(0, 10);
    this.selectedMemberId = tithe.member?.id ?? null;
    this.successMessage = '';
    this.errorMessage = '';
  }

  deleteTithe(id: number | undefined): void {
    if (!confirm('Deseja realmente excluir este dízimo?')) return;
    this.titheService.deleteTithe(id).subscribe({
      next: () => {
        this.successMessage = 'Dízimo excluído com sucesso!';
        this.tithes = this.tithes.filter(t => t.id !== id);
      },
      error: (err: any) => {
        console.error('Erro ao excluir:', err);
        this.errorMessage = 'Erro ao excluir o dízimo.';
      }
    });
  }

  resetForm(): void {
    this.tithe = new Tithe();
    this.tithe.titheDate = new Date().toISOString().substring(0, 10);
    this.selectedMemberId = null;
    this.selectedTithe = null;
    this.errorMessage = '';
  }

  voltarHome(): void {
    this.router.navigate(['/']);
  }

  getMemberName(tithe: Tithe): string {
    return tithe.member?.name || '—';
  }
}
