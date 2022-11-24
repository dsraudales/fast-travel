import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { RutasService } from 'src/app/services/rutas.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  alumnoNombre = '';

  constructor(
    private rutasService : RutasService,
    private _router : Router) { }

  ngOnInit(): void {
    this.getAlumno();
  }

  logout(){
    localStorage.clear();
    this._router.navigate(['login']);
  }

  getAlumno(){
    var data = {
      correo: localStorage.getItem("usuario")!.replace(/"/g,'')
    }
    this.rutasService.getAlumno(data).subscribe(data => {
      if (data) {
        this.alumnoNombre = data.alumno[0].nombre;
        console.log(data.mensaje);
      }
      else {
        console.log(data.mensaje);
      }

    }, err => console.log(err));
  }

}
