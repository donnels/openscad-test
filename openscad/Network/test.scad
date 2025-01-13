$fn = 100 ;
$vpr = [66,0,28] ; //viewport rotation angles in degrees
$vpt = [80,88,42] ; //viewport translation
$vpd = 788 ; //viewport camera distance

function select(vector, indices) = [ for (index = indices) vector[index] ];
// convert hex value aaaaff to openscad rgb values
function hexCharToDec(c) = 
    search(c, "0123456789abcdef")[0];
function hexToDec(hex) = 
    hexCharToDec(hex[0]) * 16 + hexCharToDec(hex[1]);
function hexToRGB(hex) = [
    hexToDec([hex[0], hex[1]]) / 255,
    hexToDec([hex[2], hex[3]]) / 255,
    hexToDec([hex[4], hex[5]]) / 255
];

// example
//echo(hexToRGB("aaaaff")); // Should output [0.6667, 0.6667, 1]

layer = [0, 0, 10 ] ;
app1 =      [ "app1" ,    [0,   0,      0] , 7] ;
app2 =      [ "app2" ,    [0,   100,    0] , 7] ;
switch1 =   [ "switch1" , [100, 0,      0] , 2] ;
switch2 =   [ "switch2" , [100, 100,    0] , 2] ;
router1 =   [ "router1" , [200, 0,      0] , 3] ;
router2 =   [ "router2" , [200, 100,    0] , 3] ;
layers = [  ["Meta" , 0, [17, 17, layer.z + 1], [0, 0,  0, 0],  [0, 0, 0, 1] ],
            ["HW"   , 1, [16, 16, layer.z + 1], [0, 0,  1, 1],  [0, 0, 0, .3] ],
            ["L2"   , 2, [15, 15, layer.z + 1], [1, .7, 0, .5], [1, 1, 0, 1] ],
            ["L3"   , 3, [14, 14, layer.z + 1], [1, .7, 0, .5], [1, .5, 0, 1] ],
            ["L4"   , 4, [13, 13, layer.z + 1], [1, .7, 0, .5], [1, 1, 1, 1] ],
            ["L4"   , 5, [12, 12, layer.z + 1], [1, 1,  1, .5], [1, 1, 1, 1] ],
            ["L4"   , 6, [11, 11, layer.z + 1], [1, 1,  1, .5], [1, 1, 1, 1] ],
            ["APP"  , 7, [10, 10, layer.z + 1], [1, 0,  0, .5], [1, 0, 0, .5] ]
            ];

module subStack(stackLayer) {
    lib = select(layers , stackLayer) ; var = lib[0] ;
    label = var[0] ; stackLayer = var[1] ; dimensions = var[2] ; color = var[3] ;
    echo("stack test: ", label, layer, dimensions);
    translate(stackLayer * layer + [0, 0, dimensions.z/2] )
        color(color)
            cube(dimensions, center = true) ;
}

module stack(device) {
    echo(device);
    label = device[0] ;
    pos = device[1] ; 
    stackH = device[2] ;
    translate(pos) {
        translate( (stackH + 2)* layer) rotate([90,0,0]) linear_extrude(1) text(label,valign="center",halign="center");
        for (i = [stackH:-1:0]) {
            subStack(i);
        }
    }
}

module link(vector1,vector2,stackLayer){
    off = layer / 2 ; echo(off);
    lib = layers[stackLayer] ;
    color = lib[4] ;
    pos1 = vector1[1] + (stackLayer * layer) +  off ; echo(pos1);
    pos2 = vector2[1] + (stackLayer * layer) +  off ; echo(pos2);
    color(color) hull(){
        translate(pos1) sphere(d=1);
        translate(pos2) sphere(d=1);
    }
}
module cluster(vector1,vector2,stackLayer){
    off = layer / 2 ; echo(off);
    lib = layers[stackLayer] ;
    color = lib[4] ;
    pos1 = vector1[1] + (stackLayer * layer) +  off ; echo(pos1);
    pos2 = vector2[1] + (stackLayer * layer) +  off ; echo(pos2);
    color("grey",.3) hull(){
        translate(pos1) cube(18,true);
        translate(pos2) cube(18,true);
    }
}

//devices
stack(app1);
stack(app2);
stack(switch1);
stack(switch2);
stack(router1);
stack(router2);

//high level
link(app1,app2,7);

//cabling
link(app1,switch1,1);
link(app2,switch2,1);
link(router1,switch1,1);
link(router2,switch2,1);
link(switch1,switch2,1);

//vlans
link(app1,switch1,2);
link(app2,switch2,2);
link(router1,switch1,2);
link(router2,switch2,2);
link(switch1,switch2,2);

link(router1,router2,3);
cluster(router1,router2,3);
//layer3 gateways
link(app1,router1,3);
link(app2,router1,3);
