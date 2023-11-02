$fn=100;
crossGuardD=130;
crossGuardH=15;
crossGuardMidD=100;
crossGuardMidH=20;
crossGuardInnerD=60;
crossGuardInnerH=30;
eps = 0.01;
handleR = 10;
handleTR = 45;
handleL = 250;

module crossGuard() {
    cylinder(h=crossGuardH,d=crossGuardD);
    cylinder(h=crossGuardMidH,d=crossGuardMidD);
    cylinder(h=crossGuardInnerH,d=crossGuardInnerD);
}

//
// HILT
//
fudge = 0.1;
custom_scale_x = 0.2645833279742765;
custom_scale_y = 0.2645833279742765;
line_fn = 4;
function min_line_mm(w) = max(1.0, w) * 0.264583;
hilt_points = [[4.712305,111.150545],[-1.094011,110.499592],[-2.972932,110.135122],[-3.462188,109.608767],[-3.773607,108.774219],[-4.436979,107.552054],[-5.432227,107.011144],[-9.721137,106.591800],[-10.735377,106.203812],[-11.314670,105.621713],[-11.834643,105.005774],[-11.984051,105.527257],[-12.119685,105.883297],[-12.540277,105.918767],[-14.389428,104.994043],[-17.553047,103.514177],[-19.092556,102.880464],[-21.534606,101.319091],[-24.151081,99.339710],[-26.213867,97.451972],[-33.501068,91.312376],[-37.392389,88.156629],[-39.010903,86.486779],[-41.321477,83.011799],[-45.215736,77.789987],[-48.481218,72.604179],[-50.974430,67.705653],[-52.551875,63.345689],[-56.678330,51.259617],[-59.337010,43.394768],[-60.735652,38.462584],[-61.650982,34.907832],[-62.305677,29.646387],[-62.760126,25.882525],[-63.514729,23.223299],[-64.337219,21.072645],[-64.954891,18.531501],[-65.818815,14.645864],[-66.319039,7.866276],[-66.537764,-5.264370],[-66.447944,-19.090090],[-66.022534,-27.954901],[-64.949247,-40.097012],[-64.576605,-43.563098],[-63.777363,-47.924908],[-61.337496,-57.784557],[-58.506478,-66.573669],[-57.218296,-69.597308],[-56.161139,-71.189954],[-55.394537,-72.009377],[-54.917991,-73.092386],[-54.557512,-77.066229],[-54.447780,-79.616616],[-54.130244,-81.294058],[-53.449893,-82.554996],[-52.251719,-83.855870],[-50.317564,-85.526970],[-48.786417,-86.499607],[-48.069093,-86.977131],[-47.610319,-87.764921],[-47.463608,-90.285070],[-45.208186,-93.007362],[-39.659449,-98.460952],[-34.263785,-103.293508],[-29.781396,-106.835337],[-26.310565,-109.015727],[-23.949574,-109.763965],[-20.750313,-110.582106],[-18.395319,-111.244120],[-15.748063,-111.591923],[-13.496602,-111.578542],[-12.328996,-111.157007],[-11.471814,-110.670208],[-9.997877,-110.449507],[-7.811355,-110.105197],[-5.240945,-109.321219],[-1.137638,-108.242977],[-0.350486,-108.090624],[-0.226663,-107.697860],[0.081186,-107.047867],[1.233025,-106.325002],[2.616337,-105.824776],[3.618607,-105.842699],[4.284269,-105.783643],[5.074276,-105.140787],[5.982442,-104.393155],[6.932191,-104.082193],[7.623874,-103.885627],[7.911564,-103.413031],[10.384891,-100.265445],[16.331402,-93.637517],[23.178797,-85.744273],[27.818109,-79.554542],[31.053211,-74.891176],[34.524573,-70.667709],[40.158967,-64.396349],[41.226734,-62.889282],[41.592088,-61.891968],[42.074945,-60.702015],[43.007263,-59.398799],[44.483993,-56.886157],[46.275763,-52.788436],[49.602441,-44.503764],[50.347327,-43.216277],[50.901943,-42.932913],[51.921409,-41.678411],[53.416649,-38.661761],[54.898401,-34.983307],[55.877400,-31.743391],[56.416766,-30.111548],[57.023362,-29.432817],[57.485562,-29.201633],[57.677808,-28.645804],[57.364555,-28.210189],[56.611407,-28.268022],[55.878931,-28.375238],[55.601784,-27.856289],[56.377303,-24.331447],[57.238303,-22.352970],[57.692615,-21.937680],[58.154666,-21.916077],[58.790553,-21.967479],[59.078626,-21.636472],[58.977659,-21.111651],[58.446422,-20.581610],[58.251394,-19.738290],[58.750639,-18.229081],[59.534159,-15.386057],[60.073343,-11.287286],[60.655429,-7.139257],[61.542096,-4.177822],[62.322794,-2.295269],[62.650064,-0.741156],[62.906663,0.113753],[63.563431,0.230253],[63.991905,0.313739],[64.254280,1.045455],[64.365593,4.953078],[64.382272,8.065028],[64.459069,8.646005],[64.572444,8.425084],[64.873195,7.449324],[65.294587,6.929440],[65.821792,6.874420],[66.439977,7.293248],[66.537764,7.903900],[66.115942,8.715141],[65.726622,9.388975],[65.902530,9.669241],[65.981683,9.930291],[65.359738,10.557922],[64.473900,12.816744],[63.765883,16.866181],[63.482095,20.738189],[63.576289,21.992644],[63.868945,22.464726],[64.221009,24.604724],[64.277064,29.751929],[64.324272,34.821498],[64.494546,35.764667],[64.760298,35.618793],[65.293780,34.844801],[65.448267,36.420426],[65.180519,38.242275],[64.466664,39.500067],[63.605585,41.079630],[62.983941,43.675054],[62.238836,46.958797],[61.080981,50.193188],[59.015746,55.500659],[56.706660,62.429673],[54.809911,68.891064],[53.981690,72.795668],[53.758845,74.546542],[53.351215,75.469437],[52.521354,77.054138],[51.283366,80.396158],[48.953085,85.522824],[45.496989,91.398313],[42.093111,96.299677],[38.945897,100.293305],[35.913504,103.476813],[32.854088,105.947815],[29.625807,107.803925],[26.086817,109.142759],[22.095276,110.061931],[17.509341,110.659056],[8.977984,111.591923],[4.712305,111.150545],[4.712305,111.150545]];
module poly_hilt(h, w, s, res=line_fn)
{
  scale([custom_scale_x, -custom_scale_y, 1]) union() {
    linear_extrude(height=h, convexity=10, scale=0.01*s) polygon(hilt_points);
    }
}
module hilt(h) {
  poly_hilt(h, min_line_mm(0.1881051549233745), 100.0);
  }
//
// BLADE
//
blade_points = [[-6.211141,56.491387],[-11.773241,54.678287],[-16.131421,53.140387],[-17.333261,49.249287],[-18.299491,45.710305],[-19.090436,41.619609],[-20.747921,28.048917],[-21.487982,19.183951],[-21.300618,17.106103],[-20.740921,15.239217],[-19.967180,11.613437],[-20.066761,5.835937],[-20.158250,-0.312855],[-19.853401,-6.034583],[-19.575395,-10.170069],[-19.822201,-12.128343],[-20.087007,-12.859070],[-20.000895,-13.729269],[-19.642141,-14.457659],[-19.089021,-14.762963],[-18.709377,-15.028199],[-18.551471,-15.665893],[-18.711741,-16.303595],[-19.097071,-16.568833],[-19.390442,-16.920491],[-19.329611,-17.765973],[-18.951794,-18.514595],[-18.483031,-18.633383],[-18.104140,-18.897215],[-17.942381,-19.994553],[-16.743468,-26.595121],[-14.007776,-37.906939],[-10.993804,-49.021308],[-8.960051,-55.029526],[-7.253416,-55.835790],[-3.894304,-56.397304],[0.134142,-56.610912],[3.848779,-56.373461],[12.138859,-55.090539],[18.608549,-53.569603],[20.475935,-52.443671],[21.040405,-51.630469],[21.384400,-50.510610],[21.487982,-46.931430],[20.940719,-40.867143],[20.252429,-31.190993],[19.962419,-20.481553],[19.567900,-6.316918],[17.860199,9.917267],[15.895121,23.253799],[14.752035,27.853816],[13.086309,33.092607],[11.144568,39.376384],[10.157389,43.495277],[9.526349,46.149821],[8.440839,48.912897],[6.695168,51.486579],[3.937319,53.258157],[0.024599,55.461627],[-1.120688,56.026963],[-2.820621,56.433081],[-4.656934,56.610912],[-6.211361,56.491387],[-6.211141,56.491387]];
module poly_blade(h, w, s, res=line_fn)
{
  scale([custom_scale_x, -custom_scale_y, 1]) union() { 
    linear_extrude(height=h, convexity=10, scale=0.01*s) polygon(blade_points);
    }
}
module blade(h) {
  poly_blade(h, min_line_mm(0.601957), 100.0);
  }

//handle part
module handleTube(cylH) {
    difference(){
        cylinder(h=cylH,r=handleR);
        translate([0,0,-eps]) cylinder(h=10,d=10);
        translate([0,0,cylH-10+eps]) cylinder(h=10,d=10); 
    }
}

module hilt2(height,diameter,waist){
    //hilt measurments
    //somewhat rough as hilt is not prefect elipse
    //diameter=36;
    //waist=26;
    //height=10;
    scale([waist/diameter,1])cylinder(h=height,d=diameter);
}

//handle bend
module handleBend(turnR,handleR){
    bound=turnR+handleR+1;
    difference() {
        intersection() {
            translate([0,0,0])rotate_extrude()translate([turnR,0,0])circle(r=handleR);
            translate([0,0,-handleR])cube ([bound,bound,handleR*2]);
        }
        //two holes for mounting
        translate([-eps,handleTR,0]) rotate([0,90,0]) cylinder(h=10,d=10);
        translate([handleTR,10-eps,0]) rotate([90,0,0]) cylinder(h=10,d=10);
    }
}

difference() {
    //test fitting only
    //cylinder(h=30,d=34);
    //real crossguard - uncomment when the test verison is commented
    color("gold") crossGuard();
    translate([0,0,-0.1]) rotate([0,0,6]) blade(5.11);
    //hiltS=.55; //WRONG
    //scale([hiltS,hiltS,1]) translate([0,0,5-.1]) rotate([0,0,-189]) hilt(30);
    translate([0,0,5]) hilt2(30.01,36,27.5);
    translate([0,-130/2+20-.1,(crossGuardH-6)/2+2.5]) rotate([90,90,0]) cylinder(h=20.1,d=(10));
}

//approximation of hilt for scale
*color("black")translate([0,0,5]) hilt2(290.01,36,27.5);
//empty hilt shell for testing
translate([-85,0,0]) union(){
    difference(){
        scale([1.1,1.1]) hilt2(30.01,36,27.5);
        translate([0,0,-.1]) hilt2(30.2,36,27.5);
    }
    difference(){
        hilt2(.5,40,32);
        translate([0,0,-0.1]) rotate([0,0,6]) blade(5.11);
    }
}


//two bends
translate([0,60,0]) handleBend(handleTR,handleR);
translate ([-2,60,0]) rotate([0,0,90]) handleBend(handleTR,handleR);

//long handle tube
translate([-11,78,0]) handleTube(handleL-(2*handleTR+handleR));

//mounting pegs
pegD=10;
pegH=19;
translate([75,0,0]) cylinder(h=pegH,d=pegD);
translate([75,11,0]) cylinder(h=pegH,d=pegD);
translate([75,22,0]) cylinder(h=pegH,d=pegD);
translate([75,-11,0]) cylinder(h=pegH,d=pegD);

//cross handle tube
translate([11,78,0]) union() {
    crosshandleH=130*.75;
    handleTube(crosshandleH);
    translate([0,0,crosshandleH]) sphere(r=handleR);
}
