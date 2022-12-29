//This WILL e the power base and possibly usb hub holdewr for the cluster
//needs the mounting posts to sit the cluster on top of
//requires a base for the power brick and a holder for the USB hub whic can sit upright next to the cluster

$fn = 50;

module mount(x, y, z)
{
	mount_h = 7;
	mount_h2 = 3;

	difference()
	{
		union()
		{
			translate([-29, 11.5, mount_h/2]) { cylinder(h=mount_h, r=2, center=true); }
			translate([ 29,-11.5, mount_h/2]) { cylinder(h=mount_h, r=2, center=true); }
			translate([-29,-11.5, mount_h/2]) { cylinder(h=mount_h, r=2, center=true); }
			translate([ 29, 11.5, mount_h/2]) { cylinder(h=mount_h, r=2, center=true); }

			translate([x+29, y, z + 3/2]) { cube([4, 23.0, mount_h2], center=true); }
			translate([x-29, y, z + 3/2]) { cube([4, 23.0, mount_h2], center=true); }

			translate([x, y, z + mount_h2/2]) { cube([58, 5.0, mount_h2], center=true); }


			delta=2.1;
			translate([x+35-delta, y-17.5+delta, z + mount_h/2]) rotate([0, 0, 45]) {{ cube([4, 12.0, mount_h], center=true); }}
			translate([x+35-delta, y+17.5-delta, z + mount_h/2]) rotate([0, 0,-45]) {{ cube([4, 12.0, mount_h], center=true); }}


			translate([x-35+delta, y-17.5+delta, z + mount_h/2]) rotate([0, 0,-45]) {{ cube([4, 12.0, mount_h], center=true); }}
			translate([x-35+delta, y+17.5-delta, z + mount_h/2]) rotate([0, 0, 45]) {{ cube([4, 12.0, mount_h], center=true); }}

		}
		union()
		{
			translate([ 29, 11.5, mount_h/2 + mount_h * 0.15]) { cylinder(h=mount_h, r=2.70/2, center=true); }
			translate([-29, 11.5, mount_h/2 + mount_h * 0.15]) { cylinder(h=mount_h, r=2.70/2, center=true); }
			translate([-29,-11.5, mount_h/2 + mount_h * 0.15]) { cylinder(h=mount_h, r=2.70/2, center=true); }
			translate([ 29,-11.5, mount_h/2 + mount_h * 0.15]) { cylinder(h=mount_h, r=2.70/2, center=true); }
		}
	}


}

module stack_joins()
{
	mount_h = 20;
	Ro=4;		
	Ri=2.5;		
	Rp=Ri-0.4; 

	difference()
	{
		union()
		{
			translate([-39, 21.5, mount_h/2]) { cylinder(h=mount_h, r=Ro, center=true); }
			translate([ 39,-21.5, mount_h/2]) { cylinder(h=mount_h, r=Ro, center=true); }
			translate([-39,-21.5, mount_h/2]) { cylinder(h=mount_h, r=Ro, center=true); }
			translate([ 39, 21.5, mount_h/2]) { cylinder(h=mount_h, r=Ro, center=true); }

			translate([ 39, 21.5, mount_h/2 + mount_h * 0.35]) { cylinder(h=mount_h, r=Rp, center=true); }
			translate([-39, 21.5, mount_h/2 + mount_h * 0.35]) { cylinder(h=mount_h, r=Rp, center=true); }
			translate([-39,-21.5, mount_h/2 + mount_h * 0.35]) { cylinder(h=mount_h, r=Rp, center=true); }
			translate([ 39,-21.5, mount_h/2 + mount_h * 0.35]) { cylinder(h=mount_h, r=Rp, center=true); }

			translate([ 39, 21.5, mount_h + mount_h * 0.35]) { sphere(r=Rp); }
			translate([-39, 21.5, mount_h + mount_h * 0.35]) { sphere(r=Rp); }
			translate([-39,-21.5, mount_h + mount_h * 0.35]) { sphere(r=Rp); }
			translate([ 39,-21.5, mount_h + mount_h * 0.35]) { sphere(r=Rp); }
		}
		union()
		{
			translate([ 39, 21.5, mount_h/2 - mount_h * 0.15]) { cylinder(h=mount_h, r=Ri, center=true); }
			translate([-39, 21.5, mount_h/2 - mount_h * 0.15]) { cylinder(h=mount_h, r=Ri, center=true); }
			translate([-39,-21.5, mount_h/2 - mount_h * 0.15]) { cylinder(h=mount_h, r=Ri, center=true); }
			translate([ 39,-21.5, mount_h/2 - mount_h * 0.15]) { cylinder(h=mount_h, r=Ri, center=true); }
		}
	}
}
module power_brk(x,y,z,d) {
	translate ([-x/2,-y/2,-z/2]) cube([x,y,z]);
}
module power_brick(x,y,z,d) {
	union() {
		hull() {
			translate([x/2+d/2,y/2+d/2,z/2+d/2]) sphere(d=d);
			translate([x/2+d/2,-y/2-d/2,z/2+d/2]) sphere(d=d);
			translate([-x/2-d/2,y/2+d/2,z/2+d/2]) sphere(d=d);
			translate([-x/2-d/2,-y/2-d/2,z/2+d/2]) sphere(d=d);
		}
		translate([x/2+d/2,y/2+d/2,-z/2]) cylinder(h=y/2+d/4,d=d);
		translate([x/2+d/2,-y/2-d/2,-z/2]) cylinder(h=y/2+d/4,d=d);
		translate([-x/2-d/2,y/2+d/2,-z/2]) cylinder(h=y/2+d/4,d=d);
		translate([-x/2-d/2,-y/2-d/2,-z/2]) cylinder(h=y/2+d/4,d=d);
	}
}
module usb_hub(x,y,z,d) {
	*cube([x,y,z]);
	FBL=[-d/2,-d/2,0];
	FBR=[x+d/2,-d/2,0];
	FTL=[-d/2,-d/2,z+d/2];
	FTR=[x+d/2,-d/2,z];
	BBL=[-d/2,+d/2+y,0];
	BBR=[x+d/2,+d/2+y,0];
	BTL=[-d/2,+d/2+y,z];
	BTR=[x+d/2,+d/2+y,z+d/2];	
	//xleft
	hull () {
		translate(FBL) sphere(d=d);
		translate(BTL) sphere(d=d);
	}
	hull () {
		translate(FTL) sphere(d=d);
		translate(BBL) sphere(d=d);	
	}
	//xright
	hull () {
		translate(FBR) sphere(d=d);
		translate(BTR) sphere(d=d);
	}
	hull () {
		translate(FTR) sphere(d=d);
		translate(BBR) sphere(d=d);
	}
	//BACK CROSS
	hull () {
		translate(BBL) sphere(d=d);	
		translate(BTR) sphere(d=d);
	}
	hull () {
		translate(BTL) sphere(d=d);
		translate(BBR) sphere(d=d);
	}
	//top front2back
	hull () {
		translate(FTL) sphere(d=d);
		translate(BTL) sphere(d=d);
	}
	hull () {
		translate(FTR) sphere(d=d);
		translate(BTR) sphere(d=d);	
	}
	//top left2right
	hull () {
		translate(BTL) sphere(d=d);
		translate(BTR) sphere(d=d);	
	}
	hull () {
		translate(FTL) sphere(d=d);
		translate(FTR) sphere(d=d);
	}
	//bottom front2back
	hull () {
		translate(FBL) sphere(d=d);
		translate(BBL) sphere(d=d);
	}
	hull () {
		translate(FBR) sphere(d=d);
		translate(BBR) sphere(d=d);	
	}
	//bottom left2right
	hull () {
		translate(BBL) sphere(d=d);
		translate(BBR) sphere(d=d);	
	}
	hull () {
		translate(FBL) sphere(d=d);
		translate(FBR) sphere(d=d);
	}
}

BRKx=130; BRKy=67; BRKz=31.5;BRKd=8;
HUBx=12.5; HUBy=31.5; HUBz=75;

//display the stuff

//case
*translate([0,0,-5]) {
	translate([((BRKx/2)-(HUBx/2)+(BRKd/4)-BRKd),-HUBy/2,BRKz/2+BRKd]) usb_hub(HUBx,HUBy,HUBz,BRKd);
	power_brick(BRKx,BRKy,BRKz,BRKd);
}

//the stack pins
*difference() {
	stack_joins();
	translate([0,0,-5]) power_brk(BRKx,BRKy,BRKz,BRKd);
}
usb_hub(HUBx,HUBy,HUBz,BRKd);

