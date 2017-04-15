unit ClassesGerador;

interface

uses Classes;

type TModelo = class
public
  pasta: string;
  arquivos: array of string;

  procedure clear;
  procedure addModelo(modelo: string);

  function setAllNomeModelo: string;
  function setNomeModelo(nome: string): string;
  function getNomeModeloAlias( arquivo: string ): string;


  constructor Create(path, nomeForm: string); overload;
end;

implementation


procedure TModelo.addModelo(modelo: string);
begin

end;

procedure TModelo.clear;
begin

end;

constructor TModelo.Create(path, nomeForm: string);
begin
   Inherited Create;

end;

function TModelo.getNomeModeloAlias(arquivo: string): string;
begin

end;

function TModelo.setAllNomeModelo: string;
begin

end;

function TModelo.setNomeModelo(nome: string): string;
begin

end;

end.
