program PR9;
uses crt;
var f1,f2,f3:byte;
    menu: array[1..8] of string[30];
    subsection: array[1..4] of string[30];
    name, surname, patronymic : string;
    rate : real;
    company : string;
    city, street : string;
    home : integer;
    numSub : integer;
    month : array[1..12] of string[30];
    data : array[1..4,1..12] of real;
    all : array[1..12] of real;
    point : char;
    nf, kf:byte;
    xm,ym : integer;
    punkt:integer;
    f:text;
    Drive:string;
const x = 27; y=7;
      n = 8;
      cf = 7; ct = 9; cv = 2;
      red = 4;
      bk = 0;
procedure o_o(_x1,_y1,_x2,_y2: byte);
begin
    window(_x1,_y1,_x2,_y2);
    clrscr;
    window(1,1,80,25);
end;

function getStr(_length:byte) : string;
var _flag, _lengthStr, _x, _y : byte;
    _str : string;
    _ch : char;
begin
   _flag := 0;
   _lengthStr := 0;
   _x := WhereX; _y := WhereY;
   _str := '';
   repeat
       if keypressed then
                 begin
                      _ch := readkey;
                        if _ch = #13 then _flag := 1;
                        case _ch of 'а'..'я','А'..'Я':
                             begin
                             if _lengthStr < _length then
                                begin
                                     write(_ch);
                                     _str := _str + _ch;
                                     _lengthStr := _lengthStr + 1;
                                     _x:=_x+1;

                                end;
                             end;
                        end;
                        if _ch = #8 then
                           if _lengthStr > 0 then
                              begin
                                   _x:=_x-1;
                                   gotoxy(_x, _y); write(' ');
                                   gotoxy(_x, _y);
                                   Delete(_str, _lengthStr, 1);
                                   _lengthStr := _lengthStr - 1;
                              end;
                 end;
        until _flag = 1;
   getStr := _str;
   end;


function getDrive(_length:byte) : string;
var _flag, _lengthStr, _x, _y : byte;
    _str : string;
    _ch : char;
begin
   _flag := 0;
   _lengthStr := 0;
   _x := WhereX; _y := WhereY;
   _str := '';
   repeat
       if keypressed then
                 begin
                      _ch := readkey;
                        if _ch = #13 then _flag := 1;
                        case _ch of 'a'..'z','A'..'Z':
                             begin
                             if _lengthStr < _length then
                                begin
                                     write(_ch);
                                     _str := _str + _ch;
                                     _lengthStr := _lengthStr + 1;
                                     _x:=_x+1;

                                end;
                             end;
                        end;
                        if _ch = #8 then
                           if _lengthStr > 0 then
                              begin
                                   _x:=_x-1;
                                   gotoxy(_x, _y); write(' ');
                                   gotoxy(_x, _y);
                                   Delete(_str, _lengthStr, 1);
                                   _lengthStr := _lengthStr - 1;
                              end;
                 end;
        until _flag = 1;
   getDrive := _str;
   end;

function getFloat(_length:byte) : real;
var
   _flag,_flag_t: byte;
   _n : real;
   _x, _y, _lengthStr : byte;
   _t:string;
   _code : integer;
   _ch : char;
   _xt : byte;
begin
_flag := 0; _flag_t:=0;
_t := '';
_xt := 0;
_x := WhereX; _y := WhereY;
_lengthStr := 0;
   repeat
         if keypressed then
            begin
                 _ch := readkey;
                 if _ch = #13 then _flag := 1;
                 if _lengthStr < _length then
                 case _ch of
                      '0'..'9': begin
                                   write(_ch);
                                   _t:=_t+_ch;
                                   _lengthStr := _lengthStr + 1;
                                   _x := _x + 1;
                                end;
                      '-': if _lengthStr=0 then
                              begin
                                 write(_ch);
                                 _t:=_t + _ch;
                                 _lengthStr := _lengthStr + 1;
                                 _x := _x + 1;
                              end;
                      '.',',' : if _flag_t=0 then
                                begin
                                     write('.');
                                     _flag_t := 1;
                                     _t:=_t+_ch;
                                     _lengthStr := _lengthStr + 1;
                                     _x := _x + 1;
                                     _xt := _x;
                                end;
                 end;
                 if _ch = #8 then
                       if _lengthStr > 0 then
                          begin
                               if _x = _xt then
                                  _flag_t := _flag_t - 1;
                               _x:=_x-1;
                                gotoxy(_x, _y); write(' ');
                                gotoxy(_x, _y);
                                Delete(_t, _lengthStr, 1);
                                _lengthStr := _lengthStr - 1;
                          end;
            end;

   until _flag = 1;
   val(_t,_n,_code);
   getFloat:=_n;
end;

function getInt(_length:byte) : integer;
var
   _flag,_x, _y, _lengthStr : byte;
   _n : integer;
   _t:string;
   _code : integer;
   _ch : char;
begin
_flag := 0;
_t := '';
_x := WhereX; _y := WhereY;
_lengthStr := 0;
   repeat
         if keypressed then
            begin
                 _ch := readkey;
                 if _ch = #13 then _flag := 1;
                 case _ch of '0'..'9': if _lengthStr < _length then
                                       begin
                                          write(_ch);
                                          _t:=_t+_ch;
                                          _lengthStr := _lengthStr + 1;
                                          _x := _x + 1;
                                       end;
                 end;
                 if _ch = #8 then
                    if _lengthStr > 0 then
                       begin
                            _x:=_x-1;
                            gotoxy(_x, _y); write(' ');
                            gotoxy(_x, _y);
                            Delete(_t, _lengthStr, 1);
                            _lengthStr := _lengthStr - 1;
                       end;
            end;
   until _flag = 1;
   val(_t,_n,_code);
   getInt:=_n;
end;
function getSub(_length:byte) : integer;
var
   _flag,_x, _y, _lengthStr : byte;
   _n : integer;
   _t:string;
   _code : integer;
   _ch : char;
begin
_flag := 0;
_t := '';
_x := WhereX; _y := WhereY;
_lengthStr := 0;
   repeat
         if keypressed then
            begin
                 _ch := readkey;
                 if _ch = #13 then _flag := 1;
                 case _ch of '0'..'4': if _lengthStr < _length then
                                       begin
                                          write(_ch);
                                          _t:=_t+_ch;
                                          _lengthStr := _lengthStr + 1;
                                          _x := _x + 1;
                                       end;
                 end;
                 if _ch = #8 then
                    if _lengthStr > 0 then
                       begin
                            _x:=_x-1;
                            gotoxy(_x, _y); write(' ');
                            gotoxy(_x, _y);
                            Delete(_t, _lengthStr, 1);
                            _lengthStr := _lengthStr - 1;
                       end;
            end;
   until _flag = 1;
   val(_t,_n,_code);
   getSub:=_n;
end;
function getInput(_length:byte) : integer;
var
   _flag,_x, _y, _lengthStr : byte;
   _n : integer;
   _t:string;
   _code : integer;
   _ch : char;
begin
_flag := 0;
_t := '';
_x := WhereX; _y := WhereY;
_lengthStr := 0;
   repeat
         if keypressed then
            begin
                 _ch := readkey;
                 if _ch = #13 then _flag := 1;
                 case _ch of '1'..'2': if _lengthStr < _length then
                                       begin
                                          write(_ch);
                                          _t:=_t+_ch;
                                          _lengthStr := _lengthStr + 1;
                                          _x := _x + 1;
                                       end;
                 end;
                 if _ch = #8 then
                    if _lengthStr > 0 then
                       begin
                            _x:=_x-1;
                            gotoxy(_x, _y); write(' ');
                            gotoxy(_x, _y);
                            Delete(_t, _lengthStr, 1);
                            _lengthStr := _lengthStr - 1;
                       end;
            end;
   until _flag = 1;
   val(_t,_n,_code);
   getInput:=_n;
end;

procedure getEnter;
var _key : string;
begin
     write('Для завершения нажмите ENTER...');
     repeat
     _key := readkey;
     until _key = #13;
end;
procedure punkt1;
begin
     gotoxy(5, 5); write('Наименование предприятия: '); company := getStr(15);
     gotoxy(5, 6); writeln('ДИРЕКТОР');
     gotoxy(5, 7); write('Фамилия: '); surname := getStr(20);
     gotoxy(5, 8); write('Имя: '); name := getStr(20);
     gotoxy(5, 9); write('Отчество: '); patronymic := getStr(20);
     gotoxy(5, 10); write('Тариф(цена 1 кВт/час):'); rate := getFloat(5);
     gotoxy(25, 15); getEnter;
     f1:=1;
end;
procedure punkt2;
var
   _i : byte;
begin
     gotoxy(20, 7); write('АДРЕС ПРЕДПРИЯТИЯ');
     gotoxy(15, 8); write('Город: '); city := getStr(20);
     gotoxy(15, 9); write('Улица: '); street := getStr(20);
     gotoxy(15, 10); write('Дом: '); home := getInt(3);

     gotoxy(20, 12); write('ЧИСЛО ПОДРАЗДЕЛЕНИЙ: '); numSub := getSub(1);
     for _i:=1 to numSub do
     begin
          gotoxy(15,12+_i); write(_i,'.'); subsection[_i] := getStr(7);
     end;
     gotoxy(25,20); getEnter;
     f2:=1;
end;

procedure punkt3;
var _i, _x, _y, _k : integer;
_sum : real;
begin
   if (f1=1) and (f2=1) then
   begin
     f3:=1;
     gotoxy(20,7); write('Потребление электроэнергии предприятием');
     gotoxy(70,8); write('Всего');
     gotoxy(5,8); write('Месяц');
     for _i := 1 to 12 do
         begin
              gotoxy(5,8+_i); write(month[_i]);
         end;
     _k := 22;
     for _i := 1 to numSub do
         begin

              gotoxy(_k, 8); write(subsection[_i]);
              _k := _k + 10;
         end;
     _k := 22;
     for _x := 1 to numSub do
         begin
         for _y := 1 to 12 do
             begin
                  gotoxy(_k, 8 + _y); data[_x,_y] := getFloat(3);
             end;
         _k := _k + 10;
         end;
         for _x := 1 to numSub do
             for _y := 1 to 12 do
                 begin
                      all[_y] := all[_y] + data[_x,_y];
                 end;
             for _y := 1 to 12 do
                 begin
                      gotoxy(70,8+_y); write(all[_y]:4:2);
                 end;
             for _y := 1 to 12 do
                 _sum := _sum + all[_y];
             gotoxy(63, 22); write('Итого: ', _sum:4:2);
     gotoxy(25, 23); getEnter;
   end
   else
   begin
     gotoxy(30, 15); write('Нет данных...');
     readln;
   end;
end;
procedure punkt4;
var _i, _x, _y, _k : integer;
_sum : real;
begin
     if (f1=1) and (f2=1) then
     begin

     for _x := 1 to numSub do
             for _y := 1 to 12 do
                 begin
                      all[_y] := all[_y] + data[_x,_y];
                 end;
             for _y := 1 to 12 do
                 begin
                      gotoxy(70,8+_y); write(all[_y]:4:2);
                 end;
             for _y := 1 to 12 do
                 _sum := _sum + all[_y];
             gotoxy(63, 22); write('Итого: ', _sum:4:2);


     gotoxy(20, 7); write('Потребление электроэнергии предприятием');
     gotoxy(5, 8); write('Месяц');
     gotoxy(70,8); write('Всего');
     for _i := 1 to 12 do
         begin
              gotoxy(5,8+_i); write(month[_i]);
         end;
     _k := 22;
     for _i := 1 to numSub do
         begin
              gotoxy(_k, 8); write(subsection[_i]);
              _k := _k + 10;
         end;
     _k := 22;
     for _x := 1 to numSub do
         begin
         for _y := 1 to 12 do
             begin
                  gotoxy(_k, 8 + _y); write(data[_x,_y]:4:2);
             end;
         _k := _k + 10;
         end;
     for _y := 1 to 12 do
                 begin
                      gotoxy(70,8+_y); write(all[_y]:4:2);
                 end;
     for _y := 1 to 12 do
                 _sum := _sum + all[_y];
     gotoxy(63, 22); write('Итого: ', _sum:4:2);
     gotoxy(25, 23); getEnter;
     end
     else
   begin
     gotoxy(30, 15); write('Нет данных...');
     readln;
   end;
end;
procedure CursorOff; assembler;
   asm
      mov ah,1
      mov cx,2020h
      int 10h
end;
procedure CursorOn; assembler;
   asm
      mov ah,1
      mov cx,0607h
      int 10h
end;

procedure punkt5;
var _x, _y,_kx, _ky, _i, _punkt, _f : integer;
    _input : char;
    menuclear:array[1..2] of string;
begin
     _kx := 35; _ky := 10;
     gotoxy(26, 6); write('Выполнить очистку данных?');
     textcolor(13);
     menuclear[1]:='Да';
     menuclear[2]:='Нет';
     gotoxy(35, 10); write(menuclear[1]);
     gotoxy(35, 11); write(menuclear[2]);


     CursorOff;
     _punkt:=1;
     textcolor(white);
     gotoxy(_kx,_ky-1+_punkt); write(menuclear[_punkt]);
     _f:=0;
     repeat
      if keypressed then
      begin
            _input := readkey;
            if _input = #13 then
               begin
                    _f := 1;
                    CursorOn;
               end;
            if _input = #72 then
                     begin
                          textcolor(13);
                          gotoxy(_kx,_ky-1+_punkt); write(menuclear[_punkt]);
                          textcolor(white);
                          _punkt:=_punkt-1;
                          if _punkt<1 then _punkt:=2;
                          gotoxy(_kx,_ky-1+_punkt); write(menuclear[_punkt]);
                     end;
            if _input = #80 then
                     begin
                          textcolor(13);
                          gotoxy(_kx,_ky-1+_punkt); write(menuclear[_punkt]);
                          textcolor(white);
                          _punkt:=_punkt+1;
                          if _punkt>2 then _punkt:=1;
                          gotoxy(_kx,_ky-1+_punkt); write(menuclear[_punkt]);
                     end;
         end;
    until _f=1;
     if (_punkt = 1) then
        begin
             clrscr;
             f1 :=0;
             f2 :=0;
             gotoxy(35, 8); write('Данные удалены');
             name := '';
             surname := '';
             patronymic := '';
             rate := 0;
             company := '';
             city := '';
             street := '';
             home := 0;
             numSub := 0;
             for _i := 1 to numSub do
             begin
                  subsection[_i] := '';
             end;
             for _x := 1 to numSub do
             begin
             for _y := 1 to 12 do
             begin
                  data[_x,_y] := 0;
             end;
             for _y := 1 to 12 do
             begin
                  all[_y] := 0;
             end;
             end;
        end;
        gotoxy(25, 20); getEnter;
end;

procedure punkt6;
var _x, _y, _k : byte;
begin
if(f1 = 1) and (f2 = 1) and (f3 = 1) then
begin
nf:= 8;
gotoxy(10,5); write('Введите диск для записи в файл: '); Drive := getDrive(1);
assign(f, Drive + ':\Data.txt');
rewrite(f);
writeln(f,company);
writeln(f,surname);
writeln(f,name);
writeln(f,patronymic);
writeln(f,rate);
writeln(f,city);
writeln(f,street);
writeln(f,home);
writeln(f,numSub);
for _x := 1 to numSub do
    begin
         writeln(f,subsection[_x]);
         nf:=nf+1;
    end;
for _x := 1 to numSub do
         begin
         for _y := 1 to 12 do
             begin
                 writeln(f,data[_x,_y]:4:2);
             end;
         _k := _k + 10;
         end;
close(f);
end
else
begin
gotoxy(10, 15); writeln('Нет данных');
gotoxy(10,16);getEnter;
end;
end;

procedure punkt7;
var fileData:array[0..100] of string[30];
    i, _n, _x, _y, _count : byte;
    prom:real;
    b:integer;
    s:string;
begin
     _x:=1; _y:=1;
     gotoxy(20,8); write('Введите диск для записи из файла: '); Drive := getDrive(1);
     assign(f, Drive+':\Data.txt');
     reset(f);
     i:=0; _count := 0;
while not eof(f) do
begin
     readln(f,fileData[_count]);
     _count:=_count + 1;
end;
    close(f);
    company := fileData[0];
    surname:= fileData[1];
    name:=fileData[2];
    patronymic:=fileData[3];
    val(fileData[4], rate, b);
    city:= fileData[5];
    street:= fileData[6];
    val(fileData[7],home,b);
    val(fileData[8],numSub,b);
    _n := 1;
    val(fileData[8], kf, b);
    i:=9; nf := (kf + i) -1;
while(i <= nf) do
begin
     subsection[_n] := fileData[i];
     i:=i+1;
     _n:=_n+1;
end;
_n := kf * 12 + nf;
while(i <= _n) do
begin

     if(_y > 12) then
     begin
          _x := _x + 1;
          _y := 1;
     end;
     val(fileData[i], data[_x, _y], b);
     _y := _y + 1;
     i := i + 1;
end;
f1:=1;
f2:=1;


textcolor(13);
gotoxy(50,2); write('Предприятие: ', company);
gotoxy(50,3); write('Директор: ', surname,' ', name[1],'.',patronymic[1],'.');
gotoxy(4, 4); write('Тариф: ', rate:4:2);
gotoxy(4, 25); write('Адрес: ', 'г.', city, ', ул.', street, ', д.', home);
end;

procedure u_g;
var _c: char;
    _f: byte;
begin
    CursorOff;
    punkt:=1;
    textcolor(white);
    gotoxy(x,y-1+punkt); write(menu[punkt]);
    _f:=0;
    repeat
      if keypressed then
      begin
            point := readkey;
            if point = #13 then
               begin
                    _f := 1;
                    CursorOn;
               end;
            if point = #72 then
                     begin
                          textcolor(13);
                          gotoxy(x,y-1+punkt); write(menu[punkt]);
                          textcolor(white);
                          punkt:=punkt-1;
                          if punkt<1 then punkt:=8;
                          gotoxy(x,y-1+punkt); write(menu[punkt]);
                     end;
            if point = #80 then
                     begin
                          textcolor(13);
                          gotoxy(x,y-1+punkt); write(menu[punkt]);
                          textcolor(white);
                          punkt:=punkt+1;
                          if punkt>n then punkt:=1;
                          gotoxy(x,y-1+punkt); write(menu[punkt]);
                     end;
         end;
    until _f=1;

end;


procedure m_o;
var _i: byte;
begin
    textcolor(13);
    gotoxy(21,5); writeln('ПОТРЕБЛЕНИЕ ЭЛЕКТРОЭНЕРГИИ ПРЕДПРИЯТИЕМ');
    textcolor(13);
    for _i:=1 to 8 do
    begin
         gotoxy(x,y+_i-1); write(menu[_i]);
    end;
    u_g;
end;
begin
     month[1]:='Январь';
     month[2]:='Февраль';
     month[3]:='Март';
     month[4]:='Апрель';
     month[5]:='Май';
     month[6]:='Июнь';
     month[7]:='Июль';
     month[8]:='Август';
     month[9]:='Сентярь';
     month[10]:='Октябрь';
     month[11]:='Ноябрь';
     month[12]:='Декабрь';


   menu[1]:='Наименование предприятия';
   menu[2]:='Данные по предприятию';
   menu[3]:='Показания счетчиков';
   menu[4]:='Просмотр данных';
   menu[5]:='Очистка';
   menu[6]:='Сохранение данных';
   menu[7]:='Загрузка данных';
   menu[8]:='Выход';

   f1:=0; f2:=0;
   textbackground(black);
   clrscr;
   xm:=21;
   ym:=6;
   punkt:=1;
   repeat
      m_o;
              begin
                   case punkt of
                        1:begin
                         textcolor(13);
                         o_o(1,5,80,24);
                         punkt1;
                         o_o(1,5,80,24);
                         textcolor(13);
                         gotoxy(50,2); write('Предприятие: ', company);
                         gotoxy(50,3); write('Директор: ', surname,' ', name[1],'.',patronymic[1],'.');
                         gotoxy(4, 4); write('Тариф: ', rate:4:2);
                         end;
                        2:begin
                         textcolor(13);
                         o_o(1,5,80,24);
                         punkt2;
                         o_o(1,5,80,24);
                         textcolor(13);
                         gotoxy(4, 25); write('Адрес: ', 'г.', city, ', ул.', street, ', д.', home);
                         end;
                        3:begin
                         textcolor(13);
                         o_o(1,5,80,24);
                         punkt3;
                         o_o(1,5,80,24);
                         end;
                        4:begin
                         textcolor(13);
                         o_o(1,5,80,24);
                         punkt4;
                         o_o(1,5,80,24);
                         end;
                        5:begin
                         textcolor(13);
                         o_o(1,5,80,24);
                         punkt5;
                         o_o(1,5,80,24);
                        end;
                        6:begin
                         textcolor(13);
                         o_o(1,5,80,24);
                         punkt6;
                         o_o(1,5,80,24);
                        end;
                        7:begin
                         textcolor(13);
                         o_o(1,5,80,24);
                         punkt7;
                         o_o(1,5,80,24);
                        end;

              end;

      end
   until punkt = 8;
end.