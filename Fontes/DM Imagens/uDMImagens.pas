unit uDMImagens;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  T_dmImagem = class(TDataModule)
    ImgServer: TImageList;
    ImageListLarge: TImageList;
    ImageListSmall: TImageList;
    ImageList1: TImageList;
    ListaImagensPequenas: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _dmImagem: T_dmImagem;

implementation

{$R *.dfm}

end.
