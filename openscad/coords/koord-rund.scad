$fn=50;
axisRadius=20;
axisD=1.5;
axisLabelD=10;
baseH=5;
baseD2=axisD;
baseD1=axisRadius/.9;
module ebene(text1,text2) {
    cylinder(h=axisRadius*2,d=axisD,center=true);
    translate([0,0,axisRadius]) cylinder(h=axisLabelD,d2=axisLabelD,d1=.5,center=true);
    rotate([0,90,0]) cylinder(h=1,r=axisRadius,center=true);
    translate([0,0,axisRadius+axisLabelD/2]) linear_extrude(1)text(text1,halign="center",valign="center",axisLabelD/3);
    translate([axisD/2,axisD/2,axisLabelD/3]) rotate([90,0,90]) text(text2,axisLabelD/3);
}
 
rotate([90,0,0]) ebene("x","xtext");
rotate([0,90,0]) ebene("y","ytext");
rotate([0,0,90]) ebene("z","ztext");
 
translate([0,0,-axisRadius]) cylinder(h=baseH,d1=baseD1,d2=baseD2,center=true);
 