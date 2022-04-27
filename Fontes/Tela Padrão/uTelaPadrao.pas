unit uTelaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, uDm;

type
  T_frmPadrao = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    _cdsBase: TClientDataSet;
    dsBase: TDataSource;
    GroupBox3: TGroupBox;
    _btnExecuta: TBitBtn;
    _bitFechar: TBitBtn;
    _btnParaExcel: TBitBtn;
    procedure _bitFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmPadrao: T_frmPadrao;

implementation

{$R *.dfm}

procedure T_frmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure T_frmPadrao._bitFecharClick(Sender: TObject);
begin
 close;
end;

end.
