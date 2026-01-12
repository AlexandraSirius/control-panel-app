class Encoder extends ControlBase {

  Encoder(String id, float x, float y, float size) {
    super(id, x, y, size, size);
    controlType = "encoder";
  }

  void drawControl() {
    fill(isHovered(mouseX, mouseY) ? 210 : 180);
    stroke(40);
    ellipse(x + w/2, y + h/2, w, h);
  }
}
