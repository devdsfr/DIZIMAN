import { Component, OnInit } from '@angular/core';
import { Member } from '../../models/member';
import { MemberService } from '../../components/member/service/member.service';

@Component({
  selector: 'app-member',
  templateUrl: './member.component.html',
  styleUrls: ['./member.component.scss']
})
export class MemberComponent implements OnInit {
  members: Member[] = [];
  selectedMember: Member | undefined;

  constructor( private memberService: MemberService) { }

  ngOnInit(): void {
    this.getMembers();
  }

  getMembers(): void {
    // Implementar método para buscar todos os membros, se necessário
  }

  addMember(member: Member): void {
    this.memberService.addMember(member).subscribe({
      next: (newMember: Member) => this.members.push(newMember),
      error: (err: any) => console.error('Error adding member:', err)
    });
  }

  updateMember(member: Member): void {
    this.memberService.updateMember(1,member).subscribe({
      next: (updatedMember: any) => {
        // Lógica para atualizar a lista de membros ou o estado do componente
      },
      error: (err: any) => console.error('Error updating member:', err)
    });
  }

  deleteMember(id: number): void {
    this.memberService.deleteMember(id).subscribe({
      next: () => {
        this.members = this.members.filter(member => member.id !== id);
      },
      error: (err: any) => console.error('Error deleting member:', err)
    });
  }
}
