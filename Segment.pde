
class Segment {
  PVector start;
  PVector end;
  float len;
  float angle;
  public Segment(float xStart, float yStart, float len, float angle){
    this.start = new PVector(xStart, yStart);
    this.len = len;
    this.end = PVector.fromAngle(angle).mult(len);
    this.end.add(this.start);
    this.angle = angle;
  }
  public Segment(PVector start, float len, float angle){
    this.start = new PVector(start.x, start.y);
    this.len = len;
    this.end = PVector.fromAngle(angle).mult(len);
    this.end.add(this.start);
    this.angle = angle;
  }
  
  public void Draw(){
    line(start.x,start.y,end.x,end.y);
  }
}
