void setup() {
  size(2000, 2000);
  noLoop();
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  drawFractal(0, 0, 690, 0);
  saveFrame();
}

void drawFractal(float x, float y, float side, int depth) {
  if (depth > 7) {
    return;
  }
  pushMatrix();
  translate(x, y);
  if (depth % 2 == 0) rotate(PI / 4); // rotate every other recursion
  
  rectMode(CENTER);
  noFill();
  stroke(0);
  rect(0, 0, side, side);

  float newSide =  sqrt(2) * side / 4;

  popMatrix();
  
  if (depth % 2 == 0){
    float moveBy = side / (2 * sqrt(2)) + newSide/2;
    drawFractal(x + moveBy, y - moveBy, newSide, depth + 1); // tr
    drawFractal(x + moveBy, y + moveBy, newSide, depth + 1); // br
    drawFractal(x - moveBy, y - moveBy, newSide, depth + 1); // tl
    drawFractal(x - moveBy, y + moveBy, newSide, depth + 1); // bl
  }
  else {
    drawFractal(x + side/2 + sqrt(2) * newSide/2, y, newSide, depth + 1); // right
    drawFractal(x - side/2 - sqrt(2) * newSide/2, y, newSide, depth + 1); // left
    drawFractal(x, y + side/2 + sqrt(2) * newSide/2, newSide, depth + 1); // down
    drawFractal(x, y - side/2 - sqrt(2) * newSide/2, newSide, depth + 1); // up
  }
}
