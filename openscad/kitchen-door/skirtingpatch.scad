//approximation of the ends
length=192;
height=15;
end1W=15;
end2W=12;
wiggle=.1;
hull(){
    rotate([90,0,0]) cube([end1W,height,wiggle]);
    translate([0,length-wiggle,0]) rotate([90,0,0]) cube([end2W,height,wiggle]);
}
