unit GameFactoryClassTest;

interface

uses
  DUnitX.TestFramework,
  GameFactoryClass,
  GameInterface,
  GameClass,
  TeamType;

type
  [TestFixture]
  TGameFactoryClassTest = class
  public
    [Test]
    procedure TestCreateGame;
  end;

implementation

procedure TGameFactoryClassTest.TestCreateGame;
var
  Game: IGame;
begin
  Game := TGameFactory.CreateGame('Home', 'Away');
  Assert.IsNotNull(Game);
  Assert.AreEqual('Home', TGame(Game).HomeTeam.Name);
  Assert.AreEqual('Away', TGame(Game).AwayTeam.Name);
end;

initialization
  TDUnitX.RegisterTestFixture(TGameFactoryClassTest);

end.

