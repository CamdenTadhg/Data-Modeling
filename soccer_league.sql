DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    season_name TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    ranking INTEGER
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    away_team_id INTEGER REFERENCES teams(id) ON DELETE SET NULL,
    season_id INTEGER REFERENCES seasons ON DELETE CASCADE,
    outcome TEXT
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    time TIMESTAMP,
    player_id INTEGER REFERENCES players ON DELETE SET NULL, 
    match_id INTEGER REFERENCES matches ON DELETE SET NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE match_referee
(
    id SERIAL PRIMARY KEY,
    referee_id INTEGER REFERENCES referees,
    match_id INTEGER REFERENCES matches
);