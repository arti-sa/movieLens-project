-- Database: movies_db

-- DROP DATABASE IF EXISTS movies_db;

CREATE DATABASE movies_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;



-- SCHEMA: public

-- DROP SCHEMA IF EXISTS public ;

CREATE SCHEMA IF NOT EXISTS public
    AUTHORIZATION postgres;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT ALL ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO postgres;



-- Table: public.movie

-- DROP TABLE IF EXISTS public.movie;

CREATE TABLE IF NOT EXISTS public.movie
(
    "movieId" bigint,
    title text COLLATE pg_catalog."default",
    genres text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movie
    OWNER to postgres;



-- Table: public.rating

-- DROP TABLE IF EXISTS public.rating;

CREATE TABLE IF NOT EXISTS public.rating
(
    "userId" bigint,
    "movieId" bigint,
    rating double precision,
    "timestamp" text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.rating
    OWNER to postgres;



-- Table: public.tag

-- DROP TABLE IF EXISTS public.tag;

CREATE TABLE IF NOT EXISTS public.tag
(
    "userId" bigint,
    "movieId" bigint,
    tag text COLLATE pg_catalog."default",
    "timestamp" text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tag
    OWNER to postgres;
