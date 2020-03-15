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
    object gpCPF: TGroupBox
      Left = 16
      Top = 55
      Width = 165
      Height = 46
      Caption = 'CPF do Dizimista'
      TabOrder = 0
      object edtCPF: TMaskEdit
        Left = 11
        Top = 17
        Width = 145
        Height = 21
        TabOrder = 0
        Text = ''
      end
    end
    object gpNome: TGroupBox
      Left = 16
      Top = 0
      Width = 314
      Height = 49
      Caption = 'Nome do Dizimista'
      TabOrder = 1
      object edtNome: TEdit
        Left = 8
        Top = 16
        Width = 295
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 107
      Width = 165
      Height = 50
      Caption = 'Data de Oferta'
      TabOrder = 2
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
      Left = 189
      Top = 107
      Width = 68
      Height = 50
      Caption = 'Valor'
      TabOrder = 3
      object mskValor: TMaskEdit
        Left = 3
        Top = 22
        Width = 53
        Height = 21
        EditMask = '!,;1;_'
        MaxLength = 1
        TabOrder = 0
        Text = ','
      end
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 163
      Width = 314
      Height = 82
      Caption = 'GroupBox1'
      TabOrder = 4
    end
  end
  object Memo1: TMemo
    Left = 27
    Top = 180
    Width = 294
    Height = 62
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object RadioGroup1: TRadioGroup
    Left = 187
    Top = 55
    Width = 86
    Height = 46
    Caption = 'Tipo de Oferta'
    Items.Strings = (
      'Oferta'
      'D'#237'zimo')
    TabOrder = 3
  end
end
