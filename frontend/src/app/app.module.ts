import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module'; // Certifique-se de que o arquivo de roteamento é nomeado corretamente
import { HomeComponent } from './components/home/home.component';
import { MemberComponent } from './components/member/member.component';
import {FormsModule} from "@angular/forms";
import {AgGridModule} from "ag-grid-angular";

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    MemberComponent
  ],
    imports: [
        BrowserModule,
        HttpClientModule,
        AppRoutingModule,
        FontAwesomeModule,
        FormsModule,
      AgGridModule,
    ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
