unit UnitPesquisaAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaAgendamento = class(TFormPesquisaPadrao)
    QueryCODIGO_AGENDAMENTO: TIntegerField;
    QueryDATA_ATENDIMENTO: TDateField;
    QueryHORA_ATENDIMENTO: TTimeField;
    QueryCODIGO_SERVICO: TIntegerField;
    QueryCODIGO_CLIENTE: TIntegerField;
    QueryCODIGO_COLABORADOR: TIntegerField;
    DatasetAgendamento: TfrxDBDataset;
    ReportAgendamento: TfrxReport;
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaAgendamento: TFormPesquisaAgendamento;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaAgendamento.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportAgendamento.ShowReport();
end;

procedure TFormPesquisaAgendamento.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM AGENDAMENTO WHERE CODIGO_AGENDAMENTO = :CODIGO';


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
  end;
end;

procedure TFormPesquisaAgendamento.RadioFiltroClick(Sender: TObject);
begin
  inherited;
    case RadioFiltro.ItemIndex of
    0: EditPesquisa.EditMask:='999999';
  end;
  EditPesquisa.clear;
  EditPesquisa.SetFocus;
end;

end.
