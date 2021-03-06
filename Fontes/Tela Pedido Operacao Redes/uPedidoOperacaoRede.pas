unit uPedidoOperacaoRede;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, DB, DBClient, Buttons,
  ComObj,StrUtils,uAuxiliarCompras, uRotinasGenericas, uProduto,sqlExpr, SHELLAPI;

type
  T_frmPedidosRedes = class(TForm)
    _stbMessagem: TStatusBar;
    _grbFiltroRede: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    _dtpDtInicio: TDateTimePicker;
    _dtpDtFinal: TDateTimePicker;
    _edtNumeroComprador: TEdit;
    _edtNumeroFornecedor: TEdit;
    _rgStatus: TRadioGroup;
    Label6: TLabel;
    _btnPesquisa: TBitBtn;
    _dspedido: TDataSource;
    _cdsPedido: TClientDataSet;
    _cdsPedidoNR_TOTAL_ITENS: TAggregateField;
    _cdsPedidoNR_TOTAL_UNIDADES: TAggregateField;
    _cdsPedidoVL_PEDIDO_FORNECEDOR: TAggregateField;
    _cdsPedidoVL_PEDIDO_CUSTO: TAggregateField;
    _cdsPedidoNR_UNIDADES_FAT: TAggregateField;
    _cdsPedidoQT_UNIDADES_FAT: TAggregateField;
    _cdsPedidoVL_FATURADO_CUSTO: TAggregateField;
    _cdsPedidoVL_FATURADO_FORNEC: TAggregateField;
    _cdsPedidoVL_PED_LIQUIDO: TAggregateField;
    _cdsPedidoVL_FATURADO_LIQUIDO: TAggregateField;
    _cdsItemPedido: TClientDataSet;
    _dsItemPedido: TDataSource;
    GroupBox4: TGroupBox;
    _dbgItemPedido: TDBGrid;
    GroupBox2: TGroupBox;
    _dbgCapaPedido: TDBGrid;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    _btnExecuta: TBitBtn;
    _bitFechar: TBitBtn;
    _btnParaExcel: TBitBtn;
    _edtTotalItens: TEdit;
    _edtNumerosUnidades: TEdit;
    _edtTotalPedidoCompra: TEdit;
    _edtTotalPedidoForncedor: TEdit;
    _edtNumeroItensFaturado: TEdit;
    _edtQuantidadeFaturada: TEdit;
    _edtTotaFaturadoCompra: TEdit;
    _edtTotalFaturaroFornec: TEdit;
    _btnExcelPedido: TBitBtn;
    DBGrid3: TDBGrid;
    _btnImprimir: TBitBtn;
    _chkRelatorioPrecoCusto: TCheckBox;
    _chkMostraDesconto: TCheckBox;
    _chkSomenteItemAtivos: TCheckBox;
    _edtTotalPedidoLiquido: TEdit;
    _cdsCondicaoPagamentos: TClientDataSet;
    _cdsCondicaoPagamentosNR_PARCELAS: TAutoIncField;
    _cdsCondicaoPagamentosNR_DIAS: TIntegerField;
    _cdsCondicaoPagamentosPC_PARCELAS: TFloatField;
    _cdsCondicaoPagamentosVL_PARCELAS: TFloatField;
    _cdsCondicaoPagamentosDT_PAGAMENTOS: TDateField;
    _dsCondicaoPagamentos: TDataSource;
    Label1: TLabel;
    _cbxOperacaoRede: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _dspedidoDataChange(Sender: TObject; Field: TField);
    procedure _dbgCapaPedidoDblClick(Sender: TObject);
    procedure _dbgCapaPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgItemPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnExcelPedidoClick(Sender: TObject);
    procedure _bitFecharClick(Sender: TObject);
    procedure _dbgCapaPedidoCellClick(Column: TColumn);
    procedure _dbgItemPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnParaExcelClick(Sender: TObject);
  private
    procedure PesquisaPedido;
    function AbrePedidosCompradorNovo(PnrComprador, PnrFornecedor: Integer;
      PidSituacao: String; PcdSituacao: Integer; PdtInicio, PdtFinal: TDateTime;
      PcdOperacaoRede: Integer): TClientDataSet;
    procedure SetGridPedidos;
    procedure SetGridItemPedido;
    procedure AbreItensPedidos(PnrPedido: Integer);
    function getCondicaoPagamento(nrcondicao: Integer): Boolean;
    procedure GerarExcelPedido;
    procedure AJustaParcelas;
    function setCondicaoPagamento(nrParcela, nrDias: Integer; pcParcela,
      vlParcela: Double; dtPagamento: TDATE): Boolean;
    procedure CarregaOperacaoRede;
    function GerarExcelPedidoCSV: String;
    procedure AjustaEmpresaDestino;
    procedure GerarExcelRelatarioCapaPedido(Consulta: TclientdataSet);
    { Private declarations }
  public
    { Public declarations }
    NR_TOTAL_ITENS,
    NR_TOTAL_UNIDADES,
    NR_UNIDADES_FAT,
    QT_UNIDADES_FAT   :Integer;

    VL_PEDIDO_CUSTO,
    VL_PEDIDO_FORNECEDOR,
    VL_FATURADO_CUSTO,
    VL_FATURADO_FORNEC :Double;
    idNavegando,idItemBonifiacado:Boolean;
    stCondicao:String;
        DadosPedido :TDadosValoresPedido;




  end;

var
  _frmPedidosRedes: T_frmPedidosRedes;

implementation

uses uDm, uSistemaCompras;



{$R *.dfm}

procedure T_frmPedidosRedes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;



procedure T_frmPedidosRedes.FormShow(Sender: TObject);
begin
   CarregaOperacaoRede;
  _dtpDtInicio.DateTime:=dtSistema-7;
  _dtpDtFinal.DateTime:=dtSistema;
  _edtNumeroComprador.Text:=IntToStr(nrCompradorSistema);

end;

procedure T_frmPedidosRedes.PesquisaPedido;
var
 dtInicio,dtFinal :String[10];
 idStatus :String[10];
 nrOperacaoRede:Integer;
begin
  //inherited;
  case _rgStatus.ItemIndex of
    0: idStatus:=' ';
    1: idStatus:='F';
    2: idStatus:='N';
    3: idStatus:='Z';
  end;
 nrOperacaoRede   := StrToIntDef(copy(_cbxOperacaoRede.Text,1,3),0);

  if nrOperacaoRede=0 then
  begin
    Mensagem('Informe Nr. da Opera??o rede!!!!',MB_ICONWARNING);
    _cbxOperacaoRede.SetFocus;
    exit;
  end;

  _cdsItemPedido.Close;
  _cdsItemPedido.Close;
  dtInicio:=FormatDateTime('dd/mm/yyyy',_dtpDtInicio.Date);
  dtFinal:=FormatDateTime('dd/mm/yyyy',_dtpDtFinal.Date);
  AbrePedidosCompradorNovo(StrToIntDef(_edtNumeroComprador.Text,nrCompradorSistema),
                           StrToIntDef(_edtNumeroFornecedor.Text,0),
                           idStatus,
                           _rgStatus.ItemIndex,
                           StrToDateDef(dtInicio,dtSistema)
                          ,StrToDateDef(dtFinal,dtSistema),nrOperacaoRede);
  if _cdsPedido<>nil then
  begin
     _cdsPedido.ControlsDisabled;
    _cdsItemPedido.DisableControls;
     _dspedido.DataSet:=_cdsPedido;
    _cdsPedido.Open;
     if not _cdsPedido.IsEmpty then
    begin
        _btnParaExcel.Enabled:=True;
        _btnExcelPedido.Enabled:=true;
        getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);



        NR_TOTAL_ITENS   :=StrToIntDef(FormatFloat('########0',_cdsPedidoNR_TOTAL_ITENS.AsVariant),0);
        NR_TOTAL_UNIDADES:=StrToIntDef(FormatFloat('########0',_cdsPedidoNR_TOTAL_UNIDADES.AsVariant),0);
        NR_UNIDADES_FAT  :=StrToIntDef(FormatFloat('########0',_cdsPedidoNR_UNIDADES_FAT.AsVariant),0);
        QT_UNIDADES_FAT  :=StrToIntDef(FormatFloat('########0',_cdsPedidoQT_UNIDADES_FAT.AsVariant),0);


        VL_PEDIDO_CUSTO     := _cdsPedidoVL_PEDIDO_CUSTO.AsVariant;
        VL_PEDIDO_FORNECEDOR:= _cdsPedidoVL_PEDIDO_FORNECEDOR.AsVariant;
        VL_FATURADO_CUSTO   := _cdsPedidoVL_FATURADO_CUSTO.AsVariant;
        VL_FATURADO_FORNEC  := _cdsPedidoVL_FATURADO_FORNEC.AsVariant;

       _edtTotalItens.Text           :=FormatFloat('###,###,##0',NR_TOTAL_ITENS);
       _edtNumerosUnidades.Text      :=FormatFloat('###,###,##0',NR_TOTAL_UNIDADES);
       _edtNumeroItensFaturado.Text  :=FormatFloat('###,###,##0',NR_UNIDADES_FAT);
       _edtQuantidadeFaturada.Text   :=FormatFloat('###,###,##0',QT_UNIDADES_FAT);

       _edtTotalPedidoCompra.Text    :=FormatFloat('###,###,##0.00',_cdsPedidoVL_PEDIDO_CUSTO.AsVariant);
       _edtTotalPedidoForncedor.Text :=FormatFloat('###,###,##0.00',_cdsPedidoVL_PEDIDO_FORNECEDOR.AsVariant);
       _edtTotaFaturadoCompra.Text   :=FormatFloat('###,###,##0.00',_cdsPedidoVL_FATURADO_CUSTO.AsVariant);
       _edtTotalFaturaroFornec.Text  :=FormatFloat('###,###,##0.00',_cdsPedidoVL_FATURADO_FORNEC.AsVariant);

       _edtTotalPedidoLiquido.Text  :=FormatFloat('###,###,##0.00',_cdsPedidoVL_PED_LIQUIDO.AsVariant);



  end;
  _cdsPedido.EnableControls;
  _cdsItemPedido.EnableControls;
  end;
  idNavegando:=true;
  //setDesabilitaEdicaoItem;

end;





procedure T_frmPedidosRedes._bitFecharClick(Sender: TObject);
begin
 CLOSE;
end;

procedure T_frmPedidosRedes._btnExcelPedidoClick(Sender: TObject);
begin
  AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
  getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);
  GerarExcelPedido;

end;
Procedure T_frmPedidosRedes.GerarExcelPedido;
var
     coluna, linha,nrLinaInicial: integer;
     excel: variant;
     valor: String ;
     data,dsCondicaoPagamento,
     nmFornecedor  :String;
     tipo : TFieldType;
     vlDefault :Variant;
     DadosCd :TDadosCD;
     DadosValoresPedido:TDadosValoresPedido;
     stObs,VersaoExcel,nmArquivo:String;
     vlItemPedido,pcDescontoItem:Double;
     dsNmPlanilha,sVersaoExcel,stExtrensao:String;
     idPedidoPsico:Boolean;
     DadosFornecedor:TDadosFornecedor;



begin
try
          excel:=CreateOleObject('Excel.Application');
          excel.Workbooks.add(1);
         VersaoExcel:=excel.version;

     except
         // Application.MessageBox ('Vers?o do Ms-Excel Incompat?vel','Erro',MB_OK+MB_ICONEXCLAMATION);
          VersaoExcel:=EmptyStr;

     end;

     if VersaoExcel=EmptyStr then
     begin
      nmArquivo:=  GerarExcelPedidoCSV;
      try
       if _cdsPedido<>nil then
       begin
        ShellExecute(Handle, 'Open', pchar(nmArquivo), nil, 'C:\TEMP\', SW_SHOWNORMAL);
        Mensagem('Arquivo Gerado!!!',MB_ICONQUESTION);
        exit;

      end;
      except
        begin
           Mensagem('Arquivo com mesmo nome em uso...'#13+
                    'Feche para poder abrir Planilha!!!',MB_ICONERROR);
         exit;
        end;
      end;
     end;
     nrLinaInicial:=4;

     //Se a vers?o do excel form 2007 ou superior salva em XLSX
      sVersaoExcel := Format('Excel Version %s: ', [EXCEL.Version]);
      stExtrensao:='.xls';
      if sVersaoExcel >= 'Excel Version 12.0' then
        stExtrensao := '.xls' ;
  //Se a vers?o do excel for inferior ao 2007 ent?o salva no formato XLS

     DadosValoresPedido:=GetValoresPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,false);
     DadosCd:=GetDadosCD(DadosValoresPedido.cdEmpresa);
     getCondicaoPagamento(DadosValoresPedido.nrCondicaoPagamento);
     DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);

     excel.Workbooks[1].WorkSheets[1].Name := 'Pedido - '+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger);
     excel.Workbooks[1].WorkSheets['Pedido - '+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger)];


      if not DirectoryExists(dsLocalPanilha) then
       ForceDirectories(dsLocalPanilha);

     //_cdsPedido.First;
     try
        excel.cells[01,01]:='Gen?sio A. Mendes & Cia Ltda';
        //Formatando c?lulas escritas
         excel.range['A1','A1'].Font.Bold      := true;
        excel.cells[02,01]:='Pedido de Compra :'+_cdsPedido.FieldByName('NROP_P').AsString;
        excel.cells[03,01]:='Data Pedido      :'+FormatDateTime('DD/MM/YYYY',_cdsPedido.FieldByName('DT_PEDIDO').AsDateTime);
        excel.cells[04,01]:='Cond. Pagamento  :'+ stCondicao;


        excel.cells[06,01]:='Observa??es';
        //Formatando c?lulas escritas
         excel.range['A6','A6'].Font.Bold      := true;
        excel.cells[07,01]:=' Informar Nr. do Nosso Pedido '+_cdsPedido.FieldByName('NROP_P').AsString+' na Nota Fiscal/Danfe em Dados Adicionais';
        excel.cells[08,01]:=' E no XML informar no campo correspondente (Tag compra x Ped)';

//        dsNmPlanilha:='Pedido_'+trim(,'/','_',[rfReplaceAll]))+'_'+_cdsPedido.FieldByName('NROP_P').AsString+'_'+DadosCd.stEstado +stExtrensao;
        nmFornecedor:=TrocaCaracterEspecial(DadosFornecedor.dsGrupoFornecedor,true);
        dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.xls';

     //    excel.Name:=dsNmPlanilha;

        stObs:=DadosValoresPedido.stObservacaoPedido;
        idPedidoPsico:=false;
        if AnsiContainsStr(stObs,'Psicotr?picos') then
        begin
           idPedidoPsico:=true;
           dsNmPlanilha:='Pedido_'+trim(StringReplace(_cdsPedido.FieldByName('NM_FORNECEDOR').asstring,'/','_',[rfReplaceAll]))+'_'+_cdsPedido.FieldByName('NROP_P').AsString+'_Psicotropicos'+'_'+DadosCd.stEstado+stExtrensao
        end;
        if (DadosValoresPedido.nrPedidoVinculado>0)  then
           stObs:= stObs + ' Existe outro Pedido Vinculado a Este --> '+FormatFloat('000000',DadosValoresPedido.nrPedidoVinculado);
       if trim(stObs)<>''  then
       begin
           excel.cells[10,01]:='Importante.:'+trim(stObs);
                   //Formatando c?lulas escritas
         excel.range['A10','A10'].Font.Bold      := true;

       end;

            (* ==== Formata??o Cor da linha contorno ==== *)
{
         ColorIndex := 1 - Preto
         ColorIndex := 2 - Branco
         ColorIndex := 3 - Vermelho
         ColorIndex := 4 - Verde Claro
         ColorIndex := 5 - Azul
         ColorIndex := 6 - Amarelo
         ...
         ColorIndex := 56 - Cinza Escuro
}


        excel.cells[12,01]:='CNPJ para Faturamento : '+ DadosCd.nrCNPJ;
        excel.cells[13,01]:='Endere?o de Entrega ';
                //Formatando c?lulas escritas
         excel.range['A13','A13'].Font.Bold      := true;
         excel.range['A13','A13'].Font.ColorIndex := 1;//Cor da linha: Preto


        excel.cells[14,01]:=TrimRight(DadosCd.stENDERECO)+', N?.: '+DadosCd.nrLogradouro;
        excel.cells[15,01]:='Bairro.: '+DadosCd.stBAIRRO;
        excel.cells[16,01]:='Cidade.: '+TrimRight(DadosCd.stCIDADE)+'    UF.:'+DadosCd.stEstado;
        excel.range['A16','A16'].Font.Bold      := true;
        excel.range['A16','A16'].Font.ColorIndex := 3;//Cor da linha: Preto

        excel.cells[17,01]:='CEP.:'+DadosCd.stCEP;

        excel.cells[18,01]:='Cod. GAM';
        excel.cells[18,02]:='Cod.Fornec.';
        excel.cells[18,03]:='Cod.EAN';

        excel.cells[18,04]:='Qtdade';
        excel.cells[18,05]:='Nome e Apresenta??o';
        excel.cells[18,06]:='P?o. Unit.';
        excel.cells[18,07]:='% Desconto';
        excel.cells[18,08]:='Total Unit.';
        linha:=18;
        coluna:=1;
        excel.range['A18','G18'].Font.Bold      := true;
        _cdsItemPedido.First;
         while not _cdsItemPedido.Eof do
         begin

           if _chkRelatorioPrecoCusto.Checked then
               vlItemPedido:=_cdsItemPedido.FieldByName('PUNY_Y').AsFloat
           else
               vlItemPedido:=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;

           if _chkMostraDesconto.Checked then
               pcDescontoItem:=_cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                               _cdsItemPedido.FieldByName('DADY_Y').AsFloat
           else
             pcDescontoItem:=0;

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,01]:=_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,02]:=_cdsItemPedido.FieldByName('CD_INTERNO_LABORATORIO').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03]:=_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03].NumberFormat:='#############0_);(#############0)';
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04]:=_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04].NumberFormat:='#.##0_);( #.##0,00)';
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,05]:=_cdsItemPedido.FieldByName('NM_MERCADORIA').AsString+' '+
                                                           _cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString ;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06]:=vlItemPedido;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06].NumberFormat:='#.##0,00_);( #.##0,00)';


           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07]:=pcDescontoItem;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07].NumberFormat:='#.##0,00_);( #.##0,00 %)';

           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=vlItemPedido*
                                                          _cdsItemPedido.FieldByName('QUAY_Y').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08].NumberFormat:='#.##0,00_);( #.##0,00 )';
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.LineStyle := 1;
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.Weight := 2;
            excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.ColorIndex := 1;

           inc(linha);
           inc(coluna);
           _cdsItemPedido.Next;
         end;
       // end;                                                          _cdsPedido.AsVariant
             // Define o tamanho das Colunas (basta fazer em uma delas e as demais ser?o alteradas)
         excel.range['A19'].ColumnWidth := 10;  // Cod. GAM
         excel.range['B19'].ColumnWidth := 20;  //Cod.Fornec.';
         excel.range['C19'].ColumnWidth := 14; //Cod.EAN';
         excel.range['D19'].ColumnWidth := 10; // excel.cells[18,04]:='Qtdade';
         excel.range['E19'].ColumnWidth := 35; //Nome e Apresenta??o';
         excel.range['F19'].ColumnWidth := 14;// 'P?o. Unit.';
         excel.range['G19'].ColumnWidth := 14; //'% Desconto';
         excel.range['H19'].ColumnWidth := 14; //'Total Unit.';

         excel.range['A18','H18'].Borders.LineStyle := 1;
         excel.range['A18','H18'].Borders.Weight := 2;
         excel.range['A18','H18'].Borders.ColorIndex := 1;
         excel.Cells[linha+1,1].formula := 'Nr. de Unidades';
         excel.Cells[linha+1,5].formula := 'Total do Pedido (R$) ';
         //Mesclando C?lulas
         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].MergeCells := true;
         excel.range['E'+inttostr(linha+1),'G'+inttostr(linha+1)].MergeCells := true;

         {alinhamento horizontal no centro}
         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].HorizontalAlignment := 3;
         excel.range['E'+inttostr(linha+1),'G'+inttostr(linha+1)].HorizontalAlignment := 3;


         excel.range['A'+inttostr(linha+1),'B'+inttostr(linha+1)].MergeCells := true;
         excel.Cells[linha+1,4].formulaLocal := '=Soma(D19:D'+inttostr(linha)+')';
         excel.Cells[linha+1,8].formulalocal := '=Soma(H19:H'+inttostr(linha)+')';
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.LineStyle := 1;
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.Weight := 3;
         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Borders.ColorIndex := 1;

         //Formatando c?lulas escritas

         excel.range['A'+inttostr(linha+1),'H'+inttostr(linha+1)].Font.Bold      := true;
        //  Se for salvar a aplica??o totalmente criada:
        excel.ActiveWorkBook.Saveas(dsLocalPanilha+'\'+dsNmPlanilha,56);
 //       if  saveExcel.es(dsNmPlanilha);

   //     excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
      begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
          excel.quit;
      end;
     end;
     _cdsItemPedido.EnableControls;

     //excel.quit;
end;

procedure T_frmPedidosRedes._btnParaExcelClick(Sender: TObject);
begin
  GerarExcelRelatarioCapaPedido(_cdsPedido);

end;

procedure T_frmPedidosRedes._btnPesquisaClick(Sender: TObject);
begin
idNavegando:=False;

AjustaEmpresaDestino;

PesquisaPedido;
end;



procedure T_frmPedidosRedes._dbgCapaPedidoCellClick(Column: TColumn);
Var
 stColuna :String;
begin
 if _cdsPedido<>nil then
 begin
  if not _cdsPedido.IsEmpty then
  begin

   AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
   _cdsItemPedido.Filtered:=false;
   if _chkSomenteItemAtivos.Checked then
   begin
      with  _cdsItemPedido do
      begin
         Filter:='SITY_Y=''N''';
         Filtered:=true;
      end;
   end;

  stColuna:=_dbgCapaPedido.SelectedField.FieldName;
  if stColuna='ID_TRANSMISSAO' then
     if Confirma('Deseja marca como transmitido o Pedido ?',MB_DEFBUTTON2)=IDYES then
     begin
         AtualizaDataTransmissao(_cdspedido.FieldByName('NROP_P').AsInteger,
                                 _cdspedido.FieldByName('LABP_P').AsInteger,
                                 _cdspedido.FieldByName('CD_EMPRESA').AsInteger);
     end;
  end;
 end;

end;

procedure T_frmPedidosRedes._dbgCapaPedidoDblClick(Sender: TObject);
begin
  AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
  if True then

end;

procedure T_frmPedidosRedes._dbgCapaPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with _dbgCapaPedido do
  begin
    If odd(_dspedido.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
 end;
  if( _cdsPedido.FieldByName('CD_OPERADOR_LOGISTICO').AsInteger>1) then
 begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clAqua;
 end;

 if( _cdsPedido.FieldByName('NR_ITENS').AsInteger=
    _cdsPedido.FieldByName('NR_ITENS_BONIFICADO').AsInteger) then
 begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:= clBlue;
 end;

 if (Column.Field.FieldName = 'LOCAL_CD') then
 begin
  if _cdsPedido.FieldByName('LOCAL_CD').AsString='SC' then
  begin
    Canvas.brush.Color:= clGreen;
    Canvas.Font.Color:= clwhite;
  end;
  if _cdsPedido.FieldByName('LOCAL_CD').AsString='RS' then
  begin
    Canvas.brush.Color := $000080FF;
    Canvas.Font.Color := clBlack;
  end;

end;


 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clYellow;
    Canvas.Font.Color:= clblue;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmPedidosRedes._dbgItemPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with _dbgItemPedido do
  begin
    If odd(_dsItemPedido.DataSet.RecNo) then
   begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clSkyBlue;
  end
  else
  begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:= clWhite;
  end;
(**  if (_dsItemPedido.DataSet.FieldByName('CHEY_Y').AsInteger=0) then
    begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:=clYellow;
   end;*)
 if (Column.Field.FieldName = 'VCCI_Y') then
 begin
   if (_dsItemPedido.DataSet.FieldByName('VCCI_Y').AsFloat=0) then
   begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clblue;
  end;
 end;

  if (_dsItemPedido.DataSet.FieldByName('ID_NFE_TRANSITO').AsString='S') then
  begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clGreen;
  end;


 if (Column.Field.FieldName = 'SITY_Y') then
 begin
  if (_dsItemPedido.DataSet.FieldByName('SITY_Y').AsString='C') then
  begin
    Canvas.Font.Color:= clWhite;
    Canvas.Brush.Color:=clRed;
  end;
  if (_dsItemPedido.DataSet.FieldByName('SITY_Y').AsString='F') and
     ((_dsItemPedido.DataSet.FieldByName('CHEY_Y').AsInteger=0)<>
     (_dsItemPedido.DataSet.FieldByName('QUAY_Y').AsInteger=0)) then
  begin
    Canvas.Font.Color:= clBlack;
    Canvas.Brush.Color:=clYellow;
  end;
 end;
 if(gdFocused in State) then
 begin
    Canvas.brush.Color:= clMoneyGreen;
    Canvas.Font.Color:= clBlack;
 end;
    DefaultDrawColumnCell(Rect,DataCol,Column,state);
end;

end;

procedure T_frmPedidosRedes._dbgItemPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
VAR
 idPosicao :TBookmark;
 nrPedido,
 NrProduto :Integer;
begin
   case key of
      VK_F5 : begin
                 with _dbgItemPedido do
                 begin
                    idPosicao:=_cdsItemPedido.Bookmark;
                    nrPedido :=_cdsPedido.FieldByName('NROP_P').AsInteger ;
                    NrProduto:=_cdsItemPedido.FieldByName('NROM_Y').AsInteger;
                    if _cdsItemPedido.FieldByName('SITY_Y').AsString='F' then
                    begin
                      Mensagem('Item Consta Faturado...'+#13+
                              ' N?o pode ser cancelado!!!',MB_ICONWARNING);
                      exit;

                    end;

                    if _cdsItemPedido.FieldByName('SITY_Y').AsString='C' then
                    begin
                      if Confirma('Item esta Inativo...'+#13+
                                  'Deseja Reativar o Item?',MB_DEFBUTTON2)=idYes then
                      begin
                           if  AtivarItemPedido(_cdsPedido.FieldByName('NROP_P').AsInteger ,
                                                _cdsItemPedido.FieldByName('NROM_Y').AsInteger,
                                                _cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger,
                                                'N',
                                                 nmLogin) then
                                               Mensagem('Item Pedido Ativado!!!',MB_ICONWARNING)



                           end
                           else
                             Mensagem('N?o Alterou o Status do Item!!!',MB_ICONWARNING);




                   end
                   else
                   begin
                     if _cdsItemPedido.FieldByName('ID_NFE_TRANSITO').AsString='S' then
                     begin
                     if not GetsituacaoNfe(nrPedido,NrProduto,
                                           _cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger) then
                     begin

                     if GetStatusNfe(nrPedido,NrProduto) then
                      begin
                              Mensagem('Este Item J? Foi Faturado No Fornecedor!!!'+#13+
                                       'N?o pode ser excluida!!!',MB_ICONWARNING);
                        exit;
                      end;
                     end;
                     end;




                     AlteraStatusItemPedido(_cdsPedido.FieldByName('NROP_P').AsInteger ,
                                           _cdsItemPedido.FieldByName('NROM_Y').AsInteger,
                                           _cdsItemPedido.FieldByName('CD_EMPRESA').AsInteger,nmLogin);

                    DaDosPedido:=GetValoresPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,false);
                    if DadosPedido.nrItensPedido=0 then
                       AlteraStatusPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,0,false);
                   end;


                 AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
                try
                  if DadosPedido.nrItensPedido>0 then
                     _cdsItemPedido.Bookmark:=idPosicao;
                except
                    _cdsItemPedido.First;
                end;
                end;
              end;

  end;

end;

procedure T_frmPedidosRedes._dspedidoDataChange(Sender: TObject; Field: TField);
begin
  if idNavegando then
  begin
    //_grbAlerta.Visible:=false;
    idItemBonifiacado:=false;
   if _cdsPedido.FieldByName('NR_ITENS_BONIFICADO').AsInteger>0 then
   begin
    //  _grbAlerta.Visible:=True;
      idItemBonifiacado:=true;
   end;

   AbreItensPedidos(_cdsPedido.FieldByName('NROP_P').AsInteger);
   _cdsItemPedido.Filtered:=false;
   getCondicaoPagamento(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P').AsInteger);
   if _chkSomenteItemAtivos.Checked then
   begin
      with  _cdsItemPedido do
      begin
         Filter:='SITY_Y=''N''';
         Filtered:=true;
      end;
   end;

 // _cdsCondicaoPagamentos.Close;
  end;
end;

Function T_frmPedidosRedes.AbrePedidosCompradorNovo(PnrComprador,
                               PnrFornecedor:Integer;
                               PidSituacao:String;
                               PcdSituacao:Integer;  // 0 - Todos 1 - Faturados 2 Novos 3 - Novos/Faturados/Pendentes
                               PdtInicio,PdtFinal:TDateTime;
                               PcdOperacaoRede:Integer):TClientDataSet;
var
 stQuery :TStringList;
_cdsTemp:TClientDataSet;

begin
 try

 case PcdSituacao of
    0: PidSituacao:=' ';
    1: PidSituacao:='F';
    2: PidSituacao:='N';
    3: PidSituacao:='Z';
  end;


     _cdsTemp := TClientDataSet.Create(nil);


   stQuery:=TStringList.Create;
   with stQuery do
   begin
     add('SELECT NROP_P,');
     ADD('ID_UNIDADE_FEDERACAO AS LOCAL_CD,');
     add('LABP_P,NM_FORNECEDOR,DT_PEDIDO ,');
     add('CASE');
     add('WHEN DT_TRANSMITIDO<''01/01/2039'' THEN ''TRANSMITIDO''');
     add('WHEN DT_TRANSMITIDO>=''01/01/2039'' THEN ''NAO TRANSMITIDO''');
     add('END ID_TRANSMISSAO,');
     add('DT_PREVISTA,DT_PREVISTA_FATURAMENTO,SITP_P,');
     add('SUM(NR_ITENS) AS NR_ITENS,SUM(NR_UNIDADES) AS NR_UNIDADES,');
     add('NVL(SUM(NR_CANCELADO),0) AS NR_CANCELADO,');
     add('NVL(SUM(NR_NOVO),0) AS NR_NOVO,ROUND(SUM(VL_PEDIDO_CUSTO),2) AS VL_PEDIDO_CUSTO,');
     add('SUM(VL_PED_LIQ) AS VL_PED_LIQ,');
     add('ROUND(SUM(VL_PEDIDO_FABR),2) AS VL_PEDIDO_FABR,SUM(NVL(NR_FATURADO,0)) AS NR_FATURADO,');
     add('SUM(NVL(QT_FATURADO,0)) AS QT_FATURADO,');
     add('SUM(VL_PED_FAT_LIQ) AS VL_PED_FAT_LIQ,');
     add('ROUND(SUM(VL_PED_FAT_CUSTO),2) AS VL_PEDIDO_FAT,');
     add('ROUND(SUM(VL_PED_FAT_FABR),2) AS VL_PED_FAT_FABR,');
     add('NR_CONDICAO_PAGTO_P,CD_EMPRESA,');
     add('sum(Nvl(NR_ITENS_BONIFICADO,0)) AS NR_ITENS_BONIFICADO,');
     add('CD_OPERADOR_LOGISTICO,FLAP_P,ID_UNIDADE_FEDERACAO');
     add('FROM');
     add('(SELECT');
     add('LABP_P,NROP_P,DATP_P AS DT_PEDIDO,PREP_P AS DT_PREVISTA,DT_PREVISTA_FATURAMENTO,');
     add('DS_GRUPO_FORNECEDOR AS NM_FORNECEDOR,DT_TRANSMITIDO,');
     add('SITP_P,COUNT(*) NR_ITENS,SUM(QUAY_Y) as NR_UNIDADES,');
     add('SUM(QUAY_Y *VCCI_Y) as VL_PEDIDO_CUSTO,SUM(QUAY_Y *PFBY_Y) AS VL_PEDIDO_FABR,');
     add('SUM(CHEY_Y *VCCI_Y) as VL_PED_FAT_CUSTO,SUM(CHEY_Y * PFBY_Y) AS VL_PED_FAT_FABR,');
     add('SUM(QUAY_Y * PUNY_Y) AS VL_PED_LIQ,');
     add('SUM(CHEY_Y * PUNY_Y) AS VL_PED_FAT_LIQ,');

     add('CASE');
     add('WHEN SITY_Y=''P'' THEN COUNT(*)');
     add('END NR_PARCIAL,');
     add('CASE');
     add('WHEN SITY_Y=''P'' OR SITY_Y=''F'' THEN COUNT(*)');
     add('END NR_FATURADO,');
     add('CASE');
     add('WHEN SITY_Y=''P'' OR SITY_Y=''F'' THEN Sum(CHEY_Y)');
     add('END QT_FATURADO,');
     add('CASE');
     add('WHEN SITY_Y=''C'' THEN COUNT(*)');
     add('END NR_CANCELADO,');
     add('CASE');
     add('WHEN SITY_Y=''N'' THEN COUNT(*)');
     add('END NR_NOVO,');
     add('NR_CONDICAO_PAGTO_P,CAPA.CD_EMPRESA,');
     add('CASE');
     add('WHEN QT_BONIFICADA>0 THEN COUNT(*)');
     add('END NR_ITENS_BONIFICADO,');
     add('CD_OPERADOR_LOGISTICO,FLAP_P,ID_UNIDADE_FEDERACAO');
     add('FROM');
     add('PRDDM.DC_GRUPO_FORNECEDOR GRUPO_FORNECEDOR,');
     add('PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERCADORIA,');
     add('PRDDM.DCPCC CAPA,');
     add('PRDDM.DCPCI ITEM,');
     add('ACESSO.DC_EMPRESA EMP');
     add('WHERE');
     ADD('GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR=COMPRA_MERCADORIA.CD_GRUPO_FORNECEDOR');
     add('AND COMPRA_MERCADORIA.CD_EMPRESA=EMP.CD_EMPRESA');
     add('AND NROP_P = NROP_Y');
     add('AND LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     add('AND LABP_P = GRUPO_FORNECEDOR.CD_GRUPO_FORNECEDOR');
     add('AND COMPRA_MERCADORIA.cd_empresa = CAPA.cd_empresa');
     add('AND COMPRA_MERCADORIA.CD_MERCADORIA = ITEM.NROM_Y');
     if PnrFornecedor>0 then
         add('AND LABP_P=:PnrFornecedor');
     if (PcdSituacao<>3) and (trim(PidSituacao)<>'') then
         add('AND sitp_p=:PidStatus');
     if PcdSituacao=3 then
         add('AND sitp_p in(''N'',''P'',''F'',''T'')');
     if PcdSituacao>1 then
         add('AND sity_y not in(''C'',''I'',''S'')');
     if PcdOperacaoRede>0 then
       add('AND CAPA.CD_OPERACAO_REDE=:PcdOperacao');

     if PcdOperacaoRede=0 then
     begin
       ADD('AND capa.CD_EMPRESA_DESTINO=emp.cd_empresa');
       ADD('AND EMP.id_empresa_fisica=''S''');
     end;

     if PnrComprador>0 then
        add('AND COMPRA_MERCADORIA.CD_COMPRADOR=:PnrComprador');
     add('AND DATP_P between :PdtInicio and :PdtFinal');
     add('GROUP BY LABP_P,DS_GRUPO_FORNECEDOR,SITP_P,SITY_Y,NROP_P,DATP_P,PREP_P,DT_PREVISTA_FATURAMENTO,NR_CONDICAO_PAGTO_P,CAPA.CD_EMPRESA,VCCI_Y,CD_OPERADOR_LOGISTICO,FLAP_P,ID_UNIDADE_FEDERACAO,DT_TRANSMITIDO,QT_BONIFICADA)');
     add('GROUP BY LABP_P,NM_FORNECEDOR,NROP_P,SITP_P,DT_PEDIDO,DT_PREVISTA,DT_PREVISTA_FATURAMENTO,NR_CONDICAO_PAGTO_P,CD_EMPRESA,CD_OPERADOR_LOGISTICO,FLAP_P,ID_UNIDADE_FEDERACAO,DT_TRANSMITIDO');
     add('ORDER BY DT_PEDIDO,LABP_P,NROP_P');
     stQuery.SaveToFile('c:\temp\qryRelacaoPedidoOPeracao.sql');
   end;
   with _cdsPedido do
   begin
     close;
     CommandText:=stQuery.Text;

     Params.ParamByName('PdtInicio').AsDateTime:=PdtInicio;
     Params.ParamByName('PdtFinal').AsDateTime :=PdtFinal;
     if PnrComprador>0 then
        Params.ParamByName('PnrComprador').AsInteger:=PnrComprador;
     if PnrFornecedor>0 then
       Params.ParamByName('PnrFornecedor').AsInteger:=PnrFornecedor;
     if (PcdSituacao>0) and (PcdSituacao<3) then
       Params.ParamByName('PidStatus').AsString:=PidSituacao;
     if PcdOperacaoRede>0 then
       Params.ParamByName('PcdOperacao').AsInteger:=PcdOperacaoRede;

     open;
   end;

   SetGridPedidos;
   SetGridItemPedido;
//   setDesabilitaEdicaoItem;

 finally
   FreeAndNil(stQuery);
 end;
end;


procedure T_frmPedidosRedes.SetGridPedidos;
begin
 TIntegerField(_cdsPedido.FieldByName('NROP_P')).DisplayLabel:='Nr.Pedido';
 TIntegerField(_cdsPedido.FieldByName('NROP_P')).DisplayWidth:=7;

 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayLabel:='Dt.Pedido';
 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedido.FieldByName('DT_PEDIDO')).DisplayWidth:=10;

 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayLabel:='Dt.Prevista';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA')).DisplayWidth:=10;

 TFloatField(_cdsPedido.FieldByName('VL_PED_LIQ')).DisplayLabel:='Vlr.Ped.Liquido';
 TFloatField(_cdsPedido.FieldByName('VL_PED_LIQ')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PED_LIQ')).DisplayWidth:=12;




 TStringField(_cdsPedido.FieldByName('ID_TRANSMISSAO')).DisplayLabel:='Transmitido';
 TStringField(_cdsPedido.FieldByName('ID_TRANSMISSAO')).DisplayWidth:=15;


 TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_LIQ')).DisplayLabel:='Vlr.Fatur.Liquido';
 TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_LIQ')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_LIQ')).DisplayWidth:=12;


 TDateField(_cdsPedido.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayLabel:='Dt.Faturar em';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayFormat:='dd/mm/yyyy';
 TDateField(_cdsPedido.FieldByName('DT_PREVISTA_FATURAMENTO')).DisplayWidth:=10;


 TIntegerField(_cdsPedido.FieldByName('LABP_P')).DisplayLabel:='Nr.Fornec.';
 TIntegerField(_cdsPedido.FieldByName('LABP_P')).DisplayWidth:=7;

 TStringField(_cdsPedido.FieldByName('LOCAL_CD')).DisplayLabel:='Local.CD';
 TStringField(_cdsPedido.FieldByName('LOCAL_CD')).DisplayWidth:=05;

 TStringField(_cdsPedido.FieldByName('NM_FORNECEDOR')).DisplayLabel:='Nome Fornec.';
 TStringField(_cdsPedido.FieldByName('NM_FORNECEDOr')).DisplayWidth:=25;

 TStringField(_cdsPedido.FieldByName('SITP_P')).DisplayLabel:='Status';
 TStringField(_cdsPedido.FieldByName('SITP_P')).DisplayWidth:=04;

 TIntegerField(_cdsPedido.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens';
 TIntegerField(_cdsPedido.FieldByName('NR_ITENS')).DisplayWidth:=7;

 TIntegerField(_cdsPedido.FieldByName('NR_UNIDADES')).DisplayLabel:='Nr.Unid.';
 TIntegerField(_cdsPedido.FieldByName('NR_UNIDADES')).DisplayFormat:='###,###,##0';
 TIntegerField(_cdsPedido.FieldByName('NR_UNIDADES')).DisplayWidth:=7;

 TIntegerField(_cdsPedido.FieldByName('NR_CANCELADO')).DisplayLabel:='Nr.Itens Cancel.';
 TIntegerField(_cdsPedido.FieldByName('NR_CANCELADO')).DisplayWidth:=7;
 TIntegerField(_cdsPedido.FieldByName('NR_NOVO')).DisplayLabel:='Itens Nao Fat.';
 TIntegerField(_cdsPedido.FieldByName('NR_NOVO')).DisplayWidth:=7;

 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_CUSTO')).DisplayLabel:='Vlr.Pedido Custo';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_CUSTO')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_CUSTO')).DisplayWidth:=12;

 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FABR')).DisplayLabel:='Vlr.Ped.P?o Fornec.';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FABR')).DisplayFormat:='##,###,###,##0.00';
 TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FABR')).DisplayWidth:=12;

 TIntegerField(_cdsPedido.FieldByName('NR_FATURADO')).DisplayLabel:='Nr.Unid.Fat';
 TIntegerField(_cdsPedido.FieldByName('NR_FATURADO')).DisplayWidth:=7;

 TIntegerField(_cdsPedido.FieldByName('QT_FATURADO')).DisplayLabel:='Qtd.Unid.Fat';
 TIntegerField(_cdsPedido.FieldByName('QT_FATURADO')).DisplayWidth:=7;

  TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FAT')).DisplayLabel:='Vlr.Faturador Custo';
  TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FAT')).DisplayFormat:='##,###,###,##0.00';
  TFloatField(_cdsPedido.FieldByName('VL_PEDIDO_FAT')).DisplayWidth:=12;

  TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_FABR')).DisplayLabel:='Vlr.Faturador Fornec.';
  TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_FABR')).DisplayFormat:='##,###,###,##0.00';
  TFloatField(_cdsPedido.FieldByName('VL_PED_FAT_FABR')).DisplayWidth:=12;

  TIntegerField(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P')).DisplayLabel:='Cond.Pag.';
  TIntegerField(_cdsPedido.FieldByName('NR_CONDICAO_PAGTO_P')).DisplayWidth:=7;
end;

procedure T_frmPedidosRedes.SetGridItemPedido;
begin
  if _cdsItemPedido.Active then
  begin
   TIntegerField(_cdsItemPedido.FieldByName('NROM_Y')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('DFIY_Y')).Visible:=false;
   TIntegerField(_cdsItemPedido.FieldByName('CD_EMPRESA')).Visible:=false;
   TStringField(_cdsItemPedido.FieldByName('CD_INTERNO_LABORATORIO')).visible:=false;


   TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayLabel:='Cod.Prod.';
   TIntegerField(_cdsItemPedido.FieldByName('CD_PRODUTO')).DisplayWidth:=7;

   TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
   TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

   TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
   TStringField(_cdsItemPedido.FieldByName('NM_MERCADORIA')).DisplayWidth:=20;

   TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresentacao Produto';
   TStringField(_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=25;


   TIntegerField(_cdsItemPedido.FieldByName('NROP_Y')).DisplayLabel:='Nr.Pedido';
   TIntegerField(_cdsItemPedido.FieldByName('NROP_Y')).DisplayWidth:=7;

   TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayLabel:='Qtd.Pedido';
   TIntegerField(_cdsItemPedido.FieldByName('QUAY_Y')).DisplayWidth:=6;

   TIntegerField(_cdsItemPedido.FieldByName('CHEY_Y')).DisplayLabel:='Qtd.Atendida';
   TIntegerField(_cdsItemPedido.FieldByName('CHEY_Y')).DisplayWidth:=6;

   TStringField(_cdsItemPedido.FieldByName('SITY_Y')).DisplayLabel:='Status';
   TStringField(_cdsItemPedido.FieldByName('SITY_Y')).DisplayWidth:=3;

   TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayLabel:='%Desc.';
   TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayWidth:=6;
   TFloatField(_cdsItemPedido.FieldByName('ABTY_Y')).DisplayFormat:=('##0.00%');

   TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayLabel:='%Desc.Adic.';
   TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayWidth:=6;
   TFloatField(_cdsItemPedido.FieldByName('DADY_Y')).DisplayFormat:=('##0.00%');

   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayLabel:='Cd.Prazo';
   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayWidth:=6;

   TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayLabel:='P?o.Unit?rio';
   TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayWidth:=09;
   TFloatField(_cdsItemPedido.FieldByName('PUNY_Y')).DisplayFormat:=('###,###,##0.00');

   TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayLabel:='P?o.Fornecedor';
   TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayWidth:=09;
   TFloatField(_cdsItemPedido.FieldByName('PFBY_Y')).DisplayFormat:=('###,###,##0.00');

   TFloatField(_cdsItemPedido.FieldByName('VCCI_Y')).DisplayLabel:='P?o.Custo';
   TFloatField(_cdsItemPedido.FieldByName('VCCI_Y')).DisplayWidth:=09;
   TFloatField(_cdsItemPedido.FieldByName('VCCI_Y')).DisplayFormat:=('###,###,##0.00');


   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayLabel:='Cd.Prazo';
   TIntegerField(_cdsItemPedido.FieldByName('PRZY_Y')).DisplayWidth:=6;

   TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayLabel:='Nr.Verba';
   TIntegerField(_cdsItemPedido.FieldByName('NRVV_Y')).DisplayWidth:=6;

   TFloatField(_cdsItemPedido.FieldByName('PC_VERBA')).DisplayLabel:='% Verba';
   TFloatField(_cdsItemPedido.FieldByName('PC_VERBA')).DisplayWidth:=06;
   TFloatField(_cdsItemPedido.FieldByName('PC_VERBA')).DisplayFormat:=('##0.00');

   TFloatField(_cdsItemPedido.FieldByName('VL_VERBA')).DisplayLabel:='Vlr.Verba';
   TFloatField(_cdsItemPedido.FieldByName('VL_VERBA')).DisplayWidth:=06;
   TFloatField(_cdsItemPedido.FieldByName('VL_VERBA')).DisplayFormat:=('###,###,##0.00');

   TStringField(_cdsItemPedido.FieldByName('ID_NFE_TRANSITO')).DisplayLabel:='Nota em Transito';
   TStringField(_cdsItemPedido.FieldByName('ID_NFE_TRANSITO')).DisplayWidth:=25;

  end;
end;


procedure T_frmPedidosRedes.AbreItensPedidos(PnrPedido:Integer);
var
 stQuery :TStringList;
begin
 try
   stQuery:=TStringList.Create;
   with stQuery do
   begin
    add('SELECT CD_MERCADORIA*10+NR_DV_MERCADORIA as CD_PRODUTO,');
    add('NM_MERCADORIA,DS_APRESENTACAO_MERCADORIA,');
    add('NROP_Y, NROM_Y, QUAY_Y, CHEY_Y,SITY_Y, ABTY_Y,DADY_Y,');
    add('PRZY_Y, PUNY_Y,  PFBY_Y,  DFIY_Y, VCCI_Y,QT_BONIFICADA,');
    add('NRVV_Y  ,CD_INTERNO_LABORATORIO,PC_VERBA ,VL_VERBA , ID_DESCONTO_ACUMULATIVO,');
    add('CD_LISTA_COMPRA,PC_MUDANCA_PRECO,NR_OPERADOR_LOGISTICO,CD_EMPRESA,');
    add('NR_DIAS_ESTOQUE,QT_SUGERIDA,VL_MEDIA_VENDA,ID_NFE_TRANSITO,CD_EAN_COMPRA');
    add('FROM');
    add('PRDDM.DCPCI,');
    add('PRDDM.DC_MERCADORIA');
    add('WHERE NROM_Y=CD_MERCADORIA');
    add('AND sity_y not in(''C'',''I'',''S'')');

    add('AND NROP_Y = :PnrPedido');
   end;
   stQuery.SaveToFile('c:\temp\qryRelacaoPedidoItem.sql');
   with _cdsItemPedido do
   begin
     close;
     CommandText:=stQuery.Text;
     Params.ParamByName('PnrPedido').AsInteger:=PnrPedido;
     open;
     SetGridItemPedido;
   end;
 finally
   FreeAndNil(stQuery);
 end;
end;


FUNCTION T_frmPedidosRedes.getCondicaoPagamento(nrcondicao:Integer):Boolean;
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
   PrazoPedido:=nrParcelaPedido(nrcondicao);
   vlPedido      := _cdsPedido.FieldByName('VL_PEDIDO_CUSTO').AsFloat;
   dtPrevista    := _cdsPedido.FieldByName('DT_PEDIDO').AsDateTime;
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
   stCondicao:='';
   WHILE  NOT _cdsCondicaoPagamentos.Eof DO
   BEGIN
    if stCondicao<>'' then
       stCondicao:=stCondicao +','+ FormatFloat('##0',_cdsCondicaoPagamentosNR_DIAS.AsInteger)+' Dias'
    else
       stCondicao:=FormatFloat('##0',_cdsCondicaoPagamentosNR_DIAS.AsInteger)+' Dias';


    pcParcela:=   pcParcela  + _cdsCondicaoPagamentosPC_PARCELAS.AsFloat;
    _cdsCondicaoPagamentos.Next;
   END;
   IF vtparcela<>100 THEN
      AJustaParcelas;
END;


PROCEDURE T_frmPedidosRedes.AJustaParcelas;
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


function T_frmPedidosRedes.setCondicaoPagamento(nrParcela,nrDias:Integer;pcParcela,vlParcela:Double;dtPagamento:TDATE):Boolean;
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



procedure T_frmPedidosRedes.CarregaOperacaoRede;
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

     _cbxOperacaoRede.Items.Add(FormatFloat('000',0)+' - '+
                                  FormatFloat('000',0)+' - '+
                                  'Todos' );
    while not tempQuery.eof do
    begin
       _cbxOperacaoRede.Items.Add(FormatFloat('000',tempQuery.FieldByName('cd_empresa').AsInteger)+' - '+
                                  FormatFloat('000',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOperacaoRede.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;



function T_frmPedidosRedes.GerarExcelPedidoCSV:String;
var
     coluna, linha,nrLinaInicial,QtdItem: integer;
     excel: variant;
     valor: String ;
     data,dsCondicaoPagamento,
     nmFornecedor  :String;
     tipo : TFieldType;
     vlDefault :Variant;
     DadosCd :TDadosCD;
     DadosValoresPedido:TDadosValoresPedido;
     stObs:String;
     vlItemPedido,pcDescontoItem,TotalItem,TotalPedido:Double;
     dsNmPlanilha,sVersaoExcel,stExtrensao,
     nmArquivo:String;
     idPedidoPsico:Boolean;
     DadosFornecedor:TDadosFornecedor;

     i: Integer; // Coluna
     j: Integer; // Linha

     arq: TextFile;
     nrlinHa:integer;
     stLinha,stLinhaTemp:WideString;
     stLista: TStringList;
     vlResultado: Variant;


     function retirarQuebraLinha(aTxt : string):string;
     begin
       atxt:=StringReplace(atxt,#13#10,'',[rfReplaceAll]);
       atxt:=StringReplace(atxt,#$D#$A,'',[rfReplaceAll]);
       atxt:=StringReplace(atxt,#$D,' ',[rfReplaceAll]);
       Result:=aTxt;
     end;





begin
     nrLinaInicial:=4;

     //Se a vers?o do excel form 2007 ou superior salva em XLSX
  //Se a vers?o do excel for inferior ao 2007 ent?o salva no formato XLS

     DadosValoresPedido:=GetValoresPedido(_cdsPedido.FieldByName('NROP_P').AsInteger,false);
     DadosCd:=GetDadosCD(DadosValoresPedido.cdEmpresa);
     getCondicaoPagamento(DadosValoresPedido.nrCondicaoPagamento);
     DadosFornecedor:=GetDadosLaboratorio(DadosValoresPedido.nrFornecedor);

     //excel.Workbooks[1].WorkSheets[1].Name := 'Pedido - '+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger);
    // excel.Workbooks[1].WorkSheets['Pedido - '+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger)];


      if not DirectoryExists(dsLocalPanilha) then
       ForceDirectories(dsLocalPanilha);

     //_cdsPedido.First;
     try

      nmFornecedor:=TrocaCaracterEspecial(DadosFornecedor.dsGrupoFornecedor,true);
      dsNmPlanilha:='Pedido_'+trim(nmFornecedor)+'_'+Inttostr(DadosValoresPedido.nrPedido)+'_'+DadosCd.stEstado+ '.csv';

    nmArquivo:='C:\temp\'+dsNmPlanilha;
    AssignFile(arq,nmArquivo );
    Rewrite(arq, nmArquivo);
    result:=nmArquivo;

    stLinha:='Genesio A. Mendes & Cia. Ltda';
    Writeln(arq,stLinha);
    stLinha:='Pedido Compra :'+inttostr(_cdsPedido.FieldByName('NROP_P').AsInteger);
    Writeln(arq,stLinha);
    stLinha:='Data Pedido.:'+FormatDateTime('dd/mm/yyyy',_cdsPedido.FieldByName('DT_PEDIDO').AsDateTime);
    Writeln(arq,stLinha);
    stLinha:='Cond. Pagamento :'+stCondicao;
    Writeln(arq,stLinha);
    Writeln(arq,' ');
    stLinha:='Observa??es ';
    Writeln(arq,stLinha);
    stLinha:=' Informar Nr. do Nosso Pedido '+_cdsPedido.FieldByName('NROP_P').AsString+' na Nota Fiscal/Danfe em Dados Adicionais';
    Writeln(arq,stLinha);
    stLinha:=' E no XML informar no campo correspondente (Tag compra x Ped)';
    Writeln(arq,stLinha);
    Writeln(arq,' ');


    stObs:=DadosValoresPedido.stObservacaoPedido;
    idPedidoPsico:=false;
    if AnsiContainsStr(stObs,'Psicotr?picos') then
    begin
      idPedidoPsico:=true;
      dsNmPlanilha:='Pedido_'+trim(StringReplace(_cdsPedido.FieldByName('NM_FORNECEDOR').asstring,'/','_',[rfReplaceAll]))+'_'+_cdsPedido.FieldByName('NROP_P').AsString+'_Psicotropicos'+'_'+DadosCd.stEstado+stExtrensao
    end;
    if (DadosValoresPedido.nrPedidoVinculado>0)  then
         stObs:= stObs + ' Existe outro Pedido Vinculado a Este --> '+FormatFloat('000000',DadosValoresPedido.nrPedidoVinculado);
    if trim(stObs)<>''  then
    begin
       stLinha:='Importante.:'+trim(stObs);
       Writeln(arq,stLinha);
       Writeln(arq,' ');
     end;
     if trim(stobs)='' then
     begin
        Writeln(arq,' ');
        Writeln(arq,' ');
        Writeln(arq,' ');
     end;




       stLinha:='CNPJ para Faturamento : '+ DadosCd.nrCNPJ;
       Writeln(arq,stLinha);

        stLinha:='Endere?o de Entrega ';
        Writeln(arq,stLinha);
                //Formatando c?lulas escritas
       //  excel.range['A13','A13'].Font.Bold      := true;
       //  excel.range['A13','A13'].Font.ColorIndex := 1;//Cor da linha: Preto

        stLinha:=TrimRight(DadosCd.stENDERECO)+', N?.: '+DadosCd.nrLogradouro;
        Writeln(arq,stLinha);

        stLinha:='Bairro.: '+DadosCd.stBAIRRO;
        Writeln(arq,stLinha);
        stLinha:='Cidade.: '+TrimRight(DadosCd.stCIDADE)+'    UF.:'+DadosCd.stEstado;
        Writeln(arq,stLinha);


//        excel.range['A16','A16'].Font.Bold      := true;
  //      excel.range['A16','A16'].Font.ColorIndex := 3;//Cor da linha: Preto

        stLinha:='CEP.:'+DadosCd.stCEP;
        Writeln(arq,stLinha);
        Writeln(arq,' ');

        stLinha:='Cod. GAM'+';'+
                 'Cod.Fornec.'+';'+
                 'Cod.EAN'+';'+
                 'Qtdade'+';'+
                 'Nome e Apresenta??o'+';'+
                 'P?o. Unit.'+';'+
                 '% Desconto'+';'+
                 'Total Unit.';
        Writeln(arq,stLinha);

        linha:=18;
        coluna:=1;
        TotalPedido:=0;
        QtdItem:=0;
        _cdsItemPedido.First;
         while not _cdsItemPedido.Eof do
         begin

          // if  then

           if _chkRelatorioPrecoCusto.Checked then
               vlItemPedido:=_cdsItemPedido.FieldByName('PUNY_Y').AsFloat
           else
               vlItemPedido:=_cdsItemPedido.FieldByName('PFBY_Y').AsFloat;

           if _chkMostraDesconto.Checked then
               pcDescontoItem:=_cdsItemPedido.FieldByName('ABTY_Y').AsFloat+
                               _cdsItemPedido.FieldByName('DADY_Y').AsFloat
           else
             pcDescontoItem:=0;
             QtdItem:=QtdItem+_cdsItemPedido.FieldByName('QUAY_Y').AsInteger;
             TotalItem:= vlItemPedido*_cdsItemPedido.FieldByName('QUAY_Y').AsFloat;

             stLinha:=FormatFloat('#######0',_cdsItemPedido.FieldByName('CD_PRODUTO').AsInteger)+';'+
                                  _cdsItemPedido.FieldByName('CD_INTERNO_LABORATORIO').AsString+';'+
                                  FormatFloat('#############0',_cdsItemPedido.FieldByName('CD_EAN_COMPRA').AsFloat)+';'+
                                  FormatFloat('#####0',_cdsItemPedido.FieldByName('QUAY_Y').AsInteger)+';'+
                                   _cdsItemPedido.FieldByName('NM_MERCADORIA').AsString+' '+_cdsItemPedido.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString +';'+
                                  FormatFloat('#####0.00',vlItemPedido)+';'+
                                  FormatFloat('#####0.00%',pcDescontoItem)+';'+
                                  FormatFloat('#####0.00',TotalItem);

            TotalPedido:=TotalPedido + TotalItem;

            Writeln(arq,stLinha);

           inc(linha);
           inc(coluna);
           _cdsItemPedido.Next;
         end;

         stLinha:='Nr.Itens '+';'+
                  '  '+';'+
                  '  '+';'+
                 FormatFloat('#######0',QtdItem)+';'+
                  '  '+';'+
                 'Total do Pedido(R$)  '+';'+
                  '  '+';'+
                 FormatFloat('#######0.00',TotalPedido)+';'+
                  '  '+';'+
                  '  '+';'+
                  '  ';
         Writeln(arq,stLinha);


     except
      begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
         // excel.quit;
      end;
     end;
     CloseFile(arq);
     _cdsItemPedido.EnableControls;

     //excel.quit;
end;


procedure T_frmPedidosRedes.AjustaEmpresaDestino;
var
  tempQuery : TSQLQuery;
begin
  tempQuery := nil;
  try
    try
    tempQuery := _dm.criaQueryGenerica;
    tempQuery.SQL.Clear;
    tempQuery.SQL.Add('UPDATE prddm.dcpcc SET CD_EMPRESA_DESTINO=CD_EMPRESA  WHERE NVL( CD_EMPRESA_DESTINO,0)=0');
    if tempQuery.ExecSQL(false)<=0 then
       sleep(0);
    except
      Mensagem('Erro Ajusta nr da Empresa Destino!!!',MB_ICONERROR);
    end;
  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;


Procedure T_frmPedidosRedes.GerarExcelRelatarioCapaPedido(Consulta:TclientdataSet);
var
     coluna, linha,nrLinaInicial: integer;
     excel: variant;
     valor: String ;
     data  :String;
     tipo : TFieldType;
     vlDefault :Variant;

begin
try
          excel:=CreateOleObject('Excel.Application');
          excel.Workbooks.add(1);
     except
          Application.MessageBox ('Vers?o do Ms-Excel'+
          'Incompat?vel','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;
     nrLinaInicial:=4;
     Consulta.First;
     try

        Consulta.DisableControls;

        excel.cells[01,01]:='Gen?sio A. Mendes & Cia Ltda';
        excel.cells[02,01]:='Relatorio Pedido(s)';

        excel.cells[03,01]:=Consulta.Fields[00].DisplayLabel;
        excel.cells[03,02]:=Consulta.Fields[01].DisplayLabel;
        excel.cells[03,03]:=Consulta.Fields[02].DisplayLabel;
        excel.cells[03,04]:=Consulta.Fields[03].DisplayLabel;
        excel.cells[03,05]:=Consulta.Fields[04].DisplayLabel;
        excel.cells[03,06]:=Consulta.Fields[05].DisplayLabel;
        excel.cells[03,07]:=Consulta.Fields[06].DisplayLabel;
        excel.cells[03,08]:=Consulta.Fields[07].DisplayLabel;
        excel.cells[03,09]:=Consulta.Fields[08].DisplayLabel;
        excel.cells[03,10]:=Consulta.Fields[09].DisplayLabel;
        excel.cells[03,11]:=Consulta.Fields[10].DisplayLabel;
        excel.cells[03,12]:=Consulta.Fields[11].DisplayLabel;
        excel.cells[03,13]:=Consulta.Fields[12].DisplayLabel;
        excel.cells[03,14]:=Consulta.Fields[13].DisplayLabel;
        excel.cells[03,15]:=Consulta.Fields[14].DisplayLabel;
        excel.cells[03,16]:=Consulta.Fields[15].DisplayLabel;
        excel.cells[03,16]:=Consulta.Fields[16].DisplayLabel;
        excel.cells[03,17]:=Consulta.Fields[17].DisplayLabel;
        linha:=3;
        coluna:=1;
        Consulta.First;
         while not Consulta.Eof do
         begin
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,01]:=Consulta.FieldByName('NROP_P').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,02]:=Consulta.FieldByName('LOCAL_CD').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,03]:=Consulta.FieldByName('LABP_P').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,04]:=Consulta.FieldByName('NM_FORNECEDOR').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,05]:=Consulta.FieldByName('DT_PEDIDO').AsDateTime;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,06]:=Consulta.FieldByName('DT_PREVISTA').AsDateTime;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,07]:=Consulta.FieldByName('SITP_P').AsString;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=Consulta.FieldByName('NR_ITENS').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,09]:=Consulta.FieldByName('NR_UNIDADES').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,10]:=Consulta.FieldByName('NR_CANCELADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,11]:=Consulta.FieldByName('NR_NOVO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,12]:=Consulta.FieldByName('VL_PEDIDO_CUSTO').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,13]:=Consulta.FieldByName('VL_PEDIDO_FABR').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,14]:=Consulta.FieldByName('NR_FATURADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,15]:=Consulta.FieldByName('QT_FATURADO').AsInteger;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,16]:=Consulta.FieldByName('VL_PEDIDO_FAT').AsFloat;
           Excel.WorkBooks[1].Sheets[1].cells[linha+1,17]:=Consulta.FieldByName('VL_PED_FAT_FABR').AsFloat;
           inc(linha);
           Inc(coluna);
           Consulta.Next;
         end;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,08]:=NR_TOTAL_ITENS;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,09]:=NR_TOTAL_UNIDADES;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,12]:=VL_PEDIDO_CUSTO;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,13]:=VL_PEDIDO_FORNECEDOR;

          Excel.WorkBooks[1].Sheets[1].cells[linha+1,14]:=NR_UNIDADES_FAT;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,15]:=QT_UNIDADES_FAT;

          Excel.WorkBooks[1].Sheets[1].cells[linha+1,16]:=VL_FATURADO_CUSTO;
          Excel.WorkBooks[1].Sheets[1].cells[linha+1,17]:=VL_FATURADO_FORNEC;

       // end;                                                          _cdsPedido.AsVariant
        excel.columns.AutoFit; // esta linha ? para fazer com que o Excel dimencione as c?lulas adequadamente.
        excel.visible:=true;
     except
       on E:Exception do
      begin
          Application.MessageBox(pchar(format('Aconteceu um erro desconhecido durante a convers?o'+
          'da tabela para o Ms-Excel.Detalhes: %s',[E.Message])),'Erro',MB_OK+MB_ICONEXCLAMATION);
          excel.quit;
      end;
     end;
     Consulta.EnableControls;

     //excel.quit;
end;



end.
