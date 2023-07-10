class Shard {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float w;
  float h;
  float lifeSpan;
  
  Shard(PVector location_, float w_, float h_) {
    location = location_;
    w = w_;
    h = h_;
    velocity = PVector.random2D();
    velocity.mult(1.6);
    acceleration = new PVector(0, 0);
    lifeSpan = 200;
  }
  
  void display() {
    fill(100, 150);
    noStroke();
    rect(location.x, location.y, w, h);
  }
  
  void update() {
    if(velocity != null) {
      velocity.add(acceleration);
      location.add(velocity);
      acceleration.mult(0.09);
    }
    lifeSpan -= 1.2;
  }
  
  void run() {
    display();
    update();
    applyForce(gravity);
    checkEdge();
  }
  
  void checkEdge() {
    if(location.y > height - h) {
      velocity = null;
      location.y = height - h;
    }
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  boolean isDead() {
    if(lifeSpan < 0) {
      return true;
    } 
    else {
      return false;
    }    
  } 
}
