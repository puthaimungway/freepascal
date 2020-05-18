unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,changnoiwinkaew;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  V1:TVAT;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);

begin

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
   with Sender as TEdit do
   //ShowMessage('Begin');
   case Key of
   '0'..'9' : ShowMessage('0-9 was pressed.');
   '.', ',' : ShowMessage('Period or Comma was pressed.');
   #8 :  ;
   #13 : begin
            ShowMessage('#13 was pressed.');
          v1:=TVAT.Create;
          v1.CalulatedVAT(StrToCurr(edit1.Text));
          Label1.Caption:=FloatToStr(v1.Vatamt);
          Key := #0;
         end;
   #10 : begin
         Key := #0;
         end;
   else
         Key := #0;
end;



end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: char);
begin
  //EdKeyPress:=True;
  if not (Key in ['0'..'9','-','.',#13,#9,#8]) then
  begin  //if not numbers 0 to 9, minus, period, ENTER, TAB or BACKSPACE key.
    ShowMessage(Key +' Key is not Invalid');
    Key := #0;
  end
  else if ((Key = '.') or (Key = '-')) and
          (Pos(Key, (Sender as TEdit).Text) > 0) then
  begin
    ShowMessage('Cannot have two ' + Key + ' keys');
    Key := #0;
  end
  else if (Key = '-') and ((Sender as TEdit).SelStart <> 0) then
  begin
    ShowMessage(Key + ' Must be at start of number');
    Key := #0;
  end
  else if (Key = #13) and ((Sender as TEdit).SelStart = 0) then
  begin
    ShowMessage(' A number must be entered');
    v1:=TVAT.Create;
          v1.CalulatedVAT(StrToCurr(edit2.Text));
          Label1.Caption:=FloatToStr(v1.Vatamt);
    Key := #0;
end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
  Edit1.Clear;
  end;

end.

