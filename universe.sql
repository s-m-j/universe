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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    ref_galaxy_type_id integer,
    distance_light_years numeric
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
    name character varying(50) NOT NULL,
    planet_id integer,
    description text,
    mass numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_galaxy_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean,
    description text,
    star_id integer,
    mass numeric,
    order_num integer,
    has_atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_id_seq OWNED BY public.planet.planet_id;


--
-- Name: ref_galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ref_galaxy_type (
    ref_galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    dummy text
);


ALTER TABLE public.ref_galaxy_type OWNER TO freecodecamp;

--
-- Name: ref_galaxy_type_ref_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ref_galaxy_type_ref_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_galaxy_type_ref_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: ref_galaxy_type_ref_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ref_galaxy_type_ref_galaxy_type_id_seq OWNED BY public.ref_galaxy_type.ref_galaxy_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer,
    luminocity numeric,
    magnitude integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_galaxy_id_seq'::regclass);


--
-- Name: ref_galaxy_type ref_galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ref_galaxy_type ALTER COLUMN ref_galaxy_type_id SET DEFAULT nextval('public.ref_galaxy_type_ref_galaxy_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Catrwheel', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 1, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganimed', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Metida', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Adrastea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Teba', 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Almatea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Ymir', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Paaliaq', 6, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Tarvos', 6, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Ijiraq', 6, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Suttung', 6, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Kiwiq', 6, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Siarnaq', 6, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Thrymr', 6, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Triton', 7, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Nereid', 7, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, 1, NULL, NULL, true);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, 1, NULL, NULL, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, 1, NULL, NULL, true);
INSERT INTO public.planet VALUES (10, 'Kepler-69c', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-62b', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Kepler-62f', NULL, NULL, 7, NULL, NULL, NULL);


--
-- Data for Name: ref_galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ref_galaxy_type VALUES (1, 'spiral', NULL);
INSERT INTO public.ref_galaxy_type VALUES (2, 'elliptical', NULL);
INSERT INTO public.ref_galaxy_type VALUES (3, 'irregular', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centaurus', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Altair', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Arcturus', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Vega', NULL, 1, NULL, NULL);
INSERT INTO public.star VALUES (7, 'Kepler-69', NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_galaxy_id_seq', 21, true);


--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_id_seq', 13, true);


--
-- Name: ref_galaxy_type_ref_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ref_galaxy_type_ref_galaxy_type_id_seq', 3, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: ref_galaxy_type ref_galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ref_galaxy_type
    ADD CONSTRAINT ref_galaxy_type_name_key UNIQUE (name);


--
-- Name: ref_galaxy_type ref_galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ref_galaxy_type
    ADD CONSTRAINT ref_galaxy_type_pkey PRIMARY KEY (ref_galaxy_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon uniq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uniq_name UNIQUE (planet_id, name);


--
-- Name: planet uniq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniq_planet_name UNIQUE (star_id, name);


--
-- Name: star uniq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uniq_star_name UNIQUE (galaxy_id, name);


--
-- Name: galaxy galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_fkey FOREIGN KEY (ref_galaxy_type_id) REFERENCES public.ref_galaxy_type(ref_galaxy_type_id);


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

