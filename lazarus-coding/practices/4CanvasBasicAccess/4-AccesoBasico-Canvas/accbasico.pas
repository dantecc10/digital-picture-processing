unit Accbasico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ExtDlgs,
  Menus, ComCtrls, LCLIntf, StdCtrls;


  //LCLIntf permite metodos Getrvalue, getgvalue, getbvalue, RGB

type
  //definir tipos propios

  MATRGB= Array of Array of Array of byte;



  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ScrollBox1: TScrollBox;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure MenuItem2Click(Sender: TObject);
    procedure copiaIM(A1, An: Integer; var M: MATRGB);
    procedure paintArea(x, y, area_width, area_height, r, g, b: Integer; var MATRIX: MATRGB);
  private

  public

  end;

var
  Form1: TForm1;
  ALTO, ANCHO : Integer;
  MAT: MATRGB ;  //del tipo propio para alamacenar R,G,B



implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.copiaIM(A1, An: Integer; var M:MATRGB);
  var
    i, j: Integer;
    c1: TColor;
begin
    for i:=0 to An-1 do
    begin
    for j:=0 to A1-1 do
    begin
         c1:=Image1.Canvas.Pixels[j, i];
         M[i, j, 0]:=GetRValue(c1);
         M[i, j, 1]:=GetGValue(c1);
         M[i, j, 2]:=GetBValue(c1);
         end;
    end;
  end;

procedure TForm1.paintArea(x, y, area_width, area_height, r, g, b: Integer; var MATRIX: MATRGB);
var
  i, j: Integer;
  col: TColor;
begin
    if(((x + area_width) < Length(MATRIX)) and ((y + area_height) < Length(MATRIX[0]))) then
    begin
      for i:=x to (x + area_width) do
      begin
           for j:=y to (y + area_height) do
           begin
                MATRIX[i,j,0]:=r;
                MATRIX[i,j,1]:=g;
                MATRIX[i,j,2]:=b;
           end;
      end;
      col:=RGB(MATRIX[i,j,0], MATRIX[i,j,1], MATRIX[i,j,2]);
      copiaIM(Length(MATRIX[0]), Length(MATRIX), MATRIX);
    end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var
  i,j: Integer;
  cl: Tcolor;
begin
  //Abrir la imagen
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    ALTO:=Image1.Height;
    ANCHO:=Image1.Width;

    //matriz para copiar contenido de la imagen
    SetLength(MAT,ALTO,ANCHO,3);
    StatusBar1.Panels[6].Text:=IntToStr(ALTO)+'x'+IntToStr(ANCHO);
  copiaIM(ANCHO, ALTO, MAT);

    //copiar valores RGB a MAT

     for i:=0 to ALTO-1 do
     begin
        for j:=0 to ANCHO-1 do
        begin
         cl:=Image1.Canvas.Pixels[j,i];
         MAT[i,j,0]:=GetRValue(cl);
         MAT[i,j,1]:=GetGValue(cl);
         MAT[i,j,2]:=GetBValue(cl);
        end;//j

     end; //i



  end;



end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Cl: Tcolor;
  R,G,B : Byte;
begin

  StatusBar1.Panels[1].Text:=Inttostr(X);
  StatusBar1.Panels[2].Text:=Inttostr(Y);

  //Acceso desde canvas a RGB

    //Leer completo valor de 24bits en color
    CL:=Image1.Canvas.Pixels[X,Y];

    //LEER R,G,B
   { R:=GetRValue(CL);
    G:=GetGValue(CL);
    B:=GetBValue(CL);


    StatusBar1.Panels[4].Text:= IntToStr(MAT[x,y,0])+','+IntToStr(MAT[x,y,1])+','+IntToStr(MAT[x,y,2]);

     }



end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  paintArea(4, 4, 50, 30, 35, 67, 10, MAT);
end;

end.

