// Function to create a hull around two 3D coordinates
module createHull(coord1, coord2) {
    hull() {
        translate(coord1)
        cube([1, 1, 1]);

        translate(coord2)
        cube([1, 1, 1]);
    }
}

// List of pairs of 3D coordinates
coordinatePairs = [
    [[3, 5, 1], [1, 2, 3]],
    [[-2, 3, 0], [4, 2, 5]],
    // Add more pairs of 3D coordinates as needed
];

// Create hulls around pairs of 3D coordinates
for (pair = coordinatePairs) {
    createHull(pair[0], pair[1]);
}
