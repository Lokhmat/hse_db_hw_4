CREATE schema IF NOT EXISTS hospital;

CREATE TABLE IF NOT EXISTS hospital.station (
    station_id VARCHAR(36) PRIMARY KEY,
    station_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS hospital.station_personell (
    pers_id VARCHAR(36) PRIMARY KEY,
    pers_name TEXT NOT NULL,
    station_id VARCHAR(36) NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.doctor (
    pers_id VARCHAR(36) PRIMARY KEY,
    pers_name TEXT NOT NULL,
    area TEXT NOT NULL,
    doctor_rank INTEGER NOT NULL,
    station_id VARCHAR(36) NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.caregiver (
    pers_id VARCHAR(36) PRIMARY KEY,
    pers_name TEXT NOT NULL,
    qualification TEXT NOT NULL,
    station_id VARCHAR(36) NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.room (
    room_id VARCHAR(36) PRIMARY KEY,
    num_of_beds INTEGER NOT NULL,
    station_id VARCHAR(36) NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.patient (
    patient_id VARCHAR(36) PRIMARY KEY,
    patient_name TEXT NOT NULL,
    disease TEXT NOT NULL,
    doctor_id VARCHAR(36) NOT NULL REFERENCES hospital.doctor(pers_id),
    room_id VARCHAR(36) NOT NULL REFERENCES hospital.room(room_id),
    occupied_from TIMESTAMPTZ NOT NULL,
    occupied_to TIMESTAMPTZ NOT NULL
);