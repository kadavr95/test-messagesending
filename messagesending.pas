unit messagesending;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdMessage, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP;

type
  TForm2 = class(TForm)
    IdSMTP1: TIdSMTP;
    IdAntiFreeze1: TIdAntiFreeze;
    IdMessage1: TIdMessage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
idsmtp1.Host:='smtp.yandex.ru';
idsmtp1.Port:=25;
idsmtp1.Username:='username';
idsmtp1.Password:='password';
idmessage1.Body.Text:='Dimini Inc test';
idmessage1.From.Text:='username@yandex.ru';
idmessage1.recipients.emailaddresses:='username@gmail.com';
idmessage1.Subject:='Test';
    idsmtp1.Connect;
 if idsmtp1.connected=true then
idsmtp1.Send(idmessage1);
idsmtp1.Disconnect();
end;

end.
