import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { MemberComponent } from './components/member/member.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'members', component: MemberComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
