program API;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  COLISION.API.View.Pages.Index in 'src\View\Pages\COLISION.API.View.Pages.Index.pas' {pgIndex},
  COLISION.API.View.Pages.Main in 'src\View\Pages\Main\COLISION.API.View.Pages.Main.pas' {pgMain},
  COLISION.API.View.Rotas in 'src\View\Rotas\COLISION.API.View.Rotas.pas',
  COLISION.API.View.Modules.Titulo in 'src\View\Modules\COLISION.API.View.Modules.Titulo.pas' {cmpTitulo: TFrame},
  COLISION.API.View.Modules.SysBotoes in 'src\View\Modules\COLISION.API.View.Modules.SysBotoes.pas' {cmpBtnSys: TFrame},
  COLISION.API.Services.Utils in 'src\Services\COLISION.API.Services.Utils.pas',
  COLISION.API.View.Modules.DataHora in 'src\View\Modules\COLISION.API.View.Modules.DataHora.pas' {cmpDataHora: TFrame},
  COLISION.API.View.Modules.SocialBotoes in 'src\View\Modules\COLISION.API.View.Modules.SocialBotoes.pas' {cmpBtnSocial: TFrame},
  COLISION.API.Services.Globais in 'src\Services\COLISION.API.Services.Globais.pas',
  COLISION.API.View.Modules.MainMenu in 'src\View\Modules\COLISION.API.View.Modules.MainMenu.pas' {cmpMainMenu: TFrame},
  COLISION.API.View.Modules.BotaoMenu in 'src\View\Modules\COLISION.API.View.Modules.BotaoMenu.pas' {cmpBotaoSimples: TFrame},
  COLISION.API.View.Pages.Home in 'src\View\Pages\Home\COLISION.API.View.Pages.Home.pas' {pgHome},
  COLISION.API.View.Pages.Infos in 'src\View\Pages\Infos\COLISION.API.View.Pages.Infos.pas' {pgInfos};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TpgIndex, pgIndex);
  Application.Run;
end.
