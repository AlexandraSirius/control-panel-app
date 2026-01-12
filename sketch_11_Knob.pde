class Knob extends ControlBase {

  Knob(String id, float x, float y, float w, float h) {
    super(id, x, y, w, h);
    controlType = "knob";
  }

  void drawControl() {
    fill(isInside(mouseX, mouseY) ? 210 : 180);
    ellipse(x + w/2, y + h/2, w, h);
  }

  boolean isInside(float mx, float my) {
    float dx = mx - (x + w/2);
    float dy = my - (y + h/2);
    float r  = w/2;
    return dx*dx + dy*dy <= r*r;
  }
}
