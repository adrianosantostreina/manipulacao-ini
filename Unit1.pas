unit Unit1;

interface

uses
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,

  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IOUtils,

  IniFiles;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Switch1: TSwitch;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure GravarConfig;
    procedure LerConfig;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  LerConfig;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  GravarConfig;
end;

procedure TForm1.GravarConfig;
var
  Ini : TIniFile;
begin
  try
    Ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'Config.ini'));

    Ini.WriteString('CONFIGURACOES', 'Nome', Edit1.Text);
    Ini.WriteString('CONFIGURACOES', 'Usuario', Edit2.Text);
    Ini.WriteString('CONFIGURACOES', 'Senha', Edit3.Text);
    Ini.WriteBool('CONFIGURACOES', 'Lembrar', Switch1.IsChecked);
  finally
    Ini.DisposeOf;
  end;

end;

procedure TForm1.LerConfig;
var
  Ini : TIniFile;
  vNome: string;
  vUsuario: string;
  vSenha: string;
  bLembrar : Boolean;
begin
  try
    Ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'Config.ini'));

    Edit1.Text := Ini.ReadString('CONFIGURACOES', 'Nome', vNome);
    Edit2.Text := Ini.ReadString('CONFIGURACOES', 'Usuario', vUsuario);
    Edit3.Text := Ini.ReadString('CONFIGURACOES', 'Senha', vSenha);
    Switch1.IsChecked := Ini.ReadBool('CONFIGURACOES', 'Lembrar', bLembrar);
  finally
    Ini.DisposeOf;
  end;
end;

end.
