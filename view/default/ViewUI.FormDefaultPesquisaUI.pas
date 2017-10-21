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
  cxGridLevel, cxGrid, dxBarBuiltInMenu, cxPC,

  dxSkinsCore, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox;

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
    cxLabel1: TcxLabel;
    cxImageComboBox1: TcxImageComboBox;
    cxTextEdit1: TcxTextEdit;
    btnPesquisar: TcxButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDefaultPesquisaUI: TFormDefaultPesquisaUI;

implementation

{$R *.dfm}

procedure TFormDefaultPesquisaUI.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeaderTitle.Left := 8;
  lblHeaderTitle.Top  := 8;
  lblHeaderDescription.Left := 28;
  lblHeaderDescription.Top  := 28;
end;

end.
