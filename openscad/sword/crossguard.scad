$fn=100;
crossGuardD=130;
crossGuardH=20;
crossGuardMidD=100;
crossGuardMidH=25;
crossGuardInnerD=60;
crossGuardInnerH=30;

module crossGuard() {
cylinder(h=crossGuardH,d=crossGuardD);
cylinder(h=crossGuardMidH,d=crossGuardMidD);
cylinder(h=crossGuardInnerH,d=crossGuardInnerD);
}

difference() {
  color("gold") crossGuard();
  #translate([0,0,-.1]) cylinder(h=crossGuardInnerH+.2,d=10);
}
