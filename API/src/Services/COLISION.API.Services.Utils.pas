unit COLISION.API.Services.Utils;

interface

uses
  FMX.Objects,
  FMX.Skia,
  FMX.Types,

  System.Skia,
  System.UITypes;

type
  TUtils = class
    private
      class function GetMachineWin                       : string;
      class function GetMachineMac                       : string;
      class function GetMachineLnx                       : string;

    public
      class function GetPubIP                            : string;
      class function GetPrvIP                            : string;
      class function GetHost                             : string;
      class function GetOS                               : string;
      class function UpperCamelCase(const ATexto: string): string;

      class procedure AlterarCor(const AComponente: TImage; const ACor          : TAlphaColor); overload;
      class procedure AlterarCor(const AComponente: TSkSvg; const ACor          : TAlphaColor); overload;
      class procedure ChamarImagem(const AComponente: TImage; const ARecurso    : string);      overload;
      class procedure ChamarImagem(const AComponente: TFmxObject; const ARecurso: string);      overload;
      class procedure ChamarImagem(const AComponente: TSkSvg; const ARecurso    : string);      overload;
  end;

implementation

uses
  FMX.Forms,
  FMX.Platform,

  IdHTTP,
  IdStack,
  IdGlobal,
  IdStackBSDBase,
  IdStackConsts,
  IdIPWatch,

  {$IFDEF MSWINDOWS}
  Winapi.Windows,
  IdStackWindows,
  {$ENDIF}

  {$IFDEF POSIX}
  Posix.UniStd,
  Posix.SysUtsname,
  {$ENDIF}

  System.Classes,
  System.IOUtils,
  System.SysUtils,
  System.Types;

class procedure TUtils.AlterarCor(const AComponente: TImage; const ACor: TAlphaColor);
begin
  AComponente.Bitmap.ReplaceOpaqueColor(ACor);
end;

class procedure TUtils.AlterarCor(const AComponente: TSkSvg; const ACor: TAlphaColor);
begin
  AComponente.Svg.OverrideColor  := ACor;
end;

class procedure TUtils.ChamarImagem(const AComponente: TImage; const ARecurso: string);
begin
  var TLRecurso := TResourceStream.Create(HInstance, ARecurso, RT_RCDATA);

  try
    AComponente.Bitmap.LoadFromStream(TLRecurso);
  finally
    TLRecurso.Free
  end;
end;

class procedure TUtils.ChamarImagem(const AComponente: TSkSvg; const ARecurso: string);
begin
  var LSvg     :=  TStringStream.Create('');
  var LRecurso := TResourceStream.Create(HInstance, ARecurso, RT_RCDATA);

  try
    LSvg.LoadFromStream(LRecurso);

    AComponente.Svg.Source  := LSvg.DataString;
  finally
    LSvg.Free;
    LRecurso.Free;
  end;
end;

class procedure TUtils.ChamarImagem(const AComponente: TFmxObject; const ARecurso: string);
begin
  var LRecurso  := TResourceStream.Create(HInstance, ARecurso,  RT_RCDATA);

  try
    TShape(AComponente).Fill.Bitmap.Bitmap.LoadFromStream(LRecurso);
  finally
    LRecurso.Free;
  end;
end;

class function TUtils.GetHost: string;
begin

  case TOSVersion.Platform of
       pfWindows: Result := GetMachineWin;
       pfMacOS  : Result := GetMachineMac;
       pfLinux  : Result := GetMachineLnx;
  end;
end;

class function TUtils.GetPrvIP: string;
begin

end;

class function TUtils.GetPubIP: string;
begin
  with TIdHTTP.Create do
       try
         Result := Get('http://ipinfo.io/ip');
       finally
        Free;
       end;
end;

class function TUtils.GetMachineLnx: string;
begin

end;

class function TUtils.GetMachineMac: string;
begin

end;

class function TUtils.GetMachineWin: string;
begin
  var LBuffer: array [0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  var LSize  : DWORD;

  LSize := Length(LBuffer);

  if GetComputerName(LBuffer, LSize) then
     Result := LBuffer
  else
    Result := 'Desconhecido';
end;

class function TUtils.GetOS: string;
begin
  var LPlatforma := TPlatformServices.Current;

  if LPlatforma.SupportsPlatformService(IFMXWindowService) then
     begin
       case TOSVersion.Platform of
            pfWindows: Result := TOSVersion.ToString;
            pfMacOS  : Result := 'MacOS '   + TOSVersion.ToString;
            pfLinux  : Result := 'Linux '   + TOSVersion.ToString;
       end;
     end;
end;

class function TUtils.UpperCamelCase(const ATexto: string): string;
begin
  Result := UpperCase(Copy(ATexto, 1, 1)) + LowerCase(Copy(ATexto, 2, Length(ATexto)));
end;

end.
