import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ToastrModule } from 'ngx-toastr';
import { AppComponent } from './app.component';
import { TelaInicialComponent } from './pages/tela-inicial/tela-inicial.component';
import { CadastroDizimoComponent } from './pages/cadastro-dizimo/cadastro-dizimo.component';
import { CadastroOfertaComponent } from './pages/cadastro-oferta/cadastro-oferta.component';
import {FormsModule} from "@angular/forms";
import {HttpClientModule} from "@angular/common/http";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {EmployeeService} from "./pages/shared/employee.service";
import { CadastroMembrosComponent } from './pages/cadastro-membros/cadastro-membros.component';

@NgModule({
  declarations: [
    AppComponent,
    TelaInicialComponent,
    CadastroDizimoComponent,
    CadastroOfertaComponent,
    CadastroMembrosComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot()
  ],
  exports: [
    ToastrModule
  ],
  providers: [EmployeeService],
  bootstrap: [AppComponent]
})
export class AppModule { }
