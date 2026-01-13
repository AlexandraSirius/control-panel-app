// ===================================================
// UI SCALE + OFFSET
// ===================================================
float UI_SCALE = 0.5;

// общий сдвиг всей панели
int BASE_X = 0;
int BASE_Y = 80;   // двигает всё ниже / выше

// отдельный сдвиг ТОЛЬКО для матрицы кнопок
int BTN_MATRIX_OFFSET_X = -400;  
// отдельный сдвиг для левого столбца энкодеров
int LEFT_COLUMN_OFFSET_Y = -295;  

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
  
    Knob k = new Knob(
      "KNOB_TOP_" + i,
      knobTopX + i * knobTopStep,
      knobTopY,
      knobTopW,
      knobTopH
    );
  
    k.controlType = "knob";
    k.protocolIndex = i;   // p0..p8
  
    controls.add(k);
  }


  // ---------------------------------
  // 2) Левый столбец – 4 энкодера
  // ---------------------------------
  int knobLeftW = S(103);
  int knobLeftH = S(103);
  int knobLeftX = SX(46);
  int knobLeftY = SY(475 + LEFT_COLUMN_OFFSET_Y);
  int knobLeftStep = S(130);

  for (int i = 0; i < 3; i++) {
  
    Knob k = new Knob(
      "KNOB_LEFT_" + i,
      knobLeftX,
      knobLeftY + i * knobLeftStep,
      knobLeftW,
      knobLeftH
    );
  
    k.controlType = "knob";
    k.protocolIndex = 9 + i;   // p9..p11
  
    controls.add(k);
  }


  // ---------------------------------
  // 3) Большой левый энкодер
  // ---------------------------------
  Knob enc = new Knob(
    "ENCODER_0",
    SX(188),
    SY(198),
    S(156),
    S(159)
  );
  enc.controlType = "encoder";   // ← КРИТИЧНО
  enc.protocolIndex = 37;        // ← индекс по ТЗ
  controls.add(enc);

  // ---------------------------------
  // 4 Большая кнопка под экраном
  // ---------------------------------
  BigButton btnBig = new BigButton(
    "BTN_BIG",
    SX(378),
    SY(390),
    S(141),
    S(141)   // ← круглая
  );
  btnBig.protocolIndex = 40;   // по ТЗ
  controls.add(btnBig);

  // ---------------------------------
  // 5) Маленькая круглая кнопка
  // ---------------------------------
  SmallRoundButton btnSmall = new SmallRoundButton(
    "BTN_SMALL",
    SX(200),
    SY(415),
    S(110)
  );
  btnSmall.protocolIndex = 41;   // по ТЗ
  controls.add(btnSmall);


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
  // b0 .. b23
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

      int index = row * 6 + col;   // 0..23

      Button b = new Button(
        "BTN_" + row + "_" + col,
        bx,
        by,
        btnW,
        btnH
      );
      b.protocolIndex = index;

      controls.add(b);
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
      SX(1132),
      SY(240),
      S(60),
      S(210)
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
  }
}

// ===================================================
// HANDLE CONTROL CLICK
// ===================================================
void handleControlClick() {

  // органы выбираются только во вкладке «ОРГАНЫ»
  if (activeTab != 0) return;

  selectedControl = null;

  // 1. Ищем, по какому элементу кликнули
  for (ControlBase c : controls) {
    if (c.isHovered(mouseX, mouseY)) {
      selectedControl = c;
      break;
    }
  }

  // 2. Если ни по чему не кликнули — выходим
  if (selectedControl == null) return;

  // 3. ДЕЛАЕМ ЭЛЕМЕНТ АКТИВНЫМ
  activeControl = selectedControl;

  // 4. Просто выводим, кто теперь активный
  println(
    "Активный орган: " +
    activeControl.id + " -> " +
    activeControl.getProtocolPrefix() +
    activeControl.getProtocolIndex()
  );
}


void handleEncoderAction(Knob encoder) {

  if (activeControl == null) return;

  println(
    "Энкодер " + encoder.getEncoderModeName() +
    " управляет " +
    activeControl.id + " → " +
    activeControl.getProtocolPrefix() +
    activeControl.getProtocolIndex()
  );
}
