import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { MemberComponent } from './components/member/member.component';
import { TitheComponent } from './components/tithe/tithe.component';
import { OfferingComponent } from './components/offering/offering.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'members', component: MemberComponent },
  { path: 'tithe-registration', component: TitheComponent },
  { path: 'offering-registration', component: OfferingComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
