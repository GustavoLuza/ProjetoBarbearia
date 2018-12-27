unit UnitPesquisaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaUsuario = class(TFormPesquisaPadrao)
    QueryLOGIN: TIBStringField;
    ReportUsuario: TfrxReport;
    DatasetUsuario: TfrxDBDataset;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaUsuario: TFormPesquisaUsuario;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaUsuario.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportUsuario.showreport();
end;

procedure TFormPesquisaUsuario.ButtonPesquisarClick(Sender: TObject);
Var
  SQLNome: string;
begin
  inherited;
  SQLNome:= 'SELECT LOGIN FROM USUARIO WHERE LOGIN LIKE :NOME ORDER BY LOGIN';

  case RadioFiltro.ItemIndex of
    0: begin //FILTRO POR NOME
      Conexao.alteraSQL(query,SQLNome);
      query.Close;
      query.ParamByName('NOME').AsString:='%'+EditPesquisa.Text+'%';
      query.Open;
    end;
  end;

end;

end.
