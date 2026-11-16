program ML_model_T_via_jup;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  myMath in 'myMath.pas',
  UPlot2 in 'UPlot2.pas' {FPlot},
  uFit2 in 'uFit2.pas',
  PlotNames in 'PlotNames.pas' {fPlotNames},
  uMeasure in 'uMeasure.pas' {fMeasure},
  uEdit in 'uEdit.pas' {fEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFPlot, FPlot);
  Application.CreateForm(TfPlotNames, fPlotNames);
  Application.CreateForm(TfMeasure, fMeasure);
  Application.CreateForm(TfEdit, fEdit);
  Application.Run;
end.
