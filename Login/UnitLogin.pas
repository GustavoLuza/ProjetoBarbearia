unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TFormLogin = class(TForm)
    EditUsuario: TLabeledEdit;
    EditSenha: TLabeledEdit;
    ButtonEntrar: TBitBtn;
    ButtonFechar: TBitBtn;
    Image1: TImage;
    procedure ButtonFecharClick(Sender: TObject);
    procedure ButtonEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormLogin.ButtonEntrarClick(Sender: TObject);
var
  SQL :string;
begin
  SQL:='select * from usuario where login= :login and senha= :senha';
  conexao.alteraSQL(conexao.Query,SQL);
  //PASSAR O PARAMETRO
  conexao.Query.Close;
  conexao.Query.ParamByName('login').AsString:=EditUsuario.Text;
  conexao.Query.ParamByName('senha').AsString:=EditSenha.Text;
  conexao.Query.Open;
  //
  if (conexao.Query.IsEmpty) then
  begin
    Application.MessageBox('Usuário/Senha inválidos','ERRO',MB_ICONERROR+MB_OK);
    EditUsuario.SetFocus;
    exit;
  end;
  ModalResult:=mrOk;
end;

procedure TFormLogin.ButtonFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
