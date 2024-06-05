$fn=100;
baseH=.5;
baseD=100;
baseL=200;
translate([0,baseD/2,0]) hull(){
    cylinder(h=baseH,d=baseD);
    translate([0,baseL-baseD,0]) cylinder(h=baseH,d=baseD);
}
content="KLINGEL";
translate([0,baseD/4,0])
    linear_extrude(height = 4) 
        text(content, size = 7, direction = "ltr", spacing = 1, valign="center",halign="center");

*translate([0,60,baseH]) color([0,0,0])
hull(){
    cylinder(h=20,d=50);
    translate([0,130-50,0]) cylinder(h=20,d=50);
}
