unit GameSummaryFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfraGameSummary = class(TFrame)
    imgAwayTeam: TImage;
    imgHomeTeam: TImage;
    lblAwayTeam: TLabel;
    lblHomeTeam: TLabel;
    lblAwayTeamScore: TLabel;
    lblHomeTeamScore: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
