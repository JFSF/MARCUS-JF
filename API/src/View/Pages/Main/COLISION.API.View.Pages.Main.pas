unit COLISION.API.View.Pages.Main;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.MultiView,
  FMX.StdCtrls,
  FMX.Types,

  Router4D.Interfaces,
  Router4D.Props,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TpgMain = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    lytTopBar   : TLayout;
    lytBottomBar: TLayout;
    lytBtnGrip  : TLayout;
    szgrpMain   : TSizeGrip;
    lytBtnSys   : TLayout;
    lytTitulo   : TLayout;
    lytBtnSocial: TLayout;
    lytDataHora : TLayout;
    mltvwMain   : TMultiView;
    lytBody     : TLayout;
    lytMenu     : TLayout;

  private

  public
    function  Render: TFmxObject;

    procedure UnRender;

    [Subscribe]
    procedure Props(const AProps: TProps);
  end;

implementation

uses
  COLISION.API.View.Pages.Home,

  Router4D;

{$R *.fmx}

procedure TpgMain.Props(const AProps: TProps);
begin
  if AProps.Key = 'Open' then
     mltvwMain.Size.Width := 205;

  if AProps.Key = 'Close' then
     mltvwMain.Size.Width := 55;
end;

function TpgMain.Render: TFmxObject;
begin
  TRouter4D.Link.&To('Titulo',       lytTitulo);
  TRouter4D.Link.&To('BotoesSys',    lytBtnSys);
  TRouter4D.Link.&To('DataHora',     lytDataHora);
  TRouter4D.Link.&To('BotoesSocial', lytBtnSocial);
  TRouter4D.Link.&To('MainMenu',     lytMenu);

  TRouter4D.Render<TpgHome>.SetElement(lytBody, lytBody);

  GlobalEventBus.RegisterSubscriber(Self);

  Result := lytContainer;
end;

procedure TpgMain.UnRender;
begin
  //
end;

end.
