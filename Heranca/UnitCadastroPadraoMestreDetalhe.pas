unit UnitCadastroPadraoMestreDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFormCadastroPadraoMestreDetalhe = class(TFormCadastroPadrao)
    queryProduto: TIBQuery;
    updateProduto: TIBUpdateSQL;
    dsProduto: TDataSource;
    grouProduto: TGroupBox;
    gridItem: TDBGrid;
    buttonNovoItem: TSpeedButton;
    buttonEditarItem: TSpeedButton;
    buttonSalvarItem: TSpeedButton;
    buttonDesfazerItem: TSpeedButton;
    buttonExcluirItem: TSpeedButton;
    QueryServico: TIBQuery;
    UpdateServico: TIBUpdateSQL;
    DSServico: TDataSource;
    GroupBoxServico: TGroupBox;
    DBGridServico: TDBGrid;
    ButtonNovoServico: TSpeedButton;
    ButtonEditarServico: TSpeedButton;
    ButtonSalvarServico: TSpeedButton;
    ButtonCancelarServico: TSpeedButton;
    ButtonExcluirServico: TSpeedButton;
    procedure buttonNovoItemClick(Sender: TObject);
    procedure buttonEditarItemClick(Sender: TObject);
    procedure buttonSalvarItemClick(Sender: TObject);
    procedure buttonDesfazerItemClick(Sender: TObject);
    procedure buttonExcluirItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSStateChange(Sender: TObject);
    procedure dsProdutoStateChange(Sender: TObject);
    procedure DSServicoStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPadraoMestreDetalhe: TFormCadastroPadraoMestreDetalhe;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormCadastroPadraoMestreDetalhe.buttonDesfazerItemClick(
  Sender: TObject);
begin
  inherited;
  queryProduto.CancelUpdates;
end;

procedure TFormCadastroPadraoMestreDetalhe.buttonEditarItemClick(
  Sender: TObject);
begin
  inherited;
  queryProduto.Edit;
end;

procedure TFormCadastroPadraoMestreDetalhe.buttonExcluirItemClick(
  Sender: TObject);
begin
  inherited;
  if (Application.MessageBox('Confirma?',
  'Aviso',MB_ICONQUESTION+MB_YESNO)=idNo) then Begin
    Exit;
  End;

  if not(Conexao.Transacao.InTransaction) then Begin
    Conexao.Transacao.StartTransaction;
  End;
  try
    queryProduto.Delete;
    Conexao.Transacao.Commit;
  except
    Conexao.Transacao.Rollback;
    Application.MessageBox('Erro ao remover',
    'Erro',MB_ICONERROR+MB_OK);
  end;
  Query.Open;
end;

procedure TFormCadastroPadraoMestreDetalhe.buttonNovoItemClick(Sender: TObject);
begin
  inherited;
  queryProduto.Append;
end;

procedure TFormCadastroPadraoMestreDetalhe.buttonSalvarItemClick(
  Sender: TObject);
begin
  inherited;
  if not(Conexao.Transacao.InTransaction) then Begin
    Conexao.Transacao.StartTransaction;
  End;
  try
    queryProduto.Post;
    Conexao.Transacao.Commit;
  except
    Conexao.Transacao.Rollback;
    Application.MessageBox('Erro ao gravar',
    'Erro',MB_ICONERROR+MB_OK);
  end;
  Query.Open;
end;

procedure TFormCadastroPadraoMestreDetalhe.dsProdutoStateChange(Sender: TObject);
begin
  inherited;
  buttonNovoItem.Enabled    := dsProduto.State in [dsBrowse];
  buttonEditarItem.Enabled  := dsProduto.State in [dsBrowse];
  buttonSalvarItem.Enabled  := dsProduto.State in [dsInsert,dsEdit];
  buttonDesfazerItem.Enabled:= dsProduto.State in [dsInsert,dsEdit];
  buttonExcluirItem.Enabled := dsProduto.State in [dsBrowse];
end;

procedure TFormCadastroPadraoMestreDetalhe.DSServicoStateChange(
  Sender: TObject);
begin
  inherited;
  ButtonNovoServico.Enabled    := dsProduto.State in [dsBrowse];
  ButtonEditarServico.Enabled  := dsProduto.State in [dsBrowse];
  ButtonSalvarServico.Enabled  := dsProduto.State in [dsInsert,dsEdit];
  ButtonCancelarServico.Enabled:= dsProduto.State in [dsInsert,dsEdit];
  ButtonExcluirServico.Enabled := dsProduto.State in [dsBrowse];
end;

procedure TFormCadastroPadraoMestreDetalhe.DSStateChange(Sender: TObject);
begin
  inherited;
  grouProduto.Enabled:= DS.State = dsBrowse;
  GroupBoxServico.Enabled:= DS.State = dsBrowse;
end;

procedure TFormCadastroPadraoMestreDetalhe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  queryProduto.Close;
  QueryServico.Close;
end;

end.
