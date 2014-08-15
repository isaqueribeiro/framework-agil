unit InterfaceAgil.Observer;

interface

  Type
    IObservable = interface; // Observado

    IObservador = interface
      ['{A1B0B93E-8D2A-41F8-8774-B3C315D9EB3E}']
      procedure Update(Observeble: IObservable);
    end;

    IObservable = interface  // Observado
      ['{9AB9DFEA-FE11-4EC3-8600-230B1B83FECD}']
      procedure addObserver(Observer: IObservador);
      procedure removeObserver(Observer: IObservador);
      procedure Notify;
    end;

implementation

end.
