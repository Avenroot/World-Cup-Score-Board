unit GameInterface;

interface

uses
  TeamType;

type
  IGame = interface
    ['{66F72B90-1A96-4C02-B98E-ECF47E70A3C4}']
    function GetHomeTeam: TTeam;
    function GetAwayTeam: TTeam;
    function GetTotalScore: Integer;
    procedure SetHomeScore(Score: Integer);
    procedure SetAwayScore(Score: Integer);
  end;

implementation

end.
