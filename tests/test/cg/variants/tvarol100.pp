{$ifdef fpc}
{$mode delphi}
{$endif fpc}

{$ifdef FPC_COMP_IS_INT64}
type 
  comp = currency;
{$endif FPC_COMP_IS_INT64}
procedure test(a: word); overload;
  begin
    writeln('word called instead of double');
    writeln('XXX')
  end;

procedure test(a: double); overload;
  begin
    writeln('double called instead of word');
    halt(1)
  end;

var
  v: variant;
  x: word;
  y: double;

begin
  try
    v := x;
    test(v);
  except
    on E : TObject do
      halt(1);
  end;

  try
    v := y;
    test(v);
  except
    on E : TObject do
      halt(1);
  end;
end.
