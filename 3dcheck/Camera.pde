public void CameraPos1(){
  camera(width/2, height/2, (height/2)/tan(PI/6), width/2, height/2, 0, 0, 1, 0);
}

public void CameraPos2(){
  camera(Cam_Pos_x, Cam_Pos_y, (height/2)/tan(PI/6)+Cam_Pos_z, Cen_Pos_x, Cen_Pos_y, Cen_Pos_z, 0, 1, 0);
}
