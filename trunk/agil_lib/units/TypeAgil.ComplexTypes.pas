unit TypeAgil.ComplexTypes;

interface

uses
  TypeAgil.SimpleTypes;

Type
  ct_Endereco = record
    Logradouro : st_EnderecoLogradouro;
    Numero     : st_EnderecoNumero;
    Complemento: st_EnderecoComplemento;
    Bairro     : st_EnderecoBairro;
    Cidade     : st_EnderecoCidade;
    UF         : st_EnderecoUF;
    Cep        : st_EnderecoCep;
  end;

  ct_Sistema = Array of record
    ProductKey  : st_ProductKey;
    ProductName : st_NomeCompleto;
  end;

implementation

end.
