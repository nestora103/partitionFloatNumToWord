unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

const
NUM=4;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  arr:array[1..NUM] of word;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
val:double;
pWord:^word;
i:integer;

begin
//присвоим значение переменной которую будем разбивать
val:=11.5566666;
form1.Memo1.Lines.Add('До '+FloatToStr(val));
//получим адрес в памяти где переменная лежит
pWord:=@val;
//обнулим будущий массив слов
for i:=1 to NUM do
  begin
    arr[i]:=0;
  end;

i:=1;

while i<=NUM do
  begin
    //запишем в массив 2 байта от разбиваемой переменной
    arr[i]:=pWord^;
    //сдвинемся на следующие 2 байта(сдвиг на размер типа указателя)
    //сдвиг можно делать только для типизированных указателей
    inc(pWord);

    inc(i);
  end;


end;

procedure TForm1.Button2Click(Sender: TObject);
var
Pdouble:^double;
val:double;
begin
Pdouble:=@arr[1];
val:=Pdouble^;
form1.Memo1.Lines.Add('После '+FloatToStr(val));
end;

end.
