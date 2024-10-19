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

  constructor(private memberService: MemberService) { }

  ngOnInit(): void {
    this.getMembers();
    this.setTodayDate();
  }

  getMembers(): void {
    this.memberService.getAllMembers().subscribe({
      next: (response: any) => {
        console.log('Fetched members:', response);
        this.members = response.content; // Ajuste conforme a estrutura da resposta
      },
      error: (err: any) => console.error('Error fetching members:', err)
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
    this.memberService.addMember(this.member).subscribe({
      next: (newMember: Member) => {
        this.members.push(newMember);
        this.resetForm();
      },
      error: (err: any) => console.error('Error adding member:', err)
    });
  }

  setTodayDate(): void {
    const today = new Date().toISOString();
    this.member.registrationDate = today;
  }

  updateMember(): void {
    if (this.selectedMember) {
      this.memberService.updateMember(this.selectedMember.id, this.member).subscribe({
        next: (updatedMember: Member) => {
          const index = this.members.findIndex(m => m.id === updatedMember.id);
          if (index !== -1) {
            this.members[index] = updatedMember;
          }
          this.resetForm();
        },
        error: (err: any) => console.error('Error updating member:', err)
      });
    }
  }

  deleteMember(id: number | undefined): void {
    this.memberService.deleteMember(id).subscribe({
      next: () => {
        this.members = this.members.filter(member => member.id !== id);
      },
      error: (err: any) => console.error('Error deleting member:', err)
    });
  }

  editMember(member: Member): void {
    this.selectedMember = member;
    this.member = { ...member };
  }

  resetForm(): void {
    this.member = new Member();
    this.selectedMember = null;
  }
}
