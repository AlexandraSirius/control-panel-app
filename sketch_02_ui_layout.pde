// ===================================================
// UI SCALE + OFFSET
// ===================================================
float UI_SCALE = 0.5;

// общий сдвиг всей панели
int BASE_X = 0;
int BASE_Y = 80;   // двигает всё ниже / выше

// отдельный сдвиг ТОЛЬКО для матрицы кнопок
int BTN_MATRIX_OFFSET_X = -400;  // ← МЕНЯЙ ЗДЕСЬ (в пикселях ДО масштаба)
// отдельный сдвиг для левого столбца энкодеров
int LEFT_COLUMN_OFFSET_Y = -295;  // ← поднимаем вверх
// ===================================================
// SCALE HELPERS
// ===================================================
int S(float v) {
  return round(v * UI_SCALE);
}

int SX(float x) {
  return BASE_X + S(x);
}

int SY(float y) {
  return BASE_Y + S(y);
}

// ===================================================
// INIT CONTROLS
// ===================================================
void initControls() {
  controls.clear();

  // ---------------------------------
  // 1) Верхний ряд – 9 энкодеров
  // ---------------------------------
  int knobTopW = S(103);
  int knobTopH = S(103);
  int knobTopX = SX(43);
  int knobTopY = SY(50);
  int knobTopStep = S(125);

  for (int i = 0; i < 9; i++) {
    controls.add(
      new Knob(
        "KNOB_TOP_" + i,
        knobTopX + i * knobTopStep,
        knobTopY,
        knobTopW,
        knobTopH
      )
    );
  }

  // ---------------------------------
  // 2) Левый столбец – 4 энкодера
  // ---------------------------------
  int knobLeftW = S(103);
  int knobLeftH = S(103);
  int knobLeftX = SX(46);
  int knobLeftY = SY(458 + LEFT_COLUMN_OFFSET_Y);
  int knobLeftStep = S(110);

  for (int i = 0; i < 4; i++) {
    controls.add(
      new Knob(
        "KNOB_LEFT_" + i,
        knobLeftX,
        knobLeftY + i * knobLeftStep,
        knobLeftW,
        knobLeftH
      )
    );
  }

  // ---------------------------------
  // 3) Большой левый энкодер
  // ---------------------------------
  controls.add(
    new Knob(
      "KNOB_BIG_1",
      SX(188),
      SY(198),
      S(156),
      S(159)
    )
  );

  // ---------------------------------
  // 4) Большой нижний энкодер
  // ---------------------------------
  controls.add(
    new Knob(
      "KNOB_BIG_2",
      SX(340),
      SY(374),
      S(156),
      S(159)
    )
  );

  // ---------------------------------
  // 5) Маленькая круглая кнопка
  // ---------------------------------
  controls.add(
    new Button(
      "BTN_SMALL",
      SX(200),
      SY(429),
      S(73),
      S(70)
    )
  );

  // ---------------------------------
  // 6) Экран
  // ---------------------------------
  controls.add(
    new Screen(
      "SCREEN",
      SX(378),
      SY(198),
      S(141),
      S(144)
    )
  );

  // ---------------------------------
  // 7) Матрица кнопок 6×4 (24 шт.)
  // ---------------------------------
  int btnW = S(78);
  int btnH = S(70);

  int btnStartX = SX(937 + BTN_MATRIX_OFFSET_X);
  int btnStartY = SY(182);

  int btnStepX = S(96);
  int btnStepY = S(96);

  for (int row = 0; row < 4; row++) {
    for (int col = 0; col < 6; col++) {
      int bx = btnStartX + col * btnStepX;
      int by = btnStartY + row * btnStepY;

      controls.add(
        new Button(
          "BTN_" + row + "_" + col,
          bx,
          by,
          btnW,
          btnH
        )
      );
    }
  }

  // ---------------------------------
  // 8) Рычаг – вертикальная часть
  // ---------------------------------
  // (пока не реализована)

  // ---------------------------------
  // 9) Ручка рычага (круглая)
  // ---------------------------------
  controls.add(
    new Slider(
      "SLIDER_0",
      SX(1132),        // X
      SY(50),          // Y
      S(60),           // ширина трека
      S(210)           // высота трека
    )
  );
}

// ===================================================
// DRAW CONTROLS
// ===================================================
void drawControls() {
  for (ControlBase c : controls) {

    c.update();
    c.draw();

    if (c instanceof Slider) {
      Slider s = (Slider)c;
      fill(255);
      textAlign(CENTER, BOTTOM);
      text(s.getMidiValue(), s.x + s.w / 2, s.y - 6);
      println(c.getClass().getSimpleName() + "  " + c.id);
    }
  }
}




// ===================================================
// HANDLE CONTROL CLICK
// ===================================================
void handleControlClick() {

  // органы выбираются только во вкладке ОРГАНЫ
  if (activeTab != 0) return;

  selectedControl = null;

  for (ControlBase c : controls) {
    if (c.isHovered(mouseX, mouseY)) {
      selectedControl = c;
      println("Выбран элемент: " + c.id);
    }
  }
}
