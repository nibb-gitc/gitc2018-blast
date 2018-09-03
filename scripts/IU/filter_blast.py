#!/usr/bin/python

import sys

infile = sys.argv[1]
eval_cutoff = 0.001

f = open(infile)

for line in f:
    line = line.rstrip()
    col = line.split('\t')

    if float(col[10]) <= eval_cutoff:
        print '\t'.join( [col[0], col[1], col[10]] )

