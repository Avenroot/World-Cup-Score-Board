// Data used for example

{

 For example, if following matches are started in the specified order and their scores

 respectively updated:
a. Mexico 0 - Canada 5
b. Spain 10 - Brazil 2
c. Germany 2 - France 2
d. Uruguay 6 - Italy 6
e. Argentina 3 - Australia 1

The summary should be as follows:
1. Uruguay 6 - Italy 6
2. Spain 10 - Brazil 2
3. Mexico 0 - Canada 5
4. Argentina 3 - Australia 1
5. Germany 2 - France 2

These need to be put into a collection.

}

unit ExampleGames;

interface

uses
  System.Generics.Collections,
  ScoreboardClass,
  GameClass,
  GameInterface,
  GameFactoryClass;

function LoadExampleGames: TScoreboard;

implementation

function LoadExampleGames: TScoreboard;
var
  Game1, Game2, Game3, Game4, Game5: TGame;
  lScoreboard: TScoreboard;
begin
  lScoreboard := TScoreboard.Create;
  try
    Game1 := lScoreboard.NewGame('Mexico', 'Canada');
    Game2 := lScoreboard.NewGame('Spain', 'Brazil');
    Game3 := lScoreboard.NewGame('Germany', 'France');
    Game4 := lScoreboard.NewGame('Uruguay', 'Italy');
    Game5 := lScoreboard.NewGame('Argentina', 'Australia');

    lScoreboard.UpdateScore(Game1, 0, 5);
    lScoreboard.UpdateScore(Game2, 10, 2);
    lScoreboard.UpdateScore(Game3, 2, 2);
    lScoreboard.UpdateScore(Game4, 6, 6);
    lScoreboard.UpdateScore(Game5, 3, 1);

    Result := lScoreboard
  except
    lScoreboard.Free;
    raise;
  end;
end;

end.

