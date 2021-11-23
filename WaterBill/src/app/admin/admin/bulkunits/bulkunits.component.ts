import { Component, OnInit, OnDestroy, ViewChild } from '@angular/core';
import { BilltransactionService } from '../../../services/billtransaction.service';
import { DataTableDirective } from 'angular-datatables';
import { ExcelFiles } from '../../../models/excelFiles';
import { AuthService } from '../../../services/auth.service';
import { Title } from '@angular/platform-browser';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';

import { saveAs } from 'file-saver';


import { environment } from '../../../../environments/environment';
import { FileUploader, FileSelectDirective } from 'ng2-file-upload';

const URL = `${environment.apiUrl}`
const UploadURL = `${URL}/api/BillTransaction/upload`;


@Component({
  selector: 'app-bulkunits',
  templateUrl: './bulkunits.component.html',
  styleUrls: ['./bulkunits.component.scss']
})
export class BulkunitsComponent implements OnInit, OnDestroy {

  dtOptions: any = {};
  dtTrigger: Subject<any> = new Subject();
  public uploader: FileUploader = new FileUploader({ url: UploadURL, itemAlias: 'photo' });
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;

  detailList: any;
  dataModal = new ExcelFiles();
  @ViewChild('myFileInput', { static: false }) myFileInput;

  constructor(private billtransactionService: BilltransactionService,
    private toastr: ToastrService, private router: Router,
    private title:Title, private authService: AuthService) { }

  ngOnInit() {

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if (UserOnly) {
      this.router.navigate(['/admin/404']);
    }

    this.uploader.onAfterAddingFile = (file) => {
      file.withCredentials = false;
    };
    this.uploader.onCompleteItem = (item: any, response: any, status: any, headers: any) => {
      this.myFileInput.nativeElement.value = '';
      this.toastr.success('File Uploaded sucessfully,please wait for 10 min to finish job');
    };

    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 10,
      select: true
    };

    this.getDatatable();
    this.title.setTitle("Add Unit in Bulk");
  }

  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }

  downloadRow(row) {
    var url = this.billtransactionService.downloadFile(row.downloadURL);
    saveAs(url);
  }

  getDatatable() {
    this.billtransactionService
      .getExcelFilesDetail()
      .subscribe(resp => {
        this.detailList = resp.result;
        this.dtTrigger.next();
      });
  }
}
