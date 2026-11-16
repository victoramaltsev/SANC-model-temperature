unit UPlot2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls,
  OleCtrls,
  System.Types,
  VCLTee.TeCanvas,
  system.UITypes,
   System.IOUtils,
  //vcfi, {graphsv3,}
//  TeEngine, Series, TeeProcs, Chart,
  checklst, Menus, ComCtrls,
  uMeasure,
  myMath,
  Math,
  uEdit,
  PlotNames, Grids,
  //Outline,
  DirOutln, ShellCtrls, Dialogs,
  Ufit2, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart
  ;




type
  TFPlot = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    CopytoclipboardEMF1: TMenuItem;
    CopytoclipboardWMF1: TMenuItem;
    Chart1: TMenuItem;
    Color1: TMenuItem;
    Grid1: TMenuItem;
    MinorTicks1: TMenuItem;
    EasyChart: TChart;
    StatusBar1: TStatusBar;
    ImportASCIIfiles1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Plot1: TMenuItem;
    ExportToASCII1: TMenuItem;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Edit5: TEdit;
    N2: TMenuItem;
    ExportfragmentX1X2toASCII1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Savefirstmarkedtraceas1: TMenuItem;
    GroupBox1: TGroupBox;
    Edit6: TEdit;
    Button2: TButton;
    CheckBox17: TCheckBox;
    ChartClean1: TMenuItem;
    Button8: TButton;
    PlotNames1: TMenuItem;
    Edit7: TEdit;
    Series1: TFastLineSeries;
    CheckBox1: TCheckBox;
    Button9: TButton;
    Button10: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit8: TEdit;
    WriteCursors1: TMenuItem;
    CursorsForm1: TMenuItem;
    ReloadASCIIfiles1: TMenuItem;
    Memo1: TMemo;
    ShowFnames1: TMenuItem;
    N3: TMenuItem;
    Button13: TButton;
    Button14: TButton;
    Undo1: TMenuItem;
    CreateUndo1: TMenuItem;
    Undo2: TMenuItem;
    ClearBuffer1: TMenuItem;
    Memo2: TMemo;
    Label3: TLabel;
    Edit9: TEdit;
    Button15: TButton;
    ools1: TMenuItem;
    CorrectBaseX1X21: TMenuItem;
    IntegralX1X21: TMenuItem;
    NewPlotsIntegral1: TMenuItem;
    AddY11: TMenuItem;
    MeanX1X21: TMenuItem;
    ShowSlopes1: TMenuItem;
    CreateSlopePlots1: TMenuItem;
    Fit1ExpDecayX1X21: TMenuItem;
    FitGaussX1X21: TMenuItem;
    Button20: TButton;
    Fit2ExpPeakX1X21: TMenuItem;
    Button22: TButton;
    Edit10: TEdit;
    resamplingstartfrom0andup1: TMenuItem;
    dydx1: TMenuItem;
    Subtracttraces1: TMenuItem;
    SubtracttracesREVERSE1: TMenuItem;
    Addtraces1: TMenuItem;
    ScaleY11: TMenuItem;
    RemovedUnchecked1: TMenuItem;
    Button23: TButton;
    Button24: TButton;
    Edit11: TEdit;
    Button25: TButton;
    Button26: TButton;
    Edit12: TEdit;
    Button27: TButton;
    Button28: TButton;
    Edit13: TEdit;
    RadioGroup2: TRadioGroup;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    PanelBorder1: TMenuItem;
    Button34: TButton;
    Import1XmultipleY1: TMenuItem;
    Edit14: TEdit;
    Label4: TLabel;
    AppendFiles1: TMenuItem;
    Edit16: TEdit;
    Label6: TLabel;
    XScale1: TMenuItem;
    LoadAutocorrelationClampFit1: TMenuItem;
    CheckBox2: TCheckBox;
    Button45: TButton;
    Edit26: TEdit;
    Divide2tracesFF01: TMenuItem;
    CheckBox4: TCheckBox;
    Button48: TButton;
    Label17: TLabel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Edit17: TEdit;
    Label9: TLabel;
    Edit19: TEdit;
    SavetracesinExcel1: TMenuItem;
    Edit15: TEdit;
    Label5: TLabel;
    Edit18: TEdit;
    Button11: TButton;
    Button12: TButton;
    Edit20: TEdit;
    Label8: TLabel;
    Button36: TButton;
    Button37: TButton;
    Edit23: TEdit;
    Edit24: TEdit;
    GroupBox2: TGroupBox;
    Button21: TButton;
    Button35: TButton;
    Edit21: TEdit;
    Edit22: TEdit;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Button38: TButton;
    Button39: TButton;
    Edit25: TEdit;
    Button40: TButton;
    Edit27: TEdit;
    LoadATF1: TMenuItem;
    Label10: TLabel;
    Edit28: TEdit;
    Label11: TLabel;
    Edit29: TEdit;
    Series2: TPointSeries;
    Series3: TPointSeries;
    Series4: TLineSeries;
    GroupBox4: TGroupBox;
    Button42: TButton;
    Button43: TButton;
    Button46: TButton;
    Button41: TButton;
    Edit30: TEdit;
    Button47: TButton;
    Normalize1: TMenuItem;
    FFminFmaxFmin1: TMenuItem;
    FFmin1: TMenuItem;
    FFmean1: TMenuItem;
    Button7: TButton;
    Button6: TButton;
    Button16: TButton;
    Button3: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button5: TButton;
    Button4: TButton;
    Button44: TButton;
    Button49: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Color1Click(Sender: TObject);
    procedure Grid1Click(Sender: TObject);
    procedure MinorTicks1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure EasyChartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EasyChartClick(Sender: TObject);
    procedure CopytoclipboardEMF1Click(Sender: TObject);
    procedure CopytoclipboardWMF1Click(Sender: TObject);
    procedure ImportASCIIfiles1Click(Sender: TObject);
    procedure Plot1Click(Sender: TObject);
    procedure ExportToASCII1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EasyChartAfterDraw(Sender: TObject);
    procedure EasyChartScroll(Sender: TObject);
    procedure ExportfragmentX1X2toASCII1Click(Sender: TObject);
    procedure Savefirstmarkedtraceas1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ChartClean1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure PlotNames1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure WriteCursors1Click(Sender: TObject);
    procedure CursorsForm1Click(Sender: TObject);
    procedure ReloadASCIIfiles1Click(Sender: TObject);
    procedure ShowFnames1Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure CreateUndo1Click(Sender: TObject);
    procedure Undo2Click(Sender: TObject);
    procedure ClearBuffer1Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure CorrectBaseX1X21Click(Sender: TObject);
    procedure IntegralX1X21Click(Sender: TObject);
    procedure AddY11Click(Sender: TObject);
    procedure MeanX1X21Click(Sender: TObject);
    procedure Fit1ExpDecayX1X21Click(Sender: TObject);
    procedure FitGaussX1X21Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Fit2ExpPeakX1X21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure dydx1Click(Sender: TObject);
    procedure Subtracttraces1Click(Sender: TObject);
    procedure SubtracttracesREVERSE1Click(Sender: TObject);
    procedure Addtraces1Click(Sender: TObject);
    procedure ScaleY11Click(Sender: TObject);
    procedure RemovedUnchecked1Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure PanelBorder1Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Import1XmultipleY1Click(Sender: TObject);
    procedure AppendFiles1Click(Sender: TObject);
    procedure XScale1Click(Sender: TObject);
    procedure LoadAutocorrelationClampFit1Click(Sender: TObject);
    procedure Divide2tracesFF01Click(Sender: TObject);
    procedure Button45Click(Sender: TObject);
    procedure Button48Click(Sender: TObject);
    procedure SavetracesinExcel1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure LoadATF1Click(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure Button46Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Button47Click(Sender: TObject);
    procedure Button43Click(Sender: TObject);
    procedure FFminFmaxFmin1Click(Sender: TObject);
    procedure FFmin1Click(Sender: TObject);
    procedure FFmean1Click(Sender: TObject);
    procedure Button44Click(Sender: TObject);
    procedure Button49Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlot: TFPlot;




var
Test_boo:boolean;

var
SVx1,   SVx2,   SVy1,   SVy2:double;  // save plot area parameters

var ItemsOutCount1:longint;

{
type
 DoubleArray =  array[0..$effffff] of double; // $effffff= 251,658,239
 PDoubleArray   = ^DoubleArray;

const MaxNumberOfPlots2 = 10001;
}

// undo
var
Undo_ItemsOutCount1:longint;
Undo_DatX, Undo_DatY:array[1..MaxNumberOfPlots2] of PDoubleArray;
Undo_Count1:array[1..MaxNumberOfPlots2] of longint;



// colors
const
Red1=  $00000001;
Green1=$00000100;
Blue1= $00010000;

// pureBlue=$00FF0000;
// pureGreen=$0000FF00;
// pureRed=$000000FF;

const
MyMaxDefaultColors=22;
MyColorPalette : Array[1..MyMaxDefaultColors] of TColor =
(clRed,   // 1
clGreen, // 2
// clYellow, // 3
clBlue,   // 3
clMaroon, // 4 (old 10)
clTeal,  // 5 old 13

clDkGray,  // 6
// clGray, // so=so
clFuchsia, // 7
0*Red1+102*Green1+255*Blue1, // clLime,   // 8
clNavy,   // 9
// clMaroon,  // 10
clYellow, // 10 (old 3)

clLime,   // 11
clOlive,  // 12
153*Red1+102*Green1+51*Blue1, //clWhite,  // 13 old 5
clAqua,  // 14
clBlack, // 15

// 255*Red1+0*Green1+0*Blue1, //  pure red
// 0*Red1+255*Green1+0*Blue1, //  pure green
// 0*Red1+0*Green1+255*Blue1 //  pure blue

0*Red1+196*Green1+255*Blue1, // 16 blue
180*Red1+0*Green1+255*Blue1, // 17 violet
180*Red1+21*Green1+75*Blue1, // 18 cherry
255*Red1+175*Green1+0*Blue1, // 19 brick
80*Red1+245*Green1+250*Blue1, // 20 bright navy
85*Red1+255*Green1+0*Blue1, // 21 isumrud
98*Red1+0*Green1+250*Blue1 // 22 blue-violet

);


var
// Fast Line Series
FLS: array[1..MaxNumberOfPlots2] of TFastLineSeries;
FLS_save: TFastLineSeries;

Type CursType = record
X1,
X2,
Y1,
Y2,
Y3: Double;
end;
var Curs, OldCurs: CursType;

procedure ShowSlope(i1,i2:longint;DDslope, DDoffset:double);
Procedure DrawLine(x1v,y1v,x2v,y2v:double;Color2:TColor);

Procedure PlotFvsT;
procedure DrawSmallCross(x1v,y1v:double; wi:integer;PenColor1:TColor);
function ConvertYvaltoYint(Yval:double):longint;
function ConvertXvaltoXint(Xval:double):longint;
Procedure SetPen(PenColor1:TColor);
Procedure AddNewName(NewName:string);
Procedure Add1XYToPlot(x,y:double);
// Procedure Add1XYToPlot(index1:integer; x,y:double);
Procedure RefreshCursors;
Procedure WriteFvsTtoASCIIfiles;
Procedure ChartClean;
Procedure DrawYLine(y1v:double;PenColor1:TColor);
Procedure DrawXLine(x1v:double;PenColor1:TColor);
Function OutputDirectoryFind:string;
Procedure Filter1trace(j:integer);
procedure ImportASCIIfile1(Fn:string);

Function FirstMarkedTrace: integer;
procedure DrawSquare(x1v,y1v, x2v,y2v:double; PenColor1:TColor);


var
CurrentFolderName: string;
BatchProcessing: boolean;
BatchProcessingi: integer;


implementation

{$R *.DFM}



var

//

ItemsOutCount1_ini_fit_decays:integer;

// vars for cursors
   OldX,OldY:Longint;
   CrossHairColor:TColor;
   CrossHairStyle:TPenStyle;
//   MouseXVal, MouseYVal:single;
   tmpX,tmpY:Double;


Function FirstMarkedTrace: integer;
var j: integer;

begin
if BatchProcessing then
  begin
     FirstMarkedTrace:=BatchProcessingi;
  exit;
  end;

 if ItemsOutCount1=0 then exit;
 for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
 begin
   result:= j;
   exit;
 end;
 result:=0;
end;

Procedure Filter1trace(j:integer);
var  iTotal, NumbOfCoeff, i:longint;
CutOffFreq1,Rate1, Period1:double;
DataArray1:PDoubleArray;
MovingAverageWindow_ms:double;
MovingAverageWindow_i:integer;
FilterType1:integer;

begin
 CutOffFreq1:=StrToFloat(Fplot.Edit6.text);
 MovingAverageWindow_ms:= 1000/CutOffFreq1;
  iTotal:=FLS[j].Count;
  getmem(DataArray1,iTotal*sizeof(double));
  for i:=0 to iTotal-1 do DataArray1[i]:= FLS[j].YValues.Value[i];
  Period1:= FLS[j].XValues.Value[2]-FLS[j].XValues.Value[1];

  if Fplot.CheckBox17.Checked then Rate1:=1000/Period1 else Rate1:=1/Period1;
  MovingAverageWindow_i:=round(MovingAverageWindow_ms/(1000/Rate1));
  FilterType1:= FPlot.RadioGroup2.ItemIndex;

Case FilterType1 of
   0:GausFilter1(DataArray1,  CutOffFreq1, Rate1,  0, iTotal-1,iTotal, 2,  NumbOfCoeff);
   1: MovingAverage1(DataArray1, MovingAverageWindow_i, 0, iTotal-1, iTotal, 2);
  end;// case
  for i:=0 to iTotal-1 do FLS[j].YValues.Value[i]:=DataArray1[i];
  FLS[j].Repaint;
  freemem(DataArray1);
end;




Procedure Add1XYToPlot(x,y:double);
begin
   FLS[ItemsOutCount1].AddXY(x, y); //,'',clTeeColor);
end;



function ConvertYvaltoYint(Yval:double):longint;
begin
   ConvertYvaltoYint:=FPlot.EasyChart.LeftAxis.CalcPosValue(yval);
end;

function ConvertXvaltoXint(Xval:double):longint;
begin
   ConvertXvaltoXint:=FPlot.EasyChart.BottomAxis.CalcPosValue(xval);
end;

Procedure SetPen(PenColor1:TColor);
begin
with Fplot, EasyChart,Canvas do
begin
      Pen.Style:=psSolid; // //psDash;// psDot; //
      Pen.Color:=PenColor1;
      Pen.Mode:=pmNotXor; // pmCopy;  // //PenMode1; // pmBlack; //pmXor;// pmNotXor; //
      Pen.Width:=1;
end;// with
end;






procedure DrawSquare(x1v,y1v, x2v,y2v:double; PenColor1:TColor);
var x1,y1, x2, y2:longint;
begin
x1:=ConvertXvaltoXint(X1v);
y1:=ConvertYvaltoYint(Y1v);
x2:=ConvertXvaltoXint(X2v);
y2:=ConvertYvaltoYint(Y2v);

with Fplot, EasyChart,Canvas do
begin
      Pen.Style:=psSolid; //psDash;// psDot; //
      Pen.Color:=PenColor1;
//http://delphiprogrammingdiary.blogspot.com/2019/03/drawing-shapes-in-delphi.html
      Pen.Mode:=pmCopy;  // //PenMode1; // pmBlack; //pmXor;// pmNotXor; //
      Pen.Width:=2;

      MoveTo(x1,y1);

      LineTo(x1,y2);
      LineTo(x2,y2);
      LineTo(x2,y1);
      LineTo(x1,y1);

//      Rectangle(x1,y1, x2, y2);

end; // with
end;


procedure DrawSmallCross(x1v,y1v:double; wi:integer;PenColor1:TColor);

var x1,y1:longint;
begin
x1:=ConvertXvaltoXint(X1v);
y1:=ConvertYvaltoYint(Y1v);
with Fplot, EasyChart,Canvas do
begin
      Pen.Style:=psSolid; //psDash;// psDot; //
      Pen.Color:=PenColor1;
      Pen.Mode:=pmCopy;  // //PenMode1; // pmBlack; //pmXor;// pmNotXor; //
      Pen.Width:=2;

      MoveTo(x1,y1-wi);
      LineTo(x1,y1+wi);
      MoveTo(x1-wi,y1);
      LineTo(x1+wi,y1);
end; // with
end;

Procedure DrawXLine(x1v:double;PenColor1:TColor);
var x1:longint;
begin
x1:=ConvertXvaltoXint(X1v);
      SetPen(PenColor1);
with FPlot, EasyChart,Canvas do
begin
      MoveTo(x1,ChartRect.Top);
      LineTo(x1,ChartRect.Bottom);
end; // with
end;




Procedure DrawYLine(y1v:double;PenColor1:TColor);
var y1:longint;
begin
y1:=ConvertYvaltoYint(Y1v);
      SetPen(PenColor1);
with FPlot, EasyChart,Canvas do
begin
      MoveTo(ChartRect.Left,y1);
      LineTo(ChartRect.Right,y1);
end; // with
end;


Procedure FindCursorValues;
begin
With Curs do
begin
X1:=StrToFloat(FPlot.Edit1.Text);
X2:=StrToFloat(FPlot.Edit2.Text);
Y1:=StrToFloat(FPlot.Edit3.Text);
Y2:=StrToFloat(FPlot.Edit4.Text);
Y3:=StrToFloat(FPlot.Edit5.Text);
end;
end;


Procedure DrawCursors(Curs1:CursType);
begin
With Curs1 do
begin
DrawXLine(x1, ClBlue);
DrawXLine(x2, clRed);
DrawYLine(y1, clBlue);
DrawYLine(y2, clRed);
DrawYLine(y3, clBlack);
end; // with
end;

Procedure RefreshCursors;
begin
FindCursorValues;
DrawCursors(OldCurs); //pmXor;// pmNotXor; //
// PlotFvsT;
DrawCursors(Curs); // pmCopy // ,pmNotXor
 OldCurs:=Curs;
// FPlot.RadioGroup1.ItemIndex:=0;
end;

procedure TFPlot.Button1Click(Sender: TObject);
begin
 RefreshCursors;
end;


Procedure PlotFvsT;
var
j:longint;
begin
//FPlot.Visible:=true;
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
    FLS[j].Active:=true;
    PNam[j].PStr.Font.Color:=FLS[j].SeriesColor;
    PNam[j].PStr.Font.Style:=[fsBold];
end
else
begin // regular (black, not bold) text for names of hidden plots
FLS[j].Active:=false;
    PNam[j].PStr.Font.Color:=clWindowText;
    PNam[j].PStr.Font.Style:=[];
end;
RefreshCursors;
// Beep;
end; // proc


Procedure ShowAllPrmsValues(Xstr:string);
var i,j:longint; Xfloat:double; s:string;
begin
 // find x index
With FPlot do
begin
StatusBar1.Panels[3].Text:='t= '+   Xstr;
 Xfloat:=StrToFloat(Xstr);
      for j:=1 to ItemsOutCount1 do
      begin
        i:=-1;
        repeat
        inc(i);
        until (i>=FLS[j].Count-1)
        or (FLS[j].XValues.Value[i]>=Xfloat)  // plot lays at the left side
        or (Xfloat < FLS[j].XValues.Value[1]);// plot lays at the right side
      if (i=FLS[j].Count-1) or (Xfloat < FLS[j].XValues.Value[1]) then s:='ND' else
      s:=FloatToStrF(FLS[j].YValues.Value[i],ffGeneral,6,6);
       PNam[j].PVal.Caption:=s;
      end; // for
end;// with
fPlotNames.BringToFront;
end;


Function NoCommas(s:string):string;
var s1:string; i:integer;
begin
   s1:=''; for i:=1 to length(s) do
   if s[i]<>',' then s1:=s1+s[i];// remove commas
   NoCommas:=s1;
end;



//==========================================================
procedure TFPlot.FormCreate(Sender: TObject);
begin


//  set cursors properties
  Series1.Clear;
  EasyChart.Cursor:=crCross;
  OldX:=-1;                          { initialize variables }
  CrossHairColor:=clPurple;
//clRed;//clGreen; //clLime; // ClYellow;//
//clLime;//clFuchsia;// clAqua;// clGreen;//clPurple; //  clYellow; // Yellow;
  CrossHairStyle:=psSolid;
  ItemsOutCount1 :=0;
  MEMO1.Clear;
  Test_boo:=false;
 ItemsOutCount1_ini_fit_decays:=-1; // decays never fitted
 BatchProcessing:= false;
 BatchProcessingi:=0;
end;



Procedure ZoomPercent(XLeft, XRight, YBottom, YTop:double);
var x1,x2,y1,y2,DeltaX, DeltaY : double;
begin
With  FPlot.EasyChart do
begin
   x1:=bottomaxis.minimum;
   x2:=bottomaxis.maximum;
   y1:=LeftAxis.Minimum;
   y2:=LeftAxis.maximum;
    DeltaX:=x2-x1;
    DeltaY:=y2-y1;

 bottomaxis.Automatic:=false;
 LeftAxis.Automatic:=false;
 x1:=x1+DeltaX*XLeft/100;
 x2:=x2-DeltaX*XRight/100;
 if x1<x2 then
 begin
 bottomaxis.minimum:=x1;
 bottomaxis.maximum:=x2;
 end;

 y1:=y1+DeltaY*YBottom/100;
 y2:=y2-DeltaY*YTop/100;
 if y1<y2 then
 begin
 LeftAxis.Minimum:=y1;
 LeftAxis.maximum:=y2;
 end;
end;// with
end;


procedure TFPlot.Button16Click(Sender: TObject);

begin
// Yscale/2  (Zoom)
ZoomPercent(0, 0, 0, 50);
{
 EasyChart.bottomaxis.Automatic:=false;
With EasyChart.LeftAxis  do
begin
 Automatic:=false;
 delta:= maximum-minimum;
 maximum:=minimum+delta/2
end;// with
}
end;// proc


procedure TFPlot.Button3Click(Sender: TObject);
begin
// Yscale*2   (Unzoom)
ZoomPercent(0, 0, 0, -100);
{
 EasyChart.bottomaxis.Automatic:=false;
With  EasyChart.LeftAxis do
begin
 Automatic:=false;
 delta:= maximum-minimum;
// if Series1.MaxYValue>minimum+2*delta then
   maximum:=minimum+2*delta
   // else
//   maximum:=Series1.MaxYValue;
end;// with
}
end;// proc






procedure TFPlot.Button6Click(Sender: TObject);
begin
// X scale div 2  (Zoom)
ZoomPercent(0, 50, 0, 0);
{
 EasyChart.LeftAxis.Automatic:=false;
With  EasyChart.bottomaxis do
begin
 Automatic:=false;
 delta:= maximum-minimum;
 maximum:=minimum+delta/2
end;// with
}
end;// proc


procedure TFPlot.Button7Click(Sender: TObject);
begin
// X scale x 2 (UnZoom)
ZoomPercent(0, -100, 0, 0);
{
if ItemsOutCount1<=0 then exit;
// EasyChart.LeftAxis.Automatic:=false;
With  EasyChart.bottomaxis do
begin
 Automatic:=false;
 delta:= maximum-minimum;
 if FLS[1].MaxXValue>minimum+2*delta then
   maximum:=minimum+2*delta else
   maximum:=FLS[1].MaxXValue;
end;// with
}
end;// proc




procedure TFPlot.Color1Click(Sender: TObject);
begin
// change chart color
if Color1.Checked then
EasyChart.Color:=clWhite else
EasyChart.Color:=clBtnFace; // clGray;
Color1.Checked:=not Color1.Checked;
end;

procedure TFPlot.Grid1Click(Sender: TObject);
begin
// grid
if Grid1.Checked then
EasyChart.LeftAxis.Grid.Visible:=false else
EasyChart.LeftAxis.Grid.Visible:=true;
if Grid1.Checked then
EasyChart.BottomAxis.Grid.Visible:=false else
EasyChart.BottomAxis.Grid.Visible:=true;
Grid1.Checked:=not Grid1.Checked;
end;


procedure TFPlot.MinorTicks1Click(Sender: TObject);
begin
// minor ticks
if MinorTicks1.Checked then
EasyChart.LeftAxis.MinorTicks.Visible:=false else
EasyChart.LeftAxis.MinorTicks.Visible:=true;

if MinorTicks1.Checked then
EasyChart.BottomAxis.MinorTicks.Visible:=false else
EasyChart.BottomAxis.MinorTicks.Visible:=true;
MinorTicks1.Checked:=not MinorTicks1.Checked;
end;




procedure TFPlot.Button4Click(Sender: TObject);
begin
// display 1:1
 EasyChart.bottomaxis.Automatic:=true;
 EasyChart.LeftAxis.Automatic:=true;
 EasyChart.UndoZoom;
end;


procedure TFPlot.Button5Click(Sender: TObject);
begin
// undo zoom
 EasyChart.UndoZoom;
end;


  Procedure DrawCross(AX,AY:Integer);
  begin
    With FPlot, EasyChart, Canvas do
    begin
      Pen.Color:= CrossHairColor;
      Pen.Style:=CrossHairStyle;
      Pen.Mode:=pmNotXor; //	pmXor;
      Pen.Width:=1;
      MoveTo(ax,ChartRect.Top);
      LineTo(ax,ChartRect.Bottom);
      MoveTo(ChartRect.Left,ay);
      LineTo(ChartRect.Right,ay);
    end;
  end;


procedure TFPlot.EasyChartMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
// Mouse running routine
{ This procedure draws the crosshair lines }


begin
  if (OldX<>-1) then
  begin
    DrawCross(OldX,OldY);  { draw old crosshair }
    OldX:=-1;
  end;

  { check if mouse is inside Chart rectangle }
  if PtInRect(EasyChart.ChartRect, Point(X,Y)  ) then
  begin
    DrawCross(x,y);  { draw crosshair at current position }
    { store old position }
    OldX:=x;
    OldY:=y;
    { set label text }
    With Series1 do
    begin
      GetCursorValues(tmpX,tmpY);  { <-- get values under mouse cursor }
    StatusBar1.Panels.Items[1].text :='x='+GetHorizAxis.LabelValue(tmpX);
    StatusBar1.Panels.Items[2].text :='y='+GetVertAxis.LabelValue(tmpY);
    end; // with
  end; // if PtInRect
end;  // proc


procedure TFPlot.EasyChartClick(Sender: TObject);
var sX,sY:string;
begin
 if ItemsOutCount1=0 then exit;
   sX:=Series1.GetHorizAxis.LabelValue(tmpX);
   sX:=NoCommas(sX);
   sY:=Series1.GetVertAxis.LabelValue(tmpY);
   sY:=NoCommas(sY);
    // input data just by clicking X-Y
 if CheckBox2.Checked then
  begin
      Add1XYToPlot(tmpx,tmpy);
  end;

if   RadioGroup1.ItemIndex<1 then ShowAllPrmsValues(sX) else
begin
// update and show a particular cursor
Case RadioGroup1.ItemIndex of
   1: Edit1.Text:=sX;
   2: Edit2.Text:=sX;
   3: Edit3.Text:=sY;
   4: Edit4.Text:=sY;
   5: Edit5.Text:=sY;
end;
RefreshCursors;
RadioGroup1.Items.Clear;
RadioGroup1.Items.add('None');
RadioGroup1.Items.add('X1');
RadioGroup1.Items.add('X2');
RadioGroup1.Items.add('Y1');
RadioGroup1.Items.add('Y2');
RadioGroup1.Items.add('Y3');
RadioGroup1.ItemIndex:=0;
end;

end;


procedure TFPlot.CopytoclipboardEMF1Click(Sender: TObject);
begin
   EasyChart.CopyToClipboardMetafile(True);
end;


procedure TFPlot.CopytoclipboardWMF1Click(Sender: TObject);
begin
     EasyChart.CopyToClipboardMetafile(False);
end;



Procedure AddNewName(NewName:string);
var Colori:integer;

{function divexact3(x:integer):integer;
begin
 if x mod 3 >0 then divexact3:=0 else divexact3:=1;
// divexact3:=abs(sign (x mod 3) -1);
end;
}
{
ColorPalette : Array[1..MaxDefaultColors] of TColor =
(clRed, clGreen, clYellow, clBlue, clWhite, clGray, clFuchsia, clTeal, clNavy, clMaroon, clLime, clOlive, clPurple, clSilver, clAqua, clBlack);
}

var left3,left1, left2, incY, Topi:integer;

begin
      inc(ItemsOutCount1);

FLS[ItemsOutCount1]:=TFastLineSeries.Create(fPlot);
Colori:=((ItemsOutCount1-1) Mod MyMaxDefaultColors)+1;

FLS[ItemsOutCount1].SeriesColor:= MyColorPalette[Colori];
FLS[ItemsOutCount1].LinePen.Width:=StrToInt(Fplot.Edit12.Text);

//  pureRed*   divexact3(ItemsOutCount1+2)+
//  pureGreen* divexact3(ItemsOutCount1+1)+
//  pureBlue*  divexact3(ItemsOutCount1)
// + ((ItemsOutCount1-1) div 3)*8;
// clTeeColor;
FLS[ItemsOutCount1].ParentChart:=FPlot.EasyChart;

      left1:=0;left2:=20; left3:=244; incY:=16;
      Topi:=  (ItemsOutCount1-1)*incY;

with  PNam[ItemsOutCount1] do
begin

// create checkBox
      PCheck:=TCheckBox.Create(fPlotNames);
      PCheck.Parent:=fPlotNames;
      PCheck.Caption:='';
      PCheck.Checked:=true;
      PCheck.left:=left1;
      PCheck.top:=Topi;
      PCheck.width:=15;
      PCheck.height:=17;

// create plotNamestring
      PStr:=TLabel.Create(fPlotNames);
      PStr.Parent:=fPlotNames;
      PStr.left:=left2;
      PStr.top:=Topi;
      PStr.width:=24;
      PStr.height:=13;
      PStr.Caption:= NewName;
      PStr.Font.Color:= FLS[ItemsOutCount1].SeriesColor;
      PStr.Font.Style:=[fsBold];

// create value string
      PVal:=TLabel.Create(fPlotNames);
      PVal.Parent:=fPlotNames;
      PVal.left:=left3;
      PVal.top:=Topi;
      PVal.width:=24;
      PVal.height:=13;
      PVal.Caption:= '';
      PVal.Font.Color:= ClWindowText;

end;  // with Pnam

//    FPlot.Visible:=true;
//    FPlot.BringToFront;
//    fPlotNames.Visible:=true;
//    fPlotNames.BringToFront;
 FPlot.label8.Caption:= inttostr(ItemsOutCount1);

end;





procedure ImportASCIIfile1(Fn:string);
var F:textFile; s1, s2, s:string; DelimCh:char;
var x, y:double;
colX1, colY1: integer;
Procedure Add1point;
begin
          //s1:= CharStr(delimCh, s, 1);
          //s2:= CharStr(delimCh, s, 2);
          s1:= CharStr(delimCh, s, colX1);
          s2:= CharStr(delimCh, s, colY1);
         if TryStrToFloat(s1,x) and TryStrToFloat(s2,y) then
         FLS[ItemsOutCount1].AddXY(x, y,'',clTeeColor);
end;

begin
if not FileExists(Fn) then exit;
    AssignFile(F,Fn);
    Reset(F);
    colX1:= strtoint(fPlot.Edit28.Text);
    colY1:= strtoint(fPlot.Edit29.Text);
   CurrentFolderName:= ExtractFilePath(Fn);

//    co:=0;
    While not eof(F) do
    begin
      readln(F,s);
      if Pos(#9,s)<>0 then   // tab deliminated
        begin
          DelimCh:=#9;
          Add1point;
        end
        else
      if Pos(',', s)<>0 then // coma deliminated
        begin
         DelimCh:=',';
         Add1point;
        end
        else
      if Pos(' ', s)<>0 then // space deliminated
        begin
         RemoveExtraSpaces(s);
         DelimCh:=#9;
         Add1point;
        end;

//     {$I-}
//    readln(F, x, y);
//    {$I+}
//    if IOResult = 0 then
//     begin
//     FLS[ItemsOutCount1].AddXY(x, y,'',clTeeColor);
//     end; // if ioresult
    end; // while
    CloseFile(F);
end;



procedure ImportASCIIfileN(Fn:string; Xcol, FileCount, skiplines:integer; DelimCh:char);
var F:textFile; s1, s2, s:string;
var x, y:double;
StrIndex, i:longint;

Procedure Add1point(FileIndex:integer);
begin
         inc(StrIndex);
         s2:= CharStrStart(delimCh, s, 1, StrIndex);
         if TryStrToFloat(s2,y) then
         FLS[ItemsOutCount1-(FileCount-FileIndex)].AddXY(x, y,'',clTeeColor);
end;

begin
if not FileExists(Fn) then exit;
    AssignFile(F,Fn);
    Reset(F);
    for i:=1 to skiplines do readln(F,s);
//    co:=0;
    While not eof(F) do
    begin
      readln(F,s);
      StrIndex:=1;
      s1:= CharStrStart(delimCh, s, Xcol, StrIndex);
      if  TryStrToFloat(s1,x) then
      for i:=1 to FileCount do
         begin
            Add1point(i);
         end; // for i
    end; // while
    CloseFile(F);
end;







procedure TFPlot.ImportASCIIfiles1Click(Sender: TObject);
var i, imax :longint; Fn:string;

begin
// import ASCII files
OpenDialog1.Options := [ofAllowMultiSelect]; //      ofFileMustExist
//  OpenDialog1.InitialDir:='C:\';
  OpenDialog1.Filter:=
   'Text and Excel files (*.txt;*.csv)|*.txt;*.csv';
//  'All files (*.*)|*.*|Text files (*.txt)|*.txt|Excel files (*.csv)|*.csv';

  if OpenDialog1.Execute then
 begin
  imax:= OpenDialog1.Files.Count;
  if imax+ItemsOutCount1>MaxNumberOfPlots2 then imax:= MaxNumberOfPlots2-ItemsOutCount1;
  for i:=0 to imax-1 do
   begin
    Fn:=OpenDialog1.Files[i];
    AddNewName(ExtractFileName(Fn));
    ImportASCIIfile1(Fn);
    memo1.lines.Add(OpenDialog1.Files[i])
   end; // for i
 end;// if
end;// proc


procedure TFPlot.Plot1Click(Sender: TObject);
begin
PlotFvsT;
 FPlot.label8.Caption:= inttostr(ItemsOutCount1);
end;


Function FindXi(ArrayIndex:longint; Xcross:double):longint;
var i:longint;  x:double;
begin
i:=0;
x:= FLS[ArrayIndex].XValues.Value[i];

if Xcross<= x then
  begin
   FindXi:=0; exit
  end;
repeat inc(i); until
(FLS[ArrayIndex].XValues.Value[i] >=Xcross)
or  (i>= FLS[ArrayIndex].Count-1);
FindXi:=i;
end; // proc


Function OutputDirectoryFind:string;
var dir1:string;
begin
dir1:=Fplot.Edit8.Text;
dir1:=IncludeTrailingPathDelimiter(dir1);
Fplot.Edit8.Text:=dir1;
if not DirectoryExists(dir1) then
begin
 if not CreateDir(dir1) then dir1:='C:\';
end;
  OutputDirectoryFind:=dir1;
end;

Procedure WriteX1X2FragmentToASCIIfiles(x1,x2:double);
// export fragments between cursors X1 and X2 to ASCII files
var i,j:longint; F:textfile; dir1,s:string;   x,y:double;
begin
// if (NofPoints<=0) then exit;
dir1:=OutputDirectoryFind;
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin // write plot to ASCII

//   s:=  ExtractFileNameWithoutExtention(PNam[j].PStr.Caption);
 //  s:=dir1+FPlot.Edit7.Text+ ChangeFileExt(PNam[j].PStr.Caption,'.txt');
  s:= PNam[j].PStr.Caption;
  s:= Tpath.GetFileNameWithoutExtension(s);


if Fplot.CheckBox1.Checked then

    s:=dir1+ s+ FPlot.Edit7.Text  + '.txt'
       else
    s:=dir1+ FPlot.Edit7.Text  + s+ '.txt';


    AssignFile(F,s);
    rewrite(F);
for i:=FindXi(j, x1) to FindXi(j, x2) do
 Begin
         x:= FLS[j].XValues.Value[i];
         y:= FLS[j].YValues.Value[i];
         Writeln(F,x:3:6,#9,y:3:6);
 end; // for i
CloseFile(F);
end; // if checked
end; // proc



Procedure WriteFvsTtoASCIIfiles;
// export traces f(t) to ASCII
var i,j:longint; F:textfile; s,dir1:string;
x,y:double;
begin
// if (NofPoints<=0) then exit;
  dir1:=OutputDirectoryFind;

for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin // write plot to ASCII
//  s:=  ExtractFileNameWithoutExtention(PNam[j].PStr.Caption);
  s:= PNam[j].PStr.Caption;
  s:= Tpath.GetFileNameWithoutExtension(s);

   //    directory exist
if Fplot.CheckBox1.Checked then

    s:=dir1+ s+ FPlot.Edit7.Text  + '.txt'
       else
    s:=dir1+ FPlot.Edit7.Text  + s+ '.txt';

    AssignFile(F,s);
    rewrite(F);
//for i:=1 to PlotNSamples[j] do
for i:=0 to FLS[j].Count-1 do
 Begin
         x:= FLS[j].XValues.Value[i];
         y:= FLS[j].YValues.Value[i];
   Writeln(F,x:9:9,#9,y:9:9);
 end; // for i
CloseFile(F);
end; // if checked
end; // proc



procedure TFPlot.ExportToASCII1Click(Sender: TObject);
begin
WriteFvsTtoASCIIfiles;
end;


procedure TFPlot.EasyChartAfterDraw(Sender: TObject);
begin
DrawCursors(OldCurs);
DrawCross(OldX,OldY);  { draw old crosshair }
end;

procedure TFPlot.EasyChartScroll(Sender: TObject);
begin
DrawCursors(OldCurs);
end;




procedure TFPlot.ExportfragmentX1X2toASCII1Click(Sender: TObject);
begin
with Curs do
begin
  if (x1=0) and (x2=0) then exit;
  WriteX1X2FragmentToASCIIfiles(x1,x2);
end;// with
end;



procedure TFPlot.Savefirstmarkedtraceas1Click(Sender: TObject);
// save first marked trace as
var i,j:longint; F:textfile; s:string;  x,y:double;
begin

With SaveDialog1 do
begin

// if (NofPoints<=0) then exit;
for j:=1 to ItemsOutCount1 do

begin
if Pnam[j].PCheck.Checked then
begin // write plot to ASCII
    s:=ChangeFileExt(PNam[j].PStr.Caption,'.txt');
      SaveDialog1.FileName:=s;

if SaveDialog1.Execute then
   begin
    s:=SaveDialog1.FileName;
    AssignFile(F,s);
    rewrite(F);

     for i:=0 to FLS[j].Count-1 do
 Begin
         x:= FLS[j].XValues.Value[i];
         y:= FLS[j].YValues.Value[i];
         Writeln(F,x:3:6,#9,y:3:6);
 end; // for i

CloseFile(F);
exit;
end; // if SaveDialog1.Execute

end; // if checked

end; // for j

end;// with SaveDialog1
end;//








procedure TFPlot.SavetracesinExcel1Click(Sender: TObject);
var Linei, i,j:longint; F:textfile; s,s_TAB, dir1:string;
Data_Yes_Boo: boolean;
N_TAB: integer;
x,y:double;

begin
// save in Excel
if ItemsOutCount1<1 then exit;

s_TAB:='';
N_TAB:= StrToInt(Edit15.Text);
for i:=1 to N_TAB do s_TAB:= s_TAB+#9;

  dir1:=OutputDirectoryFind;
  s:=dir1+ FPlot.Edit7.Text  + '.txt';

    AssignFile(F,s);
    rewrite(F);
    
s:='';    
 // create first line with plot names
 for j := 1 to ItemsOutCount1 do   // find checked
if Pnam[j].PCheck.Checked then
begin 
s:=s+#9+Pnam[j].PStr.Caption+#9+s_TAB;
end;
Writeln(F,s);

// write data
    Linei:=0;
 repeat
 // finding line with all Y for a given Xi to write to Excel file
 Data_Yes_Boo:= false;
 inc(Linei);
 s:=''; // line to write

 for j := 1 to ItemsOutCount1 do  // find checked
if Pnam[j].PCheck.Checked then
begin 

 // find plot that has Xi value and add the X,Y point s
if Linei<=FLS[j].Count then 
  begin
    x:= FLS[j].XValues.Value[Linei-1];
    y:= FLS[j].YValues.Value[Linei-1];
    s:=s+ FloatToStrF(x, FFgeneral, 8, 8)+#9; // write X
    s:=s+ FloatToStrF(y, FFgeneral, 8, 8)+#9; // write Y
    s:=s+s_TAB; // skip N columns between plots
    Data_Yes_Boo:= true;
  end
  else
  begin
     s:=s+#9+#9+s_TAB; // skip one column and writing empty x, y data
  end;       // if Linei<

end; // if PNam checked;

    if Data_Yes_Boo then  Writeln(F,s);

 until (not Data_Yes_Boo);


    CloseFile(F);

end;// proc

// proc






procedure TFPlot.Button2Click(Sender: TObject);
var  iTotal, NumbOfCoeff, j, i:longint;
CutOffFreq1,Rate1, Period1:double;
DataArray1:PDoubleArray;
begin
// filtering
CutOffFreq1:=StrToFloat(Edit6.text);
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
  iTotal:=FLS[j].Count;
  getmem(DataArray1,iTotal*sizeof(double));
  for i:=0 to iTotal-1 do DataArray1[i]:= FLS[j].YValues.Value[i];
  Period1:= FLS[j].XValues.Value[2]-FLS[j].XValues.Value[1];
//  SaveColor:=FLS[ItemsOutCount].SeriesColor;
  if CheckBox17.Checked then Rate1:=1000/Period1 else Rate1:=1/Period1;
  GausFilter1(DataArray1,  CutOffFreq1, Rate1,  0, iTotal-1,iTotal, 2,  NumbOfCoeff);
  for i:=0 to iTotal-1 do FLS[j].YValues.Value[i]:=DataArray1[i];
  FLS[j].Repaint;
  freemem(DataArray1);
end;// if
//  PlotFvsT;
end;// proc

Procedure DestroyPlots;
var i:integer;
begin
if ItemsOutCount1 <=0 then exit;
for i:=1 to  ItemsOutCount1 do
begin
 Pnam[i].PVal.Free;
 Pnam[i].PStr.Free;
 Pnam[i].PCheck.Free;
 FLS[i].Free;
end;
  ItemsOutCount1:=0;
end;


Procedure ChartClean;
var i:integer;
begin
Fplot.memo1.Clear;
for i:=1 to ItemsOutCount1 do FLS[i].clear;
DestroyPlots;
end;

procedure TFPlot.ChartClean1Click(Sender: TObject);
begin
ChartClean;
//InitializePlot;
end;

procedure TFPlot.Button8Click(Sender: TObject);
var i,j:longint;
begin
RefreshCursors;
//ClearPlots;
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
for i:=0 to FLS[j].Count-1 do FLS[j].XValues.Value[i] := FLS[j].XValues.Value[i]-curs.X1;
FLS[j].Repaint;
end;
// PlotFvsT;
end; // proc

procedure TFPlot.PlotNames1Click(Sender: TObject);
begin
fPlotNames.Visible:=true;
fPlotNames.BringToFront;
end;


procedure TFPlot.Button9Click(Sender: TObject);
var i:integer;
begin
   for i:=1 to ItemsOutCount1 do
   Pnam[i].PCheck.Checked:=true;
end;

procedure TFPlot.Button10Click(Sender: TObject);
var i:integer;
begin
   for i:=1 to ItemsOutCount1 do
   Pnam[i].PCheck.Checked:=false;
end;



procedure TFPlot.WriteCursors1Click(Sender: TObject);
var s:string;
begin
 s:='';
if  fmeasure.checkbox3.Checked then s:=s+edit1.Text+#9+edit2.Text+#9;
if   fmeasure.checkbox2.Checked then s:=s+FloatToStrF(Curs.X2-Curs.X1,ffGeneral,6,6)+#9;
if fmeasure.checkbox4.Checked then
s:=s+edit3.Text+#9+edit4.Text+#9+edit5.Text;
fmeasure.Memo1.Lines.Add(s);
end;




procedure TFPlot.CursorsForm1Click(Sender: TObject);
begin
fmeasure.Visible:=true;
fmeasure.BringToFront
end;


procedure TFPlot.ReloadASCIIfiles1Click(Sender: TObject);
var i:longint; Fn:string;
begin
// reload
if memo1.lines.Count =0 then exit;
for i:=1 to ItemsOutCount1 do FLS[i].clear;
DestroyPlots;
for i:=0 to memo1.lines.Count-1 do
begin
    Fn:=memo1.lines[i];
    AddNewName(ExtractFileName(Fn));
    ImportASCIIfile1(Fn);
end;
end;// proc

procedure TFPlot.ShowFnames1Click(Sender: TObject);
begin
 memo1.Visible:=not memo1.Visible;
end;

Function FindFirstMarked:integer;
var i:longint;
begin
i:=0;
repeat
inc(i);
until (i= ItemsOutCount1) or Pnam[i].PCheck.Checked;
if not Pnam[i].PCheck.Checked then i:=1; // all unmarked
FindFirstMarked:=i;
end;

procedure TFPlot.Button13Click(Sender: TObject);
var i:longint;
begin
// previous trace
if  ItemsOutCount1<=1 then exit;
i:= FindFirstMarked;
if i= 1 then i:=ItemsOutCount1+1;
Button10Click(Sender); // unmark all
Pnam[i-1].PCheck.Checked:=true;
PlotFvsT;
end;

procedure TFPlot.Button14Click(Sender: TObject);
var i:longint;
begin
// next trace
if  ItemsOutCount1<=1 then exit;
i:= FindFirstMarked;
if i= ItemsOutCount1 then i:=0;
Button10Click(Sender); // unmark all
Pnam[i+1].PCheck.Checked:=true;
PlotFvsT;
end;

procedure TFPlot.CreateUndo1Click(Sender: TObject);
var count1, i,j:longint;
begin
// create undo
if ItemsOutCount1=0 then exit;
Undo_ItemsOutCount1:=ItemsOutCount1;
memo2.Clear;

for i:=1 to ItemsOutCount1 do
begin
    memo2.Lines.Add(PNam[i].PStr.Caption);
    count1:=FLS[i].Count;
    Undo_Count1[i]:=count1;
    getmem(Undo_DatX[i], count1*sizeof(double));
    getmem(Undo_DatY[i], count1*sizeof(double));
    for j:=0 to count1-1 do Undo_DatX[i][j]:= FLS[i].XValues.Value[j];
    for j:=0 to count1-1 do Undo_DatY[i][j]:= FLS[i].YValues .Value[j];
end; // for i
    for j:=0 to memo1.Lines.Count -1 do memo2.Lines.Add(memo1.Lines[j]);
Undo2.Enabled:=true;
ClearBuffer1.Enabled:=true;
end;



procedure TFPlot.Undo2Click(Sender: TObject);
var i,j, count1:integer; s:string; x,y:double;
begin
// undo
ChartClean;
for i:=1 to Undo_ItemsOutCount1 do
begin
    s:= memo2.Lines[i-1];
    AddNewName(s);
    count1:= Undo_Count1[i];
    for j:=0 to count1-1 do
    begin
      x:= Undo_DatX[i][j];
      y:= Undo_DatY[i][j];
      FLS[ItemsOutCount1].AddXY(x, y,'',clTeeColor);
    end;
end;// for i
   for j:=Undo_ItemsOutCount1 to memo2.Lines.Count -1 do
   memo1.Lines.Add(memo2.Lines[j]);
end;// proc



procedure TFPlot.ClearBuffer1Click(Sender: TObject);
var i:longint;
begin
// clear buffer;
for i:=1 to Undo_ItemsOutCount1 do
begin
    Freemem(Undo_DatX[i]);
    Freemem(Undo_DatY[i]);
    memo2.Clear;
end;

Undo2.Enabled:=false;
ClearBuffer1.Enabled:=false;
end;

procedure TFPlot.Button15Click(Sender: TObject);
var i,j, maxi, maxi_new, ReductFactor:integer;
 xArr1, yArr1:  PDoubleArray;
begin
// data reduction
ReductFactor:=StrToInt(Edit9.Text);
if  ReductFactor <=1 then exit;

for i:=1 to ItemsOutCount1 do
begin
  Maxi:=FLS[i].Count;
  maxi_new:=Maxi div ReductFactor;
  getmem(xArr1,maxi_new*sizeof(double));
  getmem(yArr1,maxi_new*sizeof(double));
  for j:=0 to Maxi_new-1  do
    begin
         xArr1[j]:= FLS[i].XValues.Value[j*ReductFactor];
         yArr1[j]:= FLS[i].YValues.Value[j*ReductFactor];
    end;
   FLS[i].clear;
   for j:=0 to Maxi_new-1  do  FLS[i].AddXY(xArr1[j], yArr1[j]);

 freemem(xArr1);
 freemem(yArr1);
end;// for i
end; // proc

procedure TFPlot.Button18Click(Sender: TObject);
begin
// save display settings
With  EasyChart do
begin
   SVx1:=bottomaxis.minimum;
   SVx2:=bottomaxis.maximum;
   SVy1:=LeftAxis.Minimum;
   SVy2:=LeftAxis.maximum;
end;// with
   Button19.Enabled:=true;
end;

procedure TFPlot.Button19Click(Sender: TObject);
begin
// restore display settings
With  EasyChart do
begin
 bottomaxis.Automatic:=false;
 LeftAxis.Automatic:=false;
 bottomaxis.minimum:=SVx1;
 bottomaxis.maximum:=SVx2;
 LeftAxis.Minimum:=SVy1;
 LeftAxis.maximum:=SVy2;
end;// with
end;





procedure TFPlot.Button17Click(Sender: TObject);
var x1_, x2_:double;
begin
// Setdisplay to Cursors Xleft - Xright
Button1Click(Sender);// refresh cursors
x1_:=Curs.X1;
x2_:=Curs.X2;
if x1_>x2_ then
 begin
  x2_:=Curs.X1;
  x1_:=Curs.X2;
 end;

With  EasyChart do
begin
 bottomaxis.Automatic:=false;
 LeftAxis.Automatic:=false;

 bottomaxis.minimum:=X1_;
 bottomaxis.maximum:=X2_;
end;// with
end;

procedure TFPlot.CorrectBaseX1X21Click(Sender: TObject);
// correct base;
var count1, i,j:longint;
BaseY, x,y:double;

begin
RefreshCursors;
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
 BaseY:=0;
 count1:=0;
for i:=0 to FLS[j].Count-1 do
 begin
 x:= FLS[j].XValues.Value[i];
 y:= FLS[j].YValues.Value[i];
 If (x>=Curs.X1) and (x<=Curs.X2) then
      begin
       BaseY:=BaseY+y;
       inc(count1);
      end;
 end;
 if Count1>0 then BaseY:=BaseY/Count1;

for i:=0 to FLS[j].Count-1 do FLS[j].YValues.Value[i] := FLS[j].YValues.Value[i]-BaseY;
FLS[j].Repaint;
end;
end; // proc

procedure TFPlot.IntegralX1X21Click(Sender: TObject);
// integral
var i,j:longint;
deltaX, Integral, x,y:double;

begin
RefreshCursors;
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
 Integral:=0;
if NewPlotsIntegral1.Checked then
  AddNewName( 'int'+PNam[j].PStr.Caption);

for i:=0 to FLS[j].Count-1 do
 begin
 x:= FLS[j].XValues.Value[i];
 If (x>=Curs.X1) and (x<=Curs.X2) then
      begin
       y:= FLS[j].YValues.Value[i];
       if i=0 then deltaX:=FLS[j].XValues.Value[1]-FLS[j].XValues.Value[0] else
       deltaX:=FLS[j].XValues.Value[i]-FLS[j].XValues.Value[i-1];
       Integral:=Integral+y*deltaX;
          if NewPlotsIntegral1.Checked then
          FLS[ItemsOutCount1].AddXY(x, integral,'',clTeeColor);
      end; // if curs
  // writing the result
 end; // for i
fmeasure.Memo1.Lines.Add('int'+PNam[j].PStr.Caption+#9+
FloatToStrF(Integral,ffGeneral,6,6));

end; // if Pnam checked
end; // proc


procedure TFPlot.AddY11Click(Sender: TObject);
// Add Y1
var i,j:longint;

begin
RefreshCursors;
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
for i:=0 to FLS[j].Count-1 do FLS[j].YValues.Value[i] := FLS[j].YValues.Value[i]+Curs.Y1;
FLS[j].Repaint;
end;
end; // proc



Procedure DrawLine(x1v,y1v,x2v,y2v:double;Color2:TColor);
var x1,y1,x2,y2:longint;
begin
x1:=ConvertXvaltoXint(x1v);
x2:=ConvertXvaltoXint(x2v);

y1:=ConvertYvaltoYint(y1v);
y2:=ConvertYvaltoYint(y2v);
with Fplot, EasyChart,Canvas do
begin
      Pen.Style:=psSolid; // CrossHairStyle;
      Pen.Color:=Color2; // ClBlack;
      Pen.Mode:= pmCopy;  //pmNotXor; // //PenMode1; // pmBlack; //pmXor;// pmNotXor; //
      Pen.Width:=1;
      MoveTo(x1,y1);
      LineTo(x2,y2);
end;
end;



procedure ShowSlope(i1,i2:longint;DDslope, DDoffset:double);
// var x1,y1,x2,y2:longint;
var    x1v,x2v, y1v, y2v:double;
begin
    x1v:=DatXX[i1];
    x2v:=DatXX[i2];
    y1v:=DDslope*x1v+DDoffset;
    y2v:=DDslope*x2v+DDoffset;
  DrawLine(x1v,y1v,x2v,y2v,ClBlack);
end;



procedure TFPlot.MeanX1X21Click(Sender: TObject);
// mean X1X2   MethLeastSq(i1, i2,  slope1,offset1);
var i1,i2, count1, i,j:longint;
ArraySize:longint;
Max, Min, BaseY, x,y:double;

s:string;

var slope1,offset1:double;

begin
RefreshCursors;

s:='';
//s1:= PNam[j].PStr.Caption;
//for i:=1 to length(s1) do s:=s+' ';

fmeasure.Memo1.Lines.Add('Plot name'+#9+ // PNam[j].PStr.Caption
'Mean'+#9+
'Max'+#9+
'Min'+#9+
'Slope'+#9+
'Offset');

for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
 BaseY:=0;
 count1:=0;
 Max:= -1e308;
 Min:=1e308;

 ArraySize:=FLS[j].Count;
 getmem(DatXX,ArraySize*sizeof(double));
 getmem(DatYY,ArraySize*sizeof(double));

i1:=FindXi(j, Curs.X1);
i2:=FindXi(j, Curs.X2);


for i:=i1 to i2 do
 begin
 x:= FLS[j].XValues.Value[i];
 y:= FLS[j].YValues.Value[i];

 if y> Max then Max:=y;
 if y< Min then Min:=y;

       BaseY:=BaseY+y;
       inc(count1);
        DatXX[i]:=x;
        DatYY[i]:=y;
 end;

 if Count1>0 then
 begin
  BaseY:=BaseY/Count1;
  MethLeastSq(i1, i2,  slope1,offset1);
 end;

 // procedure ShowSlope(i1,i2:longint;DDslope, DDoffset:double);
if  ShowSlopes1.Checked then ShowSlope(i1,i2, slope1, offset1);

if CreateSlopePlots1.Checked then
  begin
  AddNewName( 'FitLin'+ intToStr(ItemsOutCount1+1)+PNam[j].PStr.Caption);
  x:=DatXX[i1];
  FLS[ItemsOutCount1].AddXY(x, slope1*x+offset1,'',clTeeColor);
  x:=DatXX[i2];
  FLS[ItemsOutCount1].AddXY(x, slope1*x+offset1,'',clTeeColor);
  end;

 Freemem(DatXX);
 Freemem(DatYY);

fmeasure.Memo1.Lines.Add(PNam[j].PStr.Caption+#9+
FloatToStrF(BaseY,ffGeneral,6,6)+#9+
FloatToStrF(max,ffGeneral,6,6)+#9+
FloatToStrF(Min,ffGeneral,6,6)+#9+
FloatToStrF(slope1,ffGeneral,6,6)+#9+
FloatToStrF(offset1,ffGeneral,6,6)
);


end; // IF checked
end; // proc




procedure TFPlot.Button48Click(Sender: TObject);
var i:integer;
begin

// cleaning previous taus
if  ItemsOutCount1_ini_fit_decays = -1 then exit;
if  ItemsOutCount1_ini_fit_decays = ItemsOutCount1 then exit;

for i:= ItemsOutCount1_ini_fit_decays+1 to ItemsOutCount1 do
  begin
   Pnam[i].PVal.Free;
   Pnam[i].PStr.Free;
   Pnam[i].PCheck.Free;
   FLS[i].Clear;
  end;

 ItemsOutCount1:= ItemsOutCount1_ini_fit_decays;
 Fplot.memo1.Clear; // file names
 PlotFvsT;
 FPlot.label8.Caption:= inttostr(ItemsOutCount1);
end;





procedure TFPlot.Fit1ExpDecayX1X21Click(Sender: TObject);
var  ItemsOutCount1_ini, Noutput, iTotal, ix1, ix2, j, i:longint;
deltax, x0, x, y, Period1:double;
DataArray1:PDoubleArray;
FitName, s:string;
begin
// fit 1 exp decay X1 X2
// Fit1Exp(Arr:PDoubleArray;ArrCo:longint);
Button1Click(Sender); // xy refresh
if (Curs.x1=0) and (Curs.x2=0) then exit;

if  CheckBox4.Checked then FPlot.Button48Click(Sender);


ItemsOutCount1_ini:=ItemsOutCount1;
ItemsOutCount1_ini_fit_decays:=ItemsOutCount1;

for j:=1 to ItemsOutCount1_ini do
if Pnam[j].PCheck.Checked then
begin
s:=PNam[j].PStr.Caption; s:=Copy(s,1,3);
if s<>'Fit' then
begin // create array and fit
  x0:=FLS[j].XValues.Value[0];
  ix1:= FindXi(j, curs.x1);
  ix2:= FindXi(j, curs.x2);
  iTotal:=ix2-ix1+1;
if  iTotal >3 then // # points for fit should be >3
begin
  getmem(DataArray1,iTotal*sizeof(double));
  for i:=0 to iTotal-1 do DataArray1[i]:= FLS[j].YValues.Value[i+ix1];
  Period1:= FLS[j].XValues.Value[2]-FLS[j].XValues.Value[1];
  PrmFixed.p1f:=false;
  Fit1Exp(DataArray1,iTotal);
// var best:FitPrmSet;
// BestSum:double;
// output:


FitName:=  'FitExp'+ intToStr(ItemsOutCount1+1)+PNam[j].PStr.Caption;
with best do
begin
p2:=ix1*Period1+x0;
p3:=p3*Period1;
// Function1ExpDecay:=(p1-p4)*exp(-(x-p2)/p3))+p4;
Fmeasure.Memo1.Lines.Add('One exp decay fit: y=a*exp(-(t-to)/tau)+b');
Fmeasure.Memo1.Lines.Add('Plot:'+ FitName);
Fmeasure.Memo1.Lines.Add('tau'+#9#9+'a'+#9#9+'b'+#9#9+'to');
Fmeasure.Memo1.Lines.Add(
FloattoStrF(p3,ffgeneral, 6,6)+#9#9+
FloattoStrF(p1-p4,ffgeneral, 6,6)+#9#9+
FloattoStrF(p4,ffgeneral, 6,6)+#9#9+
FloattoStrF(p2,ffgeneral, 6,6));
end; // with best

  AddNewName(FitName);

if Fmeasure.CheckBox1.Checked then Noutput:=StrToInt(Fmeasure.Edit1.text)
 else Noutput:=iTotal;

deltax:=(iTotal-1)*Period1/(Noutput-1);

  for i:=0 to Noutput-1 do
  begin
   x:= i*deltax+best.p2;
   y:= Function1Exp(best,x);
   FLS[ItemsOutCount1].AddXY(x, y,'',clTeeColor);
  end;

  freemem(DataArray1);
end; // if iTotal>5

end; // if <>'Fit'
end;// if Pnam[j].PCheck.Checked
 FPlot.label8.Caption:= inttostr(ItemsOutCount1);

end;// proc





procedure TFPlot.FitGaussX1X21Click(Sender: TObject);
var  ItemsOutCount1_ini, Noutput, iTotal, ix1, ix2, j, i:longint;
x0,deltax, x, y, Period1:double;
DataArray1:PDoubleArray;
s:string;
begin
// fit 1 exp decay X1 X2
Button1Click(Sender); // xy refresh
if (Curs.x1=0) and (Curs.x2=0) then exit;

ItemsOutCount1_ini:=ItemsOutCount1;
for j:=1 to ItemsOutCount1_ini do
if Pnam[j].PCheck.Checked then
begin
s:=PNam[j].PStr.Caption; s:=Copy(s,1,3);
if s<>'Fit' then
begin // create array and fit
 x0:=FLS[j].XValues.Value[0];
  ix1:= FindXi(j, curs.x1);
  ix2:= FindXi(j, curs.x2);
  iTotal:=ix2-ix1+1;
if  iTotal >3 then // # points for fit should be >3
begin
  getmem(DataArray1,iTotal*sizeof(double));
  for i:=0 to iTotal-1 do DataArray1[i]:= FLS[j].YValues.Value[i+ix1];
  Period1:= FLS[j].XValues.Value[2]-FLS[j].XValues.Value[1];
  FitGauss(DataArray1,iTotal);
// var best:FitPrmSet;
// BestSum:double;
// output:
with best do
begin
p2:=p2*Period1+x0+ix1*Period1;
p3:=p3*Period1;
// FunctionGauss:=p1*exp(-0.5*sqr((x-p2)/p3))+p4;
Fmeasure.Memo1.Lines.Add('One Gauss fit: y=p1*exp(-0.5*sqr((x-p2)/p3))+p4');
Fmeasure.Memo1.Lines.Add('Plot:'+ 'Gauss'+PNam[j].PStr.Caption);
Fmeasure.Memo1.Lines.Add('p1'+#9#9+'p2'+#9#9+'p3'+#9#9+'p4');
Fmeasure.Memo1.Lines.Add(
FloattoStrF(p1,ffgeneral, 6,6)+#9#9+
FloattoStrF(p2,ffgeneral, 6,6)+#9#9+
FloattoStrF(p3,ffgeneral, 6,6)+#9#9+
FloattoStrF(p4,ffgeneral, 6,6));
end; // with best

  AddNewName( 'FitGauss'+PNam[j].PStr.Caption);

if Fmeasure.CheckBox1.Checked then Noutput:=StrToInt(Fmeasure.Edit1.text)
 else Noutput:=iTotal;

deltax:=(iTotal-1)*Period1/(Noutput-1);

  for i:=0 to Noutput-1 do
  begin
   x:= (i+ix1)*deltax+x0;
   y:= FunctionGauss(best,x);
   FLS[ItemsOutCount1].AddXY(x, y,'',clTeeColor);
  end;
  freemem(DataArray1);
end; // if iTotal>5
end; // if not previous fit
end;// if Pnam[j].PCheck.Checked
end;// proc

procedure TFPlot.Button20Click(Sender: TObject);
var j,i:integer; y:double;
begin
// inverse
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin //
for i:=0 to FLS[j].Count-1 do
 Begin
   y:= FLS[j].YValues.Value[i];
   FLS[j].YValues.Value[i]:=-y;
 end; // for i
 FLS[j].Repaint;
end;
end;


// proc



/////////////////// 2 exp peak ////////////////////////////////////
procedure TFPlot.Fit2ExpPeakX1X21Click(Sender: TObject);
// fit 2 exp peak
var  imax, ItemsOutCount1_ini, Noutput, iTotal, ix1, ix2, j, i:longint;
lastY, ymax, deltax, x0, x, y, Period1:double;
DataArray1:PDoubleArray;
s:string;
begin
// fit 1 exp decay X1 X2
// Fit1Exp(Arr:PDoubleArray;ArrCo:longint);
Button1Click(Sender); // xy refresh
if (Curs.x1=0) and (Curs.x2=0) then exit;

ItemsOutCount1_ini:=ItemsOutCount1;
for j:=1 to ItemsOutCount1_ini do
if Pnam[j].PCheck.Checked then
begin
s:=PNam[j].PStr.Caption; s:=Copy(s,1,3);
if s<>'Fit' then
begin // create array and fit
  x0:=FLS[j].XValues.Value[0];
  ix1:= FindXi(j, curs.x1);
  ix2:= FindXi(j, curs.x2);

// find imax
 imax:=ix1; ymax:=  FLS[j].YValues.Value[ix1];
for i:=ix1+1 to ix2 do
if  FLS[j].YValues.Value[i]>ymax then
  begin
    imax:= i; ymax:= FLS[j].YValues.Value[i];
  end;

  iTotal:=imax-ix1+1;
// if  iTotal >3 then // # points for fit should be >3
  getmem(DataArray1,iTotal*sizeof(double));
  for i:=0 to iTotal-1 do DataArray1[i]:= FLS[j].YValues.Value[i+ix1];
  Period1:= FLS[j].XValues.Value[2]-FLS[j].XValues.Value[1];
  PrmFixed.p1f:=false;
  Fit1Exp(DataArray1,iTotal);
// var best:FitPrmSet;
// BestSum:double;
// output:
with best do
begin
p2:=ix1*Period1+x0;
p3:=p3*Period1;
// Function1ExpDecay:=(p1-p4)*exp(-(x-p2)/p3))+p4;
Fmeasure.Memo1.Lines.Add('One exp decay fit: y=a*exp(-(t-to)/tau)+b');
Fmeasure.Memo1.Lines.Add('Plot:'+ 'Exp'+PNam[j].PStr.Caption);
Fmeasure.Memo1.Lines.Add('tau'+#9#9+'a'+#9#9+'b'+#9#9+'to');
Fmeasure.Memo1.Lines.Add(
FloattoStrF(p3,ffgeneral, 6,6)+#9#9+
FloattoStrF(p1-p4,ffgeneral, 6,6)+#9#9+
FloattoStrF(p4,ffgeneral, 6,6)+#9#9+
FloattoStrF(p2,ffgeneral, 6,6));
end; // with best

  AddNewName( 'FitExp'+PNam[j].PStr.Caption);

if Fmeasure.CheckBox1.Checked then Noutput:=StrToInt(Fmeasure.Edit1.text)
 else Noutput:=iTotal;

deltax:=(iTotal-1)*Period1/(Noutput-1);

  for i:=0 to Noutput-1 do
  begin
   x:= i*deltax+best.p2;
   y:= Function1Exp(best,x);
   FLS[ItemsOutCount1].AddXY(x, y,'',clTeeColor);
   if i= Noutput-1 then lastY:=y;
  end;
  freemem(DataArray1);


// second (dissending) part fit

  iTotal:=ix2-imax+1;
  getmem(DataArray1,iTotal*sizeof(double));
  for i:=0 to iTotal-1 do DataArray1[i]:= FLS[j].YValues.Value[i+imax];
  Period1:= FLS[j].XValues.Value[2]-FLS[j].XValues.Value[1];

  PrmFixed.p1f:=true; Best.p1:= lastY;
  Fit1Exp(DataArray1,iTotal);
// var best:FitPrmSet;
// BestSum:double;
// output:
with best do
begin
p2:=imax*Period1+x0;
p3:=p3*Period1;
// Function1ExpDecay:=(p1-p4)*exp(-(x-p2)/p3))+p4;
Fmeasure.Memo1.Lines.Add('One exp decay fit: y=a*exp(-(t-to)/tau)+b');
Fmeasure.Memo1.Lines.Add('Plot:'+ 'Exp'+PNam[j].PStr.Caption);
Fmeasure.Memo1.Lines.Add('tau'+#9#9+'a'+#9#9+'b'+#9#9+'to');
Fmeasure.Memo1.Lines.Add(
FloattoStrF(p3,ffgeneral, 6,6)+#9#9+
FloattoStrF(p1-p4,ffgeneral, 6,6)+#9#9+
FloattoStrF(p4,ffgeneral, 6,6)+#9#9+
FloattoStrF(p2,ffgeneral, 6,6));
end; // with best


if Fmeasure.CheckBox1.Checked then Noutput:=StrToInt(Fmeasure.Edit1.text)
 else Noutput:=iTotal;

deltax:=(iTotal-1)*Period1/(Noutput-1);

  for i:=0 to Noutput-1 do
  begin
   x:= i*deltax+best.p2;
   y:= Function1Exp(best,x);
   FLS[ItemsOutCount1].AddXY(x, y,'',clTeeColor);
  end;
  freemem(DataArray1);



end; // if <>'Fit'
end;// if Pnam[j].PCheck.Checked
end;// proc




procedure TFPlot.Button22Click(Sender: TObject);
var i,j,k, iTotal:integer;
newPeriod, Xstart1, Xend1, Xrange1:double;
Xnew,Ynew, x1,y1,x2,y2, slope1:double;
newCount:longint;
DataArray1:PDoubleArray;
begin
// resampling
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
  newPeriod:=StrToFloat(edit10.Text);
  iTotal:=FLS[j].Count;
  Xstart1:= FLS[j].XValues.Value[0];
  if resamplingstartfrom0andup1.Checked then Xstart1:=0;
  Xend1:=FLS[j].XValues.Value[iTotal-1];
  if Xend1<Xstart1 then exit;

  Xrange1:= Xend1-Xstart1;
  newCount:=round(Xrange1/newPeriod)+2; // added +2 just for "safety"
  getmem(DataArray1,newCount*sizeof(double));
//  DataArray1[0]:= FLS[j].YValues.Value[0];
  k:=-1;
repeat
inc(k);
Xnew:= Xstart1+k*newPeriod;

 i:=-1;
 repeat
 inc(i);
 x2:=FLS[j].XValues.Value[i];
 until  (x2>Xnew) or (i=iTotal-1);

 if (i<iTotal) and ((i-1)>=0) then
  begin
   y2:=FLS[j].YValues.Value[i];
   x1:=FLS[j].XValues.Value[i-1];
   y1:=FLS[j].YValues.Value[i-1];
   slope1:=(y2-y1)/(x2-x1);
   Ynew:=y1+slope1*(Xnew-x1);
   DataArray1[k]:= Ynew;
  end;

until (Xstart1+(k+1)*newPeriod)>Xend1;

  FLS[j].Clear;
  for i:=0 to k do
    FLS[j].AddXY(Xstart1+i*newPeriod, DataArray1[i]); //,'',clTeeColor);
    FLS[j].Repaint;
  freemem(DataArray1);
end; //if Pnam[j].PCheck.Checked then
end;// proc

procedure TFPlot.dydx1Click(Sender: TObject);
// find derivative
var ItemsOutCount1_ini, i,j:longint;
x, dydx,dy,dx:double;
begin
ItemsOutCount1_ini:= ItemsOutCount1;
for j:=1 to ItemsOutCount1_ini do
if Pnam[j].PCheck.Checked then
begin

AddNewName( 'dydx_'+ PNam[j].PStr.Caption);

for i:=0 to FLS[j].Count-2 do
begin
  dy:=FLS[j].YValues.Value[i+1]-FLS[j].YValues.Value[i];
  x:=FLS[j].XValues.Value[i];
  dx:=FLS[j].XValues.Value[i+1]-x;
  if dx<>0 then dydx:=dy/dx else dydx:=0;
  FLS[ItemsOutCount1].AddXY(x, dydx,'',clTeeColor);
end;

end;
end; // proc


procedure TFPlot.Subtracttraces1Click(Sender: TObject);
// subtract traces
var j,i, i1, i2:integer;
s1:string;
i1boo,i2boo:boolean;
x,y:double;
begin

i1boo:=false;
i2boo:=false;

for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
 if i1boo then if (not i2boo) then begin i2boo:=true; i2:=j end;
 if not i1boo then begin i1boo:=true; i1:=j end;
end; // if checked

if not ( i1boo and i2boo) then exit;

s1:=ExtractFileNameWithoutExtention(Pnam[i1].PStr.Caption);
// s2:=ExtractFileNameWithoutExtention(Pnam[i2].PStr.Caption);

AddNewName( s1+ '-' +Pnam[i2].PStr.Caption);
for i:=0 to FLS[i1].Count-1 do
 Begin
         x:= FLS[i1].XValues.Value[i];
         y:= FLS[i1].YValues.Value[i]-FLS[i2].YValues.Value[i];
         Add1XYToPlot(x,y);
 end; // for i

end; // proc

procedure TFPlot.SubtracttracesREVERSE1Click(Sender: TObject);
VAR i:integer;
begin
// reverse subtraction
Subtracttraces1Click(Sender);
for i:=0 to FLS[ItemsOutCount1].Count-1 do
 Begin
   FLS[ItemsOutCount1].YValues.Value[i]:= -FLS[ItemsOutCount1].YValues.Value[i];
   FLS[ItemsOutCount1].Repaint;
 end; // for i
end;

procedure TFPlot.Addtraces1Click(Sender: TObject);
// add traces
var j,i, i1, i2:integer;
i1boo,i2boo:boolean;
x,y:double;
begin

i1boo:=false;
i2boo:=false;

for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
 if i1boo then if (not i2boo) then
  begin i2boo:=true; i2:=j end;
 if not i1boo then
  begin i1boo:=true; i1:=j end;
end; // if checked

if not ( i1boo and i2boo) then exit;

AddNewName('Sum'+IntToStr(ItemsOutCount1+1));

for i:=0 to FLS[i1].Count-1 do
 Begin
 y:=0;
   for j:=1 to ItemsOutCount1-1 do
      if Pnam[j].PCheck.Checked then
          begin
         y:=y+ FLS[j].YValues.Value[i];
          end; // if checked
     x:= FLS[i1].XValues.Value[i];
    Add1XYToPlot(x,y);
 end; // for i

end; // proc

procedure TFPlot.ScaleY11Click(Sender: TObject);
// Yscale

var j,i :integer;
begin
RefreshCursors;
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
  begin
    for i:=0 to FLS[j].Count-1 do FLS[j].YValues.Value[i] := FLS[j].YValues.Value[i]*Curs.Y1;
    FLS[j].Repaint;
  end;
end;//proc


//////////////////////////////////////////////////////////////////////////////////
procedure TFPlot.RemovedUnchecked1Click(Sender: TObject);
var j, i:integer;
// Destination.Assign(Source);
begin
j:=0;
repeat
inc(j);
if not Pnam[j].PCheck.Checked then
 if (j<itemsOutCount1) then
  begin // find next closest checked plot to j
   i:=j;
  repeat
     inc(i);
  until (Pnam[i].PCheck.Checked) or (i=itemsOutCount1);

   if Pnam[i].PCheck.Checked then
      begin // moving next closest checked plot to j
        PNam[j].PVal.Caption:=PNam[i].PVal.Caption;
        PNam[j].PStr.Caption:=PNam[i].Pstr.Caption;
        PNam[j].PCheck.Checked:=PNam[i].PCheck.Checked;
        FLS[j].Assign(FLS[i]);
        PNam[i].PCheck.Checked:=false;
        FLS[i].Clear;
      end; // if i<=
  end; // if not Pnam
until (j= ItemsOutCount1);


j:=0;
repeat
inc(j);
until (not Pnam[j].PCheck.Checked) or (j=ItemsOutCount1);
if (j=ItemsOutCount1) and  Pnam[j].PCheck.Checked then exit;


for i:=j to ItemsOutCount1 do FLS[i].clear;

for i:=j to  ItemsOutCount1 do
begin
 Pnam[i].PVal.Free;
 Pnam[i].PStr.Free;
 Pnam[i].PCheck.Free;
 FLS[i].Free;
end;
  ItemsOutCount1:=j-1;

Fplot.memo1.Clear; // file names
PlotFvsT;

end;//proc

procedure TFPlot.Button23Click(Sender: TObject);
begin
// no labels
              EasyChart.AxisVisible:= not EasyChart.AxisVisible;  
//    EasyChart.LeftAxis.Labels:=not EasyChart.LeftAxis.Labels;
//    EasyChart.BottomAxis.Labels:=not EasyChart.BottomAxis.Labels;
end;




procedure TFPlot.Button24Click(Sender: TObject);
var i,j:longint; //s,dir1:string;
color_save, width_save: longint; //
x,y:double;
OutOfBoundBoo,  OutOfBoundBoo_Prior :boolean;
new_name:string;
ItemsOutCount1_Ini, CutCount:integer;

begin
// trancate Y1, Y2

// y1 muist be lower than y2
RefreshCursors;
if Curs.Y1 > Curs.Y2 then
 begin
  new_name:=Edit4.Text;
  Edit4.Text:=Edit3.Text;
  Edit3.Text:=new_name;
  RefreshCursors;
 end;

ItemsOutCount1_Ini:=ItemsOutCount1;

for j:=1 to ItemsOutCount1_Ini do
if Pnam[j].PCheck.Checked then
begin
         y:= FLS[j].YValues.Value[0];
OutOfBoundBoo_Prior:=true;
CutCount:=0;
   color_save:=FLS[j].SeriesColor;
   width_save:=FLS[j].LinePen.Width;

for i:=0 to FLS[j].Count-1 do
 Begin
          x:= FLS[j].XValues.Value[i];
         y:= FLS[j].YValues.Value[i];
         OutOfBoundBoo:= (Y<Curs.Y1) OR (Y>Curs.Y2);

         if  OutOfBoundBoo_Prior and (not OutOfBoundBoo) then
           begin // new plot
             inc(CutCount);
             new_name:=  IntToStr(CutCount)+'_' +PNam[j].PStr.Caption;
             AddNewName(new_name);
             FLS[ItemsOutCount1].SeriesColor:= color_save;
             FLS[ItemsOutCount1].LinePen.Width:= width_save;

             if i>0 then // ajust ends to threshold levels to look better on plot
               begin
                if FLS[j].YValues.Value[i-1]>y then y:= Curs.Y2 else y:= Curs.Y1;
               end;
           end; // new plot

         if  not OutOfBoundBoo_Prior and (OutOfBoundBoo) then // last point
         begin
           if FLS[j].YValues.Value[i-1]<y then y:= Curs.Y2 else y:= Curs.Y1;
           FLS[ItemsOutCount1].AddXY(x, y);
          end;

    if  not OutOfBoundBoo then
     begin
       FLS[ItemsOutCount1].AddXY(x, y);
     end;
    OutOfBoundBoo_Prior:= OutOfBoundBoo;
 end; // for i
   if CutCount=1 then // just trimming original function - no name change then
     begin
       new_name:=PNam[ItemsOutCount1].PStr.Caption;
       Delete(new_name,1,2);
       PNam[ItemsOutCount1].PStr.Caption:=new_name;
     end;

   PNam[j].PCheck.Checked:=false; // uncheck original plot for further deletion
end; // if checked

    RemovedUnchecked1Click(Sender);
end;// proc




procedure TFPlot.Button25Click(Sender: TObject);
var j:longint; //s,dir1:string;
begin
// setColor
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
 FLS[j].SeriesColor:= MyColorPalette[StrToInt(Edit11.Text)];
end; // if checked
end; // proc



procedure TFPlot.Button26Click(Sender: TObject);
// change width
var j:longint; //s,dir1:string;
begin
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
 FLS[j].LinePen.Width:=StrToInt(Edit12.Text);
end; // if checked
end; // proc



procedure TFPlot.Button27Click(Sender: TObject);
var i,j, color_save, width_save: longint; //
x,y:double;
new_name:string;
ItemsOutCount1_Ini:integer;

begin
// trancate X1, X2

// x1 muist be less than x2
RefreshCursors;
if Curs.X1 > Curs.X2 then
 begin
  new_name:=Edit2.Text;
  Edit2.Text:=Edit1.Text;
  Edit1.Text:=new_name;
  RefreshCursors;
 end;

ItemsOutCount1_Ini:=ItemsOutCount1;

for j:=1 to ItemsOutCount1_Ini do
if Pnam[j].PCheck.Checked then
begin
   color_save:=FLS[j].SeriesColor;
   width_save:=FLS[j].LinePen.Width;

  new_name:=  PNam[j].PStr.Caption;
  AddNewName(new_name);
  FLS[ItemsOutCount1].SeriesColor:=color_save;
  FLS[ItemsOutCount1].LinePen.Width:= width_save;

for i:=0 to FLS[j].Count-1 do
 Begin
         x:= FLS[j].XValues.Value[i];
         y:= FLS[j].YValues.Value[i];
     if (x >=Curs.X1) and  (x <=Curs.X2) then   FLS[ItemsOutCount1].AddXY(x, y);
 end; // for i
   PNam[j].PCheck.Checked:=false; // uncheck original plot for further deletion
end; // if checked

    RemovedUnchecked1Click(Sender);
end;// proc




procedure TFPlot.Button28Click(Sender: TObject);
var UZ_percent: double;
begin
// % unzoom X
  UZ_percent:=StrToFloat(Edit13.text);
  Case Radiogroup2.ItemIndex of
   0: ZoomPercent(-UZ_percent/2, -UZ_percent/2, 0, 0); // mid
   1: ZoomPercent(-UZ_percent, 0, 0, 0);                // left
   2: ZoomPercent(0, -UZ_percent, 0, 0);                // right
   end;
end;

procedure TFPlot.Button29Click(Sender: TObject);
var UZ_percent: double;
begin
// % zoom X
  UZ_percent:=StrToFloat(Edit13.text);
  Case Radiogroup2.ItemIndex of
   0: ZoomPercent(UZ_percent/2, UZ_percent/2, 0, 0); // mid
   1: ZoomPercent(UZ_percent, 0, 0, 0);                // left
   2: ZoomPercent(0, UZ_percent, 0, 0);                // right
   end;
end;


procedure TFPlot.Button31Click(Sender: TObject);
var UZ_percent: double;
begin
// % unzoom Y
  UZ_percent:=StrToFloat(Edit13.text);
  Case Radiogroup2.ItemIndex of
   0: ZoomPercent(0,0, -UZ_percent/2, -UZ_percent/2); // mid
   1: ZoomPercent(0,0,-UZ_percent, 0);                // left
   2: ZoomPercent(0,0,0, -UZ_percent);                // right
   end;
end;

procedure TFPlot.Button30Click(Sender: TObject);
var UZ_percent: double;
begin
// % zoom Y
  UZ_percent:=StrToFloat(Edit13.text);
  Case Radiogroup2.ItemIndex of
   0: ZoomPercent(0,0, UZ_percent/2, UZ_percent/2); // mid
   1: ZoomPercent(0,0,UZ_percent, 0);                // left
   2: ZoomPercent(0,0,0, UZ_percent);                // right
   end;
end;

procedure TFPlot.Button32Click(Sender: TObject);
var x1, x2: double;
begin
// X1-X2 scale
RefreshCursors;
if Curs.X1=Curs.X2 then exit;
x1:=Curs.X1; x2:=Curs.X2;
  if x1>x2 then begin x1:=Curs.X2; x2:=Curs.X1; end;

     with FPlot.EasyChart.bottomaxis do
      begin
        Automatic:=false;
        if maximum > x1 then
         begin
           minimum:= x1;
           maximum:= x2;
         end  else
         begin
           maximum:= x2;
           minimum:= x1;
         end;
      end;



// old version - ERROR
// FPlot.EasyChart.bottomaxis.Automatic:=false;
// FPlot.EasyChart.bottomaxis.minimum:=x1;
// FPlot.EasyChart.bottomaxis.maximum:=x2;
end;



procedure TFPlot.Button33Click(Sender: TObject);
var y1, y2: double;
begin
// Y1-Y2 scale
RefreshCursors;
if Curs.Y1=Curs.Y2 then exit;
y1:=Curs.Y1; y2:=Curs.Y2;
if y1>y2 then begin y1:=Curs.Y2; y2:=Curs.Y1; end;

     with FPlot.EasyChart.leftaxis do
      begin
        Automatic:=false;
        if maximum > y1 then
         begin
           minimum:= y1;
           maximum:= y2;
         end  else
         begin
           maximum:= y2;
           minimum:= y1;
         end;
      end;

   // old version - ERROR
// FPlot.EasyChart.LeftAxis.Automatic:=false;
// FPlot.EasyChart.LeftAxis.Minimum:=y1;
// FPlot.EasyChart.LeftAxis.maximum:=y2;
end;

procedure TFPlot.PanelBorder1Click(Sender: TObject);
begin
// panel border
PanelBorder1.Checked:= not PanelBorder1.Checked;
// EasyChart.AxisVisible:= PanelBorder1.Checked;
// if PanelBorder1.Checked then EasyChart.BorderStyle:= bsSingle else EasyChart.BorderStyle:= bsNone;
   EasyChart.BackWall.Pen.Visible:= PanelBorder1.Checked;
//Frame.Visible:=  PanelBorder1.Checked;

end;

procedure TFPlot.Button34Click(Sender: TObject);
begin
//
DrawCursors(Curs);
end;


procedure TFPlot.Import1XmultipleY1Click(Sender: TObject);
// import 1 X multiple Y
var i, j, imax :longint; Fn:string;
FNamesRow, FilesCount:longint;
FNamesStr:string;
DelimChar: char;
FirstDataLineStr,s:string;
 F:textFile;

begin
// import ASCII files
OpenDialog1.Options := [ofAllowMultiSelect]; //      ofFileMustExist
  OpenDialog1.InitialDir:='C:\';
  OpenDialog1.Filter:=
   'Text and Excel files (*.txt;*.csv)|*.txt;*.csv';
//  'All files (*.*)|*.*|Text files (*.txt)|*.txt|Excel files (*.csv)|*.csv';

  if OpenDialog1.Execute then
 begin
  imax:= OpenDialog1.Files.Count;
  if imax+ItemsOutCount1>MaxNumberOfPlots2 then imax:= MaxNumberOfPlots2-ItemsOutCount1;
  for i:=0 to imax-1 do
   begin
    Fn:=OpenDialog1.Files[i];
    if FileExists(Fn) then
    begin
    AssignFile(F,Fn);
    Reset(F);
    FNamesRow:= StrToInt( Edit14.Text);// read # lines to skip  (i.e. header)
     if FNamesRow<>0 then // use header
        begin
           for j:=1 to FNamesRow do  ReadLn(F,s); // empty readings
        end;
    ReadLn(F, FirstDataLineStr);
        if Pos(#9,FirstDataLineStr)<>0 then  DelimChar:=#9 else
        if Pos(',',FirstDataLineStr)<>0 then  DelimChar:=',' else
        DelimChar:=' ';

    FilesCount:=1; // row 1 is column X
      repeat
           inc(FilesCount);  // row 2, 3, 4 etc are columns Y
           s:= CharStr(DelimChar, FirstDataLineStr, FilesCount);
      until s='';
      CloseFile(F);
     FilesCount:=FilesCount-2;
    if FilesCount=0 then exit; // no data

    for j:=1 to FilesCount do
     begin
       if  FNamesRow=0 then s:= 'F'+IntToStr(j)+'_'+ ExtractFileName(Fn) else
        begin
           s:=CharStr(DelimChar, FNamesStr, j+1);
           if s='' then s:= 'F'+IntToStr(j)+'_'+ ExtractFileName(Fn);
        end;
       AddNewName(s);
     end;

    ImportASCIIfileN(Fn,1, FilesCount, FNamesRow,DelimChar);
    memo1.lines.Add(OpenDialog1.Files[i])
    end; // if file exists
   end; // for i
 end;// if
end;// proc


procedure TFPlot.AppendFiles1Click(Sender: TObject);
// Append files
var i, j, k, imax, headerLinesCount :longint;
Fn:string;
Index: array[0..10000] of integer;
s, IndexStr:string;
Char1:char;
minIndex:integer;
FirstFileBoo:boolean;
Path1:string;
Fr,Fw:textfile;

begin

// import ASCII files
OpenDialog1.Options := [ofAllowMultiSelect]; //      ofFileMustExist
  OpenDialog1.InitialDir:='C:\';
  OpenDialog1.Filter:=
   'Text and Excel files (*.txt;*.csv)|*.txt;*.csv';
//  'All files (*.*)|*.*|Text files (*.txt)|*.txt|Excel files (*.csv)|*.csv';

  if OpenDialog1.Execute then
 begin
   headerLinesCount:= StrToInt(Edit14.text);
   FirstFileBoo:=true;
   imax:= OpenDialog1.Files.Count;
   Path1:=ExtractFilePath(OpenDialog1.Files[0]);
     // find indexes
     for i:=0 to iMax-1 do
      begin
       Fn:=OpenDialog1.Files[i];
       s:=ExtractFileNameWithoutExtention(Fn);
       IndexStr:='';
       j:=length(s);
       Index[i]:=-1;
        repeat
         char1:=s[j];
         if (ord(char1)>47) and (ord(char1)<58) then
          begin
            IndexStr:=char1+IndexStr;
          end else char1:=#0;
         dec(j);
        until   (char1=#0) or (j=0);
       TryStrToInt(IndexStr, Index[i]);
      end;

     // sorting and appending

      repeat
       // finding the file index to append (with lowest index)
       MinIndex:=2147483647; // maximal integer
       j:=-1;
       for i:=0 to iMax-1 do
        begin
          if Index[i]>0 then
            if  Index[i]< MinIndex then  begin MinIndex:=Index[i]; j:=i; end;
        end;
       if j>=0 then //
       begin
              // appending file
            Fn:=OpenDialog1.Files[j];
            AssignFile(Fr,Fn);
            Reset(Fr);
            if FirstFileBoo then
            begin
             AssignFile(Fw,Path1+
             ExtractFileNameWithoutExtention(Fn)+'_Append'+ExtractFileExt(Fn));
             rewrite(Fw);
             FirstFileBoo:=false
            end
            else
              begin // skeep header
                 for k:=1 to headerLinesCount do  readln(Fr,s);
              end;
            While not eof(Fr) do
             begin
              readln(Fr,s);
              writeln(Fw,s);
             end;
           CloseFile(Fr);
        Index[j]:=-1; //  excluding this index from further consdideration
         end;// if j>=0
      until j=-1;
      if not  FirstFileBoo then  CloseFile(Fw);

 end;// if Open dialog
end;// proc










procedure TFPlot.XScale1Click(Sender: TObject);
//  Xscale;
var j,i :integer;
XScale:double;
begin
RefreshCursors;
  Xscale:=StrToFloat(Edit16.Text);
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
  begin
    for i:=0 to FLS[j].Count-1 do FLS[j].XValues.Value[i] := FLS[j].XValues.Value[i]*XScale;
    FLS[j].Repaint;
  end;
end;//proc





procedure TFPlot.LoadAutocorrelationClampFit1Click(Sender: TObject);   // load autocorr from clampfit
// import X  Y in specified columns
var i, j, imax :longint;
Fn,s:string;
DelimChar: char;
s1:string;
 F:textFile;
// YcolN,
XcolN,SkipFirstLines:Integer;

begin
// import ASCII files
OpenDialog1.Options := [ofAllowMultiSelect]; //      ofFileMustExist
  OpenDialog1.InitialDir:='C:\';
  OpenDialog1.Filter:=
   'Text,Excel,ATF files (*.txt;*.csv;*.atf)|*.txt;*.csv;*.atf';
//  'All files (*.*)|*.*|Text files (*.txt)|*.txt|Excel files (*.csv)|*.csv';

  if OpenDialog1.Execute then
 begin
  XcolN:= 8; //StrToInt(Edit17.text); // Y column is always goes next
  // YcolN:= XcolN+1;
  SkipFirstLines:= 4; //StrToInt(Edit19.text);
  imax:= OpenDialog1.Files.Count;
  if imax+ItemsOutCount1>MaxNumberOfPlots2 then imax:= MaxNumberOfPlots2-ItemsOutCount1;
  for i:=0 to imax-1 do
   begin
    Fn:=OpenDialog1.Files[i];
    if FileExists(Fn) then
    begin
    AssignFile(F,Fn);
    Reset(F);
           for j:=1 to SkipFirstLines+1 do  ReadLn(F,s);
    ReadLn(F, s);
        if Pos(#9,s)<>0 then  DelimChar:=#9 else DelimChar:=',';
       CloseFile(F);
       s1:= ExtractFileName(Fn);
       AddNewName(s1);
       FLS[ItemsOutCount1].AddXY(0, 1,'',clTeeColor);
       ImportASCIIfileN(Fn,XcolN, 1, SkipFirstLines, DelimChar);
     end; // if file exists
   end; // for i
 end;// if  Opendoalog
end;// proc

 ////////////////////////////////////////////////////////////////////////




procedure TFPlot.Divide2tracesFF01Click(Sender: TObject);
// divide traces
var j,i, i1, i2, count_min:integer;
s1:string;
i1boo,i2boo:boolean;
x,y:double;
begin

i1boo:=false;
i2boo:=false;

for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
 if i1boo then if (not i2boo) then begin i2boo:=true; i2:=j end;
 if not i1boo then begin i1boo:=true; i1:=j end;
end; // if checked

if not ( i1boo and i2boo) then exit;

s1:=ExtractFileNameWithoutExtention(Pnam[i1].PStr.Caption);
// s2:=ExtractFileNameWithoutExtention(Pnam[i2].PStr.Caption);

AddNewName( s1+ ' div ' +Pnam[i2].PStr.Caption);
count_min:=FLS[i1].Count;
if   count_min> FLS[i2].Count then  count_min:= FLS[i2].Count;
for i:=0 to count_min -1 do
 Begin
         x:= FLS[i1].XValues.Value[i];
         if   FLS[i2].YValues.Value[i] <>0 then
         y:= FLS[i1].YValues.Value[i]/FLS[i2].YValues.Value[i] else y:=0;
         Add1XYToPlot(x,y);
 end; // for i

end; // proc




procedure TFPlot.Button45Click(Sender: TObject);
begin
 AddNewName(Edit26.Text);
end;




procedure TFPlot.Button21Click(Sender: TObject);
// X font size
Var sz: double;
begin
   sz:=StrToFloat(Edit21.Text);
//   easychart.BottomAxis.Automatic:=false;
//   easychart.BottomAxis.LabelsFont.Style:=  [fsBold  fsItalic   fsItalic  fsItalic]

//   easychart.BottomAxis.LabelsFont.Style:=

//     easychart.BottomAxis.LabelsFont.size

   easychart.BottomAxis.LabelsFont.SizeFloat:=sz;
end;


procedure TFPlot.Button35Click(Sender: TObject);
// Y font size
Var sz: double;
begin
   sz:=StrToFloat(Edit22.Text);

//    easychart.LeftAxis.Automatic:=true;
 //    easychart.LeftAxis.Automatic:=false;
//    easychart.LeftAxis.LabelsFont.SizeFloat:=sz;

//   easychart.LeftAxis.LabelsFormat.Font.Size:=sz;

//   easychart.Axes.left.Items.Format.Font.Size:=sz;

   easychart.Axes.left.Items.Format.Font.SizeFloat:=sz;
   // := ['Arial', 7, Bold];
//   .Size:=sz;

end;


procedure TFPlot.CheckBox5Click(Sender: TObject);
begin
// bold/unbold
with easychart.BottomAxis.LabelsFont do
  begin
    if CheckBox5.Checked then Style:=Style +[fsBold] else Style:=Style - [fsBold]
  end;
end;


procedure TFPlot.CheckBox6Click(Sender: TObject);
begin
with easychart.LeftAxis.LabelsFont do
  begin
    if CheckBox6.Checked then Style:=Style +[fsBold] else Style:=Style - [fsBold]
  end;
end;

procedure TFPlot.Button36Click(Sender: TObject);
Var N: integer;
begin
   N:=StrToInt(Edit23.Text);
   easychart.BottomAxis.MinorTickCount :=N;
end;

procedure TFPlot.Button37Click(Sender: TObject);
Var N: integer;
begin
   N:=StrToInt(Edit24.Text);
   easychart.LeftAxis.MinorTickCount :=N;
end;


procedure TFPlot.Button39Click(Sender: TObject);
var i:integer;
begin
// ticklenX 25
    i:= StrToInt(Edit25.Text);
    easychart.BottomAxis.TickLength:=i;
end;

procedure TFPlot.Button40Click(Sender: TObject);
var i:integer;
begin
// ticklenY 27
    i:= StrToInt(Edit27.Text);
    easychart.LeftAxis.TickLength:=i;

end;




Procedure RemoveChar(Ch:char; var s:string);
var i:integer; s1:string;
begin
if s='' then exit;
s1:='';
for i:=1 to length (s)   do if s[i]<>Ch then s1:=s1+s[i];
s:=s1;
end;






procedure TFPlot.Button11Click(Sender: TObject);
Var incr1: double;
begin
{
Example:
https://www.steema.com/support/viewtopic.php?t=15698
tChart1.Axes.Bottom.Automatic = false;
tChart1.Axes.Bottom.Minimum = -50.0;
tChart1.Axes.Bottom.Maximum = 650;
tChart1.Axes.Bottom.Increment = 50;
tChart1.Axes.Bottom.MinorTicks.Length = 4;

tChart1.Axes.Left.Automatic = false;
tChart1.Axes.Left.Minimum = 3870;
tChart1.Axes.Left.Maximum = 4010;
tChart1.Axes.Left.Increment = 50;
tChart1.Axes.Left.MinorTicks.Length = 4;

tChart1.Axes.Right.Automatic = false;
tChart1.Axes.Right.Minimum = -50.0;
tChart1.Axes.Right.Maximum = 550;
tChart1.Axes.Right.Increment = 50;
tChart1.Axes.Right.MinorTicks.Length = 4;
tChart1.Axes.Right.Grid.Visible = false;

Also:
Chart.BottomAxis.MinorTickCount := 3;
}


   incr1:=StrToFloat(Edit18.Text);
   easychart.BottomAxis.Automatic:=false;
   easychart.BottomAxis.Increment:=incr1;
end;

procedure TFPlot.Button12Click(Sender: TObject);
Var incr1: double;
begin
   incr1:=StrToFloat(Edit20.Text);
   easychart.LeftAxis.Automatic:=false;
    easychart.LeftAxis.Increment:=incr1;
end;




procedure ImportATFfile(Fn:string);
var F:textFile;
Fname_short, s1, s2, s:string;
var x, y:double;
i, traceN, tracei: integer;

begin
if not FileExists(Fn) then exit;
    AssignFile(F,Fn);
    Reset(F);
      readln(F,s);
      //  ATF	1
      if Pos('ATF', s)<1 then exit;      // exit if not atf file
      ChartClean;
      Fname_short:=ExtractFileNameWithoutExtention(Fn);
      readln(F,s);
      //8	23
      s1:=TabStr(s,2);
      s1:=trim(s1);
      traceN:= StrToInt(s1) -1;
      // create pots
      for tracei := 1 to traceN do
      AddNewName(Fname_short+'_Trace'+IntToStr(tracei));
//      memo1.lines.Add(OpenDialog1.Files[i])

 for I := 1 to 9 do  readln(F,s); // skip next 9 lines
{AcquisitionMode=Episodic Stimulation
Comment=rabbit whole cell ICaL IV
YTop=5000
YBottom=-5000
SyncTimeUnits=20
SweepStartTimesMS=0.000,1500.000,3000.000,4500.000,6000.000,7500.000,9000.000,10500.000,12000.000,13500.000,15000.000,16500.000,18000.000,19500.000,21000.000,22500.000,24000.000,25500.000,27000.000,28500.000,30000.000,31500.000
SignalsExported=Im
Signals=
Time (s)}

//    co:=0;
    While not eof(F) do
    begin
      readln(F,s);
      s1:=TabStr(s,1);
      x:= StrToFloat(s1);
      for tracei := 1 to traceN do
      begin
          s1:= TabStr(s,tracei+1);
          y:=  StrToFloat(s1);
         FLS[tracei].AddXY(x, y,'',clTeeColor);
      end;

//     {$I-}
//    readln(F, x, y);
//    {$I+}
//    if IOResult = 0 then
//     begin
//     FLS[ItemsOutCount1].AddXY(x, y,'',clTeeColor);
//     end; // if ioresult
    end; // while
    CloseFile(F);
end;




procedure TFPlot.LoadATF1Click(Sender: TObject);
// Load atf
var i, imax :longint; Fn:string;

begin
// import ASCII files
//OpenDialog1.Options := [ofAllowMultiSelect]; //      ofFileMustExist
//  OpenDialog1.InitialDir:='C:\';
  OpenDialog1.Filter:=
   'Text and Excel files (*.atf)|*.atf';
//  'All files (*.*)|*.*|Text files (*.txt)|*.txt|Excel files (*.csv)|*.csv';

  if OpenDialog1.Execute then
 begin
    Fn:=OpenDialog1.FileName;
    ImportATFfile(Fn);
//    memo1.lines.Add(OpenDialog1.Files[i])
 end;// if
end;// proc



procedure TFPlot.Button41Click(Sender: TObject);
var j, i:integer;
x,y: double;
begin
// x1x2 to text
fEdit.Visible:=true;
fEdit.BringToFront;
j:= FirstMarkedtrace;
fEdit.Memo1.Clear;
with Curs do
begin
  if (x1=0) and (x2=0) then exit;

for i:=FindXi(j, x1) to FindXi(j, x2) do
 Begin
         x:= FLS[j].XValues.Value[i];
         y:= FLS[j].YValues.Value[i];
   fEdit.Memo1.Lines.Add(InttoStr(i)+#9+FloatToStrF(x, ffGeneral,8,8)+#9+FloatToStrF(y, ffGeneral,8,8));
 end; // for i
end;// with
end;// proc


procedure TFPlot.Button42Click(Sender: TObject); // repair
var j, i, ii:integer;
x,y: double;
s, s0, s1, s2 : string;
begin
j:= FirstMarkedtrace;
for i := 0 to fEdit.Memo1.Lines.Count -1 do
  begin
   s:=  fEdit.Memo1.Lines[i];
   s0:=TabStr(s,1);
   s1:= TabStr(s,2);
   s2:=TabStr(s,3);
   if tryStrToInt(s0, ii) then
   if tryStrToFloat(s1, x) then
   if tryStrToFloat(s2, y) then
    begin
         FLS[j].XValues.Value[ii]:=x;
         FLS[j].YValues.Value[ii]:=y;
    end;

  end;
FLS[j].Repaint;

end;



procedure TFPlot.Button46Click(Sender: TObject);
begin
// show text
fEdit.Visible:=true;
fEdit.BringToFront;
end;


procedure TFPlot.Button47Click(Sender: TObject);
// high pass
var  iTotal, NumbOfCoeff, j, i:longint;
CutOffFreq1,Rate1, Period1:double;
DataArray1:PDoubleArray;
y, y1, y2: double;
begin
// filtering
CutOffFreq1:=StrToFloat(Edit30.text);
for j:=1 to ItemsOutCount1 do
if Pnam[j].PCheck.Checked then
begin
  iTotal:=FLS[j].Count;
  getmem(DataArray1,iTotal*sizeof(double));
  for i:=0 to iTotal-1 do DataArray1[i]:= FLS[j].YValues.Value[i];
  Period1:= FLS[j].XValues.Value[2]-FLS[j].XValues.Value[1];
//  SaveColor:=FLS[ItemsOutCount].SeriesColor;
  if CheckBox17.Checked then Rate1:=1000/Period1 else Rate1:=1/Period1;
  GausFilter1(DataArray1,  CutOffFreq1, Rate1,  0, iTotal-1,iTotal, 2,  NumbOfCoeff);
 y2:= mindouble;
 y1:=maxdouble;
  for i:=0 to iTotal-1 do
   begin
    y:=FLS[j].YValues.Value[i]-DataArray1[i];
    if y>y2 then y2:=y;
    if y<y1 then y1:=y;
    FLS[j].YValues.Value[i]:=y;
   end;
  FLS[j].Repaint;
//     Application.ProcessMessages;

     with FPlot.EasyChart.leftaxis do
      begin
        Automatic:=false;
        if maximum > y1 then
         begin
           minimum:= y1;
           maximum:= y2;
         end  else
         begin
           maximum:= y2;
           minimum:= y1;
         end;
      end;

 //EasyChart.bottomaxis.Automatic:=true;
// EasyChart.LeftAxis.Automatic:=true;
// EasyChart.UndoZoom;

  freemem(DataArray1);
end;// if
//  PlotFvsT;
end;// proc



procedure TFPlot.Button43Click(Sender: TObject);
var i, j:integer;
x1,y1,x2,y2:double;
xx,yy:double;
i1, i2: integer;
begin
// interpolate x1 to x2
//Function FindXi(ArrayIndex:longint; Xcross:double):longint;
 RefreshCursors;

j:= FirstMarkedTrace;
x1:= Curs.X1;
x2:= Curs.X2;

i1:= FindXi(j, x1);
i2:= FindXi(j, x2);
y1:= FLS[j].YValues.Value[i1];
y2:= FLS[j].YValues.Value[i2];
x1:= FLS[j].XValues.Value[i1];
x2:= FLS[j].XValues.Value[i2];


for i:=i1+1 to i2-1 do
 Begin
         xx:= FLS[j].XValues.Value[i];
         yy:= InterPolY(x1,y1, x2, y2, xx);
         FLS[j].YValues.Value[i]:= yy;
 end; // for i

  FLS[j].Repaint;


end;


procedure TFPlot.Button44Click(Sender: TObject);
var j, i: integer;
F, maxAll, MinAll, y1, y2: double;
Ar: array of double;
max1, min1: double;
count1: integer;

begin
// min max
  maxAll:= mindouble;
  MinAll:= maxdouble;

  for j:=1 to ItemsOutCount1 do
  if Pnam[j].PCheck.Checked then
 begin
   count1:= FLS[j].count;
   setlength(ar, count1);

   for i := 0 to count1 -1 do ar[i]:= FLS[j].YValues.Value[i];

   //  if FLS[j].YValues.MaxValue> maxAll then  maxAll:= FLS[j].YValues.MaxValue;
  //  if FLS[j].YValues.MinValue< minAll then  minAll:= FLS[j].YValues.MinValue;
   // if FLS[j].MaxYValue> maxAll then  maxAll:= FLS[j].MaxYValue;
  //   if FLS[j].MinYValue < minAll then  minAll:= FLS[j].MinYValue;
  max1:= maxvalue(ar);
  min1:= minvalue(ar);

  if max1> maxAll then maxAll:= max1;
  if min1< minAll then minAll:= min1;

   ar:= nil;

   end;


   y1:= MinAll;
   y2:= maxAll;

        with FPlot.EasyChart.leftaxis do
        begin
          Automatic:=false;
          if maximum > y1 then
           begin
             minimum:= y1;
             maximum:= y2;
           end  else
           begin
             maximum:= y2;
             minimum:= y1;
           end;
        end;

end; // proc



Procedure FindMaxMinMeanSeries(Seri: integer; var max1, min1, mean1, SD1: double);
var count1, i: integer;
Ar: array of double;
begin
count1:=FLS[Seri].Count;
setlength(ar, count1);
for i := 0 to count1-1 do ar[i]:= FLS[Seri].YValues.Value[i];
max1:= maxvalue(ar);
min1:= minvalue(ar);
mean1:= mean(ar);
SD1:= stddev(ar);
ar:= nil;
end;


procedure TFPlot.FFmean1Click(Sender: TObject);
//     F/Fmean
var i, j:longint;
var max1, min1, mean1, SD1: double;
begin
  RefreshCursors;
  for j:=1 to ItemsOutCount1 do
  if Pnam[j].PCheck.Checked then
  begin
    FindMaxMinMeanSeries(j, max1, min1, mean1, SD1);
   if mean1<>0 then
   for i:=0 to FLS[j].Count-1 do FLS[j].YValues.Value[i] := FLS[j].YValues.Value[i]/mean1;
   FLS[j].Repaint;
  end;
  FPlot.Button44.Click;
end; // proc



procedure TFPlot.FFmin1Click(Sender: TObject);
 //F/Fmin
var i, j:longint;
var max1, min1, mean1, SD1: double;
begin
  RefreshCursors;
  for j:=1 to ItemsOutCount1 do
  if Pnam[j].PCheck.Checked then
  begin
    FindMaxMinMeanSeries(j, max1, min1, mean1, SD1);
   if min1<>0 then
   for i:=0 to FLS[j].Count-1 do FLS[j].YValues.Value[i] := FLS[j].YValues.Value[i]/min1;
   FLS[j].Repaint;
  end;

FPlot.Button44.Click;

end; // proc


procedure TFPlot.FFminFmaxFmin1Click(Sender: TObject);
      //(F-Fmin)/(Fmax-Fmin)
var i, j:longint;
 max1, min1, mean1, SD1: double;
ampl: double;

begin
  RefreshCursors;
  for j:=1 to ItemsOutCount1 do
  if Pnam[j].PCheck.Checked then
  begin
    FindMaxMinMeanSeries(j, max1, min1, mean1, SD1);
    ampl:= max1-min1;
    if ampl<>0 then
   for i:=0 to FLS[j].Count-1 do
    begin
       FLS[j].YValues.Value[i] := (FLS[j].YValues.Value[i]-min1)/ampl;
    end;
   FLS[j].Repaint;
  end;

  FPlot.Button44.Click;
end; // proc


procedure TFPlot.Button49Click(Sender: TObject);
//minmaxX
var j, i: integer;
F, maxAll, MinAll, x1, x2: double;
Ar: array of double;
max1, min1: double;
count1: integer;

begin
// min max
  maxAll:= mindouble;
  MinAll:= maxdouble;

  for j:=1 to ItemsOutCount1 do
  if Pnam[j].PCheck.Checked then
 begin
   count1:= FLS[j].count;
   setlength(ar, count1);

   for i := 0 to count1 -1 do ar[i]:= FLS[j].XValues.Value[i];

   //  if FLS[j].YValues.MaxValue> maxAll then  maxAll:= FLS[j].YValues.MaxValue;
  //  if FLS[j].YValues.MinValue< minAll then  minAll:= FLS[j].YValues.MinValue;
   // if FLS[j].MaxYValue> maxAll then  maxAll:= FLS[j].MaxYValue;
  //   if FLS[j].MinYValue < minAll then  minAll:= FLS[j].MinYValue;
  max1:= maxvalue(ar);
  min1:= minvalue(ar);

  if max1> maxAll then maxAll:= max1;
  if min1< minAll then minAll:= min1;

   ar:= nil;

   end;


   x1:= MinAll;
   x2:= maxAll;

        with FPlot.EasyChart.bottomaxis do
        begin
          Automatic:=false;
          if maximum > x1 then
           begin
             minimum:= x1;
             maximum:= x2;
           end  else
           begin
             maximum:= x2;
             minimum:= x1;
           end;
        end;

end; // proc

end.

