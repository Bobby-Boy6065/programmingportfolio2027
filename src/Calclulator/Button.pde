class Button {
  // Member Variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  // Constructor
  Button(float x, float y, char val) {
    this.x = x+70;
    this.y = y+30;
    w = 150;
    h = 80;
    c1 = color(60);
    c2 = color(177);
    this.val = val;
    hover = false;
  }

  //Member Methods
  void display() {
    if(hover == true){
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x,y,w,h,50);
    fill(255);
    if(val == 'c') {
      text("COS",x+40,y+20);
    } else {
    text(val,x+10,y+20);
  }
  }
  void mouseOver(float tempX, float tempY ) {
    if(tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
