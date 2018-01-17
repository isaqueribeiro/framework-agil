unit InterfaceAgil.Controller;

interface

uses
  ClasseAgil.BaseObject,
  Data.DB, Datasnap.DBClient;

  Type
    IController = Interface
      ['{B84ACB58-DD61-45E8-8162-99E8C56F9905}']
      procedure New(const aDataSet: TDataSet); overload;
      procedure Save(const aDataSet: TDataSet);
      procedure Load(const aDataSet: TDataSet);
      procedure Refresh(const aDataSet: TDataSet);
      procedure RefreshRecord(const aDataSet: TDataSet);

      function Find(ID: String; const aDataSet: TDataSet): TBaseObject;
      function New : TBaseObject; overload;

    End;

implementation

end.
