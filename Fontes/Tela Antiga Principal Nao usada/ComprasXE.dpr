program ComprasXE;

uses
  Forms,
  uPrincipal in '..\..\..\Devolucao XE\Fonte\Tela Principal\uPrincipal.pas' {_frmPrincipal},
  uDm in 'C:\Documents and Settings\usuario\Meus documentos\RAD Studio\Projects\Relatorio Devolucao Grafico\DM Principal\uDm.pas' {_dm: TDataModule},
  uTelaCompras in 'C:\Documents and Settings\usuario\Meus documentos\RAD Studio\Projects\Relatorio Devolucao Grafico\uTelaCompras.pas' {_frmCompras},
  uAuxiliarCompras in 'C:\Documents and Settings\usuario\Meus documentos\RAD Studio\Projects\Relatorio Devolucao Grafico\Tela Compras\uAuxiliarCompras.pas',
  uRotinasGenericas in 'C:\Documents and Settings\usuario\Meus documentos\RAD Studio\Projects\Relatorio Devolucao Grafico\Rotina Generica\uRotinasGenericas.pas',
  uAgendaLaboratorio in 'C:\Documents and Settings\usuario\Meus documentos\RAD Studio\Projects\Relatorio Devolucao Grafico\Tela Agenda Laboratorio\uAgendaLaboratorio.pas' {_frmAgendaCompras},
  uRotinaMargemGam in 'C:\Documents and Settings\usuario\Meus documentos\RAD Studio\Projects\Relatorio Devolucao Grafico\Rotina Margem GAM\uRotinaMargemGam.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(T_dm, _dm);
  Application.CreateForm(T_frmPrincipal, _frmPrincipal);
  Application.Run;
end.
