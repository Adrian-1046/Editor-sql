unit DBReadConnection;

interface
Uses
  iniFiles;

function ConectarAoBancoDeDados : Boolean;

var
  ConfigIni : TIniFile;
  BancoDeDadosConectado, CaminhoDaBase, senhaDaBase, usuarioDaBase, CaminhoDaDll,
  servidorDaBase, portaDoServidorDaBase, tipoDaBase : String;

implementation

function ConectarAoBancoDeDados : Boolean;
begin
  ConfigIni := TIniFile.Create('./Config.ini');
    BancoDeDadosConectado := ConfigIni.ReadString('Base de Dados','SMDB','SMDB n�o encontrado no ini');
    CaminhoDaBase         := ConfigIni.ReadString('Base de Dados','BASE','BASE n�o encontrado no ini');
    CaminhoDaDll          := ConfigIni.ReadString('Base de Dados','DLL~','DLL~ n�o encontrado no ini');
    usuarioDaBase         := ConfigIni.ReadString('Base de Dados','USER','USER n�o encontrado no ini');
    senhaDaBase           := ConfigIni.ReadString('Base de Dados','PASS','PASS n�o encontrado no ini');
    servidorDaBase        := ConfigIni.ReadString('Base de Dados','SERV','SERV n�o encontrado no ini');
    portaDoServidorDaBase := ConfigIni.ReadString('Base de Dados','PORT','PORT n�o encontrado no ini');
    tipoDaBase            := ConfigIni.ReadString('Base de Dados','TIPO','TIPO n�o encontrado no ini');
  ConfigIni.Free;
end;

end.
