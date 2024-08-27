void setup() {
  size(1824, 1026, P3D);
  frameRate(100);
  surface.setTitle("Balls");
  surface.setLocation(48, 10);
  colorMode(HSB, 255);
  Reset_Def();
  if (ADMIN == 0) {
    IntroCoord();
  }
  else if (ADMIN == 2) {StZ=1; DarkT (); NewPar_X_Z();}
  Podscheti();
}

void draw() {
       if(StZ==0) Stage0 ();
  else if(StZ==1) MainB ();
  else if(StZ==2) Simulate();
}

public void Simulate () {
  stroke(WhiteInt);
  fill(BlackInt);
  background(0);
  Podscheti();
  if (Sphere_Mass_Count_Bool==0) {Sphere_Mass_Count();}
  if (Start_Check_Quant==0) {Start_Check();}
  CameraPos2();
  Kek2(); 
  Distance_0();
  if ((KnopkasN[5]==1) || (KnopkasN[7]==1)) {Rod();}
  Distance_All();
  if (KnopkasN[10]==1) {KnopkasN[10]=0; PausePressed=1; Check ();}
}

public void MainB (){
  Podscheti();
  stroke(WhiteInt);
  fill(BlackInt);
  background(0);
  if (ADMIN==0) {
    if      ((mouseX>=0) && (mouseX<=sh1))           {CameraPos1(); Panel_1 (); Kek();} 
    else if ((mouseX>=width-sh1) && (mouseX<=width)) {CameraPos1(); Panel_1 (); Kek();} 
    else if ((mouseX>=sh1) && (mouseX<=width-sh1))   {CameraPos2(); Kek2();}
  }
  if (ADMIN==2) {
    if      ((mouseX>=0) && (mouseX<=sh1))           {CameraPos1(); Panel_1 (); Kek();} 
    else if ((mouseX>=width-sh1) && (mouseX<=width)) {CameraPos1(); Panel_1 (); Kek();} 
    else if ((mouseX>=sh1) && (mouseX<=width-sh1))   {CameraPos2(); Kek2();}
  }
  Check ();
}
