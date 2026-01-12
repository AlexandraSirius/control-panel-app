class Lever extends ControlBase {

  Lever(String id, float x, float y, float w, float h) {
    super(id, x, y, w, h);
    controlType = "lever";
  }

  void drawControl() {
    fill(180);
    rect(x, y, w, h);

    fill(130);
    ellipse(x + w/2, y + h, w, w);
  }
}
