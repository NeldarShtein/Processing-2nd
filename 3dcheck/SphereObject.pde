class SphereObject {

  PVector position = new PVector();
  float radius;

  SphereObject(float rad) {
    radius = rad;
  }

  void moveMe(float dx, float dy, float dz) {

    position.x += dx;
    position.y += dy;
    position.z += dz;
  }

  void drawMe() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    sphere( radius );
    popMatrix();
  }
}