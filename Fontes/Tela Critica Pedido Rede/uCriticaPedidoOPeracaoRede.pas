unit uCriticaPedidoOPeracaoRede;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, StdCtrls, Buttons, ComCtrls, DBCtrls,
  sqlExpr, uDm;

type
  T_FrmCriticaPedidoOperacao = class(TForm)
    stBar: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    _btnConsultaCritica: TBitBtn;
    _cdsPedidoClienteRede: TClientDataSet;
    _dsCriticaPedido: TDataSource;
    _dbgItensCriticas: TDBGrid;
    Memo1: TMemo;
    _cdsPedidoClienteRedeNR_CLIENTE: TIntegerField;
    _cdsPedidoClienteRedeNR_CNPJ_FORNECEDOR: TStringField;
    _cdsPedidoClienteRedeNR_PEDIDO: TLongWordField;
    _cdsPedidoClienteRedeID_PEDIDO_REJEITADO: TStringField;
    _cdsPedidoClienteRedeDS_MOTIVO_REJEICAO: TWideStringField;
    GroupBox3: TGroupBox;
    _dbgCapaPedidoRejeicao: TDBGrid;
    _cdsCriticaPedido: TClientDataSet;
    _cdsItensPedido: TClientDataSet;
    _dsPedidoClienteRede: TDataSource;
    _dsItensPedido: TDataSource;
    _cdsPedidoClienteRedeNM_RAZAO_CLIENTE: TStringField;
    _cdsPedidoClienteRedeNR_CNPJ_CLIENTE: TStringField;
    _cdsPedidoClienteRedeNM_FORNECEDOR: TStringField;
    _cdsItensPedidoNR_SEQUENCIAL: TIntegerField;
    _cdsItensPedidoCD_EAN: TStringField;
    _cdsItensPedidoDS_MOTIVO_REJEICAO: TStringField;
    _cdsItensPedidoNR_PEDIDO: TLongWordField;
    _cdsItensPedidoCD_PRODUTO: TIntegerField;
    _cdsItensPedidoNM_PRODUTO: TStringField;
    _cbxOperacaoRede: TComboBox;
    Label1: TLabel;
    _cdsPedidoClienteRedeNM_ARQUIVO: TStringField;
    _cdsPedidoClienteRedeNR_EMPRESA: TIntegerField;
    _cdsPedidoClienteRedeCD_OPERACAO_REDE: TIntegerField;
    _btnReprocessa: TBitBtn;
    _chkFiltroVinculado: TCheckBox;
    _cdsItensPedidoCD_EMPRESA: TIntegerField;
    _cdsItensPedidoNR_OPERACAO_REDE: TIntegerField;
    _btnVinculaMercadoria: TBitBtn;
    _btnParaExcel: TBitBtn;
    _cdsPedidoClienteRedeDS_DESCRICAO_PRODUTO_MAX: TStringField;
    _cdsItensPedidoNM_APRESENTACAO_MAX: TStringField;
    procedure _btnConsultaCriticaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dbgCapaPedidoRejeicaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgItensCriticasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure _btnReprocessaClick(Sender: TObject);
    procedure _chkFiltroVinculadoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure _btnParaExcelClick(Sender: TObject);
  private
    procedure CarregaPedido(PCnpjCliente,
                            PcnpjFornecedor: String;
                            PcdCliente: Integer;
                            PnmRazaoCliente,
                            PnrPedido,
                            PidRejeitado,
                            PdsDescricaoMotico,
                            PnmRazaoFornecedor,
                            PnmArquivo:String;
                            PnrOperacao,
                            PnrEmpresa:Integer;
                            PdsMotivoMax:String);
    procedure CarregaCriticaPedido(PnrPedido:String;
                                   PnrSequencia:Integer;
                                   PcdEAN,
                                   PdsMotivo:String;
                                   PcdProduto:Integer;
                                   PdsNomeProduto:String;
                                   PcdEmpresa,
                                   PnrOperacaoRede:Integer;
                                   PdsApresentacaoMax:String);
    procedure CarregaOperacaoRede;
    function ValidaProdutoVinculado: Boolean;
    function VinculaProdutoOperacao(PnrProduto, PnrEmpresa,
      PnrOperacaoRede: Integer; PidExclusivoOperacaoRede, PidSituacao: String;
      PdtAtualizacao: Tdate; PnmUsuario: String): boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  _FrmCriticaPedidoOperacao: T_FrmCriticaPedidoOperacao;

implementation

uses uAuxiliarCompras, uProduto, uRotinasGenericas, ucliente;

{$R *.dfm}

procedure T_FrmCriticaPedidoOperacao._btnConsultaCriticaClick(Sender: TObject);
var
  I,nrLinhas,
  nrRede,
  NrEmpresa,
  nrsequencial,
  cdLinhaCabecalho,
  cdLinhaDetalhe,
  cdLinhaFinalizador,
  cdProduto,
  nrOperacaoRede,cdEmpresa :Integer;

  CnpjCliente,
  CnpjFornecedor,
  nrPedido,
  IdRejeitado,

  dsMotivo,
  dsCodEan,
  dsMotivoItem,
  nmProduto,
  nmFornecedor,
  dsProdutoApresentcaoMax,
  nmArquivoPedido:String;
  dtLancamentoPedido: TDate;

  DadosFornecedor :TDadosFornecedor;
  DadosClientes   :TCliente;
  DadosMerCadoria :TMercadoria;

  msgPedido:WideString;


//var

begin
     nrRede   := StrToIntDef(copy(_cbxOperacaoRede.Text,1,2),0);
     NrEmpresa := StrToIntDef(copy(_cbxOperacaoRede.Text,6,2),0);


    msgPedido:='';

    if (nrRede>0) and (NrEmpresa>0) then

    _cdsCriticaPedido:=GetCriticaPedidoOPeracaoRede(nrRede,NrEmpresa);

    _cdsPedidoClienteRede.close;
    _cdsPedidoClienteRede.CreateDataSet;

    _cdsPedidoClienteRede.Close;
    _cdsPedidoClienteRede.CreateDataSet;

    _cdsItensPedido.Close;
    _cdsItensPedido.CreateDataSet;

   if _cdsCriticaPedido=nil then
   begin
     Mensagem('N?o existe Critica pedido !!!',MB_ICONWARNING);
     exit;
   end;


    if _cdsCriticaPedido<>nil then
    begin
      _dsCriticaPedido.DataSet:=_cdsCriticaPedido;
      _cdsCriticaPedido.Open;
    end;

    _cdsCriticaPedido.First;
    while not _cdsCriticaPedido.Eof do
    begin

      DadosFornecedor:=nil;
      DadosClientes  :=nil;
      Memo1.Clear;
      Memo1.Lines.Add(trim(_cdsCriticaPedido.FieldByName('DS_PEDIDO_COMPRA_RETORNO').AsAnsiString));

     cdLinhaCabecalho  :=StrToIntDef(copy(Memo1.Lines.Strings[0],1,1),0);

     if cdLinhaCabecalho=1 then
     begin

        CnpjCliente    :=copy(Memo1.Lines.Strings[0],07,14);
        CnpjFornecedor :=copy(Memo1.Lines.Strings[0],21,14);
        nrPedido       :=copy(Memo1.Lines.Strings[0],35,20);
        IdRejeitado    :=copy(Memo1.Lines.Strings[0],55,01);
        dsMotivo       :=copy(Memo1.Lines.Strings[0],56,30);

        nrOperacaoRede :=_cdsCriticaPedido.FieldByName('CD_OPERACAO_REDE').AsInteger;
        cdEmpresa      :=_cdsCriticaPedido.FieldByName('CD_EMPRESA').AsInteger;
        nmArquivoPedido:=_cdsCriticaPedido.FieldByName('NM_ARQUIVO_ORIGEM').AsString;
        dtLancamentoPedido:=_cdsCriticaPedido.FieldByName('DT_LANCAMENTO').AsDateTime;


        if CnpjCliente<>'' then
           DadosClientes:=GetCliente(0,0,0,CnpjCliente);

        if CnpjFornecedor<>'' then
           DadosFornecedor:=GetDadosLaboratorioCNPJ(0,CnpjFornecedor);

        if DadosClientes=nil then
           msgPedido:='Pedido --> '+nrPedido+'  '+ msgPedido+#13+'Cliente n?o encontrado !!!';

        if DadosFornecedor<>nil then
         nmFornecedor:=DadosFornecedor.dsRazaoSocial;
        if DadosFornecedor=nil then
        begin
          // Mensagem(dsMotivo,MB_ICONWARNING);
           msgPedido:=msgPedido+#13+dsMotivo;

           nmFornecedor:=dsMotivo;
        end;

        if  (DadosClientes<>nil) then
           CarregaPedido(CnpjCliente,
                         cnpjFornecedor,
                         DadosClientes.cdCliente,//cdcliente
                         DadosClientes.nmRazaoSocial,//PnmRazaoCliente,
                         nrPedido,
                         idRejeitado,
                         dsMotivo,
                         nmFornecedor,
                         nmArquivoPedido,
                         nrOperacaoRede,
                         cdEmpresa,dsProdutoApresentcaoMax);

        if  (DadosClientes=nil) then

           CarregaPedido(CnpjCliente,
                         cnpjFornecedor,
                         0,//cdcliente
                         'Sem Cadastro',//PnmRazaoCliente,
                         nrPedido,
                         idRejeitado,
                         dsMotivo,
                         nmFornecedor,
                         nmArquivoPedido,
                         nrOperacaoRede,
                         cdEmpresa,dsProdutoApresentcaoMax);

     end;



     cdLinhaDetalhe    :=StrToIntDef(copy(Memo1.Lines.Strings[1],1,1),0);

     nrLinhas:=0;


     for I :=0 to Memo1.Lines.Count do
     begin
       if trim(Memo1.Lines.Strings[I])<>EmptyStr then
       begin
          Inc(nrLinhas);

          cdLinhaDetalhe    :=StrToIntDef(copy(Memo1.Lines.Strings[i],1,1),0);

          if cdLinhaDetalhe=2 then
          begin
           nrsequencial :=StrToIntDef(copy(Memo1.Lines.Strings[i],2,5),0);
           dsCodEan     :=copy(Memo1.Lines.Strings[i],8,13);
           dsMotivoItem :=copy(Memo1.Lines.Strings[i],21,30);
           dsProdutoApresentcaoMax   :=copy(Memo1.Lines.Strings[i],51,80);



           DadosMerCadoria:=GetMercadoriaNova(0,
                                              0,
                                              0,
                                              0,
                                              0,
                                              dsCodEan);

            cdProduto:=0;
            nmProduto:='';
            if DadosMerCadoria<>nil then
            begin
              cdProduto:=DadosMerCadoria.cdProduto;
              nmProduto:=DadosMerCadoria.nmProduto+' - '+DadosMerCadoria.dsApresentacao;
              if DadosMerCadoria.idSituacaoMercadoriaCompra = 'I' then
                 cdProduto:=0;

            end;


          CarregaCriticaPedido( nrPedido, //PnrPedido:LongWord;
                                nrsequencial, //PnrSequencia:Integer;
                                dscodEan,//PcdEAN,
                                dsMotivoItem, //PdsMotivo:String
                                cdProduto,
                                nmProduto,
                                NrEmpresa,
                                nrRede,
                                dsProdutoApresentcaoMax);
          end;
       end;

     end;
     cdLinhaFinalizador:=StrToIntDef(copy(Memo1.Lines.Strings[nrLinhas-1],1,1),0);
     _cdsCriticaPedido.Next;
    end;
   // if msgPedido<>'' then
    //   Mensagem(msgPedido,MB_ICONQUESTION);
   end;


procedure T_FrmCriticaPedidoOperacao._btnParaExcelClick(Sender: TObject);
begin
  GerarExcel(_cdsItensPedido);
end;

procedure T_FrmCriticaPedidoOperacao.CarregaPedido(PCnpjCliente,
                                                   PcnpjFornecedor:String;
                                                   PcdCliente:Integer;
                                                   PnmRazaoCliente,
                                                   PnrPedido,
                                                   PidRejeitado,
                                                   PdsDescricaoMotico,
                                                   PnmRazaoFornecedor,
                                                   PnmArquivo:String;
                                                   PnrOperacao,
                                                   PnrEmpresa:Integer;
                                                   PdsMotivoMax:String);
begin
    _cdsPedidoClienteRede.Open;
    _cdsPedidoClienteRede.Append;
    _cdsPedidoClienteRedeNR_CLIENTE.AsInteger:=PcdCliente;
    _cdsPedidoClienteRedeNR_CNPJ_CLIENTE.AsString:=PCnpjCliente;
    _cdsPedidoClienteRedeNM_RAZAO_CLIENTE.AsString:=PnmRazaoCliente;
    _cdsPedidoClienteRedeNR_CNPJ_FORNECEDOR.AsString:=PcnpjFornecedor;
    _cdsPedidoClienteRedeNR_PEDIDO.AsString:=PnrPedido;
    _cdsPedidoClienteRedeID_PEDIDO_REJEITADO.AsString:=PidRejeitado;
    _cdsPedidoClienteRedeDS_MOTIVO_REJEICAO.AsString:=PdsDescricaoMotico;
    _cdsPedidoClienteRedeNM_FORNECEDOR.AsString:=PnmRazaoFornecedor;
    _cdsPedidoClienteRedeNM_ARQUIVO.AsString:=PnmArquivo;
    _cdsPedidoClienteRedeCD_OPERACAO_REDE.AsInteger:=PnrOperacao;
    _cdsPedidoClienteRedeNR_EMPRESA.AsInteger:=PnrEmpresa;
    _cdsPedidoClienteRedeDS_DESCRICAO_PRODUTO_MAX.AsString:=PdsMotivoMax;

    _cdsPedidoClienteRede.Post;
    _cdsPedidoClienteRede.Open;



end;

procedure T_FrmCriticaPedidoOperacao._chkFiltroVinculadoClick(Sender: TObject);
begin
     _cdsItensPedido.Filtered:=false;
     if _chkFiltroVinculado.Checked then
     begin
        _cdsItensPedido.Filter:='DS_MOTIVO_REJEICAO='+QuotedStr('EAN NAO VINCULADO A OPERACAO');
        _cdsItensPedido.Filtered:=true;
        if not _cdsItensPedido.IsEmpty then
           _btnVinculaMercadoria.Enabled:=true;

     end;


end;

procedure T_FrmCriticaPedidoOperacao._dbgCapaPedidoRejeicaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with _dbgCapaPedidoRejeicao do
  begin
    If odd(_dsPedidoClienteRede.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
 end;
  if( _cdsPedidoClienteRedeDS_MOTIVO_REJEICAO.AsString='') then
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clAqua;
 end;




 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clYellow;
    Canvas.Font.Color:= clblue;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_FrmCriticaPedidoOperacao._dbgItensCriticasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with _dbgItensCriticas do
  begin
    If odd(_dsItensPedido.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
 end;
  if( _cdsItensPedidoDS_MOTIVO_REJEICAO.AsString='EAN NAO VINCULADO A OPERACAO') then
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clYellow;
 end;




 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clYellow;
    Canvas.Font.Color:= clblue;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_FrmCriticaPedidoOperacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=caFree;
end;


procedure T_FrmCriticaPedidoOperacao.FormShow(Sender: TObject);
begin
 CarregaOperacaoRede;
end;

procedure T_FrmCriticaPedidoOperacao.BitBtn1Click(Sender: TObject);
var
sttemp: string;
begin

_cdsItensPedido.First;
while not _cdsItensPedido.Eof do
begin
  sttemp:=copy(formatfloat('00000000',_cdsItensPedidoCD_PRODUTO.AsInteger),1,7);
  if _cdsItensPedidoCD_PRODUTO.AsInteger>0 then
       VinculaProdutoOperacao(StrToInt64Def(sttemp,0),
                              _cdsItensPedidoCD_EMPRESA.AsInteger,
                              _cdsItensPedidoNR_OPERACAO_REDE.AsInteger,//    PnrOperacaoRede:Integer;
                              'N',//                             PidExclusivoOperacaoRede,
                              'A',//                            PidSituacao:String;
                              dtSistema,//                      PdtAtualizacao:Tdate;
                              nmLogin);//  PnmUsuario:String):boolean

  _cdsItensPedido.Next;
end;

end;

procedure T_FrmCriticaPedidoOperacao._btnReprocessaClick(Sender: TObject);
var
 idreprocessa:Boolean;
begin

  idreprocessa:=ValidaProdutoVinculado;

  if idreprocessa then
  begin
     if AtualizaStatusOPeracao(_cdsPedidoClienteRedeNR_EMPRESA.AsInteger,
                            _cdsPedidoClienteRedeCD_OPERACAO_REDE.AsInteger,
                            _cdsPedidoClienteRedeNM_ARQUIVO.AsString) then
                            Mensagem('Pedido sera reprocessado !!!',MB_ICONWARNING);
  end
  else
    if Confirma('Existe produto no pedido N?o vinculado a OPera??o de Rede'+#13+
                'Reprocessar Pedido Mesmo Assim ?',MB_DEFBUTTON2)=IDYES then
       if AtualizaStatusOPeracao(_cdsPedidoClienteRedeNR_EMPRESA.AsInteger,
                                 _cdsPedidoClienteRedeCD_OPERACAO_REDE.AsInteger,
                                 _cdsPedidoClienteRedeNM_ARQUIVO.AsString) then
                                Mensagem('Pedido sera reprocessado !!!',MB_ICONWARNING);
   _btnConsultaCritica.Click;
end;

procedure T_FrmCriticaPedidoOperacao.CarregaCriticaPedido(PnrPedido:String;
                                                          PnrSequencia:Integer;
                                                          PcdEAN,
                                                          PdsMotivo:String;
                                                          PcdProduto:Integer;
                                                          PdsNomeProduto:String;
                                                          PcdEmpresa,
                                                          PnrOperacaoRede:Integer;
                                                          PdsApresentacaoMax:String);
begin
    _cdsItensPedido.Open;
    _cdsItensPedido.Append;
    _cdsItensPedidoNR_SEQUENCIAL.AsInteger      :=PnrSequencia;
    _cdsItensPedidoCD_EAN.AsString              :=PcdEAN;
    _cdsItensPedidoDS_MOTIVO_REJEICAO.AsString  :=PdsMotivo;
    _cdsItensPedidoNR_PEDIDO.AsLargeInt         :=StrToInt64Def(PnrPedido,0);
    _cdsItensPedidoCD_PRODUTO.AsInteger         :=PcdProduto;
    _cdsItensPedidoNM_PRODUTO.AsString          :=PdsNomeProduto;
    _cdsItensPedidoCD_EMPRESA.AsInteger         :=PcdEmpresa;
    _cdsItensPedidoNR_OPERACAO_REDE.AsInteger   :=PnrOperacaoRede;
    _cdsItensPedidoNM_APRESENTACAO_MAX.AsString :=PdsApresentacaoMax;




    _cdsItensPedido.Post;
    _cdsItensPedido.Open;


end;

procedure T_FrmCriticaPedidoOperacao.CarregaOperacaoRede;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('SELECT CD_EMPRESA,NM_EMPRESA,CD_EMPRESA_FISICA');
    tempQuery.SQL.Add('FROM');
    tempQuery.SQL.Add('ACESSO.DC_EMPRESA');
    tempQuery.SQL.Add('WHERE');
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''N''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''S''');
    tempQuery.Open;
    tempQuery.First;

    _cbxOperacaoRede.Clear;
    while not tempQuery.eof do
    begin
       _cbxOperacaoRede.Items.Add(FormatFloat('00',tempQuery.FieldByName('cd_empresa').AsInteger)+' - '+
                                  FormatFloat('00',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOperacaoRede.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;


function T_FrmCriticaPedidoOperacao.ValidaProdutoVinculado:Boolean;
begin

   _cdsItensPedido.Open;
   _cdsItensPedido.First;
   Result:=true;

   while not _cdsItensPedido.Eof do
   begin
    if _cdsItensPedidoCD_PRODUTO.AsInteger>0 then
    begin
     if not  VerificaProdutoVinculado(strtoint(copy(FormatFloat('00000000',_cdsItensPedidoCD_PRODUTO.AsInteger),1,7)),
                               _cdsPedidoClienteRedeNR_EMPRESA.AsInteger,
                              _cdsPedidoClienteRedeCD_OPERACAO_REDE.AsInteger) then
     begin
      Mensagem('Produto n?o Vinculado A Opera??o Rede'+#13+
                _cdsItensPedidoCD_PRODUTO.AsString+' - '+ _cdsItensPedidoNM_PRODUTO.AsString,MB_ICONWARNING);
      Result:=false;

     end;
    end;


     _cdsItensPedido.Next;
   end;

end;



function T_FrmCriticaPedidoOperacao.VinculaProdutoOperacao(PnrProduto,
                                                           PnrEmpresa,
                                                           PnrOperacaoRede:Integer;
                                                           PidExclusivoOperacaoRede,
                                                           PidSituacao:String;
                                                           PdtAtualizacao:Tdate;
                                                           PnmUsuario:String):boolean;
var
  tempQuery : TSQLQuery;

begin
  tempQuery := nil;
  try

    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;

    tempQuery.SQL.Add('INSERT INTO');
    tempQuery.SQL.Add('PRDDM.DC_OPERACAO_REDE_MERCADORIA');
    tempQuery.SQL.Add('(CD_EMPRESA, CD_OPERACAO_REDE,CD_MERCADORIA ,');
    tempQuery.SQL.Add('ID_EXCLUSIVO_OPERACAO_REDE,ID_SITUACAO,');
    tempQuery.SQL.Add('DT_ATUALIZACAO,NM_USUARIO)');
    tempQuery.SQL.Add('VALUES(:PCD_EMPRESA, :PCD_OPERACAO_REDE,:PCD_MERCADORIA,');
    tempQuery.SQL.Add(':PID_EXCLUSIVO_OPERACAO_REDE,:PID_SITUACAO,');
    tempQuery.SQL.Add('sysdate,:PNM_USUARIO)');

    tempQuery.ParamByName('PCD_EMPRESA').AsBCD:=PnrEmpresa;
    tempQuery.ParamByName('PCD_OPERACAO_REDE').AsBCD:=PnrOperacaoRede;
    tempQuery.ParamByName('PCD_MERCADORIA').AsBCD:=PnrProduto;
    tempQuery.ParamByName('PID_EXCLUSIVO_OPERACAO_REDE').AsString:=PidExclusivoOperacaoRede;
    tempQuery.ParamByName('PID_SITUACAO').AsString:=PidSituacao;
 //   tempQuery.ParamByName('PDT_ATUALIZACAO').AsDate:=PdtAtualizacao;
    tempQuery.ParamByName('PNM_USUARIO').AsString:=PnmUsuario;
    Result:=true;
    if tempQuery.ExecSQL(false)<=0 then
       result := false;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;

end;



end.




