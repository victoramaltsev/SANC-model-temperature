object fMeasure: TfMeasure
  Left = 8
  Top = 12
  Width = 445
  Height = 236
  BorderStyle = bsSizeToolWin
  Caption = 'Measuring and curve fit Module'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = -1
    Width = 433
    Height = 146
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button13: TButton
    Left = 2
    Top = 149
    Width = 109
    Height = 20
    Caption = 'Save to c:\cursors.txt'
    TabOrder = 1
    OnClick = Button13Click
  end
  object CheckBox2: TCheckBox
    Left = 256
    Top = 150
    Width = 49
    Height = 17
    Caption = 'x2 - x1'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object Button17: TButton
    Left = 114
    Top = 149
    Width = 38
    Height = 20
    Caption = 'Clear'
    TabOrder = 3
    OnClick = Button17Click
  end
  object Button14: TButton
    Left = 156
    Top = 149
    Width = 94
    Height = 20
    Caption = 'Copy to clipboard'
    TabOrder = 4
    OnClick = Button14Click
  end
  object CheckBox3: TCheckBox
    Left = 308
    Top = 150
    Width = 46
    Height = 17
    Caption = 'x1,x2'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object CheckBox4: TCheckBox
    Left = 357
    Top = 150
    Width = 47
    Height = 17
    Caption = 'y1-y3'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 176
    Width = 129
    Height = 17
    Caption = '# points for fit curve ='
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 136
    Top = 173
    Width = 65
    Height = 21
    TabOrder = 8
    Text = '200'
  end
end
