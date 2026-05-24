import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { Member } from '../../../models/member';
import { environment } from '../../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class MemberService {

  private apiUrl = `${environment.apiUrl}/members`;

  constructor(private http: HttpClient) { }

  addMember(member: Member): Observable<Member> {
    return this.http.post<Member>(this.apiUrl, this.transformDatesToServer(member), {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    }).pipe(
      map(member => (member))
    );
  }

  getMemberById(id: number): Observable<Member> {
    return this.http.get<Member>(`${this.apiUrl}/${id}`);
  }

  updateMember(id: number | undefined, member: Member): Observable<Member> {
    return this.http.put<Member>(`${this.apiUrl}/${id}`, member);
  }

  deleteMember(id: number | undefined): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

  getAllMembers(): Observable<Member[]> {
    return this.http.get<Member[]>(this.apiUrl);
  }

  private transformDatesToServer(member: Member): Member {
    return {
      ...member,
      birthDate: member.birthDate ? new Date(member.birthDate).toISOString() : undefined,
      registrationDate: member.registrationDate ? new Date(member.registrationDate).to