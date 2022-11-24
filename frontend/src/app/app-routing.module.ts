import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { LandingComponent } from './landing/landing.component';
import { AccesoComponent } from './acceso/acceso.component';
import { DetallesComponent } from './detalles/detalles.component';
import { LoginComponent } from './login/login.component';
import { HeaderComponent } from './landing/header/header.component';


const routes: Routes = [

  { path: '', component: LandingComponent },
  { path: 'acceso', component: AccesoComponent },
  { path: 'detalles/:id', component: DetallesComponent },
  { path: 'login', component: LoginComponent },
  { path: 'header', component: HeaderComponent},
  { path: '**', component: LandingComponent },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
