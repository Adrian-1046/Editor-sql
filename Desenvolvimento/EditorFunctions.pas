unit EditorFunctions;

interface
  Uses DBReadConnection;


function gerarExemplo : String;

implementation

function gerarExemplo : String;
begin
  if BancoDeDadosConectado = 'FIREBIRD' then
    Result := 'SELECT FIRST 500 * FROM ENTIDADES';
  if BancoDeDadosConectado = 'POSTGRES' then
    Result := 'SELECT * FROM ENTIDADES LIMIT 500';
  if not (BancoDeDadosConectado ='FIREBIRD') and not (BancoDeDadosConectado = 'POSTGRES') then
    Result := 'SELECT * FROM ENTIDADES';
end;

end.
