program EditorSQL;

uses
  System.StartUpCopy,
  FMX.Forms,
  Editor in 'Editor.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
