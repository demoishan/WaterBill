import { TestBed } from '@angular/core/testing';

import { FinancialYearMasterService } from './financial-year-master.service';

describe('FinancialYearMasterService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: FinancialYearMasterService = TestBed.get(FinancialYearMasterService);
    expect(service).toBeTruthy();
  });
});
