unit Editor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FMX.Edit,

  EditorFunctions, DBReadConnection, FMX.Layouts, FMX.Objects, FMX.Memo.Types,
  FMX.Memo, Data.FMTBcd, Datasnap.DBClient, Data.DB, Data.SqlExpr,
  Datasnap.Provider, FireDAC.Phys.FBDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DBXInterBase,
  Data.DBXPool, Data.DBXTrace, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfmEditorSQL = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnLimparDeslimpar: TButton;
    btnExecutar: TButton;
    btnGerarExemplo: TButton;
    edtQuery: TMemo;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Grid1: TGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btnGerarExemploClick(Sender: TObject);
    procedure btnLimparDeslimparClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ConfigurarConexao;
  public
  end;

var
  fmEditorSQL: TfmEditorSQL;
  sQuery: String;

implementation

{$R *.fmx}

procedure TfmEditorSQL.ConfigurarConexao;
begin
  try
    ConectarAoBancoDeDados;

    FDConnection1.Params.Values['DriverID'] := tipoDaBase;
    FDConnection1.Params.Values['Database'] := CaminhoDaBase;
    FDConnection1.Params.Values['User_Name'] := usuarioDaBase;
    FDConnection1.Params.Values['Password'] := senhaDaBase;
    FDConnection1.Params.Values['Protocol'] := 'TCPIP';
    FDConnection1.Params.Values['SQLDialect'] := '3';
    FDConnection1.Params.Values['Server'] := servidorDaBase;
    FDConnection1.Params.Values['Port'] := portaDoServidorDaBase;
//    FDConnection1.Params.Values['ConnectionName'] := BancoDeDadosConectado;

    FDConnection1.Connected := True;
  except
    on E: Exception do
      ShowMessage('Erro ao configurar a conexão: ' + E.Message);
  end;
end;

procedure TfmEditorSQL.btnExecutarClick(Sender: TObject);
begin
  if edtQuery.Text = '' then
  begin
    ShowMessage('Sua query está vazia! Digite algum comando antes de executar.');
    Exit;
  end;

  try
    FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add(edtQuery.Text);
    if (UpperCase(trim(edtQuery.Text)).contains('SELECT')) or (UpperCase(trim(edtQuery.Text)).contains('WITH')) then
      FDQuery1.Open
    else
      FDQuery1.ExecSQL;
  except
    on E: EDatabaseError do
      ShowMessage('Erro ao executar a query: ' + E.Message);
    on E: Exception do
      ShowMessage('Erro inesperado: ' + E.Message);
  end;

  Grid1.ReloadPresentation;
end;

procedure TfmEditorSQL.btnGerarExemploClick(Sender: TObject);
var
  Continuar: Integer;
begin
  if edtQuery.Text = '' then
    edtQuery.Text := gerarExemplo
  else
  begin
    Continuar := MessageDlg('Deseja SOBRESCREVER a query atual?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);

    if Continuar = mrYes then
      edtQuery.Text := gerarExemplo;
  end;
end;

procedure TfmEditorSQL.btnLimparDeslimparClick(Sender: TObject);
begin
  if edtQuery.Text <> '' then
  begin
    sQuery := edtQuery.Text;
    edtQuery.Text := '';
  end
  else
    edtQuery.Text := sQuery;
end;

procedure TfmEditorSQL.FormCreate(Sender: TObject);
begin
  ConfigurarConexao;
end;

end.

