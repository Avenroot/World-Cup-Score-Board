unit GameClass;

interface

uses
  GameInterface,
  TeamType;

type
  TGame = class(TInterfacedObject, IGame)
  private
    FHomeTeam: TTeam;
    FAwayTeam: TTeam;
    FHomeScore: Integer;
    FAwayScore: Integer;
    FStartOrder: Integer;
    function GetHomeTeam: TTeam;
    function GetAwayTeam: TTeam;
    function GetHomeScore: Integer;
    function GetAwayScore: Integer;
    function GetStartOrder: Integer;
    procedure SetHomeScore(Score: Integer);
    procedure SetAwayScore(Score: Integer);

  public
    constructor Create(const HomeTeam, AwayTeam: string);
    function GetTotalScore: Integer;
    property HomeTeam: TTeam read GetHomeTeam;
    property AwayTeam: TTeam read GetAwayTeam;
    property HomeScore: Integer read GetHomeScore write SetHomeScore;
    property AwayScore: Integer read GetAwayScore write SetAwayScore;
  end;

implementation

{ TGame }

constructor TGame.Create(const HomeTeam, AwayTeam: string);
begin
  FHomeTeam.Name := HomeTeam;
  FHomeTeam.Score := 0;
  FAwayTeam.Name := AwayTeam;
  FAwayTeam.Score := 0;
end;

function TGame.GetHomeTeam: TTeam;
begin
  Result := FHomeTeam;
end;

function TGame.GetAwayTeam: TTeam;
begin
  Result := FAwayTeam;
end;

function TGame.GetHomeScore: Integer;
begin
  Result := FHomeScore;
end;

function TGame.GetAwayScore: Integer;
begin
  Result := FAwayScore;
end;

function TGame.GetStartOrder: Integer;
begin
  Result := FStartOrder;
end;

function TGame.GetTotalScore: Integer;
begin
  Result := FHomeScore + FAwayScore;
end;

procedure TGame.SetAwayScore(Score: Integer);
begin
  FAwayTeam.Score := Score;
  FAwayScore := FAwayTeam.Score;
end;

procedure TGame.SetHomeScore(Score: Integer);
begin
  FHomeTeam.Score := Score;
  FHomeScore := FHomeTeam.Score;
end;

end.

