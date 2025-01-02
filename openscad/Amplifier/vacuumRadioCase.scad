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

version = "V6" ;

module lid(){
    translate([0,0,ringH]) difference(){
        cube([baseW,baseD,baseH]);
        translate([xOff,yOff,zOff]) cube([innerW,innerD,innerH]);
    }
    translate ([ringW,ringW,0]) cube([baseW-2*(ringW),baseD-2*(ringW),ringH]);
}


module pot(text) {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,1] ;
    x = 11; y = 10; z = 10;
    cylD = 7 ; cylH = 19 ;
    ringOff = 6 ; ringH = 1; ringD=9 ;
    zWiggle = .1 ;
    totH = cylH + z; offZ = (ringOff + ringH) ;
    translate([0,0,-totH + cylH -offZ + ringH] + twiddle) {
        //body
        translate([0,0,z/2-zWiggle]) cube([x,y,z+zWiggle],center=true);
        //shaft
        translate([0,0,-zWiggle]) cylinder(h=z+cylH+zWiggle,d=cylD);
        //ring
        translate([0,0,z+ringOff]) cylinder(h=ringH,d=ringD);
    }
}
//pot("test");

//speaker
module speaker() {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,0] ;
    zWiggle = .1 ;
    outerD  = 36.5  ; innerD1 = 32.5 ; innerD2 = 35 ;
    outerH  = 3     ; innerH = 12 ;
    connectorD = 35.5 ;
    totH = outerH + innerH ;
    translate([0,0,-totH] + twiddle){
        translate([0,0,innerH]) cylinder(h=outerH,d=outerD);
        cylinder(h=innerH + zWiggle, d1=innerD1, d2=innerD2);
        intersection() {
            color([1,1,1]) cylinder(h=innerH,d=connectorD);
            translate([0,-outerD/4,0]) cube([outerD,outerD/2,innerH]);
        }
    }
}
//speaker() ;

//trimko
module trimko(text) {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,0] ;
    x = 23; y = 22; z = 16;
    cylD = 6.5 ; cylH = 14 ;
    ringH = .8 ; ringD = 8.5 ;
    zWiggle = .1 ;
    totH = cylH + z ;
    translate([0,0,-z -ringH -2] + twiddle) {
        //body
        translate([0,0,z/2-zWiggle]) cube([x,y,z+zWiggle],center=true);
        //shaft
        translate([0,0,-zWiggle]) cylinder(h=z+cylH+zWiggle,d=cylD);
        //ring
        translate([0,0,z]) cylinder(h=ringH,d=ringD);
    }
        
}
//trimko("test");

//text
module emboss(text,size) {
    font = "Abyssinica SIL" ;
    depth = 2 ;
    zWiggle = .1 ;
    translate([0,0,-depth])
        linear_extrude(depth + zWiggle) 
            text(text, font=font, size=size, halign = "center", valign= "center");
}
//emboss("Test123",5);

module headJack(text) {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,1] ;
    upperD = 6 ; upperH = 4.8 ;
    lowerD = 8.5 ; lowerH = 11 ;
    nutH   = 2 ; nutD   = 8 ;
    totH = upperH + lowerH ;
    translate([0,0,-totH +nutH] + twiddle) {
        translate([0,0,lowerH + upperH - nutH]) cylinder(h=nutH , d=nutD);
        cylinder(h=upperH + lowerH, d=upperD);
        cylinder(h=lowerH, d=lowerD);
    }
}
//headJack("test") ;

module toggleSwitch(text) {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,1] ;
    upperD = 6 ; upperH = 9 ;
    nutH   = 2 ; nutD   = 8 ;
    toggleH = 10 ; toggleD =1.5 ; toggleAngle = 10 ;
    toggleBody = [12,13,14] ; toggleBodyOff = [0,0,toggleBody.z/2] ;
    totH = toggleBody.z + upperH ;
    translate([0,0,-totH + nutH] + twiddle) {
        //Nut
        translate([0,0,toggleBody.z + upperH - nutH]) cylinder(h=nutH , d=nutD,$fn=6);
        //upper part
        cylinder(h=upperH + toggleBody.z, d=upperD);
        //toggle
        translate([0,0,toggleBody.z + upperH]) rotate([-toggleAngle,0,0]) cylinder(h=toggleH, d=toggleD);
        translate(toggleBodyOff) cube(toggleBody,center=true);
    }
}
//toggleSwitch("test");

//tube mount
module tubeMount(text) {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,0] ;
    zWiggle = .1 ;
    upperD = 18.5 ; upperH = 4 ;
    lowerD = 16.8 ; lowerH = 10 ;
    screwH = 5 ; screwD = 3 ; screwSpace = 22 ;
    totH = upperH + lowerH ;
    translate([0,0,-lowerH] + twiddle) {
        translate([0,0,lowerH]) cylinder(h=upperH, d=upperD);
        cylinder(h=lowerH + zWiggle, d=lowerD);
        translate([screwSpace/2,0,lowerH-screwH+zWiggle]) cylinder(h=screwH + zWiggle,d=screwD);
        translate([-screwSpace/2,0,lowerH-screwH+zWiggle]) cylinder(h=screwH + zWiggle,d=screwD);
    }
}
//tubeMount();
    
//tests
difference() {
    zWiggle = .1 ;
    rigX = 40 ; rigY = 105 ;
    translate ([-rigX/2,-rigY,-zOff-ringH]) cube([rigX,rigY,zOff+ringH]);
    //pot
    translate ([-10,-10,0]) pot("test");
    //speaker
    translate ([0,-60,+zWiggle]) speaker();
    //jack
    translate ([12,-10,0]) headJack("test");
    //toggle
    translate ([12,-25,0]) toggleSwitch("test");
    //test text
    translate([12,-19]) emboss("on",5);
    translate([12,-31]) emboss("off",5);
    translate([12,-100]) emboss(version,5);
    //trimcap
    translate([0,-90,0]) trimko("test");
    //tubemount
    translate([-6,-30,0]) tubeMount("test");
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
