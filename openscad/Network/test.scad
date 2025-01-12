$fn = 100 ;


function select(vector, indices) = [ for (index = indices) vector[index] ];

layer = [0, 0, 10 ] ;
app1 = ["app1" , [0,    0,      0] ] ;
app2 = ["app2" , [0,    100,    0] ] ;
layers = [ ["Meta" , 0, [17, 17, layer.z + 1], [0, 0,  0, 0] ],
            ["HW"   , 1, [16, 16, layer.z + 1], [0, 0,  1, 1] ],
            ["L2"   , 2, [15, 15, layer.z + 1], [1, .7, 0, .5] ],
            ["L3"   , 3, [14, 14, layer.z + 1], [1, .7, 0, .5] ],
            ["L4"   , 4, [13, 13, layer.z + 1], [1, .7, 0, .5] ],
            ["L4"   , 5, [12, 12, layer.z + 1], [1, 1,  1, .5] ],
            ["L4"   , 6, [11, 11, layer.z + 1], [1, 1,  1, .5] ],
            ["APP"  , 7, [10, 10, layer.z + 1], [1, 0,  0, .5] ]
            ];

echo (app2[0]) ; echo (app2[1]) ;
echo (layers[1]) ;

//list parsing example
test=select(layers , 5) ; echo(test) ; 
testIn=test[0] ; echo(testIn) ; 
testInIn=testIn[0] ; echo(testInIn) ;

module subStack(stackLayer) {
    lib = select(layers , stackLayer) ; var = lib[0] ;
    label = var[0] ; stackLayer = var[1] ; dimensions = var[2] ; color = var[3] ;
    echo("stack test: ", label, layer, dimensions);
    translate(stackLayer * layer + [0, 0, dimensions.z/2] )
        color(color)
            cube(dimensions, center = true) ;
}

module stack(stackLayer) {
    lib = select(layers , stackLayer) ; var = lib[0] ;
    label = var[0] ; stackLayer = var[1] ; dimensions = var[2] ; color = var[3] ;
    translate( (stackLayer + 2)* layer) rotate([90,0,0]) linear_extrude(1) text(label,valign="center",halign="center");
    subStack(0);
    subStack(1);
    subStack(2);
    subStack(3);
    subStack(4);
    subStack(5);
    subStack(6);
    subStack(7);
}

stack(7);