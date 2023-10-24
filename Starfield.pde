Particle[] starfield = new Particle[1000];
void setup(){
  size(1000, 1000);
  noStroke();
  for(int i = 0; i < starfield.length; i++){
   if(Math.random() < 0.01) 
     starfield[i] = new OddballParticle();
   else
     starfield[i] = new Particle();
  }
}
void draw(){
  background(0);
  for(int i = 0; i < starfield.length; i++){
    starfield[i].move();
    starfield[i].show();
  }
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
    ellipse((float)myX, (float)myY, 10, 10);
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
