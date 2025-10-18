unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ComCtrls, ExtCtrls, ExtDlgs, StdCtrls;

type
  RGB_MATRIX = Array of Array of Array of byte;

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ScrollBox1: TScrollBox;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MenuItem2Click(Sender: TObject);
  private

  public
    // Procedimiento para copiar una imagen a una matriz
    procedure copyImageToMatrix(imageHeight, imageWidth: Integer; B: TBitmap; var matrix:RGB_MATRIX);

    // Proedimiento para copiar una matriz a una imagen
    procedure copyMatrixToImage(imageHeight, imageWidth: Integer; matrix:RGB_MATRIX; var B:TBitmap);
  end;

var
  Form1: TForm1;

  HEIGHT, WIDTH: Integer;
  MATRIX: RGB_MATRIX;

  BITMAP: TBitmap;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.copyImageToMatrix(imageHeight, imageWidth: Integer; B: TBitmap; var matrix:RGB_MATRIX);
var
  i, j, k: Integer;
  P: PByte;
begin
  for i:=0 to imageHeight-1 do
  begin
    B.BeginUpdate;
    P:= B.ScanLine[i];
    B.EndUpdate;

    for j:=0 to imageWidth-1 do
    begin
      k:= 3 * j;
      matrix[j, i, 0]:= P[k + 2]; // R
      matrix[j, i, 1]:= P[k + 1]; // G
      matrix[j, i, 2]:= P[k + 0]; // B
    end; // j
  end; // i
end;

procedure TForm1.copyMatrixToImage(imageHeight, imageWidth: Integer; matrix:RGB_MATRIX; var B:TBitmap);
var
  i, j, k: Integer;
  P: PByte;
begin
  for i:=0 to imageHeight-1 do
  begin
    B.BeginUpdate;
    P:= B.ScanLine[i];
    B.EndUpdate;
    for j:=0 to imageWidth-1 do
    begin
      k:= 3 * j;
      P[k + 2]:= matrix[j, i, 0]; // R
      P[k + 1]:= matrix[j, i, 1]; // G
      P[k + 0]:= matrix[j, i, 2]; // B
    end; // j
  end; // i
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  BITMAP:= TBitmap.Create; // Instanciar objeto de la clase TBitmap
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  StatusBar1.Panels[1].Text:= IntToStr(X);
  StatusBar1.Panels[2].Text:= IntToStr(Y);
  StatusBar1.Panels[4].Text:= IntToStr(MATRIX[x, y, 0]) + ', ' + IntToStr(MATRIX[x, y, 1]) + ', ' + IntToStr(MATRIX[x, y, 2]);
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  // Seleccionar imagen
  if OpenPictureDialog1.Execute then
  begin
    Image1.Enabled:= True;
    BITMAP.LoadFromFile(OpenPictureDialog1.Filename);
    HEIGHT:= BITMAP.Height;
    WIDTH:= BITMAP.Width;

    if BITMAP.PixelFormat <> pf24bit then // Garantizar 8 bits por canal
    begin
      BITMAP.PixelFormat:= pf24bit;
    end;
    StatusBar1.Panels[6].Text:= IntToStr(HEIGHT) + ' x ' + IntToStr(WIDTH);
    SetLength(MATRIX, WIDTH, HEIGHT, 3);
    // Cargar imagen a matriz usando
    copyImageToMatrix(HEIGHT, WIDTH, BITMAP, MATRIX);
    Image1.Picture.Assign(BITMAP);
  end;
end;

end.

