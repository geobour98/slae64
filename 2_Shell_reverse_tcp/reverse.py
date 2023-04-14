#!/usr/bin/python

import sys

input = sys.argv[1]

print 'String length: ' + str(len(input))

stringList = [input[i:i+8] for i in range(0, len(input), 8)]

for item in stringList[::-1]:
	print item[::-1] + ' : ' + str(item[::-1].encode('hex'))
