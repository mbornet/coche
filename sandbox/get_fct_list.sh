#!/bin/bash

sed -n '/ATTLIST/s/[ ]*CDATA.*//;s/ *>//;/ATTLIST/s/^.*ATTLIST[ ]*//p' ~/EDF/coche/doc/coche.dtd 

