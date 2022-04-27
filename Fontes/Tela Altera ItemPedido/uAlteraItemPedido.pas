unit uAlteraItemPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  T_frmAterandoItemPedido = class(TForm)
    StatusBar1: TStatusBar;
    _edtCodigoProduto: TEdit;
    _edtPreçoUnitario: TEdit;
    _edtpcDescontoAdicional: TEdit;
    _edtNrVerba: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmAterandoItemPedido: T_frmAterandoItemPedido;

implementation

{$R *.dfm}

end.
