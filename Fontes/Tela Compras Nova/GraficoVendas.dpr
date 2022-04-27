program GraficoVendas;

uses
  Forms,
  uTesteGrafico in 'uTesteGrafico.pas' {_frmComprasNova},
  uDM in 'uDM.pas' {_dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(T_frmComprasNova, _frmComprasNova);
  Application.CreateForm(T_dm, _dm);
  Application.Run;
end.
