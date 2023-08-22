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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_of_guesses integer DEFAULT 0 NOT NULL,
    secret_number integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 886, 885, 4);
INSERT INTO public.games VALUES (2, 965, 964, 4);
INSERT INTO public.games VALUES (3, 936, 935, 5);
INSERT INTO public.games VALUES (4, 457, 456, 5);
INSERT INTO public.games VALUES (5, 843, 840, 4);
INSERT INTO public.games VALUES (6, 252, 250, 4);
INSERT INTO public.games VALUES (7, 805, 804, 4);
INSERT INTO public.games VALUES (8, 316, 315, 6);
INSERT INTO public.games VALUES (9, 903, 902, 6);
INSERT INTO public.games VALUES (10, 512, 511, 7);
INSERT INTO public.games VALUES (11, 565, 564, 7);
INSERT INTO public.games VALUES (12, 605, 602, 6);
INSERT INTO public.games VALUES (13, 669, 667, 6);
INSERT INTO public.games VALUES (14, 605, 604, 6);
INSERT INTO public.games VALUES (15, 403, 402, 8);
INSERT INTO public.games VALUES (16, 265, 264, 8);
INSERT INTO public.games VALUES (17, 911, 910, 9);
INSERT INTO public.games VALUES (18, 376, 375, 9);
INSERT INTO public.games VALUES (19, 485, 482, 8);
INSERT INTO public.games VALUES (20, 521, 519, 8);
INSERT INTO public.games VALUES (21, 132, 131, 8);
INSERT INTO public.games VALUES (22, 612, 611, 10);
INSERT INTO public.games VALUES (23, 792, 791, 10);
INSERT INTO public.games VALUES (24, 195, 194, 11);
INSERT INTO public.games VALUES (25, 351, 350, 11);
INSERT INTO public.games VALUES (26, 943, 940, 10);
INSERT INTO public.games VALUES (27, 571, 569, 10);
INSERT INTO public.games VALUES (28, 555, 554, 10);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'hi');
INSERT INTO public.players VALUES (2, 'user_1692713841533');
INSERT INTO public.players VALUES (3, 'user_1692713841532');
INSERT INTO public.players VALUES (4, 'user_1692714478753');
INSERT INTO public.players VALUES (5, 'user_1692714478752');
INSERT INTO public.players VALUES (6, 'user_1692714500248');
INSERT INTO public.players VALUES (7, 'user_1692714500247');
INSERT INTO public.players VALUES (8, 'user_1692714555242');
INSERT INTO public.players VALUES (9, 'user_1692714555241');
INSERT INTO public.players VALUES (10, 'user_1692714583963');
INSERT INTO public.players VALUES (11, 'user_1692714583962');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 28, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

