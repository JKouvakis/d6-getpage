unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ABSMain, strutils, ComCtrls, DB, Grids, DBGrids,
  ExtCtrls, IdCookieManager, IdIOHandler, IdIOHandlerSocket;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ABSDatabase1: TABSDatabase;
    IdHTTP1: TIdHTTP;
    Memo2: TMemo;
    Label1: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Button3: TButton;
    DBGrid1: TDBGrid;
    ABSTable1: TABSTable;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Memo3: TRichEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button4: TButton;
    Memo4: TMemo;
    Memo6: TMemo;
    Memo5: TRichEdit;
    ABSTable1Id: TStringField;
    ABSTable1Letter: TStringField;
    ABSTable1Title: TStringField;
    ABSTable1Artist: TStringField;
    ABSTable1Music: TStringField;
    ABSTable1Poem: TStringField;
    ABSTable1Status: TBooleanField;
    Memo1: TListBox;
    ProgressBar1: TProgressBar;
    Edit1: TEdit;
    Edit3: TEdit;
    Song: TRichEdit;
    IdCookieManager1: TIdCookieManager;
    ABSDatabase2: TABSDatabase;
    SongCleared: TRichEdit;
    stitle: TEdit;
    sartist: TEdit;
    smusic: TEdit;
    spoem: TEdit;
    ABSTable2: TABSTable;
    ABSTable2Id: TStringField;
    ABSTable2Title: TStringField;
    ABSTable2Artist: TStringField;
    ABSTable2Music: TStringField;
    ABSTable2Poem: TStringField;
    ABSTable2Song: TMemoField;
    ABSTable2Contain: TStringField;
    scontain: TEdit;
    sid: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  Letter: array[0..24] of Char =
   ('%', 'Α', 'Β', 'Γ', 'Δ', 'Ε', 'Ζ', 'Η', 'Θ', 'Ι',
    'Κ', 'Λ', 'Μ', 'Ν', 'Ξ', 'Ο', 'Π', 'Ρ', 'Σ', 'Τ',
    'Υ', 'Φ', 'Χ', 'Ψ', 'Ω');
implementation

uses getpage;

{$R *.dfm}

procedure getpage(page: string; Sender: TObject);
begin
  Form1.Memo3.Text := Form1.IdHTTP1.Get(page);
end;

procedure getcursong(Sender: TObject);
var
  i:integer;
  tab,crd : boolean;
  S: string;
begin
  Form1.SongCleared.Clear;
  crd := false;
  tab := false;
  i:=0;
  Form1.scontain.Clear;
  While i<= Form1.Song.Lines.Count do
  begin
    S:=Form1.Song.Lines.Strings[i];

    if (PoS('class=ti',S)<>0) or (Pos('class="ti"',S)<>0) then
      begin
        S:=midstr(S,pos('>',S)+1,length(S));
        Form1.stitle.Text:=midstr(S,0,pos('<',S)-1);
      end;
    if (PoS('class=ar',S)<>0) or (Pos('class="ar"',S)<>0) then
      begin
        S:=midstr(S,pos('<b>',S)+3,length(S));
        Form1.sartist.Text:=midstr(S,0,pos('</b>',S)-1);
      end;
    if (PoS('class=cr',S)<>0) or (Pos('class="cr"',S)<>0) then
      begin
        If (PoS('<b>',S)=0) then
          begin
            i:=i+1;
            S:=Form1.Song.Lines.Strings[i];
          end;
          S:=midstr(S,pos('<b>',S)+3,length(S));
          S:=(midstr(S,0,pos('</b>',S)-1));
        If (PoS('/',S)<>0) then
          begin
            Form1.smusic.Text:=midstr(S,0,pos('/',S)-1);
            Form1.spoem.Text:=midstr(S,pos('/',S)+1,length(S));
          end
        else
          begin
            Form1.smusic.Text:=S;
            Form1.spoem.Text:=S;
          end;
      end;
    if (PoS('class=no',S)<>0) or (Pos('class="no"',S)<>0) then
      begin
        S:=leftstr(S,pos('</p>',S)+3);
        Form1.SongCleared.Lines.Add(S);
      end;
    if (PoS('class=te',S)<>0) or (Pos('class="te"',S)<>0) then
      begin
        S:=leftstr(S,pos('</p>',S)+3);
        Form1.SongCleared.Lines.Add(S);
      end;
    if (PoS('class=ch',S)<>0) or (Pos('class="ch"',S)<>0) then
      begin
        crd := true;
        S:=leftstr(S,pos('</p>',S)+3);
        Form1.SongCleared.Lines.Add(S);
      end;
    if (PoS('class=ta',S)<>0) or (Pos('class="ta"',S)<>0) then
      begin
        tab := true;
        S:=leftstr(S,pos('</p>',S)+3);
        Form1.SongCleared.Lines.Add(S);
      end;
    if (PoS('class=co',S)<>0) or (Pos('class="co"',S)<>0) then
      begin
        S:=leftstr(S,pos('</p>',S)+3);
        Form1.SongCleared.Lines.Add(S);
      end;
  i:=i+1;
  end;
  If (tab=true) then
    Form1.scontain.Text := Form1.scontain.Text + '(+t)';
  If (crd=true) then
    Form1.scontain.Text := Form1.scontain.Text + '(+x)';
end;

procedure getlinks(Sender: TObject);
var
   i: integer;
   loctemp: string;
begin
  Form1.Memo4.Clear;
  For i:=0 to Form1.Memo3.Lines.Count-1 do
    If Pos('cmd=ai&art=',Form1.Memo3.Lines.Strings[i])>0 then
      begin
        loctemp:=Form1.Memo3.Lines.Strings[i];
        loctemp:=Rightstr(loctemp,length(loctemp)-9);
        loctemp:=Leftstr(loctemp,pos('"',loctemp)+1);
        loctemp:='http://www.kithara.vu/' + loctemp;
        loctemp:=Leftstr(loctemp,length(loctemp)-2);
        Form1.Memo4.Lines.Add(loctemp);
      end;
end;

procedure getsongs(Sender: TObject);
var
   i,j: integer;
   loctemp: string;
begin
  Form1.ProgressBar1.Max := Form1.Memo4.Lines.Count;
  Form1.ProgressBar1.Position:=0;
  For i:=0 to Form1.Memo4.Lines.Count-1 do
    begin
    Form1.ProgressBar1.StepIt;
    sleep(5000);
    Form1.Memo5.Text := Form1.IdHTTP1.Get(Form1.Memo4.Lines.Strings[i]);
    For j:=0 to Form1.Memo5.Lines.Count-1 do
    If Pos('<a href="ss.php?',Form1.Memo5.Lines.Strings[j])>0 then
      begin
        loctemp:=Form1.Memo5.Lines.Strings[j];
        loctemp:=Rightstr(loctemp,length(loctemp)-9);
        loctemp:=Leftstr(loctemp,pos('"',loctemp)+1);
        loctemp:=Leftstr(loctemp,length(loctemp)-2);
        loctemp:=Rightstr(loctemp,length(loctemp)-10);
        Form1.Memo6.Lines.Add(loctemp);
      end;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   myFile    : TextFile;
   i         : Integer;
begin
 AssignFile(myFile,'data\httpdat.dat');
 Rewrite(myFile);
  for i:= 0 to 24 do
   WriteLn (myFile, Memo1.Items[i]);
  CloseFile(myFile);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   myFile    : TextFile;
   a         : string;
   i         : integer;
begin
 AssignFile(myFile,'data\httpdat.dat');
 Reset(myFile);
   while not Eof(myFile) do
   begin
     ReadLn(myFile, a);
     Memo1.Items.Add(a);
   end;
  CloseFile(myFile);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
If Button2.Caption = '>>' then
  begin
    Form1.Width := 693;
    Form1.Height := 479;
    Button2.Caption := '<<';
  end
else
  begin
    Form1.Width := 693;
    Form1.Height := 375;
    Button2.Caption := '>>';
  end
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowMessage(getcoockies);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i,j : integer;
  SearchOptions: TLocateOptions;
  query :  string;
  response : TIdHttp;
begin
  SearchOptions := [loPartialKey];
  If RadioButton1.Checked then
    begin
      for i:=0 to Memo1.Count -1 do
      if Memo1.Selected[i] then
        begin
          getpage(Memo1.Items[i],Form1);
          getlinks(Form1);
          getsongs(Form1);
          for j:=0 to Memo6.Lines.Count-1 do
            begin
             if not ABSTable1.Locate('Id',Memo6.Lines[j],SearchOptions) then
              begin
                ABSTable1.Insert;
                ABSTable1.FieldByName('Id').AsString := Memo6.Lines[j];
                ABSTable1.FieldByName('Letter').AsString := Letter[i];
                ABSTable1.FieldByName('Status').AsString := 'False';
                ABSTable1.Post;
              end;
            end;
        end;
    end
  else if RadioButton2.Checked then
    begin
    end
  else
    begin
      ABSTable1.Filter := 'Status="False"';
      ABSTable1.Filtered := True;

//      ABSTable1.Filter := 'Id="MTY2Mzc5ODY0"';
//      ABSTable1.Filtered := True;
//      ABSTable1.Index

      i:=0;
      progressbar1.Max := ABSTable1.RecordCount -1;
      while  i<=ABSTable1.RecordCount -1 do
        begin
         sleep(6000);
         Query := Edit1.Text + ABSTable1.FieldValues['Id'] + '&' + Edit4.Text + Edit3.Text;
         Song.Text:=Idhttp1.get(query);
         progressbar1.Position := i;

        if pos('μέγιστο επιτρεπτό αριθμό επισκέψεων',Song.Text)=0 then
          begin

         getcursong(Form1);

        if (stitle.Text<>'') then
          begin
// Table 1
         ABSTable1.Edit;
//         ABSTable1.FieldByName('Id').AsString := Memo6.Lines[j];
//         ABSTable1.FieldByName('Letter').AsString := Letter[i];
         ABSTable1.FieldByName('Title').AsString := stitle.Text;
         ABSTable1.FieldByName('Artist').AsString := sartist.Text;
         ABSTable1.FieldByName('Music').AsString := smusic.Text;
         ABSTable1.FieldByName('Poem').AsString := spoem.Text;
         ABSTable1.FieldByName('Status').AsString := 'True';
         sid.Text := ABSTable1.FieldByName('Id').AsString;
         ABSTable1.Post;
//

// Table 2
         ABSTable2.Edit;
         ABSTable2.FieldByName('Id').AsString := sid.text;
         ABSTable2.FieldByName('Title').AsString := stitle.Text;
         ABSTable2.FieldByName('Artist').AsString := sartist.Text;
         ABSTable2.FieldByName('Music').AsString := smusic.Text;
         ABSTable2.FieldByName('Poem').AsString := spoem.Text;
         ABSTable2.FieldByName('Song').AsString := songcleared.Lines.Text;
         ABSTable2.FieldByName('Contain').AsString := scontain.Text;
         ABSTable2.Post;
//

//         ABSTable1.Next;
         ABSTable2.Insert;

         i:=i+1;

         end

        end
       else  i:=ABSTable1.RecordCount;

       end;

      ABSTable1.Filter := '';
      ABSTable1.Filtered := False;
    end;
end;

end.
