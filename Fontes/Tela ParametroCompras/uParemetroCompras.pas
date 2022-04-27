unit uParemetroCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, Grids, DBGrids, DBClient, StdCtrls;

type
  T_frmCadastroParametro = class(TForm)
    PageControl1: TPageControl;
    _tbsParametro: TTabSheet;
    StatusBar1: TStatusBar;
    _edtGrupoFornecedor: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    _edtDivisaoFornecedor: TLabel;
    _cdsAgenda: TClientDataSet;
    _cdsAgendacdSequencia: TIntegerField;
    _cdsAgendaData_Agenda: TDateField;
    DBGrid1: TDBGrid;
    _dsAgenda: TDataSource;
    _dtpData: TDateTimePicker;
    procedure _dtpDataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCadastroParametro: T_frmCadastroParametro;

implementation

{$R *.dfm}

procedure T_frmCadastroParametro._dtpDataClick(Sender: TObject);
var
stData :String;
begin
 stData:= FormatDateTime('dd/dd/yyyy',_dtpData.Date);

 if stData<>'' then
    Sleep(0);


end;

end.
