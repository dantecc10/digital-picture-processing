unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ExtDlgs,
  Menus, LCLIntf, ComCtrls;

//LCLIntf permite métodos Getrvalue, Getrvalue, Getrvalue

type
  MATRGB = Array of Array of Array of byte;

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    StatusBar1: TStatusBar;
    procedure MenuItem1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  ALTO, ANCHO: Integer;
  MAT: MATRGB;

implementation

{$R *.lfm}



{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  // Abrir la imagen
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

  end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  CL: Tcolor;
  R, G, B: byte;
begin
  StatusBar1.Panels[1].Text:=Inttostr(X);
  StatusBar1.Panels[2].Text:=Inttostr(Y);

  CL:= Image1.Canvas.Pixels[X, Y];
  R:=GetRValue(CL);
  G:=GetGValue(CL);
  B:=GetBValue(CL);

  StatusBar1.Panels[4].Text:=IntToStr(R)+', ' + IntToStr(G)+', ' + IntToStr(B);
end;

end.

