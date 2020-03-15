object frmCADASTRODIZIMO: TfrmCADASTRODIZIMO
  Left = 0
  Top = 0
  Caption = 'frmCADASTRODIZIMO'
  ClientHeight = 316
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 251
    Width = 341
    Height = 65
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 200
    ExplicitWidth = 490
    object btnSalvar: TButton
      Left = 70
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnFechar: TButton
      Left = 169
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 251
    Align = alClient
    TabOrder = 1
    ExplicitTop = 10
    ExplicitHeight = 200
    object gpNome: TGroupBox
      Left = 16
      Top = 0
      Width = 314
      Height = 49
      Caption = 'Nome do Dizimista'
      TabOrder = 0
      object edtNome: TEdit
        Left = 8
        Top = 16
        Width = 297
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 55
      Width = 165
      Height = 46
      Caption = 'Data de Oferta'
      TabOrder = 1
      object mksDataOferta: TMaskEdit
        Left = 11
        Top = 19
        Width = 144
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
    object GroupBox1: TGroupBox
      Left = 157
      Top = 103
      Width = 68
      Height = 46
      Caption = 'Valor'
      TabOrder = 2
      object mskValor: TMaskEdit
        Left = 8
        Top = 18
        Width = 53
        Height = 21
        TabOrder = 0
        Text = ''
      end
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 155
      Width = 314
      Height = 84
      Caption = 'Observa'#231#245'es'
      TabOrder = 3
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 103
      Width = 135
      Height = 46
      Caption = 'Telefone do Dizimista'
      TabOrder = 4
      object MaskEdit1: TMaskEdit
        Left = 11
        Top = 19
        Width = 116
        Height = 21
        EditMask = '!\(99\)000-0000;1;_'
        MaxLength = 12
        TabOrder = 0
        Text = '(  )   -    '
      end
    end
  end
  object Memo: TMemo
    Left = 27
    Top = 171
    Width = 294
    Height = 62
    Lines.Strings = (
      'Memo')
    TabOrder = 2
  end
  object RadioGroup1: TRadioGroup
    Left = 187
    Top = 55
    Width = 143
    Height = 46
    Caption = 'Tipo de Oferta'
    Columns = 2
    Items.Strings = (
      'Oferta'
      'D'#237'zimo')
    TabOrder = 3
  end
end
