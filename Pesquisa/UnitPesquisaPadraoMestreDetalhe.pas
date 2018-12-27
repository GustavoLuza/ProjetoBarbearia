unit UnitPesquisaPadraoMestreDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFormPesquisaPadraoMesttreDetalhe = class(TFormPesquisaPadrao)
    queryItem: TIBQuery;
    dsItem: TDataSource;
    gridItem: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaPadraoMesttreDetalhe: TFormPesquisaPadraoMesttreDetalhe;

implementation

{$R *.dfm}

uses UnitDMConexao;

end.
