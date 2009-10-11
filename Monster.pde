class Monster {

  boolean alive;
  int x;
  int y;
  int w;
  int h;

  Monster() {
    alive = false;
    x = 0;
    y = 0;
    w = 0;
    h = 0;    
  }

  void setLocation(int tempX, int tempY, int tempW, int tempH) {
    alive = true;
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }

  void display() {
    fill(0);
    noStroke();
    if (alive) {
      for (int i = 0; i < spaceInvader.length; i++) {
        for (int j = 0; j < spaceInvader[i].length; j++) {
          if (spaceInvader[i][j] == 1) {
            rect(x+(j*2), y+(i*2), 2, 2);
          }
        }
      }
    }
  }  

  boolean intersect(Bullet b) {    
    if((b.x > x - (w/2)) && (b.x < x + (w/2)) && (b.y > y - (h/2)) && (b.y < y + (h/2)) && (alive == true) && (b.alive == true)) {
      return true;
    } 
    else {
      return false;
    }
  }

  void kill() {
    alive = false;
  }

  boolean isAlive() {
    if(alive) {
      return true;
    } 
    else {
      return false;
    }
  }

  void move() {
    if(alive) {
      y = y + 15;
    }
  }
}

