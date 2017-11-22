
PImage img;
PImage sorted;
int index = 0;

void setup() {
  size(800, 400);

  img = loadImage("sunflower.jpg");
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
}

void draw() {
  println(frameRate);

  sorted.loadPixels();

  // Selection sort!
  for (int n = 0; n < 50; n++) {
    int j = index;
    while (j > 0 && hue(sorted.pixels[j]) < hue(sorted.pixels[j-1])){
      color temp = sorted.pixels[j];
      sorted.pixels[j] = sorted.pixels[j-1];
      sorted.pixels[j-1] = temp;
      j = j -1;
    }
    if (index < sorted.pixels.length -1) {
      index++;
    }
  }


  sorted.updatePixels();

  background(0);
  image(img, 0, 0);
  image(sorted, 400, 0);
}
