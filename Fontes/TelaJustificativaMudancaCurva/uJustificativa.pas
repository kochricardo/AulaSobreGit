unit uJustificativa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  T_frmJusticaCurva = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    _lbeDescricaoMotivo: TLabeledEdit;
    BitBtn1: TBitBtn;
    _dsMotivo: TDataSource;
    _cdsMotivos: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmJusticaCurva: T_frmJusticaCurva;
  PnrProduto,PcdEmpresa:Integer;
  idAtualizou :boolean;

implementation

uses uRotinasGenericas, uAuxiliarCompras;

{$R *.dfm}

procedure T_frmJusticaCurva.BitBtn1Click(Sender: TObject);
var
 _cdsTemp :TClientDataSet;
begin
    if Length(_lbeDescricaoMotivo.Text)<6 then
    begin
        Mensagem('Justificativa Muito Resumida'+#13+
                 'Colocar um Justificativa correta',16);
        _lbeDescricaoMotivo.SetFocus;
        exit;
    end;
     _cdsTemp:=getMotivosMudancaCurva('CE',_lbeDescricaoMotivo.Text);
     if _cdsTemp=nil then
     begin
       InsertMotivosMudancaCurva('CE',_lbeDescricaoMotivo.Text,0);
     end;




       if SetCurvaProduto(PnrProduto,PcdEmpresa,'D', 'N') then
       begin
         idAtualizou:=true;
        Mensagem('Curva Atualizada', MB_ICONINFORMATION)
       end
      else
        Mensagem('Erro na Atualizacao da Curva', MB_ICONERROR)

end;

procedure T_frmJusticaCurva.DBGrid1DblClick(Sender: TObject);
begin
     _lbeDescricaoMotivo.Text:=_cdsMotivos.FieldByName('DS_MOTIVO').AsString;
end;

procedure T_frmJusticaCurva.FormShow(Sender: TObject);
begin
   idAtualizou:=false;
   _cdsMotivos:=MotivosMudancaCurva('CE');
   if _cdsMotivos<>nil then
   begin
     _cdsMotivos.Open;;
     _dsMotivo.DataSet:=_cdsMotivos;
   end;
end;

end.
