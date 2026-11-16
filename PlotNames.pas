unit PlotNames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  myMath;

type
  TfPlotNames = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPlotNames: TfPlotNames;


Type PAtr=record
         PVal,PStr: TLabel;
         PCheck:TCheckBox;
         end;

// Const MaxNumPlots=1000;//   Maximim number of plots

var PNam :array[1..MaxNumberOfPlots2] of  PAtr;


LabelTest: TLabel;

implementation

{$R *.dfm}





end.
