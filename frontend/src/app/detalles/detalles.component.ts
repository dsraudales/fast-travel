import { Component, OnInit } from '@angular/core';
import { RutasService } from 'src/app/services/rutas.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-detalles',
  templateUrl: './detalles.component.html',
  styleUrls: ['./detalles.component.css']
})
export class DetallesComponent implements OnInit {

  id = 0;
  recorrido = {
    idRecorrido: '',
    horaEntrada: '',
    horaSalida: '',
    precio: '',
    nombreRuta: '',
    nombre: ''
  }
  alumnoNombre = '';
  alumnoId = '';

  constructor(
    private route: ActivatedRoute,
    private rutasService: RutasService,
    private _router : Router) { }

  ngOnInit(): void {
    this.comprobarUsuario();
    this.getIdRecorrido();
  }

  getIdRecorrido(){
    this.id = +this.route.snapshot.paramMap.get('id')!;
    this.getDetalles(this.id);
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

  getDetalles(id: number){
    this.rutasService.getRecorridoDetalle(id).subscribe(
      (data) => {
        if (data) {
          this.recorrido = data.recorrido[0];
          console.log(data.mensaje);
        } else {
          console.log(data.mensaje);
        }
      },
      (err) => console.log(err)
    );
  }

}
