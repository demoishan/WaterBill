import { TestBed } from '@angular/core/testing';

import { MaintenanceMasterService } from './maintenance-master.service';

describe('MaintenanceMasterService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: MaintenanceMasterService = TestBed.get(MaintenanceMasterService);
    expect(service).toBeTruthy();
  });
});
