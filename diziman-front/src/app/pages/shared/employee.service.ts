import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Employee } from './employee.model';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  formData!  : { Position: string; FullName: string; EmployeeID: number; Mobile: string; EMPCode: string };
  list!: Employee[];
  readonly rootURL ="http://localhost:56599/api"

  constructor(private http : HttpClient) { }

  postEmployee(formData : Employee){
    return this.http.post(this.rootURL+'/Employee', formData);
  }

  refreshList(){
    this.http.get(this.rootURL+'/Employee')
    .toPromise().then(res => this.list = res as Employee[]);
  }

  putEmployee(formData : Employee){
    return this.http.put(this.rootURL+'/Employee/'+formData.EmployeeID,formData);

   }

   deleteEmployee(id : number){
    return this.http.delete(this.rootURL+'/Employee/'+id);
   }
}
