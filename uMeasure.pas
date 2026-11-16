unit uMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfMeasure = class(TForm)
    Memo1: TMemo;
    Button13: TButton;
    CheckBox2: TCheckBox;
    Button17: TButton;
    Button14: TButton;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMeasure: TfMeasure;

implementation

{$R *.dfm}

procedure TfMeasure.Button13Click(Sender: TObject);
begin
Memo1.Lines.SaveToFile('C:\Cursors.txt');
end;

procedure TfMeasure.Button14Click(Sender: TObject);
begin
 Memo1.SelectAll;
 Memo1.CopyToClipboard;
end;

procedure TfMeasure.Button17Click(Sender: TObject);
begin
Memo1.Clear;
end;


end.
