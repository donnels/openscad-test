//in a corner there is a blasted power cable that needs a cover
$fn=100;
coverR = 80 ;
cableD = 10 ;
//the shell to fit in the corner
difference(){
difference() {
    intersection() {
        cube([coverR,coverR,coverR]);
        sphere(r=coverR);
    }
    translate([-1,-1,-1]) intersection() {
        cube([coverR,coverR,coverR]);
        sphere(r=coverR);
    }
}
translate([0,0,cableD/2]) rotate([-45,90,0])cylinder(h=coverR+1,d=cableD);
}

//the sides
intersection() {
    difference() {
        cube([coverR,coverR,coverR]);
        translate([1,1,1])cube([coverR-1,coverR-1,coverR-1]);
        sphere(r=20);
        }
        sphere(r=coverR);
        }


