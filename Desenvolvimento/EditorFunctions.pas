unit EditorFunctions;

interface
  Uses DBReadConnection, iniFiles;


function gerarExemplo : String;

implementation

function gerarExemplo: String;
var
  getQueryIni: TIniFile;
  qryPostgres, qryOracle, qryFirebird, qrySQLServer: String;
begin
  getQueryIni := TIniFile.Create('./QueryExemplo.ini');
  try
    qryPostgres  := getQueryIni.ReadString('POSTGRES' , 'QRY', '');
    qryOracle    := getQueryIni.ReadString('ORACLE'   , 'QRY', '');
    qryFirebird  := getQueryIni.ReadString('FIREBIRD' , 'QRY', '');
    qrySQLServer := getQueryIni.ReadString('SQLSERVER', 'QRY', '');

    if BancoDeDadosConectado      = 'FIREBIRD'  then
      Result := qryFirebird
    else if BancoDeDadosConectado = 'POSTGRES'  then
      Result := qryPostgres
    else if BancoDeDadosConectado = 'ORACLE'    then
      Result := qryOracle
    else if BancoDeDadosConectado = 'SQLSERVER' then
      Result := qrySQLServer
    else
      Result := ''; 
  finally
    getQueryIni.Free;
  end;
end;


end.

