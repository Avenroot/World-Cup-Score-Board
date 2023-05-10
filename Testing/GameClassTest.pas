unit GameClassTest;

interface

uses
  DUnitX.TestFramework,
  GameInterface,
  GameClass,
  TeamType;

type
  [TestFixture]
  TGameClassTest = class
  private
    FGame: TGame;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestHomeTeam;
    [Test]
    procedure TestAwayTeam;
    [Test]
    procedure TestHomeScore;
    [Test]
    procedure TestAwayScore;
    [Test]
    procedure TestIsInProgress;
    [Test]
    procedure TestStartOrder;
    [Test]
    procedure TestTotalScore;
  end;

implementation

procedure TGameClassTest.Setup;
begin
  FGame := TGame.Create('Home', 'Away');
end;

procedure TGameClassTest.TearDown;
begin
  FGame := nil;
end;

procedure TGameClassTest.TestHomeTeam;
begin
  Assert.AreEqual('Home', FGame.HomeTeam.Name);
  Assert.AreEqual(0, FGame.HomeTeam.Score);
end;

procedure TGameClassTest.TestAwayTeam;
begin
  Assert.AreEqual('Away', FGame.AwayTeam.Name);
  Assert.AreEqual(0, FGame.AwayTeam.Score);
end;

procedure TGameClassTest.TestHomeScore;
begin
  FGame.HomeScore := 5;
  Assert.AreEqual(5, FGame.HomeScore);
end;

procedure TGameClassTest.TestAwayScore;
begin
  FGame.AwayScore := 3;
  Assert.AreEqual(3, FGame.AwayScore);
end;

procedure TGameClassTest.TestIsInProgress;
begin
  FGame.IsInProgress := True;
  Assert.IsTrue(FGame.IsInProgress);
end;

procedure TGameClassTest.TestStartOrder;
begin
  FGame.StartOrder := 1;
  Assert.AreEqual(1, TGame(FGame).StartOrder);
end;

procedure TGameClassTest.TestTotalScore;
begin
  FGame.HomeScore := 2;
  FGame.AwayScore := 1;
  Assert.AreEqual(3, FGame.GetTotalScore);
end;

initialization
  TDUnitX.RegisterTestFixture(TGameClassTest);

end.

