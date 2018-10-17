#!/bin/bash

if [[ -f $1 ]]; then
    echo "XPI Patcher by reds"
    mkdir "$1_tmp"; cd "$1_tmp";
    unzip ../$1
    sed '/<em:targetApplication>$/,/<\/em:targetApplication/!{//!b};d' install.rdf | sed '/<\/Description>$/,/<\/\/RDF/!{//!b};d' > install_.rdf
    echo "
        <!-- Firefox -->
        <em:targetApplication>
            <Description>
                <em:id>{ec8030f7-c20a-464f-9b0e-13a3a9e97384}</em:id>
                <em:minVersion>1.0</em:minVersion>
                <em:maxVersion>*</em:maxVersion>
            </Description>
        </em:targetApplication>

        <!-- Fennec -->
        <em:targetApplication>
            <Description>
                <em:id>{aa3c5121-dab2-40e2-81ca-7ea25febc110}</em:id>
                <em:minVersion>1.0</em:minVersion>
                <em:maxVersion>*</em:maxVersion>
            </Description>
        </em:targetApplication>

        <!-- SeaMonkey -->
        <em:targetApplication>
            <Description>
                <em:id>{92650c4d-4b8e-4d2a-b7eb-24ecf4f6b63a}</em:id>
                <em:minVersion>1.0</em:minVersion>
                <em:maxVersion>*</em:maxVersion>
            </Description>
        </em:targetApplication>

        <!-- Pale Moon -->
        <em:targetApplication>
            <Description>
                <em:id>{8de7fcbb-c55c-4fbe-bfc5-fc555c87dbc4}</em:id>
                <em:minVersion>1.0</em:minVersion>
                <em:maxVersion>*</em:maxVersion>
            </Description>
        </em:targetApplication>

        <!-- Thunderbird -->
        <em:targetApplication>
            <Description>
                <em:id>{3550f703-e582-4d05-9a08-453d09bdfdc6}</em:id>
                <em:minVersion>1.0</em:minVersion>
                <em:maxVersion>*</em:maxVersion>
            </Description>
        </em:targetApplication>
    </Description>
</RDF>" >> install_.rdf
    mv install_.rdf install.rdf
    zip -u ../$1 install.rdf
    cd ..
    rm -R "$1_tmp"
    echo "Finished!"
elif [[ $1 == "--help" ]]; then
    echo "$1 - Mozilla XPI version patcher"
    echo "Changes addon's version requirements to make it installable on almost any browser"
    echo "Requires zip, unzip and write privilege"
    echo "Usage:"
    echo "$1 <file>"
else
    echo "No such file or directory!"
fi