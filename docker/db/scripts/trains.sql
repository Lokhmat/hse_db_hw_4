CREATE SCHEMA IF NOT EXISTS trains;

CREATE TABLE IF NOT EXISTS trains.city (
    city_region TEXT,
    city_name TEXT,
    PRIMARY KEY (city_region, city_name)
);

CREATE TABLE IF NOT EXISTS trains.station (
    station_name TEXT PRIMARY KEY,
    num_of_tracks INTEGER NOT NULL,
    city_name TEXT NOT NULL,
    city_region TEXT NOT NULL,
    FOREIGN KEY (city_name, city_region) REFERENCES trains.city(city_name, city_region)
);

CREATE TABLE IF NOT EXISTS trains.train (
    train_id VARCHAR(36) PRIMARY KEY,
    train_length DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS trains.voyage (
    voyage_id VARCHAR(36) PRIMARY KEY,
    voyage_start_station_name TEXT NOT NULL REFERENCES trains.station(station_name),
    voyage_end_station_name TEXT NOT NULL REFERENCES trains.station(station_name),
    departure TIMESTAMPTZ NOT NULL,
    arrival TIMESTAMPTZ NOT NULL,
    train_id VARCHAR(36) NOT NULL REFERENCES trains.train(train_id)
);