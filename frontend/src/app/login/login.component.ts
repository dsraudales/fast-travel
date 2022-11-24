import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MsalService } from '@azure/msal-angular';
import { AuthenticationResult } from '@azure/msal-browser';
import { RutasService } from '../services/rutas.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  usuario = '';

  constructor(
    private mSalService: MsalService,
    private _router : Router,
    private rutasService: RutasService
    ) { }

  ngOnInit(): void {
    this.comprobarUsuario();
  }

  login(){
    this.mSalService.loginPopup().subscribe(
      (response: AuthenticationResult) => {
        this.usuario = response.account?.username!;
        this.getAlumno();
        //localStorage.setItem('usuario', JSON.stringify(response.account?.username));
        //this._router.navigate(['landing']);
      }
    );
  }

  getAlumno(){
    var data = {
      correo: this.usuario.replace(/"/g,'')
    }
    this.rutasService.getAlumno(data).subscribe(data => {
      if (data.encontrado) {
        console.log(data.mensaje);
        localStorage.setItem('usuario', JSON.stringify(this.usuario));
        this._router.navigate(['landing']);
      }
      else {
        console.log(data.mensaje);
        alert(data.mensaje);
      }

    }, err => console.log(err));
  }

  comprobarUsuario(){
    if(localStorage.getItem('usuario')){
      this._router.navigate(['landing']);
    }else{
      
    }
  }

}
