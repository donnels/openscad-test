$fn=100;
width=220;
height=15;
thickness=1;
pinOff=2;
pinH=10;
pinD=2;
clipW=40;
clipWout=60;
clipH=5;
clipHout=20;

module pin() {
    cylinder(h=pinH,d=pinD);
}

translate([0,0,0]) pin();
translate([0,height,0]) pin();
translate([width,0,0]) pin();
translate([width,height,0]) pin();
translate([-pinOff,-pinOff,0]) cube([width+2*pinOff,height+2*pinOff,thickness]);

difference(){
    translate([width/2-clipWout/2,height,0]) cube([clipWout,clipHout,thickness]);
    translate([width/2-clipW/2,clipHout+clipH,-.1]) cube([clipW,clipH,thickness+.2]);
}
