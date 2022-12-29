//This WILL e the power base and possibly usb hub holdewr for the cluster
//needs the mounting posts to sit the cluster on top of
//requires a base for the power brick and a holder for the USB hub whic can sit upright next to the cluster

$fn = 100;

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

module stack_joins(x, y, z)
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
module power_brick(offX,offY,offZ) {
	x=130; y=67; z=31.5;d=8;
	translate ([offX-x/2,offY-y/2,offZ-z/2]) cube([x,y,z]);
	#union() {
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
module usb_hub(offX,offY,offZ) {
	x=12.5; y=31.5; z=75;
	translate ([offX,offY,offZ]) cube([x,y,z]);
}
module model()
{
	usb_hub(-60,-16,25);
	power_brick(0,0,0);
	*mount(0, 0, 0);
	stack_joins(0, 0, 0);
}

model();

