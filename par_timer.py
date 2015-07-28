# measures the delay between the arrival of par dumps from the scanner and an arbitrary output file from the real time software

from os.path import join
from os.path import exists
from time import time
from operator import sub

total = 10 # number of dumps to measure

#basename = "\\Candi-rtpc\xtc_dumps\0001\"
#basename = "~/Coding/timingtest/"
basename = ""

times_org = [None]*total
times_new = [None]*total

i = 0
j = 0

while (j+i) < (total*2):
	file_path_org = join(basename + 'Dump-' + (str(i).zfill(4)) + '.par')
	file_path_new = join(basename + 'Dump-' + (str(j).zfill(4)) + '.txt')

	if exists(file_path_org):
		times_org[i] = time()
		# print times_org[i]
		i += 1
	if exists(file_path_new):
		times_new[j] = time()
		t_diff = times_new[j] - times_org[j]
		# print file_path_new
		print t_diff
		j += 1
		

#times_diff = map(sub, times_new, times_org)
#print times_diff