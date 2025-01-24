unit Editor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FMX.Edit,

  iniFiles;

type
  TfmEditorSQL = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnLimparDeslimpar: TButton;
    btnImprimirt: TButton;
    btnExecutar: TButton;
    btnGerarExemplo: TButton;
    edtQuery: TEdit;
    Grid1: TGrid;
    procedure btnGerarExemploClick(Sender: TObject);
    procedure gerarExemplo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditorSQL: TfmEditorSQL;
  ConfigIni : TIniFile;
  BancoDeDadosConectado, CaminhoDaBase, senhaDaBase, usuarioDaBase, CaminhoDaDll : String;

implementation
{$R *.fmx}

procedure TfmEditorSQL.btnGerarExemploClick(Sender: TObject);
begin
  if edtQuery.Text = '' then
    gerarExemplo
  //else
  //  questionarIntencao;
end;

procedure TfmEditorSQL.gerarExemplo;
begin
  if BancoDeDadosConectado = 'FIREBIRD' then
    edtQuery.Text := 'SELECT FIRST 5 * FROM ENTIDADE_001';
  if BancoDeDadosConectado = 'POSTGRES' then
    edtQuery.Text := 'SELECT * FROM ENTIDADE_001 LIMIT 5';
  //if not (BancoDeDadosConectado in ['FIREBIRD', 'POSTGRES']) then
  //  edtQuery.Text := 'SELECT * FROM ENTIDADE_001';
end;

begin
  ConfigIni := TIniFile.Create('./Config.ini');
    BancoDeDadosConectado := ConfigIni.ReadString('Base de Dados','SMDB','SMDB não encontrado no ini');
    CaminhoDaBase         := ConfigIni.ReadString('Base de Dados','BASE','BASE não encontrado no ini');
    CaminhoDaDll          := ConfigIni.ReadString('Base de Dados','DLL~','DLL~ não encontrado no ini');
    usuarioDaBase         := ConfigIni.ReadString('Base de Dados','USER','USER não encontrado no ini');
    senhaDaBase           := ConfigIni.ReadString('Base de Dados','PASS','PASS não encontrado no ini');
  ConfigIni.Free;
end.


