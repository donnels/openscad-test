$fn=100;
baseH=5;
baseD=100;
baseL=200;
holeSpacing=95;
screwSpacing=75;
mountD=2.5;
flaringD1=3.5;
flaringH=3.4;
flaringD2=8.5;
module BLOCKTEXT (content,pos) {
	translate(pos)
		linear_extrude(height = 2) 
			text(content, size = 7, direction = "ltr", spacing = 1, valign="center",halign="center");
}

//mounting plate
module doorbell () {
	difference () {
		//plate
		translate([0,baseD/2,0]) hull(){
			cylinder(h=baseH,d=baseD);
			translate([0,baseL-baseD,0]) cylinder(h=baseH,d=baseD);
		}
		BLOCKTEXT("KLINGEL",[0,baseD/4,baseH-1.5]);
		BLOCKTEXT("DONNELLAN",[0,baseL-baseD/4,baseH-1.5]);
		//screwholes
		translate([0,baseL/2-holeSpacing/2,-.1]) cylinder(h=baseH+.2,d=flaringD1);
		translate([0,baseL/2-holeSpacing/2,baseH-flaringH+.1]) cylinder(h=flaringH,d1=flaringD1,d2=flaringD2);
		translate([0,baseL/2+holeSpacing/2,-.1]) cylinder(h=baseH+.2,d=flaringD1);
		translate([0,baseL/2+holeSpacing/2,baseH-flaringH+.1]) cylinder(h=flaringH,d1=flaringD1,d2=flaringD2);
		//mount holes
		translate([0.8,baseL/2-screwSpacing/2,0]) rotate([0,-12.5,0]) translate([0,0,-1])cylinder(h=baseH+2,d=mountD);
		translate([0.8,baseL/2+screwSpacing/2,0]) rotate([0,-12.5,0]) translate([0,0,-1])cylinder(h=baseH+2,d=mountD);
		//cable truss
		translate([0,baseL/2-15,-.1]) cylinder(h=baseH+.2,d=30);
	}
	//bottom mount alignment tabs
	translate([-15,baseL/2-screwSpacing/2,baseH]) cylinder(h=1.5,d=2);
	translate([+15,baseL/2-screwSpacing/2,baseH]) cylinder(h=1.5,d=2);
	//top mount alignment tabs
	translate([-15,baseL/2+screwSpacing/2,baseH]) cylinder(h=1.5,d=2);
	translate([+15,baseL/2+screwSpacing/2,baseH]) cylinder(h=1.5,d=2);
}

//intersection() {
	doorbell();
//	translate([0,52.5,0]) cylinder(h=20,d=15);
//}
*translate([0,60,baseH]) color([0,0,0])
hull(){
    cylinder(h=20,d=50);
    translate([0,130-50,0]) cylinder(h=20,d=50);
}
