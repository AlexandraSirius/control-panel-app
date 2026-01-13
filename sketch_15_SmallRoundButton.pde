class SmallRoundButton extends ControlBase {

  SmallRoundButton(String id, float x, float y, float d) {
    super(id, x, y, d, d);
    controlType = "button";
  }

  void drawControl() {
    float cx = x + w / 2;
    float cy = y + h / 2;

    fill(isHovered(mouseX, mouseY) ? 180 : 140);
    noStroke();
    ellipse(cx, cy, w, h);
  }

  boolean isHovered(float mx, float my) {
    float cx = x + w / 2;
    float cy = y + h / 2;
    float r = w / 2;
    return dist(mx, my, cx, cy) <= r;
  }
}
