import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroDizimoComponent } from './cadastro-dizimo.component';

describe('CadastroDizimoComponent', () => {
  let component: CadastroDizimoComponent;
  let fixture: ComponentFixture<CadastroDizimoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CadastroDizimoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroDizimoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
