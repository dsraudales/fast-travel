import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { RutasService } from 'src/app/services/rutas.service';

@Component({
  selector: 'app-landing',
  templateUrl: './landing.component.html',
  styleUrls: ['./landing.component.css']
})
export class LandingComponent implements OnInit {
  
  ubicacion = new FormControl('');
  alumnoNombre = '';
  alumnoId = 0;
  ubicaciones = [
    {
      ubicacion:''
    }
  ]
  allRecorridos = [
    {
      nombreRuta: '',
      horaSalida: 0,
      idRecorrido: ''
    }
  ];

  constructor(
    private rutasService: RutasService,
    private _router : Router
    ) { }

  ngOnInit(): void {
    this.comprobarUsuario();
    this.getAlumno();
    this.getUbicaciones();
  }

  Detalles(id: string){
    this._router.navigate(['detalles/'+id]);
  }

  comprobarUsuario(){
    if(!localStorage.getItem('usuario')){
      this._router.navigate(['login']);
    }
  }

  getAlumno(){
    var data = {
      correo: localStorage.getItem("usuario")!.replace(/"/g,'')
    }
    this.rutasService.getAlumno(data).subscribe(data => {
      if (data) {
        this.alumnoId = data.alumno[0].idAlumno;
        this.ubicacion.setValue(data.alumno[0].ubicacion);
        console.log(data.mensaje);
        this.getRecorridos();
      }
      else {
        console.log(data.mensaje);
      }

    }, err => console.log(err));
  }

  getUbicaciones(){
    this.rutasService.getUbicaciones().subscribe(data => {
      if(data.exito){
        this.ubicaciones = data.ubicaciones;
        console.log(data.mensaje);
      }else{
        console.log(data.mensaje);
      }
    }, err => console.log(err));
  }

  cambiarUbicacion(){
    let datos = {
      id :this.alumnoId,
      ubicacion: this.ubicacion.value
    }
    //console.log(datos)
    this.rutasService.setUbicacion(datos).subscribe(data =>{
      console.log(data.mensaje);
      this.getRecorridos();
      
    }, err => console.log(err));
    this.closePopup();
  }

  getRecorridos(){
    this.rutasService.getRecorridos(this.alumnoId).subscribe(data => {

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
