int[] snake = new int[2];
String direction = "right";

//ArrayList<int[]> s = new ArrayList<int[]>();
void setup(){
 size(600,600);
 frameRate(10);
 initgame();
}

void draw(){
  background(180);
  drawGrid();
  drawSnake();
  moveSnake();
  if(gameOver()){
    frameRate(0);
    textSize(20);
    textAlign(CENTER);
    text("Game Over", width/2,height/2);
  }
}

void keyPressed(){
  if(key=='w')
    direction="up";
  else if(key=='a')
    direction="left";
  else if(key=='d')
    direction="right";
  else if(key=='s')
    direction="down";
}

void initgame(){
  snake[0]= width/2;
  snake[1]= height/2;
}

void drawGrid(){
  for(int i = 0; i<width;i+=20)
    line(i,0,i,height);
  for(int i = 0; i<height;i+=20)
    line(0,i,width,i);
}

void moveSnake(){
  if(direction =="up")
    snake[1]-=20;
  else if(direction=="down")
    snake[1]+=20;
  else if(direction=="left")
    snake[0]-=20;
  else if(direction=="right")
    snake[0]+=20;
}

void drawSnake(){
  fill(random(0,256),random(0,256),random(0,256));
  rect(snake[0],snake[1],20,20); 
  fill(0,0,0);
}

boolean gameOver(){
  boolean result = false;
  if(snake[0]<0 ||snake[0]>width-10||snake[1]<0||snake[1]>height-10){
    result = true;
  }
  return result;
}
