import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {Member} from "../../components/models/member";
import {Offering} from "../../components/models/offering";
import {environment} from "../../../environments/environments";

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  private baseURL = environment.apiUrl;

  constructor(private http: HttpClient) { }

  addMember(member: Member): Observable<Member> {
    return this.http.post<Member>(`${this.baseURL}/members`, member);
  }

  getMemberById(id: number): Observable<Member> {
    return this.http.get<Member>(`${this.baseURL}/members/${id}`);
  }

  addOffering(offering: Offering): Observable<Offering> {
    return this.http.post<Offering>(`${this.baseURL}/offerings`, offering);
  }

  getOfferingById(id: number): Observable<Offering> {
    return this.http.get<Offering>(`${this.baseURL}/offerings/${id}`);
  }
}
