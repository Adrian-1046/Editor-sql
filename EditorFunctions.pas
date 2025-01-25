unit EditorFunctions;

interface
  Uses DBReadConnection;


function gerarExemplo : String;

implementation

function gerarExemplo : String;
begin
  if BancoDeDadosConectado = 'FIREBIRD' then
    Result := 'SELECT FIRST 5 * FROM ENTIDADE_001';
  if BancoDeDadosConectado = 'POSTGRES' then
    Result := 'SELECT * FROM ENTIDADE_001 LIMIT 5';
  if not (BancoDeDadosConectado ='FIREBIRD') and not (BancoDeDadosConectado = 'POSTGRES') then
    Result := 'SELECT * FROM ENTIDADE_001 --limite sua consulta a 500';
end;

end.
