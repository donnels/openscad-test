$fn=360;
plateH = 2.5 ;
topInsideH = 6 ;
topInsideD = 18.2 ;
topInsideR = topInsideD/2 ;
insideD = 17.5 ;
insideH = 10 ;
lipH = .15 ;
lipW = .5 ;
headH = 2 ;
headD = 26.5 ;
plateHoleD = 19.1 ;
plateHoleH = 3 ;
//diameter of top inside
color("grey") translate([0,0,-plateH]) cylinder(h=6+plateH,d=topInsideD);
//diameter of inside
color("blue") translate([0,0,5]) cylinder(h=insideH,d=insideD);
//Lip
*color("red") translate([0,0,3]) cylinder(h=lipW,r1=topInsideR+lipH,r2=topInsideR);
*color("red") translate([0,0,3-lipW]) cylinder(h=lipW,r2=topInsideR+lipH,r1=topInsideR);
//mount ring
color("red") translate([0,0,-plateHoleH]) cylinder(h=plateHoleH,d=plateHoleD);

//head
color("grey") translate([0,0,-(headH+plateH)]) cylinder(h=headH,d=headD);
//plate
*translate([0,0,-2.5]) difference(){
    translate([-20,-20.0])cube([40,40,plateH]);
    translate([0,0,-.1]) cylinder(h=plateHoleH,d=plateHoleD);
}