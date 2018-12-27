unit UnitPesquisaServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaServico = class(TFormPesquisaPadrao)
    QueryCODIGO_SERVICO: TIntegerField;
    QueryNOME_SERVICO: TIBStringField;
    QueryVALOR_SERVICO: TIBBCDField;
    ReportServico: TfrxReport;
    DatasetServico: TfrxDBDataset;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaServico: TFormPesquisaServico;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaServico.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportServico.ShowReport();
end;

procedure TFormPesquisaServico.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo, SQLNome: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM SERVICO WHERE CODIGO_SERVICO = :CODIGO';
  SQLNome:= 'SELECT * FROM SERVICO WHERE NOME_SERVICO LIKE :NOME ORDER BY NOME_SERVICO';

  case RadioFiltro.ItemIndex of
    0: begin //FILTRO POR CODIGO
      Conexao.alteraSQL(query,SQLCodigo);
      if (trim(EditPesquisa.Text)='') then
      begin
        EditPesquisa.Text:='1';
      end;
      //PASSAR O PARAMETRO
        query.Close;
        query.ParamByName('CODIGO').AsInteger:= StrToInt(Trim(EditPesquisa.Text));
        query.Open;
    end;
    1: begin //FILTRO POR NOME
      Conexao.alteraSQL(query,SQLNome);
      query.Close;
      query.ParamByName('NOME').AsString:='%'+EditPesquisa.Text+'%';
      query.Open;
    end;
  end;
end;

procedure TFormPesquisaServico.RadioFiltroClick(Sender: TObject);
begin
  inherited;
  case RadioFiltro.ItemIndex of
    0: EditPesquisa.EditMask:='999999';
    1: EditPesquisa.EditMask:='';
  end;
  EditPesquisa.clear;
  EditPesquisa.SetFocus;
end;

end.
