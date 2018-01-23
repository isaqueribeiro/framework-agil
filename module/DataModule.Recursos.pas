(*******************************************************************************
  Autot : Isaque Marinho Ribeiro
  Data  : 29/08/2014

  Objetivo:

  Esta unidade poderá ser usada por todos os formulários do projeto para que estes
  tenham acesso a variáveis (objetos) globais do sistemas. E como recomendação
  para diminuir o acoplamento desnecessário entre diferentes unidades de códigos
  de diferentes projetos, recumenta-se declara neste Data Module apenas objetivos
  que poderão ser usados em todos os projetos sem comprometer a sua compilação.
*******************************************************************************)
unit DataModule.Recursos;

interface

uses
  Controller.VersaoAplicacao,
  Controller.Licenca,
  Controller.Sistema,
  ClasseAgil.Formulario,
  TypeAgil.ComplexTypes,

//  IdCoder,
//  IdCoder3to4,
//  IdCoderMIME,
//  IdBaseComponent,
//
  Winapi.Windows,
  System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.ImgList, Vcl.Controls, Vcl.Dialogs,
  cxClasses, cxLookAndFeels,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsForm, cxGraphics, dxScreenTip, cxEdit,
  dxCustomHint, cxHint, cxStyles;

type
  TDtmRecursos = class(TDataModule)
    SkinController: TdxSkinController;
    LookAndFeelController: TcxLookAndFeelController;
    imgFlat16: TcxImageList;
    imgFlat32: TcxImageList;
    imgFlat32Disable: TcxImageList;
    imgFlat32Hot: TcxImageList;
    StyleControllerHint: TcxHintStyleController;
    StyleControllerDefaultEdit: TcxDefaultEditStyleController;
    imgOffice2013: TcxImageList;
    StyleRepository: TcxStyleRepository;
    stl_Selection: TcxStyle;
    stl_Content: TcxStyle;
    stl_ContentEven: TcxStyle;
    stl_Inactive: TcxStyle;
    svdExportar: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmRecursos : TDtmRecursos;
  gVersaoApp  : TVersaoAplicacaoController;
  gLicencaApp : TLicencaController;
  gSistema    : TSistemaController;
  gFormulario : TFormularios;

//  function EncriptSenha(const Value, Key : String) : String;
//  function DecriptarSenha(const Value, Key : String) : String;
  function ExportTable(const AOnwer : TComponent;
    var aFileName : String; var aExtensao : ct_ExtensaoFileExport) : Boolean;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

//function EncriptSenha(const Value, Key : String) : String;
//var
//  sKeyChar    ,
//  sStrEncode  ,
//  sResult     : String;
//  iTamanhoStr ,
//  iPosicaoKey : Integer;
//  IdEncoder   : TIdEncoderMIME;
//begin
//  IdEncoder := TIdEncoderMIME.Create(nil);
//  try
//    sKeyChar    := IdEncoder.EncodeString(Key);
//    sStrEncode  := IdEncoder.EncodeString(Value);
//    iTamanhoStr := Length(sStrEncode);
//
//    iPosicaoKey := -1;
//    while (iPosicaoKey < 0) do
//      iPosicaoKey := Random(iTamanhoStr);
//
//    sResult := Copy(sStrEncode, 1, iPosicaoKey) + sKeyChar + Copy(sStrEncode, iPosicaoKey + 1, iTamanhoStr);
//
//    Result := sResult;
//  finally
//    IdEncoder.Free;
//  end;
//end;
//
//function DecriptarSenha(const Value, Key : String) : String;
//var
//  sKeyChar   ,
//  sStrEncode : String;
//  IdEncoder  : TIdEncoderMIME;
//  IdDecoder  : TIdDecoderMIME;
//begin
//  IdEncoder := TIdEncoderMIME.Create(nil);
//  IdDecoder := TIdDecoderMIME.Create(nil);
//  try
//    sKeyChar   := IdEncoder.EncodeString(Key);
//    sStrEncode := Value;
//
//    if (Pos(sKeyChar, sStrEncode) = 0)  then
//      raise Exception.Create('Criptografia corrompida!!!')
//    else
//      sStrEncode := StringReplace(sStrEncode, sKeyChar, EmptyStr, [rfReplaceAll]);
//
//    Result := IdDecoder.DecodeString(sStrEncode);
//  finally
//    IdEncoder.Free;
//    IdDecoder.Free;
//  end;
//end;
//
function ExportTable(const AOnwer : TComponent;
  var aFileName : String; var aExtensao : ct_ExtensaoFileExport) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    DtmRecursos.svdExportar.Title := 'Exportar Registros';
    aRetorno := DtmRecursos.svdExportar.Execute;
    if aRetorno then
    begin
      aFileName := DtmRecursos.svdExportar.FileName;
      aExtensao := ct_ExtensaoFileExport(DtmRecursos.svdExportar.FilterIndex);
    end;
  finally
    Result := aRetorno;
  end;
end;

initialization
  gVersaoApp  := TVersaoAplicacaoController.GetInstance();
  gLicencaApp := TLicencaController.GetInstance();
  gSistema    := TSistemaController.GetInstance();
  gFormulario := TFormularios.Create;

end.
