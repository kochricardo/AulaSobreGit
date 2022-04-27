unit uListaVerba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls;

type
  T_frmListaVerbaFornecedor = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    _cdsVerbaDisponiveis: TClientDataSet;
    _dsVerbaDisponiveis: TDataSource;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmListaVerbaFornecedor: T_frmListaVerbaFornecedor;

  nrListaVerbaFornecedor:Integer;

implementation

{$R *.dfm}

procedure T_frmListaVerbaFornecedor.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case key of
      VK_RETURN: begin
                    nrListaVerbaFornecedor:=_cdsVerbaDisponiveis.FieldByName('NROV_V').AsInteger;
                    close;
           end;
    end;
end;


procedure T_frmListaVerbaFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     action:=cafree;
end;

end.
