import { Component, OnInit, OnDestroy, ViewChild, AfterViewInit, ViewChildren } from '@angular/core';
import { NgForm, FormBuilder, FormGroup, Validators, FormGroupDirective } from '@angular/forms';
import { DataTableDirective } from 'angular-datatables';
// import { controls,ControlGroup} from 'angular/common';
import { StudentService } from '../../../services/student.service';
import { first } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { Student } from '../../../models/student';

@Component({
  selector: 'app-studentdetail',
  templateUrl: './studentdetail.component.html',
  styleUrls: ['./studentdetail.component.scss']
})
export class StudentdetailComponent implements OnInit, OnDestroy {

  // dtOptions: DataTables.Settings = {};
  // Must be declared as "any", not as "DataTables.Settings"
  dtOptions: any = {};
  // We use this trigger because fetching the list of persons can be quite long,
  // thus we ensure the data is fetched before rendering
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;

  usersList: any;
  userModal = new Student();
  isEditable: boolean;
  @ViewChildren('registerForm') myForm: NgForm;
  form: FormGroup;
  constructor(private stuService: StudentService) {
  }


  onReset() {
    this.userModal = new Student();
    this.myForm.reset(this.userModal);

  }
  ngOnInit() {

    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 3,
      // columns: [{ title: 'ID', data: 'studentId', visible: false },
      // { title: 'Name1', data: 'studentName', visible: true },
      // { title: 'Email', data: 'studentEmail', visible: true },
      // { title: 'Action', data: 'studentEmail', visible: true }],
      select: true
      //// Declare the use of the extension in the dom parameter
      //dom: 'Bfrtip',
      //// Configure the buttons
      // buttons: [
      //   'columnsToggle',
      //   'colvis',
      //   'copy',
      //   'print',
      //   'excel',
      // ]
    };
    this.getDatatable();
  }

  rerender(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      // Destroy the table first
      dtInstance.destroy();
      // Call the dtTrigger to rerender again
      // this.dtTrigger.next();
      this.getDatatable();
    });
  }
  editRow(row) {
    this.isEditable = true;
    this.userModal.studentId = row.studentId;
    this.userModal.studentName = row.studentName;
    this.userModal.studentEmail = row.studentEmail;
  }

  getDatatable() {
    this.stuService
      .getAllEmployees()
      .subscribe(resp => {
        this.usersList = resp.result;
        // Calling the DT trigger to manually render the table
        this.dtTrigger.next();
      });
  }

  ngOnDestroy(): void {
    // Do not forget to unsubscribe the event
    this.dtTrigger.unsubscribe();
  }

  onSubmit() {
    if (!this.isEditable) {
      this.stuService.add(this.userModal)
        // .pipe(first())
        .subscribe(
          () => {
            this.rerender();

          });
    }
    else {
      this.stuService.add(this.userModal)
        // .pipe(first())
        .subscribe(
          () => {
            this.rerender();

          });
    }
    this.onReset();
  }

}    
