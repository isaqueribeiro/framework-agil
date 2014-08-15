unit InterfaceAgil.Controller;

interface

uses
  ClasseAgil.BaseObject;

  Type
    IController = Interface
      ['{B84ACB58-DD61-45E8-8162-99E8C56F9905}']
      procedure Save;

      function Find(ID: String): TBaseObject;
      function New : TBaseObject;

    End;

implementation

end.
