import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-privacidade',
  templateUrl: './privacidade.component.html',
  styleUrls: ['./privacidade.component.css']
})
export class PrivacidadeComponent {
  activeTab: 'privacidade' | 'termos' | 'cookies' = 'privacidade';
  today = new Date();

  constructor(private router: Router) {}

  voltar(): void {
    this.router.navigate(['/login']);
  }
}
