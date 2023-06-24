uprightX=40;
uprightY=60;
uprightIndent=uprightY/3;
IuprightIndent=uprightY-uprightIndent;
floorH=20; //thickness of board
floorOffset=uprightY+floorH+20; //height from ground the kaercher sits at
solarAngle=45; //front angle of solar roof
solarX=500; //panel Width
solarY=715; //panel Height
solarZ=25; //panel Depth
kaercherH=900; //approximate Kaercher bounding Height
kaercherX=330; //approximate Kaercher bounding Height
kaercherY=330;
kaercherHeadRoom=uprightY+20;
solarHpos=floorOffset+kaercherH+kaercherHeadRoom+uprightY;
//triangle sides
opposite = sin(solarAngle) * solarY;
adjacent = cos(solarAngle) * solarY;

// PARAMETRIC PART
//upright FL
cube([uprightX,uprightY,solarHpos]);
//upright FR
translate([solarX-uprightX,0,0]) cube([uprightX,uprightY,solarHpos]);
echo("2x front upright lengths= ",solarHpos);

// Panel / roof
translate([0,0,solarHpos])rotate([solarAngle,0,0])cube([solarX,solarY,solarZ]);

// Kaercher bounding box
translate ([solarX/2-kaercherX/2,adjacent/2-kaercherY/2,floorOffset]) color([1,1,0])cube([kaercherX,kaercherY,kaercherH]);

//upright BL
translate([0,adjacent-uprightY,0]) cube([uprightX,uprightY,solarHpos+opposite]);
//upright BR
translate([solarX-uprightX,adjacent-uprightY,0]) cube([uprightX,uprightY,solarHpos+opposite]);
echo("2x back upright lengths= ",solarHpos+opposite);

//floor
//sides
translate([0,IuprightIndent,floorOffset-floorH-uprightY]) cube([uprightX,adjacent-(2*uprightY)+(2*uprightIndent),uprightY]);
translate([solarX-uprightX,IuprightIndent,floorOffset-floorH-uprightY]) cube([uprightX,adjacent-(2*uprightY)+(2*uprightIndent),uprightY]);
echo("2x bottom sides length= ",adjacent-(2*uprightY)+(2*uprightIndent));
//bottom floor board
translate([0,uprightY,floorOffset-floorH]) cube([solarX,adjacent-(2*uprightY),floorH]);
echo("1x floor board XxY= ",solarX,adjacent-(2*uprightY));

//bottom back
translate([0,adjacent-uprightX,floorOffset-uprightY+(1.5*uprightY)]) cube([solarX,uprightX,uprightY]);
//top back
translate([0,adjacent-uprightX,floorOffset+kaercherH+kaercherHeadRoom-uprightY]) cube([solarX,uprightX,uprightY]);
//top front
translate([0,0,floorOffset+kaercherH+kaercherHeadRoom-uprightY]) cube([solarX,uprightX,uprightY]);
echo("3x back and front length= ",solarX);

//top shelf board
translate([uprightX,0,floorOffset+kaercherH+kaercherHeadRoom]) cube([solarX-(2*uprightX),adjacent,floorH]);
echo("1x shelf board XxY= ",solarX-(2*uprightX),adjacent);

