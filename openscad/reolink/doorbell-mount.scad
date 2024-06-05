$fn=100;
baseH=.5;
baseD=100;
baseL=200;
translate([0,baseD/2,0]) hull(){
    cylinder(h=baseH,d=baseD);
    translate([0,baseL-baseD,0]) cylinder(h=baseH,d=baseD);
}
module BLOCKTEXT (content,pos) {
	translate(pos)
		linear_extrude(height = 2) 
			text(content, size = 7, direction = "ltr", spacing = 1, valign="center",halign="center");
}
BLOCKTEXT("KLINGEL",[0,baseD/4,0]);
BLOCKTEXT("DONNELLAN",[0,baseL-baseD/4,0]);

screwSpacing=75;
//bottom screw
translate([0,baseL/2-screwSpacing/2,0]) cylinder(h=2,d=2);
translate([-15,baseL/2-screwSpacing/2,0]) cylinder(h=1.5,d=2);
translate([+15,baseL/2-screwSpacing/2,0]) cylinder(h=1.5,d=2);
//top screw
translate([0,baseL/2+screwSpacing/2,0]) cylinder(h=2,d=2);
translate([-15,baseL/2+screwSpacing/2,0]) cylinder(h=1.5,d=2);
translate([+15,baseL/2+screwSpacing/2,0]) cylinder(h=1.5,d=2);

*translate([0,60,baseH]) color([0,0,0])
hull(){
    cylinder(h=20,d=50);
    translate([0,130-50,0]) cylinder(h=20,d=50);
}
