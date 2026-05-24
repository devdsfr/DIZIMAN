import { Component, OnInit } from '@angular/core';
import { Member } from '../../models/member';
import { MemberService } from './service/member.service';

@Component({
  selector: 'app-member',
  templateUrl: './member.component.html',
  styleUrls: ['./member.component.scss']
})
export class MemberComponent implements OnInit {
  members: Member[] = [];
  member: Member = new Member();
  selectedMember: Member | null = null;
  successMessage: string = '';
  errorMessage: string = '';

  constructor(private memberService: MemberService) {}

  ngOnInit(): void {
    this.getMembers();
    this.member.registrationDate = new Date().toISOString();
  }

  getMembers(): void {
    this.memberService.getAllMembers().subscribe({
      next: (response: any) => {
        this.members = response.content || [];
      },
      error: (err: any) => {
        console.error('Erro ao carregar membros:', err);
        this.errorMessage = 'Erro ao carregar membros.';
      }
    });
  }

  onSubmit(): void {
    if (this.selectedMember) {
      this.updateMember();
    } else {
      this.addMember();
    }
  }

  addMember(): void {
    this.member.registrationDate = new Date().toISOString();
    this.memberService.addMember(this.member).subscribe({
      next: (newMember: Member) => {
        this.members.push(newMember);
        this.successMessage = 'Membro salvo com sucesso!';
        this.resetForm();
      },
      error: (err: any) => {
        console.error('Erro ao salvar membro:', err);
        this.errorMessage = 'Erro ao salvar o membro.';
      }
    });
  }

  updateMember(): void {
    if (!this.selectedMember) return;
    this.memberService.updateMember(this.selectedMember.id, this.member).subscribe({
      next: (updatedMember: Member) => {
        const index = this.members.findIndex(m => m.id === updatedMember.id);
        if (index !== -1) this.members[index] = updatedMember;
        this.successMessage = 'Membro atualizado com sucesso!';
        this.resetForm();
      },
      error: (err: any) => {
        console.error('Erro ao atualizar membro:', err);
        this.errorMessage = 'Erro ao atualizar o membro.';
      }
    });
  }

  deleteMember(id: number | undefined): void {
    if (!confirm('Deseja realmente excluir este membro?')) return;
    this.memberService.deleteMember(id).subscribe({
      next: () => {
        this.members = this.members.filter(m => m.id !== id);
        this.successMessage = 'Membro excluído com suce