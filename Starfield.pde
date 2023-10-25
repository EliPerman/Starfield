Particle[] starfield = new Particle[1000];
void setup(){
  size(1000, 1000);
  noStroke();
  boolean value = false;
  for(int i = 0; i < starfield.length; i++){
   if(Math.random() < 0.003){
     starfield[i] = new OddballParticle();
     value = true;
   } else {
     starfield[i] = new Particle();
   }
  }
  if(value == false)
    starfield[starfield.length - 1] = new OddballParticle();
}
void draw(){
  background(0);
  for(int i = 0; i < starfield.length; i++){
    starfield[i].move();
    starfield[i].show();
  }
}
void mousePressed(){
  boolean value = false;
  for(int i = 0; i < starfield.length; i++){
   if(Math.random() < 0.003){
     starfield[i] = new OddballParticle();
     value = true;
   } else {
     starfield[i] = new Particle();
   }
  }
  if(value == false)
    starfield[starfield.length - 1] = new OddballParticle();
}
class Particle{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle(){
    myX = myY = 500;
    mySpeed = Math.random()*10;
    myAngle = Math.random()*2*PI;
    myColor = color((int)((Math.random()+1)*128));
  }
  void move(){
    myX += mySpeed*Math.cos(myAngle);
    myY += mySpeed*Math.sin(myAngle);
  }
  void show(){
    fill(myColor);
    pushMatrix();
    translate((float)myX, (float)myY);
    rotate((float)Math.atan((myY - 500)/(myX - 500)));
    ellipse(0, 0, dist(500, 500, (float)myX, (float)myY)/25, dist(500, 500, (float)myX, (float)myY)/50);
    popMatrix();
  }
}
class OddballParticle extends Particle{
  OddballParticle(){
    myX = myY = 500;
    mySpeed = Math.random();
    myAngle = Math.random()*2*PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move(){
    myX += mySpeed*Math.cos(myAngle);
    myY += mySpeed*Math.sin(myAngle);
    myAngle += (Math.random() - 0.5)*0.5;
    mySpeed += Math.random()*0.1;
  }
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 20, 20);
  }
}
