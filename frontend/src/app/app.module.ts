// src/app/app.module.ts
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app.routes';  // Ajuste o nome se necessário
import { HomeComponent } from './components/home/home.component';

@NgModule({
  declarations: [
    HomeComponent,
    // outros componentes registrados aqui
  ],
  imports: [
    AppComponent,
    BrowserModule,
    AppRoutingModule ,
    FontAwesomeModule // Certifique-se de que as rotas estão sendo importadas
  ],
  providers: [],
  bootstrap: [HomeComponent]
})
export class AppModule { }
