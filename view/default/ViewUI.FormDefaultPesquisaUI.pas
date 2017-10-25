unit ViewUI.FormDefaultPesquisaUI;

interface

uses
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
  dxSkinsdxBarPainter, dxBar,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  cxGroupBox;

type
  TFormDefaultPesquisaUI = class(TFormDefaultUI)
    pnlHeader: TPanel;
    lblHeaderTitle: TcxLabel;
    lblHeaderDescription: TcxLabel;
    imgHeader: TImage;
    bvlHeader: TBevel;
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
    bvlBr: TBevel;
    grpTipoPesquisa: TcxGroupBox;
    edTipoPesquisa: TcxImageComboBox;
    grpPesquisa: TcxGroupBox;
    edPesquisa: TcxTextEdit;
    BrBtnPesquisar: TdxBarButton;
    shpLimite: TShape;
    procedure FormCreate(Sender: TObject);
    procedure acnNovoExecute(Sender: TObject);
    procedure acnEditarExecute(Sender: TObject);
    procedure acnExcluirExecute(Sender: TObject);
    procedure acnExportarExecute(Sender: TObject);
    procedure acnImprimirExecute(Sender: TObject);
    procedure acnPesquisarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDefaultPesquisaUI: TFormDefaultPesquisaUI;

implementation

{$R *.dfm}

procedure TFormDefaultPesquisaUI.acnEditarExecute(Sender: TObject);
begin
  ShowMessage( Rotina.Parent.Nome + #13 + Rotina.Nome + ' - ' + Rotina.Descricao );
end;

procedure TFormDefaultPesquisaUI.acnExcluirExecute(Sender: TObject);
begin
  ;
end;

procedure TFormDefaultPesquisaUI.acnExportarExecute(Sender: TObject);
begin
  ;
end;

procedure TFormDefaultPesquisaUI.acnImprimirExecute(Sender: TObject);
begin
  ;
end;

procedure TFormDefaultPesquisaUI.acnNovoExecute(Sender: TObject);
begin
  ;
end;

procedure TFormDefaultPesquisaUI.acnPesquisarExecute(Sender: TObject);
begin
  ;
end;

procedure TFormDefaultPesquisaUI.FormCreate(Sender: TObject);
begin
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
  if (pgcPesquisa.ActivePage = tbsPesquisa) then
    if (edPesquisa.Visible and edPesquisa.Enabled) then
    begin
      edPesquisa.SelStart := Length(Trim(edPesquisa.Text)) + 1;
      edPesquisa.SetFocus;
    end;
end;

end.
