import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Offering } from '../../../models/offering';
import { environment } from '../../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class OfferingService {

  private apiUrl = `${environment.apiUrl}/offering`;

  constructor(private http: HttpClient) { }

  addOffering(offering: Offering): Observable<Offering> {
    return this.http.post<Offering>(this.apiUrl, offering);
  }

  getAllOfferings(page: number = 0, size: number = 100): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}?page=${page}&size=${size}`);
  }

  getOfferingById(id: number): Observable<Offering> {
    return this.http.get<Offering>(`${this.apiUrl}/${id}`);
  }

  updateOffering(id: number | undefined, offering: Offering): Observable<Offering> {
    return this.http.put<Offering>(`${this.apiUrl}/${id}`, offering);
  }

  deleteOffering(id: number | undefined): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
