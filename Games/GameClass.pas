unit GameClass;

interface

uses
  System.SysUtils,
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
    function GetHashCode: Integer; override;
    function Equals(Obj: TObject): Boolean; override;
    property HomeTeam: TTeam read GetHomeTeam;
    property AwayTeam: TTeam read GetAwayTeam;
    property HomeScore: Integer read GetHomeScore write SetHomeScore;
    property AwayScore: Integer read GetAwayScore write SetAwayScore;
    property StartOrder: Integer read GetStartOrder;
  end;

implementation

{ TGame }

constructor TGame.Create(const HomeTeam, AwayTeam: string);
begin
  FHomeTeam := TTeam.Create(HomeTeam);
  FAwayTeam := TTeam.Create(AwayTeam);
  FStartOrder :=  Round((Now - 25569) * 86400);
end;

function TGame.GetHomeTeam: TTeam;
begin
  Result := FHomeTeam;
end;

function TGame.GetAwayTeam: TTeam;
begin
  Result := FAwayTeam;
end;

function TGame.GetHashCode: Integer;
begin
  Result := FStartOrder; // Use FStartOrder for hash code calculation
end;

function TGame.GetHomeScore: Integer;
begin
  Result := FHomeScore;
end;

function TGame.Equals(Obj: TObject): Boolean;
var
  OtherGame: TGame;
begin
  if Obj = Self then
    Exit(True);

  if not (Obj is TGame) then
    Exit(False);

  OtherGame := TGame(Obj);

  Result :=
    (FHomeTeam.Equals(OtherGame.FHomeTeam)) and
    (FAwayTeam.Equals(OtherGame.FAwayTeam)) and
    (FHomeScore = OtherGame.FHomeScore) and
    (FAwayScore = OtherGame.FAwayScore) and
    (FStartOrder = OtherGame.FStartOrder);

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

