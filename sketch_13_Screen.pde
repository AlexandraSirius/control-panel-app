class Screen extends ControlBase {

  Screen(String id, float x, float y, float w, float h) {
    super(id, x, y, w, h);
    controlType = "screen";
  }

  void drawControl() {
    fill(40);
    stroke(80);
    rect(x, y, w, h, 6);

    fill(180);
    textAlign(CENTER, CENTER);
    textSize(14);
    text("SCREEN", x + w/2, y + h/2);
  }

  boolean isInside(float mx, float my) {
    return (mx >= x && mx <= x + w &&
            my >= y && my <= y + h);
  }
}
