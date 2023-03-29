
# Design, Load and Explore a Movies database

### Full Name: 
Jenny Tang
### Date: 
3/25/2023
### Course No and Title: 
CS 333 Intro to Database Systems
### Title of the project: 
Design, Load and Explore a Movies database

## Files 

- readme file to explain the project

- Jtang45-project-report.pdf: project report

- jtang45-code.sql: all required sql scripts
    ** to run the script:       
        createdb moviesdb_test 
        psql -d moviesdb_test -a -f jtang45-code.sql

- jtang45-code-results.pdf: results from running jtang45-code.sql file

- movies.txt: original movie file.  Each line of this file represents one movie, and has the following format:
        *MovieID::Title::Genres*

- movies.csv: cleaned movie file using clean_movie_txt.py

- ratings.txt: original ratings file. Each line of this file represents one rating of one movie by one user, and has the following format:
        *UserID::MovieID::Rating::Timestamp*

- tags.txt: original tags file. Each line of this file represents one tag applied to one movie by one user, and has the following format:
        *UserID::MovieID::Tag::Timestamp*

- tags.csv: cleaned movie file using clean_tag_txt.py

- genres.csv: a list of 19 genres, copied from the given list

- has_genre.txt: a flattened file shows movie id and corresponding genres, gerenated by generate_has_genre_txt.py

- clean_movie_txt.py: python script to clean movie file

- clean_tag_txt.py: python script to clean tag file

- generate_has_genre_txt.py: python script to generate has_genre.txt file

    ** to run the .py files: copy the python script, and start *ipython* kernal, paste the script to the kernal then run it. the script will generate the new cleaned file in the same directory


