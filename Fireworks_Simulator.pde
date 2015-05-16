Particle [] particle;
Particle [] oddball;
boolean drawAgain=false;
double red=(double)(Math.random()*155+40);
double green=(double)(Math.random()*155+40);
double blue=(double)(Math.random()*155+40);
void setup()
{
  size(800, 800);
  background(0);
  noStroke();
  particle=new Particle[800];
  oddball=new Particle[1];
  for (int i=0; i<particle.length; i++)
  {
    particle[0]=new OddballParticle();
    particle[i]=new NormalParticle();
  }
}
void draw()
{
  fill(0);
  rect(0, 0, 800, 800);
  red=(int)(Math.random()*155+40);
  green=(int)(Math.random()*155+40);
  blue=(int)(Math.random()*155+40);
  for (int i=0; i<particle.length; i++)
  {
    particle[i].move();
    particle[i].show();
  }
}

class NormalParticle implements Particle
{
  double x, y, speed, angle;
  int Color, shade;
  NormalParticle() {
    x=(double)(Math.random()*10+390);
    y=(double)(Math.random()*10+390);
    speed=(double)(Math.random()*10+.2);
    angle=(double)(Math.random()*20);
    shade=(int)(Math.random()*90+10);
    Color=color((int)red+shade, (int)green+shade, (int)blue+shade);
  }
  public void move()
  {
    x=x+Math.cos(angle)*speed;
    y=y+Math.sin(angle)*speed;
  }
  public void show()
  {
    fill(Color);
    ellipse((float)x, (float)y, 3, 3);
    if (drawAgain==true)
    {
      particle=new Particle[500];
      for (int i=0; i<particle.length; i++)
      {
        particle[i]=new NormalParticle();
      }
      particle[499]=new OddballParticle();
      x=(double)(Math.random()*10+290);
      y=(double)(Math.random()*10+290);
      Color=color((int)red+shade, (int)green+shade, (int)blue+shade);
      drawAgain=false;
    }
  }
}

interface Particle
{
  public void move ();
  public void show();
}

class OddballParticle implements Particle
{
  double x, y, speed, angle;
  int Color;
  OddballParticle() {
    x=400;
    y=400;
    speed=(double)(Math.random()*10+.2);
    angle=(double)(Math.random()*100);
    Color=color((int)red,(int)green,(int)blue);
  }
  public void move()
  {
    x=x-Math.cos(angle)*speed;
    y=y-Math.sin(angle)*speed;
  }
  public void show()
  {
    fill(Color);
    ellipse((float)x, (float)y, 4, 4);   
    if (!(x>=0 && x<=800 && y<=800 && y>=0))
    {
    drawAgain=true;
    x=400;
    y=400;
    }
  }
}

