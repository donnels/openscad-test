// This scad script creates a cubic structure based on cube dimensions 
// based on uprights and cross connexions from a list of lists of corners

// Corner strength
Blob = [3,3,3] ;
// Outside dimensions
DIM = [100, 200, 200] ;

module qubicStruct(Blob, DIM) {
    // relative coordinates of the 8 corners minus the corner strength
    // eg. Bottom Back Left= BBL, or TFR= Top Front Right
    // This makes reading the list of lists easier
    BFL = [0, 0, 0] ;
    BFR = [DIM.x - Blob.x, 0, 0] ;
    BBR = [DIM.x - Blob.x, DIM.y -Blob.y, 0] ;
    BBL = [0, DIM.y -Blob.y, 0] ;
    TOP = [0, 0, DIM.z -Blob.z] ;
    TFL = BFL + TOP ;
    TFR = BFR + TOP ;
    TBR = BBR + TOP ;
    TBL = BBL + TOP ;

    // List of list of pairs of 3D coordinates with comment
    coordinatePairs = [
        [BFL, BFR, "bottom"],
        [BFR, BBR, "bottom"],
        [BBR, BBL, "bottom"],
        [BBL, BFL, "bottom"],
        [BBL, BFR, "bottom cross"],
        [BFL, BBR, "bottom cross"],
        [BFR, TFR, "upright"],
        [BFL, TFL, "upright"],
        [BBR, TBR, "upright"],
        [BBL, TBL, "upright"],
        // top frame (ONLY needed if TOP structure to stabilize
        [TFL, TFR, "top"],
        [TFR, TBR, "top"],
        [TBR, TBL, "top"],
        [TBL, TFL, "top"],
        [BFL, TBL, "left cross"],
        [TFL, BBL, "left cross"],
        [BFR, TBR, "right cross"],
        [TFR, BBR, "right cross"],
        [BBR, TBL, "back cross"],
        [TBR, BBL, "back cross"],
    ];

    module createHull(coord1, coord2) {
        hull() {
            translate(coord1) cube(Blob);
            translate(coord2) cube(Blob);
        }
    }

    // Create hulls around pairs of 3D coordinates
    for (pair = coordinatePairs) {
        createHull(pair[0], pair[1]);
        *echo(pair[2]);
    }
}

qubicStruct(Blob, DIM);