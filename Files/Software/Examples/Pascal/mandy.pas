program Mandy;
{$U+}

label
     break;

var
   maxIter: Integer;
   chars: String[21];
   x: Integer;
   y: Integer;
   creal: Real;
   cimag: Real;
   zReal: Real;
   zImag: Real;
   count: Integer;
   zm: Real;
   zn: Real;
   zl: Real;
   zr2: Real;

begin
     maxIter := 20;
     chars := ' .,"~!^:;[/<&?oxOX#    ';
     for y := -39 to 39 do
     begin
          for x := -39 to 39 do
          begin
               creal := x / 20;
               cimag := y / 20;
               zReal := creal;
               zImag := cimag;
               count := 1;
               repeat
                  2  zm := zReal * zReal;
                     zn := zImag * zImag;
                     zl := zm + zn;
                     if (zl > 4) then goto break;
                     zr2 := zm-zn+creal;
                     zImag := zReal * zImag *2+cimag;
                     zreal := zr2;
                     count := count + 1;
               until count>maxIter;
               break:
                  write(chars[count+1]);
          end; (* For x *)
          writeln('');
     end; (* for y *)
end.  
