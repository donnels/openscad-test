//inside of midleton wooden box with double doors
totHeight = 260 ;
totWidth = 111.1 ;
totDepth = 108.5 ;
volume = [ totWidth, totDepth, totHeight] ;

//inner structure definitions
structDivs = 6 ;
structStrength = 1 ;
structH = totHeight/structDivs ;
post = [structStrength, structStrength, structH] ;

//Volume Visual
#cube( volume );

FL = [0, 0, 0];
FR = [volume.x - post.x, 0, 0];
BR = [volume.x - post.x, volume.y - post.y, 0];
BL = [0, volume.y - post.y, 0];

for (i = [0:structH:structH -1]) {
    translate ([0,0,i]) {
        //left and right sides
        hull() {
            translate( FR ) cube( post );
            translate( BR ) cube( post );
        }
        hull() {
            translate( FL ) cube( post );
            translate( BL ) cube( post );
        }
        //Base plate
        hull() {
            cube([volume.x, post.y, post.y]) ;
            translate ([0, 0, 0] + BL) cube([volume.x, post.y, post.y]) ;
        }
    }
}
