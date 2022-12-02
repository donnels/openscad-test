#!/usr/bin/env bash
#Create an index of the scad files and pngs

rm -f index.adoc 2>/dev/null

#the loop to create the index
for directory in */
do
    cd $directory
    dirDescription="description.txt"       
    if [[ -f "$dirDescription" ]]; then
        dirDescriptionText="$(cat $dirDescription)"
    else
        unset dirDescriptionText
    fi
    cat >>index.adoc <<_EOF_

=== Project - $directory

$dirDescriptionText

_EOF_

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

        cat >>../index.adoc <<_EOF_

+=== Object - ${short}

$descriptionText

.image
image::./openscad/${directory}/${short}.png[]

.Openscad source
----
include::./${directory}/${file}[]
----

_EOF_

    done
    cd -
done