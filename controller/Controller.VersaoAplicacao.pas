unit Controller.VersaoAplicacao;

interface

uses
  Winapi.Windows, System.Classes, System.SysUtils;

  type

    TVersaoAplicacaoController = class(TObject)
    private
      class var VersaoAplicacao : TVersaoAplicacaoController;

      FVersaoAplicacao : TStringList;
      constructor PrivateCreate;

      procedure SetCompanyName(const Value : String);

      function GetCompanyName : String;
      function GetFileVersion : String;
      function GetOriginalFilename : String;
      function GetProductName : String;
      function GetProductVersion : String;
      function GetProductKey : String;
      function GetLegalCopyright : String;
      function GetFileDescription : String;
      function GetSplashName : String;
      function GetSplashDescription : String;
    protected
      constructor Create;
    public
      property CompanyName: String read GetCompanyName write SetCompanyName;
      property FileVersion: String read GetFileVersion;
      property OriginalFilename: String read GetOriginalFilename;
      property ProductName: String read GetProductName;
      property ProductVersion: String read GetProductVersion;
      property ProductKey: String read GetProductKey;
      property LegalCopyright : String read GetLegalCopyright;
      property FileDescription : String read GetFileDescription;
      property SplashName : String read GetSplashName;
      property SplashDescription : String read GetSplashDescription;

      class function GetInstance : TVersaoAplicacaoController;
      function getPropertyValue(propName: String): String;
    end;

const
  ivCOMPANY_NAME      = 'CompanyName';
  ivFILE_DESCRIPTION  = 'FileDescription';
  ivFILE_VERSION      = 'FileVersion';
  ivINTERNAL_NAME     = 'InternalName';
  ivLEGAL_COPYRIGHT   = 'LegalCopyright';
  ivLEGAL_TRADEMARKS  = 'LegalTradeMarks';
  ivORIGINAL_FILENAME = 'OriginalFilename';
  ivPRODUCT_NAME      = 'ProductName';
  ivPRODUCT_VERSION   = 'ProductVersion';
  ivPRODUCT_KEY       = 'ProductKey';
  ivCOMMENTS          = 'Comments';
  ivRELEASE_DATE      = 'ReleaseDate';
  ivSYSTEM_ANALYST    = 'Systems Analyst';
  ivCONTACTS          = 'Contacts';
  ivOWNER             = 'Owner';
  ivSPLASHNAME        = 'SplashName';
  ivSPLASHDESCRIPTION = 'SplashDescription';

implementation

{ TVersaoAplicacaoController }

class function TVersaoAplicacaoController.GetInstance : TVersaoAplicacaoController;
begin
  if not Assigned(VersaoAplicacao) then
    VersaoAplicacao := TVersaoAplicacaoController.PrivateCreate;

  Result := VersaoAplicacao;
end;

function TVersaoAplicacaoController.GetLegalCopyright: String;
begin
  Result := getPropertyValue(ivLEGAL_COPYRIGHT);
end;

function TVersaoAplicacaoController.GetOriginalFilename: String;
begin
  Result := getPropertyValue(ivORIGINAL_FILENAME);
end;

function TVersaoAplicacaoController.GetCompanyName: String;
begin
  Result := getPropertyValue(ivCOMPANY_NAME);
end;

function TVersaoAplicacaoController.getPropertyValue(propName: String): String;
type
  PLandCodepage = ^TLandCodepage;
  TLandCodepage = record
    wLanguage,
    wCodePage: word;
  end;
var
  Pntr      : Pointer;
  infoSize  : Cardinal;
  buffer    ,
  valorLido : PChar;
  tamanhoValorLido : Cardinal;
  appName  : String;
  Language : String;
begin

  appName  := ParamStr(0);
  Result   := EmptyStr;
  infoSize := GetFileVersionInfoSize(PChar(appName), infoSize);

  if ( infoSize > 0 ) then
  begin
    buffer := AllocMem(infoSize);

    try

      GetFileVersionInfo(PChar(appName), 0, infoSize, buffer);

      if not VerQueryValue(buffer, '\VarFileInfo\Translation\', Pntr, infoSize) then
        RaiseLastOSError;

      Language := Format('%.4x%.4x', [PLandCodepage(Pntr)^.wLanguage, PLandCodepage(Pntr)^.wCodePage]);

      if VerQueryValue(buffer, PChar('StringFileInfo\' + Language + '\' + propName), Pointer(valorLido), tamanhoValorLido) then
      begin

       valorLido := PChar(Trim(valorLido));

       if ( Length(valorLido) > 0 ) then
         Result := valorLido;

      end;

    finally
      FreeMem(buffer, infoSize);
    end;

  end;

end;

function TVersaoAplicacaoController.GetSplashDescription: String;
begin
  Result := getPropertyValue(ivSPLASHDESCRIPTION);
end;

function TVersaoAplicacaoController.GetSplashName: String;
begin
  Result := getPropertyValue(ivSPLASHNAME);
end;

procedure TVersaoAplicacaoController.SetCompanyName(const Value: String);
begin
  FVersaoAplicacao.Values[ivCOMPANY_NAME] := Value;
end;

constructor TVersaoAplicacaoController.PrivateCreate;
begin
  inherited Create;
  FVersaoAplicacao := TStringList.Create;
end;

constructor TVersaoAplicacaoController.Create;
begin
  raise Exception.Create('Para obter um TVersaoAplicacaoController invoque o método GetInstance().');
end;

function TVersaoAplicacaoController.GetFileDescription: String;
begin
  Result := getPropertyValue(ivFILE_DESCRIPTION);
end;

function TVersaoAplicacaoController.GetFileVersion: String;
begin
  Result := getPropertyValue(ivFILE_VERSION);
end;

function TVersaoAplicacaoController.GetProductKey: String;
begin
  Result := getPropertyValue(ivPRODUCT_KEY);
end;

function TVersaoAplicacaoController.GetProductName: String;
begin
  Result := getPropertyValue(ivPRODUCT_NAME);
end;

function TVersaoAplicacaoController.GetProductVersion: String;
begin
  Result := getPropertyValue(ivPRODUCT_VERSION);
end;

end.
