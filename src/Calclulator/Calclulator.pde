// Ty Burbidge | Sep 14 2026 | Calculator
// Color Palette #423F36 #FFF3AF #BAA58
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];

void setup() {
  size(720, 660);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  newEntry = true;
  op = ' ';
  left = true;
  numButtons[0] = new Button(210, 560, '0');
  numButtons[1] = new Button(50, 460, '1');
  numButtons[2] = new Button(210, 460, '2');
  numButtons[3] = new Button(370, 460, '3');
  numButtons[4] = new Button(50, 360, '4');
  numButtons[5] = new Button(210, 360, '5');
  numButtons[6] = new Button(370, 360, '6');
  numButtons[7] = new Button(50, 260, '7');
  numButtons[8] = new Button(210, 260, '8');
  numButtons[9] = new Button(370, 260, '9');
  opButtons[0] = new Button(370, 560, '.');
  opButtons[1] = new Button(50, 560, '±');
  opButtons[2] = new Button(50, 160, 'C');
  opButtons[3] = new Button(530, 560, '=');
  opButtons[4] = new Button(530, 460, '+');
  opButtons[5] = new Button(530, 360, '-');
  opButtons[6] = new Button(530, 260, 'x');
  opButtons[7] = new Button(530, 160, '÷');
  opButtons[8] = new Button(50, 60, 'c');
  opButtons[9] = new Button(530, 60, '^');
  opButtons[10] = new Button(210, 160, '²');
  opButtons[11] = new Button(370, 160, '√');
}

void draw() {
  background(255);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  //background shape
  rectMode(CENTER);
  fill(175);
  rect(width/2, height-570, width-420, 80, 8);
  //Overlay text
  fill(60);
  textAlign(RIGHT);
  textSize(40);
  text(displayVal, width-240, 100);
  textSize(60);
}

void mouseReleased() {
  //update display with button clicked by user
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }
  //Add values if not




  // loop through opButtons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      char clicked = opButtons[i].val;

      if (clicked == '=') {
        performCalc();
      } else if (clicked == '+' || clicked == '-' ||
        clicked == 'x' || clicked == '÷' || clicked == '^') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal = str(op);
      } else if (clicked == 'C') {
        l = 0.0;
        r=0.0;
        result=0.0;
        op = ' ';
        left = true;
        newEntry= true;
        displayVal = "0.0";
      } else if (clicked == '√') {
        if (left == true) {
          l = sqrt(l);
          displayVal = str(l);
        } else {
          r = sqrt(r);
          displayVal = str(r);
        }
      } else if (clicked == '²') {
        if (left == true) {
          l = sq(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == 'c') {
        if (left == true) {
          l = cos(l);
          displayVal = str(l);
        } else {
          r = cos(r);
          displayVal = str(r);
        }
      } else if (clicked == '±') {
        if (left == true) {
          l = (l*-1);
          displayVal = str(l);
        } else {
          r = (r*-1);
          displayVal = str(r);
        }
      } else if (clicked == '.') {
        if (!displayVal.contains(".")) {
          if (left == true) {
            displayVal += ".";
            l = float(displayVal);
          } else {
            displayVal += ".";
            r = float(displayVal);
          }
        }
      }
    }
  }
  printState();
}

void printState() {
  println(
    "l; " + l +
    " | r; " + r +
    " | result: " + result +
    " | left: " + left +
    " | op: " + op +
    " | display: " + displayVal
    );
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '^') {
    result = pow(l, r);
  } else {
    return;
  }

  displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
  newEntry = true;
}

void keyPressed() {
  if (key == '1') {
    println("You hit 1" + keyCode);
    handleEvent('1', true);
  }else if (key == '2') {
    println("You hit 2" + keyCode);
    handleEvent('2', true);
  }else if (key == '3') {
    println("You hit 3" + keyCode);
    handleEvent('3', true);
  } else if (key == '4') {
    println("You hit 4" + keyCode);
    handleEvent('4', true);
  } else if (key == '5') {
    println("You hit 5" + keyCode);
    handleEvent('5', true);
  } else if (key == '6') {
    println("You hit 6" + keyCode);
    handleEvent('6', true);
  } else if (key == '7') {
    println("You hit 7" + keyCode);
    handleEvent('7', true);
  } else if (key == '8') {
    println("You hit 8" + keyCode);
    handleEvent('8', true);
  } else if (key == '9') {
    println("You hit 9" + keyCode);
    handleEvent('9', true);
  } else if (key == '0') {
    println("You hit 0" + keyCode);
    handleEvent('0', true);
  } else if (keyCode == 45) {
    println("You hit -" + keyCode);
    handleEvent('-', false);
  } else if (key == '+') {
    println("You hit +" + keyCode);
    handleEvent('+', false);
  } else if (key == '/') {
    println("You hit /" + keyCode);
    handleEvent('/', false);
  } else if (key == '*') {
    println("You hit *" + keyCode);
    handleEvent('*', false);
  } else if (key == 'C') {
    println("You hit Clear" + keyCode);
    handleEvent('C', false);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      // Replace value if 0.0
      displayVal=digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left == true) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // other stuff
  }
}
    } else {
      displayVal += digit;
    }

    if (left == true) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // other stuff
  }
}
