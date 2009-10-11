// our little ship to be fighting monsters
Ship ship1;
Monster[] monsters;
Bullet[] bullets;
Timer timer;

// global variables for keyPressed to be passed into the various Ship.move & shoot function
boolean left = false;
boolean right = false;
boolean shoot = false;

int[][] spaceInvader = { {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0},
                         {0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0},                         
                         {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},                         
                         {0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0},
                         {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
                         {0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0},
                         {0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0},
                         {0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0},                         
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
                        };

// num of bullets is where I am currently having problems
// when shooting a lot of bullets at the monsters some of the
// bullets won't get counted back into the bulletsLeft holder
int bulletsMax = 50;
int bulletsLeft = bulletsMax;
int beancounter = 0;

// this is information that would eventually be moved into a 'level'
// file that would store information on each level
int monstersMax = 90;
int monstersAlive = monstersMax;
int monsterWidth = 20;
int monsterHeight = 10;

// define our font for text display
PFont font;

// setup the screen and initialize the ship/monster/bullet and timer classes
// set the font to Arial for debug
void setup() {
  size(400,600);
  frameRate(30);
  font = loadFont("ArialMT-12.vlw");
  textFont(font);
  
  ship1 = new Ship();
  monsters = new Monster[monstersMax];
  bullets = new Bullet[bulletsMax];
  
  timer = new Timer(800);   // Create a timer that goes off every 800 miliseconds
  timer.start();             // Starting the timer
  
  for (int i=0; i < bullets.length; i++) {
    bullets[i] = new Bullet();
  }
  
  int r = 1;
  int c = 0;
  
  for(int i=0; i < monsters.length; i++) {
    if ((25 + (c*25)) < width) {
      c++;
      monsters[i] = new Monster();
      monsters[i].setLocation((c * 25), (r * 20), monsterWidth, monsterHeight);        
    } else {
      c = 1;
      r++;
      monsters[i] = new Monster();
      monsters[i].setLocation((c * 25), (r * 20), monsterWidth, monsterHeight);
    }
  }
}

// the steps, goes background, display, move, repeat
void draw() {
  background(255);
  
  // !!DEBUG!!
  fill(0);
  // text("Framerate: " + int(frameRate), 5, height-1);
  text("Monsters: " + monstersAlive, 5, height-1);
  text("Bullets: " + bulletsLeft, 80, height-1);
  // text("Shoot: " + shoot, 140, height-1);
  
  ship1.shoot();
  ship1.move();
  ship1.display();
  
  for (int i = 0; i < bullets.length; i++) {
    for (int t = 0; t < monsters.length; t++) {
      if (monsters[t].intersect(bullets[i])) {
          bullets[i].caught();
          monsters[t].kill();
      }
    }
    bullets[i].move();
    bullets[i].display();    
  }

  if (timer.isFinished()) {
    for (int g = 0; g < monsters.length; g++) {
      monsters[g].move();
    }  
  timer.start();
  }
  
  for (int u = 0; u < monsters.length; u++) {
    monsters[u].display();
  }
}

// !!INPUT!!
void keyPressed() {
  if (key == 'a') {
    left =  true;
  } else if (key == 'd') {
    right = true; 
  } else if (key == 's') {
    shoot = true;
  }
}
  
void keyReleased() {
  if (key == 'a') {
    left = false;
  } else if (key == 'd') {
    right = false;
  } else if (key == 's') {
    shoot = false;
  }
}
