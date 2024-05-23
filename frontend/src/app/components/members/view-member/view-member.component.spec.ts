import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewMemberComponent } from './view-member.component';

describe('ViewMemberComponent', () => {
  let component: ViewMemberComponent;
  let fixture: ComponentFixture<ViewMemberComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ViewMemberComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ViewMemberComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
