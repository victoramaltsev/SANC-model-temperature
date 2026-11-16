object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 
    '2009 Maltsev-Lakatta model of SA node cell with temperature depe' +
    'ndence, v2026-11-16'
  ClientHeight = 793
  ClientWidth = 1918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 144
  TextHeight = 25
  object Label4: TLabel
    Left = 659
    Top = 21
    Width = 260
    Height = 25
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Statistics and Data for Each Cycle'
  end
  object Label5: TLabel
    Left = 971
    Top = 21
    Width = 421
    Height = 25
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Output: gCaL, Hz, Mean, jupMin0, jupMax0, meanToC'
  end
  object Input: TLabel
    Left = 340
    Top = 98
    Width = 229
    Height = 25
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Input (you can edit numbers)'
  end
  object Label1: TLabel
    Left = 11
    Top = 151
    Width = 107
    Height = 25
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Components'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 175
    Top = 167
    Width = 34
    Height = 25
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Q10'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 169
    Width = 155
    Height = 25
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'used in simulation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 10
    Top = 10
    Width = 308
    Height = 43
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Do one custom set of Q10'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 482
    Top = 16
    Width = 142
    Height = 38
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Show plot form'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo2: TMemo
    Left = 340
    Top = 128
    Width = 301
    Height = 271
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Lines.Strings = (
      'Duration_ms = 15000'
      'CL_Analysis_start_ms = 10000'
      'OutputSampling_ms = 1'
      ''
      '// temperature range'
      'T_Delta = 0.7'
      ''
      '// Initial jmin and jup values'
      'jupMin0 = 0.0023495'
      'jupMax0 = 0.0051748')
    TabOrder = 2
  end
  object Memo4: TMemo
    Left = 651
    Top = 56
    Width = 358
    Height = 727
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Memo3: TMemo
    Left = 1019
    Top = 56
    Width = 902
    Height = 727
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 377
    Top = 421
    Width = 238
    Height = 228
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'gCaL sensitivity analysis'
    Color = clAqua
    ParentBackground = False
    ParentColor = False
    TabOrder = 5
    object Label6: TLabel
      Left = 6
      Top = 91
      Width = 81
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'gCaL_start'
    end
    object Label7: TLabel
      Left = 6
      Top = 133
      Width = 76
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'gCaL_end'
    end
    object Label8: TLabel
      Left = 6
      Top = 174
      Width = 85
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'gCaL_delta'
    end
    object Button3: TButton
      Left = 103
      Top = 38
      Width = 122
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Do analysis'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Edit12: TEdit
      Left = 103
      Top = 86
      Width = 122
      Height = 33
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      Text = '0.24'
    end
    object Edit13: TEdit
      Left = 103
      Top = 129
      Width = 122
      Height = 33
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 2
      Text = '0.52'
    end
    object Edit14: TEdit
      Left = 103
      Top = 172
      Width = 122
      Height = 33
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 3
      Text = '0.01'
    end
  end
  object Button4: TButton
    Left = 1591
    Top = 10
    Width = 121
    Height = 36
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Clean Memo'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 10
    Top = 58
    Width = 308
    Height = 38
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Simulate cumulative Q10 effects'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 10
    Top = 102
    Width = 308
    Height = 38
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Simulate Q10 effects in separation'
    TabOrder = 8
    OnClick = Button6Click
  end
  object CheckListBox1: TCheckListBox
    Left = 10
    Top = 197
    Width = 157
    Height = 242
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ItemHeight = 25
    Items.Strings = (
      'ICaL (gCaL)--------'
      'SERCA (Pup)-------'
      'NCX (kNCX)--------'
      'I_f (gh)------------'
      'gKr ----------------'
      'IKr_act -----------'
      'IKr_deact --------'
      'IKr_inact --------'
      'IKr_recov --------')
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 171
    Top = 198
    Width = 102
    Height = 242
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Lines.Strings = (
      '4.57'
      '3.13'
      '1.7'
      '2.15'
      '1.4'
      '2.1'
      '1.7'
      '2.5'
      '2.6')
    TabOrder = 10
  end
  object CheckBox12: TCheckBox
    Left = 16
    Top = 514
    Width = 161
    Height = 38
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'SET Pup (mM/s)'
    TabOrder = 11
  end
  object Edit15: TEdit
    Left = 196
    Top = 513
    Width = 122
    Height = 33
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 12
    Text = '12'
  end
  object Button7: TButton
    Left = 10
    Top = 444
    Width = 87
    Height = 37
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Check all'
    TabOrder = 13
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 107
    Top = 445
    Width = 110
    Height = 36
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Uncheck all'
    TabOrder = 14
    OnClick = Button8Click
  end
  object Edit1: TEdit
    Left = 377
    Top = 707
    Width = 124
    Height = 33
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 15
    Text = '0.42'
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 554
    Width = 170
    Height = 38
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'SET gCaL (nS/pF)'
    TabOrder = 16
  end
  object Edit2: TEdit
    Left = 196
    Top = 556
    Width = 122
    Height = 33
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 17
    Text = '0.464'
  end
  object Button9: TButton
    Left = 1722
    Top = 10
    Width = 163
    Height = 36
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Copy to clipboard'
    TabOrder = 18
    OnClick = Button9Click
  end
  object RadioGroup1: TRadioGroup
    Left = 10
    Top = 602
    Width = 357
    Height = 139
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = #916'T'
    Color = clGradientActiveCaption
    ItemIndex = 0
    Items.Strings = (
      'Dynamic, linked to jup(t)'
      'Const = mean at dynamic steady-state'
      'Const = fixed at ============> ')
    ParentBackground = False
    ParentColor = False
    TabOrder = 19
  end
  object CheckBox1: TCheckBox
    Left = 341
    Top = 21
    Width = 134
    Height = 42
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'create plots'
    TabOrder = 20
  end
  object CheckBox3: TCheckBox
    Left = 341
    Top = 53
    Width = 175
    Height = 31
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Show each cycle'
    TabOrder = 21
  end
end
