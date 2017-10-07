unit DataModule.Base;

interface

uses
  DataModule.Recursos,

  System.SysUtils, System.Classes;

type
  TDtmBase = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmBase: TDtmBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
