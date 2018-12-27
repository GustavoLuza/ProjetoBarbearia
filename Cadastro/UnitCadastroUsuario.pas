unit UnitCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroUsuario = class(TFormCadastroPadrao)
    QueryLOGIN: TIBStringField;
    QuerySENHA: TIBStringField;
    LabelUsuario: TLabel;
    DBEditUsuario: TDBEdit;
    LabelSenha: TLabel;
    DBEditSenha: TDBEdit;
    GroupBoxLogin: TGroupBox;
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroUsuario: TFormCadastroUsuario;

implementation

{$R *.dfm}

uses UnitPesquisaUsuario;

procedure TFormCadastroUsuario.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  DBEditUsuario.SetFocus;
end;

procedure TFormCadastroUsuario.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditUsuario.SetFocus;
end;

procedure TFormCadastroUsuario.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditUsuario.SetFocus;
end;

procedure TFormCadastroUsuario.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaUsuario:= TFormPesquisaUsuario.Create(self);
    FormPesquisaUsuario.ShowModal;
  finally
    if (FormPesquisaUsuario.ModalResult=mrOk) then
    begin
      Query.Locate('LOGIN',FormPesquisaUsuario.QueryLOGIN.AsInteger,[]);
    end;
    FormPesquisaUsuario.Free;
    end;
end;

procedure TFormCadastroUsuario.ButtonSalvarClick(Sender: TObject);
begin
  if(trim(DBEditUsuario.Text)='') then
  begin
    Application.MessageBox('Nome obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditUsuario.SetFocus;
    exit;
  end;

  if(trim(DBEditSenha.Text)='') then
  begin
    Application.MessageBox('Senha obrigatória','Erro',MB_ICONERROR+MB_OK);
    DBEditSenha.SetFocus;
    exit;
  end;

  inherited;

end;

end.
