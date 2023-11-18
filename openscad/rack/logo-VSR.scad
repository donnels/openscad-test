//VSR logo
$fn=100;
imgW=212;
textH=60;

module outline_text (size,text) {
    font = "DejaVu Sans:style=Bold";
    letter_size = size;
    height = 10;
    string = text;
    textlen = len(string);
    linear_extrude(height) {
        difference() {
            offset(r=-1) {
                text(string, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
            }

            offset(r=-5) {
                text(string, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
            }
        }
    }
}

color([0,1,0])linear_extrude(height=4) import("logo-earth.svg",center = true);
outline_text(textH,"VSR");

//create an approxiumated orbit from an elipsoid
 module orbit(size) {
    difference(){
        scale([1,.5,1]) linear_extrude(height=12)circle(d=size+30);
        translate([0,0,-.1])scale([1,.5,1]) linear_extrude(height=12.2)circle(d=size+20);
    }
}

union () {
intersection() {
    difference(){
        linear_extrude(height=20) circle(d=imgW);
        translate([-imgW/2,0,-.1])cube([imgW,imgW/2,20.2]);
    }
    orbit(imgW);
}

difference() {
    size=imgW;
    orbit(size);
    translate([0,0,-.1]) linear_extrude(height=12.2)circle(d=size);
    translate([0,0,-.1]) cube([imgW,imgW,20]);
}
}

module tri(size,rot,height){
    rotate([0,0,rot])linear_extrude(height=height)polygon([[0,0],[size*2,0],[size,size*2]]);
}

translate([imgW/2+3,0,0])tri(10,-20,16);