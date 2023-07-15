import { Component } from '@angular/core';
import {NgForm} from "@angular/forms";
import {Employee} from "../shared/employee.model";
import {EmployeeService} from "../shared/employee.service";

@Component({
  selector: 'app-cadastro-membros',
  templateUrl: './cadastro-membros.component.html',
  styleUrls: ['./cadastro-membros.component.css']
})
export class CadastroMembrosComponent {
  private toastr: any;

  constructor(public service : EmployeeService){}

  ngOnInit(){
    this.resetForm();
  }

  resetForm(form? : NgForm){
    if(form != null)
      form.resetForm();
    this.service.formData = {
      EmployeeID : 1,
      FullName : '',
      EMPCode : '',
      Mobile : '',
      Position : ''
    }
  }

  onSubmit(form: NgForm) {
    if (form.value.EmployeeID == 1)
      this.insertRecord(form);
    else
      this.updateRecord(form);
  }

  insertRecord(form: NgForm) {
    this.service.postEmployee(form.value).subscribe(res => {
      this.toastr.success('Inserted successfully', 'EMP. Register');
      this.resetForm(form);
      this.service.refreshList();
    });
  }

  updateRecord(form: NgForm) {
    this.service.putEmployee(form.value).subscribe(res => {
      this.toastr.info('Updated successfully', 'EMP. Register');
      this.resetForm(form);
      this.service.refreshList();
    });

  }

  editRecord(emp: Employee) {
    this.service.formData = Object.assign({}, emp);
  }

  deleteRecord(id: number) {
    if (confirm('Are you sure to delete this record?')) {
      this.service.deleteEmployee(id).subscribe(res => {
        this.toastr.warning('Deleted successfully', 'EMP. Register');
        this.service.refreshList();
      });
    }
  }
}
