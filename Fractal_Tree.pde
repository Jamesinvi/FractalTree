 //<>//
ArrayList<Segment> segments;
float angle = 15;
int leavesStep = 0;
int framesSaved=0;
void setup() {
  size(800, 600);
  segments = new ArrayList<Segment>(1);
  segments.add(new Segment(0, 0, 80, -PI/2));
  colorMode(HSB);
}
void mousePressed() {
  ArrayList<Segment> newSegments = new ArrayList<Segment>(segments.size()*2);
  int cutoff = (int)pow(2, leavesStep)-1;
  for (int i = 0; i < segments.size(); i++) {
    Segment segment = segments.get(i);
    newSegments.add(segment);
  }
  for (int i = cutoff; i < segments.size(); i++) {
    Segment segment = segments.get(i);
    newSegments.add(new Segment(segment.end, segment.len * 0.85f, segment.angle + radians(-angle)));
    newSegments.add(new Segment(segment.end, segment.len * 0.85f, segment.angle + radians(angle)));
  }
  leavesStep++;
  segments = newSegments;
}

void draw() {
  background(30);
  float hue=0f;
  float factor = 255.0f/(leavesStep);
  float maxWeight  = 1;
  float minWeight  = 0.01;
  float weightStep = (maxWeight - minWeight) / (max(1, leavesStep + 1));
  translate(width / 2, height);
  int power = 1;
  int powerOfTwo = 1;
  float alpha = 255;
  float weight = 2f;
  for (int i = 0; i < segments.size(); i++) {
    if (i>=powerOfTwo) {
      power++;
      powerOfTwo = (int)pow(2, power)-1;
      hue+=factor;
      alpha -= factor;
      weight -= weightStep;
    }
    strokeWeight(weight);
    stroke(hue, 255, 255, alpha+10);
    segments.get(i).Draw();
  }
}
void keyPressed() {
  if (keyCode==ENTER) {
    saveFrame("frame-###.jpeg");
  }
}
