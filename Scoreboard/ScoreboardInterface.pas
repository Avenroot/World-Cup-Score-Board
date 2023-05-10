unit ScoreboardInterface;

interface

uses
  System.Generics.Collections,
  TeamType,
  GameClass;

type

  IScoreboard = interface
    ['{F28C65FB-33F8-4389-A216-0E78F3B4D4F4}']
    function NewGame(HomeTeam, AwayTeam: string): TGame;
    procedure UpdateScore(Game: TGame; HomeScore, AwayScore: Integer);
    procedure FinishGame(Game: TGame);
    function GetGamesSummary: TList<TGame>;
  end;


implementation

end.
