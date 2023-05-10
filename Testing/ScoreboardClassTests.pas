unit ScoreboardClassTests;

interface

uses
  DUnitX.TestFramework,
  System.SysUtils,
  ScoreboardInterface,
  ScoreboardClass,
  TeamType,
  GameInterface,
  GameClass;

type
  [TestFixture]
  TScoreboardTests = class
  private
    FScoreboard: TScoreboard;
  public
    [Setup]
    procedure Setup;
    [Teardown]
    procedure Teardown;
    [Test]
    procedure TestNewGame;
    [Test]
    procedure TestUpdateScore;
    [Test]
    procedure TestFinishGame;
    [Test]
    procedure TestGetGamesSummary;
  end;

implementation

procedure TScoreboardTests.Setup;
begin
  FScoreboard := TScoreboard.Create;
end;

procedure TScoreboardTests.Teardown;
begin
  FScoreboard := nil;
end;

procedure TScoreboardTests.TestNewGame;
var
  Game: TGame;
begin
  Game := FScoreboard.NewGame('Home', 'Away');
  Assert.IsNotNull(Game);
end;

procedure TScoreboardTests.TestUpdateScore;
var
  Game: TGame;
begin
  Game := FScoreboard.NewGame('Home', 'Away');
  FScoreboard.UpdateScore(Game, 2, 1);
  Assert.AreEqual(2, Game.HomeScore);
  Assert.AreEqual(1, Game.AwayScore);
end;

procedure TScoreboardTests.TestFinishGame;
var
  Game: TGame;
begin
  Game := FScoreboard.NewGame('Home', 'Away');
  FScoreboard.FinishGame(Game);
  Assert.AreEqual(0, Length(FScoreboard.GetGamesSummary));
end;

procedure TScoreboardTests.TestGetGamesSummary;
var
  Game1, Game2, Game3: TGame;
  Summary: TArray<TGame>;
begin
  Game1 := FScoreboard.NewGame('Home1', 'Away1');
  Game2 := FScoreboard.NewGame('Home2', 'Away2');
  Game3 := FScoreboard.NewGame('Home3', 'Away3');

  FScoreboard.UpdateScore(Game1, 2, 1);
  FScoreboard.UpdateScore(Game2, 1, 1);
  FScoreboard.UpdateScore(Game3, 3, 2);

  Summary := FScoreboard.GetGamesSummary;

  Assert.AreEqual(3, Length(Summary));
  Assert.AreEqual('Home3', Summary[0].HomeTeam.Name);
  Assert.AreEqual(3, Summary[0].HomeScore);
  Assert.AreEqual('Away3', Summary[0].AwayTeam.Name);
  Assert.AreEqual(2, Summary[0].AwayScore);
  Assert.AreEqual(True, Summary[0].IsInProgress);

  Assert.AreEqual('Home1', Summary[1].HomeTeam.Name);
  Assert.AreEqual(2, Summary[1].HomeScore);
  Assert.AreEqual('Away1', Summary[1].AwayTeam.Name);
  Assert.AreEqual(1, Summary[1].AwayScore);
  Assert.AreEqual(False, Summary[1].IsInProgress);

  Assert.AreEqual('Home2', Summary[2].HomeTeam.Name);
  Assert.AreEqual(1, Summary[2].HomeScore);
  Assert.AreEqual('Away2', Summary[2].AwayTeam.Name);
  Assert.AreEqual(1, Summary[2].AwayScore);
  Assert.AreEqual(False, Summary[2].IsInProgress);

end;

initialization
  TDUnitX.RegisterTestFixture(TScoreboardTests);

end.

