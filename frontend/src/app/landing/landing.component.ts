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
      horaEntrada: '',
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
    if(localStorage.getItem('usuario')){
      this.getAlumno();
    }else{
      this._router.navigate(['login']);
    }
  }

  getAlumno(){
    var data = {
      correo: localStorage.getItem("usuario")!.replace(/"/g,'')
    }
    this.rutasService.getAlumno(data).subscribe(data => {
      if (data) {
        this.alumnoNombre = data.alumno[0].nombre;
        this.alumnoId = data.alumno[0].idAlumno;
        console.log(data.mensaje);
      }
      else {
        console.log(data.mensaje);
      }

    }, err => console.log(err));
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

}
