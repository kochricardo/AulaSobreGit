unit uTelaPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  T_frmPesquisa = class(TForm)
    Panel1: TPanel;
    _dbgPesquisa: TDBGrid;
    _cbxCampos: TComboBox;
    _labCampos: TLabel;
    _edtPesquisa: TEdit;
    _lbPesquisa: TLabel;
    _dsPesquisa: TDataSource;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure _edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _edtPesquisaChange(Sender: TObject);
    procedure _dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _cbxCamposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _dbgPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
   ListaField :Array of Integer;

  end;

var
  _frmPesquisa: T_frmPesquisa;
  nrFornecedor:Integer;

implementation

uses   uDm, uRotinasGenericas;

{$R *.dfm}

procedure T_frmPesquisa._cbxCamposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
    VK_RETURN:begin
                if _cbxCampos.ItemIndex>=0 then
                   _edtPesquisa.SetFocus;
               end;
   end;

end;

procedure T_frmPesquisa._dbgPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if _dsPesquisa.DataSet.active then
  begin
    with _dbgPesquisa do
    begin
      // mude a cor das celulas em que valor = 0
      if odd(_dsPesquisa.DataSet.RecNo) then
      begin
        _dbgPesquisa.Canvas.Font.Color := clBlack;
        _dbgPesquisa.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _dbgPesquisa.Canvas.Font.Color := clBlack;
        _dbgPesquisa.Canvas.Brush.Color := clWhite;
      end;

      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

end;

procedure T_frmPesquisa._dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 VK_RETURN :  begin
               //nrFornecedor:= _dsPesquisa.dataset.FieldByName('NR_F')
               close;
              end;
 end;

end;

procedure T_frmPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure T_frmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_ESCAPE : close;

  end;
end;

procedure T_frmPesquisa.FormShow(Sender: TObject);
var
 i,J: Integer;
begin
  //ConectaBanco('PRDDM','SIDM', TCustomAttribute.Create);
  for I := 0 to Pred(_dsPesquisa.dataset.fieldCount) do
  begin
    if _dsPesquisa.dataset.fields[I].datatype in [ftString,ftWideString,ftFixedChar,ftInteger,ftDate,ftDateTime,ftTimeStamp,ftBCD,ftFMTBcd] then
    begin
       J:=_cbxCampos.items.add(_dsPesquisa.dataset.fields[i].DisplayName);
       SetLength(ListaField,HIGH(ListaField)+2);
       ListaField[j]:=i;
    end;
    if not _dsPesquisa.DataSet.Active then
       _dsPesquisa.DataSet.Open;
 end;

end;

procedure T_frmPesquisa._edtPesquisaChange(Sender: TObject);
begin
 if TRIM(_edtPesquisa.Text)='' then
    _dsPesquisa.DataSet.Filtered:=false;

end;

procedure T_frmPesquisa._edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
  VK_RETURN : begin
                 if (_cbxCampos.Text<> EmptyStr) and (_edtPesquisa.Text <> EmptyStr) then
                 begin
                   if (_dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].DataType in[ftString,ftWideString,ftFixedChar]) then
                   begin
                    _dsPesquisa.DataSet.Filter := 'UPPER ('+_dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].FieldName +') LIKE '+QuotedStr(UpperCase(_edtPesquisa.Text)+'%');
                    _dsPesquisa.DataSet.Filtered:=TRUE;
                   end;
                   if (_dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].DataType in[ftInteger,ftBCD,ftFloat,ftFMTBcd]) then
                   begin
                     _dsPesquisa.DataSet.Filter := _dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].FieldName +' = '+_edtPesquisa.Text;
                     _dsPesquisa.DataSet.Filtered:=TRUE;
                   end;
                   if (_dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].DataType in[ftDate,ftDateTime,ftTimeStamp]) then
                   begin
                     _dsPesquisa.DataSet.Filter := _dsPesquisa.DataSet.Fields[listaField[_cbxCampos.ItemIndex]].FieldName +' = '+QuotedStr(_edtPesquisa.Text);
                     _dsPesquisa.DataSet.Filtered:=TRUE;
                   end;
                    if not _dsPesquisa.DataSet.Active then
                      _dsPesquisa.DataSet.Open;
                  end;
                  if not _dsPesquisa.DataSet.IsEmpty then
                  begin
                      if  _dsPesquisa.DataSet.RecordCount=1 then
                           close;
                       if _dsPesquisa.DataSet.RecordCount>1 then
                           _dbgPesquisa.SetFocus;


                  end;
              end;
 end;
end;




end.
