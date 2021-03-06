 /*
GUI assignment1 for OOP
Author : Evgeny Timoshin
Student NO: c15514003
Date started 24/10/2016 - current
*/

import ddf.minim.*;

void setup()
{
  fullScreen(P3D);
  //size(1920, 1080 , P3D);
  
  smooth(4);
  frameRate(60);
  background(0);
  //textureMode(IMAGE);
  setupRadar();
  createButtons(); //creates all of the buttons on screen
  createFrontDisplay(); // creates the windows of the font of the spaceship
  createPlanets(); //creates planets for the solar system map
  createColorBars(); // creates bars to adjust color to your liking
  createDials();
  createSoundVisualiser();
  createCrosshairs();
  image = loadImage("hiresspace.jpg"); //Loads in image for the windows background
  //setupCamera();
  setupUi(); // creates the parameters for the ui to be drawn
  tab = new Menu();
  song = new Minim(this); //object that will be used to load the song in
  sound = song.loadFile("menusong.mp3");
  sound.play(); // plays the theme song for the whole prgram on setup
  ship = new Ship(280, height/2 + 130);
  font = loadFont("NasalizationRg-Regular-48.vlw");
  sassy = loadImage("sassy.jpg");
  sassySound = song.loadSnippet("sassy.mp3");
}

//GLOBAL VARS
//Bool variables for various interactivity
Boolean stopX = false, stopY = true;
Boolean solarScale = false;
Boolean solarmap = false;
Boolean engineOn = false, missiles = false, guns = false, drill = false, HDrive = false, engineControl = false;
Boolean engineTurnedOn = false;
Boolean solarMassGraph = false, solarDistGraph = false, solarCycleGraph = false, solarAgeGraph = false;
Boolean menuButtons = false;
Boolean moveSoundVis = false;
Boolean EasterEgg = false;
//ArrayLists
ArrayList<Radar>radars = new ArrayList<Radar>(); //Array of radars objects
ArrayList<Radar>radarTexts = new ArrayList<Radar>(); //Array of the N,W,S,E coordinates on radar
ArrayList<Menu>buttons = new ArrayList<Menu>(); //Array of buttons objects
ArrayList<FrontDisplay>displays = new ArrayList<FrontDisplay>(); // Array for the front display panel located under the solar system map
ArrayList<Planet>planets = new ArrayList<Planet>(); // Array to store the planet objects
ArrayList<Loading>systemLoading = new ArrayList<Loading>();
ArrayList<Dial>dials = new ArrayList<Dial>();
ArrayList<MissileAim> missileCross = new ArrayList<MissileAim>();
//Other
Float radarLoc;
PImage image;
PImage sassy;
int gameState = 1;
float easterEggCounter = 15;
Menu solarButton1, solarButton2, solarButton3, solarButton4;// Buttons for the Solar System Map overlay
Menu frontDispB1, frontDispB2, frontDispB3, frontDispB4, frontDispB5, frontDispB6;
ColorBar bar1, bar2, bar3; // 3 Color bar objects
Ship ship;
AudioPlayer sound;
AudioSnippet sassySound;
Minim song;
Minim sounds;
Loading engineLoading;
soundVisualiser v;
Crosshair shipDrill;
Crosshair shipGun;

PFont font;
Boolean runUi = false;

void draw()
{
  //lights(); 
  textFont(font, 30);
  background(0);
 //Draws the various elements that where created in the setup
  if(EasterEgg)
  {
    easterEgg();
  }
  else if(solarmap == false && moveSoundVis == false && EasterEgg == false)
  {
      if(runUi)
      {
        uiOutline();
      }
      drawRadar();
      drawInterior();
      drawFrontDisp();
      //drawMenu();
      drawColorBars();
      drawDials();
      ship.draw();
      drawSoundVisualiser();
      drawCrosshairs();
    }
    else if(solarmap && EasterEgg == false)
    {
       solarGraphDets();
       drawSolarGraph();
       drawPlanetDets();
    }
    else
    {
      drawSoundVisualiser();
    }
    
    if(engineTurnedOn && moveSoundVis == false && EasterEgg == false)
    {
      drawPlanets();
    }     
}