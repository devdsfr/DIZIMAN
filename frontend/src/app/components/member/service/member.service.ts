import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../../../environments/environment';
import { Member } from '../../../models/member';

@Injectable({
  providedIn: 'root'
})
export class MemberService {

  private apiUrl = 'http://localhost:8080/api/members';

  constructor(private http: HttpClient) { }

  // Adicionar um novo membro
  addMember(member: Member): Observable<Member> {
    return this.http.post<Member>(`${this.apiUrl}/members`, member);
  }

  // Buscar um membro por ID
  getMemberById(id: number): Observable<Member> {
    return this.http.get<Member>(`${this.apiUrl}/members/${id}`);
  }

  // Atualizar um membro existente
  updateMember(id: number, member: Member): Observable<Member> {
    return this.http.put<Member>(`${this.apiUrl}/members/${id}`, member);
  }

  // Deletar um membro
  deleteMember(id: number | undefined): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/members/${id}`);
  }

  // Listar todos os membros
  getAllMembers(): Observable<Member[]> {
    //debugger
    return this.http.get<Member[]>(this.apiUrl);
  }
}
