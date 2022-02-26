unit convert;

interface

  uses StrUtils, Dialogs, Classes;

var
  crd_array : array[1..12] of string;
  song_or : tstrings;
  song_modi : tstrings;
  text_need_change : boolean;
  positions,positions_txt : array of integer;
  chords : array of string;

const
  crd_orig_array : array[1..12] of string = ('C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B');

function convert_song(song_or : tstrings; note : integer):tstrings;
function cleartags(s: string):string;

implementation

function cleartags(s: string):string;
var
  new : string;
begin
  new:=S;
  repeat
    if pos('<',new)=1 then
      new := Midstr(new,pos('>',new)+1,length(new));
    If pos('<',new)>1 then
      new := Leftstr(new,pos('<',new)-1) + midstr(new,pos('>',new)+1,length(new));
  until pos('<',new)=0;
  Result:=new;
end;

function string_crd(chords: array of string;lengthstr: integer):string;
var
  i,j,m: integer;
  temp: string;
begin

  j:=0;
  m:=0;
  i:=1;

  text_need_change:=false;

  while i<=lengthstr do
    begin
      if i=positions[j] then
        begin
          temp:=temp+chords[j];
          If i+length(chords[j]) = positions[j+1]+1 then
            begin
              text_need_change:=true;
              SetLength(positions_txt,m+1);
              positions_txt[m]:=positions[j+1];
              m:=m+1;
              i:=i-1;
            end;
          i:=i+length(chords[j])-1;
          j:=j+1;
          i:=i+1;
        end
      else
        begin
          temp:=temp+#160;
          i:=i+1;
        end;
    end;

  Result:=temp;

end;

procedure replace_crd(chordsar: array of string);
var
  i : integer;
begin
//  SetLength(crd_modified,length(chords));
  for i:=0 to length(chords)-1 do
    begin
      If pos('C#',chords[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'C#',crd_array[2])
      else If pos('C',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'C',crd_array[1])
      else If pos('D#',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'D#',crd_array[4])
      else If pos('D',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'D',crd_array[3])
      else If pos('E',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'E',crd_array[5])
      else If pos('F#',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'F#',crd_array[7])
      else If pos('F',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'F',crd_array[6])
      else If pos('G#',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'G#',crd_array[9])
      else If pos('G',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'G',crd_array[8])
      else If pos('A#',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'A#',crd_array[11])
      else If pos('A',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'A',crd_array[10])
      else If pos('B',chordsar[i])<>0 then
        chords[i]:=AnsiReplacestr(chordsar[i],'B',crd_array[12]);
    end;
end;

function split_crd(s: string):string;
var
  i,j: integer;
  chr,temp: string;
begin
  j:=0;
  SetLength(chords,j);
  SetLength(positions,j);
  chr:='';
  for i:=1 to length(s) do
    begin
      chr := midstr(s,i,1);
      if (chr<>'A') and (chr<>'B') and (chr<>'C') and (chr<>'D') and (chr<>'E') and (chr<>'F') and (chr<>'G') then
        begin
          if j=0 then
            begin
              j:=j+1;
              SetLength(chords,j);
              SetLength(positions,j);
              positions[j-1] :=i;
            end
          else
            chords[j-1] := chords[j-1] + chr;
        end
      else
        begin
          SetLength(chords,j+1);
          SetLength(positions,j+1);
          chords[j] := chr;
          positions[j] := i;
          j:=j+1;
        end
    end;

  replace_crd(chords);

  for i:=0 to length(chords)-1 do
    if pos(#160,chords[i])<>0 then
      chords[i]:=leftstr(chords[i],pos(#160,chords[i])-1);

  s:=string_crd(chords,length(s));

  result := s;

end;

function fix_text(s:string):string;
var
  i,j: integer;
  temp,temp2: string;
begin
  j:=0;
  temp:='';
  for i:=1 to length(s) do
    begin
      temp:=midstr(s,i,1);
      if i=positions_txt[j] then
        begin
          If (temp<>' ') and (temp<>#160) then
            temp2:=temp2+'-';
          temp2:=temp2+temp;
          j:=j+1;
        end
      else
        temp2:=temp2+temp;
    end;
  Result:=temp2;
end;

procedure make_crd_array(note : integer);
var
 i:integer;
begin
  for i:=1 to 12 do
    begin
      if (i+note>12) then
        crd_array[i]:=crd_orig_array[note+i-12]
      else if (i+note<1) then
        crd_array[i]:=crd_orig_array[note+i+12]
      else
        crd_array[i]:=crd_orig_array[note+i]
    end;
end;

function convert_song(song_or : tstrings; note : integer):tstrings;
var
 i:integer;
 s: string;
begin

  song_modi := TStringList.Create;

  make_crd_array(note); // make chords replacement array

  i:=0;
  while i < song_or.Count do
    begin
      s:=song_or[i];
      If ((pos('class="ch"',s)<>0) or (pos('class=ch',s)<>0)) then
        begin
          s:=cleartags(s);
          s:=split_crd(s);
          s:='<p class=ch>'+s+'</p>';
        end
      else If ((pos('class="te"',s)<>0) or (pos('class=te',s)<>0)) then
        begin
          if text_need_change = true then
            begin
              s:=cleartags(s);
              s:=fix_text(s);
              s:='<p class=te>'+s+'</p>';
            end;
          text_need_change := false
        end
      else
        begin
          text_need_change := false
        end;

      song_modi.Add(s);
      i:=i+1;
    end;

  result := song_modi;

end;

end.
 