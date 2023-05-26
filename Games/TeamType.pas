unit TeamType;

interface

type
  TTeam = class
  private
    FName: String;
    FScore: Integer;
  public
    constructor Create(const AName:string);
    function Equals(Obj: TObject): Boolean; override;
    property Name: String read FName write FName;
    property Score: Integer read FScore write FScore;
  end;

implementation

{ TTeam }

constructor TTeam.Create(const AName: string);
begin
  FName := AName;
  FScore := 0;
end;

function TTeam.Equals(Obj: TObject): Boolean;
var
  OtherTeam: TTeam;
begin
  if Obj = Self then
    Exit(True);

  if not (Obj is TTeam) then
    Exit(False);

  OtherTeam := TTeam(Obj);

  Result := FName = OtherTeam.FName;
end;

end.
