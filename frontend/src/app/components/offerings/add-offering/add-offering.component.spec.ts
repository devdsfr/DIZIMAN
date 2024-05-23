import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddOfferingComponent } from './add-offering.component';

describe('AddOfferingComponent', () => {
  let component: AddOfferingComponent;
  let fixture: ComponentFixture<AddOfferingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AddOfferingComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AddOfferingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
