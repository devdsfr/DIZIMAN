import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { Member } from '../../../models/member';

@Injectable({
  providedIn: 'root'
})
export class MemberService {

  private apiUrl = 'http://localhost:8080/api/members';

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
    return this.http.get<Member>(`${this.apiUrl}/members/${id}`);
  }

  updateMember(id: number | undefined, member: Member): Observable<Member> {
    return this.http.put<Member>(`${this.apiUrl}/members/${id}`, member);
  }

  deleteMember(id: number | undefined): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/members/${id}`);
  }

  getAllMembers(): Observable<Member[]> {
    return this.http.get<Member[]>(this.apiUrl);
  }

  private transformDatesToServer(member: Member): Member {
    return {
      ...member,
      birthDate: member.birthDate ? new Date(member.birthDate).toISOString() : undefined,
      registrationDate: member.registrationDate ? new Date(member.registrationDate).toISOString() : undefined
    };
  }
}
