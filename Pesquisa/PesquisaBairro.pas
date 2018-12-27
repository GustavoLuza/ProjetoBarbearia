unit PesquisaBairro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.DBCtrls, frxClass, frxDBSet;

type
  TFormPesquisaBairro = class(TFormPesquisaPadrao)
    QueryCODIGO_BAIRRO: TIntegerField;
    QueryNOME_BAIRRO: TIBStringField;
    QueryCODIGO_CIDADE: TIntegerField;
    QueryNOME_CIDADE: TIBStringField;
    DataSetBairro: TfrxDBDataset;
    ReportBairro: TfrxReport;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaBairro: TFormPesquisaBairro;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaBairro.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportBairro.ShowReport();
end;

procedure TFormPesquisaBairro.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigoBairro, SQLNomeBairro, SQLNomeCidade: string;
begin
  inherited;
  SQLCodigoBairro:= ' SELECT BAIRRO.*,CIDADE.NOME_CIDADE FROM BAIRRO INNER JOIN CIDADE ON(CIDADE.CODIGO_CIDADE=BAIRRO.CODIGO_CIDADE) WHERE BAIRRO.CODIGO_BAIRRO = :CODIGOBAIRRO ';
  SQLNomeBairro:= ' SELECT BAIRRO.*,CIDADE.NOME_CIDADE FROM BAIRRO INNER JOIN CIDADE ON(CIDADE.CODIGO_CIDADE=BAIRRO.CODIGO_CIDADE) WHERE BAIRRO.NOME_BAIRRO LIKE  :NOMEBAIRRO ORDER BY BAIRRO.NOME_BAIRRO ';
  SQLNomeCidade:= ' SELECT BAIRRO.*,CIDADE.NOME_CIDADE FROM BAIRRO INNER JOIN CIDADE ON(CIDADE.CODIGO_CIDADE=BAIRRO.CODIGO_CIDADE) WHERE CIDADE.NOME_CIDADE LIKE  :NOMECIDADE ORDER BY CIDADE.NOME_CIDADE ';

  case RadioFiltro.ItemIndex of
    0: begin  //CODIGO
      if(trim(EditPesquisa.Text)='') then
      begin
        EditPesquisa.Text:='1';
      end;
      Conexao.alteraSQL(query,SQLCodigoBairro);
      //PARAMETRO
      query.Close;
      Query.ParamByName('CODIGOBAIRRO').AsInteger:= StrToInt((trim(EditPesquisa.Text)));
      query.Open
    end;
    1: begin
      conexao.alteraSQL(Query,SQLNomeBairro);
      //PARAMETRO
      query.Close;
      Query.ParamByName('NOMEBAIRRO').AsString:='%'+EditPesquisa.Text+'%';
      query.Open;
    end;
  2: begin
    conexao.alteraSQL(Query,SQLNomeCidade);
      //PARAMETRO
      query.Close;
      Query.ParamByName('NOMECIDADE').AsString:='%'+EditPesquisa.Text+'%';
      query.Open;
  end;
  end;

end;

procedure TFormPesquisaBairro.RadioFiltroClick(Sender: TObject);
begin
  inherited;
  case RadioFiltro.ItemIndex of
  0: EditPesquisa.EditMask:='999999';
  1,2: EditPesquisa.EditMask:='';
  end;
  EditPesquisa.Clear;
  EditPesquisa.SetFocus;
end;

end.
