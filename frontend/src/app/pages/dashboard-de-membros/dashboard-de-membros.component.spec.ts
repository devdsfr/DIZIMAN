import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardDeMembrosComponent } from './dashboard-de-membros.component';

describe('DashboardDeMembrosComponent', () => {
  let component: DashboardDeMembrosComponent;
  let fixture: ComponentFixture<DashboardDeMembrosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DashboardDeMembrosComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DashboardDeMembrosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
