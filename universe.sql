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
    name character varying(40) NOT NULL,
    galaxy_type text,
    description text,
    age_in_millions_of_years integer
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
    name character varying(40) NOT NULL,
    description text,
    distance_from_planet integer,
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
    name character varying(40) NOT NULL,
    planet_type text,
    description text,
    has_life boolean,
    surface_gravity numeric(6,3),
    star_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    star_type text,
    description text,
    age_in_millions_of_years integer,
    has_life boolean,
    galaxy_id integer NOT NULL
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
-- Name: subsatellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.subsatellite (
    subsatellite_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    distance_from_moon integer,
    moon_id integer NOT NULL
);


ALTER TABLE public.subsatellite OWNER TO freecodecamp;

--
-- Name: subsatellite_subsatellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.subsatellite_subsatellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subsatellite_subsatellite_id_seq OWNER TO freecodecamp;

--
-- Name: subsatellite_subsatellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.subsatellite_subsatellite_id_seq OWNED BY public.subsatellite.subsatellite_id;


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
-- Name: subsatellite subsatellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.subsatellite ALTER COLUMN subsatellite_id SET DEFAULT nextval('public.subsatellite_subsatellite_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 'The Galaxy that includes the Solar System, us', 13600);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Spiral', 'Nearest Galaxy to the Milky Way, expected to collide with it in ~ 4-5 billion years', 10000);
INSERT INTO public.galaxy VALUES (4, 'Baby Boom', 'Starburst', 'Brightest starburst galaxy record holder', NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular', 'Predicted to merge with the Milky Way in ~2.4 billion years', 1101);
INSERT INTO public.galaxy VALUES (6, 'Canis Major Overdensity', 'Irregular', 'Thought to be the closest neighboring galaxy to Earth', NULL);
INSERT INTO public.galaxy VALUES (7, 'Backward Galaxy', 'Unbarred Spiral', 'Appears to rotate backwards', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Our moon', 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Closer to its planet than any other known planetary moon', 6000, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars'' smaller, outermost moon', 23460, 4);
INSERT INTO public.moon VALUES (4, 'Metis', 'Jupiter inner moon', 128000, 5);
INSERT INTO public.moon VALUES (5, 'Adrastea', 'Jupiter inner moon', 129000, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'Jupiter inner moon', 181400, 5);
INSERT INTO public.moon VALUES (7, 'Thebe', 'Jupiter inner moon', 221900, 5);
INSERT INTO public.moon VALUES (8, 'Io', 'Galilean moon, highest density of any moon', 421800, 5);
INSERT INTO public.moon VALUES (9, 'Europa', 'Galilean moon, smallest of the four', 671100, 5);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'Galilean moon, largest and most massive of the Solar System''s moons', 1070400, 5);
INSERT INTO public.moon VALUES (11, 'Callisto', 'Galilean moon, third largest in the Solar System', 1882700, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 'Largest moon of Saturn, second largest in the Solar System. Only known other object in space with clear evidence of surface liquid', 1221870, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Mostly covered in fresh, clean ice, making it one of the most reflective bodies in the Solar System', 237948, 6);
INSERT INTO public.moon VALUES (14, 'Phoebe', 'First target encountered by the Cassini spacecraft, making it unusually well-studied', 12960000, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Smallest and innermost of Uranus'' five round satellites', 129390, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'Largest moon of Uranus', 435910, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Outermost major moon of Uranus, surface level comparable to that of Australia', 583520, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Largest moon of Neptune, its first to be discovered', 354759, 8);
INSERT INTO public.moon VALUES (19, 'Hyperion', 'First non-round moon to be discovered, distinguished by its chaotic rotation and sponge-like appearance', 1481009, 6);
INSERT INTO public.moon VALUES (20, 'Rhea', 'Second largest moon of Saturn', 527070, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 'Smallest planet in the Solar System, closest to the Sun', false, 3.700, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 'Sometimes called Earth''s "sister" or "twin" due to similar composition', false, 8.870, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 'Home', true, 9.807, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 'Second smallest planet in the Solar System, larger only than Mercury', false, 3.720, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 'Fifth planet in the Solar System, and largest of them all, with a mass 2.5 times larger than all the other planets in the system combined', false, 24.790, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 'Most notable for its ring system', false, 10.440, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 'Most notable for its funny name', false, 8.690, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 'Only planet in the system found by mathematical prediciton rather than empirical observation', false, 11.150, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Super Earth Exoplanet', 'One of the three closest known exoplanets', false, NULL, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 'Exoplanet', 'One of the lightest exoplanets ever found', false, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', 'Exoplanet', 'Currently disputed as to its existence', false, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Pluto', 'Dwarf', 'Used to be considered the ninth planet of our Solar System, but it has since been downgraded to a "dwarf planet"', false, 0.620, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 'The most important source of energy for life on Earth', 4603, true, 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 'Nearest known star to the Sun', 4853, false, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'Binary', 'Brightest star in the sky, made up of Sirius A and Sirius B', 247, false, 2);
INSERT INTO public.star VALUES (4, 'Alpheratz', 'Binary', 'Brightest star in the Andromeda constellation', 60, false, 3);
INSERT INTO public.star VALUES (5, 'Mirach', 'Red Giant', 'Used by stargazers to find the Andromeda Galaxy', NULL, false, 3);
INSERT INTO public.star VALUES (6, 'LMC195-1', 'Wolf-Rayet', 'Extremely rare, and probably one of the hottest stars known', NULL, false, 5);


--
-- Data for Name: subsatellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.subsatellite VALUES (1, 'CAPSTONE', 'Lunar orbiter that will test and verify the orbital stability for the Lunar Gateway space station', 1500, 1);
INSERT INTO public.subsatellite VALUES (2, 'LunIR', 'Nanosatellite launched to the Moon collecting surface spectroscopy and thermography', NULL, 1);
INSERT INTO public.subsatellite VALUES (3, 'Lunar IceCube', 'NASA nanosatellite for prospecting, locating and estimating amount and composition of water ice deposits on the Moon', 100, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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
-- Name: subsatellite_subsatellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.subsatellite_subsatellite_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: subsatellite subsatellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.subsatellite
    ADD CONSTRAINT subsatellite_name_key UNIQUE (name);


--
-- Name: subsatellite subsatellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.subsatellite
    ADD CONSTRAINT subsatellite_pkey PRIMARY KEY (subsatellite_id);


--
-- Name: star galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: subsatellite subsatellite_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.subsatellite
    ADD CONSTRAINT subsatellite_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- PostgreSQL database dump complete
--

