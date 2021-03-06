unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ImgList, ActnList, ToolWin,
  PlatformDefaultStyleActnCtrls, ActnMan, ExtCtrls, uDMImagens, ActnCtrls,
  ActnMenus;

type
  T_frmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    Timer1: TTimer;
    acConfiguraSistema: TActionManager;
    AcCadastroLaboratório: TAction;
    acCadastroGrupos: TAction;
    acAgendaLaboratorios: TAction;
    acFinalizaSistema: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    Action1: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    _tbAtivar: TToolButton;
    _tbDesAtivar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure acAgendaComprasExecute(Sender: TObject);
    procedure acSairsistemaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Versao : String[100];
  end;

var
  _frmPrincipal: T_frmPrincipal;

implementation

uses  uTelaCompras, uRotinasGenericas, uAgendaLaboratorio;

{$R *.dfm}

procedure T_frmPrincipal.acAgendaComprasExecute(Sender: TObject);
begin
  _frmAgendaCompras :=  T_frmAgendaCompras.Create(Self);
  _frmAgendaCompras.Show;
end;




procedure T_frmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=caFree;
end;

procedure T_frmPrincipal.FormCreate(Sender: TObject);
begin
  Versao:='SisCpa - Sistemas Compras Versão 2.00.01';
 _dtSistema:=DataSistema;
 DataEmpresa;

 if _dtPedido<>_dtEmpresa then
 begin
   Mensagem('Data Empresa Ainda Não Foi Alterada');
 end;
    _nrcomprador:=1;
    _login:='TESTE';
    _dsNomeCompurador:=GetComputerNetName;
  _frmPrincipal.Caption:= VERSAO+',  '+
                           DataExtenso(_dtEmpresa);

end;

procedure T_frmPrincipal.acSairsistemaExecute(Sender: TObject);
begin
 close;
 Application.Terminate;
end;


end.
