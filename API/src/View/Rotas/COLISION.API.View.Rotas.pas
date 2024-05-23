unit COLISION.API.View.Rotas;

interface

type
  TRotas = class
    private

    public
      constructor Create();
      destructor  Destroy; override;

      class function New: TRotas;
  end;

var Rotas: TRotas;

implementation

uses
  COLISION.API.View.Pages.Main,
  COLISION.API.View.Modules.Titulo,
  COLISION.API.View.Modules.SysBotoes,
  COLISION.API.View.Modules.DataHora,
  COLISION.API.View.Modules.SocialBotoes,
  COLISION.API.View.Modules.MainMenu,
  COLISION.API.View.Pages.Home,
  COLISION.API.View.Pages.Infos,

  Router4D;

constructor TRotas.Create;
begin
  TRouter4D
    .Switch
      .Router('Titulo',       TcmpTitulo)
      .Router('BotoesSys',    TcmpBtnSys)
      .Router('DataHora',     TcmpDataHora)
      .Router('BotoesSocial', TcmpBtnSocial)
      .Router('MainMenu',     TcmpMainMenu)
      .Router('Main',         TpgMain)
      .Router('Home',         TpgHome)
      .Router('Infos',        TpgInfos);
end;

destructor TRotas.Destroy;
begin
  //
  inherited;
end;

class function TRotas.New: TRotas;
begin
  Result := Self.Create;
end;

initialization
  Rotas := TRotas.New;

finalization
  Rotas.Free;

end.
