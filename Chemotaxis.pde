//DB-F
Colony [] Bacteria;
void setup()
{
  size(500, 500);
  Push = new Poison();
  Bacteria = new Colony[100];
  for (int i = 0; i < Bacteria.length; i++)
  {
    Bacteria[i] = new Colony();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < Bacteria.length; i++)
  {
    Bacteria[i].move();
    Bacteria[i].show();
  }
  Push.show();
  Push.dissapear();
}
void mouseClicked()
{
  Push.show();
  Push.increase();
}
class Colony
{
  int bacteriaX, bacteriaY;
  int [] col;
  Colony()
  {
    bacteriaX = (int)(Math.random()*500);
    bacteriaY = (int)(Math.random()*500);
    col = new int [3];
    for (int i = 0; i < col.length; i++)
    {
      col[i] = (int)(Math.random()*256);
    }
  }
  void move()
  {
    if (dist(bacteriaX, bacteriaY, Push.myX, Push.myY) <= Push.size +10)
    {
      if (bacteriaX > Push.myX)
      {
        bacteriaX = bacteriaX + (int)(Math.random()*5);
        if (bacteriaY > Push.myY)
          bacteriaY = bacteriaY + (int)(Math.random()*5);
        else
          bacteriaY = bacteriaY - (int)(Math.random()*5);
      } else
      {
        bacteriaX = bacteriaX - (int)(Math.random()*5);
        if (bacteriaY > Push.myY)
          bacteriaY = bacteriaY + (int)(Math.random()*5);
        else
          bacteriaY = bacteriaY - (int)(Math.random()*5);
      }
    } else
    {
      if (bacteriaY > 480)
      {
        bacteriaX = bacteriaX + (int)(Math.random()*4-2);
        bacteriaY = bacteriaY + (int)(Math.random()*5-5);
      } else if (bacteriaX > 480)
      {
        bacteriaX = bacteriaX + (int)(Math.random()*5-5);
        bacteriaY = bacteriaY + (int)(Math.random()*4-2);
      } else if (bacteriaX < 20)
      {
        bacteriaX = bacteriaX + (int)(Math.random()*4+1);
        bacteriaY = bacteriaY + (int)(Math.random()*4-2);
      } else if (bacteriaY < 20)
      {
        bacteriaX = bacteriaX + (int)(Math.random()*4-2);
        bacteriaY = bacteriaY + (int)(Math.random()*4+1);
      } else
      {
        bacteriaX = bacteriaX + (int)(Math.random()*4-2);
        bacteriaY = bacteriaY + (int)(Math.random()*4-2);
      }
    }
  }
  void show()
  {
    strokeWeight(1);
    noFill();
    stroke(col[0], col[1], col[2]);
    ellipse(bacteriaX, bacteriaY, 20, 20);
  }
}
class Poison
{
  int myX, myY, size;
  Poison()
  {
    myX = -100;
    myY = -100;
    size = 0;
  }
  void show()
  {
    noFill();
    noStroke();
    ellipse(myX, myY, size, size);
    if (size >= 1)
    {
      size=size+3;
    }
  }
  void dissapear()
  {
    if (size >= 300 )
    {
      myX = -100;
      myY = -100;
      size = 0;
    }
  }
  void show()
  {
    myX = mouseX;
    myY = mouseY;
  }
  void increase()
  {
    size = 1;
  }
}
