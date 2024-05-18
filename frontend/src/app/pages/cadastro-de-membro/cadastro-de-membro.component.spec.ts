import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroDeMembroComponent } from './cadastro-de-membro.component';

describe('CadastroDeMembroComponent', () => {
  let component: CadastroDeMembroComponent;
  let fixture: ComponentFixture<CadastroDeMembroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CadastroDeMembroComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CadastroDeMembroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
