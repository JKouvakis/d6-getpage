unit getpage;

interface

  uses StrUtils, Dialogs, Classes, IdHTTP;

type
    IdHTTP1 = class(TIdHTTP);

var
  songs_list : tstrings;
  song : tstrings;
  song_cl : tstrings;
  song_info : array[1..6] of string;

const
  Letter: array[0..24] of Char =
   ('%', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Æ', 'Ç', 'È', 'É',
    'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï', 'Ð', 'Ñ', 'Ó', 'Ô',
    'Õ', 'Ö', '×', 'Ø', 'Ù');

function getcoockies: string;

implementation

function getcoockies: string;
var
   i         : Integer;
   Idhttp1   : TIdhttp;
   Raws: Tstrings;
begin
  Idhttp1 := TIdhttp.Create;
  Idhttp1.Get('http://www.kithara.vu/');
  Raws := Idhttp1.Response.RawHeaders;
  Result := '';
    for  i:=0 to Raws.Count-1 do
      begin
      if (Leftstr(Raws.Strings[i],11)='Set-Cookie:') then
        begin
        If (Result = '') then
          Result := MidStr(Raws.Strings[i],13,length(Raws.Strings[i]))
        else
          Result := Result + '#' + MidStr(Raws.Strings[i],13,pos(';',Raws.Strings[i])-13);
        end;
      end;
end;

end.
 