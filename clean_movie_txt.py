infile='movies.txt'
f = open(infile, 'r')
lines = f.readlines()
movies = []
for line in lines:
	movieid = line.split(':')[0]
	genres = line.split(':')[-1]
	n = len(line.split(':'))
	title_year = line.split(':')[1:n-1]
	title_year = ''.join(title_year)
	print("title_year: " + title_year)
	if len(title_year.split('(',4)) == 5:
		year = title_year.split('(',4)[4]
		title_lst = title_year.split('(',4)[:4]
		title = "(".join(title_lst)
	elif len(title_year.split('(',3)) == 4:
		year = title_year.split('(',3)[3]
		title_lst = title_year.split('(',3)[:3]
		title = "(".join(title_lst)
	elif len(title_year.split('(',2)) == 3:
		year = title_year.split('(',2)[2]
		title_lst = title_year.split('(',2)[:2]
	        title = "(".join(title_lst)
	elif len(title_year.split('(',2)) == 2:
		title = title_year.split('(',2)[0]
		year = title_year.split('(',2)[1]
    	year = year.replace(')','')
	title = title.rstrip(' ')
	year = year.rstrip(' ')
	print(movieid+':'+title+':'+year)
	movies.append(movieid+':'+title+':'+year+'\n')
outfile = 'movies.csv'
f = open(outfile, 'w')
for movie in movies:
	f.write(movie)
f.close()

