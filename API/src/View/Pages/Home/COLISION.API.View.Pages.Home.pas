unit COLISION.API.View.Pages.Home;

interface

uses
  FMX.Controls,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Skia,
  FMX.Types,

  Router4D.Interfaces,

  System.Classes,
  System.Skia,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TpgHome = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    ansvgHome   : TSkAnimatedImage;

  private

  public
    function  Render: TFmxObject;

    procedure UnRender;
  end;

implementation

{$R *.fmx}

function TpgHome.Render: TFmxObject;
begin
  Result := lytContainer;
end;

procedure TpgHome.UnRender;
begin
  //
end;

end.
