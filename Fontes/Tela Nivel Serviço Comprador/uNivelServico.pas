unit uNivelServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, Buttons, DB,sqlExpr,
  DBClient,ShellApi, OleCtrls, SHDocVw,dbWeb;
  //, Classes, ComObj, XMLDoc, XMLIntf, Variants;;

type
  T_frmNivelServico = class(TForm)
    StatusBar1: TStatusBar;
    _grbNivelServico: TGroupBox;
    _dbgNivelServi?o: TDBGrid;
    _edtNrComprador: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    _cdsNivelServico: TClientDataSet;
    _dsNivelServico: TDataSource;
    BitBtn1: TBitBtn;
    _chkSeparaFornecedor: TCheckBox;
    _btnParaExcel: TBitBtn;
    BitBtn3: TBitBtn;
    Label18: TLabel;
    _cbxOpcaoCDs: TComboBox;
    _dsFaturamentoMedio: TDataSource;
    _cdsFaturamentoMedio: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure _dbgNivelServi?oTitleClick(Column: TColumn);
    procedure _dbgNivelServi?oDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _btnParaExcelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private
    procedure SetGriNivelServi?o;
    procedure Exportar(DataSet: TDataSet; Arq, Ext: string);
    procedure Exportar2(DataSet: TDataSet; Arq, Ext: string);
    procedure ExpHTML(DataSet: TDataSet; Arq: string);
    procedure GeraTabelaIndiceComprado(DataSet: TDataSet);
    procedure Exportar3(DataSet: TDataSet; Arq, Ext: string);
    procedure CarregaEmpresa;
    { Private declarations }
  public
    { Public declarations }
    shtml     : widestring;
    htmlfile  : TextFile;

   function ColorToHtml(mColor: TColor): string;
   function StrToHtml(mStr: string; mFont: TFont = nil): string;
   function DBGridToHtmlTable(mDBGrid: TDBGrid; mStrings: TStrings; mCaption: TCaption = ''): Boolean;



  end;

var
  _frmNivelServico: T_frmNivelServico;


implementation

uses uAuxiliarCompras, uRotinasGenericas, uDm;
  var
 idSeparadaFornecedor :String;
  nrCd:Integer;

{$R *.dfm}

procedure T_frmNivelServico.BitBtn1Click(Sender: TObject);
var
 nrCompradoNVS:Integer;
begin
     idSeparadaFornecedor:='N';
     if _chkSeparaFornecedor.Checked then
        idSeparadaFornecedor:='S';
  nrCompradoNVS:= StrToIntDef(_edtNrComprador.Text,0);
  nrCd:=_cbxOpcaoCDs.ItemIndex;
  // Se a op??o for geral
  // vai tirar o nr CD da query.
  // Se a 1 for geral
  // vai colocar o dois cd na query
  // Se a op??o 2
  // vai geral nivel cd Tubar?o
  // Se a op??o 3 for geral
  // vai geral nivel cd Sta; Cruz do Sul
    nrCD :=StrToIntDef(copy(_cbxOpcaoCDs.Text,0,2),0);

//  _cdsNivelServico:=AbreNivelServico(0,nrCompradoNVS,nrCd,'',idSeparadaFornecedor);
  _cdsNivelServico:=AbreNivelServicoII(0,nrCompradoNVS,nrCd,'',idSeparadaFornecedor);
  if _cdsNivelServico<>nil then
  begin
     _cdsNivelServico.Open;
     _dsNivelServico.DataSet:=_cdsNivelServico;
     _cdsNivelServico.RecordCount;
    // _cdsNivelServico.IndexFieldNames:='CD_COMPRADOR;ID_CD';
     SetGriNivelServi?o;
  end;
end;

procedure T_frmNivelServico.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure T_frmNivelServico.BitBtn3Click(Sender: TObject);
var
HTML:TStringList;
nmArquivo :String;
begin

Exportar3(_cdsNivelServico,'NivelServivo','Html');





end;

procedure T_frmNivelServico._btnParaExcelClick(Sender: TObject);
begin
 GerarExcel(_cdsNivelServico);
end;

procedure T_frmNivelServico._dbgNivelServi?oDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   with _dbgNivelServi?o do
  begin

    // mude a cor das Linha
    If odd(_cdsNivelServico.RecNo) then
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
   if (Column.Field.FieldName = 'INDICE_FALTA_UNITARIA') or
      (Column.Field.FieldName ='NIVEL_SERVICO_UNITARIO') then
   begin

     if _cdsNivelServico.FieldByName('INDICE_FALTA_UNITARIA').AsFloat<5 then
     begin
       Canvas.Font.Color:= clWhite;
      Canvas.Brush.Color:= clGreen;
      end;
     if (_cdsNivelServico.FieldByName('INDICE_FALTA_UNITARIA').AsFloat>=5) and
        (_cdsNivelServico.FieldByName('INDICE_FALTA_UNITARIA').AsFloat<=10) then
     begin
       Canvas.Font.Color:= clBlack;
      Canvas.Brush.Color:= clYellow;
      end;
     if _cdsNivelServico.FieldByName('INDICE_FALTA_UNITARIA').AsFloat>10 then
     begin
       Canvas.Font.Color:= clWhite;
      Canvas.Brush.Color:= clRed;
      end;
   end;
   if (Column.Field.FieldName = 'INDICE_FALTA_FINANCEIRA') or
      (Column.Field.FieldName ='NIVEL_SERVICO_FINANCEIRA') then
   begin

     if _cdsNivelServico.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat<5 then
     begin
       Canvas.Font.Color:= clWhite;
      Canvas.Brush.Color:= clGreen;
      end;
     if (_cdsNivelServico.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat>=5) and
        (_cdsNivelServico.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat<=10) then
     begin
       Canvas.Font.Color:= clBlack;
      Canvas.Brush.Color:= clYellow;
      end;
     if _cdsNivelServico.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat>10 then
     begin
       Canvas.Font.Color:= clWhite;
      Canvas.Brush.Color:= clRed;
      end;
   end;


    // mude a cor de celulas selecionadas
    if (gdSelected in State) then
    begin
      Canvas.Brush.Color := clblue;
      Canvas.Font.Color := clWhite;
    end;
    // mude a cor das celulas com foco
    if (gdfocused in State) then
    begin
      Canvas.Brush.Color := clblue;
      Canvas.Font.Color := clWhite;
    end;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;


end;

procedure T_frmNivelServico._dbgNivelServi?oTitleClick(Column: TColumn);
begin
//  GeraOrdenacaoMul(_cdsNivelServico,Column,_dsNivelServico.DataSet.FieldByName('CD'))
   GeraOrdenacao(_cdsNivelServico,Column);
end;

procedure T_frmNivelServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmNivelServico.FormShow(Sender: TObject);
begin
 CarregaEmpresa;
end;

procedure T_frmNivelServico.SetGriNivelServi?o;
begin
  if nrcd>=0 then
  begin
   TStringField(_cdsNivelServico.FieldByName('ID_CD')).DisplayLabel:='CD';
   TStringField(_cdsNivelServico.FieldByName('ID_CD')).DisplayWidth:=05;
  end;

  TIntegerField(_cdsNivelServico.FieldByName('CD_COMPRADOR')).DisplayLabel:='Nr.Compr.';
  TIntegerField(_cdsNivelServico.FieldByName('CD_COMPRADOR')).DisplayWidth:=05;

  TStringField(_cdsNivelServico.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayLabel:='Nome Comprador';
  TStringField(_cdsNivelServico.FieldByName('NM_COMPRADOR_REDUZIDO')).DisplayWidth:=20;
  if idSeparadaFornecedor='S' then
  begin
     TIntegerField(_cdsNivelServico.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayLabel:='Nr.Fornec.';
     TIntegerField(_cdsNivelServico.FieldByName('CD_GRUPO_FORNECEDOR')).DisplayWidth:=05;

     TStringField(_cdsNivelServico.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayLabel:='Nome Fornecedor';
     TStringField(_cdsNivelServico.FieldByName('DS_GRUPO_FORNECEDOR')).DisplayWidth:=30;
  end;
  TIntegerField(_cdsNivelServico.FieldByName('NR_ITENS')).DisplayLabel:='Nr.Itens';
  TIntegerField(_cdsNivelServico.FieldByName('NR_ITENS')).DisplayWidth:=05;

  TIntegerField(_cdsNivelServico.FieldByName('NR_ITENS_PER')).DisplayLabel:='Itens Perf.';
  TIntegerField(_cdsNivelServico.FieldByName('NR_ITENS_PER')).DisplayWidth:=05;

  TIntegerField(_cdsNivelServico.FieldByName('NR_ITENS_MED')).DisplayLabel:='Itens Med.';
  TIntegerField(_cdsNivelServico.FieldByName('NR_ITENS_MED')).DisplayWidth:=05;

  TIntegerField(_cdsNivelServico.FieldByName('NR_ITENS_FALTA')).DisplayLabel:='Itens Falta';
  TIntegerField(_cdsNivelServico.FieldByName('NR_ITENS_FALTA')).DisplayWidth:=05;

  TIntegerField(_cdsNivelServico.FieldByName('UNID_ESTOQUE')).DisplayLabel:='Nr. Unid.Estoq.';
  TIntegerField(_cdsNivelServico.FieldByName('UNID_ESTOQUE')).DisplayFormat:='###,###,##0';
  TIntegerField(_cdsNivelServico.FieldByName('UNID_ESTOQUE')).DisplayWidth:=05;

  TFloatField(_cdsNivelServico.FieldByName('INDICE_FALTA_UNITARIA')).DisplayLabel:='% Indice Falta(IFU)';
  TFloatField(_cdsNivelServico.FieldByName('INDICE_FALTA_UNITARIA')).DisplayWidth:=06;
  TFloatField(_cdsNivelServico.FieldByName('INDICE_FALTA_UNITARIA')).DisplayFormat:='##0.00';

  TFloatField(_cdsNivelServico.FieldByName('NIVEL_SERVICO_UNITARIO')).DisplayLabel:='% Nivel Serv.(NSU) ';
  TFloatField(_cdsNivelServico.FieldByName('NIVEL_SERVICO_UNITARIO')).DisplayWidth:=06;
  TFloatField(_cdsNivelServico.FieldByName('NIVEL_SERVICO_UNITARIO')).DisplayFormat:='##0.00';

  TFloatField(_cdsNivelServico.FieldByName('INDICE_FALTA_FINANCEIRA')).DisplayLabel:='% Indice Falta Finac.(IFF)';
  TFloatField(_cdsNivelServico.FieldByName('INDICE_FALTA_FINANCEIRA')).DisplayWidth:=06;
  TFloatField(_cdsNivelServico.FieldByName('INDICE_FALTA_FINANCEIRA')).DisplayFormat:='##0.00';

  TFloatField(_cdsNivelServico.FieldByName('NIVEL_SERVICO_FINANCEIRA')).DisplayLabel:='% Nivel Serv. Finac.(NSF)';
  TFloatField(_cdsNivelServico.FieldByName('NIVEL_SERVICO_FINANCEIRA')).DisplayWidth:=06;
  TFloatField(_cdsNivelServico.FieldByName('NIVEL_SERVICO_FINANCEIRA')).DisplayFormat:='##0.00';

end;

procedure T_frmNivelServico.Exportar(DataSet: TDataSet; Arq: string; Ext: string);
var
  shtml     : widestring;
  htmlfile  : TextFile;
  i         : integer;
  AvailableFields: set of  TFieldType;
  bookmark : TBookmark;
begin
  bookmark := dataset.Bookmark;
  DataSet.DisableControls;
  DataSet.First;
  AvailableFields:=[ftInteger, ftWideString, ftDate,  ftBcd,ftFMTBcd,ftmemo, ftstring];
// --> cria o c?digo html da p?gina
  shtml:= '<html> <head>'+#13#10;
  shtml:= shtml + '<title>'+'Indicadores Compras'+'</title></head>' + #13#10;
  shtml:= shtml + '<body>' + #13#10;
  shtml:= shtml + '<script>'+#13+'function cor_tabela(id){'+#13+
                  'var cor1="#dae5e3";'+#13+
                  'var cor2="#fff";'+#13+
                  'var x=document.getElementById(id).getElementsByTagName("tr");'+#13+
                  'for(i=0;i<x.length;i++)'+#13+
                  'x[i].style.backgroundColor=(i%2==0)?cor1:cor2;'+#13+
                  '}'+#13+
                  '</script>'+#13+#10;
  shtml:= shtml + '<style>'+#13+
                  'table {'+#13+
                        'border=2 2px #000;'+#13+
                        'font-family:Verdana, Geneva, sans-serif;'+#13+
                        'font-size:11px;'+#13+
                        'background:#930;'+#13+
                  '}'+#13+
                  'th {'+#13+
                        'color:#FFF;'+#13+
                        'background:#930;'+#13+
                        'height:25px;'+#13+
                        'vertical-align:middle;'+#13+
                  '}'+#13+
                  '</style>'+#13+#10;
  //header da tabela
  shtml:= shtml + '<table id="tb" cellspacing="1" width="100%">' + #13#10;
  shtml:= shtml + '<tr>' + #13#10;
  for i:=0 to DataSet.FieldCount-1 do
  begin
    if DataSet.Fields[i].DataType in AvailableFields  then
    begin
      shtml:= shtml + '<th>';
      shtml:= shtml +
              '' +
              DataSet.Fields.Fields[i].DisplayName +
              '';
      shtml:= shtml + '</th>' + #13#10;
    end;
  end;{for}
  shtml:= shtml + '</tr>' + #13#10;

  //corpo da tabela
  while not DataSet.Eof do
  begin
    shtml:= shtml + '<tr>' + #13#10;
    for i:=0 to DataSet.FieldCount-1 do
    begin
      if DataSet.Fields.Fields[i].DataType in AvailableFields then
      begin
        if  ((i= 1) OR (i= 3) OR (i= 4) OR (i= 5)
        {OR (i= 8)OR (i= 9)OR (i= 10)
  ///             OR (i= 11)OR (i= 12)OR (i= 13)OR (i= 14) OR (i= 16)OR (i= 17) OR (i= 18)
  //           OR (i= 19)OR (i= 20) OR (i= 22) OR (i= 23)OR (i= 26) OR (i= 27)OR (i= 28)}
     AND  (DataSet.Fields.Fields[i].DataType = ftFmtBcd)) then
            shtml:= shtml + '<td align="right">'+ formatfloat('#####0', DataSet.Fields.Fields[i].AsFloat);
        if {((i<>0) AND (i<> 5)AND (i<>6) AND (i<> 7) AND (i<> 8)AND (i<> 9)AND (i<> 10)
             AND (i<> 11)AND (i<> 12)AND (i<> 13)AND (i<> 14)AND (i<> 16)
             AND (i<> 17)AND (i<> 18)AND (i<> 19)AND (i<> 20)AND (i<> 22)AND (i<> 23)
             AND (i<> 26) AND (i<> 27) AND (i<> 28)AND}
              ((i<> 1) and  (i<>3) and(i<>4) and (i<>5) and (DataSet.Fields.Fields[i].DataType = ftFmtBcd)) then
          shtml:= shtml + '<td align="right">'+ formatfloat('###,##0.00', DataSet.Fields.Fields[i].AsFloat);
        if (DataSet.Fields.Fields[i].DataType = ftInteger) or
            (DataSet.Fields.Fields[i].DataType = ftBcd)  then
        begin
          shtml:= shtml + '<td align="right">'+ formatfloat('###,###,##0', DataSet.Fields.Fields[i].AsInteger);

        end;
        if (DataSet.Fields.Fields[i].DataType <> ftBcd) and
           (DataSet.Fields.Fields[i].DataType <> ftFmtBcd) and
           (DataSet.Fields.Fields[i].DataType <> ftInteger) then
        begin
          shtml:= shtml + '<td>'+DataSet.Fields.Fields[i].AsString;
          shtml:= shtml + '</td>' + #13#10;
        end;
      end;
    end;{for}
    shtml:= shtml + '</tr>' + #13#10;
    DataSet.Next;
  end;{while}
  shtml:= shtml + '</table>' + #13#10;
  //script para zebrar a tabela
  shtml:= shtml + '<script>cor_tabela("tb");</script>'+#13+#10;
  //finalizando a p?gina
  shtml:= shtml + '</body></html>';
// --> salva o arquivo html
  AssignFile(htmlfile,ChangeFileExt(Arq,'.'+Ext));
  Rewrite(htmlfile);
  WriteLn(htmlfile, shtml);
  CloseFile(htmlfile);
  DataSet.Bookmark := bookmark;
  DataSet.EnableControls;
  ShellExecute(Handle, 'open',PChar(pathSistema+ChangeFileExt(Arq,'.'+Ext)),nil,nil,1);

end;



procedure T_frmNivelServico.Exportar2(DataSet: TDataSet; Arq: string; Ext: string);
const
 Enter = #13+#10;
 VERDE   ='00AA00';
 AMARELO ='FFFF00';
 VERMELHO='FF0000'+'><font color = white ';

var
  shtml     : widestring;
  htmlfile  : TextFile;
  i         : integer;

  AvailableFields: set of  TFieldType;
  bookmark : TBookmark;
  idCor :String;

begin
  bookmark := dataset.Bookmark;
  DataSet.DisableControls;
  DataSet.First;
  AvailableFields:=[ftInteger, ftWideString, ftDate,  ftBcd,ftFMTBcd,ftmemo, ftstring];

// --> cria o c?digo html da p?gina
  shtml:= '<html> <head>'+#13#10;
  shtml:= shtml + '<title>'+'Indicadores Compras'+'</title></head>' + #13#10;
  shtml:= shtml + '<body>' + #13#10;
  shtml:= shtml + '<script>'+#13+'function cor_tabela(id){'+#13+
                  'var cor1="#dae5e3";'+#13+
                  'var cor2="#fff";'+#13+
                  'var x=document.getElementById(id).getElementsByTagName("tr");'+#13+
                  'for(i=0;i<x.length;i++)'+#13+
                  'x[i].style.backgroundColor=(i%2==0)?cor1:cor2;'+#13+
                  '}'+#13+
                  '</script>'+#13+#10;


 shtml:= shtml+'<body bgcolor=#FFFFFF link=#000000 vlink=#000000 alink=#B5B5B5>'
   +'<center>'
   +'<font size=5>'
   +'Critica de Estoque GAM'+'</font>'
   +'<BR><BR>';

  shtml:= shtml + '<style>'+#13+
                  'table {'+#13+
                        'border=2 2px #000;'+#13+
                        'font-family:Verdana, Geneva, sans-serif;'+#13+
                        'font-size:11px;'+#13+
                        'background:#930;'+#13+
                  '}'+#13+
                  'th {'+#13+
                        'color:#FFF;'+#13+
                        'background:#930;'+#13+
                        'height:25px;'+#13+
                        'vertical-align:middle;'+#13+
                  '}'+#13+
                  '</style>'+#13+#10;



   shtml:= shtml+'<body bgcolor=#FFFFFF link=#000000 vlink=#000000 alink=#B5B5B5>'
   +'<center>'
   +'<font size=2>'
   +'Nivel Servi?o por Comprador'+'</font>'
   +'<BR><BR>';

  shtml:= shtml + '<style>'+#13+
                  'table {'+#13+
                        'border=2 2px #000;'+#13+
                        'font-family:Verdana, Geneva, sans-serif;'+#13+
                        'font-size:11px;'+#13+
                        'background:#930;'+#13+
                  '}'+#13+
                  'th {'+#13+
                        'color:#FFF;'+#13+
                        'background:#930;'+#13+
                        'height:25px;'+#13+
                        'vertical-align:middle;'+#13+
                  '}'+#13+
                  '</style>'+#13+#10;
  //header da tabela
  shtml:= shtml + '<table id="tb" cellspacing="1" width="100%">' + #13#10;
  shtml:= shtml + '<tr>' + #13#10;
  for i:=0 to DataSet.FieldCount-1 do
  begin
    if DataSet.Fields[i].DataType in AvailableFields  then
    begin
      shtml:= shtml + '<th>';
      shtml:= shtml +
              '' +
              DataSet.Fields.Fields[i].DisplayName +
              '';
      shtml:= shtml + '</th>' + #13#10;
    end;
  end;{for}
  shtml:= shtml + '</tr>' + #13#10;

  //corpo da tabela
  while not DataSet.Eof do
  begin
    shtml:= shtml + '<tr>' + #13#10;
    for i:=0 to DataSet.FieldCount-1 do
    begin
      if DataSet.Fields.Fields[i].DataType in AvailableFields then
      begin
        idCor:='';
        if (i=8) or (i=9) then
        begin
        if DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat<5 then
           idCor:=VERDE;
        if (DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat>=5)  and
           (DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat<=10) then
           idCor:=AMARELO;
        if DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat>10 then
           idCor:=VERMELHO;
        end;
        if (i=10) or (i=11) then
        begin
        if DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat<5 then
           idCor:=VERDE;
        if (DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat>=5)  and
           (DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat<=10) then
           idCor:=AMARELO;
        if DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat>10 then
           idCor:=VERMELHO;
        end;

        if  ((i= 1) OR (i= 3) OR (i= 4) OR (i= 5)or (i= 6) or (i= 7)) AND  (DataSet.Fields.Fields[i].DataType = ftFmtBcd) then
            shtml:= shtml + '<td align="right">'+ formatfloat('###,###,##0', DataSet.Fields.Fields[i].AsFloat);
        if ((i<> 1) and  (i<>3) and(i<>4) and (i<>5) and  (i<>6 )and  (i<>7 ) and (DataSet.Fields.Fields[i].DataType = ftFmtBcd)) then
          shtml:= shtml + '<td align="right" bgcolor='+idCor+'>'+ formatfloat('###,##0.00', DataSet.Fields.Fields[i].AsFloat);
        if (DataSet.Fields.Fields[i].DataType = ftInteger) or
            (DataSet.Fields.Fields[i].DataType = ftBcd)  then
        begin
          shtml:= shtml + '<td align="right">'+ formatfloat('###,###,##0', DataSet.Fields.Fields[i].AsInteger);

        end;
        if (DataSet.Fields.Fields[i].DataType <> ftBcd) and
           (DataSet.Fields.Fields[i].DataType <> ftFmtBcd) and
           (DataSet.Fields.Fields[i].DataType <> ftInteger) then
        begin
          shtml:= shtml + '<td bgcolor='+''+'>' +DataSet.Fields.Fields[i].AsString;
          shtml:= shtml + '</td>' + #13#10;
        end;
      end;
    end;{for}
    shtml:= shtml + '</tr>' + #13#10;
    DataSet.Next;
  end;{while}
  shtml:= shtml + '</table>' + #13#10;
  //script para zebrar a tabela
  shtml:= shtml + '<script>cor_tabela("tb");</script>'+#13+#10;
  //finalizando a p?gina
  shtml:= shtml + '</body></html>';
// --> salva o arquivo html
  AssignFile(htmlfile,ChangeFileExt(Arq,'.'+Ext));
  Rewrite(htmlfile);
  WriteLn(htmlfile, shtml);
  CloseFile(htmlfile);
  DataSet.Bookmark := bookmark;
  DataSet.EnableControls;
  ShellExecute(Handle, 'open',PChar(pathSistema+ChangeFileExt(Arq,'.'+Ext)),nil,nil,1);
end;


procedure T_frmNivelServico.Exportar3(DataSet: TDataSet; Arq: string; Ext: string);
const
 Enter = #13+#10;
 VERDE   ='00AA00';
 AMARELO ='FFFF00';
 VERMELHO='FF0000'+'><font color = white ';

var
  i         : integer;

  AvailableFields: set of  TFieldType;
  bookmark : TBookmark;
  idCor :String;

begin
  bookmark := dataset.Bookmark;
  DataSet.DisableControls;
  DataSet.First;
  AvailableFields:=[ftInteger, ftWideString, ftDate,  ftBcd,ftFMTBcd,ftmemo, ftstring];

// --> cria o c?digo html da p?gina
  shtml:= '<html> <head>'+#13#10;
  shtml:= shtml + '<title>'+'Indicadores Compras'+'</title></head>' + #13#10;
  shtml:= shtml + '<body>' + #13#10;
  shtml:= shtml + '<script>'+#13+'function cor_tabela(id){'+#13+
                  'var cor1="#dae5e3";'+#13+
                  'var cor2="#fff";'+#13+
                  'var x=document.getElementById(id).getElementsByTagName("tr");'+#13+
                  'for(i=0;i<x.length;i++)'+#13+
                  'x[i].style.backgroundColor=(i%2==0)?cor1:cor2;'+#13+
                  '}'+#13+
                  '</script>'+#13+#10;


 shtml:= shtml+'<body bgcolor=#FFFFFF link=#000000 vlink=#000000 alink=#B5B5B5>'
   +'<center>'
   +'<font size=5>'
   +'Critica de Estoque GAM'+'</font>'
   +'<BR><BR>';
  AssignFile(htmlfile,ChangeFileExt(Arq,'.'+Ext));
   GeraTabelaIndiceComprado(_cdsNivelServico);
// --> salva o arquivo html
  Rewrite(htmlfile);
  WriteLn(htmlfile, shtml);
  CloseFile(htmlfile);
  DataSet.Bookmark := bookmark;
  DataSet.EnableControls;
  ShellExecute(Handle, 'open',PChar(pathSistema+ChangeFileExt(Arq,'.'+Ext)),nil,nil,1);
end;


//
//
//

procedure T_frmNivelServico.GeraTabelaIndiceComprado(DataSet: TDataSet);
const
 Enter = #13+#10;
 VERDE   ='00AA00';
 AMARELO ='FFFF00';
 VERMELHO='FF0000'+'><font color = white ';

var
  i         : integer;

  AvailableFields: set of  TFieldType;
  bookmark : TBookmark;
  idCor :String;

begin
  bookmark := dataset.Bookmark;
  DataSet.DisableControls;
  DataSet.First;
  AvailableFields:=[ftInteger, ftWideString, ftDate,  ftBcd,ftFMTBcd,ftmemo, ftstring];

{// --> cria o c?digo html da p?gina
  shtml:= '<html> <head>'+#13#10;
  shtml:= shtml + '<title>'+'Indicadores Compras'+'</title></head>' + #13#10;
  shtml:= shtml + '<body>' + #13#10;
  shtml:= shtml + '<script>'+#13+'function cor_tabela(id){'+#13+
                  'var cor1="#dae5e3";'+#13+
                  'var cor2="#fff";'+#13+
                  'var x=document.getElementById(id).getElementsByTagName("tr");'+#13+
                  'for(i=0;i<x.length;i++)'+#13+
                  'x[i].style.backgroundColor=(i%2==0)?cor1:cor2;'+#13+
{                 +#13+
   //               '</script>'+#13+#10;}

  shtml:= shtml + '<style>'+#13+
                  'table {'+#13+
                        'border=2 2px #000;'+#13+
                        'font-family:Verdana, Geneva, sans-serif;'+#13+
                        'font-size:11px;'+#13+
                        'background:#930;'+#13+
                  '}'+#13+
                  'th {'+#13+
                        'color:#FFF;'+#13+
                        'background:#930;'+#13+
                        'height:25px;'+#13+
                        'vertical-align:middle;'+#13+
                  '}'+#13+
                  '</style>'+#13+#10;


   shtml:= shtml+'<body bgcolor=#FFFFFF link=#000000 vlink=#000000 alink=#B5B5B5>'
   +'<center>'
   +'<font size=2>'
   +'Nivel Servi?o por Comprador'+'</font>'
   +'<BR><BR>';

  shtml:= shtml + '<style>'+#13+
                  'table {'+#13+
                        'border=2 2px #000;'+#13+
                        'font-family:Verdana, Geneva, sans-serif;'+#13+
                        'font-size:11px;'+#13+
                        'background:#930;'+#13+
                  '}'+#13+
                  'th {'+#13+
                        'color:#FFF;'+#13+
                        'background:#930;'+#13+
                        'height:25px;'+#13+
                        'vertical-align:middle;'+#13+
                  '}'+#13+
                  '</style>'+#13+#10;
  //header da tabela
  shtml:= shtml + '<table id="tb" cellspacing="1" width="100%">' + #13#10;
  shtml:= shtml + '<tr>' + #13#10;
  for i:=0 to DataSet.FieldCount-1 do
  begin
    if DataSet.Fields[i].DataType in AvailableFields  then
    begin
      shtml:= shtml + '<th>';
      shtml:= shtml +
              '' +
              DataSet.Fields.Fields[i].DisplayName +
              '';
      shtml:= shtml + '</th>' + #13#10;
    end;
  end;{for}
  shtml:= shtml + '</tr>' + #13#10;

  //corpo da tabela
  while not DataSet.Eof do
  begin
    shtml:= shtml + '<tr>' + #13#10;
    for i:=0 to DataSet.FieldCount-1 do
    begin
      if DataSet.Fields.Fields[i].DataType in AvailableFields then
      begin
        idCor:='';
        if idSeparadaFornecedor='N' then
        begin
        if (i=8) or (i=9) then
        begin
        if DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat<5 then
           idCor:=VERDE;
        if (DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat>=5)  and
           (DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat<=10) then
           idCor:=AMARELO;
        if DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat>10 then
           idCor:=VERMELHO;
        end;
        if (i=10) or (i=11) then
        begin
        if DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat<5 then
           idCor:=VERDE;
        if (DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat>=5)  and
           (DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat<=10) then
           idCor:=AMARELO;
        if DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat>10 then
           idCor:=VERMELHO;
        end;
        end;
        if idSeparadaFornecedor='S' then
        begin
        if (i=10) or (i=11) then
        begin
        if DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat<5 then
           idCor:=VERDE;
        if (DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat>=5)  and
           (DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat<=10) then
           idCor:=AMARELO;
        if DataSet.FieldByName('INDICE_FALTA_UNITARIA').AsFloat>10 then
           idCor:=VERMELHO;
        end;
        if (i=12) or (i=13) then
        begin
        if DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat<5 then
           idCor:=VERDE;
        if (DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat>=5)  and
           (DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat<=10) then
           idCor:=AMARELO;
        if DataSet.FieldByName('INDICE_FALTA_FINANCEIRA').AsFloat>10 then
           idCor:=VERMELHO;
        end;
        end;

        if  ((i= 1) OR (i= 3) OR (i= 4) OR (i= 5)or (i= 6) or (i= 7)) AND  (DataSet.Fields.Fields[i].DataType = ftFmtBcd) then
            shtml:= shtml + '<td align="right">'+ formatfloat('###,###,##0', DataSet.Fields.Fields[i].AsFloat);
        if ((i<> 1) and  (i<>3) and(i<>4) and (i<>5) and  (i<>6 )and  (i<>7 ) and (DataSet.Fields.Fields[i].DataType = ftFmtBcd)) then
          shtml:= shtml + '<td align="right" bgcolor='+idCor+'>'+ formatfloat('###,##0.00', DataSet.Fields.Fields[i].AsFloat);
        if (DataSet.Fields.Fields[i].DataType = ftInteger) or
            (DataSet.Fields.Fields[i].DataType = ftBcd)  then
        begin
          shtml:= shtml + '<td align="right">'+ formatfloat('###,###,##0', DataSet.Fields.Fields[i].AsInteger);

        end;
        if (DataSet.Fields.Fields[i].DataType <> ftBcd) and
           (DataSet.Fields.Fields[i].DataType <> ftFmtBcd) and
           (DataSet.Fields.Fields[i].DataType <> ftInteger) then
        begin
          shtml:= shtml + '<td bgcolor='+''+'>' +DataSet.Fields.Fields[i].AsString;
          shtml:= shtml + '</td>' + #13#10;
        end;
      end;
    end;{for}
    shtml:= shtml + '</tr>' + #13#10;
    DataSet.Next;
  end;{while}
  shtml:= shtml + '</table>' + #13#10;
  //script para zebrar a tabela
  shtml:= shtml + '<script>cor_tabela("tb");</script>'+#13+#10;
  //finalizando a p?gina
  shtml:= shtml + '</body></html>';
// --> salva o arquivo html
//  AssignFile(htmlfile,ChangeFileExt(Arq,'.'+Ext));
  Rewrite(htmlfile);
  WriteLn(htmlfile, shtml);
  DataSet.Bookmark := bookmark;
  DataSet.EnableControls;
end;


{function T_frmNivelServico.AddDadosNivel;
begin
    'ID_CD'
    'CD_COMPRADOR,
    'NM_COMPRADOR_REDUZIDO'
    if idAgrupaFornecedor='S' then
    begin
     'CD_GRUPO_FORNECEDOR'
     'DS_GRUPO_FORNECEDOR,
    end;
     'NR_ITENS'
     'NR_ITENS_MED'
     'NR_ITENS_PER'
     'NR_ITENS_FALTA'
     'UNID_ESTOQUE'
     'INDICE_FALTA_UNITARIA'
     'NIVEL_SERVICO_UNITARIO'


end;}


function T_frmNivelServico.ColorToHtml(mColor: TColor): string;
begin
  mColor := ColorToRGB(mColor);
  Result := Format('#%.2x%.2x%.2x', [GetRValue(mColor), GetGValue(mColor), GetBValue(mColor)]);
end;

function T_frmNivelServico.StrToHtml(mStr: string; mFont: TFont): string;
var
  vLeft, vRight: string;
begin
  Result := mStr;
  Result := StringReplace(Result, '&', '&', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '<', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '>', [rfReplaceAll]);
  if not Assigned(mFont) then Exit;
  vLeft := Format('',[mFont.Name, ColorToHtml(mFont.Color)]);
  vRight := '';
  if fsBold in mFont.Style then
  begin
    vLeft := vLeft + '';
    vRight := '' + vRight;
  end;
  if fsItalic in mFont.Style then
  begin
    vLeft := vLeft + '';
    vRight := '' + vRight;
  end;

  if fsUnderline in mFont.Style then
  begin
    vLeft := vLeft + '';
    vRight := '' + vRight;
  end;
  if fsStrikeOut in mFont.Style then
  begin
    vLeft := vLeft + '';
    vRight := '' + vRight;
  end;
  Result := vLeft + Result + vRight;
end;

function T_frmNivelServico.DBGridToHtmlTable(mDBGrid: TDBGrid; mStrings: TStrings; mCaption: TCaption): Boolean;
const
  cAlignText: array[TAlignment] of string = ('LEFT', 'RIGHT', 'CENTER');
var
  vColFormat: string;
  vColText: string;
  vAllWidth: Integer;
  vWidths: array of Integer;
  vBookmark: TBookmark;
  I, J: Integer;
begin
  Result := False;
  if not Assigned(mStrings) then Exit;
  if not Assigned(mDBGrid) then Exit;
  if not Assigned(mDBGrid.DataSource) then Exit;
  if not Assigned(mDBGrid.DataSource.DataSet) then Exit;
  if not mDBGrid.DataSource.DataSet.Active then Exit;
  vBookmark := mDBGrid.DataSource.DataSet.Bookmark;
  mDBGrid.DataSource.DataSet.DisableControls;
  try
    J := 0;
    vAllWidth := 0;
    for I := 0 to mDBGrid.Columns.Count - 1 do
       if mDBGrid.Columns[I].Visible then
       begin
        Inc(J);
        SetLength(vWidths, J);
        vWidths[J - 1] := mDBGrid.Columns[I].Width;
        Inc(vAllWidth, mDBGrid.Columns[I].Width);
      end;
     if J <= 0 then Exit;
     mStrings.Clear;
    mStrings.Add(Format('',[]));
  finally
    mDBGrid.DataSource.DataSet.Bookmark := vBookmark;
    mDBGrid.DataSource.DataSet.EnableControls;
    vWidths := nil;
 end;

 Result := True;

end;



procedure T_frmNivelServico.ExpHTML(DataSet: TDataSet; Arq: string);
var
  sl: TStringList;
  dp: TDataSetTableProducer;
  i:Integer;
begin
  sl := TStringList.Create;
  try
    dp := TDataSetTableProducer.Create(nil);
    try
      DataSet.First;
      dp.DataSet := DataSet;
      dp.TableAttributes.Border := 1;
       for I := 0 to dp.DataSet.FieldCount-1 do
           if dp.DataSet.fields[i].DataType=ftFmtBcd   then
            dp.DataSet.fields[i].Alignment:=taRightJustify;
      sl.Text := dp.Content;

      sl.SaveToFile(Arq);
    finally
      dp.free;
    end;
  finally
    sl.free;
  end;
end;




procedure T_frmNivelServico.CarregaEmpresa;
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
    tempQuery.SQL.Add('ID_EMPRESA_FISICA=''S''');
    tempQuery.SQL.Add('and ID_SITUACAO_EMPRESA=''A''');
    tempQuery.SQL.Add('AND ID_OPERACAO_REDE=''N''');
    tempQuery.SQL.Add('ORDER BY 1');
    tempQuery.Open;
    tempQuery.First;

    _cbxOpcaoCDs.Clear;
    _cbxOpcaoCDs.Items.Add('00 - Todos');
    while not tempQuery.eof do
    begin
       _cbxOpcaoCDs.Items.Add( FormatFloat('00',tempQuery.FieldByName('CD_EMPRESA_FISICA').AsInteger)+' - '+
                                tempQuery.FieldByName('nm_empresa').AsString );
      tempQuery.Next;
    end;
    _cbxOpcaoCDs.ItemIndex:=0;

  finally
    tempQuery.Close;
    tempQuery.Free;
  end;
end;

end.
