unit ScoreboardForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, GameSummaryFrame, Vcl.ExtCtrls, Vcl.WinXPanels, ScoreboardClass,
  GameClass, System.Generics.Collections, ExampleGames, Vcl.Imaging.pngimage;

type
  TfrmScoreboard = class(TForm)
    ilFlags: TImageList;
    spScoreboard: TStackPanel;
    fraGameSummary1: TfraGameSummary;
    fraGameSummary2: TfraGameSummary;
    fraGameSummary3: TfraGameSummary;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ClearScoreboard;
    function GetFlagIdx(TeamName: string): Integer;
  public
    procedure RefreshGames;
  end;

var
  frmScoreboard: TfrmScoreboard;
  Scoreboard: TScoreboard;

implementation

{$R *.dfm}

{ TfrmScoreboard }

procedure TfrmScoreboard.FormCreate(Sender: TObject);
begin
  Scoreboard := TScoreboard.Create;
end;

procedure TfrmScoreboard.FormDestroy(Sender: TObject);
begin
  Scoreboard.Destroy;
end;

procedure TfrmScoreboard.FormShow(Sender: TObject);
begin
 if Assigned(Scoreboard) then
 begin
  Scoreboard := ExampleGames.LoadExampleGames;
  RefreshGames;
 end;
end;

function TfrmScoreboard.GetFlagIdx(TeamName: string): Integer;
var
  UpperCaseTeam: string;
begin
  UpperCaseTeam := UpperCase(TeamName);
  if UpperCaseTeam = 'ITALY' then
    Result := 0
  else if UpperCaseTeam = 'AUSTRALIA' then
    Result := 1
  else if UpperCaseTeam = 'CANADA' then
    Result := 2
  else if UpperCaseTeam = 'FRANCE' then
    Result := 3
  else if UpperCaseTeam = 'GERMANY' then
    Result := 4
  else if UpperCaseTeam = 'MEXICO' then
    Result := 5
  else if UpperCaseTeam = 'ARGENTINA' then
    Result := 6
  else if UpperCaseTeam = 'URUGUAY' then
    Result := 7
  else if UpperCaseTeam = 'SPAIN' then
    Result := 8
  else if UpperCaseTeam = 'BRAZIL' then
    Result := 9
  else
    Result := -1; // Return a default value or handle the unknown case  UpperCaseTeam := UpperCase(TeamName);
end;

procedure TfrmScoreboard.ClearScoreboard;
var
  I: Integer;
begin
  // Iterate through the child controls of the TStackPanel
  for I := spScoreboard.ControlCount - 1 downto 0 do
    spScoreboard.Controls[I].Free; // Free the child control
end;

procedure TfrmScoreboard.RefreshGames;
var
  I, flgIdx: Integer;
  GameList: TList<TGame>;
  Frame: TfraGameSummary;
  Icon: TIcon;
begin
  ClearScoreboard;

  GameList := TList<TGame>.Create;
  GameList := Scoreboard.GetGamesSummary;

  for I := 0 to GameList.Count - 1 do
  begin
    Frame := TfraGameSummary.Create(Self);

    Frame.Name := Frame.Name + I.ToString;
    Frame.Parent := spScoreboard;

    Frame.lblAwayTeam.Caption := GameList[I].AwayTeam.Name;
    Frame.lblAwayTeamScore.Caption := GameList[I].AwayTeam.Score.ToString;
    Icon := TIcon.Create;
    try
      flgIdx := GetFlagIdx(GameList[I].AwayTeam.Name);
      ilFlags.GetIcon(flgIdx, Icon);
      Frame.imgAwayTeam.Picture.Assign(Icon);
    finally
      Icon.Free;
    end;

    Frame.lblHomeTeam.Caption := GameList[I].HomeTeam.Name;
    Frame.lblHomeTeamScore.Caption := GameList[I].HomeTeam.Score.ToString;
    Icon := TIcon.Create;
    try
      flgIdx := GetFlagIdx(GameList[I].HomeTeam.Name);
      ilFlags.GetIcon(flgIdx, Icon);
      Frame.imgHomeTeam.Picture.Assign(Icon);
    finally
      Icon.Free;
    end;

  end;
end;

end.
