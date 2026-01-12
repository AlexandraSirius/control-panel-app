void drawTabs() {
  String[] tabs = {"ОРГАНЫ", "ЦВЕТА", "СЕТЬ"};

  float tabW = 110;
  float tabH = 28;

  for (int i = 0; i < tabs.length; i++) {
    float x = 10 + i * (tabW + 8);
    float y = 12;

    if (i == activeTab) {
      fill(70, 100, 160);
      rect(x, y, tabW, tabH, 6);

      stroke(120, 180, 255);
      strokeWeight(2);
      noFill();
      rect(x, y, tabW, tabH, 6);
      noStroke();
    } else {
      fill(50);
      rect(x, y, tabW, tabH, 6);
    }

    fill(220);
    textAlign(CENTER, CENTER);
    text(tabs[i], x + tabW/2, y + tabH/2);
  }

  float bx = width - 120;
  float by = 12;

  fill(120, 250, 160);
  rect(bx, by, 100, 28, 6);

  fill(30);
  text("SEND", bx + 50, by + 14);
}

void handleTabClick() {

  float tabW = 110;
  float tabH = 28;

  for (int i = 0; i < 3; i++) {
    float x = 10 + i * (tabW + 8);
    float y = 12;

    if (mouseX >= x && mouseX <= x + tabW &&
        mouseY >= y && mouseY <= y + tabH) {
      activeTab = i;
    }
  }

  if (mouseX >= width - 120 && mouseX <= width - 20 &&
      mouseY >= 12 && mouseY <= 40) {
    println("SEND pressed");
  }
}
