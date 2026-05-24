import { Injectable } from '@angular/core';

export interface User {
  username: string;
  name: string;
  role: string;
}

// Credenciais da aplicação — altere conforme necessário
const USERS = [
  { username: 'admin',  password: 'diziman2024', name: 'Administrador', role: 'admin' },
  { username: 'pastor', password: 'igreja2024',  name: 'Pastor',         role: 'user'  },
  { username: 'lider',  password: 'lider2024',   name: 'Líder',          role: 'user'  },
];

const STORAGE_KEY = 'diziman_user';

@Injectable({ providedIn: 'root' })
export class AuthService {

  login(username: string, password: string): boolean {
    const found = USERS.find(
      u => u.username === username.trim().toLowerCase() && u.password === password
    );
    if (found) {
      const user: User = { username: found.username, name: found.name, role: found.role };
      localStorage.setItem(STORAGE_KEY, JSON.stringify(user));
      return true;
    }
    return false;
  }

  logout(): void {
    localStorage.removeItem(STORAGE_KEY);
  }

  isLoggedIn(): boolean {
    return !!localStorage.getItem(STORAGE_KEY);
  }

  getUser(): User | null {
    const raw = localStorage.getItem(STORAGE_KEY);
    return raw ? JSON.parse(raw) : null;
  }
}
