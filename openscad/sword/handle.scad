$fn=100;
eps = 0.01;
handleR = 10;
handleTR = 45;
handleL = 250;
//90 degree turn
//rotate_extrude(angle=90, convexity=10) translate([20, 0]) circle(handleD);
//straight
//translate([20, eps, 0]) rotate([90, 0, 0]) cylinder(r=handleD, h=80+eps);
   

//handle bend
module handleBend(turnR,handleR){
    bound=turnR+handleR+1;
    difference() {
        intersection() {
            translate([0,0,0])rotate_extrude()translate([turnR,0,0])circle(r=handleR);
            translate([0,0,-handleR])cube ([bound,bound,handleR*2]);
        }
        //two holes for mounting
        translate([-eps,handleTR,0]) rotate([0,90,0]) cylinder(h=10,d=10);
        translate([handleTR,10-eps,0]) rotate([90,0,0]) cylinder(h=10,d=10);
    }
}
//handle part
module handleTube(cylH) {
    difference(){
        
        cylinder(h=cylH,r=handleR);
        translate([0,0,-eps]) cylinder(h=10,d=10);
        translate([0,0,cylH-10+eps]) cylinder(h=10,d=10); 
    }
}

//
// output
//

//two bends
handleBend(handleTR,handleR);
translate ([-10,0,0]) rotate([0,0,90]) handleBend(handleTR,handleR);

//long handle tube
handleTube(handleL-(2*handleTR+handleR));

//mounting pegs
pegD=9.5;
pegH=18;
translate([20,0,0]) cylinder(h=pegH,d=pegD);
translate([-20,0,0]) cylinder(h=pegH,d=pegD);
translate([20,12,0]) cylinder(h=pegH,d=pegD);
translate([-20,12,0]) cylinder(h=pegH,d=pegD);
