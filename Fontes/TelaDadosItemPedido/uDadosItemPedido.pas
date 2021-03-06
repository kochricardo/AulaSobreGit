unit uDadosItemPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  T_frmDigitacaoItemPedido = class(TForm)
    _lbeSomaDesconto: TLabel;
    _lbePrecoListaGrid: TLabeledEdit;
    _lbeDescontoPadraoGrid: TLabeledEdit;
    _lbeDescontoAdicionalGrid: TLabeledEdit;
    _lbePrecoNotaGrid: TLabeledEdit;
    _lbeValorCreditoIcmsGrid: TLabeledEdit;
    _lbePrecoCustoGrid: TLabeledEdit;
    _lbeValorVerbaGrid: TLabeledEdit;
    _lbeNumeroVerbaGrid: TLabeledEdit;
    _lbePcVerbaGrid: TLabeledEdit;
    _lbeSugestaoIdealGrid: TLabeledEdit;
    _lbeSugestaoPossivelGrid: TLabeledEdit;
    _lbeDiasEstoque: TLabeledEdit;
    _lbeQuantidadePedido: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _lbeQuantidadePedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _lbeDiasEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmDigitacaoItemPedido: T_frmDigitacaoItemPedido;
  vlMediaDadosItem:Double;
  nrPendenciaDadosItem,
  NrQuantidadeEstoqueDadosItem:Integer;

implementation

{$R *.dfm}

procedure T_frmDigitacaoItemPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure T_frmDigitacaoItemPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
       vk_escape:close;
       VK_RETURN : begin
                    Perform(WM_NEXTDLGCTL, 0, 0);
                  end;

  end;
end;

procedure T_frmDigitacaoItemPedido.FormShow(Sender: TObject);
begin
 _lbeQuantidadePedido.SetFocus;
 _lbeQuantidadePedido.SelectAll;

end;

procedure T_frmDigitacaoItemPedido._lbeDiasEstoqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     case key of
        VK_RETURN : begin
                         close;

                    end;

     end;

end;

procedure T_frmDigitacaoItemPedido._lbeQuantidadePedidoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
 DiasEstoque:Double;
 QtPedido :Integer;
begin
     case key of
        VK_RETURN : begin
                      QtPedido:=StrToIntDef(_lbeQuantidadePedido.Text,0);
                      if QtPedido=0 then
                         close;
                      if vlMediaDadosItem>0 then
                         DiasEstoque:=(NrQuantidadeEstoqueDadosItem+nrPendenciaDadosItem+QtPedido)/vlMediaDadosItem
                      else
                         DiasEstoque:=(NrQuantidadeEstoqueDadosItem+nrPendenciaDadosItem+QtPedido)/1;

                      _lbeDiasEstoque.Text:=FormatFloat('###0',DiasEstoque);
                    end;

     end;
end;

end.
