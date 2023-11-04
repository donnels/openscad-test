$fn=100;
plateH = 2.5 ;
topInsideH = 6 ;
headH = 2 ;
headD = 27 ;
//diameter of top inside
translate([0,0,-plateH]) cylinder(h=6+plateH,d=18.35);
//diameter of inside
translate([0,0,5]) cylinder(h=10,d=17.63);
//rim
translate([0,0,3]) cylinder(h=1,d=19);
//head
translate([0,0,-(headH+plateH)]) cylinder(h=headH,d=headD);
//plate
*translate([0,0,-2.5]) difference(){
    translate([-20,-20.0])cube([40,40,plateH]);
    translate([0,0,-.1]) cylinder(h=3,d=19.25);
}