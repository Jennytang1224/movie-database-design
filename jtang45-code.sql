/* datebase creation */

CREATE TABLE Ratings(
userid numeric,
movieid numeric,
rating double precision,
timestamp numeric);

CREATE TABLE Tags(
userid numeric,
movieid numeric,
tag text,
timestamp numeric);

CREATE TABLE Movies(
movieid numeric PRIMARY KEY,
title text, 
year numeric);

CREATE TABLE Users(
userid numeric PRIMARY KEY);

CREATE TABLE genres(
title text);

CREATE TABLE has_genre(
movieid numeric,
genre text);


/* Relations data population */

\copy ratings from 'ratings.txt' (DELIMITER(":")); 

\copy tags from 'tags.csv' (DELIMITER(":"));  

\copy movies from 'movies.csv' (DELIMITER(":")); 

\copy genres from 'genres.txt'

\copy has_genre from 'has_genre.txt' (DELIMITER(":")); 

/*reads the users from the ratings table and adds them to the users table.*/
insert into users(userid) select distinct userid from ratings;

/*reads the *remaining* users from the tags and adds them to the users table.*/
insert into users(userid) select distinct userid from tags where userid not in(select distinct userid from ratings);


/* Relations creation*/
ALTER TABLE ratings add constraint uc foreign key(userid) references users(userid);


/* List your tables*/
\dt

/*Data types of your tables.*/
\d genres
\d movies
\d ratings
\d tags
\d users
\d has_genre

/*Sizes of your tables*/
select count(*) from genres;
select count(*) from movies;
select count(*) from ratings;
select count(*) from tags;
select count(*) from users;
select count(*) from has_genre;

/* Data values */
select * from movies limit 5; 
select count(title) from movies; 
select * from movies order by year desc limit 5;
select * from movies order by year limit 5;
select * from movies order by year limit 5;
select count(year) from movies;
select count(year) from movies where year = 0;
select count(year) from movies where year > 1500;
select movieid from has_genre where genre is null;

/*Find unknown or invalid data in any of the attributes for all of the tables, movies, ratings, tags, users, genres.*/
select genre, count(genre) from has_genre where genre not in (select title from genres) group by genre;


/*Find the distribution of the values for attribute "year" of table "movies".*/
select year, count(year) from movies group by year order by year asc;

/*Find the distribution of the movies across different decades.*/
select decade, count(*) as count from (select floor(year/10) * 10 as decade from movies) as t group by decade order by decade asc;

/*Find the distribution of the genres across the movies.*/
select genre, count(genre) from has_genre where genre in (select title from genres) group by genre;

/*Find the distribution of the ratings values (how many movies were rated with 5, how many with 4, etc.).*/
select rating, count(rating) from ratings group by rating order by rating asc;

/*Find how many movies have no tags, but they have ratings*/
select count(distinct(r.movieid)) from ratings r left join tags t on r.movieid = t.movieid where t.movieid is null;

/*no ratings, but they have tags*/
select count(distinct(t.movieid)) from ratings r right join tags t on r.movieid = t.movieid where r.movieid is null;


/*no tags and no ratings*/
select count(distinct(t.movieid)) from ratings r full outer join tags t on r.movieid = t.movieid where t.movieid not in (select movieid from movies);

/* both tags and ratings*/
select count(distinct(t.movieid)) from ratings r inner join tags t on r.movieid = t.movieid;





