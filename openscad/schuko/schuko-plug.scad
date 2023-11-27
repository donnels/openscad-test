// Shuko plug
$fn = 100;
height = 19; //total height to top rim
plugTopD = 42; //diameter of top cover
plugTopH = 2; //2mm rim height of top cover
plugTopOff = 16.8 ; //from bottom to top rim
diffWiggle = .2;
plugBottomD = 38;
plugBottomH = plugTopOff;
plugSideCutH = 3;
plugSideCutW = 5;
zdiff = [0,0,-diffWiggle/2];
cutCube = 8;
cubeXY = plugBottomD-(plugSideCutH+9);
cubeFloor = 2;
pinR = 9.5 ; //The distance from the center that the pins should be at

//ssd1306 variables
ssd1306X = 26.9 ;
ssd1306Y = 27.9 ;
ssd1306PCBZ = 1.7 ;
ssd1306mountD = 2 ;
LCDX = 27.5 ; // left to right
LCDY = 20 ; // topR to bottomR
LCDZ = 2 ; // height from PCB
LCDflexW = 13 ; //flex cable width
LCDflexH = 3 ; //flex cable length from LCD to edge
LCDdim = [LCDX,LCDY,LCDZ]; //Dimensions

module ssd1306Holes(height,diameter) {
    //mounting holes - no need to zdiff as centered
    //relative positions
        mPosTR = [ssd1306X/2-2,ssd1306Y/2-2,0];
        mPosTL = [-ssd1306X/2+2,ssd1306Y/2-2,0];
        mPosBR = [ssd1306X/2-2,-ssd1306Y/2+2,0];
        mPosBL = [-ssd1306X/2+2,-ssd1306Y/2+2,0];
    //absolute positions plus offset on PCB - UNUSED
        topDiff = 22.8 ; // TL to TR hole center - top diff=bottomDiff
        sideDiff = 23.5 ; // TR to BR hole center - LeftDiff=rightDiff
        leftOff = .8 ; //left hole is .8mm in
        topOff = 1 ; // top hole is 1mm down
    translate (mPosTR) cylinder(h=height,d=diameter,center=true);
    translate (mPosTL) cylinder(h=height,d=diameter,center=true);
    translate (mPosBR) cylinder(h=height,d=diameter,center=true);
    translate (mPosBL) cylinder(h=height,d=diameter,center=true);
}

module ssd1306(shrink) {
    difference() {
        //ssd1306 PCB
        cube([ssd1306X-shrink,ssd1306Y-shrink,ssd1306PCBZ],center=true);
        //holes only needed for initial tests to see if alligned
        *ssd1306Holes(ssd1306PCBZ+diffWiggle,ssd1306mountD);
    }
}

//ssd1306 mounting harness
module ssd1306Harness(shrink) {
    difference() {
        ssd1306(shrink);
        cube([22,22,ssd1306PCBZ+diffWiggle],center=true);
        translate([0,12,0]) cube([15,3,ssd1306PCBZ+diffWiggle],center=true);
        translate([0,0,0]) cube([25,6,ssd1306PCBZ+diffWiggle],center=true);
    }
    //add mounting pegs
    translate([0,0,2.5]) ssd1306Holes(5,1.7);
}

//plug inset

difference () {
    union() {
        difference() {
            cylinder(h=plugBottomH,d=plugBottomD);
                cutOffTR=[(plugBottomD/2)-plugSideCutH,plugSideCutW/2,0];
                cutOffTL=[-((plugBottomD/2)+plugSideCutH)+plugSideCutH,plugSideCutW/2,0];
                cutOffBR=[(plugBottomD/2)-plugSideCutH,-(plugSideCutW/2)-cutCube,0];
                cutOffBL=[-((plugBottomD/2)+plugSideCutH)+plugSideCutH,-plugSideCutW/2-cutCube,0];
                cutCube=[plugSideCutH,cutCube,plugBottomH+diffWiggle];
            translate(cutOffTR+zdiff)cube(cutCube);
            translate(cutOffTL+zdiff)cube(cutCube);
            translate(cutOffBR+zdiff)cube(cutCube);
            translate(cutOffBL+zdiff)cube(cutCube);
        }
        translate([0,0,plugTopOff]) cylinder(h=plugTopH, d=plugTopD);
    }
    //cube cutout
    translate([0,0,height/2+cubeFloor])cube([cubeXY,cubeXY,height],center=true);
    //plug holes for cabling where pins should be
    translate([pinR,0,0])translate(zdiff) cylinder(h=cubeFloor+diffWiggle,d=6);
    translate([-pinR,0,0])translate(zdiff) cylinder(h=cubeFloor+diffWiggle,d=6);
    translate([0,0,plugTopOff+1]) ssd1306(-1);
    translate([0,0,plugTopOff+2]) ssd1306(-1);
}

*translate([0,0,plugTopOff-.7]) ssd1306Harness(1);

//cover
translate([0,0,20]) difference() {
    //top cover
    cylinder(h=.5,d=plugTopD,center=true);
    //LCD assumed to be dead center
    cube(LCDdim,center=true);
    //flex cable
    translate([0,-LCDY/2-LCDflexH/2+diffWiggle,0])
        cube([LCDflexW ,LCDflexH+diffWiggle,4],center=true);
    //add mounting holes
    ssd1306Holes(5,ssd1306mountD+.3);
}
