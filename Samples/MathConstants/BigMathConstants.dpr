program BigMathConstants;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  System.IOUtils,
  Velthuis.BigIntegers,
  Velthuis.BigDecimals;

function Factorial(const value: UInt64): BigInteger;
begin
  if value < 0 then
    raise EMathError.Create('Factorial undefined for negative numbers.');

  Result := 1;
  for var i := 1 to value do
    Result := Result * i;
end;

function Euler(const Iterations: UInt64): BigDecimal;
begin
  Result := 1;
  Result.DefaultPrecision := Iterations;
  for var n := 1 to Iterations do
    Result := Result + BigDecimal.One / Factorial(n);
  Result := Result.RoundToPrecision(Iterations);
end;

function CheckDigits(const Digits1, Digits2: string): UInt64;
begin
  for var idx := 1 to Length(Digits1) do
    if Digits1[idx] <> Digits2[idx] then exit(idx);
  Result := 0;
end;

const Precision = 200;

begin
  try
    Writeln('√2, Square root of 2, Pythagoras constant.');
    Writeln(BigDecimal.Sqrt(2,Precision).ToString);
    Writeln('√3, Square root of 3, Theodorus'' constant.');
    Writeln(BigDecimal.Sqrt(3,Precision).ToString);
    Writeln('√5, Square root of 5');
    var sqrt5 := BigDecimal.Sqrt(5,Precision);
    Writeln(sqrt5.ToString);
    Writeln('φ, Phi, Golden ratio, (1 + √5)/2');
    var phi := BigDecimal.Divide((1 + Sqrt5), 2, Precision);
    Writeln(phi.ToString);
    Writeln('Common logarithm of 2');
    Writeln(BigInteger.Log(2,10).ToString);
    Writeln('Natural logarithm of 2');
    Writeln(BigInteger.Ln(2).ToString);
    Writeln('Euler''s Number');
    var CalcEuler := Euler(1000);
    Writeln(CalcEuler.ToString);
    var FixedEuler := TFile.ReadAllText('..\..\..\Samples\MathConstants\Euler10k.txt');
    var firstError := CheckDigits(calcEuler.ToString, FixedEuler);
    if FirstError <> 0 then
      Writeln('First Euler Error at digit # ', FirstError);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Writeln('Press [Enter] to close.');
  Readln;
end.
