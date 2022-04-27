{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
unit uListaAgendaCompradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, StdCtrls, Buttons, ExtCtrls;

type
  T_frmListaAgendaCompradores = class(TForm)
    _gbFiltroLista: TGroupBox;
    GroupBox1: TGroupBox;
    _lbeComprador: TLabeledEdit;
    _btnMostraPedidos: TBitBtn;
    _cdsListaFornecedores: TClientDataSet;
    _dsListaFornecedores: TDataSource;
    _dbgListagemAgenda: TDBGrid;
    _btnFechar: TBitBtn;
    _btnParaExcel: TBitBtn;
    procedure _btnMostraPedidosClick(Sender: TObject);
    procedure _dbgListagemAgendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnFecharClick(Sender: TObject);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure _dbgListagemAgendaTitleClick(Column: TColumn);
  private
    procedure AbreAgendaLaboratorio(nrComprador: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmListaAgendaCompradores: T_frmListaAgendaCompradores;

implementation

uses uDm, uRotinasGenericas;

{$R *.dfm}


Procedure T_frmListaAgendaCompradores.AbreAgendaLaboratorio(nrComprador:Integer);
var
  stQry : TStringList;
begin
 try
   stQry := TStringList.Create;

   with stQry do
   begin
     add('SELECT CD_COMPRADOR,NM_COMPRADOR_REDUZIDO,NR_FORNECEDOR, NM_FORNECEDOR, DT_AGENDAMENTO,NR_ITENS,ID_SITUACAO_AGENDA');
     add('FROM');
     add('(SELECT');
     add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR AS NR_FORNECEDOR,');
     add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,');
     add('Count(*) NR_ITENS,');
     add('CD_FABRICANTE,');
     add('DT_AGENDAMENTO,');
     add('DT_PROXIMO_PEDIDO,');
     add('DS_NUMERO_DIA_SEMANA,');
     add('QT_DIAS_LEADTIME_TERMOLABIL,');
     add('QT_DIAS_LEADTIME_FABRICANTE,');
     add('DS_GRUPO_FORNECEDOR,');
     add('CD_GRUPO_CURVA_FABRICANTE,');
     add('case');
     add('when trunc(DT_AGENDAMENTO)<trunc(SYSDATE) then ''Atrasado''');
     add('when trunc(DT_AGENDAMENTO)=trunc(SYSDATE) then ''Agendado''');
     add('when trunc(DT_AGENDAMENTO)>trunc(SYSDATE) then ''Antecipado''');
     add('end ID_SITUACAO_AGENDA,NM_COMPRADOR_REDUZIDO,CD_COMPRADOR');
     add('FROM');
     add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     add('PRDDM.DC_COMPRADOR_GAM COMPRADOR');
     add('WHERE');
     add('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR= COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     add('AND COMPRA_MERCADORIA.ID_SITUACAO_MERCADORIA<>''I''');
     add('AND CD_COMPRADOR= NR_COMPRADOR');
     add('AND CD_COMPRADOR not in(0,5,21)');
     add('AND GRUPO_FORNECEDOR.ID_SITUACAO<>''I''');
     if nrComprador>0 then
        add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
     add('AND COMPRA_MERCADORIA.CD_EMPRESA=:PnrEmpresa');
     add('GROUP BY  GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR,');
     add('CD_FABRICANTE,');
     add('DT_AGENDAMENTO,');
     add('DT_PROXIMO_PEDIDO,');
     add('DS_NUMERO_DIA_SEMANA,');
     add('QT_DIAS_LEADTIME_TERMOLABIL,');
     add('QT_DIAS_LEADTIME_FABRICANTE,');
     add('DS_GRUPO_FORNECEDOR,');
     add('CD_GRUPO_CURVA_FABRICANTE,NM_COMPRADOR_REDUZIDO,CD_COMPRADOR');
     add('ORDER BY cd_comprador,DT_AGENDAMENTO ASC)');
   end;

   with _cdsListaFornecedores do
   begin
     close;
     CommandText:=stQry.Text;
     if nrComprador>0 then
        Params.ParamByName('PnrComprador').AsInteger:=nrComprador;
     Params.ParamByName('PnrEmpresa').AsInteger:=1;
     open;
   end;
    _btnParaExcel.Enabled:=false;
   if not _cdsListaFornecedores.IsEmpty then
   begin
      //, , DT_AGENDAMENTO,NR_ITENS,
      _btnParaExcel.Enabled:=true;
     TIntegerField(_cdsListaFornecedores.FieldByName('CD_COMPRADOR')).DisplayFormat:='####0';
     TIntegerField(_cdsListaFornecedores.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr.Compr.';
     TIntegerField(_cdsListaFornecedores.FieldByName('CD_COMPRADOR')).DisplayWidth:=07;

     TStringField(_cdsListaFornecedores.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Nome Comprador';
     TStringField(_cdsListaFornecedores.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=25;

     TIntegerField(_cdsListaFornecedores.FieldByName('NR_FORNECEDOR')).DisplayFormat:='##,###,##0';
     TIntegerField(_cdsListaFornecedores.FieldByName('NR_FORNECEDOR')).DisplayLabel:='Nr. Lab.';
     TIntegerField(_cdsListaFornecedores.FieldByName('NR_FORNECEDOR')).DisplayWidth:=06;

     TStringField(_cdsListaFornecedores.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornecedor';
     TStringField(_cdsListaFornecedores.FieldByName('NM_FORNECEDOR')).DisplayWidth:=30;

     TStringField(_cdsListaFornecedores.FieldByName('ID_SITUACAO_AGENDA')).DisplayLabel:='Situação';
     TStringField(_cdsListaFornecedores.FieldByName('ID_SITUACAO_AGENDA')).DisplayWidth:=12;

     TIntegerField(_cdsListaFornecedores.FieldByName('NR_ITENS')).DisplayFormat:='##,###,##0';
     TIntegerField(_cdsListaFornecedores.FieldByName('NR_ITENS')).DisplayLabel:='Nr. Prod.';
     TIntegerField(_cdsListaFornecedores.FieldByName('NR_ITENS')).DisplayWidth:=06;

     TDateField(_cdsListaFornecedores.FieldByName('DT_AGENDAMENTO')).DisplayFormat:='dd/mm/yyyy';
     TDateField(_cdsListaFornecedores.FieldByName('DT_AGENDAMENTO')).DisplayLabel:='Dt. Agenda';
     TDateField(_cdsListaFornecedores.FieldByName('DT_AGENDAMENTO')).DisplayWidth:=12;


     {TIntegerField(_cdsListaFornecedores.FieldByName('NR_UNID_ULT3M')).DisplayFormat:='###,###,##0';
     TIntegerField(_cdsListaFornecedores.FieldByName('NR_UNID_ULT3M')).DisplayLabel:='Nr.Unid. Vend.(3 meses)';
     TIntegerField(_cdsListaFornecedores.FieldByName('NR_UNID_ULT3M')).DisplayWidth:=22;
     TStringField(_cdsListaFornecedores.FieldByName('ID_SITUACAO_FABRICANTE')).Visible:=false;}

   end;

 finally
  FreeAndNil(stQry);
 end;
end;


procedure T_frmListaAgendaCompradores._dbgListagemAgendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _cdsListaFornecedores.active then
  begin
   with _dbgListagemAgenda do
   begin
    if odd(_cdsListaFornecedores.RecNo) then
    begin
      _dbgListagemAgenda.Canvas.Font.Color := clBlack;
      _dbgListagemAgenda.Canvas.Brush.Color := clSkyBlue;
    end
    else
    begin
      _dbgListagemAgenda.Canvas.Font.Color := clBlack;
      _dbgListagemAgenda.Canvas.Brush.Color := clWhite;
    end;


 if Column.Field.FieldName='ID_SITUACAO_AGENDA' then
 begin
  if (_cdsListaFornecedores.FieldByName('ID_SITUACAO_AGENDA').AsString='Agendado')   THEN
  begin
   _dbgListagemAgenda.Canvas.Font.Color:= clWhite;
   _dbgListagemAgenda.Canvas.Brush.Color:= clGreen;
  end;
  if (_cdsListaFornecedores.FieldByName('ID_SITUACAO_AGENDA').AsString='Antecipado')   THEN
  begin
   _dbgListagemAgenda.Canvas.Font.Color:= clBlack;
   _dbgListagemAgenda.Canvas.Brush.Color:= clYellow;
  end;
  if (_cdsListaFornecedores.FieldByName('ID_SITUACAO_AGENDA').AsString='Atrasado')   THEN
  begin
   _dbgListagemAgenda.Canvas.Font.Color:= clWhite;
   _dbgListagemAgenda.Canvas.Brush.Color:= clRed;
  end;
 end;

     // mude a cor de celulas selecionadas
    if (gdSelected in State) then
    begin
      Canvas.Brush.Color := clYellow;
      Canvas.Font.Color := clBlack;
    end;
    // mude a cor das celulas com foco
    if (gdfocused in State) then
    begin
      Canvas.Brush.Color := clGreen;
      Canvas.Font.Color := clWhite;
    end;
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
  end;

end;

procedure T_frmListaAgendaCompradores._dbgListagemAgendaTitleClick(
  Column: TColumn);
begin
    GeraOrdenacao(_cdsListaFornecedores,Column);
end;

procedure T_frmListaAgendaCompradores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure T_frmListaAgendaCompradores._btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure T_frmListaAgendaCompradores._btnMostraPedidosClick(Sender: TObject);
begin
 AbreAgendaLaboratorio(StrToIntDef(_lbeComprador.Text,0));
end;

procedure T_frmListaAgendaCompradores._btnParaExcelClick(Sender: TObject);
begin
  _btnParaExcel.Enabled:=false;
  GerarExcel(_cdsListaFornecedores);

end;

end.
