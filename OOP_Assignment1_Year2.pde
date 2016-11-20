/*
GUI assignment1 for OOP
Author : Evgeny Timoshin
Student NO: c15514003
Date started 24/10/2016 - current
*/

import ddf.minim.*;
PGraphics pg;
void setup()
{
  fullScreen(P3D);
  //size(1920, 1080 , P3D);
  pg = createGraphics(2048, 1152,P3D);
  smooth(4);
  frameRate(60);
  background(0);
  //textureMode(IMAGE);
  setupRadar();
  createButtons(); //creates all of the buttons on screen
  createFrontDisplay(); // creates the windows of the font of the spaceship
  createPlanets(); //creates planets for the solar system map
  createColorBars(); // creates bars to adjust color to your liking
  image = loadImage("hiresspace.jpg"); //Loads in image for the windows background
  //setupCamera();
  setupUi(); // creates the parameters for the ui to be drawn
  tab = new Menu();
  song = new Minim(this); //object that will be used to load the song in
  sound = song.loadFile("menusong.mp3");
  sound.play(); // plays the theme song for the whole prgram on setup
  
  
  
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
//ArrayLists
ArrayList<Radar>radars = new ArrayList<Radar>(); //Array of radars objects
ArrayList<Radar>radarTexts = new ArrayList<Radar>(); //Array of the N,W,S,E coordinates on radar
ArrayList<Menu>buttons = new ArrayList<Menu>(); //Array of buttons objects
ArrayList<FrontDisplay>displays = new ArrayList<FrontDisplay>(); // Array for the front display panel located under the solar system map
ArrayList<Planet>planets = new ArrayList<Planet>(); // Array to store the planet objects
ArrayList<Loading>systemLoading = new ArrayList<Loading>();
//Other
Float radarLoc;
PImage image;
int gameState = 1;
Menu solarButton1, solarButton2, solarButton3, solarButton4;// Buttons for the Solar System Map overlay
Menu frontDispB1, frontDispB2, frontDispB3, frontDispB4, frontDispB5, frontDispB6;
ColorBar bar1, bar2, bar3; // 3 Color bar objects
AudioPlayer sound;
Minim song;
Loading engineLoading;
PFont font;

void draw()
{
  //lights();
  switch(gameState)
  {
    case 0: background(0);
            //uiOutline();
            break;
            
    case 1: background(0);
            //Draws the various elements that where created in the setup
            if(solarmap == false)
            {
              if(engineTurnedOn)
              {
                uiOutline();
              }
              drawRadar();
              drawInterior();
              drawFrontDisp();
              //drawMenu();
              drawColorBars();
            }
            else
            {
               solarGraphDets();
               drawSolarGraph();
               drawPlanetDets();
            }
            if(engineTurnedOn)
            {
              drawPlanets();
            }
            break;
  }
  //drawCamera();
}