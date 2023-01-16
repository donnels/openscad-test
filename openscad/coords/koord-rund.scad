$fn=50;

//variablen
axisRadius=25;
discH=1.5;
axisD=2.7;
axisLabelD=10;
labelExt=1.2;
baseH=6;
baseD2=axisD;
baseD1=axisRadius/.9;

//ebene
module ebene(text1,text2) {
    cylinder(h=axisRadius*2,d=axisD,center=true);
    translate([0,0,axisRadius]) cylinder(h=axisLabelD,d2=axisLabelD,d1=.5,center=true);
    rotate([0,90,0]) cylinder(h=discH,r=axisRadius,center=true);
    translate([0,0,axisRadius+axisLabelD/2]) linear_extrude(labelExt)text(text1,halign="center",valign="center",axisLabelD/2);
    translate([discH/2,axisD,axisD]) rotate([90,0,90]) linear_extrude(labelExt) text(text2,axisLabelD/2);
}

//ebenen ausgabe
rotate([90,0,0]) ebene("x1","x1-x3");
rotate([0,270,180]) ebene("x2","x1-x2");
rotate([0,0,270]) ebene("x3","x3-x2");

//base
translate([0,0,-axisRadius]) cylinder(h=baseH,d1=baseD1,d2=baseD2,center=true);
difference() {
    translate([0,0,-axisRadius-baseH/2-labelExt/2]) cylinder(h=labelExt,d=baseD1,center=true);
    translate([0,0,-axisRadius-baseH/2]) rotate([180,0,0]) linear_extrude(labelExt)text("Fynn",halign="center",valign="center",9);
}
