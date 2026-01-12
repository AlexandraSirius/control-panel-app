class Button extends ControlBase {

  Button(String id, float x, float y, float w, float h) {
    super(id, x, y, w, h);
    controlType = "button";
  }

  void drawControl() {
    fill(isHovered(mouseX, mouseY) ? 160 : 120);
    stroke(40);
    rect(x, y, w, h, 6);
  }
}
