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
      const va = 