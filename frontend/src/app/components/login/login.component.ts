import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  username = '';
  password = '';
  showPassword = false;
  error = '';
  loading = false;
  year = new Date().getFullYear();

  constructor(private auth: AuthService, private router: Router) {
    if (this.auth.isLoggedIn()) this.router.navigate(['/']);
  }

  onSubmit(): void {
    if (!this.username || !this.password) {
      this.error = 'Preencha usuário e senha.';
      return;
    }
    this.loading = true;
    this.error = '';

    this.auth.login(this.username.trim().toLowerCase(), this.password).subscribe({
      next: () => this.router.navigate(['/']),
      error: (err) => {
        this.error = err.status === 401
          ? 'Usuário ou senha incorretos.'
          : 'Não foi possível conectar ao servidor. Tente novamente.';
        this.loading = false;
      }
    });
  }
}
