 //<>// //<>//


class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration = new PVector();
  float lifespan;
  int ball_radius=4;
  Particle() {
    location = new PVector(mouseX, mouseY);
    velocity = new PVector(random(2.5), random(2.5));
    acceleration = new PVector(0.01, 0.01);
    lifespan = 1000;
  }
  void update () {
    lifespan -= 0.5;
  }
  void move() {

    location.add(velocity);
    velocity.add(acceleration);
  }

  void bounce() {
    if ((location.x-ball_radius <= 0)|| (location.x+ball_radius>= width))
    {
      velocity.x=velocity.x*-1;
    }
    if ((location.y-ball_radius < 0)|| (location.y+ball_radius> height))
    {
      velocity.y=velocity.y*-1;
    }
  }
 
 
 void keyPressed(){
 
   if (key==TAB){this.ball_radius++;}
   
 }

  boolean isDead() {



    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    update ();
    move();
    bounce();
    display();
  }

  void display() {
    ball_radius=4;
    stroke(1, lifespan);
    fill(random(255),random(255),random(255), lifespan);


    ellipse(location.x, location.y, ball_radius*2, ball_radius*2);
  }
}


Particle p;
int total = 10;
ArrayList<Particle> plist = new ArrayList<Particle>();
void setup() {

  fullScreen();

  for (int i = 0; i < total; i++) {
    plist.add(new Particle());
  }
}


void draw() {
  
  background(255);
  plist.add(new Particle());
  for (int i = plist.size()-1; i >= 0; i--) {
    Particle p = (Particle) plist.get(i);
    p.run();
    if (p.isDead()) {
      plist.remove(i);
    }
  }
}

//class ParticleSystem {
//  void setup() {
//    size(640, 360);
//    ps = new ParticleSystem();
//  }

//  void draw() {
//    background(255);
//    ps.run();
//  }
//}

//class ParticlesCollection {
//}