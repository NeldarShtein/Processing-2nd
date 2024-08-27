public void Slider (int shirina, int visota, int NachT1, int NachT2, String tekst, int sliderN){
  stroke(WhiteInt);
  strokeWeight(1);
  if ((mouseX>=NachT1) && (mouseX<=NachT1+shirina) && (mouseY>=NachT2) && (mouseY<=NachT2+visota)) {
    if (mousePressed && (mouseButton == LEFT)){sliders[sliderN] = (mouseX-NachT1)/2;}
  }
  if (sliders[sliderN]>-1  && sliders[sliderN]<101) {
    fill(BlackInt);
    quad(NachT1, NachT2, NachT1+shirina, NachT2, NachT1+shirina, NachT2+visota, NachT1, NachT2+visota);
    fill(120);
    quad(NachT1, NachT2, NachT1+(sliders[sliderN]*2), NachT2, NachT1+(sliders[sliderN]*2), NachT2+visota, NachT1, NachT2+visota);
  }
   fill(WhiteInt);
   textSize(visota);
   text(sliders[sliderN], NachT1+10+shirina, NachT2+visota-(visota/5));
   text(tekst, NachT1+10, NachT2+visota-(visota/5));
}

public void Knopka (int shirina, int visota, int NachT1, int NachT2, String tekst, int KnopkaN, int Knopka_OFF_B, int Knopka_OFF_E){
  stroke(WhiteInt);
  strokeWeight(1);
  if ((mouseX>=NachT1) && (mouseX<=NachT1+shirina) && (mouseY>=NachT2) && (mouseY<=NachT2+visota)) {
    fill(160);
    quad(NachT1, NachT2, NachT1+shirina, NachT2, NachT1+shirina, NachT2+visota, NachT1, NachT2+visota);
    if (mousePressed && (MclickSt == 1) && (mouseButton == LEFT)){
      MclickSt = 0;
      if (KnopkasN[KnopkaN]==0) {
        for (int i = Knopka_OFF_B; i <= Knopka_OFF_E; ++i) {KnopkasN[i]=0;}
        KnopkasN[KnopkaN]=1;}
      else{KnopkasN[KnopkaN]=0;}
    }
  }
  else if ((KnopkasN[KnopkaN]==0)){fill(BlackInt); 
    quad(NachT1, NachT2, NachT1+shirina, NachT2, NachT1+shirina, NachT2+visota, NachT1, NachT2+visota);}
  else if ((KnopkasN[KnopkaN]==1)){fill(120); 
    quad(NachT1, NachT2, NachT1+shirina, NachT2, NachT1+shirina, NachT2+visota, NachT1, NachT2+visota);}
  fill(WhiteInt);
  textSize(visota);
  text(tekst, NachT1+10, NachT2+visota-(visota/5));
}

void mouseClicked() {
  if (MclickSt == 0) {
    MclickSt = 1;
  } else {
    MclickSt = 0;
  }
}

void mouseReleased() {
  if (MclickSt2 == 0) {
    MclickSt2 = 1;
  } else {
    MclickSt2 = 0;
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {sliders[15]=sliders[15]-dist/5;  sliders[18]=sliders[18]-dist/2;}
  if (key == 'w' || key == 'W') {sliders[16]=sliders[16]-dist;    sliders[19]=sliders[19]-dist;}
  if (key == 'e' || key == 'E') {sliders[14]=sliders[14]-dist*4;}
  if (key == 'd' || key == 'D') {sliders[15]=sliders[15]+dist/5;  sliders[18]=sliders[18]+dist/2;}
  if (key == 's' || key == 'S') {sliders[16]=sliders[16]+dist;    sliders[19]=sliders[19]+dist;}
  if (key == 'q' || key == 'Q') {sliders[14]=sliders[14]+dist*4;}

  if (key == 'f') {KnopkasN[10]=1;}  

  if (Simulation_In_Process==0){
    if ((key == 'o' || key == 'O') && (sliders[26]>=60 && sliders[24]>=60)) {sliders[26]=sliders[26]-dist; sliders[24]=sliders[24]-dist; Podscheti(); Check_Pos();}
    if ((key == 'p' || key == 'P') ) {sliders[26]=sliders[26]+dist; sliders[24]=sliders[24]+dist; Podscheti(); Check_Pos();}
    else if ((key == 'm' || key == 'M') && (sliders[26]>=80 && sliders[24]>=80)) {First_Gen = 1;}
    if (key == 'r') {Reset_Def();}   
    
    if (key == CODED) {
      if (keyCode == LEFT)  {xS[0] = xS[0]-dist_M; Check_Pos();}
      if (keyCode == RIGHT) {xS[0] = xS[0]+dist_M; Check_Pos();}
      if (keyCode == UP)    {zS[0] = zS[0]-dist_M; Check_Pos();}
      if (keyCode == DOWN)  {zS[0] = zS[0]+dist_M; Check_Pos();}
    }
  }
}

public void Check_Pos(){
  if      (xS[0] < rad[0]) {xS[0]=rad[0];}
  if (zS[0] < rad[0]) {zS[0]=rad[0];}
  if (xS[0] > TeK_Pos_W-rad[0]) {xS[0]=TeK_Pos_W-rad[0];}
  if (zS[0] > TeK_Pos_L-rad[0]) {zS[0]=TeK_Pos_L-rad[0];}
  sphere[0] =   new SphereObject(rad[0]); sphere[0].moveMe(xS[0],yS[0],zS[0]);
  sphere2[0] =  new SphereObject(rad[0]); sphere2[0].moveMe(xS[0],zS[0],yS[0]);
}
