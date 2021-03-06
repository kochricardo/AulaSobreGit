unit uComparaVendaAnual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, ComCtrls,
  uAuxiliarCompras,Printers, uRotinasGenericas, uProduto;

type
  T_frmComparacaoAnualVenda = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    _cdsProdutosVenda: TClientDataSet;
    _dsProdutosVenda: TDataSource;
    _dbgComparacaoAnual: TDBGrid;
    _btnExecuta: TBitBtn;
    _edtNumeroFornecedor: TEdit;
    Label1: TLabel;
    _cbxOpcaoCDs: TComboBox;
    Label18: TLabel;
    _bitFechar: TBitBtn;
    _cdsVendaAnual: TClientDataSet;
    _btnParaExcel: TBitBtn;
    _btnImprimir: TBitBtn;
    procedure _btnExecutaClick(Sender: TObject);
    procedure _bitFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dbgComparacaoAnualDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure _btnImprimirClick(Sender: TObject);
    procedure _edtNumeroFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure setGridProduto;
    procedure SetVendamensal;
    function getVendaMensal(PnrProduto: Integer; dtVenda: TDateTime): Integer;
    procedure CabecalhoInicioPag(nrLaboratorio, nrLinha, nrDias, nrGrupo,
      nrLeadTime, nrPrazoPadrao: Integer; stNomeLaboratorio,
      stCurvaLaboratorio: String);
    procedure CabecalhoPag(nrLinha: Integer);
    procedure Imprimir;
   procedure LinhaDetalhe(nrLinha, nrCodigo:iNTEGER;
                          nmProduto,
                          nmApresentacao,
                          nmUnidade :String;
                          nrUnidadeMes01,
                          nrUnidadeMes02,
                          nrUnidadeMes03,
                          nrUnidadeMes04,
                          nrUnidadeMes05,
                          nrUnidadeMes06,
                          nrUnidadeMes07,
                          nrUnidadeMes08,
                          nrUnidadeMes09,
                          nrUnidadeMes10,
                          nrUnidadeMes11,
                          nrUnidadeMes12,
                          nrUnidadeMes13: Integer);
//    procedure SomaRodapePag(nrLinha: Integer);
    procedure TopoPagina(nrPagina, nrLinha: Integer);
    procedure ExecutaPesquisa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmComparacaoAnualVenda: T_frmComparacaoAnualVenda;
  nrRegistro:Integer;
  DaDosFornecedor :TDadosFornecedor;
  vlContaLinha,vlPag,
  vgLinha, nrFornecedor,linha,nrCd :Integer;


implementation

{$R *.dfm}

procedure T_frmComparacaoAnualVenda._dbgComparacaoAnualDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   with _dbgComparacaoAnual do
   begin

// mude a cor das Linha
   If odd(_cdsProdutosVenda.FieldByName('ID_REG').AsInteger) then
   begin
      Canvas.Font.Color := clblack;
     Canvas.Brush.Color := clSkyBlue;
   end
  else
  begin
    Canvas.Font.Color := clblack;
    Canvas.Brush.Color := clWhite;
  end;
//


// mude a cor de celulas selecionadas
      if(gdSelected in State) then
      begin
         Canvas.brush.Color:= clblue;
         Canvas.Font.Color:= clWhite;
      end;
// mude a cor das celulas com foco
      if(gdfocused in State) then
      begin
         Canvas.brush.Color:= clBlue;
         Canvas.Font.Color:= clwhite;
      end;
      DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;

end;

procedure T_frmComparacaoAnualVenda._edtNumeroFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
   VK_RETURN : ExecutaPesquisa;
  end;
end;

procedure T_frmComparacaoAnualVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmComparacaoAnualVenda._bitFecharClick(Sender: TObject);
begin
 close;
end;

procedure T_frmComparacaoAnualVenda._btnExecutaClick(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure T_frmComparacaoAnualVenda._btnImprimirClick(Sender: TObject);
begin
 Imprimir;
end;

procedure T_frmComparacaoAnualVenda._btnParaExcelClick(Sender: TObject);
begin
 GerarExcel(_cdsProdutosVenda);;
 //_btnParaExcel.Enabled:=false;
end;

procedure T_frmComparacaoAnualVenda.setGridProduto;
var
  I: Integer;
  nmMes,nmANo:String[20];
  contaMes,
  AnoAnterior,
  AnoAtual:Integer;
  DadosData:TDataRetorno;
begin
 TStringField(_cdsProdutosVenda.FieldByName('ID_ANO')).DisplayLabel:='Ano';
 TStringField(_cdsProdutosVenda.FieldByName('ID_ANO')).DisplayWidth:=4;

 TIntegerField(_cdsProdutosVenda.FieldByName('Codigo')).DisplayLabel:='Cod.Prod.';
 TIntegerField(_cdsProdutosVenda.FieldByName('Codigo')).DisplayWidth:=8;

 TStringField(_cdsProdutosVenda.FieldByName('NM_MERCADORIA')).DisplayLabel:='Nome Produto';
 TStringField(_cdsProdutosVenda.FieldByName('NM_MERCADORIA')).DisplayWidth:=25;

 TStringField(_cdsProdutosVenda.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayLabel:='Apresenta??o';
 TStringField(_cdsProdutosVenda.FieldByName('DS_APRESENTACAO_MERCADORIA')).DisplayWidth:=25;

 TStringField(_cdsProdutosVenda.FieldByName('DS_UNIDADE_MEDIDA')).DisplayLabel:='UN.';
 TStringField(_cdsProdutosVenda.FieldByName('DS_UNIDADE_MEDIDA')).DisplayWidth:=03;

 TStringField(_cdsProdutosVenda.FieldByName('ID_CD')).DisplayLabel:='CD';
 TStringField(_cdsProdutosVenda.FieldByName('ID_CD')).DisplayWidth:=02;

 AnoAnterior:=24;
 AnoAtual:=12;
 nmMes:='';
 for I := 1 to 13 do
 begin
     DadosData:=InformacaoData(incMonth(dtSistema,-AnoAnterior));
     nmMes:=copy(DadosData.NomeMes,1,3);
     nmMes:=nmMes+' - '+ FormatFloat('0000',DadosData.Ano);
     DadosData:=InformacaoData(incMonth(dtSistema,-AnoAtual));
     nmMes:=nmMes+'/'+ FormatFloat('0000',DadosData.Ano);
     dec(AnoAnterior);
     dec(AnoAtual);
     TIntegerField(_cdsProdutosVenda.Fields[5+i]).DisplayLabel:=nmMes;
     TIntegerField(_cdsProdutosVenda.Fields[5+i]).DisplayWidth:=13;
     TIntegerField(_cdsProdutosVenda.Fields[5+i]).DisplayFormat:='###,###,##0';
 end;
 TIntegerField(_cdsProdutosVenda.FieldByName('ID_REG')).Visible:=false;

{      SQL.Add(',,0 MES_01,0 MES_02,0');
      SQL.Add('MES_03,0 MES_04,0 MES_05,0 MES_06,0 MES_07,0 MES_08,0 MES_09,');
      SQL.Add('0 MES_10,0 MES_11,0 MES_12');}

end;

procedure T_frmComparacaoAnualVenda.SetVendamensal;
var
  I: Integer;
  nrColuna,nrVenda,nrContaReg:Integer;
  dtAnterior :String;
  dtPosteriro,STCD:String;
  dtAno_A,dtAno_B :TDate;
  idREG,cdRegAnterior,cdReg :Integer;
begin
    _cdsProdutosVenda.DisableControls;
    _cdsProdutosVenda.First;
    idREG:=1;
    cdReg:=_cdsProdutosVenda.FieldByName('CODIGO').AsInteger;
    cdRegAnterior:=cdReg;
    while not _cdsProdutosVenda.Eof do
    begin
       nrColuna:=0;
       inc(nrContaReg);
       _cdsProdutosVenda.EDIT;
       STCD:='00';
       if _cbxOpcaoCDs.ItemIndex=1 then
          STCD:='SC';
       if _cbxOpcaoCDs.ItemIndex=2 then
          STCD:='RS';

      _cdsProdutosVenda.FieldByName('ID_CD').AsString:=STCD;
       if  cdReg <>_cdsProdutosVenda.FieldByName('CODIGO').AsInteger then
       begin
        inc(idREG);
        cdReg:=_cdsProdutosVenda.FieldByName('CODIGO').AsInteger;
        cdRegAnterior:=cdReg;
       end;



      _cdsProdutosVenda.FieldByName('ID_REG').AsInteger:=idReg;
       StatusBar1.Panels[0].Text:='Aguarde...';
       for I := 24 downto 12 do
       begin
          dtAnterior:=FormatDateTime('01/MM/YYYY',INCMONTH(dtSistema,-I));
          Inc(nrColuna);
          nrVenda:=getVendaMensal(_cdsProdutosVenda.FieldByName('CODIGO').AsInteger,StrToDate(dtAnterior));
          _cdsProdutosVenda.Fields[5+nrColuna].AsInteger:=nrVenda;
          StatusBar1.Panels[1].Text:= FormatFloat('0000000/0',_cdsProdutosVenda.FieldByName('CODIGO').AsInteger)+' - '+
                                      _cdsProdutosVenda.FieldByName('NM_MERCADORIA').AsString+ '   '+
                                      _cdsProdutosVenda.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString+ ' -  '+
                                       ' Periodo --> '+ dtAnterior;
          StatusBar1.repaint;
       end;
       nrColuna:=0;
       Application.ProcessMessages;
       _dbgComparacaoAnual.Repaint;
      _cdsProdutosVenda.Next;
       inc(nrContaReg);
      _cdsProdutosVenda.EDIT;
      _cdsProdutosVenda.FieldByName('ID_REG').AsInteger:=idReg;
      _cdsProdutosVenda.FieldByName('ID_CD').AsString:=STCD;
       for I := 12 downto 00 do
       begin
          Inc(nrColuna);
         if I>0 then
          dtAnterior:=FormatDateTime('01/MM/YYYY',INCMONTH(dtSistema,-I))
         else
          dtAnterior:=FormatDateTime('dd/MM/YYYY',dtSistema-1);
          nrVenda:=getVendaMensal(_cdsProdutosVenda.FieldByName('CODIGO').AsInteger,StrToDate(dtAnterior));
          _cdsProdutosVenda.Fields[5+nrColuna].AsInteger:=nrVenda;
          StatusBar1.Panels[1].Text:= FormatFloat('0000000/0',_cdsProdutosVenda.FieldByName('CODIGO').AsInteger)+' - '+
                                      _cdsProdutosVenda.FieldByName('NM_MERCADORIA').AsString+ '   '+
                                      _cdsProdutosVenda.FieldByName('DS_APRESENTACAO_MERCADORIA').AsString+ ' -  '+
                                      ' Periodo --> '+ dtAnterior;
          StatusBar1.repaint;
       end;
       nrRegistro:=_cdsProdutosVenda.RecordCount;
       StatusBar1.Panels[2].Text:= FormatFloat('000000',nrRegistro)+' - '+FormatFloat('000000',nrContaReg);;

      _cdsProdutosVenda.Next;
    end;
    _cdsProdutosVenda.EnableControls;
    StatusBar1.Panels[0].Text:='';
    StatusBar1.Panels[1].Text:='';

end;

procedure T_frmComparacaoAnualVenda.FormShow(Sender: TObject);
begin
  _edtNumeroFornecedor.SetFocus;
end;

function T_frmComparacaoAnualVenda.getVendaMensal(PnrProduto:Integer;dtVenda:TDateTime):Integer;
begin
   Result:=0;
   if NOT _cdsVendaAnual.Active then
      _cdsVendaAnual.Open;

   if _cdsVendaAnual.Locate('CODIGO;DATW_W',VarArrayOf([PnrProduto,dtVenda]),[]) then
      Result:=_cdsVendaAnual.FieldByName('QT_VENDIDA').AsInteger;

end;

procedure T_frmComparacaoAnualVenda.Imprimir;
var
  i: Integer;
  loDir,
  loPastaLocal, loNomeArquivo: String;
  LoCodigo, loProduto, loApresentacao, LoUn, loPcDesconto, loVendaTrimestre,
    loVendaMes3, loVendaMes2, loVendaMes1, loVendaMes0, loPendencia, loPreco,
    loEstoque, loEmbalagem, loCurva: String;
  nrPendencia: Integer;
begin

  with Printer do
  begin
    vlContaLinha := 0;
    Canvas.Font.Name := 'Courier New';
    Canvas.Font.Size := 08;
    vlPag := 1;
    Linha := 200;
    Title := 'Compar??o de Venda Anual';
    Orientation := poLandScape;
    BeginDoc;
    Linha := Linha - Printer.Canvas.Font.Height + 10;
    TopoPagina(vlPag, Linha);
    Linha := Linha - Printer.Canvas.Font.Height + 10;
    DaDosFornecedor := GetDadosLaboratorio(nrFornecedor);
    CabecalhoInicioPag(DaDosFornecedor.nrFornecedor, Linha, 0,
      DaDosFornecedor.nrGrupoFornecedor, DaDosFornecedor.nrDiasLeadTime,
      DaDosFornecedor.nrPrazoPedido, DaDosFornecedor.dsNomeFantasia, '');
    Linha := Linha - Printer.Canvas.Font.Height + 10;
    CabecalhoPag(vgLinha);
    _cdsProdutosVenda.First;
    while not _cdsProdutosVenda.Eof DO
    begin
      loPendencia := '';

      LinhaDetalhe(vgLinha, _cdsProdutosVenda.FieldByName('CODIGO').AsInteger,
        _cdsProdutosVenda.FieldByName('NM_MERCADORIA').AsString,
        _cdsProdutosVenda.FieldByName('ds_apresentacao_mercadoria').AsString,
        _cdsProdutosVenda.FieldByName('DS_UNIDADE_MEDIDA').AsString,
        _cdsProdutosVenda.FieldByName('MES_01').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_02').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_03').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_04').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_05').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_06').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_07').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_08').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_09').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_10').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_11').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_12').AsInteger,
        _cdsProdutosVenda.FieldByName('MES_ATUAL').AsInteger);
      _cdsProdutosVenda.Next;
    end;
  //  SomaRodapePag(vgLinha);
    EndDoc;
  end;
end;

procedure T_frmComparacaoAnualVenda.TopoPagina(nrPagina, nrLinha: Integer);
begin
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha, 'Gen?sio A. Mendes & Cia Ltda');
  Printer.Canvas.TextOut(3100, nrLinha, 'Compara??o Anual de Venda');
  Printer.Canvas.TextOut(4500, nrLinha,
    'Data :  ' + FormatDateTime('dd/mm/yyyy', Date));
  Printer.Canvas.TextOut(5500, nrLinha, 'Pagina: ' + FormatFloat('##0',
    nrPagina));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  Inc(vlContaLinha);
  vgLinha := nrLinha;
end;

(* ************************ *)
procedure T_frmComparacaoAnualVenda.CabecalhoInicioPag(nrLaboratorio, nrLinha,
  nrDias, nrGrupo, nrLeadTime, nrPrazoPadrao: Integer;
  stNomeLaboratorio, stCurvaLaboratorio: String);
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha, 'Nr.Fornecedor :' + FormatFloat('##0',nrLaboratorio));
  Printer.Canvas.TextOut(0900, nrLinha, stNomeLaboratorio);
  Printer.Canvas.TextOut(2200, nrLinha, stCurvaLaboratorio);
  Printer.Canvas.TextOut(2500, nrLinha, 'Compara??o Anual de Venda ');
  Printer.Canvas.TextOut(3950, nrLinha, 'Grupo : ' + FormatFloat('##0',
    nrGrupo));
  Printer.Canvas.TextOut(4500, nrLinha, 'LeadTime : ' + FormatFloat('##0',
    nrLeadTime));
  Printer.Canvas.TextOut(5500, nrLinha, 'Prazo Padr?o : ' + FormatFloat('##0',
    nrPrazoPadrao));
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  Inc(vlContaLinha);
  vgLinha := nrLinha;
end;

(* ************************ *)
procedure T_frmComparacaoAnualVenda.CabecalhoPag(nrLinha: Integer);
var
  I: Integer;
  IncEspaco, AnoAnterior,
  AnoAtual,  nrPosicao:Integer;
  DadosData :TDataRetorno;
  NmMes :String;
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha, 'C?digo');
  Printer.Canvas.TextOut(0400, nrLinha, 'Produto');
  Printer.Canvas.TextOut(1200, nrLinha, 'Apresenta??o');
  Printer.Canvas.TextOut(2050, nrLinha, 'UN');
  AnoAnterior:=24;
  AnoAtual :=12;
  nrPosicao:=2250;
  for I := 1 to 13 do
  begin

      DadosData:=InformacaoData(incMonth(dtSistema,-AnoAnterior));
      nmMes:=copy(DadosData.NomeMes,1,3);
      nmMes:=nmMes+'/'+ FormatFloat('0000',DadosData.Ano);
      Printer.Canvas.TextOut(nrPosicao, nrLinha, NmMes);
      nrPosicao:=nrPosicao + 350;
      dec(AnoAnterior);
  end;
  nrPosicao:=2250;
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  for I := 1 to 13 do
  begin
      DadosData:=InformacaoData(incMonth(dtSistema,-AnoAtual));
      nmMes:=copy(DadosData.NomeMes,1,3);
      nmMes:=nmMes+'/'+ FormatFloat('0000',DadosData.Ano);
      Printer.Canvas.TextOut(nrPosicao, nrLinha, NmMes);
      nrPosicao:=nrPosicao + 350;
      dec(AnoAtual)
  end;
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Printer.Canvas.TextOut(0050, nrLinha, replicate('=', 199));
  Inc(vlContaLinha);
  vgLinha := nrLinha;
end;

(* ****************************************************** *)

procedure T_frmComparacaoAnualVenda.LinhaDetalhe(nrLinha, nrCodigo:iNTEGER;
                                                 nmProduto,
                                                 nmApresentacao,
                                                 nmUnidade :String;
                                                 nrUnidadeMes01,
                                                 nrUnidadeMes02,
                                                 nrUnidadeMes03,
                                                 nrUnidadeMes04,
                                                 nrUnidadeMes05,
                                                 nrUnidadeMes06,
                                                 nrUnidadeMes07,
                                                 nrUnidadeMes08,
                                                 nrUnidadeMes09,
                                                 nrUnidadeMes10,
                                                 nrUnidadeMes11,
                                                 nrUnidadeMes12,
                                                 nrUnidadeMes13: Integer);
begin
  nrLinha := nrLinha - Printer.Canvas.Font.Height + 10;
  Inc(vlContaLinha);
  Printer.Canvas.TextOut(0050, nrLinha,
    formataNumero(07, FormatFloat('######/#', nrCodigo)));
  Printer.Canvas.TextOut(0400, nrLinha, FormataString(nmProduto, 20));
  Printer.Canvas.TextOut(1200, nrLinha, FormataString(nmApresentacao, 20));
  Printer.Canvas.TextOut(2050, nrLinha, FormataString(nmUnidade, 2));
  Printer.Canvas.TextOut(2300, nrLinha, formataNumero(07, FormatFloat('#,###,##0',nrUnidadeMes01)));
  Printer.Canvas.TextOut(2650, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes02)));
  Printer.Canvas.TextOut(3000, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes03)));
  Printer.Canvas.TextOut(3350, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes04)));
  Printer.Canvas.TextOut(3700, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes05)));
  Printer.Canvas.TextOut(4050, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes06)));
  Printer.Canvas.TextOut(4400, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes07)));
  Printer.Canvas.TextOut(4750, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes08)));
  Printer.Canvas.TextOut(5100, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes09)));
  Printer.Canvas.TextOut(5450, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes10)));
  Printer.Canvas.TextOut(5800, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes11)));
  Printer.Canvas.TextOut(6150, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes12)));
  Printer.Canvas.TextOut(6495, nrLinha, formataNumero(07, FormatFloat('#,###,##0', nrUnidadeMes13)));
  vgLinha := nrLinha;
  if vlContaLinha > 55 then
  begin
    Printer.NewPage;
    vlContaLinha := 0;
    Linha := 200;
    Inc(vlPag);
    TopoPagina(vlPag, Linha);
    CabecalhoPag(vgLinha);
  end;
end;

procedure T_frmComparacaoAnualVenda.ExecutaPesquisa;
begin
   _btnParaExcel.Enabled:=false;
   _btnExecuta.Enabled:=false;
   nrCd:=0;
   if _cbxOpcaoCDs.ItemIndex=1 then
      nrCd:=1;
   if _cbxOpcaoCDs.ItemIndex=2 then
      nrCd:=4;

   nrFornecedor:=StrToIntDef(_edtNumeroFornecedor.Text,0);
   _cdsVendaAnual:=GetVendaProdutosComparacao(nrCd,nrFornecedor);
//     setGridProduto;
   if nrFornecedor>0 then
   begin
    _cdsProdutosVenda:=GetProdutosComparacao(nrCd,nrFornecedor);
    _dsProdutosVenda.DataSet:=_cdsProdutosVenda;
    _cdsProdutosVenda.Open;
     setGridProduto;
   end;
   if not _cdsProdutosVenda.IsEmpty then
   begin
      nrRegistro:=_cdsProdutosVenda.RecordCount;
      StatusBar1.Panels[2].Text:= FormatFloat('000000',nrRegistro);
      if _cdsVendaAnual<>nil then
      begin
       _cdsProdutosVenda.Open;
       SetVendamensal;
      end;
      _btnParaExcel.Enabled:=true;
      _cdsProdutosVenda.First;
   end;
   _btnExecuta.Enabled:=true;

end;

end.
