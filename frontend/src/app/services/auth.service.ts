import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';
import { environment } from '../../environments/environment';

export interface User {
  username: string;
  name: string;
  role: string;
}

interface AuthResponse {
  token: string;
  username: string;
  name: string;
  role: string;
}

const USER_KEY  = 'diziman_user';
const TOKEN_KEY = 'diziman_token';

@Injectable({ providedIn: 'root' })
export class AuthService {

  constructor(private http: HttpClient) {}

  login(username: string, password: string): Observable<void> {
    return this.http
      .post<AuthResponse>(`${environment.apiUrl}/auth/login`, { username, password })
      .pipe(
        tap(res => {
          localStorage.setItem(TOKEN_KEY, res.token);
          localStorage.setItem(USER_KEY, JSON.stringify({
            username: res.username,
            name: res.name,
            role: res.role
          }));
        }),
        // Transforma AuthResponse → void para o componente não precisar saber do tipo
        tap(() => {})
      ) as unknown as Observable<void>;
  }

  logout(): void {
    localStorage.removeItem(TOKEN_KEY);
    localStorage.removeItem(USER_KEY);