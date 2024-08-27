
public void IntroCoord(){
  for (int i = 0; i < amountS; i++) {
      col = random(0, 244);
      radS = random(40, 100);
      xS[i] = random(5, width-5);
      yS[i] = random(5, height-5);
    }
}

public void DarkT () {
  stroke(WhiteInt);
  strokeWeight(1);
  fill(BlackInt);
  background(WhiteInt);
}

public void Stage0 () {
  if (ChCol==0) {ChCol0 ();}
  else if (ChCol==1) {ChCol1 ();}
  else if (ChCol==2) {ChCol2 ();}
  else if (ChCol==3) {ChCol3 ();}
}

public void ChCol0 () {
  if (++col>255) col=0;
  if (col2>0) col2--;
  if (col2==0) ChCol = 1;
  background(col2);
  noStroke();
  fill(col, 255, 255);
  circle(width/2, height/2, cerS);
}

public void ChCol1 () {
  if (++col>255) col=0;
  background(col2);
  noStroke();
  fill(col, 255, 255);
  circle(width/2, height/2, cerS);
  if (--cerS==6) ChCol=2;
}

public void ChCol2 () {
  if (amountS0<=amountS) {
    strokeWeight(3);
    for (int i = 0; i < amountS0; i++){
      stroke(255);
      if (dist(width/2, height/2, xS[i], yS[i]) < radS) {line(width/2, height/2, xS[i], yS[i]);}
      for  (int j = 0; j < i; j++){if (dist(xS[i], yS[i], xS[j], yS[j]) < radS) {line(xS[i], yS[i], xS[j], yS[j]);}}
    }
    for (int i = 0; i <= amountS0; i++){noStroke(); circle(xS[i], yS[i], cerS);}
    amountS0++;
  }
  circle(width/2, height/2, cerS);
  if (amountS0==amountS) {ChCol=3;}
}

public void ChCol3 () {
  fill(255, 255, 255);
  stroke(255);
  textSize(60);
  text("PRESS", width/2-120, height/2-60);
  if (mousePressed == true) {
    col2=0;
    background(255);    
    noStroke();
    StZ=1; DarkT ();}
}
