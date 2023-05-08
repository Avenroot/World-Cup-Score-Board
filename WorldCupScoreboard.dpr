program WorldCupScoreboard;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Scoreboard in 'Scoreboard.pas' {frmScoreboard},
  Settings in 'Settings.pas' {frmSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmScoreboard, frmScoreboard);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
