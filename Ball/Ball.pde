Ball[] ball;  //set ball as object of Ball 
Block[] block; //set block as object of Block 
Ball[] delBall; 
int balloon_quantity = 5, block_quantity = 5;
double sumArea = 0;   //sumation of all area 
boolean deleteCheck; //boolean for check first clicked
int i=0; 
void setup(){
        background(255);
        size(800, 495);
        colorMode(HSB);
        delBall = new Ball[balloon_quantity];
        ball = new Ball[balloon_quantity];   //create ball
        block = new Block[block_quantity];   //create block 
        for(int i = 0; i < balloon_quantity; i++){
            ball[i] = new Ball();        //random each ball 
            sumArea += ball[i].getArea(); //Adition area with new circle 
        }
        for(int j = 0; j < block_quantity; j++){
            block[j] = new Block();        //random each block 
            sumArea += block[j].getArea(); //Adition area with new block
        }  
        println("Sumation of all area is : ",(sumArea)); //display Sumation of area
}


void draw(){
        background(255);
        for(Ball each_block : ball){ //for each in ball[] 
          each_block.draw();  //draw new block
        }
}

void mouseClicked(){
    if(i>0){
         for(int j = 0; j <= i-1; j++){  //check all ball 
           print(j);
          float d = dist(mouseX, mouseY, delBall[j].position_x, delBall[j].position_y); 
          print(d,delBall[j].size/2);
          //distance between mouse and center of each ball 
          if (d > (delBall[j].size / 2)){ //if distance  not over radius  means click in ball 
              println("back");
              sumArea -= delBall[j].getArea();
              
         
                  ball[ball.length-1] = new Ball(delBall[i].position_x,delBall[i].position_y,int(delBall[i].size));
                  println(delBall);
                  i--;
            
             
          }
         
        }
        }
       for(int j = ball.length - 1; j >= 0; j--){  //check all ball 
          float d = dist(mouseX, mouseY, ball[j].position_x, ball[j].position_y); 
          //distance between mouse and center of each ball 
          if (d < (ball[j].size / 2)){ //if distance  not over radius  means click in ball 
              println("New Sumtaion : ",ball[j].getArea(),"=",sumArea,"-",ball[j].getArea());
              sumArea -= ball[j].getArea();
              if (j < (ball.length - 1)){ //check if it's not last object 
                  arraycopy(ball, j+1, ball, j, ball.length-(j+1));  //move j object to  most right array 
                  ball =(Ball[]) shorten(ball);  //remove last object 
                  delBall[i] = new Ball(ball[j].position_x,ball[j].position_y,int(ball[j].size));
                  println(delBall);
                  i++;
              }
              else{  //if it's last object 
               ball =(Ball[]) shorten(ball);  //remove last object 
              }
             
          }
         
        }
        
}

class Ball{
  
  float position_x,  position_y, size, red, green, blue, Color; //set x y size and color as attribute
  boolean  status; 

  // Constructor if no input random it 
  Ball(){
    
    Color = random(0, 255);
    red = random(0, 255);  //random red color
    green = random(0, 255); //random green color 
    blue = random(0, 255);  //random blue color 
    this.position_x = random(0, width);  //random position  of ball 
    this.position_y = random(0, height);   
    this.size = random(50, 150);    //random size 
  }
   
  Ball(float pos_x, float pos_y){
    Color = random(0, 255);
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = random(50, 150);
  }
  
  Ball(float pos_x, float pos_y, int size_ball){
    int m = int(random(0,1.99)); 
     if (m==0){
       status = false;
     }
     else {
       status = true; 
     }
    Color = random(0, 255);
    red = random(0,255);
    green = random(0,255);
    blue = random(0,255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size_ball;
    
  }
  
  //Method draw ball each x,y,z size and color 
  void draw(){
    if (status){
      if(Color < 255){
        Color++;
      }
      else{
        Color = 0;
      }
    }
    fill(Color, 150, 255);
    ellipse(position_x, position_y, size, size);
  }
  
  float getArea() {
    float area = (size/2)*(size/2)*PI;  //calculate area of circle is pi*r^2
    return area;  //return area of circle 
  }
}

class Block{
  
  float position_x,  position_y, size, red, green, blue, Color; //set x y size and color as attribute
  Ball[] manyBall; 
  boolean status; 
  Block(){  //if no input random it 
     int m = int(random(0,1.99)); 
     if (m==0){
       status = false;
     }
     else {
       status = true; 
     }
    Color = random(0, 255);
    red = random(0, 255);  //random red color 
    green = random(0, 255); //random green color 
    blue = random(0, 255);  //random blue color 
    this.position_x = random(0, width);
    this.position_y = random(0, height);
    this.size = random(50, 200);
   
    int i = int(random(1,2));
     println(i);
    manyBall = new  Ball[i]; 
    for (int k =i-1 ; k>=0 ; k--){
      print("hello");
      manyBall[k] = new Ball(random(position_x,position_x+size), random(position_y, position_y+size) ,(int( random(size/2,size*2))));
      if ((manyBall[k].position_x-manyBall[k].size/2 < this.position_x) || (manyBall[k].position_x+manyBall[k].size/2 > this.position_x+this.size)) {
        k++;
      }
      else if ((manyBall[k].position_y-(manyBall[k].size)/2 < this.position_y) || (manyBall[k].position_y+(manyBall[k].size)/2 > this.position_y+this.size)) {
        k++;
      }
      
    }
    
     
  }
  
  Block(float pos_x, float pos_y, int size_block){
    Color = random(0, 255);
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size_block;
  }
  
  Block(float pos_x, float pos_y){
    Color = random(0, 255);
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = random(50, 150);
  }
  
  
  void draw(){ //draw block from x,y,size and set color 
   if(status){ if(Color < 255){
      Color++;
    }
    else{
      Color = 0;
    }
    }  
    fill(Color, 150, 255);
    rect(position_x, position_y, size, size);
    for (Ball eachBall : manyBall ) {
        eachBall.draw();
    }
    
  }
  
  float getArea() {
    float area = size*size; //calculate area of block is side*side
    return area;  //return area of block 
  } 
  
}
