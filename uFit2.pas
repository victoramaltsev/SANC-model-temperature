unit uFit2;

interface
uses
MyMath;




type FitPrmSet= record
               p1,p2,p3,p4:double;
               end;
var best:FitPrmSet;
BestSum:double;
var PrmFixed: record
               p1f,p2f,p3f,p4f:boolean;
               end;


Function FunctionGauss(prm:FitPrmSet;x:double):double;
Function Function1Exp(prm:FitPrmSet;x:double):double;

Procedure FitGauss(Arr:PDoubleArray;ArrCo:longint); // co=0toN-1
Procedure Fit1Exp(Arr:PDoubleArray;ArrCo:longint);



implementation

///////////////////////  1EXP ///////////////////


Function LimitationsOK1Exp(g:FitPrmSet):Boolean;
begin
With g do
begin
   LimitationsOK1Exp:=
   (p3>0);
end;//with g
end;// proc


Function Function1Exp(prm:FitPrmSet;x:double):double;
begin
with prm do
begin
Function1Exp:=(p1-p4)*exp(-(x-p2)/p3)+p4;
end;// with
end;// proc


///////// Main procedure
Procedure Fit1Exp(Arr:PDoubleArray;ArrCo:longint);
var g,g0,d:FitPrmSet;
p_start,d_start:FitPrmSet;
ip1,ip2,ip3,ip4:longint;
ip1_,ip2_,ip3_,ip4_:longint;
Itera:longint;
SumDevi_:double;
Best_before:double;

procedure ExpPrmsIniEstimate;
var i:longint; Ampl :double;
begin
// Function1ExpDecay:=(p1-p4)*exp(-(x-p2)/p3))+p4;
With p_start do
begin
// p2 ini x value
p2:=0;
// p4 is value at infinity
p4:=(Arr[ArrCo-3]+Arr[ArrCo-2]+Arr[ArrCo-1])/3;
// p1 ini value at x=p2
p1:=(Arr[0]+Arr[1]+Arr[2]+Arr[ArrCo-3])/3;

ampl:= abs(p1-p4);

{i:=-1;
repeat
inc(i);
until (abs(Arr[i]-p4)<(1/exp(1))*ampl) or (i=ArrCo-1);
 if (i=ArrCo-1) then }
 i:=Arrco div 2;
p3:=i;
end;

  With d_start do
begin
     p1:=p_start.p1*0.2;
     p2:=0; // p_start.p2*0.2;
     p3:=p_start.p3*0.2;
     p4:=p_start.p4*0.2;
end;// with


if prmFixed.p1f then d_start.p1:=0;
if prmFixed.p1f then p_start.p1:=best.p1;


end;// proc


Function SumOfDevi1Exp(g1:FitPrmSet):double;
var i:longint;
DEVI,SUM2:double;
begin
SUM2:=0;
for i:=0 to ArrCo-1 do
 begin
        DEVI:= Arr[i]-Function1Exp(g1,i);
        DEVI:=abs(Devi); // sqr(DEVI);
        SUM2:=SUM2+DEVI;
 end;
SumOfDevi1Exp:=SUM2;
end;


begin
ExpPrmsIniEstimate;
g:=p_start;
// initial estimate of BestSum - zero iteration
BestSum:=SumOfDevi1Exp(g);
Best:=g;
Itera:=0;
g0:=g;
d:=d_start;

Repeat
Inc(Itera);
// decreasing delta
With d do
begin
     p1:=p1*0.5;
     p2:=p2*0.5;
     p3:=p3*0.5;
     p4:=p4*0.5;

end;
ip1_:=0;ip2_:=0;ip3_:=0;ip4_:=0;

Repeat
// moving with same delta
Best_before:=BestSum;
g0:=best;
with g0 do
begin
p1:=p1+ip1_*d.p1;
p2:=p2+ip2_*d.p2;
p3:=p3+ip3_*d.p3;
p4:=p4+ip4_*d.p4;


// start iteration
for ip1:=-1 to 1  do begin g.p1:=p1+d.p1*ip1;
for ip2:=-1 to 1  do begin g.p2:=p2+d.p2*ip2;
for ip3:=-1 to 1  do begin g.p3:=p3+d.p3*ip3;
for ip4:=-1 to 1  do begin g.p4:=p4+d.p4*ip4;


 if LimitationsOK1Exp(g) then
 begin
 SumDevi_:= SumOfDevi1Exp(g);
 if  SumDevi_<BestSum then
    begin
      best:=g; BestSum:= SumDevi_;
      ip1_:=ip1;
      ip2_:=ip2;
      ip3_:=ip3;
      ip4_:=ip4;
     end;
   end;

end;
end;
end;
end;


end; // with g0

until (Best_before=BestSum)
until (itera=10);

end;// proc






//////////////////////// GAUS //////////////////////////////////////



Function LimitationsOKGauss(g:FitPrmSet):Boolean;
begin
With g do
begin
   LimitationsOKGauss:=
   (p3>0) and   (p1>=0);
end;//with g
end;// proc

Function FunctionGauss(prm:FitPrmSet;x:double):double;
begin
with prm do
begin
FunctionGauss:=p1*exp(-0.5*sqr((x-p2)/p3))+p4;
//+p4*exp(-0.5*sqr((x-p5)/p6));
end;// with
end;// proc





Procedure FitGauss(Arr:PDoubleArray;ArrCo:longint);
var g,g0,d:FitPrmSet;
p_start,d_start:FitPrmSet;
ip1,ip2,ip3,ip4:longint;
ip1_,ip2_,ip3_,ip4_:longint;
Itera:longint;
SumDevi_:double;
Best_before:double;

procedure GaussPrmsIniEstimate;
var i:longint;  imax, max,BaseLevel:double;
begin
max:=  Arr[0]; imax:=0;
for i:=1 to ArrCo-1 do
begin
 if Arr[i]>max then
  begin
   imax:=i; max:=Arr[i]
  end;
end;
  BaseLevel:= (Arr[0]+Arr[1]+Arr[2]+Arr[ArrCo-3]+Arr[ArrCo-2]+Arr[ArrCo-1])/6;


With p_start do
begin
     p4:= BaseLevel;
     p1:= max-BaseLevel;
     p2:=iMax;
     p3:=ArrCo/4;
end; // with
  With d_start do
begin
     p1:=p_start.p1*0.2;
     p2:=p_start.p2*0.2;
     p3:=p_start.p3*0.2;
     p4:=p_start.p4*0.2;
end;// with

end;// proc


Function SumOfDeviGauss(g1:FitPrmSet):double;
var i:longint;
DEVI,SUM2:double;
begin
SUM2:=0;
for i:=0 to ArrCo-1 do
 begin
        DEVI:= Arr[i]-FunctionGauss(g1,i);
        DEVI:=abs(Devi); // sqr(DEVI);
        SUM2:=SUM2+DEVI;
 end;
SumOfDeviGauss:=SUM2;
end;


begin
GaussPrmsIniEstimate;
g:=p_start;
// initial estimate of BestSum - zero iteration
BestSum:=SumOfDeviGauss(g);
Best:=g;
Itera:=0;
g0:=g;
d:=d_start;

Repeat
Inc(Itera);
// decreasing delta
With d do
begin
     p1:=p1*0.5;
     p2:=p2*0.5;
     p3:=p3*0.5;
     p4:=p4*0.5;

end;
ip1_:=0;ip2_:=0;ip3_:=0;ip4_:=0;

Repeat
// moving with same delta
Best_before:=BestSum;
g0:=best;
with g0 do
begin
p1:=p1+ip1_*d.p1;
p2:=p2+ip2_*d.p2;
p3:=p3+ip3_*d.p3;
p4:=p4+ip4_*d.p4;


// start iteration
for ip1:=-1 to 1  do begin g.p1:=p1+d.p1*ip1;
for ip2:=-1 to 1  do begin g.p2:=p2+d.p2*ip2;
for ip3:=-1 to 1  do begin g.p3:=p3+d.p3*ip3;
for ip4:=-1 to 1  do begin g.p4:=p4+d.p4*ip4;


 if LimitationsOKGauss(g) then
 begin
 SumDevi_:= SumOfDeviGauss(g);
 if  SumDevi_<BestSum then
    begin
      best:=g; BestSum:= SumDevi_;
      ip1_:=ip1;
      ip2_:=ip2;
      ip3_:=ip3;
      ip4_:=ip4;
     end;
   end;

end;
end;
end;
end;


end; // with g0

until (Best_before=BestSum)
until (itera=10);

end;// proc





end.





