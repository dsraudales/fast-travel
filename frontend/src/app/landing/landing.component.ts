import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { RutasService } from 'src/app/services/rutas.service';

@Component({
  selector: 'app-landing',
  templateUrl: './landing.component.html',
  styleUrls: ['./landing.component.css']
})
export class LandingComponent implements OnInit {

  constructor(
    private rutasService: RutasService,
    private _router : Router
    ) { }

  alumnoNombre = '';
  alumnoId = '';
  allRecorridos = [
    {
      nombreRuta: '',
      horaSalida: 0,
      idRecorrido: ''
    }
  ];

  ngOnInit(): void {
    this.comprobarUsuario();
    this.getRecorridos();
  }

  Detalles(id: string){
    this._router.navigate(['detalles/'+id]);
  }

  comprobarUsuario(){
    if(!localStorage.getItem('usuario')){
      this._router.navigate(['login']);
    }
  }

  getRecorridos(){
    this.rutasService.getRecorridos().subscribe(data => {

      if (data) {
        this.allRecorridos = data.recorridos;
        console.log(data.mensaje);
      }
      else {
        console.log(data.mensaje);
      }

    }, err => console.log(err));
  }
  
  displayStyle = "none";

  openPopup() {
    this.displayStyle = "block";
  }
  closePopup() {
    this.displayStyle = "none";
  }

}
