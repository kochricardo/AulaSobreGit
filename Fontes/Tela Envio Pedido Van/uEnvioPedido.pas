unit uEnvioPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, uRotinasGenericas, uDm,
  DB, DBClient, Buttons, uAuxiliarCompras,  StrUtils, IdBaseComponent,sqlExpr,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, UploadArquivo, uTransferenciaDeArquivo,ShellApi, uSistemaCompras;

type
  T_frmEnvioPedido = class(TForm)
    Label7: TLabel;
    StatusBar1: TStatusBar;
    _cbxMensagemPedido: TComboBox;
    Label8: TLabel;
    _cbTipoCondicaoPedido: TComboBox;
    Label1: TLabel;
    _cbxCondicaoPagamento: TComboBox;
    _cbxDataReferencia: TComboBox;
    _cbxReferenciaTempo: TComboBox;
    _cbxTipoPeriodo: TComboBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    _grbCondicaoPagamen: TGroupBox;
    _dbgCondicaoPagamento: TDBGrid;
    _grbFiltroPedido: TGroupBox;
    _dtpDataInicial: TDateTimePicker;
    _dtpDataFinal: TDateTimePicker;
    _lbeDataInicial: TLabel;
    Label4: TLabel;
    _edtComprador: TEdit;
    Comprador: TLabel;
    _rgLaboratorio: TRadioGroup;
    _edtNumeroLaboratorio: TEdit;
    GroupBox1: TGroupBox;
    _dbgPedido: TDBGrid;
    _cdsPedidos: TClientDataSet;
    _dsPedidos: TDataSource;
    _rgSituacaoPedido: TRadioGroup;
    _btnPesquisa: TBitBtn;
    _btnGeraArquivo: TBitBtn;
    _cdsCondicaoPagamentos: TClientDataSet;
    _cdsCondicaoPagamentosNR_PARCELAS: TAutoIncField;
    _cdsCondicaoPagamentosNR_DIAS: TIntegerField;
    _cdsCondicaoPagamentosPC_PARCELAS: TFloatField;
    _cdsCondicaoPagamentosVL_PARCELAS: TFloatField;
    _cdsCondicaoPagamentosDT_PAGAMENTOS: TDateField;
    _dsCondicaoPagamentos: TDataSource;
    GroupBox2: TGroupBox;
    _dbgItemPedido: TDBGrid;
    _cdsItemPedido: TClientDataSet;
    _dsItemPedido: TDataSource;
    Label9: TLabel;
    _cbxTipoUsoMercadoria: TComboBox;
    Label10: TLabel;
    _cbxTipoPedido: TComboBox;
    _IdFTP: TIdFTP;
    Label3: TLabel;
    _cbxOperacaoRede: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _edtNumeroLaboratorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _btnPesquisaClick(Sender: TObject);
    procedure _dbgPedidoTitleClick(Column: TColumn);
    procedure _dbgPedidoDblClick(Sender: TObject);
    procedure _dsPedidosDataChange(Sender: TObject; Field: TField);
    procedure _dbgItemPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnGeraArquivoClick(Sender: TObject);
    procedure _rgLaboratorioClick(Sender: TObject);
  private
    Arquivo:TextFile;
    nrsequencial,
    nrFornecedor :Integer;
    vtDesconto,
    vtDescontoComercial,
    vtPedidoLiquido,
    vtPedidoBruto,
    vtIPI   :Double;
    idPedidoPsicotropico:Boolean;
    idPedidoHospitalar :Boolean;


    procedure GetPedido(nrComprador,
                        nrLaboratorio: Integer;
                        idStatus: String;
                        dtInicio, dtFinal: tdate;PnrOperacaoRede:Integer);
    procedure SetGridCapaPedido;
    function setCondicaoPagamento(nrParcela, nrDias: Integer; pcParcela,
      vlParcela: Double; dtPagamento: TDATE): Boolean;
    function getCondicaoPagamento(nrcondicao: Integer): Boolean;
    procedure AJustaParcelas;
    procedure GetItemPedido(nrPedido:Integer);
    procedure SetGridItemPedido;
    function CabecalhoArquivoRegistro00(idTipoRegisto, idArquivo,
      idCaixaPostalRementente, idCaixaPostalDestinatario:String;
      dsfiller: char): wideString;
    function CabecalhoArquivoRegistro01(idTipoRegisto: String;
      nrPedido: Integer; dtEntrega, dtEntregaMaisTarde, dtEntregaMaisCedo,
      dtPedido, idTipoPedido, nrListaPreco, nrEanCliente, nrCNPJCliente,
      nrEAnLocalEntrega, dsRazaoSocialLocalEntrega, dsLogradouroLocalEntrega,
      dsBairroLocalEntrega, dsMunicipioLocalEntrega,
      dsUnidadeFederacaoLocalEntrega, dsCepLocalEntrega, nrCNPJLocalEntrega,
      nrInscricaoEstadualLocalEntrega, nrEanLocalFaturamento,
      nrCNPJLocalDestinoFaturamento, nrEanFornecedor, nrCNPJFornecedor,
      idTipoFrete: String; pcDescontoPedido, vlEncargosFrete: Double;
      idTipoUsoMercadoria, dsContrato, idTipoPedido29,
      nrCnpjDestinoMercadoria: String; dsfiller: Char): wideString;
    function CabecalhoArquivoRegistro02(idTipoRegisto: String;
      nrParcelas: Integer; idInicioContagemTempo, idReferenciaTempo: String;
      nrDiasPrazo: Integer; pcPagamentoFatura: Double;
      dsfiller: char): wideString;
    function CabecalhoArquivoRegistro03(idTipoRegisto: String; nrItem: Integer;
      cdbarraItem, idTipoCodigoBarra: String; nrQuantidadePedido: Integer;
      dsUnidadeMedida, idTipoPedido: String; vlPrecoBruto: Double;
      nrBasePreco: Integer; unMediaPreco: String; pcDesconto: Double;
      idTipoUsoMercadoria: String; dsfiller: char): wideString;
    procedure GeraArvquivoTivit;
    function TranfereArquivoFtp(dsLocalArquivo, dsDestinoArquivo, nmArquivo,
      dsTNSMAQUINA, nmUsuario, dsSenhaUsuatio: STRING): Boolean;
    procedure GeraArquivoIMS;
    function CriaTelaTransferenciaArquivo:Boolean;
    procedure GeraArquivoEntire;
    procedure GeraArvquivoGXS;
    procedure GeraArvquivoJANSSEN;
    procedure CABECALHONEOGRID;
    procedure PagamentosNeogrid;
    procedure ITENS;
    procedure SUMARIO;
    procedure ARQUIVO_NEOGRID;
    function CalculaValorDesconto(PvlFornecedor, PpcDesconto: Double): Double;
    procedure CarregaOperacaoRede;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmEnvioPedido: T_frmEnvioPedido;
  dsDestinoArquivo :String;
  stLinaRetorno    :WideString;
  nrCNPJGAMEntrega ,
  EANEntrega,
  nmRazaoSocialEntrega,
  dsLogradouroEntrega,
  dsBairroEntrega,
  dsMunicipioEntrega,
  dsUFGAMEntrega,
  dsCEPGAMEntrega,
  nrInscricaoEstadualEntrega :String;
  DadosCd,
  DadosCdPagamento  :TDadosCD;

  const
  nrCNPJGAMCob           ='82873068000140' ;
  EANGAMCob              ='7890530000013';
  nmRazaoSocialCob       ='GENESIO A. MENDES E CIA. LTDA';
  dsLogradouroCob        ='RUA LAURO MULLER, 1650';
  dsBairroCob            ='AEROPORTO';
  dsMunicipioCob         ='TUBARAO';
  dsUFGAMCob             ='SC';
  dsCEPGAMCob            ='88705100';
  nrInscricaoEstadualCob ='250064111';


implementation

uses uProduto;
var
 ThreadUpLoad:TUpload;

{$R *.dfm}


procedure T_frmEnvioPedido._dbgItemPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If odd(_dsItemPedido.DataSet.RecNo) then
 begin
  _dbgItemPedido.Canvas.Font.Color:= clBlack;
  _dbgItemPedido.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgItemPedido.Canvas.Font.Color:= clBlack;
  _dbgItemPedido.Canvas.Brush.Color:= clWhite;
 end;
 if(gdFocused in State) then
 begin
    _dbgItemPedido.Canvas.brush.Color:= clYellow;
    _dbgItemPedido.Canvas.Font.Color:= clblue;
 end;
  if _dsItemPedido.DataSet.FieldByName('SITY_Y').AsString<>'N' then
 begin
  _dbgItemPedido.Canvas.Font.Color:= clWhite;
  _dbgItemPedido.Canvas.Brush.Color:= clRed;
 end;


 _dbgItemPedido.Canvas.FillRect(Rect);
 _dbgItemPedido.DefaultDrawDataCell(Rect,_dbgItemPedido.columns[datacol].field, State);

end;

procedure T_frmEnvioPedido._dbgPedidoDblClick(Sender: TObject);
begin
  //PrazoPedido:=nrParcelaPedido(_cdsPedidos.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);

//   GerarExcelPedido(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,'S','S');

  getCondicaoPagamento(_cdsPedidos.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);
  GetItemPedido(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger);
  if not _cdsItemPedido.IsEmpty then
    _btnGeraArquivo.Enabled:=true;

end;

procedure T_frmEnvioPedido._dbgPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If odd(_dsPedidos.DataSet.RecNo) then
 begin
  _dbgPedido.Canvas.Font.Color:= clBlack;
  _dbgPedido.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgPedido.Canvas.Font.Color:= clBlack;
  _dbgPedido.Canvas.Brush.Color:= clWhite;
 end;


{ if _dsPedidos.DataSet.FieldByName('NR_ITEM').AsInteger=_dsPedidos.DataSet.FieldByName('NR_ITENS_BONIFICADO').AsInteger then
 begin
  _dbgPedido.Canvas.Font.Color:= clWhite;
  _dbgPedido.Canvas.Brush.Color:= clBlue;
 end;}

  if (Column.Field.FieldName = 'ID_CD') then
 begin
  if _cdsPedidos.FieldByName('ID_CD').AsString='SC' then
  begin
    _dbgPedido.Canvas.brush.Color:= clGreen;
    _dbgPedido.Canvas.Font.Color:= clwhite;
  end;
  if _cdsPedidos.FieldByName('ID_CD').AsString='RS' then
  begin
    _dbgPedido.Canvas.brush.Color := $000080FF;
    _dbgPedido.Canvas.Font.Color := clBlack;
  end;

end;


 if _dsPedidos.DataSet.FieldByName('DT_TRANSMITIDO').AsString<>'01/01/2039' then
 begin
  _dbgPedido.Canvas.Font.Color:= clWhite;
  _dbgPedido.Canvas.Brush.Color:= clRed;
 end;



 if(gdFocused in State) then
 begin
    _dbgPedido.Canvas.brush.Color:= clYellow;
    _dbgPedido.     Canvas.Font.Color:= clblue;
 end;

 _dbgPedido.Canvas.FillRect(Rect);
 _dbgPedido.DefaultDrawDataCell(Rect,_dbgPedido.columns[datacol].field, State);

end;

procedure T_frmEnvioPedido._dbgPedidoTitleClick(Column: TColumn);
begin
 GeraOrdenacao(_cdsPedidos,Column);
end;

procedure T_frmEnvioPedido._dsPedidosDataChange(Sender: TObject; Field: TField);
begin
 _cdsCondicaoPagamentos.Close;
 _cdsItemPedido.Close;
 _btnGeraArquivo.Enabled:=false;
end;

procedure T_frmEnvioPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=cafree;
end;

procedure T_frmEnvioPedido.FormShow(Sender: TObject);
begin
   CarregaOperacaoRede;
  _dtpDataInicial.Date:=dtSistema;
  _dtpDataFinal.Date  :=dtSistema;
  _edtComprador.Text  :=IntToStr(nrCompradorSistema);
end;

procedure T_frmEnvioPedido._btnGeraArquivoClick(Sender: TObject);
var
 nmArquivo,
 nmArquivoInterno,
 pathLocal,
 stLocalArquivo:string;
 stLinha :WideString;
 Arquivo:TextFile;
 nrArquivo,nrItem:Integer;
 idIndicaTipoPedido:String[03];
 dsCodigoBarra,dun14:String[14];
 vlItem:Double;
 nrQuantidadePedido:Integer;
 stParteEndereco :WideString;

begin
 TRY
  DeleteFile('C:\EDIW\PROCEDA.TXT');
  DeleteFile('C:\EDIW\PEDIDO\PROCEDA.TxT');
 EXCEPT
 END;
  pathLocal:=ExtractFilePath(Application.ExeName);
  dsDestinoArquivo:=_cdsPedidos.FieldByName('DS_DIRETORIO_PEDIDO').AsString;
  DadosCd                    := GetDadosCD(_cdsPedidos.FieldByName('CD_EMPRESA').AsInteger);
  DadosCdPagamento           := GetDadosCD(01) ;
  nrCNPJGAMEntrega           := DadosCd.nrCNPJ;
  EANEntrega                 := DadosCd.nrEANCD;
  nmRazaoSocialEntrega       :=   StringReplace(DadosCd.dsRazaoSocial,'&','E',[rfReplaceAll]);
  dsLogradouroEntrega        := DadosCd.stENDERECO+','+DadosCd.nrLogradouro;
  dsBairroEntrega            := DadosCd.stBAIRRO;
  dsMunicipioEntrega         := DadosCd.stCIDADE;
  dsUFGAMEntrega             := DadosCd.stEstado;
  dsCEPGAMEntrega            := DadosCd.stCEP;
  nrInscricaoEstadualEntrega :=DadosCd.nrInscricaoEstadual;




  _btnGeraArquivo.Enabled:=false;
  if trim(dsDestinoArquivo)='' then
  begin
    Mensagem('Destino do Arquivo n?o est? configurado No Sistema '+#13+
             ' Arquivo de Pedido n?o ser? gerado'+#13+
             ' Opera??o cancelada !!! '  ,16  );
     exit;
  end;


  idPedidoPsicotropico:=GetPedidoPsicotropico(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger);


  idPedidoHospitalar:=  false;

  GravaEventoLogPedidoCompra(0,
                         _cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                         _cdsPedidos.FieldByName('DT_PEDIDO').AsDateTime,
                         0,
                         0,
                         2,
                         'Pedido Transmitido... pelo usuario - '+nmLogin,
                         dtSistema,
                         nmLogin,
                         DadosCd.nrCD);




  if _cdsPedidos.FieldByName('ID_VAN').AsString='E' then
  begin
  try
     if confirma('Aten??o'+#13+
                'A Confirma??o deste Processo Transmitir? um Pedido'+#13+
                'automaticamete para o Laboratorio'+#13+
               formatfloat('####0',_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger)+'  -  '+
               _cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR').AsString+#13+
              'Transmitir o Pedido ?',MB_DEFBUTTON2)=idyes then
     GeraArquivoEntire;
       AtualizaDataTransmissao(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                          _cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger,DadosCd.nrCD);

    exit;
  except
     Mensagem('Ocorreu um erro no processo de envio de arquivo',MB_ICONERROR);
  end;
  end;


  if (_cdsPedidos.FieldByName('ID_VAN').AsString='P') or
     (_cdsPedidos.FieldByName('ID_VAN').AsString='G') then
  begin
   try

  idPedidoHospitalar:=  false;
 if (_cdsPedidos.FieldByName('CD_CANAL').AsInteger=3) and (_cdsPedidos.FieldByName('ID_VAN').AsString='G') then
     idPedidoHospitalar:=  true;


     GeraArquivoIMS;

    exit;
   except
     Mensagem('Ocorreu um erro no processo de envio de arquivo',MB_ICONERROR);
   end;
  end;
  if _cdsPedidos.FieldByName('ID_VAN').AsString='I' then
  begin
    ////Mensagem('Arquivo GXS');'''
    ///
    ///
    stParteEndereco:='https://tradinggrid.gxs.com/TigerLogin/public/login/';
    stParteEndereco:=stParteEndereco+'login.do?TYPE=33554433&REALMOID=06-000ac6a6-da9c-1243-8fa3-8309126f304d&GUID=';
    stParteEndereco:=stParteEndereco+'&SMAUTHREASON=0&METHOD=';
    stParteEndereco:=stParteEndereco+'GET&SMAGENTNAME=-SM-NEgiplXemyQr3FSfTDPe7aaeYuPYthXO4Hp2SG9kOGlTR%2ffahTBddYFNlUWN1ziU&TARGET=';
    stParteEndereco:=stParteEndereco+'-SM-HTTPS%3a%2f%2ftradinggrid%2egxs%2ecom%2fTigerPortal%2fTigerMainPage%2edo%3fclient%3dnull';
    GeraArvquivoGXS;
    ShellExecute(Handle, 'open',PChar(stParteEndereco) , PChar('C:\EDIW\' ),'', 1);
     AtualizaDataTransmissao(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                            _cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger,DadosCd.nrCD);

    _btnGeraArquivo.Enabled:=true;
  end;
  if _cdsPedidos.FieldByName('ID_VAN').AsString='N' then
  begin
   ARQUIVO_NEOGRID;



  end;

  if   (_cdsPedidos.FieldByName('ID_VAN').AsString='T') then
  begin
   try
    GeraArvquivoTivit;
   //  ShellExecute(Handle, 'open', 'https://www.fastedi.com.br/NEWEDI_main/tivit/home', PChar('C:\EDIW\' ),'', 1);
     ShellExecute(Handle, 'open', 'https://www.fastedimanager.tivit.com/#/manager', PChar('C:\EDIW\' ),'', 1);


     AtualizaDataTransmissao(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                            _cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger,DadosCd.nrCD);

    exit;
   except
     Mensagem('Ocorreu um erro no processo de envio de arquivo',MB_ICONERROR);
   end;
  end;
  if  (_cdsPedidos.FieldByName('ID_VAN').AsString='J') then
  begin
   try
    GeraArvquivoJANSSEN;
    ShellExecute(Handle, 'open', 'https://www.ejanssen.com.br/brasil/login.aspx?ReturnUrl=%2fbrasil%2fdefault.aspx', PChar('C:\EDIW\' ),'', 1);
    AtualizaDataTransmissao(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                            _cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger,DadosCd.nrCD);

    exit;
   except
     Mensagem('Ocorreu um erro no processo de envio de arquivo',MB_ICONERROR);
   end;
  end;

  _btnPesquisa.Click;
end;

procedure T_frmEnvioPedido._btnPesquisaClick(Sender: TObject);
var
  nrFornecedor:Integer;
  idStatus :String;
  nrCompradorLocal,
  nrOperacaoRede :Integer;
begin
  CorrigeSituacaoCrossdocking;

 nrBase:=1;
  nrOperacaoRede   := StrToIntDef(copy(_cbxOperacaoRede.Text,1,3),0);

   _cdsPedidos.Filtered:=false;
  _cdsPedidos.close;
  nrCompradorLocal:=StrToIntDef(_edtComprador.Text,0);
  if _rgSituacaoPedido.ItemIndex=0 then
     idStatus:='N';
  if _rgSituacaoPedido.ItemIndex=1 then
     idStatus:='F';
  if _rgSituacaoPedido.ItemIndex=2 then
     idStatus:='T';
  nrFornecedor:=0;
  if _rgLaboratorio.ItemIndex=0 then
     nrFornecedor:=StrToIntDef(_edtNumeroLaboratorio.Text,0);

   GetPedido(nrCompradorLocal,nrFornecedor,idStatus,_dtpDataInicial.Date,_dtpDataFinal.Date,nrOperacaoRede);
end;

procedure T_frmEnvioPedido._edtNumeroLaboratorioClick(Sender: TObject);
begin
 _edtNumeroLaboratorio.Visible:=false;
 if _rgLaboratorio.ItemIndex=0 then
 begin
    _edtNumeroLaboratorio.Visible:=true;
    _edtNumeroLaboratorio.SetFocus;
 end;
end;


procedure T_frmEnvioPedido._rgLaboratorioClick(Sender: TObject);
begin
  _edtNumeroLaboratorio.Visible:=false;
  if _rgLaboratorio.ItemIndex=0 then
  begin
      _edtNumeroLaboratorio.Visible:=true;
      _edtNumeroLaboratorio.SetFocus;
  end;

end;

procedure T_frmEnvioPedido.GetItemPedido(nrPedido:Integer);
Var
  stQuery :TStringList;
begin
    stQuery:=TStringList.Create;
    with stQuery do
    begin
     Add('SELECT');
     Add('NROP_Y, CD_MERCADORIA*10+NR_DV_MERCADORIA as CD_PRODUTO,');
     Add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
	   Add('CD_EAN_COMPRA,QT_EMBALAGEM_COMPRA,NROM_Y,');
	   Add('QUAY_Y,  CHEY_Y,  ABTY_Y,  SITY_Y,PRZY_Y,');
	   Add('PUNY_Y, PFBY_Y, DADY_Y, DFIY_Y, VCCI_Y,');
     Add('NRVV_Y, VL_MARGEM_PADRAO, VL_MARGEM_NEGOCIADA,');
     Add('ID_MARGEM,ID_DESCONTO_ACUMULATIVO, PC_VERBA, VL_VERBA,');
     Add('QT_BONIFICADA, PC_BONIFICACAO ,PC_DESCONTO_OL,');
	   Add('NR_OPERADOR_LOGISTICO,');
     add('NM_MERCADORIA||''  ''||DS_APRESENTACAO_MERCADORIA as NM_COMPLETO,');
     add('PC_ICMS_COMPRA');

     Add('FROM');
     Add('PRDDM.DCPCI,');
     Add('PRDDM.DC_MERCADORIA');
     Add('WHERE');
     Add('NROP_Y = :PnrPedido');
     Add('AND NROM_Y=CD_MERCADORIA');
     Add('AND SITY_Y IN(''F'',''P'',''N'',''C'')');
    end;
    with _cdsItemPedido do
    begin
      close;
      CommandText:=stQuery.Text;
      Params.ParamByName('PnrPedido').AsInteger:=nrPedido;
      open;
    end;
    if NOT _cdsItemPedido.IsEmpty then
       SetGridItemPedido;
end;




procedure T_frmEnvioPedido.GetPedido(nrComprador,
                                     nrLaboratorio:Integer;
                                     idStatus:String;
                                     dtInicio,dtFinal:tdate;
                                     PnrOperacaoRede:Integer);
Var
  stQuery :TStringList;
begin
    stQuery:=TStringList.Create;
    with stQuery do
    begin
      ADD('SELECT');
      ADD('DISTINCT NR_PEDIDO,');
      add('ID_UNIDADE_FEDERACAO as  ID_CD,');
      add('Case');
      add('when PEDIDO.CD_EMPRESA=CD_EMPRESA_DESTINO THEN ''NORMAL''');
      add('when PEDIDO.CD_EMPRESA<>CD_EMPRESA_DESTINO THEN ''O.C.D''');
      add('END ID_OCD,');
      add('Case');
      add('when NR_ITEM=NR_ITENS_BONIFICADO THEN ''BONIF.''');
      add('when NR_ITEM<>NR_ITENS_BONIFICADO THEN ''NORMAL''');
      ADD('END ID_TIPO,');
      ADD('STATUS,');
      ADD('DS_VAN,');
      ADD('DT_PEDIDO,');
      ADD('DT_PREVISTA,');
      ADD('NR_FORNECEDOR,');
      ADD('DS_GRUPO_FORNECEDOR,');
      ADD('NR_ITEM,');
      ADD('NR_UNIDADES,');
      ADD('VL_FABRICA,');
      ADD('VL_FINACEIRO,');
      ADD('NR_CONDICAO_PAGTO_P,');
      ADD('ID_VAN,');
      ADD('ABTP_P,');
      ADD('CD_OPERADOR_LOGISTICO,');
      ADD('DT_TRANSMITIDO,');
      ADD('ID_CAIXA_FECHADA,');
      ADD('ID_CODIGO_BARRAS,');
      ADD('DS_DIRETORIO_PEDIDO,');
      ADD('DS_ENVIO_ARQUIVO,');
      ADD('NR_CNPJ_FORNECEDOR,');
      ADD('PEDIDO.CD_EMPRESA,');
      ADD('DS_IDENTIFICACAO_VAN,');
      ADD('DS_IDENTIFICACAO_FORNECEDOR,DT_DIGITACAO,NR_ITENS_BONIFICADO,DS_FORNECEDOR_PSICOTROPICO,CD_CANAL');
      ADD(',(SELECT ID_UNIDADE_FEDERACAO FROM ACESSO.DC_EMPRESA E WHERE E.CD_EMPRESA=PEDIDO.CD_EMPRESA ) AS UF_PEDIDO');

      ADD('FROM');
      ADD('(SELECT');
      ADD('NROP_P NR_PEDIDO,');
      ADD('LABP_P AS NR_FORNECEDOR,');
      ADD('SITP_P STATUS,');
      ADD('DT_PREVISTA_FATURAMENTO DT_PEDIDO,');
      ADD('PREP_P DT_PREVISTA,');
      ADD('SUM(QUAY_Y) NR_UNIDADES,');
      ADD('COUNT(*) NR_ITEM,');
      ADD('CASE');
      ADD('WHEN Sum(VCCI_Y)=0 THEN COUNT(*)');
      ADD('WHEN Sum(VCCI_Y)<>0 THEN 0');
      ADD('END NR_ITENS_BONIFICADO,');

      ADD('SUM(QUAY_Y*PFBY_Y) VL_FABRICA,');
      ADD('SUM(QUAY_Y*PUNY_Y) VL_FINACEIRO,');
      ADD('NR_CONDICAO_PAGTO_P,');
      ADD('ID_VAN,ID_UNIDADE_FEDERACAO,');
      ADD('CASE');
      ADD('WHEN ID_VAN=''E'' THEN ''INTIRE''');
      ADD('WHEN ID_VAN=''G'' THEN ''IMS''');
      ADD('WHEN ID_VAN=''T'' THEN ''TIVIT''');
      ADD('WHEN ID_VAN=''N'' THEN ''NEOGRID''');
      ADD('WHEN ID_VAN=''I'' THEN ''GXS''');
      ADD('WHEN ID_VAN=''P'' THEN ''InterPlayes''');
      ADD('WHEN ID_VAN=''J'' THEN ''JANSSEN''');
      ADD('END DS_VAN,');
      ADD('ABTP_P,CD_OPERADOR_LOGISTICO,');
      ADD('DT_TRANSMITIDO,');
      ADD('ID_CAIXA_FECHADA,');
      ADD('ID_CODIGO_BARRAS,');
      ADD('DS_DIRETORIO_PEDIDO,');
      ADD('DS_ENVIO_ARQUIVO,');
      ADD('NR_CNPJ_FORNECEDOR,');
      ADD('CAPA.CD_EMPRESA,');
      ADD('DS_IDENTIFICACAO_VAN,');
      ADD('DS_IDENTIFICACAO_FORNECEDOR,DT_DIGITACAO,DS_FORNECEDOR_PSICOTROPICO');
      ADD(',CD_EMPRESA_DESTINO,CD_CANAL');
      ADD('FROM');
      ADD('PRDDM.DCPCC CAPA,');
      ADD('PRDDM.DCPCI,');
      ADD('PRDDM.DC_VAN,');
      ADD('ACESSO.DC_EMPRESA EMP');
      ADD(',PRDDM.DC_COMPRADOR_GAM CPR_GAM');

      ADD('WHERE');
      ADD('NROP_P = NROP_Y');
      ADD('AND  EMP.CD_EMPRESA=CD_EMPRESA_DESTINO');
      ADD('AND  CPR_GAM.NR_COMPRADOR=CAPA.CD_COMPRADOR');
      if idStatus<>'T' then
         ADD('AND SITP_P =:PidStatus');
      ADD('AND SITY_Y IN(''N'',''P'',''F'',''C'')');
      if PnrOperacaoRede>0 then
       ADD('AND CAPA.CD_OPERACAO_REDE =:PnrOperacao');

      ADD('AND NR_LABORATORIO=LABP_P ');

      ADD('GROUP BY NROP_P,SITP_P,DT_PREVISTA_FATURAMENTO,PREP_P,');
      ADD('NR_CONDICAO_PAGTO_P,ID_VAN,ABTP_P,LABP_P,DS_FORNECEDOR_PSICOTROPICO,');
      ADD('CD_OPERADOR_LOGISTICO ,DT_TRANSMITIDO,ID_UNIDADE_FEDERACAO,');
      ADD('ID_CAIXA_FECHADA,ID_CODIGO_BARRAS,DS_DIRETORIO_PEDIDO,');
      add('DS_ENVIO_ARQUIVO,NR_CNPJ_FORNECEDOR,DS_IDENTIFICACAO_VAN,');
      add('DS_IDENTIFICACAO_FORNECEDOR,CAPA.CD_EMPRESA,DT_DIGITACAO,CD_EMPRESA_DESTINO,CD_CANAL) PEDIDO,');
      ADD('PRDDM.DC_FABRICANTE F,');
      ADD('PRDDM.DC_GRUPO_FORNECEDOR GF,');
      ADD('PRDDM.DC_COMPRA_MERCADORIA CM');
      ADD('WHERE');
      ADD('F.CD_FABRICANTE=GF.CD_FABRICANTE');
      ADD('AND GF.CD_GRUPO_FORNECEDOR=CM.CD_GRUPO_FORNECEDOR');
      ADD('AND NR_FORNECEDOR=GF.CD_GRUPO_FORNECEDOR');
      ADD('AND GF.CD_GRUPO_FORNECEDOR=NR_FORNECEDOR');
      ADD('AND CM.CD_GRUPO_FORNECEDOR=NR_FORNECEDOR');
      ADD('AND CM.ID_SITUACAO_MERCADORIA=''A''');
      ADD('AND CM.CD_COMPRADOR=:PnrComprador');
      if nrLaboratorio>0 then
      ADD('AND NR_FORNECEDOR=:PnrFornecedor');

      ADD('AND TRUNC(DT_PEDIDO) BETWEEN  :PdtInicio  AND  :PdtFinal');
      ADD('ORDER BY DT_PEDIDO,NR_FORNECEDOR');
      stQuery.SaveToFile('C:\TEMP\Compras_qryArqEnvioPedido.sql');
    end;
    with _cdsPedidos do
    begin
      close;
      CommandText:=stQuery.Text;
      Params.ParamByName('PdtInicio').AsString:=FormatDateTime('DD/MM/YYYY',dtInicio);
      Params.ParamByName('PdtFinal').AsString:=FormatDateTime('DD/MM/YYYY',dtFinal);
      if idStatus<>'T' then
         Params.ParamByName('PidStatus').AsString:=idStatus;
      Params.ParamByName('PnrComprador').AsInteger:=nrComprador;
      if nrLaboratorio>0 then
         Params.ParamByName('PnrFornecedor').AsInteger:=nrLaboratorio;
      if PnrOperacaoRede>0 then
         Params.ParamByName('PnrOperacao').AsInteger:=PnrOperacaoRede;
      open;
      SetGridCapaPedido;
    end;
end;

procedure T_frmEnvioPedido.SetGridCapaPedido;
begin

  TIntegerField(_cdsPedidos.FieldByName('NR_PEDIDO')).DisplayLabel:='Pedido';
  TIntegerField(_cdsPedidos.FieldByName('NR_PEDIDO')).DisplayWidth:=7;

  TStringField(_cdsPedidos.FieldByName('STATUS')).DisplayLabel:='Status';
  TStringField(_cdsPedidos.FieldByName('STATUS')).DisplayWidth:=6;

  TStringField(_cdsPedidos.FieldByName('ID_OCD')).DisplayLabel:='O.C.D';
  TStringField(_cdsPedidos.FieldByName('ID_OCD')).DisplayWidth:=6;


  TDateField(_cdsPedidos.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
  TDateField(_cdsPedidos.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsPedidos.FieldByName('DT_PEDIDO')).DisplayWidth:=10;


  TIntegerField(_cdsPedidos.FieldByName('NR_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
  TIntegerField(_cdsPedidos.FieldByName('NR_FORNECEDOR')).DisplayWidth:=7;


  TStringField(_cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Fornecedor';
  TStringField(_cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=6;


  TDateField(_cdsPedidos.FieldByName('DT_PREVISTA')).DisplayLabel:='Dt.Prevista';
  TDateField(_cdsPedidos.FieldByName('DT_PREVISTA')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsPedidos.FieldByName('DT_PREVISTA')).DisplayWidth:=10;

  TIntegerField(_cdsPedidos.FieldByName('NR_UNIDADES')).DisplayLabel:='Total Unid.';
  TIntegerField(_cdsPedidos.FieldByName('NR_UNIDADES')).DisplayWidth:=08;

  TIntegerField(_cdsPedidos.FieldByName('NR_ITEM')).DisplayLabel:='Nr.Itens';
  TIntegerField(_cdsPedidos.FieldByName('NR_ITEM')).DisplayWidth:=06;

  TFloatField(_cdsPedidos.FieldByName('VL_FABRICA')).DisplayLabel:='Vlr.Total Fabr.';
  TFloatField(_cdsPedidos.FieldByName('VL_FABRICA')).DisplayWidth:=12;
  TFloatField(_cdsPedidos.FieldByName('VL_FABRICA')).DisplayFormat:='###,###,##0.00';

  TFloatField(_cdsPedidos.FieldByName('VL_FINACEIRO')).DisplayLabel:='Vlr.Total Bruto';
  TFloatField(_cdsPedidos.FieldByName('VL_FINACEIRO')).DisplayWidth:=12;
  TFloatField(_cdsPedidos.FieldByName('VL_FINACEIRO')).DisplayFormat:='###,###,##0.00';

  TIntegerField(_cdsPedidos.FieldByName('NR_CONDICAO_PAGTO_P')).DisplayLabel:='Cod. Pag.';
  TIntegerField(_cdsPedidos.FieldByName('NR_CONDICAO_PAGTO_P')).DisplayWidth:=08;

  TStringField(_cdsPedidos.FieldByName('ID_VAN')).DisplayLabel:='Id. Van';
  TStringField(_cdsPedidos.FieldByName('ID_VAN')).DisplayWidth:=6;

  TStringField(_cdsPedidos.FieldByName('DS_VAN')).DisplayLabel:='Van';
  TStringField(_cdsPedidos.FieldByName('DS_VAN')).DisplayWidth:=07;

  TFloatField(_cdsPedidos.FieldByName('ABTP_P')).DisplayLabel:='% Desc.Padr?o';
  TFloatField(_cdsPedidos.FieldByName('ABTP_P')).DisplayWidth:=13;
  TFloatField(_cdsPedidos.FieldByName('ABTP_P')).DisplayFormat:='##0.00';

  TIntegerField(_cdsPedidos.FieldByName('CD_OPERADOR_LOGISTICO')).DisplayLabel:='Op. Logist.';
  TIntegerField(_cdsPedidos.FieldByName('CD_OPERADOR_LOGISTICO')).DisplayWidth:=05;

  TDateField(_cdsPedidos.FieldByName('DT_TRANSMITIDO')).DisplayLabel:='Dt.Transm.';
  TDateField(_cdsPedidos.FieldByName('DT_TRANSMITIDO')).DisplayFormat:='dd/mm/yyyy';
  TDateField(_cdsPedidos.FieldByName('DT_TRANSMITIDO')).DisplayWidth:=10;

  TStringField(_cdsPedidos.FieldByName('ID_CODIGO_BARRAS')).DisplayLabel:='Tipo Cod.Barra';
  TStringField(_cdsPedidos.FieldByName('ID_CODIGO_BARRAS')).DisplayWidth:=10;

  TStringField(_cdsPedidos.FieldByName('DS_DIRETORIO_PEDIDO')).DisplayLabel:='Local Arquivo';
  TStringField(_cdsPedidos.FieldByName('DS_DIRETORIO_PEDIDO')).DisplayWidth:=60;

  TStringField(_cdsPedidos.FieldByName('DS_ENVIO_ARQUIVO')).DisplayLabel:='Local Arquivo';
  TStringField(_cdsPedidos.FieldByName('DS_ENVIO_ARQUIVO')).DisplayWidth:=60;
  TStringField(_cdsPedidos.FieldByName('DS_ENVIO_ARQUIVO')).Visible:=false;

  TStringField(_cdsPedidos.FieldByName('ID_TIPO')).DisplayLabel:='Pedido';
  TStringField(_cdsPedidos.FieldByName('ID_TIPO')).DisplayWidth:=07;
  TStringField(_cdsPedidos.FieldByName('ID_TIPO')).Visible:=true;

  TStringField(_cdsPedidos.FieldByName('ID_CD')).DisplayLabel:='Local.CD';
  TStringField(_cdsPedidos.FieldByName('ID_CD')).DisplayWidth:=05;


end;

procedure T_frmEnvioPedido.SetGridItemPedido;
begin
  TIntegerField(_cdsItemPedido.FieldByName('NROP_Y')).Visible:=False;
  TIntegerField(_cdsItemPedido.FieldByName('NROM_Y')).Visible:=False;

  TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Prod';
  TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayWidth:=08;

  TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
  TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

  TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o Produto';
  TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=30;

  TStringField(_cdsItemPedido.FieldByName('CD_EAN_COMPRA')).DisplayLabel:='Cod.EAN Compra';
  TStringField(_cdsItemPedido.FieldByName('CD_EAN_COMPRA')).DisplayWidth:=14;

  TIntegerField(_cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayLabel:='Emb.Cpra';
  TIntegerField(_cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA')).DisplayWidth:=08;

  TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayLabel:='Qtd.Ped.';
  TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayWidth:=08;

  TIntegerField(_cdsItemPedido.FieldByName('CHEY_Y')).DisplayLabel:='Qtd.Fat.';
  TIntegerField(_cdsItemPedido.FieldByName('CHEY_Y')).DisplayWidth:=08;

  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayLabel:='% Desc.';
  TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayWidth:=06;

  TStringField(_cdsItemPedido.FieldByName('SITY_Y')).DisplayLabel:='Status';
  TStringField(_cdsItemPedido.FieldByName('SITY_Y')).DisplayWidth:=6;

  TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayLabel:='cod.Prazo';
  TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayWidth:=08;

  TFloatField(_cdsitemPedido.FieldByName('PUNY_Y')).DisplayLabel :='Pre?o Unit.';
  TFloatField(_cdsitemPedido.FieldByName('PUNY_Y')).DisplayFormat :='###,###,##0.00';

  TFloatField(_cdsitemPedido.FieldByName('PFBY_Y')).DisplayLabel := 'Pre?o Fornec.';
  TFloatField(_cdsitemPedido.FieldByName('PFBY_Y')).DisplayFormat := '##,###,##0.00';
  TFloatField(_cdsitemPedido.FieldByName('PFBY_Y')).DisplayWidth := 12;

  TFloatField(_cdsitemPedido.FieldByName('DADY_Y')).DisplayLabel :='Desc. Adic.';
  TFloatField(_cdsitemPedido.FieldByName('DADY_Y')).DisplayFormat :='##,###,##0.00';
  TFloatField(_cdsitemPedido.FieldByName('DADY_Y')).DisplayWidth := 12;

  TFloatField(_cdsitemPedido.FieldByName('VCCI_Y')).DisplayFormat :='##,###,##0.00';
  TFloatField(_cdsitemPedido.FieldByName('VCCI_Y')).DisplayLabel :='Pre?o Custo';
  TFloatField(_cdsitemPedido.FieldByName('VCCI_Y')).DisplayWidth := 12;

  TIntegerField(_cdsitemPedido.FieldByName('NRVV_Y')).DisplayFormat :='#######0';
  TIntegerField(_cdsitemPedido.FieldByName('NRVV_Y')).DisplayLabel :='Nr.Verba';
  TIntegerField(_cdsitemPedido.FieldByName('NRVV_Y')).DisplayWidth := 06;

  TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayLabel := 'Vlr. Marg. Padr?o';
  TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayFormat:= '##,###,##0.00';
  TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_PADRAO')).DisplayWidth := 12;

  TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayFormat := '##,###,##0.00';
  TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayLabel := 'Vlr. Marg. Negociada';
  TFloatField(_cdsitemPedido.FieldByName('VL_MARGEM_NEGOCIADA')).DisplayWidth := 12;

  TStringField(_cdsitemPedido.FieldByName('ID_MARGEM')).DisplayLabel :='Id Margem';
  TStringField(_cdsitemPedido.FieldByName('ID_MARGEM')).DisplayWidth := 06;

  TStringField(_cdsitemPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayLabel := 'Id Desc. Acumul.';
  TStringField(_cdsitemPedido.FieldByName('ID_DESCONTO_ACUMULATIVO')).DisplayWidth := 06;

  TFloatField(_cdsitemPedido.FieldByName('PC_VERBA')).DisplayFormat:= '##0.00';
  TFloatField(_cdsitemPedido.FieldByName('PC_VERBA')).DisplayLabel :='% P/ Verba';
  TFloatField(_cdsitemPedido.FieldByName('PC_VERBA')).DisplayWidth := 6;

  TFloatField(_cdsitemPedido.FieldByName('VL_VERBA')).DisplayFormat :='##,###,##0.00';
  TFloatField(_cdsitemPedido.FieldByName('VL_VERBA')).DisplayLabel :='Vlr. da Verba';
  TFloatField(_cdsitemPedido.FieldByName('VL_VERBA')).DisplayWidth := 12;

  TIntegerField(_cdsitemPedido.FieldByName('QT_BONIFICADA')).DisplayFormat:= '#######0';
  TIntegerField(_cdsitemPedido.FieldByName('QT_BONIFICADA')).DisplayLabel := 'Qtdade Bonif.';
  TIntegerField(_cdsitemPedido.FieldByName('QT_BONIFICADA')).DisplayWidth := 10;

  TFloatField(_cdsitemPedido.FieldByName('PC_BONIFICACAO')).DisplayFormat:= '##0.00';
  TFloatField(_cdsitemPedido.FieldByName('PC_BONIFICACAO')).DisplayLabel :='% Bonifica??o';
  TFloatField(_cdsitemPedido.FieldByName('PC_BONIFICACAO')).DisplayWidth := 10;

  TFloatField(_cdsitemPedido.FieldByName('PC_DESCONTO_OL')).DisplayFormat:='##0.00';
  TFloatField(_cdsitemPedido.FieldByName('PC_DESCONTO_OL')).DisplayLabel :='% Desc. OL';
  TFloatField(_cdsitemPedido.FieldByName('PC_DESCONTO_OL')).DisplayWidth := 10;

  TIntegerField(_cdsitemPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayFormat := '#######0';
  TIntegerField(_cdsitemPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayLabel := 'Cd Operador Log.';
  TIntegerField(_cdsitemPedido.FieldByName('NR_OPERADOR_LOGISTICO')).DisplayWidth := 10;

end;

function T_frmEnvioPedido.setCondicaoPagamento(nrParcela,nrDias:Integer;pcParcela,vlParcela:Double;dtPagamento:TDATE):Boolean;
BEGIN
 TRY
  _cdsCondicaoPagamentos.Open;
  _cdsCondicaoPagamentos.Append;
  _cdsCondicaoPagamentosNR_DIAS.AsInteger  :=nrDias;
  _cdsCondicaoPagamentosPC_PARCELAS.AsFloat      := pcParcela;
  _cdsCondicaoPagamentosVL_PARCELAS.AsFloat      :=vlParcela;
  _cdsCondicaoPagamentosDT_PAGAMENTOS.AsDateTime :=dtPagamento;
  _cdsCondicaoPagamentos.Post;
  Result:=true;
 EXCEPT
   BEGIN
    Mensagem('Erro Na Grava??o forma Pagamento',16);
    Result:=false;
   END;
 END;
END;
FUNCTION T_frmEnvioPedido.getCondicaoPagamento(nrcondicao:Integer):Boolean;
var
  PrazoPedido :TCondicaoPagamento;
  I : iNTEGER;
  pcParcela,
  vtparcela,
  vlPedido:Double;
  dtPrevista :TDate;
BEGIN
   _cdsCondicaoPagamentos.Close;
   _cdsCondicaoPagamentos.CreateDataSet;
   PrazoPedido:=nrParcelaPedido(_cdsPedidos.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);
   vlPedido      := _cdsPedidos.FieldByName('VL_FINACEIRO').AsFloat;
   dtPrevista    := _cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime;
   pcParcela     := 100/PrazoPedido.nrCondicaoPagamento;
   vtparcela     := vlPedido/PrazoPedido.nrCondicaoPagamento;;
   FOR I:=1 TO PrazoPedido.nrCondicaoPagamento DO
   BEGIN
      setCondicaoPagamento(I,PrazoPedido.nrDiasPrazo[I],pcParcela,vtparcela,dtPrevista+PrazoPedido.nrDiasPrazo[I]);
   END;
   _cdsCondicaoPagamentos.OPEN;
   _cdsCondicaoPagamentos.FIRST;
   vtparcela:=0;
   pcParcela:=0;
   WHILE  NOT _cdsCondicaoPagamentos.Eof DO
   BEGIN
    pcParcela:=   pcParcela  + _cdsCondicaoPagamentosPC_PARCELAS.AsFloat;
    _cdsCondicaoPagamentos.Next;
   END;
   IF vtparcela<>100 THEN
      AJustaParcelas;
END;

PROCEDURE T_frmEnvioPedido.AJustaParcelas;
VAR
  nrParcelas,I: Integer;
  pcParcela : Double;
  vlAcumulado:Double;
  nrRepeticao:Integer;
BEGIN
   _cdsCondicaoPagamentos.Open;
   _cdsCondicaoPagamentos.First;
//   VT_PC_PARCELA:=0;
   vlAcumulado:=0;
   nrParcelas:= _cdsCondicaoPagamentos.RecordCount;
   nrRepeticao:=0;
   FOR I:=1 TO nrParcelas DO
   BEGIN
       pcParcela:=(100 - vlAcumulado)/(nrParcelas - nrRepeticao);
       Inc(nrRepeticao);
       vlAcumulado:= vlAcumulado + StrToFloat(FormatFloat('##000',pcParcela));
       _cdsCondicaoPagamentos.Open;
       if _cdsCondicaoPagamentos.Locate('NR_PARCELAS',I,[]) THEN
       begin
         _cdsCondicaoPagamentos.Edit;
         _cdsCondicaoPagamentosPC_PARCELAS.AsFloat:=StrToFloatDef(FormatFloat('##000',pcParcela),0);
         _cdsCondicaoPagamentos.Post;
       END;
   END;
END;
function  T_frmEnvioPedido.CabecalhoArquivoRegistro01(idTipoRegisto:String;
                                                      nrPedido:Integer;
                                                      dtEntrega,
                                                      dtEntregaMaisTarde,
                                                      dtEntregaMaisCedo:String;
                                                      dtPedido:String;
                                                      idTipoPedido:String;
                                                      nrListaPreco:String;
                                                      nrEanCliente:String;
                                                      nrCNPJCliente:String;
                                                      nrEAnLocalEntrega:String;
                                                      dsRazaoSocialLocalEntrega:String;
                                                      dsLogradouroLocalEntrega:String;
                                                      dsBairroLocalEntrega,
                                                      dsMunicipioLocalEntrega,
                                                      dsUnidadeFederacaoLocalEntrega,
                                                      dsCepLocalEntrega,
                                                      nrCNPJLocalEntrega,
                                                      nrInscricaoEstadualLocalEntrega,
                                                      nrEanLocalFaturamento,
                                                      nrCNPJLocalDestinoFaturamento,
                                                      nrEanFornecedor,
                                                      nrCNPJFornecedor,
                                                      idTipoFrete:String;
                                                      pcDescontoPedido,
                                                      vlEncargosFrete:Double;
                                                      idTipoUsoMercadoria,
                                                      dsContrato,
                                                      idTipoPedido29,
                                                      nrCnpjDestinoMercadoria:String;
                                                      dsfiller:Char):wideString;
var
cpIdTipoRegisto                    :String[002];
cpNrPedido                         :String[015];
cpDtEntrega                        :String[008];
cpDtEntregaMaisTarde               :String[008];
cpDtEntregaMaisCedo                :String[008];
cpDtPedido                         :String[008];
cpTipoPedido                       :String[008];
cpNrListaPreco                     :String[020];
cpNrEanCliente                     :String[013];
cpNrCNPJCliente                    :String[014];
cpEanLocalEntrega                  :String[013];
cpDsRazaoSocialLocalEntrega        :String[035];
cpSLogradouroLocalEntrega          :String[035];
cpDsBairroLocalEntrega             :String[035];
cpSMunicipioLocalEntrega           :String[035];
cpDsUnidadeFederacaoLocalEntrega   :String[002];
cpSCepLocalEntrega                 :String[009];
cpNrCNPJLocalEntrega               :String[014];
cpNrInscricaoEstadualLocalEntrega  :String[020];
cpNrEanLocalFaturamento            :String[013];
cpNrCNPJLocalDestinoFaturamento    :String[014];
cpNrEanFornecedor                  :String[013];
cpNrCNPJFornecedor                 :String[014];
cpIdTipoFrete                      :String[003];
cpPcDescontoPedido                 :String[010];
cpVlEncargosFrete                  :String[018];
cpIdTipoUsoMercadoria              :String[003];
cpDsContrato                       :String[025];
cpIdTipoPedido29                   :String[003];
cpNrCnpjDestinoMercadoria          :String[014];
cpDsfiller                         :Char;
stParamentro:WideString;
begin
    cpIdTipoRegisto                    :=idTipoRegisto;
    cpNrPedido                         :=FormatFloat('000000',nrPedido);
    cpDtEntrega                        :=dtEntrega;
    cpDtEntregaMaisTarde               :=dtEntregaMaisTarde;
    cpDtEntregaMaisCedo                :=dtEntregaMaisCedo;
    cpDtPedido                         :=dtPedido;
    cpTipoPedido                       :=idTipoPedido;
    cpNrListaPreco                     :=nrListaPreco;
    cpNrEanCliente                     :=nrEanCliente;
    cpNrCNPJCliente                    :=nrCNPJCliente;
    cpEAnLocalEntrega                  :=nrEAnLocalEntrega;
    cpDsRazaoSocialLocalEntrega        :=dsRazaoSocialLocalEntrega;
    cpSLogradouroLocalEntrega          :=dsLogradouroLocalEntrega;
    cpDsBairroLocalEntrega             :=dsBairroLocalEntrega;
    cpSMunicipioLocalEntrega           :=dsMunicipioLocalEntrega;
    cpDsUnidadeFederacaoLocalEntrega   :=dsUnidadeFederacaoLocalEntrega;
    cpSCepLocalEntrega                 :=dsCepLocalEntrega;
    cpNrCNPJLocalEntrega               :=nrCNPJLocalEntrega;
    cpNrInscricaoEstadualLocalEntrega  :=nrInscricaoEstadualLocalEntrega;
    cpNrEanLocalFaturamento            :=nrEanLocalFaturamento;
    cpNrCNPJLocalDestinoFaturamento    :=nrCNPJLocalDestinoFaturamento;
    cpNrEanFornecedor                  :=nrEanFornecedor;
    cpNrCNPJFornecedor                 :=nrCNPJFornecedor;
    cpIdTipoFrete                      :=IdTipoFrete;
    cpPcDescontoPedido                 :=AnsiReplaceStr(FormatFloat('00000000.00',pcDescontoPedido),',','');
    cpVlEncargosFrete                  :=AnsiReplaceStr(FormatFloat('0000000000000000.00',vlEncargosFrete),',','');;
    cpIdTipoUsoMercadoria              :=idTipoUsoMercadoria;
    cpDsContrato                       :=dsContrato;
    cpIdTipoPedido29                   :=idTipoPedido29;
    cpNrCnpjDestinoMercadoria          :=nrCnpjDestinoMercadoria;
    cpDsfiller                         :=dsfiller;
    stParamentro:='';
    stParamentro:=stParamentro + insereCaracterDireita(cpIdTipoRegisto,'0',002);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrPedido,' ',015);
    stParamentro:=stParamentro + insereCaracterDireita(cpDtEntrega,' ',008);
    stParamentro:=stParamentro + insereCaracterDireita(cpDtEntregaMaisTarde,' ',08);
    stParamentro:=stParamentro + insereCaracterDireita(cpDtEntregaMaisCedo,' ',08);
    stParamentro:=stParamentro + insereCaracterDireita(cpDtPedido,' ',008);
    stParamentro:=stParamentro + insereCaracterDireita(cpTipoPedido,' ',003);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrListaPreco,' ',20);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrEanCliente,' ',13);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrCNPJCliente,' ',014);
    stParamentro:=stParamentro + insereCaracterDireita(cpEAnLocalEntrega,' ',13);
    stParamentro:=stParamentro + insereCaracterDireita(cpDsRazaoSocialLocalEntrega,' ',35);
    stParamentro:=stParamentro + insereCaracterDireita(cpSLogradouroLocalEntrega,' ',35);
    stParamentro:=stParamentro + insereCaracterDireita(cpDsBairroLocalEntrega,' ',35);
    stParamentro:=stParamentro + insereCaracterDireita(cpSMunicipioLocalEntrega,' ',35);
    stParamentro:=stParamentro + insereCaracterDireita(cpDsUnidadeFederacaoLocalEntrega,' ',02);
    stParamentro:=stParamentro + insereCaracterDireita(cpSCepLocalEntrega,' ',009);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrCNPJLocalEntrega,' ',14);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrInscricaoEstadualLocalEntrega,' ',20);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrEanLocalFaturamento,' ',13);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrCNPJLocalDestinoFaturamento,' ',14);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrEanFornecedor,' ',13);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrCNPJFornecedor,' ',14);
    stParamentro:=stParamentro + insereCaracterDireita(cpIdTipoFrete,' ',03);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpPcDescontoPedido,'0',10);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpVlEncargosFrete,'0',18);
    stParamentro:=stParamentro + insereCaracterDireita(cpIdTipoUsoMercadoria,'0',003);
    stParamentro:=stParamentro + insereCaracterDireita(cpDsContrato,' ',25);
    stParamentro:=stParamentro + insereCaracterDireita(cpIdTipoPedido29,' ',03);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrCnpjDestinoMercadoria,' ',14);
    stParamentro:=stParamentro + insereCaracterDireita(cpDsfiller,' ',23);
    Result:=stParamentro;

end;


function  T_frmEnvioPedido.CabecalhoArquivoRegistro00(idTipoRegisto,
                                                      idArquivo,
                                                      idCaixaPostalRementente,
                                                      idCaixaPostalDestinatario:String;
                                                      dsfiller:char):wideString;
var
 cpTipoRegistro           :String[002];
 cpNomeArquivo            :string[014];
 cpCaixaPostalRementente  :string[035];
 cpCaixaPostalDestinatario:string[035];
 cpFiller                 :char;
 stParamentro:WideString;
begin
    cpTipoRegistro:=idTipoRegisto;
    cpNomeArquivo :=idArquivo;
    cpCaixaPostalRementente  :=idCaixaPostalRementente;
    cpCaixaPostalDestinatario:=idCaixaPostalDestinatario;
    cpFiller:=dsfiller;
    stParamentro:=stParamentro + insereCaracterDireita(cpTipoRegistro,'0',002);
    stParamentro:=stParamentro + insereCaracterDireita(cpNomeArquivo,' ',014);
    stParamentro:=stParamentro + insereCaracterDireita(cpCaixaPostalRementente,' ',035);
    stParamentro:=stParamentro + insereCaracterDireita(cpCaixaPostalDestinatario,' ',035);
    stParamentro:=stParamentro + insereCaracterDireita(cpFiller,' ',364);
    Result:=stParamentro;
end;

function  T_frmEnvioPedido.CabecalhoArquivoRegistro02(idTipoRegisto:String;
                                                      nrParcelas:Integer;
                                                      idInicioContagemTempo:String;
                                                      idReferenciaTempo:String;
                                                      nrDiasPrazo:Integer;
                                                      pcPagamentoFatura:Double;
                                                      dsfiller:char):wideString;
var
 cpTipoRegistro          :String[002];
 cpNrParcelas            :String[002];
 cpInicioContagemTempo   :String[003];
 cpReferenciaTempo       :String[003];
 cpDiasPrazo             :String[003];
 cpPcPagamentoFatura     :String[010];
 cpFiller                :char;
 stParamentro:WideString;
begin
    cpTipoRegistro          :=idTipoRegisto;
    cpNrParcelas            :=FormatFloat('#0',nrParcelas);
    cpInicioContagemTempo   :=idInicioContagemTempo;
    cpReferenciaTempo       :=idReferenciaTempo;
    cpDiasPrazo             :=FormatFloat('000',nrDiasPrazo);
    cpPcPagamentoFatura     :=AnsiReplaceStr(FormatFloat('00000000.00',pcPagamentoFatura),',','');
    cpFiller                :=dsfiller;
    stParamentro:='';
    stParamentro:=stParamentro + insereCaracterDireita(cpTipoRegistro,'0',002);
    stParamentro:=stParamentro + insereCaracterDireita(cpNrParcelas,' ',002);
    stParamentro:=stParamentro + insereCaracterDireita(cpInicioContagemTempo,' ',003);
    stParamentro:=stParamentro + insereCaracterDireita(cpReferenciaTempo,' ',003);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpDiasPrazo,' ',003);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpPcPagamentoFatura,' ',010);
    stParamentro:=stParamentro + insereCaracterDireita(cpFiller,' ',427);
    Result:=stParamentro;
end;

function  T_frmEnvioPedido.CabecalhoArquivoRegistro03(idTipoRegisto:String;
                                                      nrItem:Integer;
                                                      cdbarraItem:String;
                                                      idTipoCodigoBarra:String;
                                                      nrQuantidadePedido:Integer;
                                                      dsUnidadeMedida:String;
                                                      idTipoPedido:String;
                                                      vlPrecoBruto:Double;
                                                      nrBasePreco:Integer;
                                                      unMediaPreco:String;
                                                      pcDesconto:Double;
                                                      idTipoUsoMercadoria:String;
                                                      dsfiller:char):wideString;
var
 cpTipoRegistro       :String[002];
 cpnrItem             :String[006];
 cpcdbarraItem          :String[014];
 cpidTipoCodigoBarra  :String[003];
 cpnrQuantidadePedido :String[015];
 CPdsUnidadeMedida    :String[003];
 cpidTipoPedido       :String[003];
 cpvlPrecoBruto       :String[015];
 cpnrBasePreco        :String[009];
 cpunMediaPre?o       :String[003];
 cppcDesconto         :String[010];
 cpidTipoUsoMercadoria:String[003];
 cpFiller             :char;
 stParamentro         :WideString;
begin

    cpTipoRegistro       :=idTipoRegisto;
    cpnrItem             :=FormatFloat('000000',nrItem);
    cpcdbarraItem        :=cdbarraItem;
    cpidTipoCodigoBarra  :=idTipoCodigoBarra;
    cpnrQuantidadePedido :=FormatFloat('000000000000000',nrQuantidadePedido);
    CPdsUnidadeMedida    :=dsUnidadeMedida;
    cpidTipoPedido       :=idTipoPedido;
    cpvlPrecoBruto       :=AnsiReplaceStr(FormatFloat('000000000000.000',vlPrecoBruto),',','');
    cpnrBasePreco        :=FormatFloat('000000000',nrBasePreco);
    cpunMediaPre?o       :=unMediaPreco;
    cppcDesconto         :=AnsiReplaceStr(FormatFloat('00000000.00',pcDesconto),',','');
    cpidTipoUsoMercadoria:=idTipoUsoMercadoria;
    cpFiller             :=dsfiller;
    stParamentro         :='';


    stParamentro:=stParamentro + insereCaracterDireita(cpTipoRegistro,'0',002);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpnrItem,'0',006);
    stParamentro:=stParamentro + insereCaracterDireitA(cdbarraItem,' ',014);
    stParamentro:=stParamentro + insereCaracterDireita(cpidTipoCodigoBarra,' ',003);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpnrQuantidadePedido,'0',015);
    stParamentro:=stParamentro + insereCaracterEsquerda(CPdsUnidadeMedida,' ',003);
    stParamentro:=stParamentro + insereCaracterEsquerda(idTipoPedido,' ',003);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpvlPrecoBruto,'0',015);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpnrBasePreco,'0',009);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpunMediaPre?o,' ',003);
    stParamentro:=stParamentro + insereCaracterEsquerda(cppcDesconto,'0',010);
    stParamentro:=stParamentro + insereCaracterEsquerda(cpidTipoUsoMercadoria,'0',003);
    stParamentro:=stParamentro + insereCaracterDireita(cpFiller,' ',364);
    Result:=stParamentro;
end;


procedure T_frmEnvioPedido.GeraArvquivoTivit;
var
 nmArquivo,
 nmArquivoInterno,
 pathLocal,
 stLocalArquivo:string;
 stLinha :WideString;
 Arquivo:TextFile;
 nrArquivo,nrItem:Integer;
 idIndicaTipoPedido,
 idTipoCondicaoPedido:String[03];
 dsCodigoBarra,dun14:String[14];
 vlItem:Double;
 nrQuantidadePedido:Integer;
 nrIndiceTipoPedido :integer;

 stCNPJEAN :String[14];


begin
    nrArquivo:=nrPedidoSequecial;
    pathLocal:=ExtractFilePath(Application.ExeName);
    pathLocal:=dsDestinoArquivo+'TIVIT';
    nrIndiceTipoPedido:=_cbTipoCondicaoPedido.ItemIndex;
    if not DirectoryExists(pathLocal) then
       ForceDirectories(pathLocal);

    nmArquivo:=StringReplace(trim(_cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR').AsString),'/','_',[rfReplaceAll]);
    nmArquivo:=StringReplace(trim(nmArquivo),' ','_',[rfReplaceAll]);
    nmArquivo:=copy(StringReplace(nmArquivo,'.','_',[rfReplaceAll]),1,4)
    +'_'+FormatFloat('0000',_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger)+'_'+
    _cdsPedidos.FieldByName('ID_CD').AsString;
    nmArquivoInterno:='ORDERSGAMSC'+FormatFloat('0000',nrArquivo);
    if (_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=24) and
        (_cdsPedidos.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger=399) then
    begin
       if Confirma('Pedido Astrazenica Tipo Fidelidade',MB_DEFBUTTON1)=idYes then
          _cbTipoCondicaoPedido.ItemIndex:=7;
    end;


    if nrArquivo>0 then
    begin
        idTipoCondicaoPedido:=COPY(_cbTipoCondicaoPedido.Text,1,3);
        if _cdsPedidos.FieldByName('NR_ITEM').AsInteger=_cdsPedidos.FieldByName('NR_ITENS_BONIFICADO').AsInteger then
           idTipoCondicaoPedido:='002';



        AssignFile(ARQUIVO,pathLocal+'\'+nmArquivo+'.TXT');
        Rewrite(ARQUIVO);
        stLinha:=CabecalhoArquivoRegistro00('00',
                                            nmArquivoInterno,
                                            'GAM WEB',
                                           _cdsPedidos.FieldByName('DS_IDENTIFICACAO_VAN').AsString,
                                           ' ');        Writeln(Arquivo,stLinha);

        if idPedidoPsicotropico then
           stCNPJEAN:=_cdsPedidos.FieldByName('DS_FORNECEDOR_PSICOTROPICO').AsString
        else
           stCNPJEAN:= formatfloat('00000000000000',_cdsPedidos.FieldByName('NR_CNPJ_FORNECEDOR').Asfloat);

        stLinha:=CabecalhoArquivoRegistro01('01',
                                            _cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                                            FormatDateTime('yyyymmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PEDIDO').AsDateTime),
                                            idTipoCondicaoPedido,
                                            ' ',
                                            EANEntrega,
                                            nrCNPJGAMEntrega,
                                            EANEntrega,
                                            nmRazaoSocialEntrega,
                                            dsLogradouroEntrega,
                                            dsBairroEntrega,
                                            dsMunicipioEntrega,
                                            dsUFGAMEntrega,
                                            dsCEPGAMEntrega,
                                            nrCNPJGAMEntrega,
                                            nrInscricaoEstadualEntrega,
                                            EANEntrega,
                                            nrCNPJGAMEntrega,
                                            //TRIM(_cdsPedidos.FieldByName('DS_IDENTIFICACAO_VAN').AsString),
                                            stCNPJEAN,
                                            stCNPJEAN,
                                            'CIF',
                                            0,
                                            0,
                                            COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                            ' ',
                                            COPY(_cbxTipoPedido.Text,1,3),
                                            nrCNPJGAMEntrega,
                                            ' ' );
        Writeln(Arquivo,stLinha);
        _cdsCondicaoPagamentos.First;

        while not _cdsCondicaoPagamentos.Eof do
        begin
         stLinha:=CabecalhoArquivoRegistro02('02',
                                            _cdsCondicaoPagamentosNR_PARCELAS.AsInteger,
                                             '5',
                                             '1',
                                             _cdsCondicaoPagamentosNR_DIAS.AsInteger,
                                             _cdsCondicaoPagamentosPC_PARCELAS.AsFloat,
                                             ' ');
        _cdsCondicaoPagamentos.Next;
        Writeln(Arquivo,stLinha);
        end;
        _cdsItemPedido.First;
        nrItem:=0;
        idIndicaTipoPedido:=' ';
        //if COPY(_cbTipoCondicaoPedido.Text,1,3)<>COPY(_cbxTipoPedido.Text,1,3) then
         //idIndicaTipoPedido:=COPY(_cbxTipoPedido.Text,1,3);

        while not _cdsItemPedido.Eof do
        begin
           Inc(nrItem);
           dsCodigoBarra:='0';
           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='1' then
              dsCodigoBarra  := trim(_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsString);

           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='2' then
           begin
               dun14:=GetCodigoDun14(_cdsPedidos.FieldByName('NROM_Y').AsInteger,DadosCd.nrCD);
               if trim(dun14)<>'' then
                  dsCodigoBarra:=trim(dun14);
           end;

           vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;
           nrQuantidadePedido:=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
           if _cdsPedidos.FieldByName('ID_CAIXA_FECHADA').AsString='S' then
           begin
             vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat*
                                _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
              nrQuantidadePedido:=StrToIntDef(formatfloat('00000000', _cdsItemPedido.FieldByName('QUAY_Y').AsInteger/
                                    _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger),1);


           end;

           stLinha:=CabecalhoArquivoRegistro03('03',
                                               nrItem,
                                               dsCodigoBarra,
                                                'EN',
                                                nrQuantidadePedido,
                                                ' ',
                                                idIndicaTipoPedido,
                                                vlItem,
                                                1,
                                                ' ',
                                                _cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                                                _cdsItemPedido.FieldByName('DADY_Y').AsFloat,
                                                COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                                ' ');

           Writeln(Arquivo,stLinha);
          _cdsItemPedido.Next;
        end;

        CloseFile(Arquivo);
        if stLinha<>'' then
         sleep(0);
    end;
    _cbTipoCondicaoPedido.ItemIndex:=nrIndiceTipoPedido;

     Mensagem('Arquivo Gerado'+#13+
              'Local       --> '+pathLocal+#13+
              'Nome Arquivo--> '+nmArquivo ,64);

end;


procedure T_frmEnvioPedido.GeraArvquivoJANSSEN;
var
 nmArquivo,
 nmArquivoInterno,
 pathLocal,
 stLocalArquivo:string;
 stLinha :WideString;
 Arquivo:TextFile;
 nrArquivo,nrItem:Integer;
 idIndicaTipoPedido:String[03];
 dsCodigoBarra,dun14:String[14];
 vlItem:Double;
 nrQuantidadePedido:Integer;
 nrIndiceTipoPedido :integer;


begin
    nrArquivo:=nrPedidoSequecial;
    pathLocal:=ExtractFilePath(Application.ExeName);
    pathLocal:=dsDestinoArquivo+'JANSSEN';
    nrIndiceTipoPedido:=_cbTipoCondicaoPedido.ItemIndex;
    if not DirectoryExists(pathLocal) then
       ForceDirectories(pathLocal);

    nmArquivo:=StringReplace(trim(_cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR').AsString),'/','_',[rfReplaceAll])+'_'+FormatFloat('0000',_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger);
    nmArquivo:=StringReplace(nmArquivo,'.','_',[rfReplaceAll]);
    nmArquivoInterno:='ORDGAMSC'+FormatFloat('0000',nrArquivo);
    if (_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=24) and
        (_cdsPedidos.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger=399) then
    begin
       if Confirma('Pedido Astrazenica Tipo Fidelidade',MB_DEFBUTTON1)=idYes then
          _cbTipoCondicaoPedido.ItemIndex:=7;
    end;


    if nrArquivo>0 then
    begin

        AssignFile(ARQUIVO,pathLocal+'\'+nmArquivo+'.TXT');
        Rewrite(ARQUIVO);
        stLinha:=CabecalhoArquivoRegistro00('00',
                                            nmArquivoInterno,
                                            'GAM WEB',
                                           _cdsPedidos.FieldByName('DS_IDENTIFICACAO_VAN').AsString,
                                           ' ');        Writeln(Arquivo,stLinha);
        stLinha:=CabecalhoArquivoRegistro01('01',
                                            _cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                                            FormatDateTime('yyyymmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PEDIDO').AsDateTime),
                                            COPY(_cbTipoCondicaoPedido.Text,1,3),
                                            ' ',
                                            EANGAMCob,
                                            nrCNPJGAMCob,
                                            EANEntrega,
                                            nmRazaoSocialEntrega,
                                            dsLogradouroEntrega,
                                            dsBairroEntrega,
                                            dsMunicipioEntrega,
                                            dsUFGAMEntrega,
                                            dsCEPGAMEntrega,
                                            nrCNPJGAMEntrega,
                                            nrInscricaoEstadualEntrega,
                                            EANEntrega,
                                            nrCNPJGAMEntrega,
                                            TRIM(_cdsPedidos.FieldByName('DS_IDENTIFICACAO_VAN').AsString),
                                            TRIM(_cdsPedidos.FieldByName('NR_CNPJ_FORNECEDOR').AsString),
                                            'CIF',
                                            _cdsPedidos.FieldByName('ABTP_P').AsFloat,
                                            0,
                                            COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                            ' ',
                                            COPY(_cbxTipoPedido.Text,1,3),
                                            nrCNPJGAMCob,
                                            ' ' );
        Writeln(Arquivo,stLinha);
        _cdsCondicaoPagamentos.First;

        while not _cdsCondicaoPagamentos.Eof do
        begin
         stLinha:=CabecalhoArquivoRegistro02('02',
                                            _cdsCondicaoPagamentosNR_PARCELAS.AsInteger,
                                             '5',
                                             '1',
                                             _cdsCondicaoPagamentosNR_DIAS.AsInteger,
                                             _cdsCondicaoPagamentosPC_PARCELAS.AsFloat,
                                             ' ');
        _cdsCondicaoPagamentos.Next;
        Writeln(Arquivo,stLinha);
        end;
        _cdsItemPedido.First;
        nrItem:=0;
        idIndicaTipoPedido:=' ';
        //if COPY(_cbTipoCondicaoPedido.Text,1,3)<>COPY(_cbxTipoPedido.Text,1,3) then
         //idIndicaTipoPedido:=COPY(_cbxTipoPedido.Text,1,3);

        while not _cdsItemPedido.Eof do
        begin
           Inc(nrItem);
           dsCodigoBarra:='0';
           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='1' then
              dsCodigoBarra  := trim(_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsString);

           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='2' then
           begin
               dun14:=GetCodigoDun14(_cdsPedidos.FieldByName('NROM_Y').AsInteger,DadosCd.nrCD);
               if trim(dun14)<>'' then
                  dsCodigoBarra:=trim(dun14);
           end;

           vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;
           nrQuantidadePedido:=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
           if _cdsPedidos.FieldByName('ID_CAIXA_FECHADA').AsString='S' then
           begin
             vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat*
                                _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
              nrQuantidadePedido:=StrToIntDef(formatfloat('00000000', _cdsItemPedido.FieldByName('QUAY_Y').AsInteger/
                                    _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger),1);


           end;

           stLinha:=CabecalhoArquivoRegistro03('03',
                                               nrItem,
                                               dsCodigoBarra,
                                                'EN',
                                                nrQuantidadePedido,
                                                ' ',
                                                idIndicaTipoPedido,
                                                vlItem,
                                                1,
                                                ' ',
                                                _cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                                                _cdsItemPedido.FieldByName('DADY_Y').AsFloat,
                                                COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                                ' ');

           Writeln(Arquivo,stLinha);
          _cdsItemPedido.Next;
        end;

        CloseFile(Arquivo);
        if stLinha<>'' then
         sleep(0);
    end;
    _cbTipoCondicaoPedido.ItemIndex:=nrIndiceTipoPedido;

     Mensagem('Arquivo Gerado'+#13+
              'Local       --> '+pathLocal+#13+
              'Nome Arquivo--> '+nmArquivo ,64);

end;


procedure T_frmEnvioPedido.GeraArquivoIMS;
var
 nmArquivo,
 nmArquivoInterno,
 pathLocal,
 stLocalArquivo:string;
 stLinha :WideString;
 Arquivo:TextFile;
 nrArquivo,nrItem:Integer;
 idIndicaTipoPedido:String[03];
 dsCodigoBarra,dun14:String[14];
 vlItem:Double;
 nrQuantidadePedido:Integer;
 idEstado:string[02];
 idTipoPedidoCapa,
 IdTipoPedidoItem:String[03];
 ProcurarArquivo : TSearchRec;
 TamanhoArquivo :LongInt;
 tpArquivo:TfileName;

begin
  try
   nrArquivo:=nrPedidoSequecial;
   pathLocal:=ExtractFilePath(Application.ExeName);
   pathLocal:=dsDestinoArquivo+'IMS';
   stLocalArquivo:=pathLocal;
   if not DirectoryExists(pathLocal) then
       ForceDirectories(pathLocal);
    idEstado:='SC';

   if _cdsPedidos.FieldByName('CD_EMPRESA').AsInteger=1 then
        idEstado:='SC';
   if _cdsPedidos.FieldByName('CD_EMPRESA').AsInteger=2 then
        idEstado:='RS';
   if _cdsPedidos.FieldByName('CD_EMPRESA').AsInteger=5 then
        idEstado:='ES';
   if _cdsPedidos.FieldByName('CD_EMPRESA').AsInteger=7 then
        idEstado:='PR';
   if _cdsPedidos.FieldByName('CD_EMPRESA').AsInteger=8 then
        idEstado:='DF';

    nmArquivo:=_cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR').AsString+FormatFloat('0000',_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger);
    nmArquivo:='ORDERS'+idEstado+FormatFloat('0000',nrArquivo)+'.TXT';
    nmArquivoInterno:='ORDERS'+ FormatDateTime('yyyy',dtSistema)+FormatFloat('0000',nrArquivo);


    idTipoPedidoCapa:=COPY(_cbTipoCondicaoPedido.Text,1,3);

  //  if idPedidoHospitalar then
  //    idTipoPedidoCapa:='HOS'; ///retirado conforme SS  44855



    IdTipoPedidoItem:= COPY(_cbTipoCondicaoPedido.Text,1,3);

    {A pedido Fernando(Hospitalar) e Raquel no dia 29/05/2019  }
    { REGRA RETIRADA EM 17/05/2021 COMFORME SS 42359}

 {   if _cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=635 then
    begin
       idTipoPedidoCapa:='140';
       IdTipoPedidoItem:='001';
    end;
    if (_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=361) or
      (_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=622) then
      begin
       idTipoPedidoCapa:='120';
       IdTipoPedidoItem:='001';
      end;}

    if nrArquivo>0 then
    begin
        tpArquivo:=pathLocal+'\'+nmArquivo;
        AssignFile(ARQUIVO,pathLocal+'\'+nmArquivo);
        Rewrite(ARQUIVO);
        stLinha:=CabecalhoArquivoRegistro00('00',
                                            nmArquivoInterno,
                                            nrCNPJGAMEntrega,
                                           _cdsPedidos.FieldByName('DS_IDENTIFICACAO_FORNECEDOR').AsString,
//                                            nrCNPJGAMCob,
                                           ' ');
        Writeln(Arquivo,stLinha);
        stLinha:=CabecalhoArquivoRegistro01('01',
                                            _cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                                            FormatDateTime('yyyymmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PEDIDO').AsDateTime),
                                            idTipoPedidoCapa,
                                            ' ',
                                            EANEntrega,
//                                            EANGAMCob,
                                          nrCNPJGAMEntrega,
  //                                            nrCNPJGAMCob,
                                            EANEntrega,
                                            nmRazaoSocialEntrega,
                                            dsLogradouroEntrega,
                                            dsBairroEntrega,
                                            dsMunicipioEntrega,
                                            dsUFGAMEntrega,
                                            dsCEPGAMEntrega,
                                            nrCNPJGAMEntrega,
                                            nrInscricaoEstadualEntrega,
                                            DadosCdPagamento.nrEANCD,
                                            DadosCdPagamento.nrCNPJ,
                                            TRIM(_cdsPedidos.FieldByName('DS_IDENTIFICACAO_FORNECEDOR').AsString),
                                            formatfloat('00000000000000',_cdsPedidos.FieldByName('NR_CNPJ_FORNECEDOR').Asfloat),
                                            'CIF',
                                            _cdsPedidos.FieldByName('ABTP_P').AsFloat,
                                            0,
                                            COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                            ' ',
                                            ' ',//xCOPY(_cbxTipoPedido.Text,1,3),
                                            ' ',
                                            ' ' );
        Writeln(Arquivo,stLinha);
        _cdsCondicaoPagamentos.First;

        while not _cdsCondicaoPagamentos.Eof do
        begin
         stLinha:=CabecalhoArquivoRegistro02('02',
                                            _cdsCondicaoPagamentosNR_PARCELAS.AsInteger,
                                             '5',
                                             '1',
                                             _cdsCondicaoPagamentosNR_DIAS.AsInteger,
                                             _cdsCondicaoPagamentosPC_PARCELAS.AsFloat,
                                             ' ');
        _cdsCondicaoPagamentos.Next;
        Writeln(Arquivo,stLinha);
        end;
        _cdsItemPedido.First;
        nrItem:=0;
        idIndicaTipoPedido:=' ';
        if COPY(_cbTipoCondicaoPedido.Text,1,3)<>COPY(_cbxTipoPedido.Text,1,3) then
           idIndicaTipoPedido:=COPY(_cbxTipoPedido.Text,1,3);

        while not _cdsItemPedido.Eof do
        begin
           Inc(nrItem);
           dsCodigoBarra:='0';
           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='1' then
              dsCodigoBarra  := trim(_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsString);

           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='2' then
           begin
               dun14:=GetCodigoDun14(_cdsItemPedido.FieldByName('NROM_Y').AsInteger,DadosCd.nrCD);
               if trim(dun14)<>'' then
                  dsCodigoBarra:=trim(dun14);
           end;

           vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;
           nrQuantidadePedido:=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
           if _cdsPedidos.FieldByName('ID_CAIXA_FECHADA').AsString='S' then
           begin
             vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat*
                                _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
              nrQuantidadePedido:=StrToIntDef(formatfloat('00000000', _cdsItemPedido.FieldByName('QUAY_Y').AsInteger/
                                    _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger),1);


           end;

           stLinha:=CabecalhoArquivoRegistro03('03',
                                               nrItem,
                                               dsCodigoBarra,
                                                'EN',
                                                nrQuantidadePedido,
                                                ' ',
                                               IdTipoPedidoItem,
                                                vlItem,
                                                1,
                                                ' ',
                                                _cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                                                _cdsItemPedido.FieldByName('DADY_Y').AsFloat,
                                                COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                                ' ');

           Writeln(Arquivo,stLinha);
          _cdsItemPedido.Next;
        end;
        nrTamanhoArquivo:=FileSize(Arquivo);

        CloseFile(Arquivo);
        if FindFirst(stLocalArquivo+'\'+nmArquivo, FaAnyFile, ProcurarArquivo) =0 then
           TamanhoArquivo := Int64(ProcurarArquivo.FindData.nFileSizeHigh) SHL Int64(32) +
                            Int64(ProcurarArquivo.FindData.nFileSizeLow);

        nrTamanhoArquivo:=TamanhoArquivo;
        stExtensaoArquivo:=ExtractFileExt(tpArquivo);
        stNomePrincipalArquivo:=ExtractNameSISTEMA(tpArquivo);
        ///nrBase:=2;
        if nrBase=2 then
        begin
         TransNmArquivo:=nmArquivo;
         TransDsLocalArquivo:=stLocalArquivo;
         TransDsDestinoArquivo:='Edi';
         TransDsTNSMAQUINA:='10.1.1.26';
         TransNmUsuario:='atualiza';
         TransDsSenhaUsuatio:='atualiza';
        end;
        if (nrBase=1) and (_cdsPedidos.FieldByName('ID_VAN').AsString<>'P') then
        begin
         TransNmArquivo:=nmArquivo;
         TransDsLocalArquivo:=stLocalArquivo;
         TransDsDestinoArquivo:='Edi';
         TransDsTNSMAQUINA:='ftp.imse-commerce.com';
         TransNmUsuario:='genesio';
         TransDsSenhaUsuatio:='gvn5717gen';
        end;
        if (nrBase=1) and(_cdsPedidos.FieldByName('ID_VAN').AsString='P') and
             ((_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger<>366) or (_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger<>287)) then

        begin
         TransNmArquivo:=nmArquivo;
         TransDsLocalArquivo:=stLocalArquivo;
         TransDsDestinoArquivo:='Entrada';
         TransDsTNSMAQUINA:='189.36.12.132';
         TransNmUsuario:='distGam';
         TransDsSenhaUsuatio:='82aDxVgL';
        end;
         if (nrBase=1) and(_cdsPedidos.FieldByName('ID_VAN').AsString='P') and
          ((_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=366) ) then
         begin
          TransNmArquivo:=nmArquivo;
          TransDsLocalArquivo:=stLocalArquivo;
          TransDsDestinoArquivo:='novartis';
          TransDsTNSMAQUINA:='clientes3.gam.com.br';
          TransNmUsuario:='interplayerscompras';
          TransDsSenhaUsuatio:='g280920@';
         end;

         if (nrBase=1) and(_cdsPedidos.FieldByName('ID_VAN').AsString='P') and
          ((_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=146)
          or (_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=287)
          or (_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=564)
            or (_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger=367) ) then
         begin
          TransNmArquivo:=nmArquivo;
          TransDsLocalArquivo:=stLocalArquivo;
          TransDsDestinoArquivo:='uniaoquimica';
          TransDsTNSMAQUINA:='clientes3.gam.com.br';
          TransNmUsuario:='interplayerscompras';
          TransDsSenhaUsuatio:='g280920@';
         end;



         if confirma('Aten??o'+#13+
              'A Confirma??o deste Processo Transmitir? um Pedido'+#13+
              'automaticamete para o Laboratorio'+#13+
              formatfloat('####0',_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger)+'  -  '+
              _cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR').AsString+#13+
              'Transmitir o Pedido ?',MB_DEFBUTTON2 )=idyes then
          begin
               idTransferido:=false;
               CriaTelaTransferenciaArquivo;
               if idTransferido then
               AtualizaDataTransmissao(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger, _cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger,DadosCd.nrCD);

          end;


       { if Confirma('Transmitir Arquivo Laboratorio',MB_DEFBUTTON2)=IDYES then
        begin

         //TranfereArquivoFtp(pathLocal,'',nmArquivo,'ftp.imse-commerce.com','genesio','gvn5717gen')
        end;}

    end;
  except
    on E: Exception do
    begin
      trataerro(E.Message, format('Erro ao Gerar arquivo Pedido Compra %s',['IMS']));
    end;
  end;
   //Mensagem('Arquivo Gerado');
end;


procedure T_frmEnvioPedido.GeraArquivoEntire;
var
 nmArquivo,
 nmArquivoInterno,
 pathLocal,
 stLocalArquivo:string;
 stLinha :WideString;
 Arquivo:TextFile;
 nrArquivo,nrItem:Integer;
 idIndicaTipoPedido:String[03];
 dsCodigoBarra,dun14:String[14];
 vlItem:Double;
 nrQuantidadePedido:Integer;
 idEstado:string[02];

 ProcurarArquivo : TSearchRec;
 TamanhoArquivo :LongInt;
 tpArquivo:TfileName;


begin
  try
    nrArquivo:=nrPedidoSequecial;
    pathLocal:=ExtractFilePath(Application.ExeName);
    pathLocal:=dsDestinoArquivo+'ENTIRE';
    stLocalArquivo:=pathLocal;
    if not DirectoryExists(pathLocal) then
       ForceDirectories(pathLocal);
    idEstado:='SC';
    if _cdsPedidos.FieldByName('CD_EMPRESA').AsInteger=1 then
        idEstado:='SC';
    if _cdsPedidos.FieldByName('CD_EMPRESA').AsInteger=2 then
        idEstado:='RS';

    nmArquivo:=trim(_cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR').AsString)+'_'+FormatFloat('0000',_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger);
    nmArquivo:='ORDER'+idEstado+FormatFloat('0000',nrArquivo)+'.TXT';
    nmArquivoInterno:='ORDER'+idEstado+FormatFloat('0000',nrArquivo);







    if nrArquivo>0 then
    begin
       tpArquivo:=pathLocal+'\'+nmArquivo;

        AssignFile(ARQUIVO,pathLocal+'\'+nmArquivo);
        Rewrite(ARQUIVO);
        stLinha:=CabecalhoArquivoRegistro00('00',
                                            nmArquivoInterno,
                                            _cdsPedidos.FieldByName('DS_IDENTIFICACAO_VAN').AsString,
                                            nrCNPJGAMCob,
                                           ' ');
        Writeln(Arquivo,stLinha);
        stLinha:=CabecalhoArquivoRegistro01('01',
                                            _cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                                            FormatDateTime('yyyymmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PEDIDO').AsDateTime),
                                            COPY(_cbTipoCondicaoPedido.Text,1,3),
                                            ' ',
                                            EANEntrega,
//                                            EANGAMCob,
//                                            nrCNPJGAMCob,
                                            nrCNPJGAMEntrega,
                                            EANEntrega,
                                            nmRazaoSocialEntrega,
                                            dsLogradouroEntrega,
                                            dsBairroEntrega,
                                            dsMunicipioEntrega,
                                            dsUFGAMEntrega,
                                            dsCEPGAMEntrega,
                                            nrCNPJGAMEntrega,
                                            nrInscricaoEstadualEntrega,
                                            EANEntrega,
                                            nrCNPJGAMEntrega,
                                            TRIM(_cdsPedidos.FieldByName('DS_IDENTIFICACAO_VAN').AsString),
                                            formatfloat('00000000000000',_cdsPedidos.FieldByName('NR_CNPJ_FORNECEDOR').Asfloat),
                                            'CIF',
                                            _cdsPedidos.FieldByName('ABTP_P').AsFloat,
                                            0,
                                            COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                            ' ',
                                            COPY(_cbxTipoPedido.Text,1,3),
                                            nrCNPJGAMEntrega,
                                            ' ' );
        Writeln(Arquivo,stLinha);
        _cdsCondicaoPagamentos.First;

        while not _cdsCondicaoPagamentos.Eof do
        begin
         stLinha:=CabecalhoArquivoRegistro02('02',
                                            _cdsCondicaoPagamentosNR_PARCELAS.AsInteger,
                                             '5',
                                             '1',
                                             _cdsCondicaoPagamentosNR_DIAS.AsInteger,
                                             _cdsCondicaoPagamentosPC_PARCELAS.AsFloat,
                                             ' ');
        _cdsCondicaoPagamentos.Next;
        Writeln(Arquivo,stLinha);
        end;
        _cdsItemPedido.First;
        nrItem:=0;
        idIndicaTipoPedido:=' ';
        if COPY(_cbTipoCondicaoPedido.Text,1,3)<>COPY(_cbxTipoPedido.Text,1,3) then
           idIndicaTipoPedido:=COPY(_cbxTipoPedido.Text,1,3);

        while not _cdsItemPedido.Eof do
        begin
           Inc(nrItem);
           dsCodigoBarra:='0';
           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='1' then
              dsCodigoBarra  := trim(_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsString);

           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='2' then
           begin
               dun14:=GetCodigoDun14(_cdsPedidos.FieldByName('NROM_Y').AsInteger,DadosCd.nrCD);
               if trim(dun14)<>'' then
                  dsCodigoBarra:=trim(dun14);
           end;

           vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;
           nrQuantidadePedido:=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
           if _cdsPedidos.FieldByName('ID_CAIXA_FECHADA').AsString='S' then
           begin
             vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat*
                                _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
              nrQuantidadePedido:=StrToIntDef(formatfloat('00000000', _cdsItemPedido.FieldByName('QUAY_Y').AsInteger/
                                    _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger),1);


           end;

           stLinha:=CabecalhoArquivoRegistro03('03',
                                               nrItem,
                                               dsCodigoBarra,
                                                'EN',
                                                nrQuantidadePedido,
                                                ' ',
                                                idIndicaTipoPedido,
                                                vlItem,
                                                1,
                                                ' ',
                                                _cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                                                _cdsItemPedido.FieldByName('DADY_Y').AsFloat,
                                                COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                                ' ');

           Writeln(Arquivo,stLinha);
          _cdsItemPedido.Next;
        end;
         CloseFile(Arquivo);
         TransNmArquivo:=nmArquivo;
         TransDsLocalArquivo:=stLocalArquivo;
         TransDsDestinoArquivo:='';

          if FindFirst(stLocalArquivo+'\'+nmArquivo, FaAnyFile, ProcurarArquivo) =0 then
           TamanhoArquivo := Int64(ProcurarArquivo.FindData.nFileSizeHigh) SHL Int64(32) +
                            Int64(ProcurarArquivo.FindData.nFileSizeLow);

        nrTamanhoArquivo:=TamanhoArquivo;
        stExtensaoArquivo:=ExtractFileExt(tpArquivo);
        stNomePrincipalArquivo:=ExtractNameSISTEMA(tpArquivo);


         if nrBase=2 then
         begin
          TransDsTNSMAQUINA:='10.1.1.30';
          TransNmUsuario:='koch';
          TransDsSenhaUsuatio:='koch6503';
        end;
        if nrBase=1 then
        begin
           TransDsDestinoArquivo:='';
           TransDsTNSMAQUINA:='200.189.167.44';
           TransNmUsuario:='PD_GenesioApsen';
           TransDsSenhaUsuatio:='9:276A\';
        end;
        CriaTelaTransferenciaArquivo;
       { if Confirma('Transmitir Arquivo Laboratorio',MB_DEFBUTTON2)=IDYES then
        begin

         //TranfereArquivoFtp(pathLocal,'',nmArquivo,'ftp.imse-commerce.com','genesio','gvn5717gen')
        end;}

    end;
  except
    on E: Exception do
    begin
      trataerro(E.Message, format('Erro ao Gerar arquivo Pedido Compra %s',['IMS']));
    end;
  end;
   //Mensagem('Arquivo Gerado');

end;


function T_frmEnvioPedido.TranfereArquivoFtp(dsLocalArquivo,dsDestinoArquivo,nmArquivo,dsTNSMAQUINA,nmUsuario,dsSenhaUsuatio:STRING):Boolean;
var
 LocalDestino,
 LocalOrigem:String;

BEGIN
  try
     LocalDestino:=dsDestinoArquivo+'\'+nmArquivo;
     LocalOrigem :=dsLocalArquivo+'\'+nmArquivo;
     _IdFTP.Disconnect();
     _IdFTP.Host :=dsTNSMAQUINA;
     _IdFTP.Port := 21;
     _IdFTP.Username := nmUSUARIO;
     _IdFTP.Password := dsSenhaUsuatio;
     _IdFTP.Connect;
     _IdFTP.ChangeDir(trim(dsDestinoArquivo));
//     _IdFTP.TransferType.ftBinary;
     _IdFTP.Put(LocalOrigem,TRIM(nmArquivo),false);
  EXCEPT
   begin
    _IdFTP.MakeDir(dsDestinoArquivo);
    _IdFTP.ChangeDir(dsDestinoArquivo);
   END;
  END;
END;


function T_frmEnvioPedido.CriaTelaTransferenciaArquivo:Boolean;
begin
   try
    result:=true;
   if  (_frmTransferenciaArquivo <> Nil) then
         _frmTransferenciaArquivo:=nil;
   if  (_frmTransferenciaArquivo = Nil) then
       application.CreateForm(T_frmTransferenciaArquivo, _frmTransferenciaArquivo);
       _frmTransferenciaArquivo.Show
   except
      result:=false;
   end;
//   finally
   // _frmTransferenciaArquivo.Free;

 //  end;
end;

procedure T_frmEnvioPedido.GeraArvquivoGXS;
var
 nmArquivo,
 nmArquivoInterno,
 pathLocal,
 stLocalArquivo:string;
 stLinha :WideString;
 Arquivo:TextFile;
 nrArquivo,nrItem:Integer;
 idIndicaTipoPedido:String[03];
 dsCodigoBarra,dun14:String[14];
 vlItem:Double;
 nrQuantidadePedido:Integer;
 nrIndiceTipoPedido :integer;


begin
    nrArquivo:=nrPedidoSequecial;
    pathLocal:=ExtractFilePath(Application.ExeName);
    pathLocal:=dsDestinoArquivo;
    nrIndiceTipoPedido:=_cbTipoCondicaoPedido.ItemIndex;
    if not DirectoryExists(pathLocal) then
       ForceDirectories(pathLocal);

    nmArquivo:='GXS_PED_'+FormatFloat('0000',_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger);
    nmArquivoInterno:='ORDGAMSC'+FormatFloat('0000',nrArquivo);
    if nrArquivo>0 then
    begin

        AssignFile(ARQUIVO,pathLocal+'\'+nmArquivo+'.TXT');
        Rewrite(ARQUIVO);
        stLinha:=CabecalhoArquivoRegistro00('00',
                                            nmArquivoInterno,
                                            'GAM WEB',
                                           _cdsPedidos.FieldByName('DS_IDENTIFICACAO_VAN').AsString,
                                           ' ');
         Writeln(Arquivo,stLinha);
        stLinha:=CabecalhoArquivoRegistro01('01',
                                            _cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,
                                            FormatDateTime('yyyymmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),
                                            FormatDateTime('YYYYmmdd',_cdsPedidos.FieldByName('DT_PEDIDO').AsDateTime),
                                            COPY(_cbTipoCondicaoPedido.Text,1,3),
                                            ' ',
                                            EANEntrega,
                                            nrCNPJGAMEntrega,
                                            EANEntrega,
                                            nmRazaoSocialEntrega,
                                            dsLogradouroEntrega,
                                            dsBairroEntrega,
                                            dsMunicipioEntrega,
                                            dsUFGAMEntrega,
                                            dsCEPGAMEntrega,
                                            nrCNPJGAMEntrega,
                                            nrInscricaoEstadualEntrega,
                                            EANEntrega,
                                            nrCNPJGAMEntrega,
                                            TRIM(_cdsPedidos.FieldByName('DS_IDENTIFICACAO_VAN').AsString),
                                            formatfloat('00000000000000',_cdsPedidos.FieldByName('NR_CNPJ_FORNECEDOR').Asfloat),
                                            'CIF',
                                            _cdsPedidos.FieldByName('ABTP_P').AsFloat,
                                            0,
                                            COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                            ' ',
                                            COPY(_cbxTipoPedido.Text,1,3),
                                            nrCNPJGAMEntrega,
                                            ' ' );
        Writeln(Arquivo,stLinha);
        _cdsCondicaoPagamentos.First;

        while not _cdsCondicaoPagamentos.Eof do
        begin
         stLinha:=CabecalhoArquivoRegistro02('02',
                                            _cdsCondicaoPagamentosNR_PARCELAS.AsInteger,
                                             '5',
                                             '1',
                                             _cdsCondicaoPagamentosNR_DIAS.AsInteger,
                                             _cdsCondicaoPagamentosPC_PARCELAS.AsFloat,
                                             ' ');
        _cdsCondicaoPagamentos.Next;
        Writeln(Arquivo,stLinha);
        end;
        _cdsItemPedido.First;
        nrItem:=0;
        idIndicaTipoPedido:=' ';
        //if COPY(_cbTipoCondicaoPedido.Text,1,3)<>COPY(_cbxTipoPedido.Text,1,3) then
         //idIndicaTipoPedido:=COPY(_cbxTipoPedido.Text,1,3);

        while not _cdsItemPedido.Eof do
        begin
           Inc(nrItem);
           dsCodigoBarra:='0';
           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='1' then
              dsCodigoBarra  := trim(_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsString);

           if _cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString='2' then
           begin
               dun14:=GetCodigoDun14(_cdsPedidos.FieldByName('NROM_Y').AsInteger,DadosCd.nrCD);
               if trim(dun14)<>'' then
                  dsCodigoBarra:=trim(dun14);
           end;

           vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;
           nrQuantidadePedido:=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
           if _cdsPedidos.FieldByName('ID_CAIXA_FECHADA').AsString='S' then
           begin
             vlItem            :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat*
                                _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
              nrQuantidadePedido:=StrToIntDef(formatfloat('00000000', _cdsItemPedido.FieldByName('QUAY_Y').AsInteger/
                                  _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger),1);


           end;

           stLinha:=CabecalhoArquivoRegistro03('03',
                                               nrItem,
                                               dsCodigoBarra,
                                                'EN',
                                                nrQuantidadePedido,
                                                ' ',
                                                idIndicaTipoPedido,
                                                vlItem,
                                                1,
                                                ' ',
                                                _cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                                                _cdsItemPedido.FieldByName('DADY_Y').AsFloat,
                                                COPY(_cbxTipoUsoMercadoria.Text,1,3),
                                                ' ');

           Writeln(Arquivo,stLinha);
          _cdsItemPedido.Next;
        end;

        CloseFile(Arquivo);
        if stLinha<>'' then
         sleep(0);
    end;
    _cbTipoCondicaoPedido.ItemIndex:=nrIndiceTipoPedido;

     Mensagem('Arquivo Gerado'+#13+
              'Local       --> '+pathLocal+#13+
              'Nome Arquivo--> '+nmArquivo ,64);

end;





PROCEDURE T_frmEnvioPedido.CABECALHONEOGRID;
VAR
  TIPO_REGISTRO        :STRING[02];
  FUNCAO_MENSAGEM      :STRING[03];
  TIPO_PEDIDO          :STRING[03];
  NR_PEDIDO_ST         :STRING[20];
  NR_PEDIDO_EMISSAO    :STRING[20];
  DT_HR_EMISSAO        :STRING[12];
  DT_HR_INICIO_ENTREGA :STRING[12];
  DT_HR_FINAL_ENTREGA  :STRING[12];
  NR_CONTRATO          :sTRING[15];
  DS_LISTA_PRECO       :STRING[15];
  EAN_FORNECEDOR       :STRING[13];
  EAN_COMPRADOR        :STRING[13];
  EAN_COBRANCA_FATURA  :STRING[13];
  EAN_LOCAL_ENTREGA    :STRING[13];
  CNPJ_FORNECEDOR      :sTRING[14];
  CNPJ_COMPRADOR       :sTRING[14];
  CNPJ_COBRANCA_FATURA :sTRING[14];
  CNPJ_LOCAL_ENTREGA   :sTRING[14];
  ID_TIPO_CD_TRANSPORTE:STRING[03];
  CD_TRANSPORTADOR     :STRING[14];
  NM_TRANSPORTADOR     :STRING[30];
  ID_TIPO_FRETE        :STRING[03];
  FU_MENSAGEM :sTRING[03];
  TP_PEDIDO   :STRING[03];

 nmArquivo,
 nmArquivoInterno,
 pathLocal,
 stLocalArquivo:string;
 stLinha,
 LINHA_CABECALHO :WideString;
 nrArquivo,nrItem:Integer;
 idIndicaTipoPedido:String[03];
 dsCodigoBarra,dun14:String[14];
 vlItem:Double;
 nrQuantidadePedido:Integer;
 stParteEndereco :WideString;



BEGIN
    //Abre_Fornecedor(NR_LABORATORIO_LOCAL);

  pathLocal:=ExtractFilePath(Application.ExeName);
  dsDestinoArquivo:=_cdsPedidos.FieldByName('DS_DIRETORIO_PEDIDO').AsString;
  DadosCd                    :=GetDadosCD(_cdsPedidos.FieldByName('CD_EMPRESA').AsInteger);
  nrCNPJGAMEntrega           := DadosCd.nrCNPJ;
  EANEntrega                 := DadosCd.nrEANCD;
  nmRazaoSocialEntrega       := DadosCd.dsRazaoSocial;
  dsLogradouroEntrega        := DadosCd.stENDERECO+','+DadosCd.nrLogradouro;
  dsBairroEntrega            := DadosCd.stBAIRRO;
  dsMunicipioEntrega         := DadosCd.stCIDADE;
  dsUFGAMEntrega             := DadosCd.stEstado;
  dsCEPGAMEntrega            := DadosCd.stCEP;
  nrInscricaoEstadualEntrega :=DadosCd.nrInscricaoEstadual;


  EAN_FORNECEDOR:=_cdsPedidos.FieldByName('DS_IDENTIFICACAO_FORNECEDOR').AsString;

  if EAN_FORNECEDOR='7891024000021' then
     if confirma('Fornecedor Tem Pre?os diferenciados para canal Farma e Alimentar !!'+#13+
                 'Este Pedido ? para o canal Alimentar?',MB_DEFBUTTON2)=IDYES then
                 begin
                   if DadosCd.stEstado='RS' then
                      EANEntrega:='7890530000068';
                   if DadosCd.stEstado='SC' then
                      EANEntrega:='7890530000051'
                 end;


  CNPJ_FORNECEDOR:=_cdsPedidos.FieldByName('NR_CNPJ_FORNECEDOR').AsString;

  TIPO_REGISTRO        := '01';
  FUNCAO_MENSAGEM      := FormataString(COPY(_cbxMensagemPedido.Items.Strings[_cbxMensagemPedido.ItemIndex],1,2),3);
  TIPO_PEDIDO          := FormataString(COPY(_cbTipoCondicaoPedido.Items.Strings[_cbTipoCondicaoPedido.ItemIndex],1,3),3);
  NR_PEDIDO_ST         := FormataString(FormatFloat('000000',_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger),20);
  NR_PEDIDO_EMISSAO    := FormataString(' ',20);
  DT_HR_EMISSAO        := FormataString(FormatDateTime('YYYYMMDDHHMM',_cdsPedidos.FieldByName('DT_PEDIDO').AsDateTime),12);
  DT_HR_INICIO_ENTREGA := FormataString(FormatDateTime('YYYYMMDD0730',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),12);
  DT_HR_FINAL_ENTREGA  := FormataString(FormatDateTime('YYYYMMDD1730',_cdsPedidos.FieldByName('DT_PREVISTA').AsDateTime),12);
  NR_CONTRATO          := FormataString(' ',15);
  DS_LISTA_PRECO       := FormataString(' ',15);
  EAN_FORNECEDOR       := insereCaracterEsquerda(EAN_FORNECEDOR,'0',13);
  EAN_COMPRADOR        := insereCaracterEsquerda(EAN_COMPRADOR,'0',13);
  EAN_COBRANCA_FATURA  := insereCaracterEsquerda('7890530000013','0',13);;
  EAN_LOCAL_ENTREGA    := insereCaracterEsquerda(EANEntrega,'0',13);
  CNPJ_FORNECEDOR      := insereCaracterEsquerda(CNPJ_FORNECEDOR,'0',14);
  CNPJ_COMPRADOR       := insereCaracterEsquerda(nrCNPJGAMEntrega,'0',14);
  CNPJ_COBRANCA_FATURA := insereCaracterEsquerda(nrCNPJGAMCob,'0',14);
  CNPJ_LOCAL_ENTREGA   := insereCaracterEsquerda(nrCNPJGAMEntrega,'0',14);
  ID_TIPO_CD_TRANSPORTE:= FormataString(' ',03);
  CD_TRANSPORTADOR     := FormatFloat('00000000000000',0);
  NM_TRANSPORTADOR     := FormataString(' ',30);
  ID_TIPO_FRETE        := 'CIF';
  LINHA_CABECALHO:=
    TIPO_REGISTRO      +
  FUNCAO_MENSAGEM      +
  TIPO_PEDIDO          +
  NR_PEDIDO_ST         +
  NR_PEDIDO_EMISSAO    +
  DT_HR_EMISSAO        +
  DT_HR_INICIO_ENTREGA +
  DT_HR_FINAL_ENTREGA  +
  NR_CONTRATO          +
  DS_LISTA_PRECO       +
  EAN_FORNECEDOR       +
  EAN_COMPRADOR        +
  EAN_COBRANCA_FATURA  +
  EAN_LOCAL_ENTREGA    +
  CNPJ_FORNECEDOR      +
  CNPJ_COMPRADOR       +
  CNPJ_COBRANCA_FATURA +
  CNPJ_LOCAL_ENTREGA   +
  ID_TIPO_CD_TRANSPORTE+
  CD_TRANSPORTADOR     +
  NM_TRANSPORTADOR     +
  ID_TIPO_FRETE        ;
  Writeln(ARQUIVO,LINHA_CABECALHO);
END;

PROCEDURE T_frmEnvioPedido.PagamentosNeogrid;
VAR
 TIPO_REGISTRO     :STRING[02];
 CONDICAO_PAGAMENTO:STRING[03];
 REF_DATA          :STRING[03];
 REF_TEMPO         :STRING[03];
 TIPO_PERIODO      :STRING[03];
 NR_PERIODO        :STRING[03];
 DT_VENCIMENTO     :STRING[08];
 VL_A_PAGAR        :STRING[15];
 PC_A_PAGAR_VALOR  :STRING[05];
 I                 :Integer;
 LINHA_PAGAMENTO :WideString;
 nrArquivo,nrItem:Integer;

BEGIN
  _cdsCondicaoPagamentos.First;
  WHILE NOT _cdsCondicaoPagamentos.Eof DO
  BEGIN
   TIPO_REGISTRO      :='02';
   CONDICAO_PAGAMENTO := FormataString(COPY(_cbxCondicaoPagamento.Items.Strings[_cbxCondicaoPagamento.ItemIndex],1,2),3);
   REF_DATA           := FormataString(COPY(_cbxDataReferencia.Items.Strings[_cbxDataReferencia.ItemIndex],1,2),3);
   REF_TEMPO          := FormataString(COPY(_cbxReferenciaTempo.Items.Strings[_cbxReferenciaTempo.ItemIndex],1,2),3);
   TIPO_PERIODO       := FormataString(COPY(_cbxTipoPeriodo.Items.Strings[_cbxTipoPeriodo.ItemIndex],1,2),3);
   NR_PERIODO         := FormatFloat('000',_cdsCondicaoPagamentosNR_DIAS.AsInteger);
   DT_VENCIMENTO      := FormatDateTime('yyyymmdd',_cdsCondicaoPagamentosDT_PAGAMENTOS.AsDateTime);
   VL_A_PAGAR         := AnsiReplaceStr(FormatFloat('0000000000000.00',_cdsCondicaoPagamentosVL_PARCELAS.AsFloat),',','');
   PC_A_PAGAR_VALOR   := AnsiReplaceStr(FormatFloat('000.00',_cdsCondicaoPagamentosPC_PARCELAS.AsFloat),',','');
   LINHA_PAGAMENTO    :=
   TIPO_REGISTRO      +
   CONDICAO_PAGAMENTO +
   REF_DATA           +
   REF_TEMPO          +
   TIPO_PERIODO       +
   NR_PERIODO         +
   DT_VENCIMENTO      +
   VL_A_PAGAR         +
   PC_A_PAGAR_VALOR   ;
   Writeln(ARQUIVO,LINHA_PAGAMENTO);
   _cdsCondicaoPagamentos.Next;
 END;
END;



PROCEDURE T_frmEnvioPedido.ITENS;
VAR
  TIPO_REGISTRO             : STRING[02];
  NR_SEQUENCIAL_ST          : STRING[04];
  NR_SEQUENCIAL_PEDIDO      : STRING[05];
  ID_QUALIFICACAO           : STRING[03];
  ID_TIPO_CD_PRODUTO        : STRING[03];
  CD_PRODUTO                : STRING[14];
  DS_PRODUTO                : STRING[40];
  DS_REFERENCIA             : STRING[20];
  ID_UNIDADE_MEDIDA         : STRING[03];
  NR_UNID_EMB_CONSUMO       : STRING[05];
  QT_PEDIDO                 : STRING[15];
  QT_BONIFICADA             : STRING[15];
  QT_TROCA                  : STRING[15];
  ID_TIPO_EMBALAGEM         : STRING[03];
  NR_EMBALAGENS             : STRING[05];
  VT_BRUTO_LINHA            : STRING[15];
  VT_LIQUIDO_ITEM           : STRING[15];
  VL_BRUTO_LINHA            : STRING[15];
  VL_LIQUIDO_ITEM           : STRING[15];
  VL_BASE_UNITARIO          : STRING[05];
  UN_MEDIDA_BASE_VL_UNIT    : STRING[03];
  VL_UNITARIO_DESCONTO      : STRING[15];
  PC_DESCONTO_COMERCIAL     : STRING[05];
  VL_UNITARIO_IPI           : STRING[15];
  PC_ALIQUOTA_IPI           : STRING[05];
  VL_UNIT_DESP_TRIBUTADA    : STRING[15];
  VL_UNIT_DESP_NAO_TRIBUTADA: STRING[15];
  VL_ENCARDO_FRETE          : STRING[15];
  VL_IPI                    : Double;
  TOTAL_DESCONTO            :dOUBLE;
  NR_DIVISOR_CXA,
  qtPedido,
  nrTemp,dgTemp            :iNTEGER;
  idTipoCodigoBarra,
  idCaixaFechada             :String[1];
  vlPrecoFornecedor,
  vlPrecoLiquido,
  pcDescontoPadrao,
  pcDesconto,
  vlDesconto,
  vlIPI,
  vtDesconto            :Double;
  DadosProduto :TMercadoria;
  LINHA_ITEM :WideString;
  dun14 :string[14];
  pcIcmsCompra :Double;

BEGIN
   TIPO_REGISTRO             := '04';
   NR_SEQUENCIAL_ST          := formatfloat('0000',nrsequencial);
   NR_SEQUENCIAL_PEDIDO      := formatfloat('00000',nrsequencial);
   ID_QUALIFICACAO           := FormataString(' ',03);
   ID_TIPO_CD_PRODUTO        := 'EN ';


      nrTemp:=StrToIntDef(copy( FormatFloat('0000000',_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger),1,6),0);
      dgTemp:=StrToIntDef(copy( FormatFloat('0000000',_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger),7,1),0);

   vlIPI:=0;
   DadosProduto:=GetMercadoriaNova(nrTemp,dgtemp,0,DadosCd.nrCD,1,'');
   idTipoCodigoBarra:=_cdsPedidos.FieldByName('ID_CODIGO_BARRAS').AsString;
   idCaixaFechada   :=_cdsPedidos.FieldByName('ID_CAIXA_FECHADA').AsString;
   idCaixaFechada   :='N';


   CD_PRODUTO                := FormataString(_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsString,14);


  vlPrecoFornecedor          :=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;
  vlPrecoLiquido             :=_cdsItemPedido.FieldByName('PUNY_Y').AsFloat;
  pcDescontoPadrao           := _cdsItemPedido.FieldByName('ABTY_Y').AsFloat;
  pcDesconto                 := _cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                                _cdsItemPedido.FieldByName('DADY_Y').AsFloat;

  pcIcmsCompra                :=_cdsItemPedido.FieldByName('PC_ICMS_COMPRA').AsFloat;

   if DadosProduto.nrLaboratorio=100 then
   begin
     vlPrecoFornecedor := _cdsItemPedido.FieldByName('PFBY_Y').AsFloat -
                         (_cdsItemPedido.FieldByName('PFBY_Y').AsFloat *(pcDesconto/100));

     vlPrecoLiquido    := _cdsItemPedido.FieldByName('PFBY_Y').AsFloat -
                         (_cdsItemPedido.FieldByName('PFBY_Y').AsFloat *(pcDesconto/100))-
                         (_cdsItemPedido.FieldByName('PFBY_Y').AsFloat *(pcIcmsCompra/100));


   end;


   DS_PRODUTO                := FormataString(_cdsItemPedido.FieldByName('NM_COMPLETO').AsString,40);
   DS_REFERENCIA             := FormataString(' ',20);
   ID_UNIDADE_MEDIDA         := 'EA ';
   IF idTipoCodigoBarra='1' THEN
      ID_UNIDADE_MEDIDA         := 'EA ';
   IF idTipoCodigoBarra = '2' THEN
    begin
               dun14:=GetCodigoDun14(_cdsItemPedido.FieldByName('NROM_Y').AsInteger,DadosCd.nrCD);
               if trim(dun14)<>'' then
                  CD_PRODUTO:=trim(dun14);
   end;
   CD_PRODUTO      := FormataString(CD_PRODUTO,14);
   NR_DIVISOR_CXA:=1;
   IF idCaixaFechada='S' THEN
      NR_DIVISOR_CXA  :=   _cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger;
   NR_UNID_EMB_CONSUMO       := FormatFloat('00000',_cdsItemPedido.FieldByName('QT_EMBALAGEM_COMPRA').AsInteger);
   //Se pedido for bonificado
   // sera preenchodo apenas o campo quantidade bonificada
    qtPedido:=0;
   if (_cdsItemPedido.FieldByName('VCCI_Y').AsFloat>0)  and  (_cbTipoCondicaoPedido.ItemIndex<>2) then
        qtPedido                  :=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
     QT_PEDIDO                 := AnsiReplaceStr(FormatFloat('0000000000000.00',qtPedido/NR_DIVISOR_CXA),',','');

   QT_BONIFICADA             := AnsiReplaceStr(FormatFloat('0000000000000.00',0),',','');
   if  (_cdsItemPedido.FieldByName('VCCI_Y').AsFloat=0) or (_cbTipoCondicaoPedido.ItemIndex=2)  then
   begin
        qtPedido                  :=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
       QT_BONIFICADA             := AnsiReplaceStr(FormatFloat('0000000000000.00',qtPedido/NR_DIVISOR_CXA),',','')
   end;

   QT_TROCA                  := AnsiReplaceStr(FormatFloat('0000000000000.00',0),',','');
   ID_TIPO_EMBALAGEM         := FormataString(' ',03);
   NR_EMBALAGENS             := FormataString('00000',05);
   VT_BRUTO_LINHA            := AnsiReplaceStr(FormatFloat('0000000000000.00',(qtPedido * vlPrecoFornecedor)),',','');
   VT_LIQUIDO_ITEM           := AnsiReplaceStr(FormatFloat('0000000000000.00',qtPedido * vlPrecoLiquido),',','');
   VL_BRUTO_LINHA            := AnsiReplaceStr(FormatFloat('0000000000000.00',vlPrecoFornecedor*NR_DIVISOR_CXA),',','');
   VL_LIQUIDO_ITEM           := AnsiReplaceStr(FormatFloat('0000000000000.00',vlPrecoLiquido*NR_DIVISOR_CXA),',','');
   VL_BASE_UNITARIO          := FormataString('00000',05);
   UN_MEDIDA_BASE_VL_UNIT    := FormataString(' ',03);
   TOTAL_DESCONTO            := pcDesconto;
   PC_DESCONTO_COMERCIAL     := AnsiReplaceStr(FormatFloat('000.00',pcDesconto),',','');
   vlDesconto                :=CalculaValorDesconto(vlPrecoFornecedor,pcDesconto);

   VL_UNITARIO_DESCONTO      := AnsiReplaceStr(FormatFloat('0000000000000.00',vlDesconto),',','');
   vtDesconto                := vtDesconto + vlDesconto;
//   VL_IPI                    := precoLiquido(DM_Novo.SQL_CDS_ITEM_PEDIDONROM_Y.AsInteger,DM_Novo.SQL_CDS_ITEM_PEDIDOPFBY_Y.AsFloat);
   vtPedidoLiquido           := vtPedidoLiquido     + (vlPrecoLiquido * qtPedido);
   vtPedidoBruto             := vtPedidoBruto       + (vlPrecoFornecedor * qtPedido);
   if DadosProduto.pcIpiProduto>0 then
      vlIPI                     := (vlPrecoFornecedor +  (DadosProduto.pcIpiProduto/100) * qtPedido);
   vtDesconto                := vtDesconto + (qtPedido * (vlPrecoFornecedor - vlPrecoLiquido));
   vtDescontoComercial       := vtDescontoComercial  +(vlDesconto*qtPedido);

   VL_UNITARIO_IPI           := AnsiReplaceStr(FormatFloat('0000000000000.00',vlIPI),',','');
   PC_ALIQUOTA_IPI           := AnsiReplaceStr(FormatFloat('000.00',DadosProduto.pcIpiProduto),',','');
   VL_UNIT_DESP_TRIBUTADA    := AnsiReplaceStr(FormatFloat('0000000000000.00',0),',','');
   VL_UNIT_DESP_NAO_TRIBUTADA:= AnsiReplaceStr(FormatFloat('0000000000000.00',0),',','');
   VL_ENCARDO_FRETE          := AnsiReplaceStr(FormatFloat('0000000000000.00',0),',','');
   LINHA_ITEM:=
   TIPO_REGISTRO             +
   NR_SEQUENCIAL_ST          +
   NR_SEQUENCIAL_PEDIDO      +
   ID_QUALIFICACAO           +
   ID_TIPO_CD_PRODUTO        +
   CD_PRODUTO                +
   DS_PRODUTO                +
   DS_REFERENCIA             +
   ID_UNIDADE_MEDIDA         +
   NR_UNID_EMB_CONSUMO       +
   QT_PEDIDO                 +
   QT_BONIFICADA             +
   QT_TROCA                  +
   ID_TIPO_EMBALAGEM         +
   NR_EMBALAGENS             +
   VT_BRUTO_LINHA            +
   VT_LIQUIDO_ITEM           +
   VL_BRUTO_LINHA            +
   VL_LIQUIDO_ITEM           +
   VL_BASE_UNITARIO          +
   UN_MEDIDA_BASE_VL_UNIT    +
   VL_UNITARIO_DESCONTO      +
   PC_DESCONTO_COMERCIAL     +
   VL_UNITARIO_IPI           +
   PC_ALIQUOTA_IPI           +
   VL_UNIT_DESP_TRIBUTADA    +
   VL_UNIT_DESP_NAO_TRIBUTADA+
   VL_ENCARDO_FRETE          ;
   Writeln(ARQUIVO,LINHA_ITEM);
END;
PROCEDURE T_frmEnvioPedido.SUMARIO;
VAR
 TIPO_REGISTRO           : STRING[02];
 VT_MERCADORIA_ST        : STRING[15];
 VT_IPI_ST               : STRING[15];
 VT_ABATIMENTO_ST        : STRING[15];
 VT_ENCARGO_ST           : STRING[15];
 VT_DESCONTO_ST          : STRING[15];
 VT_DESPESAS_TRIBUTADA_ST: STRING[15];
 VT_DESPESAS_NA0_TRIB_ST : STRING[15];
 VT_PEDIDO_ST            : STRING[15];
 LINHA_SUMARIO :WideString;

BEGIN
   TIPO_REGISTRO:='09';
   VT_MERCADORIA_ST        :=AnsiReplaceStr(FormatFloat('0000000000000.00',vtPedidoBruto),',','');
   VT_IPI_ST               :=AnsiReplaceStr(FormatFloat('0000000000000.00',vtIPI),',','');
   VT_ABATIMENTO_ST        :=AnsiReplaceStr(FormatFloat('0000000000000.00',vtDesconto),',','');
   VT_ENCARGO_ST           :=AnsiReplaceStr(FormatFloat('0000000000000.00',0),',','');
   VT_DESCONTO_ST          :=AnsiReplaceStr(FormatFloat('0000000000000.00',vtDescontoComercial),',','');
   VT_DESPESAS_TRIBUTADA_ST:=AnsiReplaceStr(FormatFloat('0000000000000.00',0),',','');
   VT_DESPESAS_NA0_TRIB_ST :=AnsiReplaceStr(FormatFloat('0000000000000.00',0),',','');
   VT_PEDIDO_ST            :=AnsiReplaceStr(FormatFloat('0000000000000.00',vtPedidoLiquido),',','');
   LINHA_SUMARIO:=
   TIPO_REGISTRO           +
   VT_MERCADORIA_ST        +
   VT_IPI_ST               +
   VT_ABATIMENTO_ST        +
   VT_ENCARGO_ST           +
   VT_DESCONTO_ST          +
   VT_DESPESAS_TRIBUTADA_ST+
   VT_DESPESAS_NA0_TRIB_ST +
   VT_PEDIDO_ST            ;
   Writeln(ARQUIVO,LINHA_SUMARIO);
END;



PROCEDURE T_frmEnvioPedido.ARQUIVO_NEOGRID;
var
 nmArquivo,
 nmArquivoInterno,
 pathLocal,
 stLocalArquivo:string;
 stLinha :WideString;
 nrArquivo:Integer;
 idIndicaTipoPedido:String[03];
 dsCodigoBarra,dun14:String[14];
 vlItem:Double;
 nrQuantidadePedido:Integer;
 ProcurarArquivo : TSearchRec;
 tpArquivo:TfileName;

 idEstado:string[02];
begin
  nrArquivo:=nrPedidoSequecial;
  pathLocal:=ExtractFilePath(Application.ExeName);
  dsDestinoArquivo:=_cdsPedidos.FieldByName('DS_DIRETORIO_PEDIDO').AsString;
  pathLocal:=dsDestinoArquivo+'NEOGRID';

  stLocalArquivo:=pathLocal;
    if not DirectoryExists(pathLocal) then
       ForceDirectories(pathLocal);
    idEstado:=_cdsPedidos.FieldByName('UF_PEDIDO').AsString;
  DadosCd                    :=GetDadosCD(_cdsPedidos.FieldByName('CD_EMPRESA').AsInteger);
  nrCNPJGAMEntrega           := DadosCd.nrCNPJ;
  EANEntrega                 := DadosCd.nrEANCD;
  nmRazaoSocialEntrega       := DadosCd.dsRazaoSocial;
  dsLogradouroEntrega        := DadosCd.stENDERECO+','+DadosCd.nrLogradouro;
  dsBairroEntrega            := DadosCd.stBAIRRO;
  dsMunicipioEntrega         := DadosCd.stCIDADE;
  dsUFGAMEntrega             := DadosCd.stEstado;
  dsCEPGAMEntrega            := DadosCd.stCEP;
  nrInscricaoEstadualEntrega :=DadosCd.nrInscricaoEstadual;





  IF _cdsCondicaoPagamentos.RecordCount=1 THEN
     _cbxCondicaoPagamento.ItemIndex:=0;
  if _cbTipoCondicaoPedido.ItemIndex<1 then
      _cbTipoCondicaoPedido.ItemIndex:=1;
  if _cdsPedidos.FieldByName('NR_ITENS_BONIFICADO').AsInteger>0 then
  _cbTipoCondicaoPedido.ItemIndex:=2;

  nrFornecedor :=_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger;
 // ACHA_FORNECEDOR_VAN(NR_LABORATORIO_LOCAL);
 // ACHA_PARAMENTRO_LABORATORIO(NR_LABORATORIO_LOCAL);
  IF TRIM(dsDestinoArquivo)='' THEN
  BEGIN
    Mensagem('Destino do Arquivo n?o est? configurado No Sistema '+#13+
             ' Arquivo de Pedido n?o ser? gerado'+#13+
             ' Opera??o cancelada !!! ',MB_ICONERROR );
  exit;
  END;

    nmArquivo:='PED_'+FormatFloat('0000',_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger);
    nmArquivo:=nmArquivo+'_'+idEstado+'.TXT';
   tpArquivo:=pathLocal+'\'+nmArquivo;

//    nmArquivoInterno:='ORDERS'+ FormatDateTime('yyyy',dtSistema)+FormatFloat('0000',nrArquivo);


  try
   AssignFile(ARQUIVO,pathLocal+'\'+nmArquivo);
   Rewrite(ARQUIVO);

   CABECALHONEOGRID;
   PagamentosNeogrid;
   nrsequencial:=0;
   vtPedidoBruto            :=0;
   vtIPI                    :=0;
   vtDesconto               :=0;
   vtPedidoLiquido          :=0;
   vtDescontoComercial      :=0;
   _cdsItemPedido.First;
   while NOT _cdsItemPedido.Eof DO
   BEGIN
        inc(nrsequencial);
        ITENS;
     _cdsItemPedido.Next;
   end;
   SUMARIO;
   CloseFile(ARQUIVO);
   Mensagem('Arquivo Gerado'+#13+    pathLocal+'\'+nmArquivo,MB_ICONINFORMATION);
         if FindFirst(stLocalArquivo+'\'+nmArquivo, FaAnyFile, ProcurarArquivo) =0 then
           NrTamanhoArquivo := Int64(ProcurarArquivo.FindData.nFileSizeHigh) SHL Int64(32) +
                            Int64(ProcurarArquivo.FindData.nFileSizeLow);

        stNomePrincipalArquivo:=ExtractNameSISTEMA(tpArquivo);
       if nrBase=1 then
        begin
         TransNmArquivo:=nmArquivo;
         //stNomePrincipalArquivo:=nmArquivo;
         TransDsLocalArquivo:=stLocalArquivo;
         TransDsDestinoArquivo:='/';
         TransDsTNSMAQUINA:='10.10.1.127';
         TransNmUsuario:='ricardo';
         TransDsSenhaUsuatio:='ftp@gam..';
        end;
          if confirma('Aten??o'+#13+
              'A Confirma??o deste Processo Transmitir? um Pedido'+#13+
              'automaticamete para o Laboratorio'+#13+
              formatfloat('####0',_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger)+'  -  '+
              _cdsPedidos.FieldByName('DS_GRUPO_FORNECEDOR').AsString+#13+
              'Transmitir o Pedido ?',MB_DEFBUTTON2 )=idyes then
          begin
               CriaTelaTransferenciaArquivo;
                 AtualizaDataTransmissao(_cdsPedidos.FieldByName('NR_PEDIDO').AsInteger,_cdsPedidos.FieldByName('NR_FORNECEDOR').AsInteger,DadosCd.nrCD);

          end;



  except
        CloseFile(ARQUIVO);
  end;

    END;


function T_frmEnvioPedido.CalculaValorDesconto(PvlFornecedor,PpcDesconto:Double):Double;
BEGIN
   RESULT:=PvlFornecedor * (PpcDesconto/100);
END;

procedure T_frmEnvioPedido.CarregaOperacaoRede;
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

     _cbxOperacaoRede.Items.Add(FormatFloat('00',0)+' - '+
                                  FormatFloat('00',0)+' - '+
                                  'Todos' );
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

end.
