import { Component, OnInit } from '@angular/core';
import { Member } from '../../models/member';
import { MemberService } from './service/member.service';

@Component({
  selector: 'app-member',
  templateUrl: './member.component.html',
  styleUrls: ['./member.component.scss']
})
export class MemberComponent implements OnInit {

  // Dados
  members: Member[] = [];
  filteredMembers: Member[] = [];
  member: Member = new Member();

  // Estado UI
  activeTab: 'form' | 'lista' = 'lista';
  editingMember: Member | null = null;
  memberToDelete: Member | null = null;
  isLoading = false;
  isSaving = false;

  // Toast
  toast = { show: false, message: '', type: 'success' };

  // Busca e filtro
  searchTerm = '';
  filterPerfil = '';

  // Paginação
  currentPage = 1;
  pageSize = 8;
  totalPages = 1;

  // Ordenação
  sortColumn = 'name';
  sortDir: 'asc' | 'desc' = 'asc';

  // Dados auxiliares
  estados = [
    'AC','AL','AP','AM','BA','CE','DF','ES','GO',
    'MA','MT','MS','MG','PA','PB','PR','PE','PI',
    'RJ','RN','RS','RO','RR','SC','SP','SE','TO'
  ];

  avatarColors = [
    '#2563eb','#16a34a','#dc2626','#9333ea',
    '#ea580c','#0891b2','#65a30d','#d97706'
  ];

  constructor(private memberService: MemberService) {}

  ngOnInit(): void {
    this.loadMembers();
  }

  loadMembers(): void {
    this.isLoading = true;
    this.memberService.getAllMembers().subscribe({
      next: (res: any) => {
        this.members = res.content || [];
        this.applyFilter();
        this.isLoading = false;
      },
      error: () => {
        this.showToast('Erro ao carregar membros.', 'error');
        this.isLoading = false;
      }
    });
  }

  onSearch(): void {
    this.currentPage = 1;
    this.applyFilter();
  }

  applyFilter(): void {
    let result = [...this.members];
    const term = this.searchTerm.toLowerCase().trim();
    if (term) {
      result = result.filter(m =>
        m.name?.toLowerCase().includes(term) ||
        m.login?.toLowerCase().includes(term) ||
        m.city?.toLowerCase().includes(term)
      );
    }
    if (this.filterPerfil) {
      result = result.filter(m => m.profile === this.filterPerfil);
    }
    result = this.sortArray(result);
    this.filteredMembers = result;
    this.totalPages = Math.ceil(result.length / this.pageSize) || 1;
    if (this.currentPage > this.totalPages) this.currentPage = 1;
  }

  sortArray(arr: Member[]): Member[] {
    return arr.sort((a, b) => {
      const va = (a as any)[this.sortColumn] || '';
      const vb = (b as any)[this.sortColumn] || '';
      const cmp = va.toString().localeCompare(vb.toString(), 'pt-BR');
      return this.sortDir === 'asc' ? cmp : -cmp;
    });
  }

  sortBy(col: string): void {
    if (this.sortColumn === col) {
      this.sortDir = this.sortDir === 'asc' ? 'desc' : 'asc';
    } else {
      this.sortColumn = col;
      this.sortDir = 'asc';
    }
    this.applyFilter();
  }

  getSortIcon(col: string): string {
    if (this.sortColumn !== col) return 'bi-arrow-down-up text-muted opacity-50';
    return this.sortDir === 'asc' ? 'bi-sort-alpha-down text-primary' : 'bi-sort-alpha-up text-primary';
  }

  get paginatedMembers(): Member[] {
    const start = (this.currentPage - 1) * this.pageSize;
    return this.filteredMembers.slice(start, start + this.pageSize);
  }

  changePage(p: number): void {
    if (p < 1 || p > this.totalPages) return;
    this.currentPage = p;
  }

  getPages(): number[] {
    const pages: number[] = [];
    const start = Math.max(1, this.currentPage - 2);
    const end = Math.min(this.totalPages, start + 4);
    for (let i = start; i <= end; i++) pages.push(i);
    return pages;
  }

  min(a: number, b: number): number {
    return Math.min(a, b);
  }

  // Formulário
  abrirFormulario(): void {
    this.resetForm();
    this.activeTab = 'form';
  }

  onSubmit(): void {
    if (this.editingMember) {
      this.updateMember();
    } else {
      this.addMember();
    }
  }

  addMember(): void {
    this.isSaving = true;
    this.member.registrationDate = new Date().toISOString();
    this.memberService.addMember(this.member).subscribe({
      next: (novo: Member) => {
        this.members.push(novo);
        this.applyFilter();
        this.showToast('Membro salvo com sucesso!', 'success');
        this.resetForm();
        this.activeTab = 'lista';
        this.isSaving = false;
      },
      error: () => {
        this.showToast('Erro ao salvar o membro.', 'error');
        this.isSaving = false;
      }
    });
  }

  updateMember(): void {
    if (!this.editingMember) return;
    this.isSaving = true;
    this.memberService.updateMember(this.editingMember.id, this.member).subscribe({
      next: (updated: Member) => {
        const i = this.members.findIndex(m => m.id === updated.id);
        if (i !== -1) this.members[i] = updated;
        this.applyFilter();
        this.showToast('Membro atualizado com sucesso!', 'success');
        this.resetForm();
        this.activeTab = 'lista';
        this.isSaving = false;
      },
      error: () => {
        this.showToast('Erro ao atualizar o membro.', 'error');
        this.isSaving = false;
      }
    });
  }

  editMember(m: Member): void {
    this.editingMember = m;
    this.member = { ...m };
    if (this.member.birthDate) {
      this.member.birthDate = new Date(this.member.birthDate).toISOString().substring(0, 10);
    }
    this.activeTab = 'form';
  }

  confirmDelete(m: Member): void {
    this.memberToDelete = m;
  }

  cancelDelete(): void {
    this.memberToDelete = null;
  }

  deleteMemberConfirmed(): void {
    if (!this.memberToDelete) return;
    this.isSaving = true;
    this.memberService.deleteMember(this.memberToDelete.id).subscribe({
      next: () => {
        this.members = this.members.filter(m => m.id !== this.memberToDelete!.id);
        this.applyFilter();
        this.showToast('Membro excluído com sucesso!', 'success');
        this.memberToDelete = null;
        this.isSaving = false;
      },
      error: () => {
        this.showToast('Erro ao excluir o membro.', 'error');
        this.isSaving = false;
      }
    });
  }

  resetForm(): void {
    this.member = new Member();
    this.editingMember = null;
  }

  // CEP mask
  maskCep(event: Event): void {
    const input = event.target as HTMLInputElement;
    let v = input.value.replace(/\D/g, '');
    if (v.length > 5) v = v.slice(0, 5) + '-' + v.slice(5, 8);
    input.value = v;
    this.member.zipCode = v;
  }

  // Helpers visuais
  getInitials(name?: string): string {
    if (!name) return '?';
    const parts = name.trim().split(' ');
    if (parts.length === 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
  }

  getAvatarColor(name?: string): string {
    if (!name) return this.avatarColors[0];
    const idx = name.charCodeAt(0) % this.avatarColors.length;
    return this.avatarColors[idx];
  }

  getPerfilBadge(perfil?: string): string {
    const map: { [k: string]: string } = {
      'Pastor': 'bg-primary',
      'Presbitero': 'bg-info text-dark',
      'Diacono': 'bg-success',
      'Lider': 'bg-warning text-dark',
      'Membro': 'bg-secondary'
    };
    return map[perfil || ''] || 'bg-secondary';
  }

  showToast(message: string, type: 'success' | 'error'): void {
    this.toast = { show: true, message, type };
    setTimeout(() => this.toast.show = false, 3500);
  }
}
