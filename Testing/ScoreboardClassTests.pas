unit ScoreboardClassTests;

interface

uses
  DUnitX.TestFramework,
  System.SysUtils,
  System.Generics.Collections,
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
  Assert.AreEqual(0, FScoreboard.GetGamesSummary.Count);
end;

procedure TScoreboardTests.TestGetGamesSummary;
var
  Game1, Game2, Game3, Game4, Game5: TGame;
  GameSummary: TList<TGame>;
begin
  Game1 := FScoreboard.NewGame('Mexico', 'Canada');
  Game2 := FScoreboard.NewGame('Spain', 'Brazil');
  Game3 := FScoreboard.NewGame('Germany', 'France');
  Game4 := FScoreboard.NewGame('Uruguay', 'Italy');
  Game5 := FScoreboard.NewGame('Argentina', 'Australia');

  FScoreboard.UpdateScore(Game1, 0, 5);
  FScoreboard.UpdateScore(Game2, 10, 2);
  FScoreboard.UpdateScore(Game3, 2, 2);
  FScoreboard.UpdateScore(Game4, 6, 6);
  FScoreboard.UpdateScore(Game5, 3, 1);

  GameSummary := FScoreboard.GetGamesSummary;

  try
    Assert.AreEqual(5, GameSummary.Count);

    Assert.AreEqual('Uruguay', GameSummary[0].HomeTeam.Name);
    Assert.AreEqual(6, GameSummary[0].HomeScore);
    Assert.AreEqual('Italy', GameSummary[0].AwayTeam.Name);
    Assert.AreEqual(6, GameSummary[0].AwayScore);

    Assert.AreEqual('Spain', GameSummary[1].HomeTeam.Name);
    Assert.AreEqual(10, GameSummary[1].HomeScore);
    Assert.AreEqual('Brazil', GameSummary[1].AwayTeam.Name);
    Assert.AreEqual(2, GameSummary[1].AwayScore);

    Assert.AreEqual('Mexico', GameSummary[2].HomeTeam.Name);
    Assert.AreEqual(0, GameSummary[2].HomeScore);
    Assert.AreEqual('Canada', GameSummary[2].AwayTeam.Name);
    Assert.AreEqual(5, GameSummary[2].AwayScore);

    Assert.AreEqual('Argentina', GameSummary[3].HomeTeam.Name);
    Assert.AreEqual(3, GameSummary[3].HomeScore);
    Assert.AreEqual('Australia', GameSummary[3].AwayTeam.Name);
    Assert.AreEqual(1, GameSummary[3].AwayScore);

    Assert.AreEqual('Germany', GameSummary[4].HomeTeam.Name);
    Assert.AreEqual(2, GameSummary[4].HomeScore);
    Assert.AreEqual('France', GameSummary[4].AwayTeam.Name);
    Assert.AreEqual(2, GameSummary[4].AwayScore);


  finally
    GameSummary.Free;
  end;

end;


initialization
  TDUnitX.RegisterTestFixture(TScoreboardTests);

end.

