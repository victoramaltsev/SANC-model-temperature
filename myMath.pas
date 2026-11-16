unit myMath;

interface

uses
SysUtils, Dialogs, Math,
 Windows,
 System.UITypes,
 DateUtils;



// IntegerArray  = array[0..$effffff] of Integer;
// PIntegerArray  = ^IntegerArray;
var
//  DatXr2, DatYr2,
DatXr, DatYr:array of double;


type
 DoubleArray =  array[0..$effffff] of double; // $effffff= 251,658,239
 PDoubleArray   = ^DoubleArray;

// OutputArrays:
const MaxNumberOfPlots2 = 10001;

 var DatXX, DatYY, DatdVdt:  PDoubleArray; // for least squire method


var DatX, DatY:array[1..MaxNumberOfPlots2] of PDoubleArray;
PlotNSamples: array[1..MaxNumberOfPlots2] of longint;
PlotNames2: array[1..MaxNumberOfPlots2] of string;
 var ItemsOutCount:integer;


Function TabStr(s:string; N:integer):string;
Function CharStr(delim:char; s:string; N:integer):string;
Function CharStrStart(delim:char; s:string; N:integer; var StartFoundIndex:integer):string;



Procedure MethLeastSq(i1_,i2_:longint; var slope1,offset1:double);


function ExtractFileNameWithoutExtention(Fn:string):string;
// I can also use system procedure
// Fn:= Tpath.GetFileNameWithoutExtension(Fn);
// but I need add uses   System.IOUtils,



Procedure MovingAverage1(var DataArray:PDoubleArray;
                          Window1, istart_,iend_,iTotal, Limit:integer);

Procedure GausFilter1(var DataArray:PDoubleArray;
                          CutOffFreq,Rate:double;
                          istart_,iend_,iTotal, Limit:integer;
                      var NC:integer);




Procedure MovingAverage2(var DataArray:array of double;
                          Window1, istart_,iend_,Limit:integer);


Procedure GausFilter2(var DataArray:array of double;
                          CutOffFreq,Rate:double;
                          istart_,iend_, Limit:integer;
                      var NC:integer);




Procedure RemoveExtraSpaces(var s:string);
Procedure ReplaceSpacesToTabs(var s0:string);


// example:
// A_:  PDoubleArray;
// getmem(A_,(iend_ - istart_+1)*sizeof(double));
// freemem(A_);

// MaxPixelCount= 65536;
// var Dat,DatUndo:array[1..MaxPixelCount] of PDoubleArray;
// for yi:=0 to datYMax-1 do freemem(datUndo[yi]);
// for yi:=0 to datYmax-1 do getmem(datUndo[yi], datXmax*sizeof(double));
//for yi:=0 to  datYmax-1 do begin
//  for xi:=0 to  datXmax-1 do begin
//   datUndo[yi][xi]:=dat[yi][xi];
//  end;
//  end;

{var MyFlexibleArray: array of Real;
SetLength(MyFlexibleArray, 20);
to deallocate a dynamic array, assign nil to a variable that
references the array or pass the variable to Finalize;
either of these methods disposes of the array,
provided there are no other references to it.

MeanAndStdDev(MyFlexibleArray,mean1,sd1);
mean1:=mean(MyFlexibleArray)

A, B: array of Integer;
to copy arrays use:
B := Copy(A);
}

function InterPolX(x1,y1, x2, y2, y: double): double;
function InterPolY(x1,y1, x2, y2, x: double): double;


implementation


function InterPolX(x1,y1, x2, y2, y: double): double;
var a, b : double; // y = ax+b
begin
   if x2=x1  then  begin result:= x1; exit; end;

   a:= (y2-y1)/(x2-x1);
   b:= y1-x1*a;
   if a<>0 then result:= (y-b)/a else  result:= (x2+x1)/2;
end;

function InterPolY(x1,y1, x2, y2, x: double): double;
var a, b : double; // y = ax+b
begin
   if x2=x1  then  begin result:= (y1+y2)/2; exit; end;
   a:= (y2-y1)/(x2-x1);
   b:= y1-x1*a;
   result:= a*x+b;
end;



Procedure RemoveExtraSpaces(var s:string);
var i:integer;
s1,s2:string;
begin
  s:= trim(s);
  i:=0;
  repeat
  inc(i);
  if s[i] =' ' then
   begin
    s[i]:=#9;
    if s[i+1]=' ' then // trim
      begin
        s1:=Copy(s,1,i);
        s2:=Copy(s,i+1, length(s)-i);
        s2:=trim(s2);
        s:=s1+s2;
      end; // if space next
   end; // if space
  until i=length(s)

end;


Function CharStr(delim:char; s:string; N:integer):string;
var tabcount,i:integer; s1:string;
begin
 CharStr:=''; if s='' then exit;
 i:=0; tabcount:=0; s1:='';
 repeat
 inc(i);
 if s[i]=delim then
 begin
   inc(tabcount);
    if   tabcount = N then
   begin
     CharStr:=s1; exit;
   end else s1:='';
 end  // ','
 else s1:=s1+s[i];

 until i=length(s);
if N= tabcount+1 then  CharStr:=s1; // if  TabulatedStr is at the end
end; // proc




Function CharStrStart(delim:char; s:string; N:integer; var StartFoundIndex:integer):string;
var tabcount,i:integer; s1:string;
begin
 CharStrStart:=''; if s='' then exit;
 i:=StartFoundIndex-1; tabcount:=0; s1:='';
 repeat
 inc(i);
 if s[i]=delim then
 begin
   inc(tabcount);
    if   tabcount = N then
   begin
     StartFoundIndex:=i;
     CharStrStart:=s1; exit;
   end else s1:='';
 end  // ','
 else s1:=s1+s[i];
  until i=length(s);
 StartFoundIndex:=i;

if N= tabcount+1 then
 begin
   CharStrStart:=s1; // if  TabulatedStr is at the end
 end;
end; // proc



Function TabStr(s:string; N:integer):string;
var tabcount,i:integer; s1:string;
begin
 TabStr:=''; if s='' then exit;
 i:=0; tabcount:=0; s1:='';
 repeat
 inc(i);
 if s[i]=#9 then
 begin
   inc(tabcount);
    if   tabcount = N then
   begin
     TabStr:=s1; exit;
   end else s1:='';
 end  // #9
 else s1:=s1+s[i];

 until i=length(s);
if N= tabcount+1 then  TabStr:=s1; // if  TabulatedStr is at the end
end; // proc



function ExtractFileNameWithoutExtention(Fn:string):string;
var s1:string;  i, i1 :integer;
label exit1;
begin

// https://docwiki.embarcadero.com/Libraries/Sydney/en/System.IOUtils.TPath.GetFileNameWithoutExtension
// class function GetFileNameWithoutExtension(const FileName: string): string; static

// I can also use system procedure
// Fn:= Tpath.GetFileNameWithoutExtension(Fn);
// but I need add uses   System.IOUtils,

s1:= ExtractFileName(Fn);

//i:=Pos('.',s1); if i<=1 then goto exit1;
//s1:=Copy(s1,1,i-1);
// starting from string end and going backwards
i:= length(Fn);
repeat
   dec(i);
until (Fn[i]='.') or (i=0);
if i=0 then s1:=Fn else s1:= Copy(s1,1,i-1);

exit1:
 ExtractFileNameWithoutExtention:=s1;

end;





Procedure MovingAverage1(var DataArray:PDoubleArray;
                          Window1, istart_,iend_,iTotal, Limit:integer);

var A_:  PDoubleArray;// a temporary array for filtering
sum:double;
NC, i, j:integer;

begin
if  Window1=1 then exit; // no filtering
NC:=Window1 div 2;
if  NC=0 then exit; // no filtering

// prepare dynamic memory array for filtering
getmem(A_,iTotal*sizeof(double));
for i:=0 to  iTotal-1 do A_[i]:= DataArray[i];
 { //////////////// a c t u a l    f i l t e r i n g ///////////}
For i:=istart_ to iend_ do
begin
       sum:=0;
       for j:= i-NC to i+NC do
          begin
// Limit
// = -1 data array is limited from left side
// = 0 no limit
// = +1 limit from right side
// =+2 limits from both side
Case Limit of
            0:Sum:=Sum+A_[j];
           -1:begin
              if j<istart_  then Sum:=Sum+A_[istart_]  else
              Sum:=Sum+A_[j];
              end;
            1:begin
               if j>iend_ then Sum:=Sum+A_[iend_] else
               Sum:=Sum+A_[j];
              end;
            2:begin
                if j<istart_  then Sum:=Sum+A_[istart_]  else
                if j>iend_ then Sum:=Sum+A_[iend_] else
                Sum:=Sum+A_[j]
              end;
            end;// Case
          end;
// transfer filtered data into original array
      DataArray[i]:=Sum/(2*NC+1);
  end;{for i...}

// freeing memory
freemem(A_);

end;


Procedure GausFilter1(var DataArray:PDoubleArray;
                          CutOffFreq,Rate:double;
                          istart_,iend_,iTotal, Limit:integer;
                      var NC:integer);

// Limit
// Limit = -2  no filtering, only calculating NC
// = -1 data array is limited from left side
// = 0 no limit - means actual filtering may use data
// points beyond the specified array indexes for smooth filtering at the edges)
// = +1 limit from right side
// =+2 limits from both side

var
      i,j,K:integer;
      FC,Sigma,B0,Temp,Sum:real;
const MaxNumbCoeff=20001;

Type PAA=^TAA;
TAA=array[1..MaxNumbCoeff] of double; // coefficient array
var AA:PAA;

var A_:  PDoubleArray;// a temporary array for filtering

begin
new(AA);
     FC:=CutOffFreq/Rate;
     Sigma:=0.132505/FC;  {sigma of gaussian}
     {compute the cofficients}
     if Sigma < 0.6 then
       begin
          {coefficients for small sigma}
          AA^[2]:=Sigma*Sigma/2; {Gives second moment = Sigma}
          AA^[1]:=1-2*AA^[2];      {Required for normalization}
          NC:=1;
       end else
       begin
          {Standard gaussian coefficients
           NC is the number non-diagonal coeffs.}

          NC:=round(4*Sigma); {Go out to 4 times S.D.}
          if NC>MaxNumbCoeff-2 then
                    begin
                     MessageDlg('Gauss filter. Too many # coefficients ='+IntToStr(NC),
                     mtWarning, [mbOK], 0);
                     NC:=2000
                    end;
          B0:=-1/(2*Sigma*Sigma); {useful constant}
          {compute the unnormalized coefficients}
          AA^[1]:=1;  Sum:=0.5;
          for i:=1 to NC do
            begin
               Temp:=exp(i*i*B0); AA^[i+1]:=Temp;
               Sum:=Sum+Temp {accumulate a sum}
            end;
          {normalization}
           Sum:=Sum*2;
           for i:=1 to NC+1 do AA^[i]:=AA^[i]/Sum;
       end;
       {WriteLn('Number of coefficients = ',NC);}

// Limit = -2  no filtering, only calculating NC
if Limit=-2 then
 begin
// freeing memory
  dispose(AA);
  exit;
 end;


// prepare dynamic memory array for filtering
getmem(A_,iTotal*sizeof(double));


 for i:=0 to  iTotal-1 do A_[i]:= DataArray[i];


 { //////////////// a c t u a l    f i l t e r i n g ///////////}
For i:=istart_ to iend_ do
begin
       sum:=0;
       for j:= i-NC to i+NC do
          begin
            K:=ABS(j-i) + 1;
// Limit
// = -2  no filtering, only calculating NC
// = -1 data array is limited from left side
// = 0 no limit
// = +1 limit from right side
// =+2 limits from both side
Case Limit of
            0:Sum:=Sum+AA^[K]*A_[j];
           -1:begin
              if j<istart_  then Sum:=Sum+AA^[K]*A_[istart_]  else
              Sum:=Sum+AA^[K]*A_[j];
              end;
            1:begin
               if j>iend_ then Sum:=Sum+AA^[K]*A_[iend_] else
               Sum:=Sum+AA^[K]*A_[j];
              end;
            2:begin
                if j<istart_  then Sum:=Sum+AA^[K]*A_[istart_]  else
                if j>iend_ then Sum:=Sum+AA^[K]*A_[iend_] else
                Sum:=Sum+AA^[K]*A_[j]
              end;
            end;// Case
          end;
// transfer filtered data into original array
      DataArray[i]:=Sum;
  end;{for i...}


// freeing memory
freemem(A_);
dispose(AA);
end; {end proc...}








Procedure MovingAverage2(var DataArray:array of double;
                          Window1, istart_,iend_,Limit:integer);

var A_:  PDoubleArray;// a temporary array for filtering
sum:double;
iTotal, NC, i, j:integer;

begin
iTotal:=High(DataArray)+1;
if  Window1=1 then exit; // no filtering
NC:=Window1 div 2;
if  NC=0 then exit; // no filtering

// prepare dynamic memory array for filtering
getmem(A_,iTotal*sizeof(double));
for i:=0 to  iTotal-1 do A_[i]:= DataArray[i];
 { //////////////// a c t u a l    f i l t e r i n g ///////////}
For i:=istart_ to iend_ do
begin
       sum:=0;
       for j:= i-NC to i+NC do
          begin
// Limit
// = -1 data array is limited from left side
// = 0 no limit
// = +1 limit from right side
// =+2 limits from both side
Case Limit of
            0:Sum:=Sum+A_[j];
           -1:begin
              if j<istart_  then Sum:=Sum+A_[istart_]  else
              Sum:=Sum+A_[j];
              end;
            1:begin
               if j>iend_ then Sum:=Sum+A_[iend_] else
               Sum:=Sum+A_[j];
              end;
            2:begin
                if j<istart_  then Sum:=Sum+A_[istart_]  else
                if j>iend_ then Sum:=Sum+A_[iend_] else
                Sum:=Sum+A_[j]
              end;
            end;// Case
          end;
// transfer filtered data into original array
      DataArray[i]:=Sum/(2*NC+1);
  end;{for i...}

// freeing memory
freemem(A_);

end;


Procedure GausFilter2(var DataArray:array of double;
                          CutOffFreq,Rate:double;
                          istart_,iend_, Limit:integer;
                      var NC:integer);

// Limit
// Limit = -2  no filtering, only calculating NC
// = -1 data array is limited from left side
// = 0 no limit - means actual filtering may use data
// points beyond the specified array indexes for smooth filtering at the edges)
// = +1 limit from right side
// =+2 limits from both side

var
iTotal,
      i,j,K:integer;
      FC,Sigma,B0,Temp,Sum:real;
const MaxNumbCoeff=20001;

Type PAA=^TAA;
TAA=array[1..MaxNumbCoeff] of double; // coefficient array
var AA:PAA;

var A_:  PDoubleArray;// a temporary array for filtering

begin
iTotal:=High(DataArray)+1;
new(AA);
     FC:=CutOffFreq/Rate;
     Sigma:=0.132505/FC;  {sigma of gaussian}
     {compute the cofficients}
     if Sigma < 0.6 then
       begin
          {coefficients for small sigma}
          AA^[2]:=Sigma*Sigma/2; {Gives second moment = Sigma}
          AA^[1]:=1-2*AA^[2];      {Required for normalization}
          NC:=1;
       end else
       begin
          {Standard gaussian coefficients
           NC is the number non-diagonal coeffs.}

          NC:=round(4*Sigma); {Go out to 4 times S.D.}
          if NC>MaxNumbCoeff-2 then
                    begin
                     MessageDlg('Gauss filter. Too many # coefficients ='+IntToStr(NC),
                     mtWarning, [mbOK], 0);
                     NC:=2000
                    end;
          B0:=-1/(2*Sigma*Sigma); {useful constant}
          {compute the unnormalized coefficients}
          AA^[1]:=1;  Sum:=0.5;
          for i:=1 to NC do
            begin
               Temp:=exp(i*i*B0); AA^[i+1]:=Temp;
               Sum:=Sum+Temp {accumulate a sum}
            end;
          {normalization}
           Sum:=Sum*2;
           for i:=1 to NC+1 do AA^[i]:=AA^[i]/Sum;
       end;
       {WriteLn('Number of coefficients = ',NC);}

// Limit = -2  no filtering, only calculating NC
if Limit=-2 then
 begin
// freeing memory
  dispose(AA);
  exit;
 end;


// prepare dynamic memory array for filtering
getmem(A_,iTotal*sizeof(double));


 for i:=0 to  iTotal-1 do A_[i]:= DataArray[i];


 { //////////////// a c t u a l    f i l t e r i n g ///////////}
For i:=istart_ to iend_ do
begin
       sum:=0;
       for j:= i-NC to i+NC do
          begin
            K:=ABS(j-i) + 1;
// Limit
// = -2  no filtering, only calculating NC
// = -1 data array is limited from left side
// = 0 no limit
// = +1 limit from right side
// =+2 limits from both side
Case Limit of
            0:Sum:=Sum+AA^[K]*A_[j];
           -1:begin
              if j<istart_  then Sum:=Sum+AA^[K]*A_[istart_]  else
              Sum:=Sum+AA^[K]*A_[j];
              end;
            1:begin
               if j>iend_ then Sum:=Sum+AA^[K]*A_[iend_] else
               Sum:=Sum+AA^[K]*A_[j];
              end;
            2:begin
                if j<istart_  then Sum:=Sum+AA^[K]*A_[istart_]  else
                if j>iend_ then Sum:=Sum+AA^[K]*A_[iend_] else
                Sum:=Sum+AA^[K]*A_[j]
              end;
            end;// Case
          end;
// transfer filtered data into original array
      DataArray[i]:=Sum;
  end;{for i...}


// freeing memory
freemem(A_);
dispose(AA);
end; {end proc...}



Procedure MethLeastSq(i1_,i2_:longint; var slope1,offset1:double);
{method of least squires}
var b1,b0,N,x_,y_,X1,X2,Y1,Y2,XY:real;
i0:integer;
begin
X1:=0;X2:=0;Y1:=0;Y2:=0;XY:=0;
 for i0:=i1_ to i2_ do
     begin
      x_:=DatXX[i0];
      y_:=DatYY[i0];
      X1:=X1+x_;
      X2:=X2+sqr(x_);
      Y1:=Y1+y_;
      Y2:=Y2+sqr(y_);
      XY:=XY+x_*y_;
     end;
N:=i2_-i1_+1;


// make sure that there is no divisions by 0
if (N<>0) then
begin
if (X2 - sqr(X1)/N) <> 0 then
   begin
      b1:=(XY - X1*Y1/N)/(X2 - sqr(X1)/N);
      b0:= (Y1 - b1*X1)/N;  {b0=ampl. of exp}
   end else
   begin
    b1:=0;
    b0:=0;
   end;
end
else
begin
b1:=0;
b0:=0;
end;

Offset1:=b0;
slope1:=b1;
end;



Procedure ReplaceSpacesToTabs(var s0:string);
var i:integer; s, s1:string;
SpaceBoo: boolean;
begin
s:= s0;
if s='' then exit;
s1:='';

SpaceBoo:= false;
if s[1]=' ' then SpaceBoo:=true;

for i:=1 to length (s)   do
 begin
  if s[i]<>' ' then
  begin
   s1:=s1+s[i];
   SpaceBoo:= false;
  end
   else
  begin
   if not SpaceBoo then s1:=s1+#9;
   SpaceBoo:= true;
  end;
 end;
s0:=s1;
end;




end.




