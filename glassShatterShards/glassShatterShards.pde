import processing.sound.*;

// click to break and reset 
Material m;
PVector gravity = new PVector(0, 0.04);
boolean clicked = true;

SoundFile shatter;
void setup() {
  size(400, 300);
  m = new Material();
  shatter = new SoundFile(this, "shatter.mp3");
}

void draw() {
  background(255);
  m.display();
}

void mousePressed() {
  if(m.shatterBool == false) {
      shatter.play();
      m.shatter(new PVector(mouseX, mouseY));
      m.addShards();
  }
  else{
    m = new Material();
  }
}
