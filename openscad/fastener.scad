$fn=100;
mainLength=50;
mainD=15;
mainH=10;
mainHoleD=10;
ringH=2;

magnetX=17;
magnetY=5;
magnetZ=2;

difference () {
	hull(){
		cylinder(d=mainD,h=mainH);
		translate([mainLength,0,0]) cylinder(d=mainD,h=mainH);
	}
	translate([0,0,-.1])cylinder(h=mainH+.2,d=mainHoleD);
	translate([0,0,((mainH-ringH-.5)/2)]) cylinder(h=2.5,d=mainHoleD+3.2);
	//magnet
	translate([mainLength-magnetX,-magnetZ/2,(mainH-magnetY)/2]) cube([magnetX,magnetZ,magnetY+10]);
	//holder
	translate([mainLength-magnetX-1,-(mainD/2)-1,-.1]) cube([magnetX+2,magnetZ+mainD,2]);
}

difference(){
	union() {
		cylinder(h=mainH,d=mainHoleD-1);
		translate([0,0,((mainH-ringH)/2)]) cylinder(h=2,d=mainHoleD+3);
	}
	translate([0,0,-.05])cylinder(h=mainH+.1,d=2);
}

translate([10,-5,mainH]) linear_extrude (height=2) {
	text("V1");
	}
