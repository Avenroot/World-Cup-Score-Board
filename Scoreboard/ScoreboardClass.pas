{

 The scoreboard supports the following operations:
1. Start a new game, assuming initial score 0 – 0 and adding it the scoreboard.
   This should capture following parameters:
    a. Home team
    b. Away team
2. Update score. This should receive a pair of absolute scores: home team score and away
   team score.
3. Finish game currently in progress. This removes a match from the scoreboard.
4. Get a summary of games in progress ordered by their total score. The games with the same
total score will be returned ordered by the most recently started match in the scoreboard.

}

unit ScoreboardClass;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.Generics.Defaults,
  System.Math,
  ScoreboardInterface,
  GameInterface,
  GameClass,
  GameFactoryClass;

type

  EGameNotFoundException = class(Exception)
  public
    constructor Create(const Msg: string);
  end;

  TScoreboard = class(TInterfacedObject, IScoreboard)
  private
    FGames: TObjectList<TGame>;
    function GetGamesOrderedByTotalScore: TList<TGame>;
  public
    constructor Create;
    function NewGame(HomeTeam, AwayTeam: string): TGame; // Requirement 1
    procedure UpdateScore(Game: TGame; HomeScore, AwayScore: Integer); // Requirement 2
    procedure FinishGame(Game: TGame); // Requirement 3
    function GetGamesSummary: TList<TGame>; //Requirement 4
  end;

implementation

{ TScoreboard }

constructor TScoreboard.Create;
begin
  FGames := TObjectList<TGame>.Create;
end;

function TScoreboard.NewGame(HomeTeam, AwayTeam: string): TGame;
var
  Game: TGame;
begin
  Game := TGameFactory.CreateGame(HomeTeam, AwayTeam);
  FGames.Add(Game);
  Result := Game;
end;

procedure TScoreboard.UpdateScore(Game: TGame; HomeScore, AwayScore: Integer);
begin
  Game.HomeScore := HomeScore;
  Game.AwayScore := AwayScore;
end;

procedure TScoreboard.FinishGame(Game: TGame);
var
  I: Integer;
  Found: Boolean;
begin
  Found := False;
  for I := 0 to FGames.Count - 1 do
  begin
    if FGames[I] <> nil then
    begin
      FGames.Delete(I);
      Found := True;
      Break;
    end;
  end;
  if not Found then
  begin
    raise EGameNotFoundException.Create('Game not found');
  end;
end;


function CompareGamesByScore(const Left, Right: TGame): Integer;
begin
  Result := CompareValue(Right.GetTotalScore, Left.GetTotalScore);
  if Result = 0 then
  begin
    Result := CompareValue(Right.GetHashCode, Left.GetHashCode);
  end;
end;

function TScoreboard.GetGamesOrderedByTotalScore: TList<TGame>;
var
  GameList: TList<TGame>;
  I: Integer;
begin
  GameList := TList<TGame>.Create;

  try
    for I := 0 to FGames.Count - 1 do
    begin
      if FGames[I] is TGame then
      begin
        GameList.Add(FGames[I]);
      end;
    end;

    GameList.Sort(TComparer<TGame>.Construct(CompareGamesByScore));

    Result := GameList;
   except
    GameList.Free;
    raise;
  end;
end;


function TScoreboard.GetGamesSummary: TList<TGame>;
begin
  Result := GetGamesOrderedByTotalScore;
end;


{ EGameNotFoundException }

constructor EGameNotFoundException.Create(const Msg: string);
begin
  inherited Create(Msg);
end;


end.
