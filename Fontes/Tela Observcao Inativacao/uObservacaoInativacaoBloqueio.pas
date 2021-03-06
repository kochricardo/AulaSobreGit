unit uObservacaoInativacaoBloqueio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, SqlExpr, Buttons, DB, DBClient, Grids, DBGrids;

type
  T_frmMotivoInativacaoBloqueio = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _cbMotivo: TComboBox;
    Label1: TLabel;
    _btnGravaObservacao: TBitBtn;
    _edtMotivoBloqueio: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    _DBGProdutosInativaBloqueia: TDBGrid;
    _cdsProdutosInativaBloqueia: TClientDataSet;
    _dsProdutosInativaBloqueia: TDataSource;
    BitBtn1: TBitBtn;
    _dtpBloquearAte: TDateTimePicker;
    Label3: TLabel;
    _labAvisoBloqueio: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure _btnGravaObservacaoClick(Sender: TObject);
    procedure _DBGProdutosInativaBloqueiaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _DBGProdutosInativaBloqueiaDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    idTipo:String[1];
    procedure CarreMotivos(PidTipo: String);
    function ApagaObservacaoCompra(PnrProduto: Integer; PidTipo:String): boolean;
    function AbreTabelaProduto(PnrProduto: Integer): boolean;
    procedure setGridProduto;
    procedure filtraSelecioandos;
    procedure gravaObservacao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmMotivoInativacaoBloqueio: T_frmMotivoInativacaoBloqueio;
  idTipoMotivo:String[2];
  nrProdutoObservacao,
  NrPedidoObservacao:Integer;

implementation

uses uDm, uAuxiliarCompras, uRotinasGenericas, uSqlConsultaSistemas;

{$R *.dfm}

procedure T_frmMotivoInativacaoBloqueio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  filtraSelecioandos;
  action:=cafree;
end;

procedure T_frmMotivoInativacaoBloqueio.FormShow(Sender: TObject);
begin
  if idTipoMotivo='IF' then
     _frmMotivoInativacaoBloqueio.Caption:='Justificativa para Inativa??o Futura';
  _dtpBloquearAte.Enabled:=False;
  _dtpBloquearAte.Date:=dtSistema;
  _labAvisoBloqueio.Visible:=false;
  if idTipoMotivo='BL' then
  begin
     _frmMotivoInativacaoBloqueio.caption:='Justificativa para Bloqueio de Compra';

   _dtpBloquearAte.Enabled:=true;
   _dtpBloquearAte.Date:=dtSistema+10;
   _labAvisoBloqueio.Visible:=true;

  end;
CarreMotivos(idTipoMotivo);
AbreTabelaProduto(nrProdutoObservacao)
end;



procedure T_frmMotivoInativacaoBloqueio._btnGravaObservacaoClick(
  Sender: TObject);
var
dsObservacao :String;
msgTitulo,msgJanela:WideString;
nrMotivo:Integer;

begin
   filtraSelecioandos;

   idtipo:='B';
   msgTitulo:='Aviso Bloqueio de Produto para Compra Futura';
   msgJanela:='Bloquear Produto para comprar ?';
   if idTipoMotivo='IF' then
   begin
     idtipo:='I';
     msgTitulo:='Aviso Marca Produto para Inativacao Futura';
     msgJanela:='Marcar Produto para Inativar ?';

   end;



   if ConfirmaIcone(msgTitulo,msgJanela ,MB_YESNO, MB_ICONQUESTION, 0)= IDYES then
      gravaObservacao;
  close;

end;

procedure T_frmMotivoInativacaoBloqueio.CarreMotivos(PidTipo:String);
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT CD_MOTIVO,DS_MOTIVO');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('PRDDM.DC_MOTIVOS');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('ID_MOTIVO =:PidTipo');
    tempQuery.SQL.Add('order by DS_MOTIVO');
    tempQuery.ParamByName('PidTipo').AsString:=PidTipo;
    tempQuery.Open;
    _cbMotivo.Clear;
    _cbMotivo.Items.Add(formatfloat('0000',0)+' - '+'Escolha uma Op??o') ;
    while not tempQuery.eof do
    begin
     _cbMotivo.Items.Add(formatfloat('0000',tempQuery.FieldByName('CD_MOTIVO').AsInteger)+' - '+
                                            tempQuery.FieldByName('DS_MOTIVO').AsString) ;
      tempQuery.next;
    end;
    _cbMotivo.ItemIndex:=0;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;



procedure T_frmMotivoInativacaoBloqueio._DBGProdutosInativaBloqueiaDblClick(
  Sender: TObject);
Var
stmsg :String;
nrProduto,nrEmpresa:Integer;
begin


  if _cdsProdutosInativaBloqueia.Active then
  begin
    stmsg:=EmptyStr;



     if idTipoMotivo='IF' then
     begin


       if ItemCrossdocking(_cdsProdutosInativaBloqueia.FieldByName('CD_MERCADORIA').AsInteger) and (_cdsProdutosInativaBloqueia.FieldByName('CD_EMPRESA').AsInteger=5) then
       begin
            Mensagem('Este Produto faz CrossDocking..!!!'+#13+
                    'n?o pode Ser Inativado',MB_ICONWARNING);

          exit;

       end;


       if  (ItensComPedidoPendente(0,
                                     _cdsProdutosInativaBloqueia.FieldByName('CD_MERCADORIA').AsInteger,
                                      _cdsProdutosInativaBloqueia.FieldByName('CD_EMPRESA').AsInteger)) then
       begin
            Mensagem('Este Item Tem Pendencia..!!!'+#13+
                    'n?o pode Ser Inativado',MB_ICONWARNING);

          exit;
       end;



      if _cdsProdutosInativaBloqueia.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime<>strtodate('01/01/2039') then
       stmsg:='Item J? est? marcao para Inativa??o futura'#13+
              'Deseja Cancelar Inativa??o Futura ?' ;

     end;
     if idTipoMotivo='BL' then
     begin
      if _cdsProdutosInativaBloqueia.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime<>strtodate('01/01/2039') then
       stmsg:='Item J? est? Bloqueado Para compra'+#13+
              'Deseja Cancelar Bloqueio de Compra ?' ;
     end;

     if  stmsg<>EmptyStr then
     begin
         if confirma(stmsg,MB_DEFBUTTON1)=IDYES then
         begin
            _cdsProdutosInativaBloqueia.Edit;
           _cdsProdutosInativaBloqueia.FieldByName('ID_SELECIONADO').AsString:='S';
           nrProduto:=_cdsProdutosInativaBloqueia.FieldByName('CD_MERCADORIA').AsInteger;
           nrEmpresa:=_cdsProdutosInativaBloqueia.FieldByName('CD_EMPRESA').AsInteger;
           if idTipoMotivo='IF' then
           begin
              _cdsProdutosInativaBloqueia.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime:=strtodate('01/01/2039');
              SetInativacaoFuturaProduto(nrProduto,nrEmpresa, strtodate('01/01/2039'));
              InsereObservacao('I', nrProduto, 1,
                                   UpperCase('Desmarcou Inativa??o futura'), dtSistema,
                                   dtSistema, copy(nmLogin, 1, 10), 'P', 0);



           end;
           if idTipoMotivo='BL' then
           begin
              _cdsProdutosInativaBloqueia.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime:=strtodate('01/01/2039');
              SetBLoqueioProduto(nrProduto,nrEmpresa, strtodate('01/01/2039'));
              InsereObservacao('B', nrProduto, 1,
                                   UpperCase('Liberou Item Para Compra'), dtSistema,
                                   dtSistema, copy(nmLogin, 1, 10), 'P', 0);

           end;
         end;


     end;

    if  stmsg=EmptyStr then
    begin

    _cdsProdutosInativaBloqueia.Edit;
    if _cdsProdutosInativaBloqueia.FieldByName('ID_SELECIONADO').AsString='S' then
      _cdsProdutosInativaBloqueia.FieldByName('ID_SELECIONADO').AsString:='N'
    else
      _cdsProdutosInativaBloqueia.FieldByName('ID_SELECIONADO').AsString:='S';

     _cdsProdutosInativaBloqueia.open;
    end;
  end;
     _DBGProdutosInativaBloqueia.Refresh;

end;

procedure T_frmMotivoInativacaoBloqueio._DBGProdutosInativaBloqueiaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with _DBGProdutosInativaBloqueia do
  begin
    If odd(_dsProdutosInativaBloqueia.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
  end
  else
  begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
  end;

 if (Column.Field.FieldName) = 'DS_SITUACAO' then
 begin
  if (_dsProdutosInativaBloqueia.DataSet.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime<>strtodate('01/01/2039')) then
    begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clRed;
   end;
  if (_dsProdutosInativaBloqueia.DataSet.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime<>strtodate('01/01/2039')) then
    begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clBlue;
   end;
 end;



(**  if (_dsItemPedido.DataSet.FieldByName('CHEY_Y').AsInteger=0) then
    begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:=clYellow;
   end;*)
  if (_dsProdutosInativaBloqueia.DataSet.FieldByName('ID_SELECIONADO').AsString='S') then
  begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clGreen;
  end;

 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clRed;
    Canvas.Font.Color:= clWhite;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
  end;


end;

function T_frmMotivoInativacaoBloqueio.ApagaObservacaoCompra(PnrProduto:Integer;PidTipo:String): boolean;
VAR
  qryTemp: TSQLQuery;
  ST_QRY: STRING;
begin
  TRY
    qryTemp := TSQLQuery.Create(NIL);
    qryTemp.SQLConnection := _dm._conexao;

    with qryTemp do
    begin
      close;
      sql.Clear;
      sql.Add('delete prddm.dcobs where tips_s=:PidTipo and nros_s=:PnrProduto');
      ParamByname('PnrProduto').AsInteger := PnrProduto;
      result := TRUE;
      if ExecSQL(false) <= 0 then
        result := false;
    END;
  finally
    qryTemp.close;
    FreeAndNil(qryTemp);
  end;
end;



procedure T_frmMotivoInativacaoBloqueio.BitBtn1Click(Sender: TObject);
begin
 filtraSelecioandos;
 close;
end;

function T_frmMotivoInativacaoBloqueio.AbreTabelaProduto(PnrProduto:Integer): boolean;
VAR
  stQry: TStringList;
begin
  TRY
    stQry := TStringList.Create;

    with stQry do
    begin
      Add('SELECT CD_EMPRESA,(SELECT NM_EMPRESA');
      Add('                   FROM ACESSO.DC_EMPRESA EMP');
      Add('                   WHERE EMP.CD_EMPRESA=CM.CD_EMPRESA) AS  ID_CD,');
      Add('CASE');
      Add('WHEN CM.DT_INATIVACAO_FUTURA<>''01/01/2039'' THEN ''INATIVA??O FUT.''');
      Add(' WHEN CM.DT_BLOQUEIO_COMPRA<>''01/01/2039'' THEN ''BLOQUEIO COMPRA''');
      Add('ELSE ''COMPRA LIBERADA''');
      Add('END DS_SITUACAO,');


      Add('M.CD_MERCADORIA*10+NR_DV_MERCADORIA AS CD_PRODUTO,');
      Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
      Add('CM.DT_INATIVACAO_FUTURA,  CM.DT_BLOQUEIO_COMPRA,''N'' as ID_SELECIONADO,M.CD_MERCADORIA');
      Add('FROM');
      Add('PRDDM.DC_MERCADORIA M,');
      Add('PRDDM.DC_COMPRA_MERCADORIA CM');
      Add('WHERE');
      Add('M.CD_MERCADORIA=CM.CD_MERCADORIA');
//      if idTipo='I' then
  //    Add('AND cm.dt_inativacao<>''01/01/2039''');
    //  if idTipo='B' then
   //   Add('AND cm.dt_inativacao<>''01/01/2039''');
      Add('AND M.CD_MERCADORIA=:PnrProduto');;
    end;
    stQry.SaveToFile('C:\temp\sqlProdutoBloqueio.sql');

    with _cdsProdutosInativaBloqueia do
    begin
      close;
      CommandText:=stQry.Text;
      Params.ParamByName('PnrProduto').AsBCD:=PnrProduto;
      open;
    end;
    Result:=false;
    setGridProduto;
    if not _cdsProdutosInativaBloqueia.IsEmpty then
          Result:=true;

  finally

    FreeAndNil(stQry);
  end;
end;


procedure T_frmMotivoInativacaoBloqueio.setGridProduto;
begin
   TIntegerField(_cdsProdutosInativaBloqueia.FieldByName('CD_EMPRESA')).Visible:=false;

   TIntegerField(_cdsProdutosInativaBloqueia.FieldByName('CD_MERCADORIA')).Visible:=false;
   TStringField(_cdsProdutosInativaBloqueia.FieldByName('ID_SELECIONADO')).Visible:=false;

   TStringField(_cdsProdutosInativaBloqueia.FieldByName('ID_CD')).DisplayLabel:='Centro.Dist.';
   TStringField(_cdsProdutosInativaBloqueia.FieldByName('ID_CD')).DisplayWidth:=15;



   TStringField(_cdsProdutosInativaBloqueia.FieldByName('DS_SITUACAO')).DisplayLabel:='Situa??o';
   TStringField(_cdsProdutosInativaBloqueia.FieldByName('DS_SITUACAO')).DisplayWidth:=15;

   TIntegerField(_cdsProdutosInativaBloqueia.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Produto';
   TIntegerField(_cdsProdutosInativaBloqueia.FieldByName('CD_PRODUTO')).DisplayWidth:=10;

   TStringField(_cdsProdutosInativaBloqueia.FieldByName('NM_MERCADORIA')).DisplayLabel:='Produto';
   TStringField(_cdsProdutosInativaBloqueia.FieldByName('NM_MERCADORIA')).DisplayWidth:=30;

   TStringField(_cdsProdutosInativaBloqueia.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
   TStringField(_cdsProdutosInativaBloqueia.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

   TDateField(_cdsProdutosInativaBloqueia.FieldByName('DT_INATIVACAO_FUTURA')).DisplayLabel:='Dt.Inativa??o';
   TDateField(_cdsProdutosInativaBloqueia.FieldByName('DT_INATIVACAO_FUTURA')).DisplayWidth:=10;

   TDateField(_cdsProdutosInativaBloqueia.FieldByName('DT_BLOQUEIO_COMPRA')).DisplayLabel:='Dt.Bloqueio';
   TDateField(_cdsProdutosInativaBloqueia.FieldByName('DT_BLOQUEIO_COMPRA')).DisplayWidth:=10;

end;

procedure T_frmMotivoInativacaoBloqueio.filtraSelecioandos;
begin
   with _cdsProdutosInativaBloqueia do
   begin
     Filter:='ID_SELECIONADO=''S''';
     Filtered:= TRUE;
   end;
end;


procedure T_frmMotivoInativacaoBloqueio.gravaObservacao;
var
dsObservacao :String;
nrMotivo,
nrProduto,nrEmpresa:Integer;

begin


  _cdsProdutosInativaBloqueia.First;

   dsObservacao:=_edtMotivoBloqueio.Text;

 while not _cdsProdutosInativaBloqueia.Eof do
 begin
  if _cbMotivo.ItemIndex>0 then
  begin
      if dsObservacao='' then
          dsObservacao:=copy(_cbMotivo.Text,7,length(_cbMotivo.Text));
      nrProduto:=_cdsProdutosInativaBloqueia.FieldByName('CD_MERCADORIA').AsInteger;
      nrEmpresa:=_cdsProdutosInativaBloqueia.FieldByName('CD_EMPRESA').AsInteger;
      if idTipo='I' then
      begin
        if SetInativacaoFuturaProduto(nrProduto,nrEmpresa, dtSistema) then
        begin

         nrMotivo:=strtoint(copy(_cbMotivo.Text,1,4));
         InsereObservacao(idtipo, nrProduto, nrEmpresa,
                          UpperCase(copy(TRIM(dsObservacao), 1, 80)), _dtpBloquearAte.Date,
                          dtSistema, copy(nmLogin, 1, 10), 'P', nrMotivo);
        end;
      end;
      if idTipo='B' then
      begin
        if SetBLoqueioProduto(nrProduto,nrEmpresa, _dtpBloquearAte.Date) then
        begin

         nrMotivo:=strtoint(copy(_cbMotivo.Text,1,4));
         InsereObservacao(idtipo, nrProduto, nrEmpresa,
                          UpperCase(copy(TRIM(dsObservacao), 1, 80)), _dtpBloquearAte.Date,
                          dtSistema, copy(nmLogin, 1, 10), 'P', nrMotivo);
        end;
      end;

         _cdsProdutosInativaBloqueia.Edit;
         if idTipo='B' then
            _cdsProdutosInativaBloqueia.FieldByName('DT_BLOQUEIO_COMPRA').AsDateTime:=_dtpBloquearAte.Date;
          if idTipo='I' then
            _cdsProdutosInativaBloqueia.FieldByName('DT_INATIVACAO_FUTURA').AsDateTime:=dtSistema;

  end;
  _cdsProdutosInativaBloqueia.Next;
 end;
End;


end.
