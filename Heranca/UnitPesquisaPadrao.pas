unit UnitPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Mask, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids;

type
  TFormPesquisaPadrao = class(TForm)
    GroupBoxOpcao: TGroupBox;
    RadioFiltro: TRadioGroup;
    ButtonPesquisar: TBitBtn;
    EditPesquisa: TMaskEdit;
    LabelPesquisa: TLabel;
    Query: TIBQuery;
    DS: TDataSource;
    GridPesquisa: TDBGrid;
    ButtonImprimir: TBitBtn;
    procedure GroupBoxOpcaoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPesquisaDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaPadrao: TFormPesquisaPadrao;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaPadrao.FormActivate(Sender: TObject);
begin
  EditPesquisa.SetFocus;
end;

procedure TFormPesquisaPadrao.FormCreate(Sender: TObject);
begin
  Query.Open;
end;

procedure TFormPesquisaPadrao.GridPesquisaDblClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TFormPesquisaPadrao.GroupBoxOpcaoDblClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

end.
