unit Editor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FMX.Edit,

  EditorFunctions, DBReadConnection, FMX.Layouts;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditorSQL: TfmEditorSQL;


implementation
{$R *.fmx}

procedure TfmEditorSQL.btnGerarExemploClick(Sender: TObject);
var
  Continuar : Integer;
begin
  if edtQuery.Text = '' then
    edtQuery.Text := gerarExemplo
  else
  begin
    Continuar := MessageDlg('Deseja SOBRESCREVER a query atual?',
                            TMsgDlgType.mtConfirmation,
                            [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
                            0);

    if Continuar = mrYes then
      edtQuery.Text := gerarExemplo;

  end;
end;

begin
  ConectarAoBancoDeDados
end.


