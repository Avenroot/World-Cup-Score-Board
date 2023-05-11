unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnScoreboard: TButton;
    btnSettings: TButton;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnScoreboardClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses ScoreboardForm, SettingsForm;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnScoreboardClick(Sender: TObject);
begin
//  if not Assigned(frmScoreboard) then
//    frmScoreboard.Create(self);

  frmScoreBoard.Show;
end;

procedure TfrmMain.btnSettingsClick(Sender: TObject);
begin
//  if not Assigned(frmSettings) then
//    frmSettings.Create(self);

  frmSettings.Show;

end;

end.
