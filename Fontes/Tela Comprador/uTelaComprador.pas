unit uTelaComprador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, DBClient, StdCtrls, Buttons;

type
  T_frmCompradorDisponivel = class(TForm)
    Comprador: TGroupBox;
    _cdsComprador: TClientDataSet;
    _dsComprador: TDataSource;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    _btnTesteValor: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnTesteValorClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure SetGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCompradorDisponivel: T_frmCompradorDisponivel;

implementation

uses uAuxiliarCompras, uRotinasGenericas;

{$R *.dfm}

procedure T_frmCompradorDisponivel.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure T_frmCompradorDisponivel.DBGrid1DblClick(Sender: TObject);
begin
   nrCompradorSistema:=_cdsComprador.FieldByName('NR_COMPRADOR').AsInteger;
   CLOSE;
end;

procedure T_frmCompradorDisponivel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure T_frmCompradorDisponivel.FormCreate(Sender: TObject);
begin
  _cdsComprador:=GetCompradores(0);
  if _cdsComprador<>nil then
  begin
    _cdsComprador.Open;
    _dsComprador.DataSet:=_cdsComprador;
    SetGrid;
  end;
end;

procedure T_frmCompradorDisponivel._btnTesteValorClick(Sender: TObject);
begin
  nrCompradorSistema:=_cdsComprador.FieldByName('NR_COMPRADOR').AsInteger;
 CLOSE;
end;

procedure T_frmCompradorDisponivel.SetGrid;
begin
  TIntegerField(_cdsComprador.FieldByName('NR_COMPRADOR')).DisplayLabel:='Nr.Comprador';
  TIntegerField(_cdsComprador.FieldByName('NR_COMPRADOR')).DisplayWidth:=8;
  TIntegerField(_cdsComprador.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Nome Comprador';
  TIntegerField(_cdsComprador.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=20;
  TIntegerField(_cdsComprador.FieldByName('DS_EMAIL_COMPRADOR')).DisplayLabel:='Email';
  TIntegerField(_cdsComprador.FieldByName('DS_EMAIL_COMPRADOR')).DisplayWidth:=20


end;

end.
