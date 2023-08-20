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
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30),
    planets_count integer,
    x integer
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
    name character varying(30),
    radius_in_hundred_kms numeric(5,1),
    x integer NOT NULL,
    y integer,
    planet_id integer
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
    name character varying(30),
    description text NOT NULL,
    has_life_on_it boolean,
    i integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    is_active boolean,
    galaxy_id integer,
    x integer
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
-- Name: stars_in_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stars_in_galaxy (
    balabizo text NOT NULL,
    mamamizo text NOT NULL,
    stars_in_galaxy_id integer NOT NULL,
    name character varying(30),
    yala boolean
);


ALTER TABLE public.stars_in_galaxy OWNER TO freecodecamp;

--
-- Name: stars_in_galaxy_pkk_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_in_galaxy_pkk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_in_galaxy_pkk_seq OWNER TO freecodecamp;

--
-- Name: stars_in_galaxy_pkk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_in_galaxy_pkk_seq OWNED BY public.stars_in_galaxy.stars_in_galaxy_id;


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
-- Name: stars_in_galaxy stars_in_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_in_galaxy ALTER COLUMN stars_in_galaxy_id SET DEFAULT nextval('public.stars_in_galaxy_pkk_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 2, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 3, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 4, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 5, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 6, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, NULL, 1, NULL, 1);
INSERT INTO public.moon VALUES (2, NULL, NULL, 2, NULL, 1);
INSERT INTO public.moon VALUES (3, NULL, NULL, 3, NULL, 1);
INSERT INTO public.moon VALUES (4, NULL, NULL, 4, NULL, 1);
INSERT INTO public.moon VALUES (5, NULL, NULL, 5, NULL, 1);
INSERT INTO public.moon VALUES (6, NULL, NULL, 6, NULL, 1);
INSERT INTO public.moon VALUES (7, NULL, NULL, 7, NULL, 1);
INSERT INTO public.moon VALUES (8, NULL, NULL, 8, NULL, 1);
INSERT INTO public.moon VALUES (9, NULL, NULL, 9, NULL, 1);
INSERT INTO public.moon VALUES (10, NULL, NULL, 10, NULL, 1);
INSERT INTO public.moon VALUES (11, NULL, NULL, 11, NULL, 1);
INSERT INTO public.moon VALUES (12, NULL, NULL, 12, NULL, 1);
INSERT INTO public.moon VALUES (13, NULL, NULL, 13, NULL, 1);
INSERT INTO public.moon VALUES (14, NULL, NULL, 14, NULL, 1);
INSERT INTO public.moon VALUES (15, NULL, NULL, 15, NULL, 1);
INSERT INTO public.moon VALUES (16, NULL, NULL, 16, NULL, 1);
INSERT INTO public.moon VALUES (17, NULL, NULL, 17, NULL, 1);
INSERT INTO public.moon VALUES (18, NULL, NULL, 18, NULL, 1);
INSERT INTO public.moon VALUES (19, NULL, NULL, 19, NULL, 1);
INSERT INTO public.moon VALUES (191, NULL, NULL, 191, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'a', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (2, 'b', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (3, 'c', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (4, 'd', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (5, 'e', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (6, 'f', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (7, 'g', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (8, 'h', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (9, 'i', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (10, 'j', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (11, 'k', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (12, 'l', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (13, 'm', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (14, 'n', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (15, 'o', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (16, 'p', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (17, 'q', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (18, 'r', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (19, 's', 'aa', false, 1, 1);
INSERT INTO public.planet VALUES (20, 't', 'aa', false, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a', true, 1, 1);
INSERT INTO public.star VALUES (2, 'a', true, 1, 2);
INSERT INTO public.star VALUES (3, 'a', true, 1, 3);
INSERT INTO public.star VALUES (4, 'a', true, 1, 4);
INSERT INTO public.star VALUES (5, 'a', true, 1, 5);
INSERT INTO public.star VALUES (6, 'a', true, 1, 6);


--
-- Data for Name: stars_in_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stars_in_galaxy VALUES ('1', '1', 1, NULL, NULL);
INSERT INTO public.stars_in_galaxy VALUES ('12', '12', 12, NULL, NULL);
INSERT INTO public.stars_in_galaxy VALUES ('123', '123', 123, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: stars_in_galaxy_pkk_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_in_galaxy_pkk_seq', 1, false);


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
-- Name: moon moon_x_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_x_key UNIQUE (x);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_x_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_x_key UNIQUE (x);


--
-- Name: stars_in_galaxy stars_in_galaxy_balabizo_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_in_galaxy
    ADD CONSTRAINT stars_in_galaxy_balabizo_key UNIQUE (balabizo);


--
-- Name: stars_in_galaxy stars_in_galaxy_mamamizo_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_in_galaxy
    ADD CONSTRAINT stars_in_galaxy_mamamizo_key UNIQUE (mamamizo);


--
-- Name: stars_in_galaxy stars_in_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_in_galaxy
    ADD CONSTRAINT stars_in_galaxy_pkey PRIMARY KEY (stars_in_galaxy_id);


--
-- Name: star fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon foreignkeey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT foreignkeey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

