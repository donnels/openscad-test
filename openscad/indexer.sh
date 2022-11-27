#!/usr/bin/env bash
#Create an index of the scad files and pngs

rm -f index.adoc 2>/dev/null

#the loop to create the index
ls *.scad |while read file
do 
    short=$(basename -s .scad $file)
    echo "long: $file short: $short"
    description="${short}.txt"
    if [[ -f "$description" ]]; then
        descriptionText="$(cat $description)"
    else
        unset descriptionText
    fi

    cat >>index.adoc <<_EOF_

=== Object - ${short}

$descriptionText

.image
image::./openscad/${short}.png[]

.Openscad source
----
include::./${file}[]
----

_EOF_

done