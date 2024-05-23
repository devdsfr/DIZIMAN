import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {ViewMemberComponent} from "../components/members/view-member/view-member.component";
import {ViewOfferingComponent} from "../components/offerings/view-offering/view-offering.component";
import {AddMemberComponent} from "../components/members/add-member/add-member.component";
import {AddOfferingComponent} from "../components/offerings/add-offering/add-offering.component";

const routes: Routes = [
  { path: '', redirectTo: '/', pathMatch: 'full' },
  { path: 'view-member', component: ViewMemberComponent },
  { path: 'view-offering', component: ViewOfferingComponent },
  { path: 'add-member', component:  AddMemberComponent},
  { path: 'add-offering', component: AddOfferingComponent },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
