import { TestBed } from '@angular/core/testing';

import { GroupMasterService } from './group-master.service';

describe('GroupMasterServiceService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: GroupMasterService = TestBed.get(GroupMasterService);
    expect(service).toBeTruthy();
  });
});
