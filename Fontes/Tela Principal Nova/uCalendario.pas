unit uCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  T_frmCalendario = class(TForm)
    MonthCalendar1: TMonthCalendar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCalendario: T_frmCalendario;

implementation

{$R *.dfm}

end.
