infile='movies.txt'
f = open(infile, 'r')
lines = f.readlines()
id_genre = []
for line in lines:
	movieid = line.split(':')[0]
	genres = line.split(':')[-1]
	genre_list = genres.split('|')
        for genre in genre_list:
		id_genre.append(movieid+':'+genre+'\n')
outfile = 'has_genre.txt'
f = open(outfile, 'w')
for ig in id_genre:
	if "\n\n" in ig:
		f.write(ig[:-1])
	else:
		f.write(ig)
f.close()

