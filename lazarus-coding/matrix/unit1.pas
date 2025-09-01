unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    fillMatrix: TButton;
    colsInpu: TEdit;
    rowsInput: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MainButton: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure fillMatrixClick(Sender: TObject);
    procedure MainButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  ARR: Array [0..4] of Integer;
  M: Array [0..4, 0..4] of Integer;
  MATD: Array of Array of Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MainButtonClick(Sender: TObject);
var
  i: integer;
  cad: String;
begin
  for i:=0 to 4 do
  begin
       ARR[i]:=random(100);
       cad:=IntToStr(ARR[i]);
       StringGrid1.Cells[i, 0]:=cad;
  end;

end;


procedure TForm1.Button1Click(Sender: TObject);
var
  i, j: Integer;
  cad: String;
begin
  for i:=0 to 4 do
  begin
       for j:=0 to 4 do
       begin
            M[i, j]:=random(400);
            cad:=IntToStr(M[i, j]);
            StringGrid2.Cells[i, j]:=cad;
       end;
  end;
end;

procedure TForm1.fillMatrixClick(Sender: TObject);
var
  i, j, cols, rows: Integer;
begin

end;

end.
