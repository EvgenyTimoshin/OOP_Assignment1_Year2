/*
GUI assignment1 for OOP
Author : Evgeny Timoshin
Student NO: c15514003
Date started 24/10/2016 - current
*/

void setup()
{
  fullScreen(P3D);
  //size(1920, 1080 , P3D);
  smooth();
  frameRate(60);
  background(0);
  //textureMode(IMAGE);
  setupRadar();
  createButtons();
  createWindows();
  createPlanets();
  image = loadImage("hiresspace.jpg");
  //setupCamera();
  setupUi();
  
  tab = new Menu();
}

//GLOBAL VARS
//Bool
Boolean blue = false, red = true, green = false, someshit = false, menuButtons = false;
Boolean stopX = false, stopY = true;
Boolean solarScale = false;
Boolean solarmap = false;

//ArrayLists
ArrayList<Radar>radars = new ArrayList<Radar>();
ArrayList<Radar>radarTexts = new ArrayList<Radar>();
ArrayList<Menu>buttons = new ArrayList<Menu>();
ArrayList<FrontDisplay>displays = new ArrayList<FrontDisplay>();
ArrayList<Planet>planets = new ArrayList<Planet>();
//Other

Float radarLoc;
PImage image;
int gameState = 1;
Menu solarButton1, solarButton2, solarButton3, solarButton4;


 
void draw()
{
  //lights();
  switch(gameState)
  {
    case 0: background(0);
            uiOutline();
            break;
            
    case 1: background(10);
            if(solarmap == false)
            {
              uiOutline();
              drawInterior();
              drawRadar();
              drawFrontDisp();
              drawMenu();
            }
            else
            {
               drawSolarGraph();
            }
            drawPlanets();
            break;
  }
  
  //drawCamera();
}

void keyPressed()
{
  
  if(key == '1')
  {
    red = true;
    blue = green = someshit = false;
    radarChangeColor();
  }
  if(key == '2')
  {
    blue = true;
    red = green = someshit = false;
    radarChangeColor();
  }
  if(key == '3')
  {
    green = true;
    red = blue = someshit = false;
    radarChangeColor();
  }
  if(key == '4')
  {
    someshit = true;
    red = blue = green = false;
    radarChangeColor();
  }
}