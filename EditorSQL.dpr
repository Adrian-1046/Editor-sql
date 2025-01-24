program EditorSQL;

uses
  System.StartUpCopy,
  FMX.Forms,
  Editor in 'Editor.pas' {fmEditorSQL};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmEditorSQL, fmEditorSQL);
  Application.Run;
end.
