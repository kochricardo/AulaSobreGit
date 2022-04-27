unit uDM;

interface

uses
  SysUtils, Classes, DBXOracle, DBClient, TConnect, DB, SqlExpr, FMTBcd,
  Provider;

type
  T_dm = class(TDataModule)
    _conexao: TSQLConnection;
    _LocalConexao: TLocalConnection;
    _cdsGenerico: TClientDataSet;
    _dspGenerica: TDataSetProvider;
    _sqlGenerica: TSQLQuery;
    procedure _conexaoAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _dm: T_dm;

implementation

{$R *.dfm}

procedure T_dm._conexaoAfterConnect(Sender: TObject);
begin
  _conexao.Execute('alter session set NLS_NUMERIC_CHARACTERS=''.,''', NIL,NIL);
  _conexao.Execute('alter session set NLS_date_format=''dd/mm/RRRR HH24:MI:SS''', NIL,NIL);

end;

end.
