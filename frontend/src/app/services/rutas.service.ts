import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RutasService {

  url = 'http://localhost:3000';

  constructor(private http:HttpClient) { }

  getRecorridos():Observable<any> {

    return this.http.get(this.url+'/api/recorridos/');

  };

  getRecorridoDetalle(id: number):Observable<any> {

    return this.http.get(this.url+`/api/recorridos/recorrido/${id}`);
  };

  getAlumno(req_body : any):Observable<any> {

    return this.http.post(this.url+'/api/registros/alumno/', req_body);
  };
}
