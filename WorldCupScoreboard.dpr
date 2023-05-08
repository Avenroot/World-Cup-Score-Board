program WorldCupScoreboard;

uses
  Vcl.Forms,
  MainForm in 'UI\MainForm.pas' {frmMain},
  ScoreboardForm in 'UI\ScoreboardForm.pas' {frmScoreboard},
  SettingsForm in 'UI\SettingsForm.pas' {frmSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmScoreboard, frmScoreboard);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
