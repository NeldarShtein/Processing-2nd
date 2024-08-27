
//H3D
int ADMIN = 0;

int PausePressed = 0, Simulation_In_Process = 0;

int Cam_Pos_x = 0, Cam_Pos_y = 0, Cam_Pos_z = 0;
int Cen_Pos_x = 0, Cen_Pos_y = 0, Cen_Pos_z = 0;
int Rod_Pos_x = 0, Rod_Pos_z = 0;
int TeK_Pos_W = 0, TeK_Pos_H = 0, TeK_Pos_L = 0;
int WaterAMountL = 0;

float TrA_X = 0, TrA_Y = 0, TrA_Z = 0;
//INTRO
int amountS = 801, amountS0 = 0; 
int StZ = 0; int ChCol = 0, WhiteInt = 255, BlackInt = 0;
float col = 0;
float xS[] = new float[amountS];
float zS[] = new float[amountS];
float yS[] = new float[amountS];
float radS = 100;
int cerS = 50, col2 = 255;

float Sphere_Mass[] = new float[amountS];
float Speed[] = new float[amountS];
float xS_Dir[] = new float[amountS];
float zS_Dir[] = new float[amountS];
float Distance_For_Move = 0;
float Distance_For_Move_Balls[] = new float[amountS];


//Knopki
int sliders[] = new int[32];
int KnopkasN[] = new int[32];
int sh1 = 300;
int shirina = 0, visota = 0, NachT1 = 0, NachT2 = 0;
int MclickSt = 0, MclickSt2 = 0;

//Generete
int dist = 20;
  
int Board_Width = 50;
int Ball_Rad = 10;
int Hunderds = 8;
int Start_Check_Quant = 0;
int Distance_For_Move_Bool=0;

int mjau3 = 0;
int mjau4 = 0;
int mjau15 = 1;
int dist_M = 40;
int First_Gen = 1;

int Speed_Show = 5;
int Rod_Bool = 0;
int Energy_Mult = 10;

int Sphere_Mass_Count_Bool=0;
 
float rad[] = new float[amountS];
float Power[] = new float[amountS];
float Objom[] = new float[amountS];
int colorCol[] = new int[amountS];
int Balls_number[] = new int[amountS];
SphereObject sphere[] = new SphereObject[amountS];
SphereObject sphere2[] = new SphereObject[amountS];

public void NewPar_X_Z(){
  for (int i = 0; i < amountS; i++) {
      rad[i] = random(Ball_Rad+10, Ball_Rad+20);
      xS[i] = random(rad[i], TeK_Pos_W-rad[i]);
      zS[i] = random(rad[i], TeK_Pos_L-rad[i]);
      yS[i] = -rad[i];
      Speed[i] = 10;
      Distance_For_Move_Balls[i]=0;
    }
    Speed[0] = 20;
    rad[0] = Ball_Rad+20;
    xS[0] = rad[0];
    zS[0] = rad[0];
    yS[0] = -rad[0];
}

public void NewPar_X_Z_Persanal(int mjau3){
    xS[mjau3] = random(rad[mjau3], TeK_Pos_L-rad[mjau3]);
    zS[mjau3] = random(rad[mjau3], TeK_Pos_W-rad[mjau3]);
    yS[mjau3] = -rad[mjau3];
    sphere[mjau3] = new SphereObject(rad[mjau3]);
    sphere[mjau3].moveMe(xS[mjau3],yS[mjau3],zS[mjau3]);
      colorCol[mjau3] = 1;
    for (int b = 0; b < mjau3; ++b) {
        while (dist(xS[mjau3], yS[mjau3], zS[mjau3], xS[b], yS[b], zS[b]) < rad[mjau3]+rad[b]) {
          NewPar_X_Z_Persanal(mjau3);
        }
    }
}

public void Check () {
  if      (KnopkasN[9]==1) {Simulation_In_Process=1; KnopkasN[9]=0; PausePressed=0;}
  if      ((PausePressed==0 && Simulation_In_Process==0) || (PausePressed==1 && Simulation_In_Process==1)) {StZ=1;}
  else if (PausePressed==0 && Simulation_In_Process==1) {StZ=2;}
  if      (KnopkasN[8]==1) {Simulation_In_Process=0; Reset_Def(); PausePressed=0; StZ=1;}
}

public void Podscheti(){
  TeK_Pos_W = (sliders[24]*20)+250;
  TeK_Pos_H = (sliders[25]/4)+50;
  TeK_Pos_L = (sliders[26]*20)+250;

  Rod_Pos_x = width/2 + TeK_Pos_W*(sliders[21]-50)/100;
  Rod_Pos_z = -100 +    TeK_Pos_L*(sliders[23]-50)/100;

  Cen_Pos_x = width/2 + TeK_Pos_W*(sliders[18]-50)/100;
  Cen_Pos_y = height/2 + TeK_Pos_H*(sliders[19]-50)/100; 
  Cen_Pos_z = -TeK_Pos_L - TeK_Pos_L*(sliders[20]-40)/100 - TeK_Pos_W*(sliders[20]-40)/50;

  Cam_Pos_x = width/2 + TeK_Pos_W*(sliders[15]-50)/25;
  Cam_Pos_y = height/2 + TeK_Pos_H*(sliders[16]-50)/25;
  Cam_Pos_z = (sliders[14]-50);

  TrA_X = (TeK_Pos_W+Board_Width)/2;
  TrA_Y = 0;
  TrA_Z = (TeK_Pos_L+Board_Width)/2;
}

public void Reset_Def(){
  for (int i = 0; i < 31; ++i) {sliders[i]=50; KnopkasN[i]=0;} 
  sliders[24] = 100; sliders[26] = 100; sliders[3] = 100; sliders[16] = -800; sliders[14] = -670;
  First_Gen = 1;
  KnopkasN[7]=1;
  KnopkasN[4]=1;
  Start_Check_Quant = 0;
  Distance_For_Move = 0;
  Distance_For_Move_Bool=0;
  for (int i = 0; i < amountS; ++i) {
    Distance_For_Move_Balls[i]=0;
  }
  Rod_Bool = 0;
  Sphere_Mass_Count_Bool=0;
}
