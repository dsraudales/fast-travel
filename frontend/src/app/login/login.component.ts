import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MsalService } from '@azure/msal-angular';
import { AuthenticationResult } from '@azure/msal-browser';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(
    private mSalService: MsalService,
    private _router : Router
    ) { }

  ngOnInit(): void {
    this.comprobarUsuario();
  }

  login(){
    this.mSalService.loginPopup().subscribe(
      (response: AuthenticationResult) => {
        localStorage.setItem('usuario', JSON.stringify(response.account?.username));
        this._router.navigate(['landing']);
      }
    );
  }

  comprobarUsuario(){
    if(localStorage.getItem('usuario')){
      this._router.navigate(['landing']);
    }else{
      
    }
  }

}
