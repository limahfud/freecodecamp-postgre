--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    name character varying(100) NOT NULL,
    description text NOT NULL,
    is_in_north boolean,
    is_in_west boolean,
    diameter integer,
    population integer,
    area numeric(16,6),
    planet_id integer,
    continent_id integer NOT NULL
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: continents_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.continents_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continents_continent_id_seq OWNER TO freecodecamp;

--
-- Name: continents_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.continents_continent_id_seq OWNED BY public.continent.continent_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    is_dark boolean,
    diameter integer,
    mass integer,
    distance_from_earth numeric(16,6)
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
    name character varying(100) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    is_dark boolean,
    diameter integer,
    mass integer,
    distance_from_earth numeric(10,4),
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
    name character varying(100) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    is_dark boolean,
    diameter integer,
    mass integer,
    distance_from_earth numeric(10,4),
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
    name character varying(100) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    is_dark boolean,
    diameter integer,
    mass integer,
    distance_from_earth numeric(10,4),
    galaxy_id integer
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
-- Name: continent continent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent ALTER COLUMN continent_id SET DEFAULT nextval('public.continents_continent_id_seq'::regclass);


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
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES ('Africa', 'Second largest continent by both land area and population.', false, false, 8000, 1340000, 30000.000000, 1, 1);
INSERT INTO public.continent VALUES ('Antarctica', 'Earths southernmost continent, containing the geographic South Pole.', true, false, 4500, 1106, 14000.000000, 1, 2);
INSERT INTO public.continent VALUES ('Asia', 'Largest continent by both land area and population.', true, false, 8700, 54775, 445000.000000, 1, 3);
INSERT INTO public.continent VALUES ('Europe', 'Second smallest continent by surface area.', true, true, 3800, 636026, 100000.000000, 1, 4);
INSERT INTO public.continent VALUES ('North America', 'Third largest continent by area.', true, true, 5000, 72212, 24700.000000, 1, 5);
INSERT INTO public.continent VALUES ('Australia', 'Smallest continent and one of the largest countries on Earth.', true, true, 3000, 256, 8000.000000, 1, 6);
INSERT INTO public.continent VALUES ('South America', 'Home to the Amazon Rainforest and the Andes mountains.', false, true, 4500, 43075, 1780.000000, 1, 7);
INSERT INTO public.continent VALUES ('Zealandia', 'A nearly submerged continental fragment in the southwest Pacific Ocean.', true, false, 1500, 5000, 40000.000000, 1, 8);
INSERT INTO public.continent VALUES ('Eurasia', 'A combined continental landmass of Europe and Asia.', true, false, 10000, 216000, 55000.000000, 1, 9);
INSERT INTO public.continent VALUES ('Atlantis', 'A mythical continent said to have sunk into the ocean.', true, false, 4000, 0, 120000.000000, 1, 10);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the Solar System.', true, false, 100000, 1500000, 0.000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', true, false, 220000, 2500000, 2537000.000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group.', true, false, 60000, 500000, 3000000.000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A grand-design spiral galaxy with a Seyfert 2 nucleus.', true, false, 76000, 160000, 23000000.000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'An unbarred spiral galaxy in the constellation Virgo.', true, false, 49000, 800000, 29000000.000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy in the Virgo Cluster.', false, true, 98000, 1200000, 53000000.000000);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'A peculiar galaxy with a supermassive black hole at its center.', true, true, 60000, 500000, 13000000.000000);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel', 'A face-on spiral galaxy in the constellation Ursa Major.', true, false, 170000, 1200000, 21000000.000000);
INSERT INTO public.galaxy VALUES (9, 'Black Eye', 'A spiral galaxy with a dark band of absorbing dust in front of its bright nucleus.', true, true, 50000, 900000, 17000000.000000);
INSERT INTO public.galaxy VALUES (10, 'Cartwheel', 'A lenticular galaxy and ring galaxy in the constellation Sculptor.', true, false, 150000, 1100000, 500000000.000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (19, 'Luna', 'Earths moon, fifth largest moon in the solar system', true, false, 3474, 20, 0.0026, 21);
INSERT INTO public.moon VALUES (20, 'Io', 'A moon of Jupiter, has active volcanoes', true, false, 3643, 20, 5.9000, 22);
INSERT INTO public.moon VALUES (21, 'Europa', 'A moon of Jupiter, has a subsurface ocean', true, false, 3122, 20, 6.7100, 22);
INSERT INTO public.moon VALUES (22, 'Ganymede', 'A moon of Jupiter, largest moon in the solar system', true, false, 5268, 14812, 10.7000, 22);
INSERT INTO public.moon VALUES (23, 'Callisto', 'A moon of Jupiter, heavily cratered', true, false, 4821, 10812, 18.8000, 22);
INSERT INTO public.moon VALUES (24, 'Mimas', 'A moon of Saturn, has a large crater named Herschel', true, false, 396, 20, 65.6000, 23);
INSERT INTO public.moon VALUES (25, 'Enceladus', 'A moon of Saturn, has geysers near the south pole', true, false, 504, 20, 122.4000, 23);
INSERT INTO public.moon VALUES (26, 'Tethys', 'A moon of Saturn, has a large crater named Odysseus', true, false, 1062, 20, 294.6000, 23);
INSERT INTO public.moon VALUES (27, 'Dione', 'A moon of Saturn, has a large crater named Evander', true, false, 1123, 109512, 377.4000, 23);
INSERT INTO public.moon VALUES (28, 'Rhea', 'A moon of Saturn, second largest moon of Saturn', true, false, 1528, 230212, 527.1000, 23);
INSERT INTO public.moon VALUES (29, 'Titan', 'A moon of Saturn, has a thick atmosphere', true, false, 5150, 1345, 1221.8000, 23);
INSERT INTO public.moon VALUES (30, 'Iapetus', 'A moon of Saturn, has a two-tone surface', true, false, 1470, 1812, 3561.3000, 23);
INSERT INTO public.moon VALUES (31, 'Pandora', 'A moon of Saturn, orbits just outside the F ring', true, false, 81, 20, 141700.0000, 24);
INSERT INTO public.moon VALUES (32, 'Prometheus', 'A moon of Saturn, orbits just inside the F ring', true, false, 86, 20, 139300.0000, 24);
INSERT INTO public.moon VALUES (33, 'Atlas', 'A moon of Saturn, orbits just outside the A ring', true, false, 32, 20, 137600.0000, 24);
INSERT INTO public.moon VALUES (34, 'Pan', 'A moon of Saturn, orbits in the Encke Gap of the A ring', true, false, 26, 20, 133500.0000, 24);
INSERT INTO public.moon VALUES (35, 'Janus', 'A moon of Saturn, orbits just outside the A ring', true, false, 179, 20, 151400.0000, 24);
INSERT INTO public.moon VALUES (36, 'Epimetheus', 'A moon of Saturn, orbits just inside the A ring', true, false, 116, 20, 151400.0000, 24);
INSERT INTO public.moon VALUES (38, 'Twin Luna', 'Earths moon, fifth largest moon in the solar system', true, false, 3474, 20, 0.0026, 21);
INSERT INTO public.moon VALUES (39, 'Twin Io', 'A moon of Jupiter, has active volcanoes', true, false, 3643, 20, 5.9000, 22);
INSERT INTO public.moon VALUES (40, 'Twin Europa', 'A moon of Jupiter, has a subsurface ocean', true, false, 3122, 20, 6.7100, 22);
INSERT INTO public.moon VALUES (41, 'Twin Ganymede', 'A moon of Jupiter, largest moon in the solar system', true, false, 5268, 14812, 10.7000, 22);
INSERT INTO public.moon VALUES (42, 'Twin Callisto', 'A moon of Jupiter, heavily cratered', true, false, 4821, 10812, 18.8000, 22);
INSERT INTO public.moon VALUES (43, 'Twin Mimas', 'A moon of Saturn, has a large crater named Herschel', true, false, 396, 20, 65.6000, 23);
INSERT INTO public.moon VALUES (44, 'Twin Enceladus', 'A moon of Saturn, has geysers near the south pole', true, false, 504, 20, 122.4000, 23);
INSERT INTO public.moon VALUES (45, 'Twin Tethys', 'A moon of Saturn, has a large crater named Odysseus', true, false, 1062, 20, 294.6000, 23);
INSERT INTO public.moon VALUES (46, 'Twin Dione', 'A moon of Saturn, has a large crater named Evander', true, false, 1123, 109512, 377.4000, 23);
INSERT INTO public.moon VALUES (47, 'Twin Rhea', 'A moon of Saturn, second largest moon of Saturn', true, false, 1528, 230212, 527.1000, 23);
INSERT INTO public.moon VALUES (48, 'Twin Titan', 'A moon of Saturn, has a thick atmosphere', true, false, 5150, 1345, 1221.8000, 23);
INSERT INTO public.moon VALUES (49, 'Twin Iapetus', 'A moon of Saturn, has a two-tone surface', true, false, 1470, 1812, 3561.3000, 23);
INSERT INTO public.moon VALUES (50, 'Twin Pandora', 'A moon of Saturn, orbits just outside the F ring', true, false, 81, 20, 141700.0000, 24);
INSERT INTO public.moon VALUES (51, 'Twin Prometheus', 'A moon of Saturn, orbits just inside the F ring', true, false, 86, 20, 139300.0000, 24);
INSERT INTO public.moon VALUES (52, 'Twin Atlas', 'A moon of Saturn, orbits just outside the A ring', true, false, 32, 20, 137600.0000, 24);
INSERT INTO public.moon VALUES (53, 'Twin Pan', 'A moon of Saturn, orbits in the Encke Gap of the A ring', true, false, 26, 20, 133500.0000, 24);
INSERT INTO public.moon VALUES (54, 'Twin Janus', 'A moon of Saturn, orbits just outside the A ring', true, false, 179, 20, 151400.0000, 24);
INSERT INTO public.moon VALUES (55, 'Twin Epimetheus', 'A moon of Saturn, orbits just inside the A ring', true, false, 116, 20, 151400.0000, 24);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (20, 'Mercury', 'Smallest planet in the solar system', true, false, 4879, 330, 57.9000, 1);
INSERT INTO public.planet VALUES (21, 'Venus', 'Second planet from the sun, similar size to Earth', true, true, 12104, 4868, 108.2000, 2);
INSERT INTO public.planet VALUES (22, 'Earth', 'Our home planet, third from the sun', true, false, 12742, 5972, 0.0000, 3);
INSERT INTO public.planet VALUES (23, 'Mars', 'The red planet, fourth from the sun', true, false, 6779, 642, 54.6000, 4);
INSERT INTO public.planet VALUES (24, 'Jupiter', 'Largest planet in the solar system, fifth from the sun', true, false, 139820, 1898, 628.7000, 5);
INSERT INTO public.planet VALUES (25, 'Saturn', 'Second largest planet, sixth from the sun, has rings', true, false, 116460, 568, 1087.4000, 6);
INSERT INTO public.planet VALUES (26, 'Uranus', 'An ice giant, seventh from the sun', true, false, 50724, 87, 2979.2000, 7);
INSERT INTO public.planet VALUES (27, 'Neptune', 'An ice giant, eighth from the sun', true, false, 49244, 102, 3007.6000, 8);
INSERT INTO public.planet VALUES (28, 'Pluto', 'Dwarf planet, ninth from the sun', true, true, 2376, 13, 4467.8000, 9);
INSERT INTO public.planet VALUES (29, 'Haumea', 'Dwarf planet, 10th from the sun', true, false, 1150, 4, 6450.0000, 1);
INSERT INTO public.planet VALUES (30, 'Makemake', 'Dwarf planet, 11th from the sun', true, false, 1430, 11, 5885.0000, 1);
INSERT INTO public.planet VALUES (31, 'Eris', 'Dwarf planet, 12th from the sun', true, false, 2326, 17, 10170.0000, 2);
INSERT INTO public.planet VALUES (32, 'Ceres', 'Dwarf planet, in the asteroid belt', true, false, 975, 1, 385.0000, 1);
INSERT INTO public.planet VALUES (33, 'Pallas', 'Asteroid, second largest in the asteroid belt', true, false, 544, 0, 430.0000, 2);
INSERT INTO public.planet VALUES (34, 'Vesta', 'Asteroid, third largest in the asteroid belt', true, false, 525, 0, 257.0000, 3);
INSERT INTO public.planet VALUES (35, 'Hygiea', 'Asteroid, fourth largest in the asteroid belt', true, false, 440, 0, 350.0000, 4);
INSERT INTO public.planet VALUES (36, 'Theia', 'Hypothetical planet, may have collided with Earth', true, false, 9000, 3000, 0.0000, 5);
INSERT INTO public.planet VALUES (37, 'Phoebe', 'Moon of Saturn, discovered in 1898', true, true, 210, 0, 12900.0000, 6);
INSERT INTO public.planet VALUES (38, 'Janus', 'Moon of Saturn, discovered in 1966', true, false, 179, 0, 14000.0000, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 'The closest known star to the Sun.', true, false, 200000, 123456, 4.2430, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'The brightest star in the Alpha Centauri system.', true, false, 1200000, 223344, 4.3650, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'A star in the Alpha Centauri system.', true, false, 800000, 198765, 4.3650, 1);
INSERT INTO public.star VALUES (4, 'Barnards Star', 'A red dwarf in the constellation Ophiuchus.', true, false, 140000, 111222, 5.9630, 2);
INSERT INTO public.star VALUES (5, 'Wolf 359', 'A red dwarf in the constellation Leo.', true, false, 110000, 101010, 7.7825, 2);
INSERT INTO public.star VALUES (6, 'Sirius', 'The brightest star in the night sky.', true, false, 2400000, 400000, 8.6110, 3);
INSERT INTO public.star VALUES (7, 'Luyten 726-8 A', 'A red dwarf star in the constellation Cetus.', true, false, 170000, 121314, 8.7295, 3);
INSERT INTO public.star VALUES (8, 'Luyten 726-8 B', 'A companion to Luyten 726-8 A.', true, false, 130000, 909090, 8.7295, 3);
INSERT INTO public.star VALUES (9, 'Ross 154', 'A red dwarf star in the constellation Sagittarius.', true, false, 180000, 567890, 9.6930, 4);
INSERT INTO public.star VALUES (10, 'Ross 248', 'A red dwarf star in the constellation Andromeda.', true, false, 150000, 654321, 10.3220, 4);
INSERT INTO public.star VALUES (11, 'Epsilon Eridani', 'A star in the constellation Eridanus.', true, false, 2240000, 333222, 10.5220, 5);
INSERT INTO public.star VALUES (12, 'Lacaille 9352', 'A red dwarf star in the constellation Piscis Austrinus.', true, false, 200000, 111999, 10.7420, 5);
INSERT INTO public.star VALUES (13, 'Ross 128', 'A red dwarf star in the constellation Virgo.', true, false, 135000, 100100, 11.0310, 6);
INSERT INTO public.star VALUES (14, 'EZ Aquarii A', 'A triple star system in the constellation Aquarius.', true, false, 160000, 888888, 11.2620, 6);
INSERT INTO public.star VALUES (15, 'EZ Aquarii B', 'A member of the EZ Aquarii system.', true, false, 120000, 777777, 11.2620, 6);
INSERT INTO public.star VALUES (16, 'EZ Aquarii C', 'A member of the EZ Aquarii system.', true, false, 110000, 666666, 11.2620, 6);
INSERT INTO public.star VALUES (17, 'Procyon', 'A binary star system in the constellation Canis Minor.', true, false, 2100000, 654321, 11.4020, 7);
INSERT INTO public.star VALUES (18, '61 Cygni A', 'A binary star system in the constellation Cygnus.', true, false, 1800000, 456789, 11.4020, 7);
INSERT INTO public.star VALUES (19, '61 Cygni B', 'A member of the 61 Cygni system.', true, false, 1500000, 567890, 11.4020, 7);
INSERT INTO public.star VALUES (20, 'Tau Ceti', 'A star in the constellation Cetus.', true, false, 1100000, 345678, 11.9050, 8);
INSERT INTO public.star VALUES (21, 'Luytens Star', 'A red dwarf star in the constellation Canis Minor.', true, false, 160000, 234567, 12.3740, 8);
INSERT INTO public.star VALUES (22, 'Teegardens Star', 'A red dwarf in the constellation Aries.', true, false, 120000, 123456, 12.5780, 8);
INSERT INTO public.star VALUES (23, 'Kapteyns Star', 'A red subdwarf star in the constellation Pictor.', true, false, 160000, 876543, 12.7830, 9);
INSERT INTO public.star VALUES (24, 'Groombridge 34 A', 'A binary star system in the constellation Andromeda.', true, false, 170000, 765432, 12.9870, 9);
INSERT INTO public.star VALUES (25, 'Groombridge 34 B', 'A member of the Groombridge 34 system.', true, false, 150000, 654321, 12.9870, 9);
INSERT INTO public.star VALUES (26, 'Epsilon Indi A', 'A binary star system in the constellation Indus.', true, false, 2200000, 543210, 11.8280, 10);
INSERT INTO public.star VALUES (27, 'Epsilon Indi B', 'A member of the Epsilon Indi system.', true, false, 130000, 432109, 11.8280, 10);
INSERT INTO public.star VALUES (28, 'DX Cancri', 'A red dwarf star in the constellation Cancer.', true, false, 140000, 321098, 11.8230, 10);
INSERT INTO public.star VALUES (29, 'GJ 1061', 'A red dwarf star in the constellation Horologium.', true, false, 120000, 210987, 12.0700, 1);
INSERT INTO public.star VALUES (30, 'YZ Ceti', 'A red dwarf star in the constellation Cetus.', true, false, 100000, 123456, 12.1130, 2);
INSERT INTO public.star VALUES (31, 'Wolf 1061', 'A red dwarf star in the constellation Ophiuchus.', true, false, 190000, 234567, 12.1540, 3);
INSERT INTO public.star VALUES (32, 'GJ 1002', 'A red dwarf star in the constellation Cetus.', true, false, 100000, 345678, 11.9420, 4);
INSERT INTO public.star VALUES (33, 'LHS 1140', 'A red dwarf star in the constellation Cetus.', true, false, 160000, 456789, 12.3580, 5);
INSERT INTO public.star VALUES (34, 'WISE 0855-0714', 'A sub-brown dwarf located in the constellation Hydra.', true, false, 110000, 567890, 12.4110, 6);
INSERT INTO public.star VALUES (35, 'LHS 292', 'A red dwarf star in the constellation Leo.', true, false, 140000, 678901, 12.3710, 7);
INSERT INTO public.star VALUES (36, 'GJ 338 A', 'A binary star system in the constellation Andromeda.', true, false, 1800000, 789012, 12.6220, 8);
INSERT INTO public.star VALUES (37, 'GJ 338 B', 'A member of the GJ 338 system.', true, false, 1700000, 890123, 12.6220, 9);
INSERT INTO public.star VALUES (38, 'Wolf 424', 'A binary star system in the constellation Virgo.', true, false, 200000, 901234, 12.8630, 10);


--
-- Name: continents_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.continents_continent_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 55, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 38, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 38, true);


--
-- Name: continent continent_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_name_unique UNIQUE (name);


--
-- Name: continent continents_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continents_pkey PRIMARY KEY (continent_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


--
-- Name: moon fk_moon_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

