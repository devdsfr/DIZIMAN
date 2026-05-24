import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Tithe } from '../../../models/tithe';
import { environment } from '../../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class TitheService {

  private apiUrl = `${environment.apiUrl}/tithe`;

  constructor(private http: HttpClient) { }

  addTithe(tithe: Tithe): Observable<Tithe> {
    return this.http.post<Tithe>(this.apiUrl, tithe);
  }

  getAllTithes(page: number = 0, size: number = 100): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}?page=${page}&size=${size}`);
  }

  getTitheById(id: number): Observable<Tithe> {
    return this.http.get<Tithe>(`${this.apiUrl}/${id}`);
  }

  updateTithe(id: number | undefined, tithe: Tithe): Observable<Tithe> {
    return this.http.put<Tithe>(`${this.apiUrl}/${id}`, tithe);
  }

  deleteTithe(id: number | undefined): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
