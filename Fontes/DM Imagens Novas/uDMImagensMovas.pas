unit uDMImagensMovas;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  T_dmImagensPequenas = class(TDataModule)
    ListaImagensPequenas: TImageList;
    LogoSistema: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _dmImagensPequenas: T_dmImagensPequenas;

implementation

{$R *.dfm}

end.
