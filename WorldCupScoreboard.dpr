program WorldCupScoreboard;

uses
  Vcl.Forms,
  MainForm in 'UI\MainForm.pas' {frmMain},
  ScoreboardForm in 'UI\ScoreboardForm.pas' {frmScoreboard},
  SettingsForm in 'UI\SettingsForm.pas' {frmSettings},
  GameClass in 'Games\GameClass.pas',
  GameFactoryClass in 'Games\GameFactoryClass.pas',
  GameInterface in 'Games\GameInterface.pas',
  ScoreboardClass in 'Scoreboard\ScoreboardClass.pas',
  ScoreboardInterface in 'Scoreboard\ScoreboardInterface.pas',
  ExampleGames in 'Data\ExampleGames.pas',
  TopFIFATeams in 'Data\TopFIFATeams.pas',
  TeamType in 'Games\TeamType.pas',
  GameFactoryClassTest in 'Testing\GameFactoryClassTest.pas',
  GameClassTest in 'Testing\GameClassTest.pas',
  ScoreboardClassTests in 'Testing\ScoreboardClassTests.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmScoreboard, frmScoreboard);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
