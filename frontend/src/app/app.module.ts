import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { MsalModule, MsalService, MSAL_INSTANCE } from '@azure/msal-angular';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LandingComponent } from './landing/landing.component';
import { AccesoComponent } from './acceso/acceso.component';
import { DetallesComponent } from './detalles/detalles.component';
import { LoginComponent } from './login/login.component';
import { HeaderComponent } from './landing/header/header.component';
import { InteractionType, IPublicClientApplication, PublicClientApplication } from '@azure/msal-browser';

export function MSALInstanceFactory(): IPublicClientApplication {
  return new PublicClientApplication({
    auth: {
      clientId: 'a07f9448-badd-42dd-a172-070545dbe531',
      redirectUri: 'http://localhost:4200',
      authority: 'https://login.microsoftonline.com/33a93990-8bb4-4b9d-b422-4f8851217d7e'
    }
  })
}

@NgModule({
  declarations: [
    AppComponent,
    LandingComponent,
    AccesoComponent,
    DetallesComponent,
    LoginComponent,
    HeaderComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [
    MsalService,
    MsalModule,
    {
      provide: MSAL_INSTANCE,
      useFactory: MSALInstanceFactory}
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
