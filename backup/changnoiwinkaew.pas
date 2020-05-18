unit changnoiwinkaew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;



type
  TVAT= class(Tobject)
      private
      FAmount:Extended;
      FVatamt:Extended;
      FVattype:String;
      public
       procedure  CalulatedVAT(Value:Extended);
       property Amount:Extended Read FAmount write CalulatedVAT;
       property Vatamt:Extended read FVatamt;
       property Vattype:String read FVattype;
      end;

implementation

   procedure TVAT.CalulatedVAT(Value:Extended);
   var
     vattype:String;
   begin
     Fvattype := 'ExcludeVat';
     WriteLn(vattype);
     if VatType = 'ExcludeVat'
     then
        FVatamt:=Value * 0.07
        else
         FVatamt:= value * (107/100);
     Famount:=Value;
   end;
end.

