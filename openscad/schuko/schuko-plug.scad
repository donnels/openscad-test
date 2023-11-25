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
}


//handle to extract test
//REMOVE after testing
cylinder(h=25,d=4);