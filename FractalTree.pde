private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(1000,1000);
	frameRate(60);
	colorMode(HSB);
} 
double time = 0;
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	//line(320,480,320,380);
	if (c >= 255)  c=0;  else  c+= 0.1;
	stroke(c, 255, 255);
	noFill();
	ellipse(500, 500, 200, 200);
	drawBranches(500,500,100,time/12, time/12, c);  //will add later 
	if(time > 120*12*PI){
		time = 0;
	}
	time += 0.1;
} 
float c = 0;
float colorchange = 5;
public void drawBranches(double x,double y, double branchLength, double minutes, double originalAngle, float mycolor) 
{   
	//your code here    
	if(branchLength > 1){
		if (mycolor >= 255)  mycolor=0;  else  mycolor += colorchange;
			stroke(mycolor, 255, 255);
		line((float) x, (float) y, (float) (x + Math.cos(minutes/60) * branchLength), (float) (y + Math.sin(minutes/60) * branchLength));
		line((float) x, (float) y, (float) (x + Math.cos(minutes) * branchLength), (float) (y + Math.sin(minutes) * branchLength));
		//ellipse((float) x, (float) y, (float) branchLength * 2, (float) branchLength * 2);
		drawBranches(x + Math.cos(minutes) * branchLength, y + Math.sin(minutes) * branchLength, branchLength/1.5, minutes + originalAngle/60, originalAngle, colorchange + mycolor );
		drawBranches(x + Math.cos(minutes/60) * branchLength, y + Math.sin(minutes/60) * branchLength, branchLength/1.5, minutes + originalAngle, originalAngle, colorchange + mycolor);
		
	}
	//line((float) x, (float) y, (float) (y + Math.cos(minutes/60) * branchLength), (float) (y + Math.sin(minutes/60) * branchLength));
} 
