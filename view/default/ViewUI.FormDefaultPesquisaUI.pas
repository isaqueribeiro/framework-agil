unit ViewUI.FormDefaultPesquisaUI;

interface

uses
  TypeAgil.ComplexTypes,
  InterfaceAgil.Observer,
  Controller.Rotina,
  DataModule.Recursos,
  ViewUI.FormDefaultUI,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB, cxDBData,
  dxGDIPlusClasses, Vcl.ExtCtrls, cxLabel, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridLevel, cxGrid, dxBarBuiltInMenu, cxPC, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, System.Actions, Vcl.ActnList,
  dxBar, cxGroupBox, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxBarPainter;

type
  TFormDefaultPesquisaUI = class(TFormDefaultUI)
    pnlHeader: TPanel;
    lblHeaderTitle: TcxLabel;
    lblHeaderDescription: TcxLabel;
    imgHeader: TImage;
    pnlBody: TPanel;
    dbgPesquisaLv: TcxGridLevel;
    dbgPesquisa: TcxGrid;
    dbgPesquisaDB: TcxGridDBBandedTableView;
    dtsPesquisa: TDataSource;
    bvlGrid: TBevel;
    pgcPesquisa: TcxPageControl;
    tbsPesquisa: TcxTabSheet;
    acnEvento: TActionList;
    acnNovo: TAction;
    acnEditar: TAction;
    acnExcluir: TAction;
    acnExportar: TAction;
    acnImprimir: TAction;
    acnPesquisar: TAction;
    brnEvento: TdxBarManager;
    brFerramentas: TdxBar;
    BrBtnNovo: TdxBarButton;
    BrBtnEditar: TdxBarButton;
    BrBtnExcluir: TdxBarButton;
    BrBtnExportar: TdxBarButton;
    BrBtnImprimir: TdxBarButton;
    grpTipoPesquisa: TcxGroupBox;
    edTipoPesquisa: TcxImageComboBox;
    grpPesquisa: TcxGroupBox;
    edPesquisa: TcxTextEdit;
    BrBtnPesquisar: TdxBarButton;
    shpLimite: TShape;
    acnPrepararPesquisa: TAction;
    acnAtualizar: TAction;
    BrBtnAtualizar: TdxBarButton;
    acnRefreshRegistro: TAction;
    procedure FormCreate(Sender: TObject);
    procedure acnNovoExecute(Sender: TObject);
    procedure acnEditarExecute(Sender: TObject);
    procedure acnExcluirExecute(Sender: TObject);
    procedure acnExportarExecute(Sender: TObject);
    procedure acnImprimirExecute(Sender: TObject);
    procedure acnPesquisarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure acnPrepararPesquisaExecute(Sender: TObject);
    procedure acnAtualizarExecute(Sender: TObject);
    procedure dtsPesquisaStateChange(Sender: TObject);
    procedure dbgPesquisaDBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure acnRefreshRegistroExecute(Sender: TObject);
  private
    { Private declarations }
    aAlreadyActivated,
    aAbrirTabela     : Boolean;
    aFormularioCadastro  : String;
    function GetEmEdicao : Boolean;
  public
    { Public declarations }
    property AbrirTabela    : Boolean read aAbrirTabela write aAbrirTabela;
    property TabelaEmEdicao : Boolean read GetEmEdicao;
    property FormularioCadastro : String read aFormularioCadastro write aFormularioCadastro;

    procedure New; virtual; abstract;
    procedure Edit; virtual; abstract;
    procedure Cancel; virtual; abstract;
    procedure Delete; virtual; abstract;
    procedure Refresh; virtual; abstract;
    procedure RefreshRecord; virtual; abstract;
    procedure ShowRegister; virtual;
    procedure PrintRegisters; virtual;

    function ExecutarPesquisa(const aAlertar : Boolean = TRUE) : Boolean; virtual; abstract;
  end;

var
  FormDefaultPesquisaUI: TFormDefaultPesquisaUI;

implementation

{$R *.dfm}

Uses
  cxGridExportLink;

procedure TFormDefaultPesquisaUI.acnAtualizarExecute(Sender: TObject);
begin
  if Assigned(dtsPesquisa.DataSet) then
    if dtsPesquisa.DataSet.Active then
      Self.Refresh;
end;

procedure TFormDefaultPesquisaUI.acnEditarExecute(Sender: TObject);
begin
//  ShowMessage( RotinaController.Model.Parent.Nome + #13 + RotinaController.Model.Nome + ' - ' + RotinaController.Model.Descricao );
  if Assigned(dtsPesquisa.DataSet) then
    if not dtsPesquisa.DataSet.IsEmpty then
      Self.Edit;
end;

procedure TFormDefaultPesquisaUI.acnExcluirExecute(Sender: TObject);
begin
  if Assigned(dtsPesquisa.DataSet) then
    if not dtsPesquisa.DataSet.IsEmpty then
      Self.Delete;
end;

procedure TFormDefaultPesquisaUI.acnExportarExecute(Sender: TObject);
var
  aFileName : String;
  aExtensao : ct_ExtensaoFileExport;
begin
  if Assigned(dtsPesquisa.DataSet) then
    if ExportTable(Self, aFileName, aExtensao) then
      Case aExtensao of
        efe_XLS  : ExportGridToExcel(aFileName + '.xls',  dbgPesquisa);
        efe_XLSX : ExportGridToXLSX(aFileName  + '.xlsx', dbgPesquisa);
        efe_TXT  : ExportGridToText(aFileName  + '.txt',  dbgPesquisa);
        efe_XML  : ExportGridToXML(aFileName   + '.xml',  dbgPesquisa);
      end;
end;

procedure TFormDefaultPesquisaUI.acnImprimirExecute(Sender: TObject);
begin
  if Assigned(dtsPesquisa.DataSet) then
    Self.PrintRegisters;
end;

procedure TFormDefaultPesquisaUI.acnNovoExecute(Sender: TObject);
begin
  if Assigned(dtsPesquisa.DataSet) then
    Self.New;
end;

procedure TFormDefaultPesquisaUI.acnPesquisarExecute(Sender: TObject);
begin
  if ExecutarPesquisa(True) then
    if dbgPesquisa.Visible and dbgPesquisa.Enabled and dbgPesquisaDB.Visible then
      dbgPesquisa.SetFocus;
end;

procedure TFormDefaultPesquisaUI.acnPrepararPesquisaExecute(Sender: TObject);
begin
  if (pgcPesquisa.ActivePage = tbsPesquisa) then
    if edPesquisa.Visible and edPesquisa.Enabled then
      edPesquisa.SetFocus;
end;

procedure TFormDefaultPesquisaUI.acnRefreshRegistroExecute(Sender: TObject);
begin
  if Assigned(dtsPesquisa.DataSet) then
    if not dtsPesquisa.DataSet.IsEmpty then
      Self.RefreshRecord;
end;

procedure TFormDefaultPesquisaUI.dbgPesquisaDBKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Case Key of
    VK_RETURN :
      if Assigned(dtsPesquisa.DataSet) then
        Self.ShowRegister;

    VK_DELETE :
      if Assigned(dtsPesquisa.DataSet) then
        if not dtsPesquisa.DataSet.IsEmpty then
          Self.Delete;
  end;
end;

procedure TFormDefaultPesquisaUI.dtsPesquisaStateChange(Sender: TObject);
begin
  if Assigned(dtsPesquisa.DataSet) then
  begin
    acnNovo.Enabled      := not (dtsPesquisa.DataSet.State in [dsEdit, dsInsert]);
    acnEditar.Enabled    := (dtsPesquisa.DataSet.RecordCount > 0);
    acnExcluir.Enabled   := (dtsPesquisa.DataSet.RecordCount > 0);
    acnExportar.Enabled  := (dtsPesquisa.DataSet.RecordCount > 0);
    acnImprimir.Enabled  := (dtsPesquisa.DataSet.RecordCount > 0);
    acnAtualizar.Enabled := dtsPesquisa.DataSet.Active and (not (dtsPesquisa.DataSet.State in [dsEdit, dsInsert]));
  end;
end;

procedure TFormDefaultPesquisaUI.edPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Case Key of
    VK_UP   :
      if Assigned(dtsPesquisa.DataSet) then
        if not dtsPesquisa.DataSet.IsEmpty then
          dtsPesquisa.DataSet.Prior;
    VK_DOWN :
      if Assigned(dtsPesquisa.DataSet) then
        if not dtsPesquisa.DataSet.IsEmpty then
          dtsPesquisa.DataSet.Next;
    VK_RETURN :
      acnPesquisar.Execute;
  end;
end;

procedure TFormDefaultPesquisaUI.FormActivate(Sender: TObject);
begin
  if aAlreadyActivated then
  begin
    if Assigned(dtsPesquisa.DataSet) then
      if dtsPesquisa.DataSet.Active then
      begin
        if (dtsPesquisa.DataSet.IsEmpty) then
        begin
          if aAbrirTabela then
            ExecutarPesquisa(False);
        end
        else
          acnRefreshRegistro.Execute;
      end;
  end
  else
    aAlreadyActivated := True;
end;

procedure TFormDefaultPesquisaUI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
  if Assigned(dtsPesquisa.DataSet) then
    if dtsPesquisa.DataSet.Active then
      dtsPesquisa.DataSet.Close;
  Action := caFree;
end;

procedure TFormDefaultPesquisaUI.FormCreate(Sender: TObject);
begin
  aAlreadyActivated := False;
  Descricao   := lblHeaderDescription.Caption;
  AbrirTabela := True;
  aFormularioCadastro := EmptyStr;

  inherited;
  Self.AutoSize := False;

  lblHeaderTitle.Left := 8;
  lblHeaderTitle.Top  := 8;
  lblHeaderDescription.Left := 28;
  lblHeaderDescription.Top  := 28;

  lblHeaderTitle.Caption := Trim(Self.Caption);
end;

procedure TFormDefaultPesquisaUI.FormResize(Sender: TObject);
begin
  shpLimite.Top   := 0;
  shpLimite.Left  := 0;
  shpLimite.Width := 697;

  // Definindo tamanho mínimo do formulário
  if (Self.Height < 425) then
    Self.Height := 425;

  if (Self.Width < 697) then
    Self.Width := 697;
end;

procedure TFormDefaultPesquisaUI.FormShow(Sender: TObject);
begin
  inherited;
  if aAbrirTabela then
    ExecutarPesquisa(False);

  if (pgcPesquisa.ActivePage = tbsPesquisa) then
    if (edPesquisa.Visible and edPesquisa.Enabled) then
    begin
      edPesquisa.SelStart := Length(Trim(edPesquisa.Text)) + 1;
      edPesquisa.SetFocus;
    end;
end;

function TFormDefaultPesquisaUI.GetEmEdicao: Boolean;
begin
  if Assigned(dtsPesquisa.DataSet) then
    Result := (dtsPesquisa.DataSet.State in [dsEdit, dsInsert])
  else
    Result := False;
end;

procedure TFormDefaultPesquisaUI.PrintRegisters;
begin
  // Ajustar o tamanho da tele à página
  Self.PrintScale := poPrintToFit;
  Self.Print;
end;

procedure TFormDefaultPesquisaUI.ShowRegister;
begin
  if Assigned(dtsPesquisa.DataSet) then
    if (Trim(aFormularioCadastro) <> EmptyStr) then
      gFormulario.ShowModalForm(Self, aFormularioCadastro);
end;

end.
