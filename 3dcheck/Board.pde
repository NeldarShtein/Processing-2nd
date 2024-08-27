public void Kek(){
  translate(width/2, height/2, Cen_Pos_z);
  Draw_Sphere();
  stroke(WhiteInt);
  noFill();
  box(TeK_Pos_W, TeK_Pos_L, TeK_Pos_H);
    noStroke();

    fill(255, 155, 255);
    translate(0, TrA_Z, 0);
      box(TeK_Pos_W+(Board_Width*2), TeK_Pos_H, Board_Width);
    translate(0, -TrA_Z, 0);

    translate(0, -TrA_Z, 0);
      box(TeK_Pos_W+(Board_Width*2), TeK_Pos_H, Board_Width);
    translate(0, TrA_Z, 0);

    translate(-TrA_X, 0, 0);
      box( Board_Width, TeK_Pos_L, Board_Width);
    translate(TrA_X, 0, 0);

    translate(TrA_X, 0, 0);
      box(Board_Width, TeK_Pos_L, Board_Width);
    translate(-TrA_X, 0, 0);
    
    fill(155, 155, 155);
    translate(0, 0, TeK_Pos_H/2-15);
      box(TeK_Pos_W+(Board_Width*2), TeK_Pos_L+(Board_Width*2), 5);
    translate(0, 0, -TeK_Pos_H/2-15);

  translate(-width/2, -height/2, -Cen_Pos_z);
}

public void Kek2(){
  translate(width/2, height/2, Cen_Pos_z);
    Draw_Sphere();
    stroke(WhiteInt);
    noFill();
    box(TeK_Pos_W, TeK_Pos_H, TeK_Pos_L);
      noStroke();

      fill(255, 155, 255);
      translate(0, 0, (TeK_Pos_L+Board_Width)/2);
        box(TeK_Pos_W+(Board_Width*2), TeK_Pos_H, Board_Width);
      translate(0, 0, -(TeK_Pos_L+Board_Width)/2);

      translate(0, 0, -(TeK_Pos_L+Board_Width)/2);
        box(TeK_Pos_W+(Board_Width*2), TeK_Pos_H, Board_Width);
      translate(0, 0, (TeK_Pos_L+Board_Width)/2);

      translate((TeK_Pos_W+Board_Width)/2, 0, 0);
        box(Board_Width, TeK_Pos_H, TeK_Pos_L);
      translate(-(TeK_Pos_W+Board_Width)/2, 0, 0);

      translate(-(TeK_Pos_W+Board_Width)/2, 0, 0);
        box(Board_Width, TeK_Pos_H, TeK_Pos_L);
      translate((TeK_Pos_W+Board_Width)/2, 0, 0);
      
      fill(155, 155, 155);
      translate(0, TeK_Pos_H/2, 0);
      box(TeK_Pos_W+(Board_Width*2), 5, TeK_Pos_L+(Board_Width*2));
      translate(0, -TeK_Pos_H/2, 0);

  translate(-width/2, -height/2, -Cen_Pos_z);
}
