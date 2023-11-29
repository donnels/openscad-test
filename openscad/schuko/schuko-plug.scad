// Shuko plug
$fn = 100;
height = 19; //total height to top rim
plugTopD = 42; //diameter of top cover
plugTopH = 2; //2mm rim height of top cover
plugTopOff = 16.8 ; //from bottom to top rim
diffWiggle = .2;
diffWiggleX = [diffWiggle, 0, 0];
diffWiggleY = [0, diffWiggle, 0];
diffWiggleZ = [0, 0, diffWiggle];
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
ssd1306XY = [ssd1306X,ssd1306Y,0] ;
ssd1306PCBH = 1.7 ;
ssd1306PCBZ = [0, 0, ssd1306PCBH] ;
ssd1306mountD = 2 ;
LCDX = 27.5 ; // left to right
LCDY = 20 ; // topR to bottomR
LCDZ = 2 ; // height from PCB
LCDflexW = 13 ; //flex cable width
LCDflexH = 3 ; //flex cable length from LCD to edge
LCDmask = 4; //how much to cover up at the bottom
LCDdim = [LCDX,LCDY,LCDZ]; //Dimensions
LCDdimXY = [LCDX, LCDY, 0]; //XY Dimensions only without Z

module ssd1306Holes(height,diameter) {
    //mounting holes - no need to zdiff as centered
    //relative positions
        TR= [[+1,0,0],[0,+1,0],[0,0,0]];
        TL= [[-1,0,0],[0,+1,0],[0,0,0]];
        BR= [[+1,0,0],[0,-1,0],[0,0,0]];
        BL= [[-1,0,0],[0,-1,0],[0,0,0]];
        mPosTR = TR * ssd1306XY/2 + [-2, -2, 0];
        mPosTL = TL * ssd1306XY/2 + [+2, -2, 0];
        mPosBR = BR * ssd1306XY/2 + [-2, +2, 0];
        mPosBL = BL * ssd1306XY/2 + [+2, +2, 0];
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
        cube([ssd1306X-shrink,ssd1306Y-shrink,0]+ ssd1306PCBZ,center=true);
        //holes only needed for initial tests to see if alligned
        *ssd1306Holes(ssd1306PCBH+diffWiggle,ssd1306mountD);
    }
}

//ssd1306 mounting harness
module ssd1306Harness(shrink) {
    difference() {
        ssd1306(shrink);
        cube([22,22,diffWiggle] + ssd1306PCBZ,center=true);
        translate([0,12,0]) cube([15,3,diffWiggle] + ssd1306PCBZ,center=true);
        translate([0,0,0]) cube([25,6,diffWiggle] + ssd1306PCBZ,center=true);
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

translate([0,0,plugTopOff-.7]) ssd1306Harness(1);

//cover
coverThick = .5 ;
rimH = 1.5 ;
vieportThick = .5 ;
rimThick = 1;
translate([0,0,30]) union() {
    translate([0,0,+coverThick/2]) difference() {
        //top cover
        cylinder(h=coverThick, d=plugTopD, center=true);
        //LCD assumed to be dead center
        cube(LCDdimXY +[0, 0, coverThick + diffWiggle], center=true);
        //flex cable
        translate([0, -LCDY /2 - LCDflexH /2 + diffWiggle, 0])
            cube([LCDflexW, LCDflexH+diffWiggle, coverThick + diffWiggle], center=true);
        //subtract mounting holes
        ssd1306Holes(coverThick + diffWiggle,ssd1306mountD+.3);
    }
}

module vectorBox(){
    //just a small demonstrator for vector subtraction and addition
    // as things can get complicated with single unit variables the below shows how it can be abstracted and simplified

    //inside side length
    inSize = 10 ;
    //wall thickness
    wallThick = .5;

    //the vectors predefined
    inSizeA = [inSize,inSize,inSize] ;
    inSizeX = [inSize,0,0] ;
    inSizeY = [0,inSize,0] ;
    inSizeZ = [0,0,inSize] ;
    offset = wallThick * 2 ;
    offsetA = [offset,offset,offset] ;
    offsetX = [offset,0,0] ;
    offsetY = [0,offset,0] ;
    offsetZ = [0,0,offset] ;
    offsetZY = offsetZ + offsetY ;
    offsetZX = offsetZ + offsetX ;
    offsetXY = offestX + offsetY ;
    
    difference() {
        //total volume cube
        cube(inSizeA + offsetA);
        //inside volume cube
        translate((offsetZX)/2 - diffWiggleY/2) 
            cube(inSizeA + offsetY + diffWiggleY);
    }

}
*vectorBox();
