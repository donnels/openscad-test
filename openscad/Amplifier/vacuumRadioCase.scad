$fn=100;
baseH = 32;
baseW = 165 ;
baseD = 116.5 ;

innerH = 44 ;
innerW = 155 ;
innerD = 104 ;

ringW = 7.3 ;
ringH = 3 ;

xOff = (baseW - innerW) /2 ;
yOff = (baseD - innerD) /2 ;
zOff = 6 ;

module lid(){
    translate([0,0,ringH]) difference(){
        cube([baseW,baseD,baseH]);
        translate([xOff,yOff,zOff]) cube([innerW,innerD,innerH]);
    }
    translate ([ringW,ringW,0]) cube([baseW-2*(ringW),baseD-2*(ringW),ringH]);
}


module pot(text) {
    x=11;y=10;z=5;
    cylD=6.5;cylH=17;
    zWiggle=.1;
    translate([0,0,z/2-zWiggle]) cube([x,y,z+zWiggle],center=true);
    translate([0,0,z]) {
        translate([0,0,-zWiggle]) cylinder(h=cylH+zWiggle,d=cylD);
        translate([0,0,5]) cylinder(h=1,d=9);
    }
}

module speaker() {
    zWiggle = .1 ;
    outerD  = 36.5  ; innerD1 = 32.5 ; innerD2 = 35 ;
    outerH  = 3     ; innerH = 12 ;
    connectorD = 35.5 ;
    translate([0,0,9]) cylinder(h=outerH,d=outerD);
    cylinder(h=innerH + zWiggle, d1=innerD1, d2=innerD2);
    intersection() {
        color([1,1,1]) cylinder(h=innerH,d=connectorD);
        translate([0,-outerD/4,0]) cube([outerD,outerD/2,innerH]);
    }
}

module headJack(text) {
    upperD = 6 ; upperH = 4.8 ;
    lowerD = 8 ; lowerH = 11 ;
    nutH   = 2 ; nutD   = 8 ;
    translate([0,0,lowerH + upperH - nutH]) cylinder(h=nutH , d=nutD);
    cylinder(h=upperH + lowerH, d=upperD);
    cylinder(h=lowerH, d=lowerD);
}

//tests
difference() {
    zWiggle = .1 ;
    translate ([-20,-60,0]) cube([40,60,zOff+ringH]);
    translate([0,0,-zWiggle]) union(){
        translate ([-10,-10,0]) pot("test");
        translate ([0,-40,0]) speaker();
        translate ([2,-10,-4.5]) headJack("test");
    }
}

//normal print
*difference() {
    zWiggle=.1;
    lid();
    //pot 1
    translate([20,baseD/2,0]) pot("pot 1");
    //pot 2
    translate([50,baseD/2,0]) pot("pot 2");
    //speaker
    translate([100,baseD/2,-zWiggle -2]) speaker();
 
}