class FrontDisplay
{
  float x;
  float y;
  float size;
  
  FrontDisplay(float x, float y, float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void draw()
  {
    PShape s;
    Radar r =  radars.get(0);
    s = createShape();
    s.beginShape();
    s.fill(r.c, 4);
    s.stroke(r.c);
    s.strokeWeight(3);
    s.vertex(x, y + size/4, -250);
    s.vertex(x + size/4, y - size, -250);
    s.vertex(width/2 + size*.75, y - size,-250);
    s.vertex(width/2 + size, y + size/4, -250);
    s.vertex(width/2 + size, y + size/2, - 250);
    s.vertex(x , y + size/2, -250);
    s.endShape(CLOSE);
    shape(s);
  }
  
}//End Class

void createFrontDisplay()
{
  int x = 400;
  for(int i = 0; i < 3; i ++)
  {
    FrontDisplay disp = new FrontDisplay(width / 2 - x, height - 100, x);
    displays.add(disp);
    x += 8;
  }
  
  frontDispB1 = new Menu(width/2 - 300, height - 110, 70, "Engine");
  frontDispB2 = new Menu(width/2 - 200, height - 110, 70, "Missile");
  frontDispB3 = new Menu(width/2 - 100, height - 110, 70, "Gun");
  frontDispB4 = new Menu(width/2 + 25, height - 110, 70, "Drill");
  frontDispB5 = new Menu(width/2 + 125 , height - 110, 70, "HDrive");
  frontDispB6 = new Menu(width/2 + 225 , height - 110, 70, "      ?");
  
  for(int i = 0; i < 8; i++)
  {
    Loading l = new Loading(width/2, height - 300, 60, random(50, 100), 0.0f + i,color(255, 0, 0));
    systemLoading.add(l);
  }
}//End createWindows

void drawFrontDisp()
{
  buttonControl();
  for(FrontDisplay disp: displays)
  {
    disp.draw();
  }
  if(engineTurnedOn == false)
  {
    stroke(0, 255, 0);
    rect(frontDispB1.x, frontDispB1.y, frontDispB1.size, frontDispB1.size);
  }
  frontDispB1.drawButtons();
  frontDispB2.drawButtons();
  frontDispB3.drawButtons();
  frontDispB4.drawButtons();
  frontDispB5.drawButtons();
  frontDispB6.drawButtons();
}//end drawFrontDisp