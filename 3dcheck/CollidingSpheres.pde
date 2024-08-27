
public void Draw_Sphere(){
  Generate();
  Material();
  MaterialAll();
  Draw_Main();
}

public void Generate(){
  if (First_Gen == 1) {
    NewPar_X_Z();
    for (int i = 0; i < amountS; i++){
      colorCol[i] = 0;
      sphere[i] = new SphereObject(rad[i]);
      sphere[i].moveMe(xS[i],yS[i],zS[i]); 
      
      for (int b = 0; b < i; b++){
        mjau3 = i;
        while (dist(xS[i], zS[i], yS[i], xS[b], zS[b], yS[b]) < rad[i]+rad[b]) {
          NewPar_X_Z_Persanal(mjau3);
        }
      } 
      sphere2[i] = new SphereObject(rad[i]);
      sphere2[i].moveMe(xS[i],zS[i],yS[i]);  
    }
    First_Gen = 0;
  }
}

public void Material(){  
  if (KnopkasN[1]==1 || KnopkasN[2]==1 || KnopkasN[3]==1) {
    if (KnopkasN[1]==1 ) {mjau15=1;}
    if (KnopkasN[1]==2 ) {mjau15=2;}
    if (KnopkasN[1]==3 ) {mjau15=3;}
    for (int i = 1; i < sliders[3]*Hunderds; i++){
      if((xS[i]<TeK_Pos_W-rad[i]) && (zS[i]<TeK_Pos_L-rad[i])){
        colorCol[i] = mjau15;
        Check_Mat();
        noStroke();
        if (((mouseX>=sh1) && (mouseX<=width-sh1)) || (PausePressed==0 && Simulation_In_Process==1)) {
          translate(-TeK_Pos_W/2, TeK_Pos_H/2, -TeK_Pos_L/2);
          sphere[i].drawMe();
          translate(TeK_Pos_W/2, -TeK_Pos_H/2, TeK_Pos_L/2);
        }
        else {
          translate(-TeK_Pos_W/2, -TeK_Pos_L/2, 50);
          sphere2[i].drawMe();
          translate(TeK_Pos_W/2, TeK_Pos_L/2, -50);
        }
      }
    }
    Sphere_Mass_Count();
  }
}

public void MaterialAll(){
  if (KnopkasN[4]==1) {
    mjau15=1;
    for (int i = 1; i < sliders[3]*Hunderds; i++){
      if((xS[i]<TeK_Pos_W-rad[i]) && (zS[i]<TeK_Pos_L-rad[i])){
        colorCol[i] = mjau15;
        if (mjau15==1)      {fill(70, 255, 255);  mjau15=2;}
        else if (mjau15==2) {fill(212, 0, 255);   mjau15=3;}
        else if (mjau15==3) {fill(176, 0, 130);   mjau15=1;}
        noStroke();
          if (((mouseX>=sh1) && (mouseX<=width-sh1)) || (PausePressed==0 && Simulation_In_Process==1)) {
            translate(-TeK_Pos_W/2, TeK_Pos_H/2, -TeK_Pos_L/2);
            sphere[i].drawMe();
            translate(TeK_Pos_W/2, -TeK_Pos_H/2, TeK_Pos_L/2);
          }
          else {
            translate(-TeK_Pos_W/2, -TeK_Pos_L/2, 50);
            sphere2[i].drawMe();
            translate(TeK_Pos_W/2, TeK_Pos_L/2, -50);
          }
      }
    }
    Sphere_Mass_Count();
  }
}

public void Draw_Main(){
  if (KnopkasN[6]==1 || KnopkasN[7]==1) {
    fill(0, 0, 0);
    stroke(0);
    if (((mouseX>=sh1) && (mouseX<=width-sh1)) || (PausePressed==0 && Simulation_In_Process==1)) {
      translate(-TeK_Pos_W/2, TeK_Pos_H/2, -TeK_Pos_L/2);
      sphere[0].drawMe();
      translate(TeK_Pos_W/2, -TeK_Pos_H/2, TeK_Pos_L/2);
    }
    else {
      translate(-TeK_Pos_W/2, -TeK_Pos_L/2, 30);
      sphere2[0].drawMe();
      translate(TeK_Pos_W/2, TeK_Pos_L/2, -30);
    }
  }
}

public void Sphere_Power_Count(int mjau3, int mjau4){
  Power[mjau4]=Power[mjau3];
}

public void Check_Mat(){
  if (KnopkasN[1]==1) {fill(70, 255, 255);}
  else if (KnopkasN[2]==1) {fill(212, 0, 255);}
  else if (KnopkasN[3]==1) {fill(176, 0, 130);}
}
