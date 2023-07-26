final int FRAME_RATE = 60;
final float SPEED = PI/1000;
final String IMAGE_PATH = "./image/myimage.jpg";
final String CIRCLE_TEXT_IMAGE_PATH = "./data/CircleText.png";
final String FONT_PATH = "./data/Sarabun-ExtraBoldItalic-48.vlw";

PImage backgroundImage;
PImage circleText;
PFont font;
float angle = 0;
int colorIndex = 0;

void setup() {
    size(400, 400);
    backgroundImage = loadImage(IMAGE_PATH);
    circleText = loadImage(CIRCLE_TEXT_IMAGE_PATH);
    font = loadFont(FONT_PATH);
    textFont(font);
    frameRate(FRAME_RATE);
}

void draw() {
    imageMode(CORNER);
    image(backgroundImage, 0, 0, width, height);

    drawWhiteBackground();

    drawCircle();

    drawText();

    translate(width/2, height/2); // 中心を軸に回転するため
    rotate(angle);
    imageMode(CENTER);
    int offset = 20;
    image(circleText, 0, 0, width+offset, height+offset);

    float nextAngle = SPEED * (60/FRAME_RATE);
    angle = (angle + nextAngle) % TWO_PI;
}

void drawWhiteBackground() {
    stroke(255, 255, 255);
    strokeWeight(100);
    fill(0, 0, 0, 0);
    int offset = 70;
    ellipse(width/2, height/2, width+offset, height+offset);
}

void drawCircle() {
    stroke(70, 130, 180);
    strokeWeight(18.5);
    fill(0, 0, 0, 0); // 透明
    ellipse(width/2, height/2, 380, 380);
}

void drawText() {
    stroke(255, 255, 255);
    strokeWeight(10);
    fill(getRainbow(frameCount/9));
    text("Get Off", 115, 270);
    text("The Internet", 60, 320);
}

color getRainbow(int index) {
    int _index = abs(index) % 7;
    color result;
    switch (_index) {
        default:
        case 0:
            result = color(255, 0, 0);
            break;
        case 1:
            result = color(255, 150, 0);
            break;
        case 2:
            result = color(255, 240, 0);
            break;
        case 3:
            result = color(0, 135, 0);
            break;
        case 4:
            result = color(0, 145, 255);
            break;
        case 5:
            result = color(0, 100, 190);
            break;
        case 6:
            result = color(145, 0, 130);
            break;
    }

    return result;
}