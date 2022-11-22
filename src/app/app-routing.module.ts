import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccesoComponent } from './acceso/acceso.component';
import { AppComponent } from './app.component';
import { DetallesComponent } from './detalles/detalles.component';
import { LoginComponent } from './login/login.component';

const routes: Routes = [

  { path: '', component: AppComponent },
  { path: 'acceso', component: AccesoComponent },
  { path: 'detalles', component: DetallesComponent },
  { path: 'login', component: LoginComponent },


  { path: '**', redirectTo: '', pathMatch: 'full' },

  { path: '', component: AppComponent },
  { path: 'acceso', component: AccesoComponent },
  { path: 'detalles', component: DetallesComponent },
  { path: 'login', component: LoginComponent },

  { path: '**', redirectTo: '', pathMatch: 'full' }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
