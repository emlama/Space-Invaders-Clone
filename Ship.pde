class Ship {
  
  // x, y = pos of the ship
  // speed = how fast the ship is moving in either direction
  // shot is a boolean to check if there is currently a bullet in play

  float x;
  float y;
  float speed;
  boolean shot;
  
  // initialize our starting values
  Ship() {
    x = width/2;
    y = height-20;
    speed = 0;
    shot = false;
  }
  
  void display() {
    noStroke();
    rectMode(CENTER);
    fill((255 - (255 * bulletsLeft/bulletsMax)), 0, 0);
    rect(x, y, 20, 10);
    rect(x, y-5, 10, 4);

  } 
  
  // this moves things depending on values set at the input function
  void move() {
    
    // if the conditionals prove true, adjust otherwise, stop.
    if (left == true) {
      speed = speed - 0.4;
    } else if (right == true) {
      speed = speed + 0.4;
    } else {
      speed = 0;
    }
    
    // this sets the max speed
    if (speed > 6) {
      speed = 6;
    } else if (speed < -6) {
      speed = -6;
    }
   
    // applies the speed to X so the ship moves
    x = x + speed;
    
    // calculations to keep our little ship on screen
    if (x+10 > width) {
      x = width-10;
      speed = 0;
    } else if (x-10 < 0) {
      x = 10;
      speed = 0;
    }
  }
  
  void shoot() {
    // checks the shoot condition set by the input functions and sets the x and y if it's true
    if ((shoot == true) && (bulletsLeft > 0)) {
      bullets[beancounter] = new Bullet();
      bullets[beancounter].setLocation(x, y);
      
      // increment the beancounter so that the next bullet is ready for it's coords X,Y
      beancounter++;
      bulletsLeft--;
     
      // this loops the beancounter back to 1 when we get to the max number of bullets
      if (beancounter > bulletsMax-1) {
        beancounter = 0;
      }
    }
  }
}
