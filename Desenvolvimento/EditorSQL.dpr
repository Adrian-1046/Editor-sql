program EditorSQL;

uses
  System.StartUpCopy,
  FMX.Forms,
  Editor in 'Editor.pas' {fmEditorSQL},
  EditorFunctions in 'EditorFunctions.pas',
  DBReadConnection in 'DBReadConnection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmEditorSQL, fmEditorSQL);
  Application.Run;
end.
