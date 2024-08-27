public void Panel_1 (){
  if (Simulation_In_Process ==0) {
    Knopka (200, 30, 30, 190, "PLASTIC", 1, 1, 4);
    Knopka (200, 30, 30, 230, "IRON", 2, 1, 4);
    Knopka (200, 30, 30, 270, "STONE", 3, 1, 4);
    Knopka (200, 30, 30, 310, "RANDOM", 4, 1, 4);

    Knopka (200, 30, 30, 420, "RAND BALL", 5, 5, 7);
    Knopka (200, 30, 30, 460, "CONTR BALL", 6, 5, 7);
    Knopka (200, 30, 30, 500, "BOTH", 7, 5, 7);

    Slider (200, 30, 30, 610, "GRAVITY", 1);
    Slider (200, 30, 30, 650, "AIR DENSITY", 2);

    Slider (200, 30, 30, 760, "BALL%AM", 3);  
    
      fill(WhiteInt);
      textSize(50);
    text("SIMULATION", 20, 60);
    text("DETAILS", 110, 100);
      textSize(40);
    text("MATERIAL", 30, 180);
    text("AFFECTING", 30, 410);
    text("GRAVITY", 30, 600);
  }

  if (PausePressed==1 && Simulation_In_Process ==1) {Knopka (200, 30, 30, 850, "NEW", 8, 8, 8);}
  if ((KnopkasN[1]+KnopkasN[2]+KnopkasN[3]+KnopkasN[4]+KnopkasN[5]+KnopkasN[6]+KnopkasN[7])==2) 
    {Knopka (200, 30, 30, 890, "START", 9, 9, 9);}

  fill(WhiteInt);
  textSize(35);
    text("A - Move Left", width-sh1, 60);
    text("W - Move Up", width-sh1, 100);
    text("S - Move Down", width-sh1, 140);
    text("D - Move Right", width-sh1, 180);

    text("Q - Move Back", width-sh1, 280);
    text("E - Move Closer", width-sh1, 320);
    text("R - Reset All", width-sh1, 360);
    text("F - Pause", width-sh1, 400);

    text("O - Decrease Area", width-sh1, 500);
    text("P - Increase Area", width-sh1, 540);
    text("M - Reset Balls", width-sh1, 580);
    text(Distance_For_Move, width-sh1, 640);
}