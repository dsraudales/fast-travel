import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RutasService {

  url = 'http://localhost:3000';

  constructor(private http:HttpClient) { }

  getRecorridos(id : number):Observable<any> {

    return this.http.get(this.url+`/api/recorridos/lista/${id}`);

  };

  getHistorial(id: number):Observable<any> {

    return this.http.get(this.url+`/api/registros/historial/${id}`);

  };

  getRecorridoDetalle(id: number):Observable<any> {

    return this.http.get(this.url+`/api/recorridos/recorrido/${id}`);
  };

  getAlumno(req_body : any):Observable<any> {

    return this.http.post(this.url+'/api/registros/alumno/', req_body);
  };

  getUbicaciones():Observable<any> {

    return this.http.get(this.url+`/api/recorridos/ubicaciones`);
  }

  setUbicacion(req_body : any):Observable<any> {

    return this.http.post(this.url+'/api/registros/actualizarUbicacion/', req_body);
  }
  nuevoRegistro(req_body : any):Observable<any> {

    return this.http.post(this.url+'/api/registros/nuevoregistro/', req_body);
  };

  comprobarRegistro(req_body : any):Observable<any> {

    return this.http.post(this.url+'/api/registros/comprobarregistro/', req_body);
  };
}
