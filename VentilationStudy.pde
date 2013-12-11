import controlP5.*;

ControlP5 cp;
float controlX, controlY;
Textlabel minRangeLabel, maxRangeLabel;
PVector minSlider, maxSlider;

void setup() {
  size(displayWidth, displayHeight - 150);
  background(240);

  createControls();
}

void draw() {
  updateWeightSlider();
}

void createControls() {
  // FIXME: ranges should be created dynamically from data
  float minRange = 2;
  float maxRange = 83.7;

  controlX = 40;
  controlY = 40;
  cp = new ControlP5(this);

  PFont mainFont = createFont("Serif-24", 24);
  PFont attrFont = createFont("Avenir-HeavyOblique-16", 16);

  textFont(mainFont);
  fill(150);
  text("Oxygenation:", controlX, controlY);
  text("Ventilation:", controlX, controlY+100);
  text("Filters:", controlX, controlY+ 200 );

  textFont(attrFont);
  //textSize(16);
  text("PEEP", controlX + 50, controlY +30);
  text("FiO2", controlX + 50, controlY +60);
  text("PIP", controlX + 50, controlY + 130);
  text("pH", controlX +50, controlY +160);
  text("Vent Mode:", controlX, controlY +230);
  text("Pressure Control", controlX + 50, controlY +250);
  text("Volume Control", controlX + 50, controlY +280);
  text("PRVC", controlX +  50, controlY + 310);
  text("HFOV", controlX +  50, controlY + 340);
  text("Site: ", controlX, controlY +380);
  text("A", controlX + 50, controlY + 410);
  text("B", controlX + 110, controlY + 410);
  text("C", controlX + 50, controlY + 440);
  text("D", controlX + 110, controlY + 440);
  text("E", controlX + 50, controlY + 470);
  text("F", controlX + 110, controlY + 470);
  text("G", controlX + 50, controlY + 500);
  text("H", controlX + 110, controlY + 500);
  text("Weight Range:", controlX, controlY +525);
  stroke(150);
  textFont(attrFont);
  text("2", controlX +20, controlY + 580);
  text("83.7", controlX + 190, controlY +580);

  minSlider = new PVector(controlX +20, controlY +550);
  maxSlider = new PVector(controlX +210, controlY +550);
  minRangeLabel =  cp.addTextlabel("minRange")
    .setText(""+minRange)
    .setColorValue(150)
    .setPosition(minSlider.x, minSlider.y-15);

  maxRangeLabel = cp.addTextlabel("maxRange")
    .setText(""+maxRange)
    .setColorValue(150)
    .setPosition(maxSlider.x, maxSlider.y - 15);

  setUPButtons();
  setUpToggles();

}

public void PEEP() {
}

public void PIP() {
}

public void pH() {
}

public void FiO2() {
}

public void setUPButtons() {
  cp.addButton("PEEP")
    .setPosition(controlX +20, controlY +12)
    .setSize(20,20)
    .setColorForeground(color(180, 180, 180))
    .setColorBackground(color(180, 180, 180))
    .getCaptionLabel()
    .hide();

  cp.addButton("FiO2")
    .setPosition(controlX +20, controlY +45)
    .setSize(20,20)
    .setColorForeground(color(180, 180, 180))
    .setColorBackground(color(180, 180, 180))
    .getCaptionLabel()
    .hide();

  cp.addButton("PIP")
    .setPosition(controlX +20, controlY +112)
    .setSize(20,20)
    .setColorForeground(color(180, 180, 180))
    .setColorBackground(color(180, 180, 180))
    .getCaptionLabel()
    .hide();

  cp.addButton("pH")
    .setPosition(controlX +20, controlY +145)
    .setSize(20,20)
    .setColorForeground(color(180, 180, 180))
    .setColorBackground(color(180, 180, 180))
    .getCaptionLabel()
    .hide();
}

public void setUpToggles(){
  int y1= 430;
  String[] filterToggles1 = {"a", "c", "e", "g"};
  String[] filterToggles2 = {"b", "d", "f", "h"};
  String[] filterToggles3 = {"pc", "vc", "prvc", "hfov"};

  for( int i = 0; i < 4; ++i ) {
    cp.addToggle(filterToggles1[i])
      .setPosition( controlX +20, y1+ 30 * i )
      .setSize( 20, 20 )
      .setColorForeground(color(180, 180, 180))
      .setColorBackground(color(180, 180, 180))
      .setValue( false )
      .plugTo( this, filterToggles1[i]+"ON" )
      .getCaptionLabel()
      .hide();
  }

  int x1 = 120;
  y1=430;
  for( int i = 0; i < 4; ++i ) {
    cp.addToggle(filterToggles2[i])
      .setPosition( x1, y1+ 30 * i )
      .setSize( 20, 20 )
      .setColorForeground(color(180, 180, 180))
      .setColorBackground(color(180, 180, 180))
      .setValue( false )
      .plugTo( this, filterToggles2[i]+"ON" )
      .getCaptionLabel()
      .hide();
  }

  y1=275;
  for( int i = 0; i < 4; ++i ) {
    cp.addToggle(filterToggles3[i])
      .setPosition( controlX + 20, y1+ 30 * i )
      .setSize( 20, 20 )
      .setColorForeground(color(180, 180, 180))
      .setColorBackground(color(180, 180, 180))
      .setValue( false )
      .plugTo( this, filterToggles3[i]+"ON" )
      .getCaptionLabel()
      .hide();
  }
}

void updateWeightSlider()
{
  //background(240);
  noStroke();
  fill(240);
  rect(controlX - 20, controlY +530, 260, 30);
  stroke(150);
  strokeWeight(2);
  line(controlX+20, controlY+550, controlX+210, controlY+550);

  fill(150);
  ellipse(minSlider.x, minSlider.y, 10,10);
  ellipse(maxSlider.x, maxSlider.y, 10,10);
  minRangeLabel.draw(this);
  minRangeLabel.setPosition(minSlider.x, minSlider.y-15);
  maxRangeLabel.draw(this);
  maxRangeLabel.setPosition(maxSlider.x, maxSlider.y -15);

  noStroke();
  noFill();
}

public void mouseDragged()
{
  // FIXME: ranges should be created dynamically from data
  float minRange = 2;
  float maxRange = 83.7;

  float radius = 20;
  float minX = 60;
  float maxX = 250;
  float diff = (83.7 - 2);
  float percent = 0;
  //if (pmouseX > point.x - radius && pmouseX < point.x + radius && pmouseY < point.y + radius && pmouseY > point.y - radius)
  if (pmouseX > (minSlider.x - radius) && pmouseX < (minSlider.x + radius) && pmouseY < (minSlider.y + radius) && pmouseY > (minSlider.y - radius)) {
    if((pmouseX + radius) >= maxSlider.x) {
      minSlider.set(minSlider.x , minSlider.y);
      percent = ((pmouseX - minX)/ (maxX - minX));
      minRange = (2+(percent* diff));
      minRangeLabel.setText(""+String.format("%.2f", minRange));
      return;
    }

    if (pmouseX <= minX) {
      minSlider.set(minX, minSlider.y);
      percent = ((pmouseX - minX)/ (maxX - minX));
      minRange = (2+(percent* diff));

      minRangeLabel.setText(""+String.format("%.2f", minRange));
      return;
    }

    if (pmouseX >= (maxX - 2*radius)) {
      minSlider.set((maxX - radius), minSlider.y);
      percent = ((pmouseX - minX)/ (maxX - minX));
      minRange = (2+(percent* diff));
      minRangeLabel.setText(""+String.format("%.2f", minRange));
      return;
    } else {
      minSlider.set(pmouseX, minSlider.y);
      percent = ((pmouseX - minX)/ (maxX - minX));
      minRange = (2+(percent* diff));
      minRangeLabel.setText(""+String.format("%.2f", minRange));
    }
  }

  if (pmouseX > (maxSlider.x - radius) && pmouseX < (maxSlider.x + radius) && pmouseY < (maxSlider.y + radius) && pmouseY > (maxSlider.y - radius)) {
    if((pmouseX - radius) <= minSlider.x) {
      maxSlider.set(maxSlider.x, maxSlider.y);
      percent = ((pmouseX - minX)/ (maxX - minX));
      maxRange = (2 + (percent * diff));
      maxRangeLabel.setText(""+String.format("%.2f", maxRange));
      return;
    }

    if (pmouseX <= (minX + radius)) {
      maxSlider.set((minX+ radius), maxSlider.y);
      percent = ((pmouseX - minX)/ (maxX - minX));
      maxRange = (2 + (percent * diff));
      maxRangeLabel.setText(""+String.format("%.2f", maxRange));
      return;
    }

    if (pmouseX >= (maxX /*- radius*/)) {
      maxSlider.set(maxX, maxSlider.y);
      percent = ((pmouseX - minX)/ (maxX - minX));
      maxRange = (2 + (percent * diff));
      maxRangeLabel.setText(""+String.format("%.2f", maxRange));
      return;
    } else {
      maxSlider.set(pmouseX, maxSlider.y);
      percent = ((pmouseX - minX)/ (maxX - minX));
      maxRange = (2 + (percent * diff));
      maxRangeLabel.setText(""+String.format("%.2f", maxRange));
    }
  }
}