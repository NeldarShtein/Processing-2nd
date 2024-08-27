public void Sphere_Mass_Count(){
  Sphere_Mass[0] = 0.3*rad[0]*rad[0]*rad[0]*3/4;
  for (int i = 1; i < sliders[3]*Hunderds; i++) {
    if (mjau15==1)      {Sphere_Mass[i] = 0.03*rad[i]*rad[i]*rad[i]*3/4;}
    else if (mjau15==2) {Sphere_Mass[i] = 0.09*rad[i]*rad[i]*rad[i]*3/4;}
    else if (mjau15==3) {Sphere_Mass[i] = 0.18*rad[i]*rad[i]*rad[i]*3/4;}
  }
}
  
public void Start_Check(){
  if (Start_Check_Quant==0) {
    for (int i = 0; i < sliders[3]*Hunderds; ++i) {
      if((xS[i]<TeK_Pos_W-rad[i]) && (zS[i]<TeK_Pos_L-rad[i])){
        Balls_number[Start_Check_Quant]=i;
        xS_Dir[Start_Check_Quant] = random(-1, 1);
        zS_Dir[Start_Check_Quant] = random(-1, 1);
        Start_Check_Quant=Start_Check_Quant+1;
      }
    }
  }
}

public void Distance_0(){
  if (Distance_For_Move_Bool==0) {
    Distance_For_Move = Sphere_Mass[0] * Speed[0] / (sliders[1]+1) / ((sliders[2]/2)+1) * Energy_Mult * 135;
    Distance_For_Move_Bool=1;
  }
  Distance_For_Move=Distance_For_Move+Distance_For_Move_Balls[Balls_number[0]];
  Distance_For_Move_Balls[Balls_number[0]]=0;
  if (Distance_For_Move>=1 && (KnopkasN[6]==1 || KnopkasN[7]==1)) {
    for (int i = 0; i < Speed_Show; ++i) {
      if (Distance_For_Move>=1) {
        for (int b = 1; b < Start_Check_Quant; ++b) {
          if (dist(xS[0], zS[0], yS[0], xS[Balls_number[b]], zS[Balls_number[b]], yS[Balls_number[b]]) < rad[0]+rad[Balls_number[b]]) {
            Give_Force(Balls_number[b]);
          }
        }        
        xS[0] = xS[0]+xS_Dir[0]; Check_Pos2();
        zS[0] = zS[0]+zS_Dir[0]; Check_Pos2();
        sphere[0] =   new SphereObject(rad[0]); sphere[0].moveMe(xS[0],yS[0],zS[0]);
        sphere2[0] =  new SphereObject(rad[0]); sphere2[0].moveMe(xS[0],zS[0],yS[0]);
        Distance_For_Move=Distance_For_Move-1;
      }
    }
  }
}

public void Check_Pos2(){
  if      (xS[0] < rad[0])            {xS[0]=rad[0]; xS_Dir[0]=-xS_Dir[0];}
  if      (zS[0] < rad[0])            {zS[0]=rad[0]; zS_Dir[0]=-zS_Dir[0];}
  if      (xS[0] > TeK_Pos_W-rad[0])  {xS[0]=TeK_Pos_W-rad[0]; xS_Dir[0]=-xS_Dir[0];}
  if      (zS[0] > TeK_Pos_L-rad[0])  {zS[0]=TeK_Pos_L-rad[0]; zS_Dir[0]=-zS_Dir[0];}
  sphere[0] =   new SphereObject(rad[0]); sphere[0].moveMe(xS[0],yS[0],zS[0]);
  sphere2[0] =  new SphereObject(rad[0]); sphere2[0].moveMe(xS[0],zS[0],yS[0]);
}

public void Give_Force(int b){
  Distance_For_Move=Distance_For_Move/2;
  Distance_For_Move_Balls[b]=Distance_For_Move;
  xS_Dir[b]=xS_Dir[0];
  zS_Dir[b]=zS_Dir[0];
  xS_Dir[0]=-xS_Dir[0];
  zS_Dir[0]=-zS_Dir[0];
}

public void Rod(){
  if (Rod_Bool==0) {
    for (int i = 1; i < Start_Check_Quant/4; ++i) {
      Distance_For_Move_Balls[Balls_number[i]] = random(1000, 1300) * Energy_Mult * Sphere_Mass[Balls_number[i]] * Speed[Balls_number[i]] / (sliders[1]+1) / ((sliders[2]/2)+1);
    }
    Rod_Bool=1;
  }
}

public void Distance_All(){
  for (int i = 1; i < Start_Check_Quant; ++i) {
    if (Distance_For_Move_Balls[Balls_number[i]]>=1) {
      for (int c = 0; c < Speed_Show; ++c) {
        if (Distance_For_Move_Balls[Balls_number[i]]>=1) {
          for (int b = 0; b < Start_Check_Quant; ++b) {
            if (i!=b) {
              if (dist(xS[Balls_number[i]], zS[Balls_number[i]], yS[Balls_number[i]], xS[Balls_number[b]], zS[Balls_number[b]], yS[Balls_number[b]]) < rad[Balls_number[i]]+rad[Balls_number[b]]) {
                Give_Force2(Balls_number[i], Balls_number[b]);
              }
            }
          }        
          xS[Balls_number[i]] = xS[Balls_number[i]]+xS_Dir[i]; Check_Pos3(i);
          zS[Balls_number[i]] = zS[Balls_number[i]]+zS_Dir[i]; Check_Pos3(i);
          sphere[Balls_number[i]] =   new SphereObject(rad[Balls_number[i]]); sphere[Balls_number[i]].moveMe(xS[Balls_number[i]],yS[Balls_number[i]],zS[Balls_number[i]]);
          sphere2[Balls_number[i]] =  new SphereObject(rad[Balls_number[i]]); sphere2[Balls_number[i]].moveMe(xS[Balls_number[i]],zS[Balls_number[i]],yS[Balls_number[i]]);
          Distance_For_Move_Balls[Balls_number[i]]=Distance_For_Move_Balls[Balls_number[i]]-1;
        }
      }
    }
  }
}

public void Check_Pos3(int i){
  if      (xS[Balls_number[i]] < rad[Balls_number[i]])            {xS[Balls_number[i]]=rad[Balls_number[i]]+1; xS_Dir[i]=-xS_Dir[i];}
  if      (zS[Balls_number[i]] < rad[Balls_number[i]])            {zS[Balls_number[i]]=rad[Balls_number[i]]+1; zS_Dir[i]=-zS_Dir[i];}
  if      (xS[Balls_number[i]] > TeK_Pos_W-rad[Balls_number[i]])  {xS[Balls_number[i]]=TeK_Pos_W-rad[Balls_number[i]]-1; xS_Dir[i]=-xS_Dir[i];}
  if      (zS[Balls_number[i]] > TeK_Pos_L-rad[Balls_number[i]])  {zS[Balls_number[i]]=TeK_Pos_L-rad[Balls_number[i]]-1; zS_Dir[i]=-zS_Dir[i];}
}

public void Give_Force2(int i, int b){
  Distance_For_Move_Balls[i]=Distance_For_Move_Balls[i]/2;
  Distance_For_Move_Balls[b]=Distance_For_Move_Balls[i];
  xS_Dir[b]=xS_Dir[i];
  zS_Dir[b]=zS_Dir[i];
  xS_Dir[i]=-xS_Dir[i];
  zS_Dir[i]=-zS_Dir[i];
}