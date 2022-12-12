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
    horaIngreso: '',
    idRegistro: '',
    precio: ''
  }
];

ngOnInit(): void {
  this.comprobarUsuario();
  this.getHistorial();
}

Detalles(id: string){
  this._router.navigate(['detalles/' + id]);
}

comprobarUsuario(){
  if (!localStorage.getItem('usuario')) {
    this._router.navigate(['login']);
  }else{
    this.alumnoId = localStorage.getItem('usuario')!;
  }
}

getHistorial(){
  this.rutasService.getHistorial(2001).subscribe(data => {

    if (data) {
      this.allRecorridos = data.historial;
      console.log(data.mensaje);
    }
    else {
      console.log(data.mensaje);
    }

  }, err => console.log(err));
}

}
