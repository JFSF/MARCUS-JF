unit COLISION.API.View.Pages.Index;

interface

uses
  FMX.Controls,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Objects,
  FMX.Types,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TpgIndex = class(TForm)
    lytContainer   : TLayout;
    rctnglContainer: TRectangle;

    procedure FormCreate(Sender: TObject);

  private

  public

  end;

var pgIndex: TpgIndex;

implementation

uses
  COLISION.API.View.Pages.Main,

  Router4D;

{$R *.fmx}

procedure TpgIndex.FormCreate(Sender: TObject);
begin
  TRouter4D.Render<TpgMain>.SetElement(lytContainer, lytContainer);
end;

end.
