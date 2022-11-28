import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { RutasService } from 'src/app/services/rutas.service';

@Component({
  selector: 'app-historial',
  templateUrl: './historial.component.html',
  styleUrls: ['./historial.component.css']
})
export class HistorialComponent implements OnInit {

  constructor( private rutasService: RutasService,
    private _router : Router){ }

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
  this._router.navigate(['detalles/' + id]);
}

comprobarUsuario(){
  if (!localStorage.getItem('usuario')) {
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

}
