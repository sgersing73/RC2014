PROGRAM PI;
VAR uein,uum:real;
    n,max: integer;
BEGIN
    clrscr;
    writeln('PI-Berechnung nach Archimedes');
    writeln;
    write('maximale Eckenzahl? ');readln(max);
    writeln;
    writeln('n            u(n)          U(n)');
    n:=6; uein:=3; uum:=2*sqrt(3); {Start mit 6-Eck}
    REPEAT
      writeln(n:9,'    ',uein:11:10,'  ',uum:11:10);
      uein:=2*uein/sqrt(2+2*sqrt(1-sqr(uein/n)));
      n:=n*2;
      uum:=uein/(sqrt(1-sqr(uein/n)));
    UNTIL n>max;
    readln;
END.
