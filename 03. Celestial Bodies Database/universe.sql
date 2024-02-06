--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: additional_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.additional_table (
    additional_table_id integer NOT NULL,
    name character varying NOT NULL,
    column1 text,
    column2 character varying,
    column3 boolean,
    column4 integer
);


ALTER TABLE public.additional_table OWNER TO freecodecamp;

--
-- Name: additional_table_additiona_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.additional_table_additiona_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additional_table_additiona_table_id_seq OWNER TO freecodecamp;

--
-- Name: additional_table_additiona_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.additional_table_additiona_table_id_seq OWNED BY public.additional_table.additional_table_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    unique_name character varying,
    size integer,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    unique_name character varying,
    planet_id integer,
    orbit_days integer,
    has_oxygen boolean,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    unique_name character varying,
    star_id integer,
    distance_from_star numeric,
    has_water boolean,
    has_attmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    unique_name character varying,
    galaxy_id integer,
    temperature integer,
    is_main_sequence boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: additional_table additional_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table ALTER COLUMN additional_table_id SET DEFAULT nextval('public.additional_table_additiona_table_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: additional_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.additional_table VALUES (1, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.additional_table VALUES (2, 'B', NULL, NULL, NULL, NULL);
INSERT INTO public.additional_table VALUES (3, 'C', NULL, NULL, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy 1', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Galaxy 2', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Galaxy 3', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Galaxy 4', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Galaxy 5', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Galaxy 6', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Moon 2', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Moon 3', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Moon 4', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Moon 5', NULL, 3, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Moon 6', NULL, 3, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Moon 7', NULL, 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Moon 8', NULL, 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Moon 9', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Moon 10', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Moon 11', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Moon 12', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Moon 13', NULL, 7, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Moon 14', NULL, 7, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Moon 15', NULL, 8, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Moon 16', NULL, 8, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Moon 17', NULL, 9, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Moon 18', NULL, 10, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Moon 19', NULL, 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Moon 20', NULL, 12, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet 1', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Planet 2', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Planet 3', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Planet 4', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Planet 5', NULL, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Planet 6', NULL, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Planet 7', NULL, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Planet 8', NULL, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Planet 9', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Planet 10', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Planet 11', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Planet 12', NULL, 6, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star 1', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Star 2', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Star 3', NULL, 2, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Star 4', NULL, 2, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Star 5', NULL, 3, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Star 6', NULL, 3, NULL, NULL);


--
-- Name: additional_table_additiona_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.additional_table_additiona_table_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: additional_table additional_table_column4_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_column4_key UNIQUE (column4);


--
-- Name: additional_table additional_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_pkey PRIMARY KEY (additional_table_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name_key UNIQUE (unique_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name_key UNIQUE (unique_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name_key UNIQUE (unique_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name_key UNIQUE (unique_name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
