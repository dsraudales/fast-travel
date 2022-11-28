import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-modal-ubicacion',
  templateUrl: './modal-ubicacion.component.html',
  styleUrls: ['./modal-ubicacion.component.css']
})
export class ModalUbicacionComponent {
  @Input() title = '';
  public show = false;

  showModal(){
    this.show = true;
  }

  hideModal(){
    this.show = false;
  }

  constructor() { }

}
