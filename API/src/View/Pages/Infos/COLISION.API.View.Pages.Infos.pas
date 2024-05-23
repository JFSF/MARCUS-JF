unit COLISION.API.View.Pages.Infos;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Types,

  Router4D.Interfaces,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TpgInfos = class(TForm, iRouter4DComponent)
    lytContainer : TLayout;
    lytTop       : TLayout;
    lblInfos     : TLabel;
    lytBody      : TLayout;
    lblHost      : TLabel;
    rctnglHost   : TRectangle;
    lblInfoHost  : TLabel;
    lblPubIP     : TLabel;
    rctnglPubIP  : TRectangle;
    lblPrivIP    : TLabel;
    rctnglPrivIP : TRectangle;
    lblUser      : TLabel;
    rctnglOS     : TRectangle;
    lblInfoOS    : TLabel;
    lblInfoPubIP : TLabel;
    lblInfoPrivIP: TLabel;
    rctnglUser   : TRectangle;
    lblOS        : TLabel;
    lblInfoUser  : TLabel;
    lblData      : TLabel;
    lblHora      : TLabel;
    rctnglData   : TRectangle;
    rctnglHora   : TRectangle;
    lblInfoData  : TLabel;
    lblInfoHora  : TLabel;
    tmrInfos     : TTimer;

    procedure tmrInfosTimer(Sender: TObject);

  private

  public
    function  Render: TFmxObject;

    procedure UnRender;
  end;

implementation

uses
  COLISION.API.Services.Utils;

{$R *.fmx}

function TpgInfos.Render: TFmxObject;
begin
  lblInfoHost.Text   := TUtils.GetHost;
  lblInfoOS.Text     := TUtils.GetOS;
  lblInfoPubIP.Text  := TUtils.GetPubIP;
  lblInfoPrivIP.Text := TUtils.GetPrvIP;
  lblInfoData.Text   := FormatDateTime('dddd", "dd" de "mmmm " de "yyyy', Now);
  lblInfoHora.Text   := FormatDateTime('hh"H "nn"m "ss"s"', Now);

  Result := lytContainer;
end;

procedure TpgInfos.tmrInfosTimer(Sender: TObject);
begin
  lblInfoData.Text  := FormatDateTime('dddd", "dd" de "mmmm " de "yyyy', Now);
  lblInfoHora.Text  := FormatDateTime('hh"H "nn"m "ss"s"', Now);
end;

procedure TpgInfos.UnRender;
begin
  //
end;

end.
