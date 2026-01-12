class BigButton extends ControlBase {

  BigButton(String id, float x, float y, float w, float h) {
    super(id, x, y, w, h);
    controlType = "bigbutton";
  }

  void drawControl() {
    fill(isHovered(mouseX, mouseY) ? 200 : 150);
    stroke(40);
    rect(x, y, w, h, 8);

    fill(130);
    ellipse(x + w/2, y + h/2, w, h);
  }

  boolean isHovered(float mx, float my) {
    float dx = mx - (x + w/2);
    float dy = my - (y + h/2);
    float r = w/2;
    return dx*dx + dy*dy <= r*r;
  }
}
