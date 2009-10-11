class Bullet {
  
  float x;
  float y;
  float speed;
  boolean alive;
  
  Bullet() {
    alive = false;
    x = 0;
    y = -1;
    speed = 0;
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY - 10;
    speed = -5;
    alive = true;
  }
  
  void move() {
    if ((y > 0) && (alive == true)) {
      y = y + speed;
    } else if ((y <= 0) && (alive == true)) {
      y = -4;
      alive = false;
      speed = 0;
      bulletsLeft++;
    }
  }

  void display() {
    stroke(0);
    ellipseMode(CENTER);
    point(x, y);
  }
  
  boolean isAlive() {
    if(alive) {
      return true;
    } else {
      return false;
    }
  }
  
  void caught() {
    speed = 0;
    y = -4;
    alive = false;
    bulletsLeft++;
  }
}
