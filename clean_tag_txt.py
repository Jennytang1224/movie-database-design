infile='tags.txt'
f = open(infile, 'r')
lines = f.readlines()
tags = []
for line in lines:
	user = line.split(':')[0]
	movie = line.split(':')[1]
	time = line.split(':')[-1]
        n = len(line.split(':'))
	tag = line.split(':')[2:n-1]
	tag = ''.join(tag)
	# need to remove ':' symbols
	# from tags so the demiliter is not confused
	tag = tag.replace(':','')
	tags.append(user+':'+movie+':'+tag+':'+time)
outfile = 'tags.csv'
f = open(outfile, 'w')
for tag in tags:
	f.write(tag)
f.close()

