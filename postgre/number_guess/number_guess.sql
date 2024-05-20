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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    name character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('ali', 1, 0);
INSERT INTO public.users VALUES ('user_1716207159973', 100002, 0);
INSERT INTO public.users VALUES ('user_1716207699983', 2, 70);
INSERT INTO public.users VALUES ('user_1716208208249', 2, 431);
INSERT INTO public.users VALUES ('user_1716207159974', 100005, 0);
INSERT INTO public.users VALUES ('abdul', 5, 100000);
INSERT INTO public.users VALUES ('richard', 0, 100000);
INSERT INTO public.users VALUES ('user_1716207699984', 5, 388);
INSERT INTO public.users VALUES ('user_1716207280584', 2, 294);
INSERT INTO public.users VALUES ('user_1716208208250', 5, 174);
INSERT INTO public.users VALUES ('user_1716207280585', 5, 90);
INSERT INTO public.users VALUES ('user_1716207720374', 2, 190);
INSERT INTO public.users VALUES ('dimas', 1, 13);
INSERT INTO public.users VALUES ('user_1716207720375', 5, 613);
INSERT INTO public.users VALUES ('user_1716207434140', 2, 166);
INSERT INTO public.users VALUES ('user_1716207434141', 5, 66);
INSERT INTO public.users VALUES ('user_1716207829732', 2, 308);
INSERT INTO public.users VALUES ('user_1716207500800', 2, 69);
INSERT INTO public.users VALUES ('user_1716207829733', 5, 198);
INSERT INTO public.users VALUES ('user_1716207500801', 5, 134);
INSERT INTO public.users VALUES ('ray', 2, 1);
INSERT INTO public.users VALUES ('arif', 2, 3);
INSERT INTO public.users VALUES ('user_1716208103033', 2, 228);
INSERT INTO public.users VALUES ('user_1716208103034', 5, 139);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (name);


--
-- PostgreSQL database dump complete
--

