program main;
uses
  raylib;

const
  alto = 600;
  ancho = 400;
  r = ancho*0.025;
  by = ancho - ancho div 8 ;
  bar_an = ancho div 22;
  bar_al = alto div 8;
var
  cx,cy:integer; // No se usan variables globales. PD: Se inicializo en el main.

function mv_b(var bx:integer):integer;
begin
    if IsKeyDown(KEY_A)then
      bx:= bx - 10;
    if IsKeyDown(KEY_D)then
      bx:= bx + 10;
  if bx <= 0 then
    bx:= 0;
  if bx >= alto - bar_al then
    bx := alto - bar_al;
  mv_b:=bx;
end;


procedure reb(var x,y:integer;bx:integer);
begin
  if ((y >= by - bar_an div 2) and (y <= by + bar_an )) and ((x >= bx  ) and (x <= bx + bar_al ))  then begin
    cx:= cx* -1;
    cy:= cy* -1;
  end;
  if((x <= r) or (x >=alto - r)) then
    cx:= cx* -1;
  if((y <= r) or (y >= ancho -r))then
    cy:= cy* -1;
  x:=x + cx;
  y:= y + cy;
end;

procedure render(var x,y,bx:integer);
begin
  bx:=mv_b(bx);
  reb(x,y,bx);
  writeln('Este es Cx ',cx,' Este es cy ',cy);
  DrawCircle(x,y, r,Red);
  DrawRectangle(bx, by, bar_al, bar_an,red);
end;

var
  bx,x,y:integer;
begin
  cx:= 10;
  cy:= 10;
  bx:= ancho div 2 + bar_al; 
  x:= (alto div 2);
  y:= (ancho div 2);
  SetTargetFPS(60);
  InitWindow(alto,ancho,'Breakout con Raylib');
  while not WindowShouldClose() do begin
    BeginDrawing();
    ClearBackground(GetColor($181818));
    render(x,y,bx);
    EndDrawing();
  end;
  CloseWindow();
end.
