unit GameFactoryClass;

interface

uses
  GameClass,
  TeamType;

type
  TGameFactory = class
  public
    class function CreateGame(HomeTeam, AwayTeam: string): TGame;
  end;

implementation

{ TGameFactory }

class function TGameFactory.CreateGame(HomeTeam, AwayTeam: string): TGame;
begin
  Result := TGame.Create(HomeTeam, AwayTeam);
end;

end.

