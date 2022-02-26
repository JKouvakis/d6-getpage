object Form1: TForm1
  Left = 211
  Top = 5
  Width = 693
  Height = 375
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 12
    Width = 36
    Height = 13
    Caption = 'Cookie:'
  end
  object Label3: TLabel
    Left = 4
    Top = 32
    Width = 74
    Height = 13
    Caption = 'PHPSession Id:'
  end
  object Panel1: TPanel
    Left = 404
    Top = 0
    Width = 273
    Height = 53
    TabOrder = 7
    object RadioButton1: TRadioButton
      Left = 16
      Top = 4
      Width = 113
      Height = 17
      Caption = 'List Update'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 20
      Width = 113
      Height = 13
      Caption = 'List and Songs'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 16
      Top = 34
      Width = 113
      Height = 13
      Caption = 'Songs Only'
      TabOrder = 2
    end
    object Button4: TButton
      Left = 116
      Top = 4
      Width = 13
      Height = 45
      Caption = 'G E T'
      TabOrder = 3
      WordWrap = True
      OnClick = Button4Click
    end
  end
  object Button1: TButton
    Left = 668
    Top = 344
    Width = 15
    Height = 97
    Caption = 'S A V E'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 660
    Top = 320
    Width = 21
    Height = 17
    Caption = '>>'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo2: TMemo
    Left = 376
    Top = 140
    Width = 65
    Height = 45
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
    WordWrap = False
  end
  object Edit2: TEdit
    Left = 84
    Top = 4
    Width = 285
    Height = 21
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 84
    Top = 28
    Width = 285
    Height = 21
    TabOrder = 4
  end
  object Button3: TButton
    Left = 372
    Top = 4
    Width = 13
    Height = 45
    Caption = 'G E T'
    TabOrder = 5
    WordWrap = True
    OnClick = Button3Click
  end
  object Memo3: TRichEdit
    Left = 56
    Top = 88
    Width = 345
    Height = 97
    Lines.Strings = (
      'Memo3')
    ScrollBars = ssBoth
    TabOrder = 8
    Visible = False
    WordWrap = False
  end
  object Memo4: TMemo
    Left = 392
    Top = 80
    Width = 225
    Height = 105
    ScrollBars = ssBoth
    TabOrder = 9
    Visible = False
    WordWrap = False
  end
  object Memo6: TMemo
    Left = 112
    Top = 128
    Width = 273
    Height = 57
    ScrollBars = ssBoth
    TabOrder = 10
    Visible = False
  end
  object Memo5: TRichEdit
    Left = 144
    Top = 80
    Width = 273
    Height = 105
    ScrollBars = ssBoth
    TabOrder = 11
    Visible = False
    WordWrap = False
  end
  object Memo1: TListBox
    Left = 4
    Top = 344
    Width = 661
    Height = 97
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 12
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 60
    Width = 677
    Height = 129
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Letter'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Title'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Artist'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Music'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Poem'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 50
        Visible = True
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 4
    Top = 320
    Width = 649
    Height = 17
    Step = 1
    TabOrder = 13
  end
  object Edit1: TEdit
    Left = 4
    Top = 196
    Width = 321
    Height = 21
    TabOrder = 14
    Text = 'http://www.kithara.vu/ss.php?id='
  end
  object Edit3: TEdit
    Left = 352
    Top = 196
    Width = 329
    Height = 21
    TabOrder = 15
    Text = '&prnt=1&transp=0&hideTabl=0&hideChrd=0'
  end
  object Song: TRichEdit
    Left = 4
    Top = 224
    Width = 677
    Height = 93
    Lines.Strings = (
      'Song')
    ScrollBars = ssBoth
    TabOrder = 16
    Visible = False
    WordWrap = False
  end
  object SongCleared: TRichEdit
    Left = 292
    Top = 224
    Width = 393
    Height = 93
    Lines.Strings = (
      'Song')
    ScrollBars = ssBoth
    TabOrder = 17
    Visible = False
    WordWrap = False
  end
  object stitle: TEdit
    Left = 172
    Top = 224
    Width = 289
    Height = 21
    TabOrder = 18
    Visible = False
  end
  object sartist: TEdit
    Left = 172
    Top = 244
    Width = 289
    Height = 21
    TabOrder = 19
    Visible = False
  end
  object smusic: TEdit
    Left = 172
    Top = 264
    Width = 289
    Height = 21
    TabOrder = 20
    Visible = False
  end
  object spoem: TEdit
    Left = 172
    Top = 284
    Width = 289
    Height = 21
    TabOrder = 21
    Visible = False
  end
  object scontain: TEdit
    Left = 172
    Top = 304
    Width = 289
    Height = 21
    TabOrder = 22
    Visible = False
  end
  object sid: TEdit
    Left = 172
    Top = 324
    Width = 121
    Height = 21
    TabOrder = 23
    Visible = False
  end
  object ABSDatabase1: TABSDatabase
    Connected = True
    CurrentVersion = '4.75 '
    DatabaseFileName = 'F:\Temp\My Projects\Kithara.vu Big Final\data\SongList.ABS'
    DatabaseName = 'asd'
    Exclusive = False
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 4
    Top = 152
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    CookieManager = IdCookieManager1
    Left = 8
  end
  object ABSTable1: TABSTable
    CurrentVersion = '4.75 '
    DatabaseName = 'asd'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'IndexName'
        Fields = 'Id'
        Options = [ixUnique]
      end>
    FieldDefs = <
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Letter'
        Attributes = [faRequired]
        DataType = ftFixedChar
        Size = 1
      end
      item
        Name = 'Title'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Artist'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Music'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Poem'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Status'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    TableName = 'list'
    Exclusive = False
    Left = 32
    Top = 152
    object ABSTable1Id: TStringField
      DisplayWidth = 19
      FieldName = 'Id'
      KeyFields = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ABSTable1Letter: TStringField
      DisplayWidth = 2
      FieldName = 'Letter'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ABSTable1Title: TStringField
      DisplayWidth = 24
      FieldName = 'Title'
      Size = 50
    end
    object ABSTable1Artist: TStringField
      DisplayWidth = 24
      FieldName = 'Artist'
      Size = 40
    end
    object ABSTable1Music: TStringField
      DisplayWidth = 24
      FieldName = 'Music'
      Size = 40
    end
    object ABSTable1Poem: TStringField
      DisplayWidth = 21
      FieldName = 'Poem'
      Size = 40
    end
    object ABSTable1Status: TBooleanField
      DisplayWidth = 8
      FieldName = 'Status'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ABSTable1
    Left = 60
    Top = 152
  end
  object IdCookieManager1: TIdCookieManager
    Left = 396
    Top = 12
  end
  object ABSDatabase2: TABSDatabase
    Connected = True
    CurrentVersion = '4.75 '
    DatabaseFileName = 'F:\Temp\My Projects\Kithara.vu Big Final\data\songs.ABS'
    DatabaseName = 'sdd'
    Exclusive = False
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 4
    Top = 180
  end
  object ABSTable2: TABSTable
    CurrentVersion = '4.75 '
    DatabaseName = 'sdd'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'IndexName'
        Fields = 'Id'
        Options = [ixUnique]
      end>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Title'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Artist'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Music'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Poem'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Song'
        DataType = ftMemo
      end
      item
        Name = 'Contain'
        DataType = ftString
        Size = 20
      end>
    TableName = 'songs'
    Exclusive = False
    Left = 32
    Top = 180
    object ABSTable2Id: TStringField
      FieldName = 'Id'
    end
    object ABSTable2Title: TStringField
      FieldName = 'Title'
      Size = 50
    end
    object ABSTable2Artist: TStringField
      FieldName = 'Artist'
      Size = 40
    end
    object ABSTable2Music: TStringField
      FieldName = 'Music'
      Size = 40
    end
    object ABSTable2Poem: TStringField
      FieldName = 'Poem'
      Size = 40
    end
    object ABSTable2Song: TMemoField
      FieldName = 'Song'
      BlobType = ftMemo
    end
    object ABSTable2Contain: TStringField
      FieldName = 'Contain'
    end
  end
end
