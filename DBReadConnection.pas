unit DBReadConnection;

interface
Uses
  iniFiles;

function ConectarAoBancoDeDados : Boolean;

var
  ConfigIni : TIniFile;
  BancoDeDadosConectado, CaminhoDaBase, senhaDaBase, usuarioDaBase, CaminhoDaDll : String;

implementation

function ConectarAoBancoDeDados : Boolean;
begin
    ConfigIni := TIniFile.Create('./Config.ini');
    BancoDeDadosConectado := ConfigIni.ReadString('Base de Dados','SMDB','SMDB não encontrado no ini');
    CaminhoDaBase         := ConfigIni.ReadString('Base de Dados','BASE','BASE não encontrado no ini');
    CaminhoDaDll          := ConfigIni.ReadString('Base de Dados','DLL~','DLL~ não encontrado no ini');
    usuarioDaBase         := ConfigIni.ReadString('Base de Dados','USER','USER não encontrado no ini');
    senhaDaBase           := ConfigIni.ReadString('Base de Dados','PASS','PASS não encontrado no ini');
  ConfigIni.Free;
end;

end.
