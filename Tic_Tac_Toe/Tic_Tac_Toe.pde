int[][] map = new int[3][3];
int randomvalue = 0;

int won = -1;
int hwon = -1;

void setup(){
  size(600,600);
  
  for(int i = 0; i<3; i++){
    for(int j = 0; j<3; j++){
      map[i][j] = -1;
    }
  }
  
}

void draw(){
  
  if(randomvalue < 3){
    background(255);
  }
  
  
  
  strokeWeight(10);
  noFill();
  ellipseMode(CENTER);
  
  line(0,200,600,200);
  line(0,400,600,400);
  
  line(200,0,200,600);
  line(400,0,400,600);
  
  
  
  for(int i = 0; i<3; i++){
    for(int j = 0; j<3; j++){
      if(map[i][j] == 0){
        line(i*200+25,j*200+25,i*200+200-25,j*200+200-25);
        line(i*200+200-25,j*200+25,i*200+25,j*200+200-25);
      }
      if(randomvalue<3){
        if(map[i][j] == 1){
          ellipse(i*200+100,j*200+100,150,150);
        }
      }
    }
  }
  
  
  if(won > -1){
    
    if(won == 0){
      stroke(0,255,0);
    } else {
      stroke(255,0,0);
    }
    strokeWeight(30);
    switch(hwon){
      case 0:
        line(50,50,600-50,600-50);
        break;
      case 1:
        line(600-50,50,50,600-50);
        break;
      case 2:
        line(50,100,600-50,100);
        break;
      case 3:
        line(50,300,600-50,300);
        break;
      case 4:
        line(50,500,600-50,500);
        break;
      case 5:
        line(100,50,100,600-50);
        break;
      case 6:
        line(300,50,300,600-50);
        break;
      case 7:
        line(500,50,500,600-50);
        break;
    }
    strokeWeight(10);
  }
  stroke(0);
  
  
  
  strokeWeight(1);

  randomvalue = 0;//floor(random(100));
  
}

void mousePressed(){
  if(map[floor(mouseX/200)][floor(mouseY/200)] == -1){
    map[floor(mouseX/200)][floor(mouseY/200)] = 0;
    
    randomO();
    
    checkWin();
  }
}

boolean randomO(){
  int tempplacex = -1;
  int tempplacey = -1;
  for(int i = 0; i < 1000; i++){
    int tempx = floor(random(3));
    int tempy = floor(random(3));
    if(map[tempx][tempy]==-1){
      if(tempplacex == -1 || tempplacey == -1){
        tempplacex = tempx;
        tempplacey = tempy;
      }
    }
  }
  
  if(tempplacex == -1 || tempplacey == -1){
    //end game - draw
  } else {
    map[tempplacex][tempplacey] = 1;
  }
  
  return true;
  
}

boolean checkWin(){
  won = -1;
  hwon = -1;
  if(map[0][0] == map[1][1] && map[0][0] == map[2][2]){won = map[0][0]; hwon = 0;}
  if(map[2][0] == map[1][1] && map[2][0] == map[0][2]){won = map[2][0]; hwon = 1;}
  
  if(map[0][0] == map[1][0] && map[0][0] == map[2][0]){won = map[0][0]; hwon = 2;}
  if(map[0][1] == map[1][1] && map[0][1] == map[2][1]){won = map[0][1]; hwon = 3;}
  if(map[0][2] == map[1][2] && map[0][2] == map[2][2]){won = map[0][2]; hwon = 4;}
  
  if(map[0][0] == map[0][1] && map[0][0] == map[0][2]){won = map[0][0]; hwon = 5;}
  if(map[1][0] == map[1][1] && map[1][0] == map[1][2]){won = map[1][0]; hwon = 6;}
  if(map[2][0] == map[2][1] && map[2][0] == map[2][2]){won = map[2][0]; hwon = 7;}
  
  return true;
  
}
