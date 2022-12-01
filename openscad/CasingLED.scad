// OPENSCA Model for encloser for Tine's table
// Curently 3 devices Waatuino, 3.3v to 5v and esp wemos d1 mini
$fn=100;
module wemos(){
    difference(){
        union(){
            //wemos d1 mini 26mmx35mm h7mm 
            cube([26,35,10],center=false);
            #translate([9,32,0]) cube([10,5,5],center=false);
        }
        translate([3,5,0]) cube([1,20,3]);
        translate([21,5,0]) cube([1,20,3]);
    }
}
module v5v3(){
    union(){
        difference(){
            //volatege level shifter 5v 3v 14mmx16mm h7mm 
            cube([14,16,10],center=false);
            translate([3,3,0]) cube([8,10,3]);
        }
        translate([4,4,0]) cube([6,8,3]);

    }
}
module blanker(){
    //volatege level shifter 5v 3v 14mmx16mm h7mm 
    cube([14,18,10],center=false);
}
module wattuino(){
    //wattuino arduino 5v clone 22mmx32mm h7mm 
    union(){
        difference(){
            cube([19,34,10],center=false);
            translate([2.5,4,0]) cube([14,26,3],center=false);
        }
        translate([3.5,5,0]) cube([12,24,3],center=false); 
    }
}
module casing(){
    //outer casing 
    cube([63,37,10],center=false);
}
module cabling(){
    //cabling boom 
    cube([50,8,3],center=false);
}
module xadow_pin(){
    union(){
        translate([0,0,0]) cylinder(h=1,r1=1,r2=1);
        translate([0,0,1]) cylinder(h=3,r1=1,r2=.5);
    }
}
module xadow_gsm(){
    difference(){    
    union(){
            //Xadow madule
            //turns out the GSM module has exactly  25.37mm X 20.30mm / 1’’ X 0.8’’
            //approx 2mm hole 17.5mm x18mm
            cube([25.4,20.3,.75],center=false);
            translate([3,1.5,0]) xadow_pin();
            translate([21.4,1.5,0]) xadow_pin();
            translate([3,18.5,0]) xadow_pin();
            translate([21.4,18.5,0]) xadow_pin();
            }
            #translate([25.4,20.3,0]) cylinder(h=1,r1=1,r2=1);
        }

}
module enclosure(){
    //outer casing and substract
    difference(){
        casing();
        translate([1,1,1]) wemos();
        translate([28,1,1]) v5v3();
        translate([43,1,1]) wattuino();
        translate([28,18,1]) blanker();
        #translate([7,7,7]) cabling();
        }
}

enclosure();
*xadow_gsm();