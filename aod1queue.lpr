program aod1queue;
 type
  queue = ^Item;
  Item = record
    info: integer;
    next: queue;
  end;
  var
  last, first: queue;
  n: byte;
procedure menu;
 begin
  writeln('1 Add element');
  writeln('2 Remove element');
  writeln('3 Show queue');
  writeln('0 Exit');
  writeln;
  end;
procedure add;
var
  elem:integer;
  newb: queue;
begin
  if first = nil then begin
      write ('First - '); readln(elem);
      new(last);
      last^.info := elem;
      last^.next := nil;
      first := last;
   end
   else begin
     write('Element - '); readln(elem);
     new(newb);
     newb^.info := elem;
     newb^.next := nil;
     last^.next := newb;
     last := newb;
   end;
   writeln;
  end;

  procedure del;
  var temp: queue;
  begin
   if first = nil then writeln ('Empty')
   else begin
        temp := first;
        first := first^.next;
        if first = nil then last := nil;
        dispose(temp);
   end;
   writeln;
  end;

  procedure show;
  var temp: queue;
  begin
  if first = nil then writeln ('Empty')
  else begin
  temp := first;
  while(temp <> nil) do begin
    write(temp^.info, ' ');
    temp := temp^.next;
      end;
  writeln;
  end;
  writeln;
  end;

  begin
   last := nil; first := nil;
   menu;
   repeat
    write ('Number: '); readln(n);
    case n of
    1:add;
    2:del;
    3:show;
    end;

    until n = 0 ;
end.

