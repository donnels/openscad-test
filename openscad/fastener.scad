$fn=100;
mainLength=50;
mainD=15;
mainH=10;
axleD=10;
axleDout=axleD+3;
ringH=2;

magnetX=17;
magnetY=5;
magnetZ=2;

module axle(xxlX,xxlY) {
	translate([0,0,-xxlY/2])cylinder(h=mainH+xxlY,d=axleD+xxlX);
	translate([0,0,((mainH-ringH)/2)]) cylinder(h=ringH,d=axleDout+xxlX);
	translate([0,0,(mainH/2)-((axleDout-axleD)/2+ringH/2)]) cylinder(h=(axleDout-axleD)/2,d1=axleD+xxlX,d2=axleDout+xxlX);
	translate([0,0,(mainH/2)+(ringH/2)]) cylinder(h=((axleDout-axleD)/2),d2=axleD+xxlX,d1=axleDout+xxlX);
}
module clip() {
	difference() {
		union(){
			hull(){
				cylinder(d=mainD,h=mainH);
				translate([mainLength,0,0]) cylinder(d=mainD,h=mainH);
			}
			translate([10,-5,mainH]) linear_extrude (height=2) {
				text("V2");
			}
		}
		//magnet
		translate([mainLength-magnetX,-magnetZ/2,(mainH-magnetY)/2]) cube([magnetX,magnetZ,magnetY+10]);
		//holder
		translate([mainLength-magnetX-1,-(mainD/2)-1,-.1]) cube([magnetX+2,magnetZ+mainD,2]);
	}
	
}
difference () {
	clip();
	axle(1,1);
}
difference(){
	axle(0,0);
	translate([0,0,-.05]) cylinder(h=mainH+.1,d=2);
}
