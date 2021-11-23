import { TestBed } from '@angular/core/testing';

import { OwnerMasterService } from './owner-master.service';

describe('OwnerMasterService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: OwnerMasterService = TestBed.get(OwnerMasterService);
    expect(service).toBeTruthy();
  });
});
