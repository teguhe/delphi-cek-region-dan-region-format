object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object btCek: TButton
    Left = 8
    Top = 16
    Width = 417
    Height = 25
    Caption = 'btCek'
    TabOrder = 0
    OnClick = btCekClick
  end
  object mmoStatus: TMemo
    Left = 8
    Top = 47
    Width = 417
    Height = 90
    Lines.Strings = (
      'mmoStatus')
    TabOrder = 1
  end
end
