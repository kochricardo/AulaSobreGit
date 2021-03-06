unit ufrmModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ToolWin, ActnList, ImgList, StdCtrls, Buttons,
  Grids, DBGrids, ExtCtrls, DB,DBClient, uRotinasGenericas, uDm;

type
  T_frmModelo = class(TForm)
    ImageList1: TImageList;
    ActionList1: TActionList;
    acIncluir: TAction;
    acAlterar: TAction;
    acExcluir: TAction;
    acVisualizar: TAction;
    acImprimir: TAction;
    acGravar: TAction;
    acCancelar: TAction;
    acSair: TAction;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    PageControl1: TPageControl;
    tbCadastro: TTabSheet;
    tbConsulta: TTabSheet;
    Panel1: TPanel;
    _cbxCampos: TComboBox;
    _edtPesquisa: TEdit;
    BitBtn1: TBitBtn;
    _lbPesquisa: TLabel;
    _labCampos: TLabel;
    MainMenu1: TMainMenu;
    Manuteno1: TMenuItem;
    Incluir1: TMenuItem;
    acAlterar1: TMenuItem;
    acExcluir1: TMenuItem;
    Consultar1: TMenuItem;
    Cancelar1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    _dbgPesquisa: TDBGrid;
    _lbeDesativaFiltro: TLabel;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton9: TToolButton;
    ds: TDataSource;
    ToolButton6: TToolButton;
    StatusBar1: TStatusBar;
    dsPesquisa: TDataSource;
    BitBtn2: TBitBtn;
    procedure acIncluirExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acAlterarExecute(Sender: TObject);
    procedure acVisualizarExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acIncluirUpdate(Sender: TObject);
    procedure acGravarUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure _lbeDesativaFiltroClick(Sender: TObject);
    procedure _dbgPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure _dbgPesquisaDblClick(Sender: TObject);
    procedure _edtPesquisaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _dbgPesquisaTitlevarlick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    ListaField :Array of Integer;
    function CriaIndice( nmIndice, nmCampo: String; nrIndice: Integer): Boolean;
    function ApagaIndice: Boolean;
  public
    { Public declarations }
    nrConta:Integer;
    nmIndiceCriado:String;
  end;

var
  _frmModelo: T_frmModelo;

implementation

//uses uGen?rica;


{$R *.dfm}

procedure T_frmModelo.acAlterarExecute(Sender: TObject);
begin
 if ds.DataSet.Active then
 begin
  PageControl1.ActivePage := tbCadastro;
  ds.DataSet.Edit;
 end;

end;

procedure T_frmModelo.acCancelarExecute(Sender: TObject);
begin
 if Confirma('Deseja Realmente Cancelar OPera??o?',MB_DEFBUTTON2)=idYes then
 begin
 ds.DataSet.Cancel;
 if ds.DataSet is TClientDataSet then
    TClientDataSet(ds.DataSet).CancelUpdates;
 PageControl1.ActivePage:=tbConsulta;
 end;
end;

procedure T_frmModelo.acVisualizarExecute(Sender: TObject);
begin
 ApagaIndice;
 dsPesquisa.DataSet.Close;
 dsPesquisa.DataSet.Open;
 if PageControl1.ActivePage = tbConsulta then
 begin
//    tbConsulta.TabVisible:=false;
  //  tbCadastro.TabVisible:=true;
    PageControl1.ActivePage:= tbCadastro;
 end
 else
 begin
   PageControl1.ActivePage := tbConsulta;
  //  tbConsulta.TabVisible:=true;
  //  tbCadastro.TabVisible:=false;

 end;

end;

procedure T_frmModelo.acExcluirExecute(Sender: TObject);
begin
 if not dsPesquisa.DataSet.IsEmpty then
 begin
   dsPesquisa.DataSet.Delete;
  if dsPesquisa.DataSet is TClientDataSet then
     TClientDataSet(dsPesquisa.DataSet).ApplyUpdates(0);
 end;
end;

procedure T_frmModelo.acGravarExecute(Sender: TObject);
var
 msg:string;
begin
 msg:='Confirma a Inclus?o do Registro ?';
 if ds.dataset.State=dsEdit then
    msg:='Confirma a Altera??o do Registro ?';
if Confirma(msg,MB_DEFBUTTON1)=IDYES then
begin
 ds.DataSet.Post;
 if ds.DataSet is TClientDataSet then
    TClientDataSet(ds.DataSet).ApplyUpdates(0);
 dsPesquisa.DataSet.Close;
 dsPesquisa.DataSet.Open;
// CriaIndice('','NROV_V',0);
 PageControl1.ActivePage:=tbConsulta;
end;

end;

procedure T_frmModelo.acGravarUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled:= ds.dataset.State in[dsInsert,dsEdit];
 _lbeDesativaFiltro.Visible := ds.DataSet.Filtered;

end;

procedure T_frmModelo.acImprimirExecute(Sender: TObject);
begin
   ShowMessage('Implementa??o Futura');
end;

procedure T_frmModelo.acIncluirExecute(Sender: TObject);
begin
 PageControl1.ActivePage := tbCadastro;
 if not ds.DataSet.Active then
     ds.DataSet.Open;
 ds.DataSet.Insert;
end;

procedure T_frmModelo.acIncluirUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled:= ds.dataset.State in[dsInactive,dsBrowse];

end;

procedure T_frmModelo.acSairExecute(Sender: TObject);
begin
 close;
end;

procedure T_frmModelo.BitBtn1Click(Sender: TObject);
begin

 if (_cbxCampos.Text<> EmptyStr) and (_edtPesquisa.Text <> EmptyStr) then
 begin
   CriaIndice('',dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].FieldName,0);
   if (dspesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].DataType in[ftString,ftWideString,ftFixedChar]) then
   begin
    dsPesquisa.DataSet.Filter := 'UPPER ('+dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].FieldName +') LIKE '+QuotedStr(UpperCase(_edtPesquisa.Text)+'%');
    dsPesquisa.DataSet.Filtered:=TRUE;
   end;
   if (dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].DataType in[ftInteger,ftBCD,ftFloat,ftFMTBcd]) then
   begin
     dsPesquisa.DataSet.Filter := dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].FieldName +' = '+_edtPesquisa.Text;
     dsPesquisa.DataSet.Filtered:=TRUE;
   end;
   if (dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].DataType in[ftDate,ftDateTime,ftTimeStamp]) then
   begin
     dsPesquisa.DataSet.Filter := dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].FieldName +' = '+QuotedStr(_edtPesquisa.Text);
     dsPesquisa.DataSet.Filtered:=TRUE;
   end;
   //dsPesquisa.DataSet.CLOSE;
   if not dsPesquisa.DataSet.Active then
      dsPesquisa.DataSet.Open;
 end
 else
  if dsPesquisa.DataSet.Active then
      dsPesquisa.DataSet.Filtered:=false;

    _lbeDesativaFiltro.Visible:=true;


end;

procedure T_frmModelo.BitBtn2Click(Sender: TObject);
begin
 dsPesquisa.DataSet.Filtered:=false;
end;

procedure T_frmModelo._dbgPesquisaDblClick(Sender: TObject);
begin
  if nmIndiceCriado <> '' then
  begin
     TClientDataSet(dsPesquisa.DataSet).DeleteIndex(nmIndiceCriado);
     nmIndiceCriado:='';
  end;
 if PageControl1.ActivePage = tbConsulta then
    PageControl1.ActivePage:= tbCadastro
 else
   PageControl1.ActivePage := tbConsulta;

end;

procedure T_frmModelo._dbgPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 If odd(dsPesquisa.DataSet.RecNo) then
 begin
  _dbgPesquisa.Canvas.Font.Color:= clBlack;
  _dbgPesquisa.Canvas.Brush.Color:= clSkyBlue;
 end
 else
 begin
  _dbgPesquisa.Canvas.Font.Color:= clBlack;
  _dbgPesquisa.Canvas.Brush.Color:= clWhite;
 end;
 _dbgPesquisa.Canvas.FillRect(Rect);
 _dbgPesquisa.DefaultDrawDataCell(Rect,_dbgPesquisa.columns[datacol].field, State);

end;

procedure T_frmModelo._dbgPesquisaTitlevarlick(Column: TColumn);
 var
 campo :String;
begin
  campo:= Column.FieldName;

   CriaIndice('',campo,0);
end;

procedure T_frmModelo._edtPesquisaClick(Sender: TObject);
begin
 if trim(_edtPesquisa.Text)='' then
   dsPesquisa.DataSet.Filtered:=false;

end;

procedure T_frmModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure T_frmModelo.FormCreate(Sender: TObject);
var
 i,J: Integer;
begin
  //ConectaBanco('SIPRD','PRDDM','SIDM', TCustomAttribute.Create);
 if dsPesquisa.dataset<>nil then
 begin
  for I := 0 to Pred(dsPesquisa.dataset.fieldCount) do
  begin
    if dsPesquisa.dataset.fields[I].datatype in [ftString,ftWideString,ftFixedChar,ftInteger,ftDate,ftDateTime,ftTimeStamp,ftBCD,ftFMTBcd] then
    begin
       J:=_cbxCampos.items.add(dsPesquisa.dataset.fields[i].DisplayName);
       SetLength(ListaField,HIGH(ListaField)+2);
       ListaField[j]:=i;
    end;
    if not dsPesquisa.DataSet.Active then
    begin
       dsPesquisa.DataSet.Open;
    end;
  end;
  end;


end;

procedure T_frmModelo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of

   VK_RETURN : begin
                 if not (ActiveControl is TDBGrid) then
                        Perform(WM_NEXTDLGCTL, 0, 0)
                else if (ActiveControl is TDBGrid) then
                begin
                  with TDBGrid(ActiveControl) do
                  if selectedindex < (fieldcount -1) then
                    selectedindex := selectedindex +1
                  else
                   selectedindex := 0;
                end;
               end;

  end;
end;

procedure T_frmModelo._lbeDesativaFiltroClick(Sender: TObject);
begin
 dsPesquisa.DataSet.Filtered:=false;
end;

function T_frmModelo.CriaIndice(nmIndice,nmCampo:String;nrIndice:Integer):Boolean;
begin
   if nmIndiceCriado <> '' then
      TClientDataSet(dsPesquisa.DataSet).DeleteIndex(nmIndiceCriado);
  if nrConta=0 then
  begin
     TClientDataSet(dsPesquisa.DataSet).AddIndex('idx'+nmCampo+'C',nmCampo,[ixCaseInsensitive]);
     TClientDataSet(dsPesquisa.DataSet).IndexName:='idx'+nmCampo+'C';
     nmIndiceCriado:='idx'+nmcampo+'C';
     nrConta:=1;
  end
  else
  begin
     TClientDataSet(dsPesquisa.DataSet).AddIndex('idx'+nmCampo+'D',nmCampo,[ixCaseInsensitive,ixDescending]);
     TClientDataSet(dsPesquisa.DataSet).IndexName:='idx'+nmCampo+'D';
     nmIndiceCriado:='idx'+nmCampo+'D';
     nrConta:=0;
  end;
  TClientDataSet(dsPesquisa.DataSet).First;
  TClientDataSet(dsPesquisa.DataSet).Refresh;

end;

FUNCTION T_frmModelo.ApagaIndice:Boolean;
begin
  if nmIndiceCriado <> '' then
  begin
     TClientDataSet(dsPesquisa.DataSet).DeleteIndex(nmIndiceCriado);
     nmIndiceCriado:='';
  end;

end;

end.


