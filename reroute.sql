--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bus_filters; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE bus_filters (
    bus_filter_id integer NOT NULL,
    user_id integer,
    bus_code character varying(5),
    filter_code character varying(5)
);


ALTER TABLE bus_filters OWNER TO vagrant;

--
-- Name: bus_filters_bus_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE bus_filters_bus_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bus_filters_bus_filter_id_seq OWNER TO vagrant;

--
-- Name: bus_filters_bus_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE bus_filters_bus_filter_id_seq OWNED BY bus_filters.bus_filter_id;


--
-- Name: buses; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE buses (
    bus_code character varying(20) NOT NULL,
    city character varying(10),
    bus_name character varying(40),
    bus_lname character varying(40)
);


ALTER TABLE buses OWNER TO vagrant;

--
-- Name: filters; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE filters (
    filter_code character varying(5) NOT NULL,
    filter_name character varying(40)
);


ALTER TABLE filters OWNER TO vagrant;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE ratings (
    rating_id integer NOT NULL,
    user_id integer,
    bus_code character varying(5),
    rating integer,
    comments character varying(140)
);


ALTER TABLE ratings OWNER TO vagrant;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE ratings_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ratings_rating_id_seq OWNER TO vagrant;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE ratings_rating_id_seq OWNED BY ratings.rating_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    user_id integer NOT NULL,
    email character varying(64),
    password character varying(64),
    fname character varying(64),
    lname character varying(64)
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: bus_filter_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY bus_filters ALTER COLUMN bus_filter_id SET DEFAULT nextval('bus_filters_bus_filter_id_seq'::regclass);


--
-- Name: rating_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings ALTER COLUMN rating_id SET DEFAULT nextval('ratings_rating_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: bus_filters; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY bus_filters (bus_filter_id, user_id, bus_code, filter_code) FROM stdin;
\.


--
-- Name: bus_filters_bus_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('bus_filters_bus_filter_id_seq', 1, false);


--
-- Data for Name: buses; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY buses (bus_code, city, bus_name, bus_lname) FROM stdin;
3	SF	3	JACKSON
31BX	SF	31BX	BALBOA B EXPRESS
38AX	SF	38AX	GEARY A EXPRESS
38BX	SF	38BX	GEARY B EXPRESS
5	SF	5	FULTON
5R	SF	5R	FULTON RAPID
6	SF	6	HAIGHT-PARNASSUS
7	SF	7	HAIGHT-NORIEGA
7R	SF	7R	HAIGHT-NORIEGA RAPID
7X	SF	7X	NORIEGA EXPRESS
8	SF	8	BAYSHORE
8AX	SF	8AX	Bayshore A Express
8BX	SF	8BX	Bayshore B Express
9	SF	9	SAN Bruno
9R	SF	9R	SAN Bruno Rapid
10	SF	10	TOWNSEND
12	SF	12	FOLSOM-PACIFIC
14	SF	14	MISSION
14R	SF	14R	MISSION RAPID
14X	SF	14X	MISSION EXPRESS
18	SF	18	46TH AVENUE
19	SF	19	POLK
21	SF	21	HAYES
22	SF	22	FILLMORE
23	SF	23	MONTEREY
24	SF	24	DIVISADERO
25	SF	25	TREASURE ISLAND
27	SF	27	BRYANT
28	SF	28	19TH AVENUE
28R	SF	28R	19TH AVENUE
29	SF	29	SUNSET
30X	SF	30X	MARINA EXPRESS
31	SF	31	BALBOA
33	SF	33	ASHBURY-18TH ST
35	SF	35	EUREKA
36	SF	36	TERESITA
37	SF	37	CORBETT
38	SF	38	GEARY
38R	SF	38R	GEARY RAPID
39	SF	39	COIT
41	SF	41	UNION
43	SF	43	MASONIC
47	SF	47	VAN NESS
48	SF	48	QUINTARA-24TH STREET
49	SF	49	VAN NESS-MISSION
52	SF	52	EXCELSIOR
54	SF	54	FELTON
55	SF	55	16TH STREET
56	SF	56	RUTLAND
66	SF	66	QUINTARA
67	SF	67	BERNAL HEIGHTS
76X	SF	76X	MARIN HEADLANDS EXPRESS
81X	SF	81X	CALTRAIN EXPRESS
82X	SF	82X	LEVI PLAZA EXPRESS
83X	SF	83X	MID-MARKET EXPRESS
88	SF	88	BART SHUTTLE
90	SF	90	SAN BRUNO OWL
91	SF	91	3RD-19TH AVE OWL
K-OWL	SF	K-OWL	
L-OWL	SF	L-OWL	
M-OWL	SF	M-OWL	
N-OWL	SF	N-OWL	
T-OWL	SF	T-OWL	
NX	SF	NX	N EXPRESS
45	SF	45	UNION-STOCKTON
1BX	SF	1BX	CALIFORNIA B EXPRESS
2	SF	2	CLEMENT
30	SF	30	STOCKTON
1AX	SF	1AX	CALIFORNIA A EXPRESS
57	SF	57	PARKMERCED
1	SF	1	CALIFORNIA
Powell-Mason	SF	Powell-Mason	Powell-Mason Cable Car
31AX	SF	31AX	BALBOA A EXPRESS
Powell-Hyde	SF	Powell-Hyde	Powell-Hyde Cable Car
44	SF	44	"O'SHAUGHNESSY"
California	SF	California	California Cable Car
E	SF	E	EMBARCADERO
F	SF	F	MARKET & WHARVES
J	SF	J	CHURCH
KT	SF	KT	INGLESIDETHIRD
L	SF	L	TARAVAL
M	SF	M	OCEAN VIEW
N	SF	N	JUDAH
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY filters (filter_code, filter_name) FROM stdin;
awc	Crowded
awl	Arrives Every Blue Moon
sdn	Stops That Throw You From Your Seat
aol	Agressive Old Ladies
lnp	Late Night Party Bus
hdr	Hot Drivers
mdr	Mean Drivers
tcb	Best Tour of the City
tdb	Tidy Bus
cty	Crusty Bus
pwk	Packed with Kids
dpt	Departs as You Get to Stop
wss	Will Skip Your Stop
mls	Has Mystery Liquid in Seats
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY ratings (rating_id, user_id, bus_code, rating, comments) FROM stdin;
\.


--
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('ratings_rating_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, email, password, fname, lname) FROM stdin;
6	pascaleee@gmail.com	hi	Pascale	pierre
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 6, true);


--
-- Name: bus_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY bus_filters
    ADD CONSTRAINT bus_filters_pkey PRIMARY KEY (bus_filter_id);


--
-- Name: buses_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY buses
    ADD CONSTRAINT buses_pkey PRIMARY KEY (bus_code);


--
-- Name: filters_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (filter_code);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: bus_filters_bus_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY bus_filters
    ADD CONSTRAINT bus_filters_bus_code_fkey FOREIGN KEY (bus_code) REFERENCES buses(bus_code);


--
-- Name: bus_filters_filter_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY bus_filters
    ADD CONSTRAINT bus_filters_filter_code_fkey FOREIGN KEY (filter_code) REFERENCES filters(filter_code);


--
-- Name: bus_filters_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY bus_filters
    ADD CONSTRAINT bus_filters_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: ratings_bus_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_bus_code_fkey FOREIGN KEY (bus_code) REFERENCES buses(bus_code);


--
-- Name: ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

