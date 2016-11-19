void engineOn()
{
  engineLoading.drawLoadingFigure();
  
  if(bar1.y > bar1.initialY - 255)
  {
    bar1.y-= 0.8;
    fill(255, 0, 0);
    textSize(30);
    font = loadFont("ImprintMT-Shadow-30.vlw");
    textFont(font, 30);
    text("Loading Systems",width/2 - 110, height/2 + 200);
  }
  else
  {
    
    engineTurnedOn = true;
    engineOn = false;
  }
  
}

void missiles()
{
  fill(255);
  textSize(20);
  text("YO",width/2, height/2);
}

void drill()
{
  fill(255);
  textSize(20);
  text("YO",width/2, height/2);
}

void guns()
{
  fill(255);
  textSize(20);
  text("YO",width/2, height/2);
}

void HDrive()
{
  fill(255);
  textSize(20);
  text("YO",width/2, height/2);
}

void buttonControl()
{
  if(mouseX > frontDispB1.x && mouseX < frontDispB1.x + frontDispB1.size
     && mouseY > frontDispB1.y && mouseY < frontDispB1.y + frontDispB1.size && mousePressed)
     {
       engineOn = true;
       missiles = false;
       guns = false;
       drill = false;
       HDrive = false;
     }
   if(mouseX > frontDispB2.x && mouseX < frontDispB2.x + frontDispB2.size
     && mouseY > frontDispB2.y && mouseY < frontDispB2.y + frontDispB2.size && mousePressed)
     {
       missiles = true;
       guns = false;
       drill = false;
       HDrive = false;
     }
     if(mouseX > frontDispB3.x && mouseX < frontDispB3.x + frontDispB3.size
     && mouseY > frontDispB3.y && mouseY < frontDispB3.y + frontDispB3.size && mousePressed)
     {
       missiles = false;
       guns = true;
       drill = false;
       HDrive = false;
     }
     if(mouseX > frontDispB4.x && mouseX < frontDispB4.x + frontDispB4.size
     && mouseY > frontDispB4.y && mouseY < frontDispB4.y + frontDispB4.size && mousePressed)
     {
       missiles = false;
       guns = false;
       drill = true;
       HDrive = false;
     }
     if(mouseX > frontDispB5.x && mouseX < frontDispB5.x + frontDispB5.size
     && mouseY > frontDispB5.y && mouseY < frontDispB5.y + frontDispB5.size && mousePressed)
     {
       engineOn = true;
       missiles = false;
       guns = false;
       drill = false;
       HDrive = true;
     }
     if(mouseX > frontDispB1.x && mouseX < frontDispB1.x + frontDispB1.size
     && mouseY > frontDispB1.y && mouseY < frontDispB1.y + frontDispB1.size)
     {
       
     }
     
     if(engineOn)
     {
       engineOn();
     }
     if(missiles)
     {
       missiles();
     }
     if(guns)
     {
       guns();
     }
     if(drill)
     {
       drill();
     }
     if(HDrive)
     {
       HDrive();
     }
}