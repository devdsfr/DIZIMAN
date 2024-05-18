import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {MenuInicialComponent} from "../pages/menu-inicial/menu-inicial.component";
import {RegistroDoDizimoComponent} from "../pages/registro-do-dizimo/registro-do-dizimo.component";
import {CadastroDeMembroComponent} from "../pages/cadastro-de-membro/cadastro-de-membro.component";
import {RegistroDaOfertaComponent} from "../pages/registro-da-oferta/registro-da-oferta.component";
import {DashboardDeMembrosComponent} from "../pages/dashboard-de-membros/dashboard-de-membros.component";
import {DashboardsFinanceirosComponent} from "../pages/dashboards-financeiros/dashboards-financeiros.component";

const routes: Routes = [
  { path: '', component: MenuInicialComponent },
  { path: 'cadastro-de-membro', component: CadastroDeMembroComponent },
  { path: 'registro-do-dizimo', component: RegistroDoDizimoComponent },
  { path: 'registro-da-oferta', component: RegistroDaOfertaComponent },
  { path: 'dashboard-de-membros', component: DashboardDeMembrosComponent },
  { path: 'dashboards-financeiros', component: DashboardsFinanceirosComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
