--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: court_court; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.court_court (
    court_id character varying(4) NOT NULL,
    current_size integer NOT NULL,
    available_id integer[] NOT NULL,
    current_player_list integer[] NOT NULL,
    CONSTRAINT court_court_current_size_check CHECK ((current_size >= 0))
);


ALTER TABLE public.court_court OWNER TO postgres;

--
-- Name: court_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.court_question (
    id integer NOT NULL,
    question_statement text NOT NULL,
    choice_a character varying(150) NOT NULL,
    choice_b character varying(150) NOT NULL,
    choice_c character varying(150) NOT NULL,
    choice_d character varying(150) NOT NULL,
    answer character varying(1) NOT NULL,
    team text NOT NULL
);


ALTER TABLE public.court_question OWNER TO postgres;

--
-- Name: court_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.court_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.court_question_id_seq OWNER TO postgres;

--
-- Name: court_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.court_question_id_seq OWNED BY public.court_question.id;


--
-- Name: court_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.court_team (
    id integer NOT NULL,
    team_name character varying(3) NOT NULL,
    division_name character varying(10) NOT NULL
);


ALTER TABLE public.court_team OWNER TO postgres;

--
-- Name: court_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.court_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.court_team_id_seq OWNER TO postgres;

--
-- Name: court_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.court_team_id_seq OWNED BY public.court_team.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: court_question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.court_question ALTER COLUMN id SET DEFAULT nextval('public.court_question_id_seq'::regclass);


--
-- Name: court_team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.court_team ALTER COLUMN id SET DEFAULT nextval('public.court_team_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add team	7	add_team
26	Can change team	7	change_team
27	Can delete team	7	delete_team
28	Can view team	7	view_team
29	Can add question	8	add_question
30	Can change question	8	change_question
31	Can delete question	8	delete_question
32	Can view question	8	view_question
33	Can add court	9	add_court
34	Can change court	9	change_court
35	Can delete court	9	delete_court
36	Can view court	9	view_court
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$ODChikvJEI6R$49zmjDCdJveTldYvPeNLPTBT05KpSeDGxzHafcBhYpw=	2021-01-13 16:04:23.33906-05	t	arshi			arshi_b@hotmail.com	t	t	2021-01-13 16:04:18.234764-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: court_court; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.court_court (court_id, current_size, available_id, current_player_list) FROM stdin;
\.


--
-- Data for Name: court_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.court_question (id, question_statement, choice_a, choice_b, choice_c, choice_d, answer, team) FROM stdin;
209	What were the Denver Nuggets originally called?	Denver Rockets	Denver Larks	Denver Mammoths	Denver Outlaws	b	DEN
210	What is the most points (both teams combined) ever scored in a Nuggets game?	330	310	370	350	c	DEN
211	How many steals did basketball player Fat Lever have in one quarter (setting the NBA record)?	4	8	10	6	b	DEN
212	Who was the first Nugget with more than 300 blocked shots in a season?	Julius Keye	Marcus Camby	Dikembe Mutombo	Wayne Cooper	c	DEN
213	How many times did the Nuggets quality for the playoffs during the 1980's?	10	9	7	11	b	DEN
214	Which team missed 22 consecutive 3's against the Portland Trail Blazers in December 2012 without a single make?	Toronto Raptors	Los Angeles Lakers	Denver Nuggets	Miami Heat	c	DEN
215	Which player won MVP, Rookie of the Year and All-Star Game MVP during his rookie season?	Magic Johnson (LAL)	Spencer Haywood (DEN)	Patrick Ewing (NYK)	Larry Bird (CEL)	b	DEN
216	How many players were ejected during the infamous 2006 Knicks-Nuggets Brawl?	8	7	5	10	d	DEN
217	During the 1981-82 season, the Nuggets Scored at least ___ points in every game:	100	90	80	110	a	DEN
218	What is the best single-season free throw percentage in Denver Nugget's history (set by Mahmoud Abdul-Rauf)?	.922	.956	.981	.893	b	DEN
219	What is the name of the Denver Nuggets' mascot?	Booster The Cheetah	Duncan The Donut	Clutch The Honey Bear	Rocky The Mountain Lion	d	DEN
220	Who is the Nuggets' all-time leading scorer?	Alex English	Carmelo Anthony	David Thompson	J.R. Smith	a	DEN
221	Who hold's the record for most minutes played, most assists and most points scored for the Denver Nuggets?	Dikembe Mutombo	Nikola Jokic	Chauncey Billups	Alex English	d	DEN
222	Who got drafted first in 1984 NBA draft (Michael Jordan got drafted on this day)?	Sam Bowie	Akeem Olajuwon	Patrick Ewing	Charles Barkley	b	DEN
223	What division are the Denver Nuggets a part of?	Northwest	Atlantic	Southwest	Southeast	a	DEN
224	Which player has the most NBA Defensive Player of the Year Award wins?	Dikembe Motombo (5 times)	Ben Wallace (3 times)	Dennis Rodman & Ben Wallace (Tied, 4 times)	Dikembe Motombo & Ben Wallace (Tied, 4 times)	d	DEN
225	How many blocked shots did Dikembe Mutombo earn during his NBA career?	5192	3289	2993	4844	b	DEN
226	What team did Allen Iverson play for right after his time at Philidelphia Sixers?	Toronto Raptors	Detroit Pistons	Memphis Grizzlies	Denver Nuggets	d	DEN
227	Who was the first D-Leage player every signed by an NBA Team?	Chris "The Birdman" Andersen	J.J. Barea	Jeremy Lin	Rafar Alston	a	DEN
228	Which sport did Denver Nuggets player Nene play before he picked up a basketball?	Cricket	Volleyball	Brazilian Jiu-Jitsu	Soccer	d	DEN
229	Who coached Allen Iverson during his time at Denver?	Larry Brown	Tim Donaghy	George Karl	John Thompson	c	DEN
230	Who did the Denver Nuggets lose to in a triple-overtime record-high scoring NBA game in 1983?	Los Angeles Lakers	Charlotte Bobcats	Detroit Pistons	Philidephia Sixers	c	DEN
231	What were Denver Nuggets colors in 2007-08?	Gold and Blue	Black and Yellow	Blue and Yellow	Red and Blue	c	DEN
232	What is the current name of the Denver Nuggets stadium?	Pepsi Center	McDonald's Arena	The Miner's Center	Ball Arena	d	DEN
233	In which season did the Miami HEAT make the playoffs for the first time?	95'-96'	91'-92'	76'-77'	03'-04'	b	MIA
234	Which HEAT player hit the game-winning shot against the New Orleans Hornets in Game 1 of the 2004 First Round?	Shaquille O'Neal	Dwayne Wade	Ray Allen	Pat Riley	b	MIA
235	Who was the HEAT's second-leading scorer behind Dwayne Wade in the 2006 NBA Finals?	Jason Williams	Shaquille O'Neal	Antoine Walker	Gary Payton	c	MIA
236	How many consecutive years did the HEAT make the NBA Finals after hte 2009-2010 season?	4	5	2	3	a	MIA
237	How many 3-pointers did Mike Miller make in the series-clinching Game 5 of the 2012 NBA Finals?	7	0	5	12	a	MIA
238	Who grabbed the key offensive rebound to set up Ray ALlen's clutch 3-points against the Spurs in Game 6 of the 2013 NBA Finals?	The Birdman	Lebron James	Dwayne Wade	Chris Bosh	d	MIA
239	Which NBA player is also knows as "The Birdman"?	Steven Adams	Chris Andersen	J.R. Smith	Michael Keaton	b	ZZZ
240	What team did the HEAT face in back-to-back years in the NBA Finals?	San Antonio Spurs	Golden State Warriors	Dallas Mavericks	Oklahoma City Thunder	a	MIA
241	Which player holds the HEAT playoff record for total 3-pointers made?	Ray Allem	Lebron James	Mario Chalmers	Dwayne Wade	b	MIA
242	Which player holds the HEAT playoff record for total blocks?	Chris Bosh	Shaquille O'Neal	Alonzo Mourning	Dwayne Wade	c	MIA
243	How many championships have the HEAT won?	3	5	2	4	a	MIA
244	What is Miami Heat's worst regular season record?	15-67	42-40	9-73	31-51	a	MIA
245	How many consecutive decades has Pat Riley appeared in the Finals?	2	4	6	1	c	MIA
246	Which two teams missed the playoffs the season before facing each other in the NBA Finals (setting an NBA record)?	RAPTORS & WARRIORS (2019)	PISTONS & LAKERS (2004)	HEAT & LAKERS (2020)	MAVERICKS & HEAT (2011)	c	MIA
247	Which player is the HEAT's all time leader in scoring?	Alonzo Mourning	Tim Hardaway	Sherman Douglas	Dwayne Wade	d	MIA
248	Which player is the HEAT's all time leader in scoring?	Udonis Haslem	Lebron James	Dwayne Wade	Tim Hardaway	b	MIA
249	Which team took Lebron and the HEAT to a game 7 in the 2013 Eastern Conference Finals?	Boston Celtics	Indiana Pacers	Brooklyn Nets	Toronto Raptors	b	MIA
250	How many 3 pointers did Shaq make in his career?	0	2	1	3	c	MIA
251	Which rival NBA player did Shaq challenge for a one-on-one game on Pay Per View TV to establish his dominance?	Charles Barkley	Karl Malone	Michael Jordan	Hakeem Olajuwon	d	ORL
252	What did the Miami Heat give up in acquiring Shaq from the Lakers in 2004?	Caron Butler, 4 Draft Picks	Contract buyout at 88 Million USD	Lamar Odom, Tim Hardaway, Draft Pick	Caron Butler, Lamar Odom, Brian Grant, Draft Pick	d	MIA
253	What was Dwayne Wade's scoring average during the NBA Finals in 05'-06' season?	41.2	30.2	28.7	34.7	d	MIA
254	Which is the only other player tied with Michael Jordan for most series-winning buzzer beaters in NBA history?	Kawhi Leonard	Kevin Durant	Damian Lillard	Kobe Bryant	c	ZZZ
255	Which player has the most game winning buzzer beater's in NBA history (under 24 seconds remaining on the shot clock)?	Lebron James	Larry Bird	Michael Jordan	Kobe Bryant	d	ZZZ
256	How many 4th quarter points did Lebron James average in the 2011 NBA Finals against the Mavericks?	3.0	5.0	13.0	9.0	a	MIA
1336	In what year were the Toronto Raptors formed?	2000	1995	1976	1988	b	TOR
257	How many points did Lebron James average in the 2011 NBA Finals against the Mavericks?	17.8	22.4	35.2	32.9	a	MIA
258	Which team has the longest current NBA Championship drought?	Atlanta Hawks	Sacremento Kings	Los Angeles Clippers	Milwaukee Bucks	b	ZZZ
259	Which team has the longest current playoff appearance drought?	New York Knicks	Sacremento Kings	Phoenix Suns	Charlotte Hornets	b	ZZZ
260	Which of the following Miami Heat starters was never named an All-Star?	Jason Williams	Anthony Mason	Bam Adebayo	Goran Drjaic	a	MIA
261	Which one of the following NBA players was named an All-Star atleast once?	Toni Kukoc	Kyle Korver	Lamar Odom	Jamal Crawford	b	ZZZ
262	Which skill was Miami Heat's Jason Williams known for best?	Scoring	Passing	Dunking	Stealing	b	MIA
263	Which NBA player, current or former, is also known as "White Chocolate"?	Kevin Love	Gordon Hayward	Jason Williams	Larry Bird	c	MIA
264	Which NBA player had been arrested 15 times before he was 15?	Delonte West	Ron Artest	J.R. Smith	Caron Butler	d	ZZZ
265	Which NBA player often made a "phone call gesture" (implying long distance) after shooting a 3PT?	Caron Butler	Ray Allen	Steph Curry	Paul Pierce	a	MIA
266	When did Erik Spoelstra start as the Head Coach for the Miami Heat?	01'-02'	10'-11'	08'-09'	12'-13'	c	MIA
267	2020 Finals were Erik Spoelstra's ___th Finals appearance as Head Coach:	4	6	2	5	d	MIA
268	Which of the following teams has Pat Riley never been associated with?	New York Knicks	Miami Heat	Boston Celtics	Los Angeles Lakers	c	MIA
269	What is the current name of the Thunder's stadium?	Expo Square Pavilion	Ford Center	Chesapeake Energy Arena	The Hurricane Center	c	OKC
270	How many championships does OKC have?	4	6	2	1	d	OKC
271	Who is OKC's current GM?	Sam Presti	Mitch Kupchak	Bobby Webster	Nicholas Presti	a	OKC
272	How many players won the regular season MVP award while part of the OKC Thunder squad?	6	0	2	3	c	OKC
273	What were the OKC Thunder originally called?	Oklahoma City Longhorns	Baltimore Bullets	Midwest City Thunder	Seattle SuperSonics	d	OKC
274	Which team has had a player that averaged a Triple-Double for the entire regular season?	Los Angeles Lakers	Oklahoma City Thunder	Boston Celtics	Houston Rockets	b	OKC
275	Who is the only other player apart from Russel Westbrook to average a Triple-Double for the entire regular season?	Lebron James	Magic Johnson	Wilt Chamberlain	Oscar Robertson	d	OKC
276	Which of the following players was not drafted by the Oklahoma City Thunder Franchise?	Scottie Pippen	James Harden	Dennis Schroder	Kevin Durant	c	OKC
277	Who hold the OKC Thunder's single-season record for blocks?	Steven Adams	Serge Ibaka	Shawn Kemp	Nick Collison	b	OKC
278	Who was the first Thunder franchise player to average 30 points per game (includes Seattle SuperSonics)?	Russel Westbrook	Ray Allen	Kevin Durant	Gary Paton	c	OKC
279	What is the name of the current Thunder Mascot?	Thor	Bolt	Rumble	Electri-Cat	c	OKC
280	Which player set a Thunder record with 10 successful 3-pointers in a single game?	Kevin Durant	Paul George	Russell Westbrook	Carmelo Anthony	b	OKC
281	Which player has played the most games with Thunder/SuperSonics?	Gary Payton	Nick Collison	Russell Westbrook	Fred Brown	a	OKC
282	Against which team did Russell Westbrook score a franchise playoff-record 51 points in 2017?	Los Angeles Lakers	Houston Rockets	Golden State Warriors	Cleveland Cavaliers	b	OKC
283	Who holds the Thunder's franchise record for most single season points?	Spencer Haywood	Kevin Durant	Gary Payton	Russell Westbrook	b	OKC
284	Which Thunder player has the highest career free throw percentage?	Kevin Durant	Ray Allen	Chris Paul	Ricky Pierce	d	OKC
285	How many single-season offensive rebounds did Steven Adams score for a record setting 18'-19' season?	278	670	391	479	c	OKC
286	Which NBA player has the record for all time assists?	John Stockton	Magic Johnson	Steve Nash	Chris Paul	a	ZZZ
287	Who is NBA's all time rebounds leader?	Kareem Abdul-Jabbar	Bill Russel	Tim Duncan	Wilt Chamberlain	d	ZZZ
288	Who is NBA's all time leader in blocks?	Wilt Chamberlain	Shaquille O'Neal	Hakeem Olajuwon	Dikembe Mutombo	c	ZZZ
289	Who coached the Kevin Durant Thunder Team?	Billy Donovan	Mark Daigneault	Sam Presti	Scott Brooks	d	OKC
290	Which team did the Supersonics win a championship against in 1979?	Washington Bullets	Los Angeles Lakers	Cleaveland Cavaliers	Toronto Raptors	a	OKC
291	Besides the Boston Celtics, which team did Bill Russell Coach?	Seattle Supersonics	Charlotte Bobcats	Los Angeles Lakers	Philidelphia 76ers	a	OKC
292	When did the Thunder franchise move to Oklahoma?	08'-09'	99'-00'	10'-11'	06'-07'	a	OKC
293	Which player spent his whole career with the Thunder/SuperSonics Franchise?	Nick Collison	Gary Payton	Shawn Kemp	John Stockton	a	OKC
294	Which of the following players didn't spend his entire career on the Boston Celtics?	Larry Bird	Danny Ainge	Kevin McHale	Bill Russell	b	BOS
295	Which of the following players' hasn't spent his entire career with the Golden State Warriors?	Rick Barry	Stephen Curry	Draymond Green	Klay Thompson	b	GSW
296	Who is the only player to spend his entire career with the Miami Heat?	Mario Chalmers	Jimmy Butler	Hassan Whiteside	Udonis Haslem	d	MIA
297	Which player has spent the longest time with a single NBA team?	Reggie Miller	Tim Duncan	Kobe Bryant	Dirk Nowitzki	d	ZZZ
298	Which of the following players didn't spend his entire career with the San Antonio Spurs?	David Robinson	Tony Parker	Tim Duncan	Manu Ginobli	b	SAS
299	The 2012 NBA Finals ended at a _______ series score, where Miami Heat beat the OKC Thunder.	4-1	4-3	4-2	4-0	a	OKC
300	Which former or current OKC Thunder player has 17 siblings?	Dennis Schroder	Kendrick Perkins	Steven Adams	Serge Ibaka	c	OKC
301	Who was Seattle SuperSonics last Draft Pick before turning into OKC Thunder?	James Harden	Russell Westbrook	Shawn Kemp	Kevin Durant	b	OKC
302	What year did Russell Westbrook win NBA's regular season MVP trophy?	16'-17'	11'-12'	15'-16'	18'-19'	a	OKC
303	Which of the following accolades has Russell Westbrook never won?	Winner of the Dunk	All-Star MVP	Scoring Champion	Regular Season MVP	a	OKC
304	Which of the following players has never won NBA regular season MVP and Defensive Player of the Year awards in the same season?	Michael Jordan	Hakeem Olajuwon	Giannis Antetokounmpo	Lebron James	d	ZZZ
305	Which team has the longest NBA Sellout streak of 814 home games sold out consecutively?	Los Angeles Lakers	Portland Trail Blazers	Toronto Raptors	Oklahoma City Thunder	b	ZZZ
306	Who was the first Portland Trail Blazer to win league MVP?	Bill Walton	Clyde Drexler	Terry Porter	Geoffe Petrie	a	POR
307	Who did Portland pick ahead of Michael Jordan in the 1984 NBA draft?	Sam Bowie	Clyde Drexler	Scottie Pippen	Isiah Thomas	a	POR
308	Which shoe company dominated the NBA from it's inception to the 70s (before Nike took it's market share)?	Converse	Addidas	And1	Puma	a	POR
309	Which Portland Trail Blazer's coach has the highest winning percentage?	Mike Dunleavy	Mike Schuler	Rick Adelman	P.J. Carlesimo	c	POR
310	Who has NBA's record for most steals in one season (301)?	Allen Iverson	Alvin Robertson	Rick Barry	Michael Jordan	b	ZZZ
311	Who was the Trail Blazer's play-by-play announcer for almost three decades?	Ann Schatz	Mike Barrett	Kevin Calabro	Bill Schonely	d	POR
312	How many first quarter assists did Steve Blake score in 2009 again the LA Clippers, setting a NBA record for most assists in one quarter?	6	11	14	22	c	POR
313	Which of the following player's never made the "Dream Team" in 1992?	Clyde Drexler	Isiah Thomas	Patrick Ewing	Magic Johnson	b	ZZZ
314	What's the current name of the Trailblazer's stadium?	Toyota Center	Rose Garden	AT&T Center	Moda Center	d	POR
315	Around the inception of the team, the Trailblazers management held a content to self the team's name. How many entries did it receive?	100	10	1	10,000	d	POR
316	Which Portland Trailblazer holds the record for two 60+ point games in a single regular season?	Scottie Pippen	Damian Lillard	Bill Walton	Clyde Drexler	b	POR
317	Which NBA player is the only one to score back to back 50 point games as a Portland Trailbalzer?	Bill Walton	Brandon Roy	Zach Collins	Damian Lillard	d	POR
318	Three of the following personalities coached and played for an NBA team at the exact same time. Which one didn't?	Larry Bird	Lenny Wilkens	Bob Cousy	Bill Russell	a	ZZZ
319	Which of the following players played for the Portland Trailblazers at some point in his career?	Scottie Pippen	Dennis Rodman	Kevin Garnett	Rajon Rondo	a	POR
320	Three of the following personalities played in the NBA as players before taking on the head coach position for an NBA team. Which one didn't?	Erik Spoelstra	Phil Jackson	Magic Johnson	Scott Brooks	a	ZZZ
321	Which NBA Coach played basketball as a starter for the Air Force Academy in the 60s?	Stan Van Gundy	Gregg Popovich	Pat Riley	Dwayne Casey	b	ZZZ
322	Who is the only person to win Finals MVP as a Portland Trail Blazer?	Bill Walton	Damian Lillard	LaMarcus Aldridge	Carmelo Anthony	a	POR
323	What's the greatest post-season achievement for the Portland Trail Blazers?	Conference Champions	NBA Champions	Conference Quarter-finals Winners	Conference Semi-finals Winners	b	POR
324	What does the pinwheel logo on the portland trailblazers represent?	10 winds signifying the windy weather in the city	A whirlpool	A cyclone	Two five-on-five basketball teams facing off	d	POR
325	Who is the Trail Blazer's current coach?	Maurice Cheeks	Stephen Silas	Ryan Saunders	Terry Stots	d	POR
326	Which player has the record for most consecutive NBA All-Defensive first team selections?	Dennis Rodman	Gary Payton	Lebron James	Kevin Garnett	b	ZZZ
327	How many consecutive years did Gary Payton make the NBA All-Defensive first team?	6	9	13	4	b	ZZZ
328	Three of the following players share the record for most NBA All-Defensive first team selections (9 times each). Who doesn't?	Kobe Bryant	Michael Jordan	Kevin Garnett	Tim Duncan	d	ZZZ
329	Three of the following players share the achievement of making NBA All-Defensive first team selection of 8 times each. One of them only has 6. Who?	Scottie Pippen	Bobby Jones	Tim Duncan	Lebron James	d	ZZZ
330	Which player has the most All-Defensive team selections in total, including first team and second team?	Dennis Rodman	Tim Duncan	Dwight Howard	Marc Gasol	b	ZZZ
331	Which of the following beastly defenders never won a NBA Defensive Player of the Year award?	Michael Jordan	Bill Russell	Ben Wallace	Ron Artest/Metta World Peace	b	ZZZ
332	Which players has the most consecutive NBA Defensive Player of the Year awards?	Giannis Antetokounmpo	Anthony Davis	Marc Gasol	Dwight Howard	d	ZZZ
333	Which of the following players won Defensive Player of the Year Award as a Chicago Bull?	Dennis Rodman	Joakim Noah	Horace Grant	Scottie Pippen	b	CHI
334	Who once played for both the Indiana Pacers and the San Antonio Spurs in the same game?	Kawhi Leonard	Stephen Jackson	Bob Netolicky	Manu Ginobli	c	IND
335	Which Pacer was known as the "Knick Killer"?	Chris Mullin	Reggie Miller	George McGinnis	Paul George	b	IND
336	Which Pacers coach has the highest winning percentage?	Bobby Leonard	Larry Bird	Frank Vogel	Larry Brown	b	IND
337	Who was the first player in NBA history to lift his scoring average at least five points per game in three consecutive seasons?	Steph Curry	Victor Oladipo	Danny Granger	Fred Vanvleet	c	IND
338	Which team engaged in a famous brawl with the Pacers that has become known as the "Malice in the Palace"?	New York Knicks	Milwaukee Bucks	Detroit Pistons	Chicago Bulls	c	IND
339	Against which team did the Pacers double their opponent's score?	Oklahoma City Thunder	Portland Trailblazers	New York Knicks	Sacremento Kings	b	IND
340	Which Pacer holds hte franchise single-season record for steals?	Danny Granger	Paul George	Victor Oladipo	Don Buse	d	IND
341	Which Pacers player had 68 consecutive games with a three-pointer?	Danny Granger	Reggie Miller	Jalen Rose	Chris Mullin	b	IND
342	Which Pacers player has the highest single-season free throw percentage?	Ron Artest	Reggie Miller	Jalen Rose	Chris Mullin	d	IND
343	Who was hte first Pacer with more than 200 blocks in a season?	Shaquille O'Neal	Roy Hibbert	Herb Williams	Jermaine O'Neal	d	IND
344	Which Pacer holds the franchise single-season record for assists?	Geroge Hill	Jeff Teague	Reggie Miller	Mark Jackson	d	IND
345	What year were the Cleveland Cavaliers founded?	1974-75	1976-77	1970-71	1969-70	c	CLE
346	How old was the oldest player ever drafted by the Cleveland Cavaliers?	26	25	27	22	c	CLE
347	What was the first jersey number retired by the Cavaliers?	42	24	34	22	a	CLE
348	This Cavalier was nicknamed "Nate the Great".	Nate Williams	Nate Robinson	McMillan	Nate Thurmond	d	CLE
349	Who was the first Cavalier to win NBA Rookie of the Year?	Mark Price	Brad Daugherty	LeBron James	Kyrie Irving	c	CLE
350	Is Cleveland the worst place in the world to live?	Yes	Yes	Yes	Yes	a	CLE
351	Which Cleveland Cavaliers coach has the highest winning percentage?	Mike Brown	Tyronn Lue	David Blatt	Lenny Wilkens	c	CLE
352	How many consecutive NBA Finals did LeBron James lead the Cavs to after returning to the team in 2014?	5	6	3	4	d	CLE
353	This Cavalier was nicknamed "The King".	Kevin Love	Kyrie Irving	LeBron James	J.R. Smith	c	CLE
354	In which year did the Cavaliers win their first championship?	2016	2017	2013	2015	a	CLE
355	Who was the first player in NBA history to lead all players in a playoff series in points, rebounds, assists, steals and blocks?	Brad Daugherty	LeBron James	Mark Price	Kyrie Irving	b	CLE
356	Who was the first Cleveland Cavalier with 200 steals in a season?	LeBron James	Foots Walker	Brevin Knight	Ron Harper	d	CLE
357	Which Cavalier has the highest single-season free throw percentage in team history?	Kyrie Irving	Mark Price	Terrell Brandon	Mo Williams	b	CLE
358	Which player was nicknamed the "Prince of Midair"?	World B. Free	LeBron James	Campy Russell	Mark Price	a	CLE
359	The Cavs tied the NBA record for least turnovers in a game with this many turnovers.	2	0	1	4	a	CLE
360	Who is the shortest player in Cavaliers history?	Earl Boykins	Isaiah Thomas	Water Tavares	Kay Felder	a	CLE
361	This Cavalier is the second-shortest player in NBA history.	Water Tavares	Isaiah Thomas	Kay Felder	Earl Boykins	d	CLE
362	Who was the first Cavalier with 200 3-pointers in a season?	Mo Williams	Kyrie Irving	LeBron James	J.R. Smith	d	CLE
363	Between 2010 and 2014 how many times did Cleveland win the top pick in the NBA draft lottery?	4	2	3	1	c	CLE
364	What is the Cavs' longest losing streak?	26	22	20	25	a	CLE
365	What was LeBron James' pre-game ritual for the first few years of his career?	Net Grab	Tunnnel Shot	Headbutt	Chalk Toss	d	ZZZ
366	What season did LeBron James average a triple-double in the NBA Finals?	2016	2018	2015	2017	d	ZZZ
367	Who holds the Cavalier franchise single-season record for assists?	Andre Miller	John Bagley	LeBron james	Mark Price	a	CLE
368	Who has the highest 3-point field goal percentage in Cavalier franchise history?	Mark Price	Daniel Gibson	Kyle Korver	Steve Kerr	d	CLE
369	Who was the first Cavalier with 300 offensive rebounds in a season?	Michael Cage	Jim Brewer	Tristan Thompson	Zydrunas Ilgauskas	c	CLE
370	Which NBA team sometimes goes by the moniker "The Wine and Gold"	Cavaliers	Lakers	Warriors	Heat	a	CLE
371	This franchise is the only team in history to come back from a 3-1 deficit in the NBA finals.	Spurs	Thunder	Cavaliers	Warriors	c	CLE
372	Every year from 2015 to 2018 the Cavaliers made it to the NBA finals, how many times did they win?	2	3	4	1	d	CLE
373	LeBron James spent 11 years with the Cavaliers, how many times did he lead them to the playoffs during his tenure?	8	11	9	10	c	CLE
374	Which beloved Cavaliers fan favorite saw his jersey get retired in the middle of the 2014 season?	Michael Cage	Daniel Gibson	Zydrunas Ilgauskas	Jim Brewer	c	CLE
375	Which Cavalier hit the 3-Point shot known as "The Shot".	Kevin Love	Kyrie Irving	J.R. Smith	LeBron James	b	CLE
376	Which rookie in 2002 was drafted by the Cavs in the second round?	Dajuan Wagner	Brendan Haywood	DeSagana Diop	Carlos Boozer	d	CLE
377	This Canadian player was selected 1st overall by the Cavaliers in the 2013 NBA Draft.	Kyrie Irving	Andrew Wiggins	Steve Nash	Anthony Bennett	d	CLE
378	"The Decision" was a horrible moments for Cavalier fans as this was when LeBron James announced he would be "taking his talents" to this NBA franchise.	Heat	Lakers	Cavaliers	Warriors	a	CLE
379	What shortened moniker do the Cleveland Cavaliers often take on?	LeBron & Squad	LeBrons' Team	Cavs	Liers	c	CLE
380	This player was drafted 1st overall by the Cavaliers during the 2014 NBA draft.	Dion Waiters	Andrew Wiggins	Kyrie Irving	Anthony Bennett	b	CLE
381	This player was drafted 1st overall by the Cavaliers during the 2011 NBA draft.	Andrew Wiggins	Anthony Bennett	Dion Waiters	Kyrie Irving	d	CLE
382	This player was drafted 1st overall by the Cavaliers during the 2003 NBA draft.	Andrew Wiggins	Kyrie Irving	Anthony Bennett	LeBron James	d	CLE
383	This player wore the number 22 for the Cavaliers.	Andrew Wiggins	Kyrie Irving	LeBron James	Larry Nance	d	CLE
384	This player wore the number 11 for the Cavaliers.	LeBron James	Kyrie Irving	Zydrunas Ilgauskas	Larry Nance	c	CLE
385	Who was the coach for the Cavaliers during their championship run during the 2015-16 season?	Tyronn Lue	John Beilein	Mike Brown	Larry Drew	a	CLE
386	This Cavaliers player is the franchise leader for most Blocks.	Hot Rod Williams	Zydrunas Ilgauskas	LeBron James	Larry Nance	b	CLE
387	This Cavaliers player is the franchise leader for most Steals.	Foots Walker	Mark Price	LeBron James	Larry Nance	c	CLE
388	This Cavaliers player is the franchise leader for most Assists.	LeBron James	Mark Price	Terrell Brandon	Larry Nance	a	CLE
389	This Cavaliers player is the franchise leader for most Total Rebounds.	Zydrunas Ilgauskas	Tristan Thompson	Larry Nance	LeBron James	d	CLE
390	This Cavaliers player is the franchise leader for most Free Throws.	LeBron James	Brad Daugherty	Hot Rod Williams	Zydrunas Ilgauskas	a	CLE
391	This Cavaliers player is the franchise leader for most 3-Pt Field Goals.	LeBron James	Mark Price	Kevin Love	Kyrie Irving	a	CLE
392	This Cavaliers player is the franchise leader for most Games Played.	Zydrunas Ilgauskas	Bingo Smith	Danny Ferry	LeBron James	d	CLE
393	This Cavaliers player is the franchise leader for most Field Goals.	Austin Carr	Zydrunas Ilgauskas	LeBron James	Bingo Smith	c	CLE
394	This Cavaliers player was awarded the NBA Finals MVP trophy during the 2016 finals.	Kyrie Irving	J.R. Smith	Kevin Love	LeBron James	d	CLE
395	This Cavs player was awarded the MVP trophy for 2 years in a row.	Kevin Love	LeBron James	Kyrie Irving	J.R. Smith	b	CLE
396	This Cavs player was awarded Rookie of the Year during the 2011-12 NBA season.	Andrew Wiggins	Kevin Love	Kyrie Irving	LeBron James	c	CLE
397	This Cavs player was awarded Rookie of the Year during the 2003-04 NBA season.	Kevin Love	Andrew Wiggins	Kyrie Irving	LeBron James	d	CLE
398	What is the name of one of the Cleveland Cavalier mascots?	Moon Dog	Champ	Boomer	Hooper	a	CLE
399	What is the name of one of the Cleveland Cavalier mascots?	Boomer	Champ	Hooper	Sir CC	d	CLE
400	What is the name of a former mascot for the Cleveland Cavaliers?	Champ	Hooper	Boomer	Whammer	d	CLE
401	What is the name of a former mascot for the Cleveland Cavaliers?	Hooper	Hugo	Turbo	The Wizard	d	CLE
452	This Bucks player won Rookie of the Year during the 2016-17 season.	Giannis Antetokounmpo	Khris Middleton	Ray Allen	Malcolm Brogdon	d	MIL
402	This Bucks player was the first in NBA history to finish a regular season in the top 20 in all five major statistical categories: total points, rebounds, assists, steals, and blocks?	Oscar Robertson	Sidney Moncrief	Giannis Antetokounmpo	Kareem Abdul-Jabbar	c	MIL
403	This Bucks player was given the nickname "Greek Freak".	Sidney Moncrief	Giannis Antetokounmpo	Kareem Abdul-Jabbar	Oscar Robertson	b	MIL
404	Which Buck was famous for his "skyhook" shot?	Vin Baker	Marques Johnson	Kareem Abdul-Jabbar	Ray Allen	c	MIL
405	In which year did the Bucks win their first NBA championship?	1970-71	1975-76	1969-70	1971-72	a	MIL
406	What is the name of the Bucks' official mascot?	Bingo	Bongo	Boingo	Bango	d	MIL
407	Who holds the franchise record on the Bucks for most steals in a single game?	Quinn Buckner	Alvin Robertson	Sidney Moncrief	Eric Murdock	b	MIL
408	What is the Milwaukee Bucks longest winning streak?	15	5	20	27	c	MIL
409	Which Buck scored the most points in a single game?	Kareem Abdul-Jabbar	Michael Redd	Giannis Antetokounmpo	Junior Bridgeman	b	MIL
410	Who was the first player in Bucks franchise history to win Sixth Man of the Year?	Ricky Pierce	Quinn Buckner	Tim Thomas	George Hill	a	MIL
411	Who holds the franchise record on the Bucks for most blocked shots in a season?	Larry Sanders	Kareem Abdul-Jabbar	Elmore Smith	Giannis Antetokounmpo	b	MIL
412	Which Buck was nicknamed "the Squid"?	Quinn Buckner	Brook Lopez	Sidney Moncrief	Alvin Robertson	c	MIL
413	How many first round draft picks did Milwaukee have in 1977?	3	2	0	1	a	MIL
414	What is the franchise record for most points scored in a game?	166	130	158	124	a	MIL
415	In 1982 the final score for a triple overtime game was 171-166 between the Spurs and this team.	Bulls	Celtics	Bucks	Lakers	c	MIL
416	Which Milwaukee draft pick refused to play for the Bucks because he had already signed with another team?	Michael Jordan	Larry Bird	Julius Erving	Magic Johnson	c	MIL
417	Who was the Bucks' very first draft pick?	Bob Dandridge	Kareem Abdul-Jabbar	Gary Freeman	Charlie Paulk	d	MIL
418	This player was drafted by the Bucks the same year he was drafted by the U.S. Army.	Bob Dandridge	Gary Freeman	Kareem Abdul-Jabbar	Charlie Paulk	d	MIL
419	Which Bucks rookie did Kareem Abdul-Jabbar punch during a game in 1977?	Marques Johnson	Bob Lanier	Ernie Grunfeld	Kent Benson	d	MIL
420	This Bucks player was also a martial arts blackbelt.	Charlie Paulk	Gary Freeman	Bob Dandridge	Kareem Abdul-Jabbar	d	MIL
421	Who holds the Bucks franchise record for three-point accuracy?	Dell Curry	Jerryd Bayless	Ersan Ilyasova	Craig Hodges	a	MIL
422	Which Milwaukee Buck won the NBA's first Defensive Player of the Year Award in 1983?	Bob Lanier	Marques Johnson	Sidney Moncrief	Alton Lister	c	MIL
423	Which Bucks player filed an antitrust lawsuit against the NBA?	Glenn Robinson	Ray Allen	Bob Dandridge	Oscar Robertson	d	MIL
424	Which player holds the single-season Bucks franchise record for offensive rebounds?	Kareem Abdul-Jabbar	Vin Baker	Marques Johnson	Moses Malone	d	MIL
425	Who holds the Bucks franchise single-season record for assists?	Sam Cassell	Paul Pressey	Eric Murdock	Oscar Robinson	a	MIL
426	How many seasons did Kareem Abdul-Jabbar play for the Bucks?	8	9	5	6	d	MIL
427	This Bucks player is the franchise leader for most Games Played.	Kareem Abdul-Jabbar	Sidney Moncrief	Junior Bridgeman	Bob Dandridge	c	MIL
428	This Bucks player is the franchise leader for most Field Goals.	Kareem Abdul-Jabbar	Sidney Moncrief	Bob Dandridge	Glenn Robinson	a	MIL
429	This Bucks player is the franchise leader for most 3-Pt Field Goals.	Michael Redd	Ray Allen	Glenn Robinson	Khris Middleton	b	MIL
430	This Bucks player is the franchise leader for most Free Throws.	Giannis Antetokounmpo	Kareem Abdul-Jabbar	Sidney Moncrief	Michael Redd	c	MIL
431	This Bucks player is the franchise leader for most Total Rebounds.	Bob Dandridge	Giannis Antetokounmpo	Kareem Abdul-Jabbar	Marques Johnson	c	MIL
432	This Bucks player is the franchise leader for most Assists.	Paul Pressey	Brian Winters	Giannis Antetokounmpo	Sidney Moncrief	a	MIL
433	This Bucks player is the franchise leader for most Steals.	Sidney Moncrief	Brian Winters	Quinn Buckner	Paul Pressey	c	MIL
434	This Bucks player is the franchise leader for most Triple-Doubles.	Giannis Antetokounmpo	Sidney Moncrief	Kareem Abdul-Jabbar	Paul Pressey	a	MIL
435	This Bucks player was selected 15th overall by the Bucks during the 2013 NBA draft.	Khris Middleton	Thon Maker	Larry Sanders	Giannis Antetokounmpo	d	MIL
436	This Bucks player was selected 1st overall by the Bucks during the 2013 NBA draft.	Larry Sanders	Giannis Antetokounmpo	Thon Maker	Andrew Bogut	d	MIL
437	Dirk Nowitzki was drafted by this team and then immediately traded to the Mavericks.	Suns	Bucks	Celtics	Hawks	b	MIL
438	This Bucks player was selected 1st overall by the Bucks during the 1994 NBA draft.	Glenn Robinson	Giannis Antetokounmpo	Thon Maker	Andrew Bogut	a	MIL
439	This Bucks player wore the number 1.	Signey Moncrief	Junior Bridgeman	Oscar Robertson	Marques Johnson	c	MIL
440	This Bucks player wore the number 2.	Junior Bridgeman	Marques Johnson	Signey Moncrief	Oscar Robertson	a	MIL
441	This Bucks player wore the number 4.	Marques Johnson	Signey Moncrief	Oscar Robertson	Junior Bridgeman	b	MIL
442	This Bucks player wore the number 8.	Oscar Robertson	Junior Bridgeman	Marques Johnson	Signey Moncrief	c	MIL
443	This Bucks player wore the number 33.	Oscar Robertson	Junior Bridgeman	Kareem Abdul-Jabbar	Signey Moncrief	c	MIL
444	How many seasons did Ray Allen play for the Bucks?	6	7	10	5	b	MIL
445	How many times have the Bucks won a championship?	3	2	1	0	c	MIL
446	Who was the coach of the Bucks during the championship run?	Don Nelson	Del Harries	Larry Costello	Mike Dunleavy	c	MIL
447	This former NBA championship winner coached the Bucks for 3 years.	Terry Porter	Mike Budenholzer	Jason Kidd	Mike Dunleavy	c	MIL
448	This Bucks player won the MVP award 3 times with the team.	Kareem Abdul-Jabbar	Marques Johnson	Signey Moncrief	Giannis Antetokounmpo	a	MIL
449	This Bucks player won the MVP award 2 times with the team.	Kareem Abdul-Jabbar	Giannis Antetokounmpo	Marques Johnson	Signey Moncrief	b	MIL
450	This Bucks player became just the third player in NBA history to win both the MVP & DPOY award.	Kareem Abdul-Jabbar	Signey Moncrief	Giannis Antetokounmpo	Marques Johnson	c	MIL
451	This Bucks player won Rookie of the Year during the 1969-70 season.	Oscar Robertson	Kareem Abdul-Jabbar	Signey Moncrief	Marques Johnson	b	MIL
453	This Bucks coach won Coach of the Year during the 2018-19 season.	Mike Budenholzer	Mike Dunleavy	Terry Porter	Jason Kidd	a	MIL
454	This bucks player won Defensive Player of the Year back to back.	Marques Johnson	Kareem Abdul-Jabbar	Signey Moncrief	Oscar Robertson	c	MIL
455	This Bucks player was nicknamed "Lew".	Signey Moncrief	Oscar Robertson	Marques Johnson	Kareem Abdul-Jabbar	d	MIL
456	Where were the Golden State Warriors originally located?	Philadelphia	Los Angeles	Boston	Dallas	a	GSW
457	What year did the Warriors win their first championship?	1943	1947	1944	1945	b	GSW
458	Hall of Fame trio Paul Arizin, Tom Gola, Neil Johnston led this NBA team to their second championship.	Warriors	Lakers	Knicks	Celtics	a	GSW
459	Who was the first player in NBA history to make 400 three-pointers in a season?	Klay Thompson	Stephen Curry	Latrell Sprewell	Chris Mullin	b	GSW
460	Which player scored 100 points in a single game?	Bill Russell	Wilt Chamberlain	Kobe Bryant	Michael Jordan	b	GSW
461	Which Warriors coach has the highest winning percentage?	Steve Kerr	Frank Mcguire	George Senesky	Neil Johnston	a	GSW
462	What was the Warriors' largest margin of victory?	60	59	62	58	c	GSW
463	Who is the only NBA player to retire with more career blocked shots than points scored?	Adonal Foyle	Ralph Sampson	Wilt Chamberlain	Manute Bol	d	GSW
464	At 7 ft 6¾ in, this player was among the best shot-blockers in the history of the sport, and played for the Warriors.	Wilt Chamberlain	Manute Bol	Yao Ming	Gheorghe Mureșan	b	GSW
465	Who was the first Warrior to win the NBA Rookie of the Year Award?	Jamaal Wilkes	Woody Sauldsberry	Rick Barry	Wilt Chamberlain	b	GSW
466	Which Warrior recorded a triple-double in an NBA Finals clinching game?	Wilt Chamberlain	Tom Gola	Stephen Curry	Draymond Green	d	GSW
467	This player on the warriors recorded a triple-double in the 2015 NBA Finals.	Klay Thompson	Andre Iguodala	Stephen Curry	Draymond Green	d	GSW
468	Which player holds the NBA single-season scoring record?	Purvis Short	Wilt Chamberlain	Rick Barry	Stephen Curry	b	GSW
469	Which Warrior was known for shooting free throws underhand?	Paul Arizin	Sleepy Floyd	Rick barry	Nate Thurmond	c	GSW
470	Which Warrior player holds the NBA record for most 3-pointers in a game?	Stephen Curry	Tim Hardaway	Chris Mullin	Klay Thompson	d	GSW
471	What was the first jersey number retired by the Golden State Warriors?	14	43	16	24	a	GSW
472	What is the most rebounds Wilt Chamberlain ever had in a game?	52	50	51	55	d	GSW
473	Who is the shortest player in Warriors' history?	Nate Robinson	Keith Jennings	Muggsy Bogues	Earl Boykins	c	GSW
474	Who has the highest single-season free throw percentage in franchise history?	Stephen Curry	Rick Barry	Klay Thompson	Mark Price	a	GSW
475	In which year did the Warriors break the record for most wins in a regular season?	2017-18	2016-17	2015-16	2014-15	c	GSW
476	Which player was unanimously voted as the MVP in the 2015-16 season?	Stephen Curry	Kyrie Irving	Lebron James	Klay Thompson	a	GSW
477	Which one of these NBA teams does not currently have a mascot?	Nuggets	Warriors	Clippers	Trail Blazers	b	GSW
478	Which team ended the Warriors' team-record 54-game home winning streak on April 1, 2016?	Cavaliers	Clippers	Spurs	Celtics	d	GSW
479	Who holds the Warriors' single-season record with 345 blocked shots?	Robert Parish	Wilt Chamberlain	Draymon Green	Manute Bol	d	GSW
480	This player from the Warriors was named the "Most Improved Player" of the 2002-03 season.	Erick Dampier	Earl Boykins	Mike Dunleavy	Gilbert Arenas	d	GSW
481	 In the 2015 playoffs, Steph Curry broke the record for most three-pointers in a single postseason. Whose record did he break?	Danny Green	Reggie Miller	Ray Allen	Klay Thompson	b	GSW
482	Which Warrior had the most double-doubles in the 2002-03 regular season?	Troy Murphy	Mike Dunleavy	Earl Boykins	Gilbert Arenas	a	GSW
483	When did the Warriors win their last championship prior to 2015?	2014	1956	1947	1975	d	GSW
484	Steph Curry was named as the NBA MVP for a second consecutive season in 2015-16. Who finished second in the voting?	LeBron James	Kevin Durant	Russell Westbrook	Kawhi Leonard	d	GSW
485	This player won back to back NBA finals MVP awards with the Warriors.	Kevin Durant	Wilt Chamberlain	Stephen Curry	Klay Thompson	a	GSW
486	How many championships have the Warriors won?	4	3	6	5	c	GSW
487	How many conference titles have the Warriors won?	7	6	5	4	b	GSW
488	This player was drafted by the Warriors 7th overall in the 2009 draft.	Patrick McCaw	Draymond Green	Klay Thompson	Stephen Curry	d	GSW
489	This player was drafted by the Warriors 11th overall in the 2011 draft.	Stephen Curry	Draymond Green	Klay Thompson	Patrick McCaw	c	GSW
490	This player was drafted by the Warriors in the second round of the 2012 draft.	Draymond Green	Stephen Curry	Klay Thompson	Patrick McCaw	a	GSW
491	In 2017 this player became the first player in NBA history to sign a contract for over $200 million.	Russell Westbrook	James Harden	LeBron James	Stephen Curry	d	GSW
492	Who won the 2015-16 NBA 3-Point Contest?	Klay Thompson	Kyrie Irving	Devin Booker	Stephen Curry	a	GSW
493	Who won the 2014-15 NBA 3-Point Contest?	Klay Thompson	Stephen Curry	Kyrie Irving	Kyle Korver	b	GSW
494	During the 2016-17 season this player recorded the 1st NBA triple-double without points with 12 rebounds, 10 assists, 10 steals.	Draymond Green	Nikola Jokic	Russell Westbrook	Marc Gasol	a	GSW
495	Which one of these Warriors players has the best winning percentage?	Draymond Green	Andre Iguodala	Stephen Curry	Klay Thompson	a	GSW
496	This player wore the number 13 for the Warriors.	Wilt Chamberlain	Klay Thompson	Stephen Curry	Andre Iguodala	a	GSW
497	This Warriors player is the all time franchise leader for field goals scored.	Stephen Curry	Wilt Chamberlain	Rick Barry	Chris Mullin	b	GSW
498	This Warriors player is the all time franchise leader for 3-Pt field goals.	Klay Thompson	Stephen Curry	Jason Richardson	Time Hardaway	b	GSW
499	This Warriors player is the all time franchise leader for 2-Pt field goals.	Rick Barry	Paul Arizin	Wilt Chamberlain	Chris Mullin	c	GSW
500	This Warriors player is the all time franchise leader for total rebounds.	Larry Smith	Wilt Chamberlain	Nate Thurmond	Paul Arizin	c	GSW
501	This Warriors player is the all time franchise leader for triple doubles.	Wilt Chamberlain	Kevin Durant	Draymond Green	Stephen Curry	c	GSW
502	This Warriors player was named the Finals Most Valuable Player in 2015.	Andre Iguodala	Kevin Durant	Klay Thompson	Stephen Curry	a	GSW
503	This Warriors player is the all time franchise leader for most Games Played.	Stephen Curry	Nate Thurmond	Chris Mullin	Jeff Mullins	c	GSW
504	This Warriors player is the all time franchise leader for most Free Throws.	Neil Johnston	Wilt Chamberlain	Rick Barry	Paul Arizin	d	GSW
505	This Warriors player was nicknamed "The Big Dipper"	Paul Arizin	Wilt Chamberlain	Neil Johnston	Rick Barry	b	GSW
506	This Warriors player was nicknamed "Baby-Faced Assassin"	Draymond Green	Klay Thompson	Wilt Chamberlain	Stephen Curry	d	GSW
507	This Warriors player won the MVP award twice in a row for both the 2014-15 & 2015-16 seasons.	Draymond Green	Stephen Curry	Klay Thompson	LeBron James	b	GSW
508	This Warriors player won the Defensive Player of the Year award during the 2016-17 season.	Draymond Green	Stephen Curry	Klay Thompson	Andrew Bogut	a	GSW
509	This Warriors coach won the Coach of the Year award for the 2015-16 season.	Steve Kerr	Alex Hannum	Al Attles	Don Nelson	a	GSW
510	Which Warrior upped his scoring average from 10.9 ppg to 18.7 ppg in the 2002-03 season?	Erick Dampier	Earl Boykins	Gilbert Arenas	Mike Dunleavy	c	GSW
511	Who was the Warrior's 6 ft. 11 in. starting center for the 2002-03 season?	Adonal Foyle	Andrew Bogut	Draymond Green	Erick Dampier	d	GSW
512	What were the Los Angeles Clippers originally called?	Braves	Bombers	Bandicoots	Bullets	a	LAC
513	Along with the Portland Trailblazers & Cleveland Cavaliers this new franchise began play in the 1970-71 season.	Raptors	Heat	Clippers	Nuggets	c	LAC
514	How many first round draft picks did the Clippers trade to the Oklahoma City Thunder for Paul George?	3	5	2	4	b	LAC
515	Which Clipper led the league in scoring for three consecutive seasons?	Chris Paul	Bob McAdoo	World B. Free	Blake Griffin	b	LAC
516	Which player has the most rebounds in Clipper history?	DeAndre Jordan	Elton Brand	Blake Griffin	Bob McAdoo	a	LAC
517	Who was the first Clipper to win Sixth Man of the Year?	Danny Manning	Montrezl Harrell	Lou Williams	Jamal Crawford	d	LAC
518	How many minutes did Moses Malone play for the Clippers before they traded him away?	6666	6	666	66	b	LAC
519	Who is the only NBA player to retire with more career blocked shots than points scored?	Adonal Foyle	Wilt Chamberlain	Ralph Sampson	Manute Bol	d	LAC
520	After two years in the ABA, Moses Malone made his NBA debut with this team.	Jazz (Stars)	76ers	Rockets	Clippers (Braves)	d	LAC
521	Who is the Clippers' career leader in assists?	Norm Nixon	Gary Grant	Randy Smith	Chris Paul	d	LAC
522	Who was the first Clipper with more than 200 steals in a season?	Ron Harper	Randy Smith	Tom Chambers	Chris Paul	b	LAC
523	Which player did the Clippers draft directly out of high school?	Darius Miles	DeAndre Jordan	Blake Griffin	Danny Manning	a	LAC
524	Which Clipper missed his rookie season after breaking his kneecap?	Ernie Digregorio	Benoit Benjamin	Danny Manning	Blake Griffin	d	LAC
525	This player was selected as the first overall pick by the Los Angeles Clippers in the 2009 NBA draft.	Chris Paul	Eric Gordon	Blake Griffin	DeAndre Jordan	c	LAC
526	What is the first duo in Clippers history to each score 40 points in a single game?	Paul George & Kawhi Leonard	Bob McAdoo & Randy Smith	Blake Griffin & Eric Gordon	Dominique Wilkins & Danny Manning	a	LAC
527	Which two players have made the most All-Star appearances for the Clippers?	Bob McAdoo & Blake Griffin	Bob McAdoo & Bob Kauffman	Blake Griffin & Chris Paul	Paul George & Kawhi Leonard	c	LAC
528	Which Clipper has the best single-season free throw percentage in team history?	J.J. Redick	Ernie Digregorio	Jamal Crawford	Danilo Gallinari	b	LAC
529	Former Clipper Head Coach Elgin Baylor was a star for which NBA team?	Lakers	Bobcats	Raptors	Grizzlies	a	LAC
530	 Which Los Angeles Clipper won 2005's Most Improved Player Award?	Lamar Odom	Corey Maggette	Bobby Simmons	Malik Sealy	c	LAC
531	During the 2019-20 playoffs this team became just the third franchise to blow a 3-1 lead twice.	Thunder	76ers	Clippers	Suns	c	LAC
532	During the 2019-20 playoffs the Nuggets became the first team to come back from a 3-1 deficit twice in the same postseason after defeating this team.	Jazz	Clippers	Rockets	Mavericks	b	LAC
533	This coach for the Clippers has blown a 3-1 playoff series lead 3 times.	Vinny Del Negro	Tyronn Lue	Doc Rivers	Kim Hughes	c	LAC
534	What is the name of the mascot for the Los Angeles Clippers?	Crunch the Wolf	The Coyote	Chuck the Condor	Slamson the Lion	c	LAC
535	This team as well as the Grizzlies, Timberwolves, & Pelicans have never made it to the Western Conference Finals.	Suns	Clippers	Kings	Nuggets	b	LAC
536	This team set the record for the largest halftime deficit in an NBA game during the shot-clock era when they found themselves trailing by 50.	Clippers	Mavericks	Kings	Cavaliers	a	LAC
537	This Clippers player is the all time franchise leader for games played.	DeAndre Jordan	Chris Paul	Randy Smith	Blake Griffin	a	LAC
538	This Clippers player is the all time franchise leader for minutes played.	DeAndre Jordan	Blake Griffin	Randy Smith	Elton brand	c	LAC
539	This Clippers player is the all time franchise leader for field goals.	Blake Griffin	Bob McAdoo	Elton Brand	Randy Smith	d	LAC
540	This Clippers player is the all time franchise leader for total rebounds.	DeAndre Jordan	Elton Brand	Bob McAdoo	Blake Griffin	a	LAC
541	This Clippers player is the all time franchise leader for assists.	Gary Grant	Chris Paul	Norm Nixon	Randy Smith	b	LAC
542	This Clippers player is the all time franchise leader for steals.	Gary Grant	Chris Paul	Randy Smith	Ron Harper	c	LAC
543	This Clippers player is the all time franchise leader for blocks.	Chris Kaman	Benoit Benjamin	Elton Brand	DeAndre Jordan	d	LAC
544	In 1978 the Buffalo Braves moved to this city and renamed the franchise to the Clippers.	Los Angeles	Portland	San Diego	San Francisco	c	LAC
545	In which year this the Clippers franchise move from San Diego to Los Angeles.	1986	1984	1985	1980	b	LAC
546	Doc Rivers & this coach both spent 7 years with the Clippers franchise.	Mike Dunleavy	Bill Fitch	Tyronn Lue	Jack Ramsay	a	LAC
547	This coach led the Clippers to the playoffs 6 years out of the 7 he spent with the team.	Larry Brown	Jack Ramsey	Doc Rivers	Mike Dunleavy	c	LAC
548	This franchise has the second worst record (based on W-L%) in the NBA.	Clippers	Timberwolves	Hornets	Grizzlies	a	LAC
654	What year did the Suns first reach the NBA Finals?	1985-86	1995-96	1965-66	1975-76	d	PHX
549	This Clippers player won Rookie of The Year, even though he was in his second year in the league.	DeAndre Jordan	Blake Griffin	Bob McAdoo	Chris Paul	b	LAC
550	This Clippers player won the NBA Most Valuable Player in the 1974-75 season.	Dave Cowens	Elvin Hayes	Rick Barry	Bob McAdoo	d	LAC
551	On January 10, 2018 Lou Williams dropped 50 against what team?	Lakers	Rockets	Knicks	Warriors	d	LAC
552	This is the longest tenured player on the Clippers roster.	Chris Kaman	Randy Smith	DeAndre Jordan	Blake Griffin	c	LAC
553	This Clippers player is nicknamed "The Claw"	Kawhi Leonard	DeAndre Jordan	Paul George	Blake Griffin	a	LAC
554	This Clippers player is nicknamed "CP3"	DeAndre Jordan	Chris Paul	Blake Griffin	Paul George	b	LAC
555	This Clippers player is nicknamed "PG-13"	DeAndre Jordan	Chris Paul	Paul George	Blake Griffin	c	LAC
556	Which head coach has won the most championships with the Lakers?	Phil Jackson	Bill Sharman	Pat Riley	John Kundla	d	LAL
557	This team led by Jerry West & Wilt Chamberlain has the NBA record for consecutive games won with 33 games.	76ers	Lakers	Warriors	Celtics	b	LAL
558	Which player did the Lakers draft twice?	Kobe Bryant	Jerry West	Magic Johnson	Elgin Baylor	d	LAL
559	This player was drafted by the Lakers, was and all star every year of his career & led the Lakers to 9 NBA finals.	Kobe Bryant	Elgin Baylor	Magic Johnson	Jerry West	d	LAL
560	This Lakers player went by a couple of nicknames during his tenure, such as "Mr. Clutch" & "Zeke from Cabin Creek"	Elgin Baylor	Magic Johnson	Kobe Bryant	Jerry West	d	LAL
561	This Lakers player's image is silhouetted as a registered trademark for the NBA logo.	Elgin Baylor	Magic Johnson	Jerry West	Kobe Bryant	c	LAL
562	After retiring in 1974, West tried his hand at coaching. Which team did he coach in his first managerial role?	Hawks	Lakers	76ers	Celtics	b	LAL
563	Jerry West led the Lakers to 9 NBA finals appearances, how many times did he win the championship?	4	2	1	3	c	LAL
564	Which Laker was so dominant that he prompted the NBA's introduction of the goaltending rule?	George Mikan	Jerry West	Wilt Chamberlain	Elgin Baylor	a	LAL
565	Which Laker once outscored an entire opposing team through three quarters of play?	Kobe Bryant	Magic Johnson	Wilt Chamberlain	Kareem Abdul-Jabbar	a	LAL
566	Which Laker holds the NBA record for blocked shots in a game?	Wilt Chamberlain	Kareem Abdul-Jabbar	Shaquille O'Neal	Elmore Smith	d	LAL
567	Which Laker was famous for his "skyhook" shot?	Kobe Bryant	Magic Johnson	Kareem Abdul-Jabbar	Wilt Chamberlain	c	LAL
568	How many championships did the "Showtime" Lakers win?	4	3	6	5	d	LAL
569	Which Laker earned a reputation for "flopping"?	Kobe Bryant	Bob McAdoo	Vlade Divac	Derek Fisher	c	LAL
570	Which Hall of Famer averaged just 2.1 points per game for the Lakers?	Steve Nash	Karl Malone	Dennis Rodman	Gary Payton	c	LAL
571	What player did the Lakers acquire prior to the 2018 season?	James Harden	Stephen Curry	Kevin Durant	LeBron James	d	LAL
572	How many NBA championships did the Lakers win during the 1960s?	4	2	0	1	c	LAL
573	Which Laker holds the franchise single-season record for assists?	Jerry West	Kobe Bryant	Norm Nixon	Magic Johnson	d	LAL
574	Which Lakers star formerly played for the Harlem Globetrotters?	Wilt Chamberlain	Kareem Abdul-Jabbar	Meadowlark Lemon	Magic Johnson	a	LAL
575	Who was the first Laker to win the NBA Most Valuable Player Award?	Wilt Chamberlain	Kareem Abdul-Jabbar	Magic Johnson	Elgin Baylor	b	LAL
576	Which player did the Lakers trade for his older brother?	Harvey Grant	Marcus Morris	Marc Gasol	Kostas Antetokounmpo	c	LAL
577	Which Lakers great was nicknamed "Zeke from Cabin Creek"?	Shaquille O'Neal	Jerry West	James Worthy	Gail Goodrich	b	LAL
578	What is the Los Angeles Lakers' mascot?	None	Catfish	Pelican	Trout	a	LAL
579	Along with the Nets, Warriors, & Knicks this team has no NBA mascot.	Lakers	Kings	Clippers	Trailblazers	a	LAL
580	Which player did the Lakers trade after he punched Houston Rockets guard Rudy Tomjanovich during a game?	Norm Nixon	Kermit Washington	Kenny Car	Jamaal Wilkes	b	LAL
581	The Lakers franchise began with the purchase of what disbanded team?	Detroit Gems	Rochester Royals	Buffalo Bisons	Toledo Jeeps	a	LAL
582	How many NBA championships did the Lakers win during the 1980s?	3	4	6	5	d	LAL
583	How many championships did the Lakers win during their first seven seasons?	6	3	5	7	a	LAL
584	Who won the 1982-83 NBA Championship beating the Los Angeles Lakers 4 to 0?	Pistons	76ers	Hawks	Celtics	b	LAL
585	For how many years did Jerry West coach the Lakers?	4	2	3	1	c	LAL
586	Which team beat the Los Angeles Lakers 4 to 0 to win the 1988-89 NBA Championship?	76ers	Celtics	Pistons	Hawks	c	LAL
587	hich Laker was the first player named MVP of the Finals?	Kareem Abdul-Jabbar	Magic Johnson	Elgin Baylor	Jerry West	d	LAL
588	Who was the first Laker to win the MVP award?	Kareem Abdul-Jabbar	Elgin Baylor	Jerry West	George Mikan	a	LAL
589	This Lakers player won the MVP award during the 1999-00 season?	Magic Johnson	Kobe Bryant	James Worthy	Shaquille O'Neal	d	LAL
590	Who gave Kobe Bryant the nickname 'Black Mamba'?	Shaquille O'Neal	Kobe Bryant	Sasha Vujacic	Phil Jackson	b	ZZZ
591	How many years did the Lakers play at The Forum?	32	22	42	34	a	LAL
592	Which player made two free throws to clinch the Lakers' Game 7 win vs. Boston in the 2010 NBA Finals?	Lamar Odom	Kobe Bryant	Luke Walton	Sasha Vujacic	d	LAL
593	When did Jack Nicholson become a Lakers season-ticket holder?	1970	1950	1975	1980	a	LAL
594	When did the Lakers win their first NBA title?	1949-50	1952-53	1955-56	1954-55	a	LAL
595	Which of these Laker players doesn't have his number retired?	Jamaal Wilkes	Byron Scott	Wilt Chamberlain	Gail Goodrich	b	LAL
596	How many times have the Lakers failed to qualify for the playoffs?	7	13	9	11	a	LAL
597	How many NBA championships Kobe Bryant won with the Lakers?	5	3	4	2	a	LAL
598	How many NBA championships Earvin "Magic" Johnson won with the Lakers?	3	6	4	5	d	LAL
599	Which team was Kobe Bryant drafted by?	Lakers	Clippers	Celtics	Hornets	d	ZZZ
600	How many NBA championships Wilt Chamberlain won with the Lakers?	1	2	0	3	a	LAL
601	How many NBA championships Kareem Abdul-Jabbar won with the Lakers?	6	4	3	5	d	LAL
602	Which of the following is the Lakers current owner?	Jerry Buss	James Dolan	Micky Arison	Chris Cohan	a	LAL
603	On January 22, 2006 against the Toronto Raptors, Kobe Bryant scored the second most points in NBA history in a single game. How many points did he score in this game?	81	82	80	83	a	ZZZ
604	Which Lakers player holds the record for the second most points in NBA history?	Kareem Abdul-Jabbar	Jerry West	Kobe Bryant	Wilt Chamberlain	c	LAL
605	This Lakers player is the all time franchise leader for games played.	Jerry West	James Worthy	Kareem Abdul-Jabbar	Kobe Bryant	d	LAL
606	This Lakers player is the all time franchise leader for field goals.	Kobe Bryant	Jerry West	Kareem Abdul-Jabbar	Elgin Baylor	a	LAL
607	This Lakers player is the all time franchise leader for 2-Pt field goals.	Kobe Bryant	Jerry West	Kareem Abdul-Jabbar	Elgin Baylor	c	LAL
608	This Lakers player is the all time franchise leader for offensive rebounds.	Kareem Abdul-Jabbar	Magic Johnson	Shaquille O'Neal	A.C. Green	a	LAL
609	This Lakers player is the all time franchise leader for defensive rebounds.	Magic Johnson	Shaquille O'Neal	Kobe Bryant	Kareem Abdul-Jabbar	d	LAL
610	This Lakers player is the all time franchise leader for assists.	Norm Nixon	Magic Johnson	Jerry West	Kobe Bryant	b	LAL
611	This Lakers player is the all time franchise leader for blocks.	Shaquille O'Neal	Kobe Bryant	Elden Campbell	Kareem Abdul-Jabbar	d	LAL
612	This Lakers player is the all time franchise leader for points.	Kobe Bryant	Kareem Abdul-Jabbar	Jerry West	Elgin Baylor	a	LAL
613	This Lakers player is the all time franchise leader for triple-doubles.	Kobe Bryant	Magic Johnson	Elgin Baylor	LeBron James	b	LAL
614	This Lakers player is the all time franchise leader for minutes per game.	Slater Martin	Wilt Chamberlain	Jerry West	Elgin Baylor	b	LAL
615	This Lakers player is the all time franchise leader for points per game.	Jerry West	Shaquille O'Neal	Elgin Baylor	LeBron James	c	LAL
616	This Lakers player is the all time franchise leader for points per 3-Pt field goal percentage.***	Kendall Marshall	Mike Penberthy	Vladimir Radmanovic	Steve Nash	d	LAL
617	This Lakers coach is the all time franchise leader for wins, with 610.	Phil Jackson	John Kundla	Pat Riley	Fred Schaus	a	LAL
618	Phil Jackson and this coach are tied for most seasons coaching the Lakers at 11 seasons.	John Kundla	Fred Schaus	Pat Riley	Bill Sharman	a	LAL
619	Under this head coach the Lakers made the playoffs every single year.	Fred Schaus	Phil Jackson	Pat Riley	John Kundla	b	LAL
620	Phil Jackson and this coach are tied for most championships won for the Lakers with 5.	Pat Riley	John Kundla	Bill Sharman	Paul Westhead	b	LAL
621	This player wore the number 44 for the Lakers.	Jerry West	Shaquille O'Neal	James Worthy	Kareem Abdul-Jabbar	a	LAL
622	This player wore the number 33 for the Lakers.	James Worthy	Jerry West	Magic Johnson	Kareem Abdul-Jabbar	d	LAL
623	This player wore the number 32 for the Lakers.	Magic Johnson	Kareem Abdul-Jabbar	Shaquille O'Neal	Jerry West	a	LAL
624	The Lakers raised a banner to honor this head coach.	Pat Riley	Phil Jackson	Bill Sharman	John Kundla	d	LAL
625	This player played on the Lakers roster for 20 years.	Jerry West	Kareem Abdul-Jabbar	Kobe Bryant	Elgin Baylor	c	LAL
626	In which year did the Lakers have their best regular season record of 69 wins & 13 losses?	2008-09	1999-00	1986-87	1971-72	d	LAL
627	The Lakers were in the 1980 NBA Finals and saw Magic Johnson come alive in game six while playing the center position. Who was the injured starter that Johnson was playing the center position for?	Wilt Chamberlain	Kobe Bryant	Kareem Abdul-Jabbar	Shaquille O'Neal	c	LAL
628	How many Championships did the Lakers win while they were in Minneapolis?	5	2	1	4	a	LAL
629	Which Lakers player was nicknamed "Aristotle"?	Shaquille O'Neal	Kareem Abdul-Jabbar	Wilt Chamberlain	Magic Johnson	a	LAL
630	Who did the Lakers take with their first pick in 1996?	Derek Fisher	Kobe Bryant	Shaquille O'Neal	Pau Gasol	a	LAL
631	How many seasons did Wilt Chamberlain play for the Lakers?	5	2	4	6	a	LAL
632	How many seasons did Kobe Bryant play for the Lakers?	20	21	19	25	a	LAL
633	How many seasons did Kareem Abdul-Jabbar play for the Lakers?	16	14	20	15	b	LAL
634	How many seasons did Shaquille O'Neal play for the Lakers?	4	5	7	8	d	LAL
635	How many years did Lakers player Magic Johnson miss due to HIV, before ultimately retiring?	3	5	2	4	d	LAL
636	The Lakers obtained this legendary journeyman during the 1996-97 season.	Shaquille O'Neal	Moses Malone	Robert Horry	Rajon Rondo	c	LAL
637	After losing to the Lakers in the 1980 and 1982 NBA Finals, the 76ers acquired which future Hall of Famer to help them beat the Lakers in 1983?	Julius Erving	Charles Barkley	Allen Iverson	Moses Malone	d	LAL
638	How many times did Kareem Abdul-Jabbar win the MVP award during his time as a Laker?	2	3	1	4	b	LAL
639	How many times did Magic Johnson win the MVP award?	3	4	2	1	a	ZZZ
640	This Laker won the Finals MVP award three times in a row during the early 2000s.	Kobe Bryant	James Worthy	Shaquille O'Neal	LeBron James	c	LAL
641	This Laker won the Finals MVP award three times in a row during the early 1980s.	Magic Johnson	Kareem Abdul-Jabbar	Wilt Chamberlain	James Worthy	a	LAL
642	This Laker won the Finals MVP award back to back during the late 2000s.	Shaquille O'Neal	Ron Artest	Kobe Bryant	Pau Gasol	c	LAL
643	This is the only Laker to have won the Defensive Player of the Year award.	Kareem Abdul-Jabbar	Wilt Chamberlain	Michael Cooper	Shaquille O'Neal	c	LAL
644	This is the only Laker to have won the Sixth Man of the Year award.	Derek Fisher	Luke Walton	Lamar Odom	Ron Artest	c	LAL
645	This is the only Laker to have won the Rookie of the Year award.	Jerry West	Magic Johnson	Elgin Baylor	Kobe Bryant	c	LAL
646	Which Laker made the most steals in the 2002 playoffs?	Robert Horry	Rick Fox	Derek Fisher	Kobe Bryant	a	LAL
647	Which Laker has had the longest career playing basketball?	LeBron James	Karl Malone	Kobe Bryant	Kareem Abdul-Jabbar	a	
648	How many points did Laker Kobe Bryant score during his last game in the NBA?	59	65	60	61	c	LAL
649	Who bought the Lakers in 1980?	Magic Johnson	Jerry West	Rob Pelinka	Jerry Buss	d	LAL
650	How many championships have the Lakers won as a franchise?	17	18	15	16	a	LAL
651	What year were the Phoenix Suns founded?	1978-79	1968-69	1988-89	1958-59	b	PHX
652	The Suns were the first major professional sports franchise for this state	Maryland	Virginia	Texas	Arizona	d	PHX
653	This team along with the Bucks joined the NBA at the start of the 1968-69 season.	Suns	Rockets	Mavericks	Supersonics	a	PHX
655	Who was the first Phoenix Suns player inducted into the Hall of Fame?	Connie Hawkins	Gail Goodrich	Charles Barkley	Gus Johnson	a	PHX
656	This Suns player was nicknamed "The Hawk".	Charles Barkley	Gail Goodrich	Connie Hawkins	Gus Johnson	c	PHX
657	Which Phoenix Suns coach has the highest winning percentage?	Paul Westphal	Mike D'Antoni	Danny Ainge	Cotton Fitzsimmons	a	PHX
658	What is the most points ever scored by the Phoenix Suns in a game?	168	163	173	158	c	PHX
659	Which Suns player holds the franchise single-season record for steals?	Paul Westphal	Don Buse	Ron Lee	Shawn Marion	c	PHX
660	This Suns point guard was nicknamed "Kamikaze Kid"	Steve Nash	Kevin Johnson	Chris Paul	Ron Lee	d	PHX
661	Which Suns player was nicknamed "The Round Mound of Rebound"?	Shawn Marion	Larry Nance	Curtis Perry	Charles Barkley	d	PHX
662	Which Suns player scored the most points in a single game?	Amar'e Stoudemire	Charles Barkley	Devin Booker	Tom Chambers	c	PHX
663	Who Suns player is the oldest to score 50+ points in a game?	Grant Hill	Charles Barkley	Jamal Crawford	Steve Nash	c	PHX
664	Which Suns player has the highest single-season free throw percentage in team history?	Devin Booker	Eddie Johnson	Steve Nash	Kyle Macy	c	PHX
665	Who was the first Phoenix Suns player to win the Sixth Man of the Year Award?	LeAndro Barbosa	Eddie Johnson	Rodney Rogers	Danny Manning	b	PHX
666	Who was the first Phoenix Suns player with more than 900 assists in a season?	Steve Nash	Jason Kidd	Alvan Adams	Kevin Johnson	d	PHX
667	Who holds the franchise single-season record for blocks?	Amar'e Stoudemire	Larry Nance	Andrew Lang	Mark West	b	PHX
668	Which Suns player holds the NBA record for most turnovers in a game?	Jason Kidd	Steve Nash	Stephon Marbury	Ricky Rubio	a	PHX
669	Who has the highest single-season 3-point field goal percentage in Suns franchise history?	Steve Nash	Joe Johnson	Jim Jackson	Craig Hodges	d	PHX
670	Who was the first Phoenix Suns player to win the NBA Rookie of the Year Award?	Amar'e Stoudemire	Don Buse	Alvan Adams	Walter Davis	c	PHX
671	Which player was nicknamed "The Matrix"?	Steve Nash	Amar'e Stoudemire	Devin Booker	Shawn Marions	d	PHX
672	Who was the first Suns player with 7 triple-doubles in a season?	Alvan Adams	Kevin Johnson	Jason Kidd	Charles Barkley	c	PHX
673	Who holds the Suns franchise single-season record for offensive rebounds?	Amar'e Stoudemire	Curtis Perry	Shawn Marion	A.C. Green	b	PHX
674	This Suns player was suspended for his entire first season by the NBA for failing a drug test.	Amar'e Stoudemire	Richard Dumas	Jason Kidd	Steve Nash	b	PHX
675	Suns player Leandro Barbosa comes from which nation?	Colombia	Peru	Mexico	Brazil	d	PHX
676	The Suns lost to this team 4-2 in the 1992-93 NBA Finals.	SuperSonics	Lakers	Knicks	Bulls	d	PHX
677	This player wore the number 34 for the Suns.	Charles Barkley	Connie Hawkins	Steve Nash	Kevin Johnson	a	PHX
678	This player wore the number 42 for the Suns.	Charles Barkley	Kevin Johnson	Connie Hawkins	Steve Nash	c	PHX
679	This player wore the number 13 for the Suns.	Steve Nash	Kevin Johnson	Charles Barkley	Connie Hawkins	a	PHX
680	This coach is the longest tenured coach for the Suns at 14 years.	John MacLeod	Cotton Fitzsimmons	Alvin Gentry	Mike D'Antoni	a	PHX
681	This coach designed the Suns offense known as "7 seconds or less".	Mike D'Antoni	Alvin Gentry	Cotton Fitzsimmons	John MacLeod	a	PHX
682	This Suns player is the all time franchise leader for games played.	Alvan Adams	Walter Davis	Shawn Marion	Steve Nash	a	PHX
683	This Suns player is the all time franchise leader for field goals.	Walter Davis	Shawn Marion	Kevin Johnson	Alvan Adams	a	PHX
684	This Suns player is the all time franchise leader for 3-Pt Field Goals.	Steve Nash	Shawn Marion	Leandro Barbosa	Dan Majerle	a	PHX
685	This Suns player is the all time franchise leader for Defensive Rebounds.	Shawn Marion	Alvan Adams	Amar'e Stoudemire	Larry Nance	a	PHX
686	This Suns player is the all time franchise leader for Total Rebounds.	Alvan Adams	Larry Nance	Shawn Marion	Amar'e Stoudemire	a	PHX
687	This Suns player is the all time franchise leader for Assists.	Kevin Johnson	Jason Kidd	Steve Nash	Alvan Adams	c	PHX
688	This Suns player is the all time franchise leader for Triple-Doubles.	Kevin Johnson	Charles Barkley	Jason Kidd	Alvan Adams	c	PHX
689	Who was the shortest player to lead the Suns in rebounding?	Steve Nash	Jason Kidd	Charles Barkley	Amar'e Stoudemire	b	PHX
690	This Suns player is the all time franchise leader for Blocks.	Mark West	Larry Nance	Alvan Adams	Shawn Marion	b	PHX
691	In game 3 of the 1993 NBA Finals the Suns & Bulls both teams played how many OTs?	2	3	1	4	b	PHX
692	Which Suns player won the Most Improved Player award during the 1988-89 season?	Mark Davis	Tom Chambers	Steve Kerr	Kevin Johnson	d	PHX
693	Which Suns player won the Most Improved Player award during the 2005-06 season?	Shawn Marion	Amar'e Stoudemire	Boris Diaw	Steve Nash	c	PHX
694	This is the only Suns player to win the MVP award twice.	Steve Nash	Jason Kidd	Amar'e Stoudemire	Charles Barkley	a	PHX
695	This Suns player won the MVP award in the 1992-93 season.	Danny Ainge	Mark West	Kevin Johnson	Charles Barkley	d	PHX
696	This Suns player won the MIP award during the 2013-14 season.	Goran Dragić	Eric Bledsoe	Leandro Barbosa	P.J. Tucker	a	PHX
697	This Suns player won the Rookie of the Year award during the 2002-03 season.	Joe Johnson	Amar'e Stoudemire	Shawn Marion	Alton Ford	b	PHX
698	This Phoenix Suns coach won his first Coach of the Year award during the 2005 season.	Terry Porter	Frank Johnson	Mike D'Antoni	Alvin Gentry	c	PHX
699	What were the Sacramento Kings originally called?	Seagrams	Pros	Royals	Kodaks	a	SAC
700	What year did the franchise win its first NBA championship?	1955	1956	1952	1951	d	SAC
701	How many overtimes did the Rochester Royals play on January 6, 1951 against the Indianapolis Olympians?	7	6	3	2	b	SAC
702	Who was the first Sacramento King with more than 200 blocks in a season?	Michael Stewart	Keon Clark	Sam Lacey	Duane Causwell	d	SAC
703	What year did the Kings relocate to Sacramento?	1986	1964	1985	1965	c	SAC
704	Which Kings player was the first to lead the NBA in scoring and assists in the same year?	DeMarcus Cousins	Nate Archibald	Oscar Robertson	Jack Twyman	b	SAC
705	Which Kings player was paralyzed due to a head injury he suffered during a game?	Wayne Embry	Maurice Stokes	Otis Birdsong	Sam Lacey	b	SAC
706	Which Kings teammate became Maurice Stokes' legal guardian after his injury?	George King	Jim Paxson	Jack Twyman	Clye Lovellette	c	SAC
707	What is the name of the Sacramento Kings' mascot?	Rocky the Mountain Lion	Big Shot	Sam Dunk	Slamson the Lion	d	SAC
708	Who is the tallest player in Sacramento Kings history?	Randy Breuer	Ralph Sampson	Sim Bhullar	Alex Len	c	SAC
709	Who was the first Kings player in NBA history to average a triple-double for a season?	Oscar Roberton	Maurice Stokes	Norm Van Lier	Nate Archibald	a	SAC
710	Which coach has the highest winning percentage in Kings franchise history?	Cotton Fitzsimmons	Jack McMahon	Lester Harrison	Rick Adelman	d	SAC
711	Which Kings player was the first overall pick in the NBA draft?	Jason Williams	Pervis Ellison	Tyreke Evans	Marvin Bagley	b	SAC
712	How much playing time did Sacramento Kings center Sim Bhullar get in his NBA debut?	38 seconds	16 minutes	38 minutes	16 seconds	d	SAC
713	Who was the first Sacramento Kings player to win the Sixth Man of the Year Award?	Bobby Jackson	Bogdan Bodganovic	Harold Pressley	Francisco Garcia	a	SAC
714	Who was the shortest player in Sacramento Kings history?	Isaiah Thomas	Michael Adams	Spudd Webb	Lionel Malamed	c	SAC
715	Which Kings player was nicknamed "Boogie"?	Chris Webber	Mike Bibby	Isaiah Thomas	DeMarcus Cousins	d	SAC
716	Who gave DeMarcus cousins his nickname "Boogie"?	Rod Strickland	Tyreke Evans	Paul Westphal	Hassan Whiteside	a	SAC
717	For which player did the Kings retire Jersey No. 21?	Maurice Stokes	Oscar Robertson	Jack Twyman	Vlade Divac	d	SAC
718	Which Kings player had the highest single-season free throw percentage in franchise history?	Isaiah Thomas	Spud Webb	Peja Stojakovic	Bobby Wanzer	b	SAC
719	For which player did the Kings retire Jersey No. 14?	Maurice Stokes	Oscar Robertson	Jack Twyman	Vlade Divac	b	SAC
720	For which player did the Kings retire Jersey No. 4?	Oscar Robertson	Chris Webber	Maurice Stokes	Vlade Divac	b	SAC
721	This Kings player holds the franchise record for the most Games Played.	Oscar Robertson	Adrian Smith	Jack Twyman	Sam Lacey	d	SAC
722	This Kings player holds the franchise record for the most Fied Goals.	Jack Twyman	Mitch Richmond	Sam Lacey	Oscar Robertson	d	SAC
723	This Kings player was given the nickname "Mr. Triple Double".	Sam Lacey	Oscar Robertson	Mitch Richmond	Jack Twyman	b	SAC
724	This Kings player won the MVP award during the 1963-64 season.	Jerry Lucas	Wayne Embry	Oscar Robertson	Wilt Chamberlain	c	SAC
725	This Kings player holds the franchise record for the most 3-Pt Fied Goals.	Peja Stojaković	Mike Bibby	Mitch Richmond	Buddy Hield	a	SAC
726	This Kings player holds the franchise record for the most Total Rebounds.	Wayne Embry	Oscar Robertson	Jerry Lucas	Sam Lacey	d	SAC
727	This Kings player holds the franchise record for the most Steals.	Oscar Robertson	Jerry Lucas	Sam Lacey	Wayne Embry	c	SAC
728	This Kings player holds the franchise record for the most Turnovers.	Chris Webber	DeMarcus Cousins	Mitch Richmond	Reggie Theus	b	SAC
729	What are the Dallas Mavericks named after?	TV Show	Novel	Short Story	Broadway Musical	a	DAL
730	Who was the first Dallas Maverick to have his jersey number retired?	Mark Aguirre	Derek Harper	Rolando Blackman	Brad Davis	d	DAL
731	What is the Mavericks' largest margin of victory?	33	47	51	53	d	DAL
732	Which Maverick is the youngest player in NBA history to record three triple-doubles?	Mark Aguirre	Jason Kidd	Luka Dončić	Dirk Nowitzki	c	DAL
733	There are only 5 triple doubles recorded by a teenager in NBA history, 4 of these are held by this Mavericks player.	Luka Dončić	Jason Kidd	Dirk Nowitzki	Mark Aguirre	a	DAL
734	Who was the first Dallas Maverick to win league MVP?	Luka Dončić	Mark Aguirre	Dirk Nowitzki	Jason Kidd	c	DAL
735	Which Mavericks player holds the franchise single-season record for assists?	Steve Nash	Derek Harper	Brad Davis	Jason Kidd	d	DAL
736	Which Maverick holds the NBA record for most consecutive free throws made in an NBA playoff game?	Dirk Nowitzki	Jamal Mashburn	Mark Aguirre	Rolando Blackman	a	DAL
737	What is the longest winning streak in Mavericks history?	17	15	19	21	a	DAL
738	Who was the Dallas Mavericks' first head coach?	John Macleod	Dick Motta	Richie Adubato	Don Nelson	b	DAL
739	Who did the Mavericks defeat to win their first NBA championship?	Magic	Heat	Cavaliers	Pistons	b	DAL
740	Who was the Dallas Mavericks' very first draft pick?	Mark Aguirre	Roosevelt Bouie	Kiki Vandeweghe	Rolando Blackman	c	DAL
741	Which Mavericks player holds the franchise single-season record for steals?	Fat Lever	Derek Harper	Monta Ellis	Jason Kidd	b	DAL
742	Who was the first Maverick to win the Sixth Man of the Year Award?	Roy Tarpley	Antawn Jamison	Jay Vincent	Jason Terry	a	DAL
743	Which Mavericks player led the league in triple doubles during his rookie season?	Jason Kidd	Derek Harper	Jamal Mashburn	Dirk Nowitzki	a	DAL
744	By the end of the 1996-97 season, who was the only player on the Mavericks who remained from the opening-day roster?	Michael Finley	Cherokee Parks	Samaki Walker	Jason Kidd	c	DAL
745	Who was the first Maverick to score more than 2000 points in a season?	Mark Aguirre	Derek Harper	Rolando Blackman	Dirk Nowitzki	a	DAL
746	Which Maverick holds the NBA record for most offensive rebounds in a game without a defensive rebound?	James Donaldson	Dirk Nowitzki	Popeye Jones	Roy Tarpley	c	DAL
747	Who bought the Dallas Mavericks in 2000?	Robert Harjavec	Kevin O'Leary	Mark Cuban	Daymond John	c	DAL
748	Which Mavericks head coach had the highest winning percentage?	Rick Carlisle	John Macleod	Don Nelson	Avery Johnson	d	DAL
749	How many draft picks did the Mavericks have in the 2005 NBA draft?	0	2	1	4	a	DAL
750	Who was the Mavs' first NBA All-Star?	Jay Vincent	Rolando Blackman	Brad Davis	Mark Aguirre	d	DAL
751	Which Maverick was the first Chinese player to play in the NBA?	Bateer Mengke	Jianlian Yi	Wang Zhizhi	Yao Ming	c	DAL
752	Who did the Mavericks defeat in their very first game?	Supersonics	Spurs	Kings	Nuggets	b	DAL
753	Who was the tallest Dallas Maverick ever?	Kristaps Porzingis	Boban Marjanovic	Pavel Podkolzin	Shawn Bradley	d	DAL
754	The Mavs' set the record for the largest halftime lead in NBA history with this many points.	51	49	50	52	c	DAL
755	Which team did the Mavs' play against when they set the NBA record for largest halftime lead at 50 points.	Clippers	Kings	Nuggets	Lakers	a	DAL
756	When did the Dallas Mavericks enjoy their first winning season?	1990-91	1983-84	1988-89	1982-83	b	DAL
757	How many games with the Mavs' win during the 1992-93 season?	9	7	11	10	c	DAL
758	Prior to the 2000-01 season how many years in a row had the Mavs' missed the playoffs?	8	9	10	11	c	DAL
759	What is the nickname given to a jersey design by the Mavs' which was worn for only 1 game before being retired.	black plague	black knight	trash bag	dark knight	c	DAL
760	Who wore the number 12 for the Mavs'?	Brad Davis	Rolando Blackman	Luka Dončić	Derek Harper	d	DAL
761	This players jersey number 15 was retired by the Dallas Mavericks.	Brad Davis	Rolando Blackman	Derek Harper	Dirk Nowitzki	a	DAL
762	Who wore the number 22 for the Mavs'?	Dirk Nowitzki	Rolando Blackman	Brad Davis	Derek Harper	b	DAL
763	This player was drafted 5th overall by the Mavs' and then traded to the Hawks during the 2018 NBA draft.	Trae Young	Tyler Dorsey	Luka Dončić	John Collins	a	DAL
764	This player was picked up by the Dallas Mavericks as the 2nd pick of the 1994 NBA Draft.	Tony Dumas	Glenn Robinson	Grant Hill	Jason Kidd	d	DAL
765	This coach has been with the Dallas Mavericks the longest at 13 years.	Rick Carlisle	Dick Motta	Don Nelson	Richie Adubato	a	DAL
766	Under which coach did the Mavs' win their championship?	Rick Carlisle	Don Nelson	Richie Adubato	Dick Motta	a	DAL
767	This Dallas Mavericks player holds the franchise record for both Games & Minutes Played.	Dirk Nowitzki	Rolando Blackman	Derek Harper	Brad Davis	a	DAL
768	This Dallas Mavericks player holds the franchise record for most Field Goals.	Derek Harper	Dirk Nowitzki	Brad Davis	Rolando Blackman	b	DAL
769	This Dallas Mavericks player holds the franchise record for most 3-Pt Field Goals.	Dirk Nowitzki	Steve Nash	Jason Terry	Jason Kidd	a	DAL
770	This Dallas Mavericks player holds the franchise record for most Total Rebounds.	Sam Perkins	Shawn Bradley	James Donaldson	Dirk Nowitzki	d	DAL
771	This Dallas Mavericks player holds the franchise record for most Assists.	Dirk Nowitzki	Derek Harper	Jason Kidd	Brad Davis	b	DAL
772	This Dallas Mavericks player holds the franchise record for most Steals.	Steve Nash	Dirk Nowitzki	Jason Kidd	Derek Harper	d	DAL
773	This Dallas Mavericks player holds the franchise record for most Triple-Doubles.	Jason Kidd	Luka Dončić	Dirk Nowitzki	Michael Finley	b	DAL
774	This Dallas Mavericks player holds the franchise record for best Free Throw Percentage.	Steve Nash	Dirk Nowitzki	Darren Collison	Michael Finley	a	DAL
775	Which seed did the Mavs enter the playoffs at during their championship run?	1	2	4	5	d	DAL
776	Who is number 41 for the Mavs?	Dirk Nowitzki	Derek Harper	Rolando Blackman	Brad Davis	a	DAL
777	Who is number 13 for the Mavs?	Jason Terry	Dirk Nowitzki	Jason Kidd	Steve Nash	d	DAL
778	Who is number 5 for the Mavs?	Dirk Nowitzki	Steve Nash	Jason Kidd	Jason Terry	c	DAL
779	Which Maverick is from Germany?	Brad Davis	Steve Nash	Dirk Nowitzki	Jason Kidd	c	DAL
780	Which Mavericks' star was injured during game 3 of the 2003 Western Conference Finals?	Brad Davis	Dirk Nowitzki	Jason Kidd	Steve Nash	b	DAL
781	What is the name of one of the mascots for the Dallas Mavericks?	Boomer	Hugo	Hooper	Champ	d	DAL
782	The Mavericks are one of how many teams from the state of Texas?	3	1	2	4	a	DAL
783	Which Mavericks player is from South Africa?	Jason Kidd	Jason Terry	Steve Nash	Dirk Nowitzki	c	DAL
784	Which undersized point guard was waved by the Mavericks before the start of the 2001-02 regular season?	Mel Hirsch	Muggsy Bogues	Greg Grant	Earl Boykins	b	DAL
785	This is the only Maverick player to ever win the MVP & FMVP award.	Jason Kidd	Steve Nash	Dirk Nowitzki	Jason Terry	c	DAL
786	This Mavericks player won Sixth Man of the Year during the 2008-09 season.	Devean George	Gerald Green	Erick Dampier	Jason Terry	d	DAL
787	This Mavericks player won Rookie of the Year during the 1994-95 season.	Jason Kidd	Jason Terry	Dirk Nowitzki	Steve Nash	a	DAL
788	This Mavericks player won Rookie of the Year during the 2018-19 season.	Boban Marjanović	Luka Dončić	Kristaps Porziņģis	Dirk Nowitzki	b	DAL
789	Where were the Houston Rockets originally located?	San Diego	St. Louis	Raleigh	Omaha	a	HOU
790	Who is the tallest Houston Rocket of all time?	Hasheem Thabeet	Chuck Nevitt	Yao Ming	Ralph Sampson	c	HOU
791	Which Rockets were known as the "Twin Towers"?	Ralph Sampson & Hakeem Olajuwon	Ralph Sampson & Dikembe Mutombo	Moses Malone & Dikembe Mutombo	Moses Malone & Hakeem Olajuwon	a	HOU
792	Who is the only player in NBA history to record more than 200 blocks and 200 steals in the same season?	Yao Ming	Moses Malone	James Harden	Hakeem Olajuwon	d	HOU
793	What is the most 3-pointers the Rockets have ever attempted in a single game?	55	70	60	65	b	HOU
794	Which coach presided over the Rockets' longest winning streak?	Mike D'Antoni	Rick Adelman	Rudy Tomjanovich	Kevin McHale	b	HOU
795	Who did Houston defeat in the NBA Finals to win their first championship?	Knicks	Bulls	Celtics	Magic	a	HOU
796	In which appearance of the NBA finals did the Rockets win their first championship?	2	4	1	3	d	HOU
797	Which Rockets player scored 13 points in the final 35 seconds of a game for a comeback win over the San Antonio Spurs?	Tracy McGrady	Clyde Drexler	James Harden	Chris Paul	a	HOU
798	Which Rocket produced a quadruple-double twice in one month?	Moses Malone	Clyde Drexler	Hakeem Olajuwon	James Harden	c	HOU
799	Who was the first Rocket with more than 900 assists in a season?	James Harden	Sleepy Floyd	John Lucas	Calvin Murphy	a	HOU
800	In Game 6 of the 1994 NBA Finals, which Houston player made a last-second block to force a Game 7?	Robert Horry	Carl Herrera	Clyde Drexler	Hakeem Olajuwon	d	HOU
801	What number did Hakeem Olajuwon wear during his career with the Rockets?	34	25	23	43	a	HOU
802	Which future coach was drafted by the Rockets in the 1st round of the 1967 NBA draft?	Pat Riley	Gregg Popovich	Phil Jackson	Rudy Tomjanovich	a	HOU
803	This future NBA coach and franchise owner was drafted into both the NBA & NFL as a player.	Phil Jackson	Michael Jordan	Pat Riley	Rudy Tomjanovich	c	ZZZ
804	Who was the first Houston Rocket to win the NBA Sixth Man of the Year Award?	Carlos Delfino	Josh Smith	Eric Gordon	Gerald Green	c	HOU
805	Which Rocket holds the NBA single-season record for offensive rebounds?	Elvin Hayes	Dwight Howard	Hakeem Olajuwon	Moses Malone	d	HOU
806	Which Rocket missed the majority of the 1977-78 season after being punched in the face by the Los Angeles Lakers' Kermit Washington?	Rudy Tomjanovich	Calvin Murphy	John Lucas	Moses Malone	a	HOU
807	Which Rockets coach resigned after being diagnosed with bladder cancer?	Rick Adelman	Jeff Van Gundy	Rudy Tomjanovich	Don Chaney	c	HOU
808	Which Rockets player holds the NBA record for most 3-pointers in a half?	Chris Paul	Chandler Parsons	James Harden	Klay Thompson	b	HOU
809	Which Rocket holds the NBA record for most free throws made in a game with no misses?	Hakeem Olajuwon	Moses Malone	James Harden	Calvin Murphy	c	HOU
810	Which Rocket is the oldest player in NBA history to record more than 20 rebounds in a game?	Hakeem Olajuwon	Elvin Hayes	Moses Malone	Dikembe Mutombo	d	HOU
811	This former Rocket popularized the "finger wag" after blocking shots.	Hakeem Olajuwon	Elvin Hayes	Dikembe Mutombo	Moses Malone	c	HOU
812	The Houston Rockets selected this player as the 1st overall pick of the 2002 NBA Draft.	Rudy Gay	Yao Ming	Tyson Chandler	Richard Jefferson	b	HOU
813	This Rocket became an All-Star during his rookie year in the 2002-03 season.	Yao Ming	Dikembe Mutombo	Charles Oakley	Tracy McGrady	a	HOU
814	This Rocket is the 5th tallest player ever to play in the NBA.	Chuck Nevitt	Yao Ming	Manute Bol	Shawn Bradley	b	HOU
815	The Houston Rockets selected this player as the 1st overall pick of the 1984 NBA Draft.	Hakeem Olajuwon	Steve Harris	Yao Ming	Ralph Sampson	a	HOU
816	The Houston Rockets selected this player as the 1st overall pick of the 1983 NBA Draft.	Hakeem Olajuwon	Steve Harris	Ralph Sampson	Yao Ming	c	HOU
817	This franchise was added as an expansion team to the NBA in the 1967-68 season.	Bulls	Suns	Bucks	Rockets	d	HOU
818	Who wore the number 11 for the Houston Rockets?	Calvin Murphy		Clyde Drexler	Moses Malone	b	HOU
819	Who wore the number 22 for the Houston Rockets?	Clyde Drexler	Moses Malone	Yao Ming	Calvin Murphy	a	HOU
820	Who wore the number 23 for the Houston Rockets?	Calvin Murphy	Clyde Drexler	Moses Malone	Yao Ming	a	HOU
821	Who wore the number 24 for the Houston Rockets?	Moses Malone	Clyde Drexler	Yao Ming	Calvin Murphy	a	HOU
822	This Rockets player was inducted in to the Hall of Fame along with Shaquille O'Neal.	Allen Iverson	Tracy McGrady	Clyde Drexler	Yao Ming	d	HOU
823	This coach won 2 championships with the Houston Rockets.	Del Harris	Kevin McHale	Rudy Tomjanovich	Bill Fitch	c	HOU
824	This Rockets player holds the franchise record for most Games Played.	Rudy Tomjanovich	Calvin Murphy	Robert Reid	Hakeem Olajuwon	d	HOU
825	This Rockets player holds the franchise record for most Field Goals.	Hakeem Olajuwon	Rudy Tomjanovich	Calvin Murphy	James Harden	a	HOU
826	This Rockets player holds the franchise record for most 3-Pt Field Goals.	Trevor Ariza	Eric Gordon	Kenny Smith	James Harden	d	HOU
827	This Rockets player holds the franchise record for most Free Throws.	Calvin Murphy	Hakeem Olajuwon	Yao Ming	James Harden	d	HOU
828	This Rockets player holds the franchise record for most Total Rebounds.	Yao Ming	Rudy Tomjanovich	Hakeem Olajuwon	Moses Malone	c	HOU
829	This Rockets player holds the franchise record for most Assists.	Hakeem Olajuwon	Calvin Murphy	Kenny Smith	James Harden	d	HOU
830	This Rockets player holds the franchise record for most Steals.	Sleepy Floyd	Calvin Murphy	Hakeem Olajuwon	James Harden	c	HOU
831	This Rockets player holds the franchise record for most Triple-Doubles.	Hakeem Olajuwon	Clyde Drexler	James Harden	Russell Westbrook	c	HOU
832	Where were the Memphis Grizzlies originally located?	Vancouver	Nashville	Little Rock	Louisville	a	MEM
833	In which season did the Vancouver Grizzlies join the league?	1991-92	1996-97	1995-96	1992-93	c	MEM
834	What were the Grizzlies originally going to be called?	Maple Leafs	Beavers	Mounties	Lobsters	c	MEM
835	In which season did the franchise move from Vancouver to Memphis?	1999-00	2000-01	1998-99	2002-03	b	MEM
836	Which coach led the Grizzlies to their first winning season?	Lionel Hollins	Hubie Brown	Sidney Lowe	Mike Fratello	b	MEM
837	This Grizzlies coach won the NBA Coach of the Year award during this season.	2008-09	2006-07	2003-04	2002-03	c	MEM
838	In which season did Memphis make the playoffs for the first time in franchise history?	2006-07	2008-09	2002-03	2003-04	d	MEM
839	Who was the first Grizzly to win NBA Rookie of the Year?	Mike Conley Jr.	Pau Gasol	Rudy Gay	Shane Battier	b	MEM
840	This Grizzlies player became the first foreign player to win the NBA Rookie of the Year.	Pau Gasol	Rudy Gay	Mike Conley Jr.	Shane Battier	a	MEM
841	This Grizzlies player was the only one to play all 82 games during the 2001-02 season.	Shane Battier	Pau Gasol	Mike Conley Jr.	Rudy Gay	b	MEM
842	Which player did the Grizzlies trade for his younger brother?	Jontay Porter	Andrew Harrison	Pau Gasol	Justin Holiday	c	MEM
843	In 2008 which two teams were involved in the trade which involved both Marc & Pau Gasol?	Grizzlies & Clippers	Lakers & Spurs	Lakers & Chicago	Grizzlies & Lakers	d	MEM
844	Which Grizzly has the most three-pointers in a single game?	Sam Mack	Mike Miller	Juan Carlos Navarro	Mike Conley	b	MEM
845	Who was the first Grizzly with three triple-doubles in a season?	Marc Gasol	Blue Edwards	Ja Morant	Delon Wright	d	MEM
846	What is the name of the Memphis Grizzlies' mascot?	Grizz	Kody	Ben	Paw Paw	a	MEM
847	Which Memphis Grizzly was nicknamed "Wendigo"?	Marc Gasol	Roy Rogers	Zach Randolph	Shareef Abdur-Rahim	a	MEM
848	Which Grizzly won the NBA Sportsmanship Award three times?	Mike Conley Jr.	Tony Allen	Zach Randolph	Marc Gasol	a	MEM
849	Who was the first Grizzly to win the Sixth Man of the Year Award?	Lance Stephenson	Byron Scott	Mike Miller	Zach Randolph	c	MEM
850	Which Grizzlies coach has the highest winning percentage?	Make Fratello	Dave Joerger	Lionel Hollins	Hubie Brown	b	MEM
851	How many games did Allen Iverson play for the Grizzlies?	43	3	44	6	b	MEM
852	The Memphis Grizzlies' Eddie Jones wore jersey #6 in honor of which NBA legend?	Julius Erving	Don Barksdale	Patrick Ewing	Bill Russell	a	MEM
853	Who was the first Memphis player with at least 1800 points in a season?	Rudy Gay	Shareef Abdur-Rahim	Pau Gasol	Zach Randolph	b	MEM
854	How long was the Grizzlies' longest losing streak?	23	17	28	15	a	MEM
855	How many games did O.J. Mayo start for the Grizzlies in his last season with the team?	42	0	3	66	b	MEM
856	Who was the first Memphis Grizzly with at least 150 steals in a season?	Mike Conley Jr.	Mike Bibby	James Posey	Tony Allen	a	MEM
857	In 2017-18, who was the only player on the Grizzlies roster who averaged more than 20 points per game?	Tyreke Evans	Mike Conley	Marc Gasol	Marshon Brooks	d	MEM
858	Which Grizzly was traded during the 2018-19 season and went on to win the championship that season.	Danny Green	Kawhi Leonard	Serge Ibaka	Marc Gasol	d	MEM
859	Who led the Memphis Grizzlies with 93 blocked shots during the 2004-05 regular season?	Marc Gasol	Tim Duncan	Pau Gasol	Dwight Howard	c	MEM
860	How many points did Grizzlies forward/guard Mike Miller score as a season high in the 2005-06 NBA season?	45	41	39	40	b	MEM
861	During the 2008-09 season Hamed Haddadi became the first Iranian player to play in the NBA for this team.	Clippers	Bucks	Raptors	Grizzlies	d	MEM
862	This team drafted Ja Morant 2nd overall during the 2019 NBA draft	Grizzlies	Thunder	Hawks	Pistons	a	MEM
863	Kevin Love was drafted by the Timberwolves and traded to this team immediately.	Cavaliers	Pistons	Bucks	Grizzlies	d	MEM
864	This former Grizzlies player was a 3X All-Star during his tenure with the Grizzlies.	Pau Gasol	Marc Gasol	Kevin Love	Zach Randolph	b	MEM
865	This coach is the longest tenured coach in Grizzlies franchise history.	Lionel Hollins	Brian Hill	Hubie Brown	Mike Fratello	a	MEM
866	This Grizzlies player holds the franchise record for the most Games Played.	Zach Randolph	Rudy Gay	Mike Conley	Marc Gasol	c	MEM
867	This Grizzlies player holds the franchise record for the most Minutes Played.	Marc Gasol	Zach Randolph	Rudy Gay	Mike Conley	a	MEM
868	This Grizzlies player holds the franchise record for the most Field Goals.	Rudy Gay	Zach Randolph	Mike Conley	Marc Gasol	d	MEM
869	This Grizzlies player holds the franchise record for the most 2-Pt Field Goals.	Marc Gasol	Rudy Gay	Mike Conley	Zach Randolph	a	MEM
870	This Grizzlies player holds the franchise record for the most 3-Pt Field Goals.	Marc Gasol	Mike Conley	Zach Randolph	Rudy Gay	b	MEM
871	This Grizzlies player holds the franchise record for the most Free Throws.	Zach Randolph	Pau Gasol	Mike Conley	Marc Gasol	d	MEM
872	This Grizzlies player holds the franchise record for the most Total Rebounds.	Pau Gasol	Marc Gasol	Rudy Gay	Zach Randolph	b	MEM
873	This Grizzlies player is the only one to be named to the All-NBA First Team.	Mike Conley	Pau Gasol	Zach Randolph	Marc Gasol	d	MEM
874	This Grizzlies player is the only one to be named the NBA Defensive Player of the Year.	Zach Randolph	Mike Conley	Marc Gasol	Pau Gasol	c	MEM
875	This Grizzlies player was awarded the NBA Rookie of the Year during the 2019-20 season.	Desmond Bane	Kyle Anderson	Ja Morant	Dillon Brooks	c	MEM
876	Vince Carter played for this team from 2014 to 2017	Mavericks	Hawks	Nets	Grizzlies	d	MEM
877	What number did the Pelicans retire at halftime of its very first game?	3	7	1	33	b	NOP
878	This player never played for the Pelicans, however the team still retired his number.	Pete Maravich	J.R. Smith	David West	Chris Paul	a	NOP
879	Which Pelican was the first teenager in NBA history to score 20+ points in 10 consecutive games?	David West	Zion Williamson	Chris Paul	Anthony Davis	b	NOP
880	Which coach led New Orleans to their first winning season?	Tim Floyd	Paul Silas	Byron Scott	Jeff Bower	b	NOP
881	Where did the Pelicans temporarily relocate after Hurricane Katrina?	Shreveport	Oklahoma City	Houston	Baton Rouge	b	NOP
882	What year did the team become the Pelicans?	2017	2013	2012	2015	b	NOP
883	Who was the Pelicans' first NBA Rookie of the Year?	Zion Williamson	David West	Chris Paul	Anthony Davis	c	NOP
884	Who was the first Pelican with 200 blocks in a season?	Anthony Davis	Tyson Chandler	Emeka Okafor	Robin Lopez	a	NOP
885	In 2018, which Pelican became the first NBA player since Kareem Abdul-Jabbar in 1972 to notch 40-plus points, 20-plus rebounds and 10-plus assists in a game?	Jrue Holiday	Anthony Davis	Zion Williamson	DeMarcus Cousins	d	NOP
886	Who was the first Pelican to score more than 2,000 points in a season?	Anthony Davis	DeMarcus Cousins	Chris Paul	Zion Williamson	a	NOP
887	What is the least points ever scored by New Orleans in a half?	18	22	16	10	c	NOP
888	Who holds the franchise single-season records for steals and assists?	Greivis Vasquez	Rajon Rondo	Jrue Holiday	Chris Paul	d	NOP
889	What is the name of the Pelicans' mascot?	Pierre	Pepe	Pablo	Paolo	a	NOP
890	Who has the highest single-season field goal percentage in Pelican franchise history?	Robin Lopez	Anthony Davis	Emeka Okafor	Tyson Chandler	d	NOP
891	Which Pelican has the highest single-season free throw percentage?	Chris Paul	Peja Stojakovic	Brian Roberts	J.J. Redick	c	NOP
892	Who holds the Pelicans' franchise record for minutes played in a season?	Jamal Mashburn	David West	Chris Paul	Jrue Holiday	a	NOP
893	In addition to Pierre T. Pelican, what seasonal mascot shows up at Pelicans games during Mardi Gras?	Carnival Cat	Gary the Gator	King Cake Baby	Chewbacchus	c	NOP
894	Which New Orleans player had the most personal fouls in a season?	P.J. Brown	Julius Randle	Tyson Chandler	Jamaal Magloire	d	NOP
895	Who was named NBA Coach of the Year following the 2007-08 season?	Jeff Bower	Tim Floyd	Byron Scott	Monty Williams	c	NOP
896	Who was the first player in franchise history with more than 200 three-pointers in a season?	J.J. Redick	Ryan Anderson	Baron Davis	Peja Stojakovic	d	NOP
897	Which player did the New Orleans Pelicans select 1st overall in the 2019 NBA draft?	Chris Paul	Buddy Hield	Anthony Davis	Zion Williamson	d	NOP
898	Which player did the New Orleans Pelicans select 1st overall in the 2012 NBA draft?	Anthony Davis	Zion Williamson	Chris Paul	Buddy Hield	a	NOP
899	This Pelicans player is the franchise leader for most Games Played.	David West	Jrue Holiday	Chris Paul	Anthony Davis	a	NOP
900	This Pelicans player is the franchise leader for most Field Goals.	David West	Chris Paul	Anthony Davis	Jrue Holiday	c	NOP
901	This Pelicans player is the franchise leader for most 3-Pt Field Goals.	Jrue Holiday	Eric Gordon	Chris Paul	Peja Stojaković	a	NOP
902	This Pelicans player is the franchise leader for most Free Throws.	Chris Paul	Anthony Davis	Eric Gordon	David West	b	NOP
903	This Pelicans player is the franchise leader for most Total Rebounds.	David West	Anthony Davis	Tyson Chandler	P.J. Brown	b	NOP
904	This Pelicans player is the franchise leader for most Assists.	Tyreke Evans	Jrue Holiday	David West	Chris Paul	d	NOP
905	This Pelicans player is the franchise leader for most Steals.	David West	Jrue Holiday	Anthony Davis	Chris Paul	d	NOP
906	Which teams mascot was named as the "Creepiest Mascot in Sports"?	Pelicans	Raptors	Heat	Bucks	a	NOP
907	What were the San Antonio Spurs originally called?	Colonels	Cougars	Chaparrals	Amigos	c	SAS
908	Which city was the Spurs franchise located in prior to moving to San Antonio?	Dallas	Houston	El Paso	Austin	a	SAS
909	Which Spurs star was nicknamed "the Admiral"?	Kawhi Leonard	Tim Duncan	Tony Parker	David Robinson	d	SAS
910	Which Spur managed to play 84 games in an 82-game NBA season?	Johnny Moore	Avery Johnson	Billy Paultz	Kawhi Leonard	c	SAS
911	How many consecutive 50+ win seasons have the San Antonio Spurs had?	20	16	18	19	c	SAS
912	Which team holds the record for the most consecutive wins?	Warriors	Lakers	Spurs	Celtics	c	SAS
913	Who is the tallest player in Spurs history?	David Robinson	Artis Gilmore	Boban Marjanovic	Chuck Nevitt	d	SAS
914	This Spur stood at a towering 7ft 5in and only played one game with the team.	Artis Gilmore	David Robinson	Chuck Nevitt	Boban Marjanovic	c	SAS
915	Who is the only guard in NBA history to have recorded a quadruple-double?	George Gervin	Manu Ginobili	Tony Parker	Alvin Robertson	d	ZZZ
916	Who is the only guard in Spurs history to have recorded a quadruple-double?	Manu Ginobili	Alvin Robertson	Tony Parker	George Gervin	b	SAS
917	Which Spur holds the single-season franchise record for both defensive rebounds and offensive rebounds?	David Robinson	Swen Nater	Tim Duncan	Dennis Rodman	d	SAS
918	What was the first jersey number retired by the San Antonio Spurs?	13	44	00	50	a	SAS
919	This Spur was nicknamed "The Snake".	David Robinson	Swen Nater	Tim Duncan	James Silas	d	SAS
920	Who did the San Antonio Spurs defeat to win their first NBA championship?	Nets	Pistons	Cavaliers	Knicks	d	SAS
921	In which season did the Spurs win their first NBA championship?	2002-03	1998-99	1997-98	2004-05	b	SAS
922	What was Spurs player George Gervin's nickname?	Angel	Cyclops	Iceman	The Beast	c	SAS
923	Which future Spurs star was the first overall pick in the 1976 ABA Dispersal draft?	Larry Kenon	Billy Paultz	George Gervin	Artis Gilmore	d	SAS
924	Which Spurs player had green hair?	Danny Green	Dennis Rodman	Robert Horry	Patty Mills	b	SAS
925	Which Spur scored the most points in a single season?	Tim Duncan	David Robinson	Tony Parker	George Gervin	d	SAS
926	Who was the first San Antonio Spur with more than 300 steals in a season?	Alvin Robertson	Johnny Moore	David Robertson	Mike Gale	a	SAS
927	Which former Spur holds the NBA record for most blocks in a half?	George T. Johnson	Billy Paultz	David Robinson	Tim Duncan	a	SAS
928	Which San Antonio Spurs head coach has the highest winning percentage?	Rex Hughes	John Lucas II	Bob Hill	Gregg Popovich	a	SAS
929	Who was the first San Antonio Spur to win the Sixth Man of the Year Award?	Derrick White	Chuck Person	Manu Ginóbili	Pau Gasol	c	SAS
930	Which former Spur holds the NBA record for most steals in a game?	Larry Kenon	Johnny Moore	Mike Gale	Alvin Robertson	a	SAS
931	Which Spurs player has the highest single-season field goal percentage in franchise history?	Steve Johnson	Tiago Splitter	David Robinson	Artis Gilmore	a	SAS
932	Which San Antonio Spur holds the NBA record for most assists in a quarter?	Johnny Moore	Tony Parker	John Lucas	Avery Johnson	c	SAS
933	Who did the Spurs defeat to win the 2014 NBA title?	Cavaliers	Mavericks	Heat	Warriors	c	SAS
934	In what year was Tim Duncan drafted?	1995	1996	1998	1997	d	SAS
935	Which player wore #21 on his jersey?	Manu Ginóbili	Tony Parker	Tim Duncan	David Robinson	c	SAS
936	This Spur was nicknamed "The Big Fundamental".	David Robinson	Tim Duncan	Avery Johnson	Pau Gasol	b	SAS
937	Which Spur has his own restaurant in San Antonio, and went to the same high school as Wilt Chamberlain?	Malik Rose	Tim Duncan	David Robinson	Tony Parker	a	SAS
938	This Spurs players dream was to be an olympic swimmer before he turned to basketball.	Pau Gasol	Tony Parker	David Robinson	Tim Duncan	d	SAS
939	Who was the Finals MVP for the Spurs during the 2002-03 season?	Tim Duncan	Manu Ginóbili	David Robinson	Tony Parker	a	SAS
940	Who was the first Spur to ever score over 70 points in a game?	Tony Parker	David Robinson	Manu Ginóbili	Tim Duncan	b	SAS
941	Who was the coach that led the Spurs to their 5th title since 1999?	John Lucas	Gregg Popovich	Rex Hughes	Bob Hill	b	SAS
942	This former Spurs coach graduated from the Air Force Academy with a degree in Soviet Studies, and almost became a spy.	John Lucas	Rex Hughes	Gregg Popovich	Bob Hill	c	SAS
943	What is the mascot name for the Spurs?	The Texan	Bango	Rumble the Bison	The Coyote	d	SAS
944	Which Frenchman has played point guard for the Spurs since 2001?	Avery Johnson	Manu Ginóbili	Tony Parker	George Gervin	c	SAS
945	This Spurs player beat out Shaquille O'Neal for the 1993-94 NBA Scoring Title.	Tony Parker	Tim Duncan	David Robinson	Manu Ginóbili	c	SAS
946	Who is the only Spurs player other than Alvin Robertson to have recorded a quadruple-double?	David Robinson	Tony Parker	Manu Ginóbili	Tony Parker	a	SAS
947	Which former Spur became an ordained minister in the early 1990s?	Tim Duncan	Terry Cummings	Boris Diaw	Tony Parker	b	SAS
948	Which famous NBA journeyman joined the Spurs in the 2003-04 season.	Nate Robinson	Moses Malone	Andre Miller	Robert Horry	d	SAS
949	Which native Argentinian came off the bench to provide valuable minutes for the Spurs?	Terry Cummings	Boris Diaw	Manu Ginóbili	Robert Horry	c	SAS
950	What was the nickname given to the 1999 Spurs' starting point guard, Avery Johnson?	The Little General	The Mini General	The Tiny General	The General	a	SAS
951	This spurs player grew up in the U.S. Virgin Islands.	David Robinson	Manu Ginóbili	Tim Duncan	Boris Diaw	c	SAS
952	The Spurs drafted this player 1st overall during the 1997 NBA draft.	Tony Parker	Manu Ginóbili	Tim Duncan	David Robinson	c	SAS
953	Which member of the 1998-99 Spurs Championship team was the first player in NBA history to return to the game after a kidney transplant?	Sean Elliot	Steve Kerr	Avery Johnson	Tim Duncan	a	SAS
954	This Spurs player won the Finals MVP award during his third year in the league.	David Robinson	Kawhi Leonard	Tony Parker	Tim Duncan	b	SAS
955	Who did the Spurs play in the NBA finals in the 2006-07 season?	Lakers	Cavaliers	Heat	Celtics	b	SAS
956	George Gervin was immortalized in a shoe poster in which this "Iceman" was sitting upon an ice throne. Which was the shoe company that ran the poster in the early 1980s?	Air Jordan	And1	Adidas	Nike	d	SAS
957	Which team eliminated the Spurs in the 2000 playoffs?	Mavericks	Lakers	Suns	Rockets	c	SAS
958	In which year was David Robinson named league MVP?	1995-96	1997-98	1999-00	1994-95	d	SAS
959	 Which Spurs player won the NBA Sixth Man of the Year award during the 2007-08 season?	Tony Parker	Manu Ginóbili	Robert Horry	Bruce Bowen	b	SAS
960	Who is known on the Spurs for wearing their practice shorts backwards?	Tony Parker	Manu Ginóbili	Robert Horry	Tim Duncan	d	SAS
961	This Spurs coach has been working with the team for 25 years and led them to into the playoffs 22 times.	Larry brown	Stan Albeck	Bob Bass	Gregg Popovich	d	SAS
962	How many different coaches have the Spurs won their 5 championships with?	2	3	1	4	c	SAS
963	During the 2019-20 season this coach set the record for the longest coaching tenure with the same team.	Rick Carlisle	Erik Spoelstra	Terry Stotts	Gregg Popovich	d	SAS
964	In which year was David Robinson drafted by the Spurs?	1987	1985	1990	1986	a	SAS
965	The Spurs drafted this player 1st overall during the 1987 NBA draft.	David Robinson	Alvin Robertson	Tim Duncan	Willie Anderson	a	SAS
966	This player wore the number 6 for the Spurs.	Tony Parker	Avery Johnson	Manu Ginóbili	Tim Duncan	b	SAS
967	This player wore the number 9 for the Spurs.	Avery Johnson	Manu Ginóbili	Tony Parker	Tim Duncan	c	SAS
968	This player wore the number 20 for the Spurs.	Tony Parker	Avery Johnson	Tim Duncan	Manu Ginóbili	d	SAS
969	This player wore the number 21 for the Spurs.	Avery Johnson	Tim Duncan	Manu Ginóbili	Tony Parker	b	SAS
970	This player wore the number 50 for the Spurs.	Avery Johnson	Manu Ginóbili	Tim Duncan	David Robinson	d	SAS
971	This Spurs player was inducted into the Hall of Fame in 2020	Manu Ginóbili	Tim Duncan	Tony Parker	Avery Johnson	b	SAS
972	This Spurs player is the franchise leader for the most Games Played.	Tony Parker	David Robinson	Manu Ginóbili	Tim Duncan	d	SAS
973	This Spurs player is the franchise leader for the most Fied Goals.	David Robinson	Tony Parker	Tim Duncan	George Gervin	c	SAS
974	This Spurs player is the franchise leader for the most 3-Pt Field Goals.	Danny Green	Patty Mills	Manu Ginóbili	Bruce Bowen	c	SAS
975	This Spurs player is the franchise leader for the most Free Throws.	Tim Duncan	Manu Ginóbili	George Gervin	David Robinson	d	SAS
976	This Spurs player is the franchise leader for the most Total Rebounds.	Tim Duncan	Manu Ginóbili	George Gervin	David Robinson	a	SAS
977	This Spurs player is the franchise leader for the most Assists.	Avery Johnson	Tony Parker	Tim Duncan	Manu Ginóbili	b	SAS
978	This Spurs player is the franchise leader for the most Steals.	Manu Ginóbili	David Robinson	George Gervin	Tony Parker	a	SAS
979	This Spurs player is the franchise leader for the most Triple-Doubles.	George Gervin	Alvin Robertson	David Robinson	Tim Duncan	c	SAS
980	This Spurs forward was traded to the Toronto Raptors during the 2018-19 season and went on to win the championship.	Tim Parker	Kawhi Leonard	DeMar DeRozan	Danny Green	b	SAS
981	This Spurs guard was traded to the Toronto Raptors during the 2018-19 season and went on to win the championship.	Kawhi Leonard	Danny Green	DeMar DeRozan	Tim Parker	b	SAS
982	What was the original home and team name of the Atlanta Hawks?	St. Louis Hawks	Detroit Falcons	Washington Generals	Buffalo Bisons	d	ATL
983	How many NBA championships have the Atlanta Hawks won?	0	1	2	3	b	ATL
984	Which of the following players has never won an NBA dunk contest as a member of the Atlanta Hawks?	Spud Webb	Vince Carter	Dominique Wilkins	Josh Smith	b	ATL
985	Which of the following players was drafted by the Atlanta Hawks?	Dikembe Mutombo	Trae Young	Dominique Wilkins	Luka Doncic	d	ATL
986	Which of the following players was drafted by the Atlanta Hawks?	Spud Webb	Joe Johnson	Pau Gasol	Dirk Nowitzki	c	ATL
987	Which of the following players was drafted by the Atlanta Hawks?	Hakeem Olajuwan	Pete Maravich	Steve Smith	Paul Millsap	b	ATL
988	At which position was Trae Young drafted?	5	4	2	3	a	ATL
989	Which college did Trae Young play for?	Oklahoma	University of Southern California	Duke University	University of Kentucky	a	ATL
990	How many NBA dunk contests has Dominique Williams won?	2	1	3	0	a	ATL
991	How many NBA dunk contests has Spud Webb won?	3	2	1	0	c	ATL
992	How many NBA dunk contests has Josh Smith won?	1	3	2	0	a	ATL
993	Who is the Atlanta Hawks' franchise leader in points?	Dominique Wilkins	Trae Young	Bob Pettit	Joe Johnson	a	ATL
994	Who is the Atlanta Hawks' franchise leader in points-per-game?	Doc Rivers	Bob Pettit	Trae Young	Dominique Wilkins	d	ATL
995	Who is the Atlanta Hawks' franchise leader in assists?	Mookie Blaylock	Trae Young	Jeff Teague	Doc Rivers	d	ATL
996	Who is the Atlanta Hawks' franchise leader in assists-per-game?	Steve Nash	Trae Young	Doc Rivers	Pete Maravich	b	ATL
997	Who is the Atlanta Hawks' franchise leader in blocks?	Dwight Howard	Tree Rollins	Josh Smith	Dikembe Mutombo	b	ATL
998	Who is the Atlanta Hawks' franchise leader in steals?	Doc Rivers	Speedy Claxton	Jeff Teague	Mookie Blaylock	d	ATL
999	Who is the Atlanta Hawks' franchise leader in total rebounds?	Tyson Chandler	Ben Wallace	Bob Pettit	Al Horford	c	ATL
1000	What is the Atlanta Hawks' single single season win record which was set in 2014-2015?	73	60	63	55	b	ATL
1001	What is the Atlanta Hawks' all-time low for wins in a season?	34	13	19	26	b	TL
1002	What is the name of the Atlanta Hawks' mascot?	Harry the Hawk	Larry the Bird	Golden Hawk	AJ Hawk	a	ATL
1003	What is the name of the stadium in which the Atlanta Hawks play?	State Farm Arena	Staples Center	Oracle Arena	Madison Square Gardens	a	ATL
1004	Who was the winner of the first NBA MVP award?	Wilt Chamberlain, Boston Celtics	Willis Reed, Toronto Huskies	Bill Russell, Philadelphia Warriors	Bob Pettit, St. Louis Hawks	d	ATL
1005	Who is the Atlanta Hawks' franchise leader in 3-pointers made?	Dominique Wilkins	Ray Allen	Mookie Blaylock	Joe Johnson	c	ATL
1006	Who is the Atlanta Hawks' franchise leader in games played?	Rasheed Wallace	Mookie Blaylock	Dennis Schröder	Dominique Wilkins	d	ATL
1007	Which team was Luka Doncic drafted by?	Atlanta Hawks	Minnesota Timberwolves	LA Lakers	Dallas Mavericks	a	ATL
1008	Which division do the Atlanta Hawks play in?	Northwest division	Atlantic division	Pacific division	Southeast division	d	ATL
1009	How many NBA finals appearances have the Atlanta Hawks made?	4	5	2	3	a	ATL
1010	Which of the following players has never played on the Atlanta Hawks?	Tracy McGrady	Grant Hill	Vince Carter	Rasheed Wallace	b	ATL
1011	How many NBA dunk contests have been won by Atlanta Hawks?	3	4	6	5	b	ATL
1012	Who is the Atlanta Hawks' franchise leader in All-Star selections?	Bob Pettit	Joe Johnson	Lou Hudson	Dominique Wilkins	a	ATL
1013	Who is the Atlanta Hawks' franchise leader in blocks-per-game?	Josh Smith	Dikembe Mutombo	Dominique Wilkins	Jon Konack	b	ATL
1014	Who is the Atlanta Hawks's franchise leader in free-throw percentage?	Josh Smith	Kyle Korver	Josh Childress	Kyle Lowry	b	ATL
1015	What is Trae Young's jersey number?	95	0	23	11	d	ATL
1016	What is Dominique Wilkins' nickname?	Half-Man Half-Amazing	The Human Highight Reel	Chocolate Thunder	The Dream	b	ATL
1017	Which of the following players did not represent the Atlanta Hawks at the 2014-15 All-Star game?	Mike Bibby	Al Horford	Kyle Korver	Jeff Teague	c	ATL
1018	Which of the following players was drafted by the Atlanta Hawks?	Kris Dunn	Kent Bazemore	Denis Schröder	Vince Carter	c	ATL
1019	Which of the following players has never played for the Atlanta Hawks?	Jamal Crawford	Mike Bibby	Rasheed Wallace	Gilbert Arenas	d	ATL
1020	Who holds the Atlanta Hawks' single season record for turnovers?	Trae Young	Dwight Howard	Mike Bibby	Jeff Teague	a	ATL
1021	What was Dikembe Mutombo's signature celebration after blocking a shot?	Raise the roof	Finger wag	Two thumbs down	Shrug	b	ATL
1022	Who did the Atlanta Hawks defeat in the 1958 NBA Finals to win their first NBA championship?	Washington Bullets	Oklahoma City Thunder	Boston Celtics	Houston Mavericks	c	ATL
1023	Who is the oldest player to score 20+ points in an NBA game?	Michael Jordan	Vince Carter	Wilt Chamberlain	Tim Duncan	b	ATL
1024	Who is the shortest player to win an NBA dunk contest?	Supd Webb	Dee Brown	Ty Lawson	Nate Robinson	a	ATL
1025	In which city was the Hawks frachise  located before they moved to Atlanta?	St. Louis	Denver	Dallas	Vancouver	a	ATL
1026	What is Trae Young's nickname?	The Jet	The Worm	Iceman	Ice Trae	d	ATL
1027	Which of the following NBA coaches have played for the Atlanta Hawks?	Stan Van Gundy	Nick Nurse	Doc Rivers	Steve Nash	c	ATL
1028	Which of the following NBA coaches have played for the Atlanta Hawks?	Erik Spoelstra	Tyronn Lue	Brad Stevens	Luke Walton	b	ATL
1029	Which of the following former NBA players is a minority owner of the Atlanta Hawks?	Isaiah Thomas	Dominique Wilkins	Grant Hill	Michael Jordan	c	ATL
1030	What was the original home and team name of the Atlanta Hawks?	Toronto Huskies	Baltimore Waizards	Chicago Packers	Chicago Bullets	c	WAS
1031	Which of the following is a former name of the Washington Wizards?	Washington Warlocks	Washington Generals	Washington Senators	Washington Bullets	d	WAS
1032	How many NBA Championships have the Washington Wizards won?	2	1	3	0	b	WAS
1033	Which of the following players has won an MVP title as a member of the Washington Wizards?	Gilbert Arenas	Wes Unsled	Michael Jordan	John Wall	b	WAS
1034	Which of the following players won the Rookie of the Year award as a member of the Washington Wizards?	Rui Hachimura	Bradley Beal	Wilt Chamberlain	Earl Monroe	d	WAS
1035	Which pair of Hall of Famers was drafted by the Washington Wizards franchise?	Kwame Brown, Michael Jordan	Reggie Miller, Earl Monroe	Wes Unsled, Earl Monroe	Wes Unsled, Michael Jordan	c	WAS
1036	In the 1970-1971 ECF, the Baltimore Bullets (Washington Wizards) advanced to the NBA finals by beating this team who were missing star player Willis Reed:	Oklahoma City Thunder	St. Louis Hawks	Los Angeles Lakers	New York Knicks	d	WAS
1037	Which team did the Washington Bullets beat in 1978 to win the NBA championship?	Boston Celtics	Seattle Supersonics	New York Knicks	Toronto Raptors	b	WAS
1038	Which of the following players was drafted by the Washington Wizards?	Russell Westbrook	Gilbert Arenas	Kwame Brown	Chris Webber	c	WAS
1039	Which of the following players was drafted by the Washington Wizards?	John Wall	Yao Ming	Isaiah Thomas	Jimmy Butler	a	WAS
1040	Which of the following players was not drafted by the Washington Wizards?	Gilbert Arenas	Bradley Beal	Rui Hachimura	John Wall	a	WAS
1041	Which of the following players was not drafted by the Washington Wizards?	Kwame Brown	Christian Laettner	Wes Unsled	Earl Monroe	b	WAS
1042	Who is the Washington Wizards' franchise leader in games played?	John Wall	Rui Hachimura	Oscar Robertson	Wes Unsled	d	WAS
1043	Who is the Washington Wizards' franchise leader in points?	Gilbert Arenas	David Thompson	Kareem Abdul-Jabbar	Elvin Hayes	d	WAS
1044	Who is the Washington Wizards' franchise leader in career points-per-game?	John Wall	Wes Unsled	Walt Bellamy	Alex English	c	WAS
1045	Who is the Washington Wizards' franchise leader in points-per-game in a season?	John Wall	Walt Bellamy	Michael Jordan	Bradley Beal	b	WAS
1046	Who is the Washington Wizards' franchise leader in career assists?	Bradley Beal	Brandon Jennings	Isaiah Thomas	John Wall	d	WAS
1047	Who is the Washington Wizards' franchise leader in assists-per-game?	John Stockton	Tyronn Lue	Rick Barry	John Wall	d	WAS
1048	Who is the Washington Wizards' franchise leader in career rebounds?	Caron Butler	JaVale McGee	Wes Unsled	Oscar Robertson	c	WAS
1049	Who is the Washington Wizards' franchise leader in rebounds-per-game?	Kwame Brown	Gilbert Arenas	Brendan Haywood	Walt Bellamy	d	WAS
1050	Who is the Washington Wizards' franchise leader in career  blocks?	Elvin Hayes	Lew Alcindor	Ben Wallace	JaVale McGee	a	WAS
1051	Who is the Washington Wizards' franchise leader in blocks-per-game?	Bol Bol	Ben Wallace	Kwame Brown	Manute Bol	d	WAS
1052	Which of the following players led the NBA in steals-per-game in the 2004-2005 season as a member of the Washington Wizards?	Allen Iverson	Tyronn Lue	Gilbert Arenas	Larry Hughes	d	WAS
1053	Who is the Washington Wizards' franchise leader in career steals?	Kris Humphries	Scott Disick	John Wall	Larry Hughes	c	WAS
1054	What was Michael Jordan's jersey number as member of the Washington Wizards?	23	99	0	45	a	WAS
1055	What was Gilbert Arenas' jersey number as a member of the Washington Wizards?	0	32	1	23	a	WAS
1056	Which of the following was one of Gilbert Arenas' nicknames?	Magic	Wasabi	Agent Zero	The Glove	c	WAS
1057	What is the name of stadium the Washington Wizards play in?	The Staples Centre	The Capital One Arena	Madison Square Garden	The Gilbert Arena	b	WAS
1058	Who holds the Washington Wizards' single game scoring record?	Al Harrington	Caron Butler	Gilbert Arenas	Michael Jordan	c	WAS
1059	What is the Washington Wizards' single season win record?	45	60	50	72	b	WAS
1060	What is the Washington Wizards' all-time low for wins in a season?	18	9	33	30	a	WAS
1061	What is the name of the Washington Wizards' mascot?	Merlin the Wiz	Morty the Magician	Pickle Rick	G-Wiz	d	WAS
1109	Who is the Charlotte Hornets' franchise leader in career assists?	Kyrie Irving	Rafer Alston	Sean Felton	Kemba Walker	d	CHA
1062	This Washington Wizard is the only player to score 40+ points after the age of 40 years old:	Michael Jordan	Jerry Stackhouse	Wes Unsled	Moses Malone	a	WAS
1063	This former Washington Wizard became the only NBA player in history to retire with more career blocked shots than points scored?	Ben Wallace	Bol Bol	Manute Bol	Kwame Brown	c	WAS
1064	Which of the following players was drafted by the Washington Wizards?	Grant Hill	Richard Hamilton	Kobe Bryant	Russell Westbrook	b	WAS
1065	What is the name of the Minnesota Timberwolves' home arena?	Madison Square Garden	Barclay's Center	Target Center	Air Canada Center	c	MIN
1066	Which NBA franchise was previously located in Minnesota?	Toronto Raptors	Los Angeles Lakers	Charlotte Hornets	Washington Wizards	b	MIN
1067	In 1987, the NBA granted 4 cities an NBA team as a part of its expansion. Which of the following cities was not among them:	Minnesota	Toronto	Charlotte	Orlando	b	MIN
1068	Which former Minnesota Timberwolves player was nicknamed "The Big Ticket"	Kevin Garnett	Wally Szczerbiak	Stephon Marbury	Karl-Anthony Town	a	MIN
1069	Which is the correct spelling of name of the Minnesota Timberwolves' F/C nicknamed "KAT":	Karl-Anthony Towns	Karl Anthony-Towns	Karl-Anthony-Towns	Karl Anthony Towns	a	MIN
1070	Which of the following players was drafted by the Minnesota Timberwolves?	Brian Scalabrine	Kevin Garnett	Latrell Spreewell	D'Angelo Russell	b	MIN
1071	Which of the following players was drafted by the Minnesota Timberwolves?	Stephon Marbury	Sam Cassell	Ray Allen	JJ Redick	c	MIN
1072	Which of the following players was drafted by the Minnesota Timberwolves?	Al Jefferson	Jason Richardson	Dirk Nowitzki	Zach Lavine	d	MIN
1073	What the the Minnesota Timberwolves' franchise record for wins in a season?	73	52	69	58	d	MIN
1074	How many NBA championships have the Minnesota Timberwolves won?	0	1	2	3	a	MIN
1075	Which of the following players has won an NBA MVP as a member of the Minnesota Timberwolves?	Kevin Garnett	Christian Laettner	Karl-Anthony Towns	Kevin Love	a	MIN
1076	How many dunk contests has Zach Lavine won?	0	2	3	1	b	MIN
1077	What is the Minnesota Timberwolves all-time low for wins in a season?	35	8	15	32	c	MIN
1078	What is the name of the Minnesota Timberwolves' mascot?	Crunch the Wolf	Jacob the Wolf	The Hooded Fang	Blaze the Timberwolf	a	MIN
1079	Which division do the Minnesota Timberwolves play in?	Southwest	Pacific	Northwest	Atlantic	c	MIN
1080	Who is the Minnesota Timberwolves' franchise leader in games played?	Karl-Anthony Towns	Nikola Pekovic	Wally Szczerbiak	Kevin Garnett	d	MIN
1081	Who is the Minnesota Timberwolves' franchise leader in career points?	Latrell Spreewell	Sam Mitchell	Kevin Garnett	Karl-Anthony Towns	c	MIN
1082	Who is the Minnesota Timberwolves' franchise leader in  points-per-game?	Wally Szczerbiak	Andrew Wiggins	Karl-Anthony Towns	Latrell Spreewell	c	MIN
1083	Who is the Minnesota Timberwolves' franchise leader in career rebounds?	Kevin Garnett	Al Jefferson	Rasho Nesterovic	Kevin Love	a	MIN
1084	Who is the Minnesota Timberwolves' franchise leader in  rebounds-per-game?	Kevin Love	Hakeem Olajuwan	Kevin Garnett	Larry Johnson	a	MIN
1085	Who is the Minnesota Timberwolves' franchise leader in  career assists?	Kevin Garnett	Stephon Marbury	Ricky Rubio	John Stockton	a	MIN
1086	Who is the Minnesota Timberwolves' franchise leader in assist-per-game?	Randy Foye	Ricky Rubio	Kevin Garnett	Stephon Marbury	b	MIN
1087	Who is the Minnesota Timberwolves' franchise leader in career steals?	Ricky Rubio	Corey Brewer	Kevin Garnett	Johnny Flynn	c	MIN
1088	Who is the Minnesota Timberwolves' franchise leader in steals-per-game?	Corey Brewer	Ricky Rubio	Kevin Love	Sam Cassell	b	MIN
1089	Which player set the Minnesota Timberwolves' franchise record for points in a game?	Kevin Garnett	Mo Williams	Andrew Wiggins	Karl-Anthony Towns	d	MIN
1090	Who did the Minnesota Timberwolves trade Kevin Garnett to in 2007?	Los Angeles Clippers	Washington Wizards	Boston Celtics	Brooklyn Nets	c	MIN
1091	Which team did the Minnesota Timberwolves acquire Andrew Wiggins from?	Phoenix Suns	Brooklyn Nets	Toronto Raptors	Cleveland Cavaliers	d	MIN
1092	Which team did the Minnesota Timberwolves acquire D'Angelo Russell from?	Brooklyn Nets	Los Angeles Lakers	Golden State Warriors	Phoenix Suns	c	MIN
1093	What is the furthest the Minnesota Timberwolves had made it into the NBA Playoffs?	Western Conference Finals	NBA Finals	Champions	Conference Semi-finals	a	MIN
1094	How long is the Minnesota Timberwolves' franchise record winning streak?	5	25	11	23	c	MIN
1095	What is the original name of the Charlotte Hornets franchise?	Storm	Pelicans	Sting	Bobcats	d	CHA
1096	When current Charlotte Hornets franchise play its first NBA game?	2014-2015	1985-1986	1941-1942	2004-2005	d	CHA
1097	In 2002, this founder of a TV channel became the first African American majority owner of an NBA franchise when his group was awarded a franchise in New Orleans:	Mark Cuban	Robert L. Johnson	Earl Gilbert Graves	Michael Jordan	b	CHA
1098	Who is the only African American majority owner of an NBA franchise?	Shaquille O'Neal, Sacramento Kings	Jay Z, Brooklyn Nets	Grant Hill, Atlanta Hawks	Michael Jordan, Charlotte Hornets	d	CHA
1099	The Charlotte Bobcats franchise only had one NBA all-star before becoming the Charlotte Hornets. What is the name of this player?	Gerald Wallace	Larry Johnson	Kemba Walker	Alonzo Mourning	a	CHA
1100	In which year did the Charlotte Bobcats officially change their name to the Hornets?	1988	1956	2014	2004	c	CHA
1101	Which of the Ball brothers was drafted by the Charlotte Hornets in 2020?	Lonzo	LaMelo	Lavar	LiAngelo	b	CHA
1102	How many NBA championships has the current Charlotte Hornets franchise won?	0	1	3	2	a	CHA
1103	What is the furthest the Charlotte Hornets have advanced in the NBA playoffs?	NBA finals	Eastern conference quarter-finals	Eastern conference semi-finals	Eastern conference finals	b	CHA
1104	Who is the Charlotte Hornets' franchise leader in games played?	Malik Monk	Kemba Walker	LaMelo Ball	Emeka Okafor	b	CHA
1105	Who is the Charlotte Hornets' franchise leader in career points?	Kemba Walker	Dell Curry	Adam Morrison	Sean May	a	CHA
1106	Who is the Charlotte Hornets' franchise leader in points per game?	Stephen Jackson	Kemba Walker/Stephen Jackson	Kemba Walker	Larry Johnson	b	CHA
1107	Who is the Charlotte Hornets' franchise leader in career rebounds?	Bismack Biyombo	Mason Plumlee	Emeka Okafor	Cody Zeller	c	CHA
1108	Who is the Charlotte Hornets' franchise leader in rebounds-per-game?	Bismack Biyombo	Alonzo Mourning	Emeka Okafor	Baron Davis	c	CHA
1110	Who is the Charlotte Hornets' franchise leader in assist-per-game?	Devonte' Graham	Terry Rozier	LaMelo Ball	Brevin Knight	d	CHA
1111	Who is the Charlotte Hornets' franchise leader in career blocks?	Bismack Biyombo	Anthony Davis	Marvin Williams	Emeka Okafor	d	CHA
1112	Who is the Charlotte Hornets' franchise leader in blocks-per-game?	Cody Zeller	Emeka Okafor	Miles Plumlee	Aron Baynes	b	CHA
1113	Who is the Charlotte Hornets' franchise leader in career steals?	Gary Payton	Terry Rozier	Brevin Knight	Gerald Wallace	d	CHA
1114	Who is the Charlotte Hornets' franchise leader in steals-per-game?	Brevin Knight	Malcolm Brogdon	Cory Joseph	Bismack Biyombo	a	CHA
1115	Which team holds the record for the fewest wins in a season? (note: This record was set in a shortened season)	Clevelan Cavaliers	New York Knicks	Philadelphia 76ers	Charlotte Bobcats	d	CHA
1116	The Charlotte Bobcats hold the NBA record for fewest wins in a season. How many wins did they have in this record-setting season? (Note: This record was set in a shortened season)	10	20	6	3	c	CHA
1117	Which of the following players was drafted by the Charlotte Hornets?	Kemba Walker	Terry Rozier	Anthony Davis	Shawn Kemp	a	CHA
1118	Which of the following players was drafted by the Charlotte Hornets?	Trae Young	Ja Morant	LaMelo Ball	RJ Barret	c	CHA
1119	At which position was Emeka Okafor drafted by the Charlotte Bobcats?	1st overall	2nd overall	58th overall	59th overall	b	CHA
1120	Which of these former Charlotte Bobcats/Hornets players is a former rookie of the year winner?	Emeka Okafor	Raymond Felton	Kemba Walker	Adam Morrison	a	CHA
1121	Which division do the Charlotte Hornets play in?	Pacific division	Atlantic division	Northwest division	Southeast division	d	CHA
1122	What is the name of the Charlotte Hornets Mascot?	Hugo the Hornet	Charlotte the Hornet	Sting	Barry the Bee	a	CHA
1123	What is the Charlotte Hornets franchise record for wins in a season?	36	69	73	48	d	CHA
1124	Who holds the Charlotte Hornets' franchise record for points in a game?	Kemba Walker, 45 points	Kemba Walker, 60 points	Gerald Wallace, 70 points	Emeka Okafor, 50 points	b	CHA
1125	When did the Orlando Magic play their first NBA game?	1989-1990	2014-2015	1954-1955	2000-2001	a	ORL
1126	Who did the Orlando Magic pick 1st overall in the 1992 NBA draft?	Shaquille O'Neal	Dwight Howard	Patrick Ewing	Lebron James	a	ORL
1127	Which team drafted Dwight Howard with the 1st overall pick in the 2004 NBA draft?	Orlando Magic	Los Angeles Lakers	Houston Rockets	Atlanta Hawks	a	ORL
1128	What is the furthest the Orlando Magic have made it into the playoffs?	Eastern Conference Finals	NBA Finals	Eastern Conference Quarter-Finals	NBA Champions	b	ORL
1129	How many NBA Championships have the Orlando Magic won?	2	0	3	1	b	ORL
1130	The Orlando Magic have had many notable players since the creation of the team. Which of the following players is not among them?	Dwight Howard	Dirk Nowitzki	Tracy McGrady	Penny Hardaway	b	ORL
1131	The Orlando Magic have had many notable players since the creation of the team. Which of the following players is not among them?	Karl Malone	Grant Hill	Shaquille O'Neal	Vince Carter	a	ORL
1132	Which team did the Orlando Magic play in the 1994-1995 NBA Finals?	Houston Rockets	Toronto Raptors	Memphis Grizzlies	Golden State Warriors	a	ORL
1133	Which of the following players was drafted by the Orlando Magic?	Chris Webber	Steve Nash	Jason Kidd	Larry Johnson	a	ORL
1134	Doc Rivers was named named Coach of the Year as a rookie head coach in 2000. Which team was he coaching at the time?	Los Angeles Clippers	Philadelphia 76ers	Boston Celtics	Orlando Magic	d	ORL
1135	Which team did the Orlando Magic play in the 2008-2009 NBA Finals?	Memphis Grizzlies	San Antonio Spurs	Cleveland Cavaliers	Los Angeles Lakers	d	ORL
1136	Which of the following players has won an NBA dunk contest as a member of the Orlando Magic?	Vince Carter	Dwight Howard	Aaron Gordon	Victor Oladipo	b	ORL
1137	What was the nickname of former Orlando Magic guard Anfernee Hardaway?	Mr. Crossover	Flash	Penny	The Truth	c	ORL
1138	How many players have won NBA MVP awards as member of the Orlando Magic?	3	2	1	0	d	ORL
1139	Which NBA award did Tracy McGrady win as a member of the Orlando Magic in the 2000-20001 season?	Most Improved Player	Sixth Man of the Year	Defensive Player of the Year	Most Valuable Player	a	ORL
1140	Dwight Howard has won 3 of these awards as a member of the Orlando Magic from 2009-2011:	Defensive Player of the Year	Sixth Man of the Year	Sportsmanship Award	Most Valuable Player	a	ORL
1141	This 4-time NBA champion won the 1993 Rookie of the Year award as a member of the Orlando Magic:	Penny Hardaway	Dwight Howard	Tracy McGrady	Shaquille O'Neal	d	ORL
1142	How many NBA MVP awards has Shaquille O'Neal won?	0	3	1	5	c	ORL
1143	Who is the Orlando Magic franchise leader in games played?	Grant Hill	Nick Anderson	Dominique Wilkins	Tracy McGrady	b	ORL
1144	Who is the Orlando Magic franchise leader in career points?	Evan Fournier	Dwight Howard	Tracy McGrady	Dennis Scott	b	ORL
1145	Who is the Orlando Magic franchise leader in points-per-game?	Tracy McGrady	Shaquille O'Neal	Vince Carter	Penny Hardaway	a	ORL
1146	Who is the Orlando Magic franchise leader in career rebounds?	Dwight Howard	Patrick Ewing	Nick Anderson	Hakeem Olajuwan	a	ORL
1147	Who is the Orlando Magic franchise leader in rebounds-per-game?	Shaquille O'Neal	Nikola Vucevic	Dwight Howard	Dominique Wilkins	c	ORL
1148	Who is the Orlando Magic franchise leader in career assists?	Nick Anderson	Jameer Nelson	Rafer Alston	Penny Hardaway	b	ORL
1149	Who is the Orlando Magic franchise leader in assists-per-game?	Elfrid Payton	Steve Francis	Scott Skiles	Tracy McGrady	c	ORL
1150	Who is the Orlando Magic franchise leader in career blocks?	Dwight Howard	Johnathan Isaac	Bo Outlaw	Shaquille O'Neal	a	ORL
1151	Who is the Orlando Magic franchise leader in blocks-per-game?	Bismack Biyombo	Aaron Gordon	Shaquille O'Neal	Mohamed Bamba	c	ORL
1152	What is the name of the Orlando Magic mascot?	Morty the Magician	Merlin the Magician	Stuff the Magic Dragon	Puff the Magic Dragon	c	ORL
1153	Which player holds the Orlando Magic franchise record for points in a game?	Dwight Howard	Grant Hill	Tracy McGrady	Shaquille O'Neal	c	ORL
1154	What is the Orlando Magic franchise record for wins in a season?	69	50	73	60	d	ORL
1155	Which of the following former Orlando Magic players is a member of the Hall of Fame?	Dennis Scott	Penny Hardaway	Patrick Ewing	Steve Nash	c	ORL
1156	Which of these Hall of Famers has played for the Orlando Magic?	Tim Duncan	Dominique Wilkins	Kevin Garnett	Charles Barkley	b	ORL
1157	Which of the following coaches has not coached the Orlando Magic?	Doc Rivers	Billy Donovan	Frank Vogel	Stan Van Gundy	b	ORL
1158	Which former Orlando Magic player holds the NBA record for assists in a game?	Rajon Rondo	Penny Hardaway	Steve Nash	Scott Skiles	d	ORL
1159	Which Orlando Magic became the first rookie to be voted an All-Star game starter since Michael Jordan did it it 1985	Penny Hardaway	Dwight Howard	Vince Carter	Shaquille O'Neal	d	ORL
1160	Who did the Orlando Magic acquire via a draft day trade with the Warriors in 1993?	Tracy McGrady	Anfernee Hardaway	Chris Webber	Shaquille O'Neal	b	ORL
1161	Which of the following players was not drafted by the Orlando Magic?	Victor Oladipo	Brendan Haywood	Dwight Howard	JJ Redick	b	ORL
1162	Which two teams played in the first NBA/BAA game in history?	New York Knicks and Boston Celtics	New York Knicks and Toronto Huskies	Boston Celtics and Minneapolis Lakers	Toronto Huskies and Minneapolis Lakers	b	NYK
1163	Where does the term Knicks come from?	A gentlement's club in New York founded in 1871 called the Knickerbocker Club	A book series written by Austrian writer Thomas Brezina called the Knickerbocker gang	A name applied to the Dutch settler of what would later become the city of New York	The USS Knickerbocker; A US Navy tug, minesweeper and dispatch ship stationed off the coast of New York	c	NYK
1164	What is the name of the arena in which the New York Knicks play their home games?	Madison Square Garden	TD Banknorth Garden	Staples Arena	Staples Centre	a	NYK
1165	This player was drafted by the New York Knicks in 1947 BAA draft broke the colour barrier in BAA/NBA:	Willie O'Ree	Moses Walker	Wataru Misaka	Chuck Cooper	c	NYK
1166	How many NBA Championships have New York Knicks won in their history?	7	2	5	0	b	NYK
1167	In which of following pair of years did the New York Knick win NBA championships?	1989-1999, 2001-2002	2015-2016, 2016-2017	1969-1970, 1972-1973	2006-2007, 2010-2011	c	NYK
1168	In the 1969-1970 NBA finals New York Knicks the injured Captain Willis Reed limped into Game 7 to rally the Knicks to a victory. How many points did he score game 7?	45	2	15	25	b	NYK
1169	Who did the New York Knicks pick 1st overall in the 1985 NBA draft after winning a controversial draft lottery?	Patrick Ewing	Shaquille O'Neal	David Robinson	Shawn Kemp	a	NYK
1170	Which of the following NBA coaches was drafted by the New York Knicks?	Phil Jackson	Luke Walton	Doc Rivers	Jason Kidd	a	NYK
1171	Which team did the New York Knicks lose to in the 1993-1994 NBA Finals?	Houston Rockets	Chicago Bulls	Los Angeles Lakers	Vancouver Grizzlies	a	NYK
1172	Which team did the New York Knicks lose to in the 1998-1999 NBA Finals?	San Antonio	Golden State Warriors	Houston Rockets	Phoenix Suns	a	NYK
1173	Which team did the New York Knicks beat in the 1972-1973 NBA Finals?	Portland Trailblazers	Dallas Mavericks	Minneapolis Lakers	Los Angeles Lakers	d	NYK
1174	Which team did the New York Knicks beat in the 1969-1970 NBA Finals?	San Francisco Warriors	Golden State Warriors	Philadelphia Warriors	Los Angeles Lakers	d	NYK
1175	Which of the following players was not drafted by the New York Knicks?	Nate Robinson	Iman Shumpert	RJ Barrett	Kristaps Prozingis	a	NYK
1176	Which of the following players was drafted by the New York Knicks?	J.R. Smith	Allan Houston	John Starks	Patrick Ewing	d	NYK
1177	Which of the following players has never played for the New York Knicks?	Charles Oakley	Charles Barkley	Kristaps Porzingis	Tracy McGrady	b	NYK
1178	Which of the following players has never played for the New York Knicks?	Willis Reed	Walt Frazier	Patrick Ewing	Shaquille O'Neal	d	NYK
1179	Which of the following players has never played for the New York Knicks?	Raymond Felton	Victor Oladipo	Rod Strickland	Frank Nitlikina	b	NYK
1180	From which team did the New York Knicks acquire Carmelo Anthony in a trade during the 2010-2011 season?	Portland Trailblazers	Denver Nuggets	Oklahoma City Thunder	Memphis Grizzlies	b	NYK
1181	How did Amare Stoudamire break his hand following the Knicks Game 2 loss to the Heat in the 2011-2012 Eastern Conference Quarter-Finals?	Slapped a fire extinguisher	Altercation with a Miami Heat fan	Motorcycle accident	Altercation with a teammate	a	NYK
1182	Which of the following rules is named after a New York Knicks player?	A free throw shooter is not allowed to cross the free throw line until the ball hits the rim	If under 2 minutes remaining in a game, a player fouled without the ball recieves two free throws and possession	If there are less than 0.3 s on the game clock, only tip-ins and high lobs can count as qualifying shots	5 second limit for an offensive dribbling the ball with his back to the basket when below the FT line	c	NYK
1183	Which of the following is the Trent Tucker rule named after the former NY Knicks player?	If there are less than 0.3 s on the game clock, only tip-ins and high lobs can count as qualifying shots	A player cannot inbound the basketball over the backboard	No player can touch the ball if any part of it is over the cylinder	A player cannot catch/obstruct an opponent's shot while it is on the downward portion of its flight and on its way to the rim	a	NYK
1184	Who is the New York Knicks' franchise leader in career games played?	Patrick Ewing	John Starks	Charles Barkley	Kristaps Porzingis	a	NYK
1185	Who is the New York Knicks' franchise leader in career points?	Kristaps Prozingis	Patrick Ewing	Carmelo Anthony	Steve Francis	b	NYK
1186	Who is the New York Knicks' franchise leader in points-per-game?	Bob McAdoo	Walt Frazier	Carmelo Anthony	Patrick Ewing	a	NYK
1187	Who is the New York Knicks' franchise leader in career assists?	Carmelo Anthony	Mark Jackson	Steve Francis	Walt Frazier	d	NYK
1188	Who is the New York Knicks' franchise leader in assists-per-game?	Antonio Davis	Stephon Marbury	Patrick Ewing	Mark Jackson	d	NYK
1189	Who is the New York Knicks' franchise leader in career rebounds?	Patrick Ewing	Walt Frazier	Charles Oakley	Willis Reed	a	NYK
1190	Who is the New York Knicks' franchise leader in rebounds-per-game?	Kristaps Porzingis	Tyson Chandler	Enes Kanter	Walt Bellamy	d	NYK
1191	What is the New York Knicks' franchise record for wins in a single season?	60	73	55	50	a	NYK
1192	What is the New York Knicks' single-game individual scoring record?	100 points	62 points	70 points	50 points	b	NYK
1193	Which player holds the New York Knicks' single-game individual scoring record?	Wilt Chamberlain	Kristaps Porzingis	Carmelo Anthony	Patrick Ewing	c	NYK
1194	Which player holds the New York Knick's single-game individual assists record?	Steve Nash	Chris Duhon	Steve Francis	Steve Novak	b	NYK
1195	How many dunk contests have been won by New York Knicks?	10	2	0	4	d	NYK
1196	How many 3-point contests have been won by New York Knicks?	13	4	10	0	d	NYK
1197	Where were the New York Knicks  originally located?	Chicago	New England	New York	Milwaukee	c	NYK
1198	Which Knicks player holds the NBA single-season record for field goal percentage?	Mitchell Robinson	Steve Francis	John Starks	Carmelo Anthony	a	NYK
1199	Which New York Knicks All-Star also pitched a shutout for the Chicago White Sox in the MLB?	Sandy Koufax	Dave DeBusschere	Patrick Ewing	Willis Reed	b	NYK
1200	Which former Knicks All-Star was arrested at Madison Square Garden in 2017?	Charles Oakley	Latrell Spreewell	Bill Russell	Willis Reed	a	NYK
1201	In which year were the Boston Celtics founded?	1988	1976	1996	1946	d	BOS
1202	Which of the following teams has the most franchise wins in NBA history?	New York Knicks	Boston Celtics	Los Angeles Lakers	Golden State Warriors	b	BOS
1203	Which NBA player holds the record for the most NBA championships as a player?	Wilt Chamberlain	Kareem Abdul-Jabbar	Bill Russell	Robert Horry	c	BOS
1204	Which of the following people has won an NBA title as a player while serving  as head coach at the same time?	Bob Pettit	Dave DeBusschere	Bill Russell	Lenny Wilkens	c	BOS
1205	Which NBA team has had 4 active players with at least career 20,000 points at the same time?	Boston Celtics, 2010-2011 - Paul Pierce, Kevin Garnett, Ray Allen, Shaquille O'Neal	Chicago Bulls, 1995-1996 - Michael Jordan, Scottie Pippen, Dennis Rodman, Toni Kukoc	LA Lakers, 2003-2004 - Kobe Bryant, Shaquille O'neal, Karl Malone, Gary Payton	San Antonio Spurs, 2016-2017 - Tim Duncan, Manu Ginobli, Tony Parker, Kawhi Leonard	a	BOS
1206	Which of the following players was not drafted by the Boston Celtics?	Marcus Smart	Bill Russell	Paul Pierce	Jalen Brown	b	BOS
1207	Which of the following players was not drafted by the Boston Celtics?	Jeff Green	Rajon Rondo	Jayson Tatum	Terry Rozier	b	BOS
1208	Which of the following players was not drafted by the Boston Celtics?	Delonte West	Gary Payton	Chauncey Billups	Antoine Walker	b	BOS
1209	How many players have won dunk contests as members of the Boston Celtics?	1	0	3	2	d	BOS
1210	Which of the following players have won a dunk contest as a member of the Boston Celtics?	Rick Fox	Nate Robinson	Jalen Brown	Gerald Green	d	BOS
1211	Which of the following players have won a dunk contest as a member of the Boston Celtics?	Spud Webb	Antoine Walker	Larry Brown	Dee Brown	d	BOS
1212	How many championships did the Boston Celtics win during the 1960s?	5	9	6	3	b	BOS
1213	Which of the following players was not a members of the "Big 3" formed by the Boston Celtics in 2007-2008?	Kevin Garnett	Shaquille O'Neal	Ray Allen	Paul Pierce	b	BOS
1214	Which player won NBA Finals MVP when the Boston Celtics won the NBA championship in 2008?	Paul Pierce	Ray Allen	Rajon Rondo	Kevin Garnett	a	BOS
1215	How many NBA MVP awards has Larry Bird won?	0	3	2	1	b	BOS
1216	How many NBA MVP awards has Bill Russell won?	8	3	5	1	c	BOS
1217	Which member of the Boston Celtics won the NBA Defensive Player of the Year in 2007-2008?	Brian Scalabrine	Kendrick Perkins	Kevin Garnett	Tony Allen	c	BOS
1218	Which of the following former Boston Celtics is nicknamed the "White Mamba"?	Brian Scalabrine	Larry Bird	Jason Williams	Gordon Hayward	a	BOS
1219	Which of these Boston Celtics has won the Rookie of the Year Award?	Jayson Tatum	Larry Bird	Antoine Walker	Paul Pierce	b	BOS
1220	Which of the following Boston Celtics player won the 1991 Dunk contest with his famous "No Look" dunk?	Nate Robinson	Paul Pierce	Dee Brown	Ricky Davis	c	BOS
1221	Who is the Boston Celtics francishe leader in career games played?	Paul Pierce	Bill Russell	John Havlicek	Larry Bird	c	BOS
1222	Which Boston Celtics player won the first three NBA 3-point shooting contests in NBA history?	Peja Stojakovic	Larry Bird	Jason Kapono	Ray Allen	b	BOS
1223	Which of the following frachises is not tied for the lead in total 3-point contest wins?	Boston Celtics	Miami Heat	Toronto Raptors	Chicago Bulls	c	BOS
1224	Who is the Boston Celtics' franchise leader in career points?	John Havlicek	Bill Russell	Danny Ainge	Kevin McHale	a	BOS
1225	Who is the Boston Celtics' franchise leader in career rebounds?	Larry Bird	Bill Russell	Robert Parrish	Kevin Garnett	b	BOS
1226	Who is the Boston Celtics' franchise leader in rebounds-per-game?	Antoine Walker	Bill Russell	Robert Parrish	Kevin Garnett	b	BOS
1227	Who is the Boston Celtics' franchise leader in points-per-game?	Bill Russell	Isaiah Thomas	Kyrie Irving	Larry Bird	b	BOS
1228	Who is the Boston Celtics' franchise leader in career assists?	Bob Cousy	Kyrie Irving	Kemba Walker	Rajon Rondo	a	BOS
1229	Who is the Boston Celtics' franchise leader in assists-per-game?	Chauncey Billups	Rajon Rondo	Delonte West	Iasaiah Thomas	b	BOS
1230	Who is the Boston Celtics' franchise leader in career blocks?	Robert Parish	Kevin Garnett	Tony Battie	Kendrick Perkins	a	BOS
1231	What is the name of the Boston Celtics' Mascot?	Mickey the Mucker	Lucky the Leprechaun	The Celtic Guardian	Hoopy the Huddle Hound	b	BOS
1232	What did Celtics coach Red Auerbach often do when he thought victory was assured?	Smoke a cigar	Change his outfit	Eat a sandwich	Go to the locker room early	a	BOS
1233	Which Celtics player scored 60 points in a single game?	Robert Parrish	Isaiah Thomas	Bill Russell	Larry Bird	d	BOS
1234	Which Celtic is one of only five NBA players to lead his team in all five major statistical categories for a season?	Kevin McHale	Bill Russell	Isaiah Thomas	Dave Cowens	d	BOS
1235	Which Celtic was the first African-American player in the NBA	Bill Russell	Chuck Cooper	Lavoy Allen	Earl Lloyd	b	BOS
1236	Which Celtics player grabbed 50 rebounds in a single game?	Bill Russell	Robert Parrish	Wilt Chamberlain	Kevin Garnett	a	BOS
1237	Which of the following players was one of only five NBA players to lead his team in all five major statistical categories (pts, reb, ast, stl, blk) for a season?	Michael Jordan	Kobe Bryant	Tim Duncan	Scottie Pippen	d	CHI
1238	Which of the following players was one of only five NBA players to lead his team in all five major statistical categories (pts, reb, ast, stl, blk) for a season?	Kevin Love	Kevin Garnett	Kobe Bryant	Bill Russell	b	MIN
1239	Which of the following players was one of only five NBA players to lead his team in all five major statistical categories (pts, reb, ast, stl, blk) for a season?	Tracy McGrady	Tim Duncan	Lebron James	Shaquille O'Neal	c	CLE
1240	Which of the following players was one of only five NBA players to lead his team in all five major statistical categories (pts, reb, ast, stl, blk) for a season?	Giannis Antetokounmpo	Dirk Nowitzki	Anthony Davis	Kobe Bryant	a	ZZZ
1241	In which year was Larry Bird drafted by the Boston Celtics?	1978	1996	1965	1989	a	BOS
1242	Which of the following is one of Larry Bird's nicknames?	Tweety Bird	The Eagle	Larry Legend	Lar Bear	c	BOS
1243	Which team did the Boston Celtics beat in the 2008 NBA finals to win the championship?	San Antonio Spurs	Dallas Mavericks	Los Angeles Lakers	Portland Trailblazers	c	BOS
1244	During the 1960s the Boston Celtics won 9 out of the possible 10 championships in the decade. In which season did they not win?	1968-1969	1966-1967	1960-1961	1963-1964	b	BOS
1245	Which of the following former Boston Celtics was nicknamed "The Truth"?	Paul Pierce	Bill Russell	Larry Bird	Ray Allen	a	BOS
1246	Which of the following former Boston Celtics was nicknamed "The Hick from French Lick"?	Brian Scalabrine	Larry Bird	Danny Ainge	John Havlicek	b	BOS
1247	How many NBA Championships has the Boston Celtics franchise won?	10	6	17	21	c	BOS
1248	Which two teams are currently tied for most NBA championship titles in history?	Boston Celtics and Chicago Bulls	San Antonio Spurs and Chicago Bulls	Boston Celtics and LA Lakers	Chicago Bulls and LA Lakers	c	BOS
1249	Which of the following players retired as a Boston Celtic?	Ray Allen	Shaquille O'Neal	Kevin Garnett	Danny Ainge	b	BOS
1250	Which NBA franchise currently has the most Hall of Fame Members with 38 (includes former players and former coaches)?	Chicago Bulls	Atlanta Hawks	Boston Celtics	New York Knicks	c	BOS
1251	In which arena do the Boston Celtics play their home games?	United Centre	Madison Square Garden	TD BankNorth Garden	Staples Centre	c	BOS
1252	What was the original city and team name of the Philadelphia 76ers franchise?	Washington Bullets	Philadelphia Flyers	Syracuse Nationals	St. Louis Hawks	c	PHI
1253	When was the Philadelphia 76ers franchise formed?	1998	2004	1946	1988	c	PHI
1254	In which arena do the Philadelphia 76ers play their home games?	Chesapeake Energy Arena	Wells-Fargo Centre	Barclay's Centre	Staples Centre	b	PHI
1255	Which of the following Hall of Fame members has played for the Philadelphia 76ers franchise?	Wilt Chamberlain	Jerry West	Bill Russell	George Mikan	a	PHI
1256	Which of the following Hall of Fame members has played for the Philadelphia 76ers franchise?	Karl Malone	Kobe Bryant	Allen Iverson	Gary Payton	c	PHI
1257	Which of the following Hall of Fame members has played for the Philadelphia 76ers franchise?	Scottie Pippen	Charles Barkley	Grant Hill	John Stockton	b	PHI
1258	Which of the following Hall of Fame members has played for the Philadelphia 76ers franchise?	George Gervin	Julius Erving	Larry Bird	Kevin McHale	b	PHI
1259	How many NBA championships have the Philadelphia 76ers franchise won?	1	0	3	6	c	PHI
1260	How many players have won NBA MVP as a member of the Philadelphia 76ers franchise?	8	1	4	0	c	PHI
1261	Which of the following players has not won an NBA MVP award as a member of the Philadelphia 76ers?	Moses Malone	Charles Barkley	Julius Erving	Allen Iverson	b	PHI
1262	Which of the following teams has the worst franchise win percentage in the NBA?	New York Knicks	Toronto Raptors	Los Angeles Clippers	Minnesota Timberwolves	d	MIN
1263	Which Philadelphia 76ers GM is responsible for "The Process"?	Bryan Colangelo	Brett Brown	Elton Brand	Sam Hinke	d	PHI
1264	Which of the following players was selected 1st overall by the Philadelphia 76ers?	Doug Collins	Andre Iguodala	Joel Embiid	Wilt Chamberlain	a	PHI
1265	Which of the following players was selected 1st overall by the Philadelphia 76ers?	Ben Simmons	Jerry Stackhouse	Evan Turner	Larry Hughes	a	PHI
1266	Which of the following players was selected 1st overall by the Philadelphia 76ers?	Elfrid Payton	Markelle Fultz	Michael Carter-Williams	Jrue Holiday	b	PHI
1267	Which of the following players was selected 1st overall by the Philadelphia 76ers?	Jahlil Okafor	Allen Iverson	Nikola Vucevic	Charles Barkley	b	PHI
1268	What is the name of the Philadelphia 76ers mascot?	Benjamin the Bee	Benjamin the Boa	Franklin the Dog	Franklin the Foal	c	PHI
1269	Which Philadelphia 76ers player led the NBA in steals for three consecutive years?	Jerry West	Julius Erving	Maurice Cheeks	Allen Iverson	d	PHI
1270	Which player holds the Philadelphia 76ers franchise record for the most points in a single game?	Charles Barkley	Julius Erving	Allen Iverson	Wilt Chamberlain	d	PHI
1271	Which player holds the Philadelphia 76ers franchise record for most 3-pointers in a season?	Ben Simmons	Kyle Korver	JJ Redick	Andre Miller	c	PHI
1272	Which player holds the Philadelphia 76ers franchise record for most assists in a season?	Ben Simmons	Allen Iverson	Steve Nash	Maurice Cheeks	d	PHI
1273	Which player won 3 consecutive MVP awards as a member of the Philadelphia 76ers?	Allen Iverson	Wilt Chamberlain	Julis Erving	Moses Malone	b	PHI
1274	Which player holds the Philadelphia 76ers franchise record for career points?	Julius Erving	Moses Malon	Allen Iverson	Hal Greer	d	PHI
1275	Which player holds the Philadelphia 76ers franchise record for career assists?	Maurice Cheeks	Andre Miller	Markelle Fultz	Allen Iverson	a	PHI
1276	Which player holds the Philadelphia 76ers franchise record for career rebounds?	Charles Barkley	Samuel Dalembert	Dolph Schayes	Theo Ratliff	c	PHI
1277	Which player holds the Philadelphia 76ers franchise record for career blocks?	Samuel Dalembert	Wilt Chamberlain	Joel Embiid	Julius Erving	d	PHI
1278	Which player holds the Philadelphia 76ers franchise record for points-per-game?	Moses Malone	Wilt Chamberlain	Julius Erving	Allen Iverson	b	PHI
1279	Which player holds the Philadelphia 76ers franchise record for rebounds-per-game?	Dikembe Mutombo	Wilt Chamberlain	Charles Barkley	Joel Embiid	b	PHI
1280	Which player holds the Philadelphia 76ers franchise record for assists-per-game?	Allen Iverson	Eric Snow	Jrue Holiday	Ben Simmons	d	PHI
1281	Which player holds the Philadelphia 76ers franchise record for free throw percentage?	JJ Redick	Jose Calderon	Joel Embiid	Jimmy Butler	a	PHI
1282	Which player holds the Philadelphia 76ers single-season record for blocks-per-game?	Julis Erving	Manute Bol	Dwight Howard	Theo Ratliff	d	PHI
1283	Which Philadelphia 76ers player was nicknamed "Dr. J"?	Julius Erving	Joel Embiid	Mike James	Jason Kidd	a	PHI
1284	Which player holds the Philadelphia 76ers franchise record for career turnovers?	Joel Embiid	Andre Miller	Allen Iverson	Charles Barkley	c	PHI
1285	Which Philadelphia 76ers player helped legitimize the dunk as viable scoring tactic?	Moses Malone	Dolph Schayes	Wilt Chamberlain	Julius Erving	d	PHI
1286	Which of the following was one of Allen Iverson's nicknames?	The Truth	The Question	The Answer	The Problem	c	PHI
1287	Which of the following was one of Wilt Chamberlain's nicknames?	Glide	The Beast	The Stilt	The Wall	c	PHI
1335	Which disgruntled NBA player did the Brooklyn Nets acquire via trade during the 2003-2004 season?	Vince Carter	Richard Jefferson	Jason Kidd	Alonzo Mourning	a	BKN
1288	Which team did the Philadelphia 76ers franchise (Syracuse Nationals) beat in the 1954-55 NBA finals to win their first NBA championship?	Fort Wayne Pistons	Washington Generals	Harlem Globetrotters	Buffalo Bisons	a	PHI
1289	Which team did the Philadelphia 76ers franchise beat in the 1966-1967 NBA finals to win their second NBA championship?	Los Angeles Lakers	Boston Celtics	Minneapolis Lakers	San Francisco Warriors	d	PHI
1290	Which team did the Philadelphia 76ers franchise beat in the 1982-1983 NBA finals to win their third NBA championship?	Los Angeles Lakers	Denver Nuggets	Phoenix Nuggets	Seattle Supersonics	a	PHI
1291	Which team did the Philadelphia 76ers lose to in the 2000-20001 NBA finals?	Minnesota Timberwolves	Sacramento Kings	San Antonio Spurs	Los Angeles Lakers	d	PHI
1292	What was the nickname given to Allen Iverson's crossover?	The Hezi	The Utep 2-step	The killer crossover	The Shamgod	c	PHI
1293	Which division do the Philadelphia 76ers currently play in?	Eastern Division	Pac-10 Division	Atlantic Division	Northeast Division	c	PHI
1294	Which of the following players gained 30 lbs in 2 days prior to his NBA draft in order to avoid being selected by the Philadelphia 76ers?	Charles Barkley	Shaquille O'Neal	Shawn Kemp	Joel Embiid	a	PHI
1295	Which of the following is one of Charles Barkley's nicknames?	The Round Mound of Rebound	The Blob	Sir Chuck	The Philly Doughboy	a	PHI
1296	What is Moses Malone's nickname?	Momo	Black Jesus	Chairman of the Boards	Boardman	c	PHI
1297	What is the inspiration for the Philadelphia 76ers team name?	The team was formed on the 76th anniversary of the formation of the USA	The team won an NBA championship in 1976 and was rebranded the following year	The Declaration of Independence was signed in 1776	The franchise was formed in 1876	c	PHI
1298	Which team has the record for fewest wins in a full 82 game season?	Charlotte Hornets	Los Angeles Clippers	Charlotte Bobcats	Philadelphia 76ers	d	PHI
1299	What is the Philadelphia 76ers franchise record for wins in a season?	57	60	73	68	d	PHI
1300	In which year did the Syracuse Nationals become the Philadelphia 76ers?	1956	1995	1963	1976	c	PHI
1301	The Philadelphia 76ers selected this player 5th overall in the 1975 NBA draft making him the first player to make the jump from high school directly into the NBA:	Moses Malone	Wilt Chamberlain	Julius Erving	Darryl Dawkins	d	PHI
1302	Which of the following is one of the nicknames of former Philadelphia 76er Darryl Dawkins?	Hawk	Round Mound of Rebound	Chocolate Thunder	Doc	c	PHI
1303	Where were the Brooklyn Nets located prior to moving to Brooklyn?	New York	New Jersey	Toronto	Harlem	b	BKN
1304	What is the name of the Brooklyn Nets' current home arena?	Prudential Center	Air Canada Centre	Barclays Arena	The Spectrum	c	BKN
1305	When did the New Jersey Nets franchise move to Brooklyn?	1976	2000	2012	1996	c	BKN
1306	When did the Brooklyn Nets franchise become a member of the NBA?	1956	1988	2005	1976	d	BKN
1307	When was the Brooklyn Nets franchise founded?	1967	1998	1976	1941	a	BKN
1308	What was the original name and home city of the Brooklyn Nets franchise?	New Jersey Nets	Rochester Nationals	New Jersey Americans	New Jersey Devils	c	BKN
1309	How many NBA championships has the Brooklyn Nets franchise won?	17	6	2	0	d	BKN
1310	In which seasons did the Brooklyn Nets franchise make it to consecutive NBA Finals?	2000-2001, 2001-2002	2010-2011,2011,2012	1954-1955, 1955-1956	2014-2015, 2015-2016	a	BKN
1311	Which former NBA mascot had his/her own comic book published by Marvel?	The Toronto Raptor	Benny the Bull	The BrooklyKnight	Mavs Man	c	BKN
1312	How long is the NBA career of the average NBA player?	7 years	12 years	4.5 years	2 years	c	ZZZ
1313	Which of these players has played for the Brooklyn Nets franchise?	Allen Iverson	Tracy McGrady	Demar Derozan	Vince Carter	d	BKN
1314	Which of these players has played for the Brooklyn Nets franchise?	Steve Nash	Kyle Lowry	Kevin Love	Jason Kidd	d	BKN
1315	Which of these players has played for the Brooklyn Nets franchise?	Draymon Green	Julius Erving	Magic Johnson	Tony Parker	b	BKN
1316	Which of these players has played for the Brooklyn Nets franchise?	Jayson Tatum	Michael Finley	Kenyon Martin	Elton Brand	c	BKN
1317	Which of the following players was drafted by the Brooklyn Nets franchise?	D'Angelo Russell	Kyrie Irving	Eddie Williams	Kyle Kuzma	d	BKN
1318	Which of these players was drafted by the Brooklyn Nets franchise?	Brook Lopez	Jason Kidd	Richard Jefferson	Kevin Durant	a	BKN
1319	How many NBA players have won an NBA MVP award as a member of the Brooklyn Nets franchise?	0	3	4	7	a	BKN
1320	What's the furthest that the Brooklyn Nets franchise have ever made it in the NBA playoffs?	Eastern Conference Semi-Finals	Western Conference Finals	NBA Finals	Eastern Conference Finals	c	BKN
1321	Which of these former Brooklyn/New Jersey Nets players was nicknamed "Iso Joe"?	Joe Carroll	Joe Johnson	Joe Cooper	Joe Dumars	b	BKN
1322	What is the Brooklyn Nets' franchise record for wins in a season in the NBA?	52	73	47	45	a	BKN
1323	Who is the Brooklyn Nets franchise leader in career points?	Jason Kidd	Vince Carter	Joe Johnson	Brook Lopez	d	BKN
1324	Who is the Brooklyn Nets franchise leader in career assists?	Jason Kidd	Drazen Petrovic	Deron Williams	Devin Harris	a	BKN
1325	Who is the Brooklyn Nets franchise leader in career rebounds?	Alonzo Mourning	Shaquille O'Neal	Buck Williams	Jarret Allen	c	BKN
1326	Who is the Brooklyn Nets franchise leader in career blocks?	Julius Erving	Alonzo Mourning	Buck Williams	Brook Lopez	d	BKN
1327	Who is the Brooklyn Nets franchise leader in points-per-game?	Jason Kidd	Brook Lopez	Rick Barry	Joe Johnson	c	BKN
1328	Who is the Brooklyn Nets franchise leader in rebounds-per-game?	Buck Williams	Nenad Krstic	Alonzo Mourning	Erick Dampier	a	BKN
1329	Who is the Brooklyn Nets franchise leader in assists-per-game?	Deron Williams	Rafer Alston	Devin Harris	Jason Kidd	d	BKN
1330	Who is the Brooklyn Nets franchise leader in blocks-per-game?	Kevin Garnett	Brook Lopez	Shawn Bradley	Alonzo Mourning	c	BKN
1331	Who is the Brooklyn Nets franchise leader in triple doubles?	Jarret Allen	Rick Barry	Deron Williams	Jason Kidd	d	BKN
1332	Which Brooklyn Nets Player led the NBA in triple-doubles for 5 consecutive seasons from 2003-2004 to 2007-2008?	Deron Williams	Jason Kidd	Richard Jefferson	Vince Carter	b	BKN
1333	Which of the following celebrities owned a minority stake in the Brooklyn Nets?	Jimmy Fallon	Jay Z	J Cole	Joey Badass	b	BKN
1334	Which former member of the Brooklyn Nets franchise was enshrined in the Hall of Fame after playing only 5 years in the NBA?	Drazen Petrovic	Brandon Roy	Jay Williams	Len Bias	a	BKN
1337	Which Toronto Raptor set the current NBA record for free-throw percentage in season?	Steve Nash	Vince Carter	Jose Calderon	Kawhi Leonard	c	TOR
1338	What is the NBA single-season record for free-throw percentage set by Jose Calderon in the 2008-2009 season?	89.8%	90.1%	93.5%	98.1%	d	TOR
1339	Which Toronto Raptors player hit the only Game 7 buzzer-beater in NBA playoffs history against the Philadelphia 76ers?	OG Anunoby	Kyle Lowry	Kawhi Leonard	Vince Carter	c	TOR
1340	Which former Raptors head coach was fired in the same year that he was named NBA Coach of the Year?	Nick Nurse	Sam Mitchell	Dwane Casey	Jay Triano	c	TOR
1341	Which former Toronto Raptors player was nicknamed "Mighty Mouse"?	Mike James	Muggsy Bogues	Damon Stoudamire	Vince Carter	c	TOR
1342	Who was the first Toronto Raptors player to record more than 200 blocks in a season?	Chris Bosh	Marcus Camby	Pascal Siakam	Chris Boucher	b	TOR
1343	How many NBA Championships have the Toronto Raptors franchise won?	1	4	0	17	a	TOR
1344	Which Toronto Raptors player won NBA Finals MVP following their championship run in 2018-2019 season?	Kawhi Leonard	Fred Van Vleet	Kyle Lowry	DeMar DeRozan	a	TOR
1345	Which player did the Toronto Raptors select with their first ever draft pick in the 1995 NBA draft?	Damon Stoudamire	Jimmy King	Marcus Camby	Tracy McGrady	a	TOR
1346	Which Toronto Raptors player has the highest single-season three-point field goal percentage in franchise history?	Morris Peterson	Jason Kapono	Donyell Marshall	Anthony Parker	b	TOR
1347	Which player was the first Toronto Raptor to win the NBA Sixth Man of the Year?	Lou Williams	Mike James	OG Anunoby	Morris Peterson	a	TOR
1348	Which player did the Toronto Raptors select with the only 1st overall pick in franchise history in the 2006 NBA draft?	Andrea Bargnani	Marcus Camby	Chris Bosh	Jonas Valanciunas	a	TOR
1349	Which of the following was not a nickname for former Toronto Raptors player Vince Carter?	The Florida Flightman	Half-Man Half-Amazing	Air Canada Carter	Vinsanity	a	TOR
1350	Which of the following players was drafted by the Toronto Raptors?	Antawn Jamison	Kawhi Leonard	Vince Carter	Kyle Lowry	a	TOR
1351	Which of the following players was drafted by the Toronto Raptors?	Tracy McGrady	Chris Boucher	Fred Van Vleet	Norman Powell	a	TOR
1352	Who was the first Toronto Raptor to win an NBA Dunk Contest?	Tracy McGrady	Terence Ross	DeMar DeRozan	Vince Carter	d	TOR
1353	Which of the following Toronto Raptors players won two consecutive NBA 3-point Shooting Contests?	DeMar DeRozan	Kyle Lowry	Jason Kapono	Terence Ross	c	TOR
1354	What is the Toronto Raptors' franchise record for wins in a season?	51	64	59	69	c	TOR
1355	What is the fewest wins recorded in a season by the Toronto Raptors?	16	38	7	9	a	TOR
1356	Who was the first Toronto Raptor to score 50 points in a NBA playoff game?	Kawhi Leonard	Vince Carter	Chauncey Billups	Chris Bosh	b	TOR
1357	Which team did the Toronto Raptors defeat in the 2018-2019 NBA finals to win the NBA Championship?	Golden State Warriors	Los Angeles Lakers	Portland Trailblazers	Houston Rockets	a	TOR
1358	Which of the following players has won an NBA Dunk Contest as a member of the Toronto Raptors?	Jamario Moon	DeMar DeRozan	Vince Carter	Tracy McGrady	c	TOR
1359	Which of the following players has won an NBA Dunk Contest as a member of the Toronto Raptors?	DeMar DeRozan	Tracy McGrady	Terence Ross	Norman Powell	c	TOR
1360	Which of the following Toronto Raptors has won an NBA Dunk Contest?	Jamario Moon	DeMar DeRozan	Dee Brown	Tracy McGrady	c	TOR
1361	Which of the following players has never played for the Toronto Raptors	Hakeem Olajuwan	Charles Oakley	Chauncey Billups	Alonzo Mourning	d	TOR
1362	Which of the following player was acquired by the Toronto Raptors via trade but refused to play for the team?	Alonzo Mourning	Antonio Davis	Vince Carter	Hakeem Olajuwan	a	TOR
1363	Which of the following Toronto Raptors was nicknamed "The Red Rocket"?	Anthony Parker	Matt Bonner	Damon Stoudamire	Andrea Bargnani	b	TOR
1364	Which of the following players has never played for the Toronto Raptors	Jermaine O'Neal	Antawn Jamison	Chauncey Billups	Doug Christie	b	TOR
1365	Which of the following former Toronto Raptors players is currently in the Hall of Fame?	Tracy McGrady	Chris Bosh	Chauncey Billups	Vince Carter	a	TOR
1366	Which of the following former Toronto Raptors players is currently in the Hall of Fame?	Vince Carter	Charles Oakley	Hakeem Olajuwan	Chris Bosh	c	TOR
1367	Which player holds the Toronto Raptors rookie record for points in a game with 48 points?	Charlie Villanueva	Tracy McGrady	Vince Carter	Chris Bosh	a	TOR
1368	Which player holds the Toronto Raptors rookie record for assists in a game with 19 assists?	Jose Calderon	Chauncey Billups	TJ Ford	Damon Stoudamire	d	TOR
1369	Which of the following coaches has never won NBA Coach of the year as the head coach of the Toronto Raptors?	Brendan Malone	Sam Mitchell	Dwane Casey	Nick Nurse	a	TOR
1370	Which of the following players has won the NBA Most Improved Player Award as a member of the Toronto Raptors?	Vince Carter	Pascal Siakam	Lou Williams	Fred Van Vleet	b	TOR
1371	Which of the following players has won the NBA Rookie of the Year Award as a member of the Toronto Raptors?	Chris Bosh	DeMar DeRozan	Tracy McGrady	Vince Carter	d	TOR
1372	 Which of the following players has won the NBA Rookie of the Year Award as a member of the Toronto Raptors?	Jonas Valanciunas	Andrea Bargnani	Damon Stoudamire	Jorge Garbajosa	c	TOR
1373	Who is the Toronto Raptors' franchise leader in games played?	Chris Bosh	Vince Carter	DeMar DeRozan	Alonzo Mourning	c	TOR
1374	Who is the Toronto Raptors' franchise leader in career points?	Kyle Lowry	Morris Peterson	Kawhi Leonard	DeMar DeRozan	d	TOR
1375	Which of the following Toronto Raptors was nicknamed "The Junkyard Dog"?	TJ Ford	Donyell Marshall	Rafer Alston	Jerome Williams	d	TOR
1376	Who is the Toronto Raptors' franchise leader in points-per-game?	Tracy McGrady	DeMar DeRozan	Morris Peterson	Vince Carter	d	TOR
1377	Who is the Toronto Raptors' franchise leader in career assists?	TJ Ford	Kyle Lowry	Chauncey Billup	Mike James	b	TOR
1378	Who is the Toronto Raptors' franchise leader in assists-per-game?	Rafer Alston	Damon Stoudamire	Alvin Williams	TJ Ford	b	TOR
1379	Who is the Toronto Raptors' franchise leader in career rebounds?	Antonio Davis	Jonas Valanciunas	Chris Bosh	Marcus Camby	c	TOR
1380	Who is the Toronto Raptors' franchise leader in rebounds-per-game?	Chris Bosh	Charles Oakley	Hakeem Olajuwan	Antonio Davis	a	TOR
1381	Who is the Toronto Raptors' franchise leader in career blocks?	Rafael Araujo	Marcus Camby	Chris Bosh	Andrea Bargnani	c	TOR
1382	Who is the Toronto Raptors' franchise leader in blocks-per-game?	Marcus Camby	Marc Gasol	Serge Ibaka	Olivier Miller	a	TOR
1383	Which player did the Toronto Raptors select with the 4th overall pick in the 2003 NBA Draft?	Dwyane Wade	Carmelo Anthony	Chris Bosh	TJ Ford	c	TOR
1384	Which of the following Toronto Raptors players was nicknamed "Il Mago" (The Magician)?	Uros Slokar	Vince Carter	Andrea Bargnani	Carlos Delfino	c	TOR
1385	Which player holds the Toronto Raptors' record for points in a single game?	Kyle Lowry	Chris Bosh	Vince Carter	DeMar DeRozan	d	TOR
1386	Which player holds the Toronto Raptors' record for rebounds in a single game?	Antonio Davis	Bismack Biyombo	Pascal Siakam	Serge Ibaka	b	TOR
1387	Which pair of Toronto Raptors teammates competed in the same NBA dunk contest?	DeMar DeRozan & Terence Ross	Vince Carter & Tracy McGrady	DeMar DeRozan & Jamario Moon	DeMar DeRozan & Vince Carter	b	TOR
1388	In which year was the Chicago Bulls franchise founded?	2005	1966	1954	1988	b	CHI
1389	How many NBA championships did the Chicago Bulls win during the 1990s?	3	6	1	7	b	CHI
1390	Which of the following players was the first to have his jersey retired by the Chicago Bulls?	Jerry Sloan	Scottie Pippen	Michael Jordan	Charles Oakley	a	CHI
1391	What is the name of the Chicago Bulls mascot?	Benny the Bull	Baller the Bull	Benji the Bull	Bucky the Bull	a	CHI
1392	Which of the following Chicago Bulls players wrestled Hulk Hogan prior to game 4 of the 1998 NBA Final?	Dennis Rodman	Steve Kerr	Scottie Pippen	Charles Oakley	a	CHI
1393	How many games did the Chicago Bulls win in the 1995-1996 NBA season?	69	70	72	73	c	CHI
1394	Which player the did player miss out on drafting in the 1979 NBA draft due to a lost coin flip?	Magic Johnson	Hakeem Olajuwan	Larry Bird	Michael Jordan	a	CHI
1395	What is Michael Jordan's career high for points in a game as a member of the Chicago Bulls?	69	81	70	100	a	HI
1396	Which of the following is Michael Jordan's birthplace?	Wilmington, North Carolina	Brooklyn, New York	Chicago, Illinois	Raleigh, North Carolina	b	CHI
1397	Which of the following teams did the Michael Jordan play for during his NBA career?	Chicago Bulls adn Portland Trailblazers	Chicago Bulls and Washington Wizards	Chicago Bulls only	Chicago Bulls and New Orleans Hornets	b	CHI
1398	Which team is known for creating "The Jordan Rules"	Detroit Pistons	Boston Celtics	Indiana Pacers	New York Knicks	a	CHI
1399	At which position did the Chicago Bulls select Michael Jordan in the 1984 NBA draft?	1st overall	2nd overall	4th overall	3rd overall	d	CHI
1400	Which player was selected 2nd overall in the 1984 NBA draft while Michael Jordan was still available?	Sam Bowie	Charles Barkley	Hakeem Olajuwan	John Stockton	a	CHI
1401	Which of the following teams drafted Scottie Pippen with the 5th overall pick in the 1987 NBA draft?	Seattle Supersonics	Chicago Bulls	Portland Trailblazers	San Antonio Spurs	a	CHI
1402	Which of the following is Dennis Rodman's nickname?	The Worm	Junkyard Dog	The Admiral	Robin	a	CHI
1403	Who was the coach of the Chicago Bulls during their 6 NBA championship run?	Doug Collins	Pat Riley	Jerry Krause	Phil Jackson	d	CHI
1404	Which of the following players holds the NBA record for most finals MVPs?	Michael Jordan	Magic Johnson	Shaquille O'Neal	Lebron James	a	CHI
1405	Which of the following players hold the NBA record for most NBA scoring titles?	Allen Iverson	Wilt Chamberlain	Michael Jordan	George Gervin	c	CHI
1406	Which sport did Michael Jordan play professionally following his first retirement in 1993?	Golf	Ice Hockey	Baseball	Football	c	CHI
1407	How many NBA Defensive Player of the Year awards has Michael Jordan won?	3	0	1	2	c	CHI
1408	Which of the following was not one of Michael Jordan's nicknames?	Half-Man Half-Amazing	His Airness	Black Cat	Air Jordan	a	CHI
1409	How many NBA championships have the Chicago Bulls won?	6	7	8	9	a	CHI
1410	Which of the following teams is the only NBA team to have multiple NBA championships without losing a NBA Finals series?	Toronto Raptors	Chicago Bulls	Houston Rockets	Boston Celtics	b	CHI
1411	How many players have won an NBA MVP award as a member of the Chicago Bulls?	4	2	1	0	b	CHI
1412	How many NBA MVP awards have been won by members of the Chicago Bulls?	6	2	1	5	a	CHI
1413	Which of the following Chicago Bulls is the youngest ever winner of the NBA MVP award?	Derrick Rose	Michael Jordan	Steve Nash	Dwight Howard	a	CHI
1414	Which player did the Chicago Bulls select with the 1st overall pick in the 2008 NBA Draft?	Jimmy Butler	Joakim Noah	LaMarcus Aldridge	Derrick Rose	d	CHI
1415	In which city did Dennis Rodman famously take a team-sanctioned vacation in the middle of the Chicago Bulls' 1997-1998 season?	Los Angeles	Toronto	New York	Las Vegas	d	CHI
1416	What was Michael Jordan's jersey number when he returned to the Chicago Bulls following his first retirement?	42	45	6	23	b	CHI
1417	Which of the following is not one of the reasons Michael Jordan wore jersey number 45 upon returning to the Chicago Bulls following his first retirement?	He lost a golf bet to Charles Barkley which prevented him from wearing the number 23	It was his jersey number in high school	The Chicago Bulls had retired the number 23	He didn't want to wear 23 because his father was no longer able to watch him play	a	CHI
1418	Which of the following explains the "Derrick Rose Rule" named after Derrick Rose of the Chicago Bulls	A player coming off his rookie contract can earn up to 30% of the salary cap if he meets certain criteria	A 1st overall pick can be signed to a 5-year rookie contract if the team offers 25% of the cap space per year	A defensive player must ensure that a jump-shooter has enough space to land safely	The shot-clock and game-clock don't start following an inbound until a player touches the ball	a	CHI
1419	What are the "Jordan Rules"?	A refernce to the "special treatment" Michael Jordan received from the referees during the late 1980s	The chores Michael Jordan would force Chicago Bulls rookies to complete as part of rookie hazing in the 1990s	A reference to the physical style of defense employed by the Detroit Pistons against Michael Jordan of the Chicago Bulls	A reference to Michael Jordan's strict daily routines during his NBA championship runs with the Chicago Bulls	c	CHI
1420	Which of the following players is the Chicago Bulls' franchise leader in career games played?	Michael Jordan	Scottie Pippen	Jerry Sloan	Joakim Noah	a	CHI
1421	Which of the following players is the Chicago Bulls' franchise leader in career points?	Scottie Pippen	Derrick Rose	Jerry Sloan	Michael Jordan	d	CHI
1422	Which of the following players is the Chicago Bulls' franchise leader in points-per-game?	George Gervin	Scottie Pippen	Joakim Noah	Michael Jordan	d	CHI
1423	Which of the following players is the Chicago Bulls' franchise leader in career assists?	Kirk Hinrich	Ennis Whatley	Michael Jordan	Derrick Rose	c	CHI
1424	Which of the following players is the Chicago Bulls' franchise leader in assists-per-game?	Ennis Whatley	Kris Dunn	Jalen Rose	Kirk Hinrich	a	CHI
1425	Which of the following players is the Chicago Bulls' franchise leader in career rebounds?	Scottie Pippen	Dennis Rodman	Joakim Noah	Michael Jordan	d	CHI
1426	Which of the following players is the Chicago Bulls' franchise leader in rebounds-per-game?	Dennis Rodman	Ben Wallace	Charles Oakley	Joakim Noah	a	CHI
1427	Which of the following players is the Chicago Bulls' franchise leader in career steals?	Dennis Rodman	Scottie Pippen	Michael Jordan	Derrick Rose	c	CHI
1428	Which of the following players has won NBA 6th Man of the Year as a member of the Chicago Bulls?	Derrick Rose	Ben Gordon	Luol Deng	Joakim Noah	b	CHI
1429	Which of the following players has won NBA 6th Man of the Year as a member of the Chicago Bulls?	Bill Cartwright	Steve Kerr	Toni Kukoc	Luc Longley	c	CHI
1430	Which of the following players was left the 1992 US Olympic "Dream Team" because Michael Jordan and Scottie Pippen didn't want to play with him?	David Robinson	Isaiah Thomas	Dennis Rodman	Reggie Miller	b	CHI
1431	What is the name of the Chicago Bulls' home stadium?	The Forum	The Staples Centre	The United Centre	TD Banknorth Gardens	c	CHI
1432	Which team did the Chicago Bulls defeat in the 1990-1991 NBA Finals to win the franchise's first championship?	Utah Jazz	Phoenix Suns	Los Angeles Lakers	Boston Celtics	c	CHI
1433	Which team did the Chicago Bulls defeat in the 1991-1992 NBA Finals to win the franchise's second championship?	Seattle Supersonics	Portland Trailblazers	Houston Rockets	Utah Jazz	b	CHI
1434	Which team did the Chicago Bulls defeat in the 1992-1993 NBA Finals to win the franchise's third championship?	Phoenix Suns	Orlando Magic	Los Angeles Lakers	Houston Rockets	a	CHI
1435	Which team did the Chicago Bulls defeat in the 1995-1996 NBA Finals to win the franchise's fourth championship?	Utah Jazz	Seattle SuperSonics	Portland Trailblazers	Milwaukee Bucks	b	CHI
1436	Which team did the Chicago Bulls defeat in the 1996-1997 NBA Finals to win the franchise's fifth championship?	Dallas Mavericks	Phoenix Suns	Utah Jazz	Los Angeles Lakers	c	CHI
1437	Which team did the Chicago Bulls defeat in the 1997-1998 NBA Finals to win the franchise's sixth championship?	Utah Jazz	Los Angeles Lakers	Seattle Supersonics	Portland Trailblazers	a	CHI
1438	Which player did the Chicago Bulls select with the 1st overall pick in the 1999 NBA draft?	Elton Brand	Kenyon Martin	Kwame Brown	Michael Olowokandi	a	CHI
1439	Which NBA franchise has had the most 1st overall draft picks?	Philadelphia 76ers	Boston Celtics	Houston Rockets	Cleveland Cavaliers	d	ZZZ
1440	When was the Detroit Pistons francshise founded?	1988	1941	1976	2005	b	DET
1441	Where was the Detroit Pistons franchise originally located?	Fort Wayne, Indiana	Toronto, Canada	Chicago, Illinois	Detroit, Michigan	a	DET
1442	How many NBA championships have the Detroit Pistons franchise won?	2	3	0	1	b	DET
1443	Which team did the Detroit Pistons defeat in the 2003-2004 NBA Finals to win the NBA championship?	San Antonio Spurs	Los Angeles Lakers	Sacramento Kings	Minnesota Timberwolves	b	DET
1444	Which team did the Detroit Pistons defeat in the 1989-1990 NBA Finals to win the NBA championship?	Dallas Mavericks	Portland Trailblazers	Los Angeles Lakers	Houston Rockets	b	DET
1445	Which team did the Detroit Pistons defeat in the 1988-1989 NBA Finals to win the NBA championship?	Los Angeles Lakers	San Francisco Warriors	Seattle Supersonics	Phoenix Suns	a	DET
1446	Which of the following players was not a member of the "Bad Boy" Pistons?	Isaiah Thomas	Ben Wallace	Dennis Rodman	Bill Laimbeer	b	DET
1447	How did the "Bad Boy" Pistons earn their nickname?	The players ignored the league's rules on conduct including its dress code	Multiple players had high profile legal problems	The players had a turbulent relationship with media	They played a very physical, defense-oriented style of game	d	DET
1448	Which of the following Detroit Pistons players is not a member of the Hall of Fame?	Isaiah Thomas	Grant Hill	Ben Wallace	Tracy McGrady	a	DET
1449	Which of the following Detroit Pistons players is not a member of the Hall of Fame?	Dennis Rodman	Allen Iverson	Chauncey Billups	Joe Dumars	c	DET
1450	Which of the following Detroit Pistons players was nicknamed "Mr. Big Shot"?	Grant Hill	Chauncey Billups	Isaiah Thomas	Richard Hamilton	b	DET
1451	Which of the following Detroit Pistons was notably left off the 1992 US Olympic "Dream Team"?	Bill Laimbeer	Dennis Rodman	David Robinson	Isaiah Thomas	d	DET
1452	Which player did the Detroit Pistons select with the 2nd overall pick in the 2003 NBA draft?	Carmelo Anthony	Luke Ridnour	Darko Milicic	Kirk Hinrich	c	DET
1453	What is the name of the Detroit Pistons' mascot?	Hooper	Pierre	Dunker	Burnie	a	DET
1454	Who is the first Detroit Pistons player to win NBA 6th Man of the Year?	Corliss Williamson	Tayshaun Prince	Carlos Delfino	Dennis Rodman	a	DET
1455	Which of the following Detroit Pistons players won NBA Finals MVP when they won the NBA championship in 2003-2004?	Ben Wallace	Chauncey Billups	Rasheed Wallace	Richard Hamilton	b	DET
1456	Which of the following players spent their entire playing career with the Detroit Pistons?	Ben Wallace	Chauncey Billups	Isaiah Thomas	John Salley	c	DET
1457	Which of the following players won NBA Rookie of the Year as a member of the Detroit Pistons?	Adrian Dantley	John Salley	Isaiah Thomas	Grant Hill	d	DET
1458	What is the current name of the Detroit Pistons' home stadium?	Oracle Arena	Little Caesars Arena	The United Centre	The Palace of Auburn Hills	b	DET
1459	Which of following players is the Detroit Pistons' leader in career games played?	Isaiah Thomas	Chauncey Billups	Ben Wallace	Joe Dumars	d	DET
1460	Which of following players is the Detroit Pistons' leader in career points?	Richard Hamilton	Grant Hill	Dave Debusschere	Isaiah Thomas	d	DET
1461	Which of following players is the Detroit Pistons' leader in points-per-game?	Richard Hamilton	Isaiah Thomas	Bob Lanier	Grant Hill	c	DET
1462	Which of following players is the Detroit Pistons' leader in career rebounds?	Dennis Rodman	Ben Wallace	Rasheed Wallace	Bill Laimbeer	d	DET
1463	Which of following players is the Detroit Pistons' leader in rebounds-per-game?	Rasheed Wallace	Ben Wallace	Andre Drummond	Bill Laimbeer	c	DET
1464	Which of following players is the Detroit Pistons' leader in career assists?	Chauncey Billups	Isaiah Thomas	Derrick Rose	Reggie Jackson	b	DET
1465	Which of following players is the Detroit Pistons' leader in assists-per-game?	Brandon Jennings	Grant Hill	Kevin Porter	Isaiah Thomas	c	DET
1466	Which of following players is the Detroit Pistons' leader in career blocks?	Ben Wallace	Andre Drummond	Blake Griffin	Jerry Stackhouse	a	DET
1467	How many NBA Defensive Player of the Year Awards has Ben Wallace won?	4	0	1	2	a	DET
1468	What is the Detroit Pistons' franchise record for wins in a season?	64	72	73	59	a	DET
1469	What is the furthest the Detroit Pistons have ever made it into the NBA playoffs?	NBA Champions	NBA Finals	Eastern Conference Semi-Finals	Eastern Conference Finals	a	DET
1470	What is the Detroit Pistons' franchise record for fewest wins in a season?	9	30	16	27	c	DET
1471	Which of the following players is the Detroit Pistons' franchise leader in career points, assists and steals?	Grant Hill	Joe Dumars	Isaiah Thomas	Jerry Stackhouse	c	DET
1472	Which player holds the Detroit Pistons' record for points in a season?	Isaiah Thomas	Blake Griffin	Jerry Stackhouse	Grant Hill	c	DET
1473	Which of the following players holds the Detroit Pistons' record for points in a single game?	Andre Drummond	Blake Griffin	Grant Hill	Jerry Stackhouse	d	DET
1474	Which of the following players was drafted by the Detroit Pistons?	Blake Griffin	Ben Gordon	John Salley	Isaiah Thomas	d	DET
1475	Which of the following players was drafted by the Detroit Pistons?	Ben Wallace	Derrick Rose	Grant Hill	Bill Laimbeer	c	DET
1476	Which of the following players was drafted by the Detroit Pistons?	Jerry Stackhouse	Andre Drummond	Richard Hamilton	Brandon Jennings	b	DET
1477	Which of the following players was drafted by the Detroit Pistons?	Stephen Jackson	Reggie Jackson	Chauncey Billups	Dennis Rodman	d	DET
1478	Which of the following Detroit Pistons was nicknamed "Rip"?	Dennis Rodman	Reggie Jackson	Richard Hamilton	Reggie Theus	c	DET
1479	Which of the following Detroit Pistons was nicknamed "Zeke"?	Derrick Rose	John Salley	Isaiah Thomas	Richard Hamiltom	c	DET
1480	What is the Detroit Pistons' team name a reference to?	Founder Fred Zollner owned a piston-manufacturing company	Detroit's weapons manufacturing history	Founder Fred Zollner's Kentucky Derby-winning horse named "Piston"	Detroit's car manufacturing history	a	DET
1481	In which year was the Utah Jazz franchise founded?	1974	1945	1922	2005	a	UTA
1482	Where was the Utah Jazz franchise originally located?	St. Louis	Toronto	Charlotte	New Orleans	d	UTA
1483	In which year did the Jazz move to Utah?	2005	2015	1997	1979	d	UTA
1484	How many NBA championships have the Utah Jazz won?	2	0	5	9	b	UTA
1485	How many times have the Utah Jazz made it to the NBA Finals?	0	6	2	17	c	UTA
1486	Which team did the Utah Jazz lose to in their two consecutive NBA Finals appearance from 1996-1998?	Toronto Raptors	Boston Celtics	Chicago Bulls	Orlando Magic	c	UTA
1487	Which city in the state of Utah do the Utah Jazz play their home games in?	Ogden	West Jordan	Salt Lake City	West Valley City	c	UTA
1488	What is the nickname of Utah Jazz legend Karl Malone?	The Milkman	The Iceman	The Mailman	The Postman	c	UTA
1489	Which of the following NBA players has not wrestled in the WCW?	Dwight Howard	Dennis Rodman	Shaquille O'Neal	Karl Malone	a	UTA
1490	Which of the following Utah Jazz players has won an NBA MVP award?	Andrei Kirilenko	Karl Malone	Deron Williams	John Stockton	b	UTA
1491	With which team did Karl Malone retire?	Los Angeles Clippers	Los Angeles Lakers	Milwaukee Bucks	Utah Jazz	b	UTA
1492	Which Utah Jazz player holds the NBA record for career assists and steals?	Deron Williams	Andrei Kirilenko	Gary Payton	John Stockton	d	UTA
1493	Which of the following Utah Jazz players made the playoffs in each season of his 19 year career with the Utah Jazz?	Mehmet Okur	John Stockton	Andrei Kirilenko	Pete Maravich	b	UTA
1494	Which of the following coaches was the first NBA coach to win 1000 games with the same team?	Jerry Sloan with the Utah Jazz	Phil Jackson with the Los Angeles Lakers	Phil Jackson with the Chicago Bulls	Greg Popovich with the San Antonio Spurs	a	UTA
1495	Which of the following was the nickname of Utah Jazz player Andrei Kirilenko?	The Mailman	The Beast from the East	AK-47	The Killer	c	UTA
1496	Which of the following players holds the Utah Jazz' single-game scoring record?	Donovan Mitchell	Karl Malone	Deron Williams	Pete Maravich	d	UTA
1497	Which of the following players holds the Utah Jazz' single-game assists record?	John Stockton	Steve Nash	Pete Maravich	Deron Williams	a	UTA
1498	Which Utah Jazz player was the first NBA player to test positive for Covid-19 in 2020?	Joe Ingles	Donovan Mitchell	Mike Conley	Rudy Gobert	d	UTA
1499	Which of the following former NBA players spent his entire career with the Utah Jazz?	Pete Maravich	Deron Williams	John Stockton	Karl Malone	c	UTA
1500	What is the Utah Jazz' franchise record for most wins in a season?	73	69	55	64	d	UTA
1501	What is the Utah Jazz franchise record for fewest wins in a season?	9	6	29	23	d	UTA
1502	Which of the following players is the Utah Jazz' franchise leader in career games played?	John Stockton	Byron Russell	Mark Eaton	Karl Malone	a	UTA
1503	Which of the following players is the Utah Jazz' franchise leader in career points?	John Stockton	Pete Maravich	Karl Malone	Donovan Mitchell	c	UTA
1504	Which of the following players is the Utah Jazz' franchise leader in career assists?	Mike Conley	Deron Williams	Karl Malone	John Stockton	d	UTA
1505	Which of the following players is the Utah Jazz' franchise leader in assists-per-game?	Ricky Rubio	Pete Maravich	Mike Conley	John Stockton	d	UTA
1506	Which of the following players is the Utah Jazz' franchise leader in career rebounds?	Greg Ostertag	Karl Malone	Rudy Gobert	Andrei Kirilenko	b	UTA
1507	Which of the following players is the Utah Jazz' franchise leader in rebounds-per-game?	Rudy Gobert	Truck Robinson	Mehmet Okur	John Stockton	b	UTA
1508	Which of the following players is the Utah Jazz' franchise leader in career blocks?	Paul Millsap	Carlos Boozer	Rudy Gobert	Mark Eaton	d	UTA
1509	How many players have won the NBA dunk contest as a member of the Utah Jazz?	5	4	0	2	d	UTA
1510	Which of the following players has won the NBA three point shooting contest as a member of the Utah Jazz?	John Stockton	Jeff Hornacek	Mike Conley	Mehmet Okur	b	UTA
1511	Which of the following players was not drafted by the Utah Jazz?	Donovan Mitchell	Karl Malone	John Stockton	Dominique Wilkins	a	UTA
1550	In which year was the Utah Jazz franchise founded?	1945	1974	1922	2005	b	UTA
1551	Where was the Utah Jazz franchise originally located?	New Orleans	Toronto	Charlotte	St. Louis	a	UTA
1552	In which year did the Jazz move to Utah?	2015	2005	1997	1979	d	UTA
1553	How many NBA championships have the Utah Jazz won?	5	2	9	0	d	UTA
1554	How many times have the Utah Jazz made it to the NBA Finals?	0	2	17	6	b	UTA
1555	Which team did the Utah Jazz lose to in their two consecutive NBA Finals appearance from 1996-1998?	Boston Celtics	Toronto Raptors	Orlando Magic	Chicago Bulls	d	UTA
1556	Which city in the state of Utah do the Utah Jazz play their home games in?	Ogden	West Valley City	Salt Lake City	West Jordan	c	UTA
1557	What is the nickname of Utah Jazz legend Karl Malone?	The Postman	The Iceman	The Milkman	The Mailman	d	UTA
1558	Which of the following NBA players has not wrestled in the WCW?	Shaquille O'Neal	Dennis Rodman	Karl Malone	Dwight Howard	d	UTA
1559	Which of the following Utah Jazz players has won an NBA MVP award?	Andrei Kirilenko	Karl Malone	Deron Williams	John Stockton	b	UTA
1560	With which team did Karl Malone retire?	Los Angeles Clippers	Utah Jazz	Milwaukee Bucks	Los Angeles Lakers	d	UTA
1561	Which Utah Jazz player holds the NBA record for career assists and steals?	Andrei Kirilenko	Deron Williams	Gary Payton	John Stockton	d	UTA
1562	Which of the following Utah Jazz players made the playoffs in each season of his 19 year career with the Utah Jazz?	Andrei Kirilenko	Mehmet Okur	Pete Maravich	John Stockton	d	UTA
1563	Which of the following coaches was the first NBA coach to win 1000 games with the same team?	Phil Jackson with the Chicago Bulls	Phil Jackson with the Los Angeles Lakers	Jerry Sloan with the Utah Jazz	Greg Popovich with the San Antonio Spurs	c	UTA
1564	Which of the following was the nickname of Utah Jazz player Andrei Kirilenko?	The Beast from the East	The Mailman	The Killer	AK-47	d	UTA
1565	Which of the following players holds the Utah Jazz' single-game scoring record?	Deron Williams	Pete Maravich	Karl Malone	Donovan Mitchell	b	UTA
1566	Which of the following players holds the Utah Jazz' single-game assists record?	Deron Williams	Pete Maravich	Steve Nash	John Stockton	d	UTA
1567	Which Utah Jazz player was the first NBA player to test positive for Covid-19 in 2020?	Mike Conley	Joe Ingles	Rudy Gobert	Donovan Mitchell	c	UTA
1568	Which of the following former NBA players spent his entire career with the Utah Jazz?	John Stockton	Karl Malone	Pete Maravich	Deron Williams	a	UTA
1569	What is the Utah Jazz' franchise record for most wins in a season?	55	69	73	64	d	UTA
1570	What is the Utah Jazz franchise record for fewest wins in a season?	6	29	9	23	d	UTA
1571	Which of the following players is the Utah Jazz' franchise leader in career games played?	Mark Eaton	Karl Malone	Byron Russell	John Stockton	d	UTA
1572	Which of the following players is the Utah Jazz' franchise leader in career points?	Pete Maravich	Donovan Mitchell	John Stockton	Karl Malone	d	UTA
1573	Which of the following players is the Utah Jazz' franchise leader in career assists?	Mike Conley	Deron Williams	Karl Malone	John Stockton	d	UTA
1574	Which of the following players is the Utah Jazz' franchise leader in assists-per-game?	Mike Conley	Pete Maravich	John Stockton	Ricky Rubio	c	UTA
1575	Which of the following players is the Utah Jazz' franchise leader in career rebounds?	Andrei Kirilenko	Rudy Gobert	Karl Malone	Greg Ostertag	c	UTA
1576	Which of the following players is the Utah Jazz' franchise leader in rebounds-per-game?	John Stockton	Truck Robinson	Rudy Gobert	Mehmet Okur	b	UTA
1577	Which of the following players is the Utah Jazz' franchise leader in career blocks?	Mark Eaton	Carlos Boozer	Rudy Gobert	Paul Millsap	a	UTA
1578	How many players have won the NBA dunk contest as a member of the Utah Jazz?	0	2	4	5	b	UTA
1579	Which of the following players has won the NBA three point shooting contest as a member of the Utah Jazz?	John Stockton	Mike Conley	Jeff Hornacek	Mehmet Okur	c	UTA
1580	Which of the following players was not drafted by the Utah Jazz?	Karl Malone	Dominique Wilkins	John Stockton	Donovan Mitchell	d	UTA
1581	Who was the first NBA player to win consecutive NBA MVP awards?	Michael Jordan	Wilt Chamberlain	Kareem Abdul Jabbar	Bill Russell	d	ZZZ
1582	Who is the first internationally-born player to win an NBA MVP award?	Hakeem Olajuwan	Steve Nash	Kareem-Abdul Jabbar	Dirk Nowitzki	a	ZZZ
1583	Which NBA team holds the record for most MVPs in NBA history?	Boston Celtics	Philadelphia 76ers	Los Angeles Lakers	Chicago Bulls	a	ZZZ
1584	Which of the following players is currently the oldest player to win the NBA MVP award?	Lebron James	Karl Malone	Michael Jordan	Steve Nash	b	ZZZ
1585	Which of the following players is currently the youngest player to win the NBA MVP award?	Bob Pettit	Derrick Rose	Wes Unsled	Wilt Chamberlain	b	ZZZ
1586	Which of the following players is the only player to win the NBA MVP award unanimously?	Shaquille O'Neal	Seth Curry	Michael Jordan	Steph Curry	d	ZZZ
1587	John Stockton played on the Utah Jazz for 19 years and retired as the NBA's career leader in steals and assists. How many MVP awards did he win?	0	2	3	1	a	ZZZ
1588	Which of the following players has won the most NBA MVP awards?	Kareem-Abdul Jabbar	Kobe Bryant	Michael Jordan	Lebron James	c	ZZZ
1589	Which of the following players has won the most NBA MVP awards?	Kenny Smith	Shaquille O'Neal	Steve Nash	Charles Barkley	c	ZZZ
1590	Which of the following players has won an NBA MVP award as a member of the Portland Trailblazers?	Clyde Drexler	Bill Walton	Scottie Pippen	Damian Lillard	b	ZZZ
1591	Which of the following players has won an NBA MVP award as a member of the New York Knicks?	Walt Frazier	Patrick Ewing	Carmelo Anthony	Willis Reed	d	ZZZ
1592	Which of the folling players has not won the NBA Rookie of the Year award?	Ja Morant	Ben Simmons	Trae Young	Luka Doncic	c	ZZZ
1593	Which of the folling players has not won the NBA Rookie of the Year award?	Donovan Mitchell	Ben Simmons	Damian Lillard	Michael Carter-Williams	a	ZZZ
1594	Which of the folling players has not won the NBA Rookie of the Year award?	Derrick Rose	James Harden	Tyreke Evans	Blake Griffin	b	ZZZ
1595	Which of the folling players has not won the NBA Rookie of the Year award?	Andrew Wiggins	Lebron James	Malcolm Brogdon	Carmelo Anthony	d	ZZZ
1596	Which of the following NBA franchises has had the most NBA Rookie of the Year award winners?	Golden State Warriors	Portland Trailblazers	Toronto Raptors	Philadelphi 76ers	a	ZZZ
1597	Which of the following players was the first NBA player to win the Most Improved Player award and then go on to become an NBA MVP?	Shaquille O'Neal	Giannis Antetokounmpo	Hakeem Olajuwon	Tracy mcGrady	b	ZZZ
1598	Which of the following players has never won an NBA Most Improved Player Award?	Victor Oladipo	Pascal Siakam	Lou Williams	Brandon Ingram	c	ZZZ
1599	Which of the following players has never won an NBA Most Improved Player Award?	Goran Dragic	Jimmy Butler	Devin Booker	CJ McCollum	c	ZZZ
1600	What is the name of the trophy awarded to the winner of the NBA championship?	The Stanley Cup	The Vince Lombardi Trophy	The Larry O'Brien Trophy	The Bill Russell Trophy	c	ZZZ
1601	Which of the following NBA personalities is often referred to as "The Logo"?	Jerry West	Damian Lillard	Michael Jordan	Lebron James	a	ZZZ
1602	Which of the following players has won the most NBA Finals MVP awards?	Michael Jordan	Lebron James	Magic Johnson	Shaquille O'Neal	a	ZZZ
1603	Which of the following players has never won an NBA Finals MVP Award?	Tony Parker	Kawhi Leonard	Andre Iguodala	Steph Curry	d	ZZZ
1604	Who was the first winner of the NBA Finals MVP award?	Larry Bird	Magic Johnson	Isaiah Thomas	Jerry West	d	ZZZ
1605	Which of the following players has won the most NBA All-Star Game MVP Awards?	Michael Jordan	Kobe Bryant	Shaquille O'Neal	Lebron James	b	ZZZ
1606	Which NBA player is the NBA All-Star Game Award named after?	Kobe Bryant	Allen Iverson	Julius Erving	Wilt Chamberlain	a	ZZZ
1607	Which of the following NBA franchises was publicly traded on the New York Stock Exchange from 1986-2003?	Milwaukee Bucks	Los Angeles Lakers	Boston Celtics	New York Knicks	c	ZZZ
1608	When the NBA introduce the 3-point line?	1998	1979	1946	1954	b	ZZZ
1609	What was the original name of the NBA at the time it was founded in 1946?	Basketball Association of America, BAA	American Basketball League, ABL	American Basketball Association, ABA	National Basketbal League, NBL	a	ZZZ
1610	In which year was the BAA (which would go on to become the NBA) founded?	1946	1966	1976	1968	a	ZZZ
1611	When did the Basketball Association of America and National Basketball League merge to form the NBA?	1979	1946	1976	1949	d	ZZZ
1612	When did the American Basketball Association merge with the NBA?	1976	1990	1965	1985	a	ZZZ
1613	During the 2019-2020 season which NBA player become the first player to play in his 22nd season?	Vince Carter	Lebron James	Carmelo Anthony	Dirk Nowitzki	a	ZZZ
1614	During the 2019-2020 season which player became the first person in NBA history to record a triple-double against all 30 teams during his career?	Russell Westbrook	Lebron James	James Harden	Chris Paul	b	ZZZ
1615	During the 2019-2020 season this trio became the first three brothers to play in the same NBA game:	The Antetokounmpo brothers	The Lopez brothers	The Brooks brothers	The Holiday brothers	d	ZZZ
1616	During the 2018-2019 season, this player set the NBA record for most seasons on one team as a player:	Tim Duncan	Vince Carter	Dirk Nowitzki	Carmelo Anthony	c	ZZZ
1617	During the 2016-2017 season, this player became the second player in NBA history to average a triple-double for a season?	James Harden	Russell Westbrook	Kevin Durant	Lebron James	b	ZZZ
\.


--
-- Data for Name: court_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.court_team (id, team_name, division_name) FROM stdin;
2	BKN	ATLANTIC
3	PHI	ATLANTIC
4	BOS	ATLANTIC
5	NYK	ATLANTIC
6	IND	CENTRAL
7	CLE	CENTRAL
8	MIL	CENTRAL
9	DET	CENTRAL
10	CHI	CENTRAL
11	ORL	SOUTHEAST
12	ATL	SOUTHEAST
13	MIA	SOUTHEAST
14	WAS	SOUTHEAST
15	CHA	SOUTHEAST
16	UTA	NORTHWEST
17	MIN	NORTHWEST
18	OKC	NORTHWEST
19	POR	NORTHWEST
20	DEN	NORTHWEST
21	LAC	PACIFIC
22	PHX	PACIFIC
23	SAC	PACIFIC
24	LAL	PACIFIC
25	GSW	PACIFIC
26	SAS	SOUTHWEST
27	NOP	SOUTHWEST
28	HOU	SOUTHWEST
29	MEM	SOUTHWEST
30	DAL	SOUTHWEST
31	ZZZ	OTHER
1	TOR	ATLANTIC
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-01-13 16:04:32.848936-05	1	Team object (1)	1	[{"added": {}}]	7	1
2	2021-01-13 16:04:51.890953-05	1	Question object (1)	1	[{"added": {}}]	8	1
3	2021-01-13 18:28:20.867328-05	5	Question object (5)	3		8	1
4	2021-01-13 18:28:20.881696-05	3	Question object (3)	3		8	1
5	2021-01-13 18:28:20.883494-05	2	Question object (2)	3		8	1
6	2021-01-13 18:28:20.885248-05	1	Question object (1)	3		8	1
7	2021-01-13 18:28:20.887371-05	0	Question object (0)	3		8	1
8	2021-01-13 19:26:34.266682-05	108	Question object (108)	3		8	1
9	2021-01-13 19:26:34.285184-05	107	Question object (107)	3		8	1
10	2021-01-13 19:26:34.287419-05	106	Question object (106)	3		8	1
11	2021-01-13 19:26:34.290922-05	105	Question object (105)	3		8	1
12	2021-01-13 19:26:34.293306-05	104	Question object (104)	3		8	1
13	2021-01-13 19:26:34.295513-05	103	Question object (103)	3		8	1
14	2021-01-13 19:26:34.297367-05	102	Question object (102)	3		8	1
15	2021-01-13 19:26:34.299268-05	101	Question object (101)	3		8	1
16	2021-01-13 19:26:34.301283-05	100	Question object (100)	3		8	1
17	2021-01-13 19:26:34.303324-05	99	Question object (99)	3		8	1
18	2021-01-13 19:26:34.305296-05	98	Question object (98)	3		8	1
19	2021-01-13 19:26:34.307296-05	97	Question object (97)	3		8	1
20	2021-01-13 19:26:34.309229-05	96	Question object (96)	3		8	1
21	2021-01-13 19:26:34.312523-05	95	Question object (95)	3		8	1
22	2021-01-13 19:26:34.314497-05	94	Question object (94)	3		8	1
23	2021-01-13 19:26:34.316459-05	93	Question object (93)	3		8	1
24	2021-01-13 19:26:34.319559-05	92	Question object (92)	3		8	1
25	2021-01-13 19:26:34.325241-05	91	Question object (91)	3		8	1
26	2021-01-13 19:26:34.331335-05	90	Question object (90)	3		8	1
27	2021-01-13 19:26:34.336859-05	89	Question object (89)	3		8	1
28	2021-01-13 19:26:34.343519-05	88	Question object (88)	3		8	1
29	2021-01-13 19:26:34.350982-05	87	Question object (87)	3		8	1
30	2021-01-13 19:26:34.358328-05	86	Question object (86)	3		8	1
31	2021-01-13 19:26:34.367262-05	85	Question object (85)	3		8	1
32	2021-01-13 19:26:34.374139-05	84	Question object (84)	3		8	1
33	2021-01-13 19:26:34.381078-05	83	Question object (83)	3		8	1
34	2021-01-13 19:26:34.38524-05	82	Question object (82)	3		8	1
35	2021-01-13 19:26:34.388876-05	81	Question object (81)	3		8	1
36	2021-01-13 19:26:34.393629-05	80	Question object (80)	3		8	1
37	2021-01-13 19:26:34.397048-05	79	Question object (79)	3		8	1
38	2021-01-13 19:26:34.399737-05	78	Question object (78)	3		8	1
39	2021-01-13 19:26:34.402635-05	77	Question object (77)	3		8	1
40	2021-01-13 19:26:34.404645-05	76	Question object (76)	3		8	1
41	2021-01-13 19:26:34.407471-05	75	Question object (75)	3		8	1
42	2021-01-13 19:26:34.410261-05	74	Question object (74)	3		8	1
43	2021-01-13 19:26:34.413608-05	73	Question object (73)	3		8	1
44	2021-01-13 19:26:34.415772-05	72	Question object (72)	3		8	1
45	2021-01-13 19:26:34.417662-05	71	Question object (71)	3		8	1
46	2021-01-13 19:26:34.419852-05	70	Question object (70)	3		8	1
47	2021-01-13 19:26:34.422024-05	69	Question object (69)	3		8	1
48	2021-01-13 19:26:34.424891-05	68	Question object (68)	3		8	1
49	2021-01-13 19:26:34.427613-05	67	Question object (67)	3		8	1
50	2021-01-13 19:26:34.431178-05	66	Question object (66)	3		8	1
51	2021-01-13 19:26:34.433487-05	65	Question object (65)	3		8	1
52	2021-01-13 19:26:34.435513-05	64	Question object (64)	3		8	1
53	2021-01-13 19:26:34.437508-05	63	Question object (63)	3		8	1
54	2021-01-13 19:26:34.439997-05	62	Question object (62)	3		8	1
55	2021-01-13 19:26:34.443018-05	61	Question object (61)	3		8	1
56	2021-01-13 19:26:34.445711-05	60	Question object (60)	3		8	1
57	2021-01-13 19:26:34.447881-05	59	Question object (59)	3		8	1
58	2021-01-13 19:26:34.449873-05	58	Question object (58)	3		8	1
59	2021-01-13 19:26:34.451878-05	57	Question object (57)	3		8	1
60	2021-01-13 19:26:34.453829-05	56	Question object (56)	3		8	1
61	2021-01-13 19:26:34.455799-05	55	Question object (55)	3		8	1
62	2021-01-13 19:26:34.458847-05	54	Question object (54)	3		8	1
63	2021-01-13 19:26:34.462194-05	53	Question object (53)	3		8	1
64	2021-01-13 19:26:34.464439-05	52	Question object (52)	3		8	1
65	2021-01-13 19:26:34.466631-05	51	Question object (51)	3		8	1
66	2021-01-13 19:26:34.46845-05	50	Question object (50)	3		8	1
67	2021-01-13 19:26:34.470281-05	49	Question object (49)	3		8	1
68	2021-01-13 19:26:34.472592-05	48	Question object (48)	3		8	1
69	2021-01-13 19:26:34.475816-05	47	Question object (47)	3		8	1
70	2021-01-13 19:26:34.478049-05	46	Question object (46)	3		8	1
71	2021-01-13 19:26:34.480345-05	45	Question object (45)	3		8	1
72	2021-01-13 19:26:34.482119-05	44	Question object (44)	3		8	1
73	2021-01-13 19:26:34.484081-05	43	Question object (43)	3		8	1
74	2021-01-13 19:26:34.485874-05	42	Question object (42)	3		8	1
75	2021-01-13 19:26:34.487793-05	41	Question object (41)	3		8	1
76	2021-01-13 19:26:34.490257-05	40	Question object (40)	3		8	1
77	2021-01-13 19:26:34.493571-05	39	Question object (39)	3		8	1
78	2021-01-13 19:26:34.49588-05	38	Question object (38)	3		8	1
79	2021-01-13 19:26:34.497798-05	37	Question object (37)	3		8	1
80	2021-01-13 19:26:34.499595-05	36	Question object (36)	3		8	1
81	2021-01-13 19:26:34.501407-05	35	Question object (35)	3		8	1
82	2021-01-13 19:26:34.503248-05	34	Question object (34)	3		8	1
83	2021-01-13 19:26:34.505087-05	33	Question object (33)	3		8	1
84	2021-01-13 19:26:34.507445-05	32	Question object (32)	3		8	1
85	2021-01-13 19:26:34.509568-05	31	Question object (31)	3		8	1
86	2021-01-13 19:26:34.511707-05	30	Question object (30)	3		8	1
87	2021-01-13 19:26:34.513505-05	29	Question object (29)	3		8	1
88	2021-01-13 19:26:34.515294-05	28	Question object (28)	3		8	1
89	2021-01-13 19:26:34.517096-05	27	Question object (27)	3		8	1
90	2021-01-13 19:26:34.51893-05	26	Question object (26)	3		8	1
91	2021-01-13 19:26:34.520631-05	25	Question object (25)	3		8	1
92	2021-01-13 19:26:34.522381-05	24	Question object (24)	3		8	1
93	2021-01-13 19:26:34.524324-05	23	Question object (23)	3		8	1
94	2021-01-13 19:26:34.526788-05	22	Question object (22)	3		8	1
95	2021-01-13 19:26:34.528898-05	21	Question object (21)	3		8	1
96	2021-01-13 19:26:34.53072-05	20	Question object (20)	3		8	1
97	2021-01-13 19:26:34.532567-05	19	Question object (19)	3		8	1
98	2021-01-13 19:26:34.534257-05	18	Question object (18)	3		8	1
99	2021-01-13 19:26:34.537848-05	17	Question object (17)	3		8	1
100	2021-01-13 19:26:34.544372-05	16	Question object (16)	3		8	1
101	2021-01-13 19:26:34.549143-05	15	Question object (15)	3		8	1
102	2021-01-13 19:26:34.554453-05	14	Question object (14)	3		8	1
103	2021-01-13 19:26:34.559516-05	13	Question object (13)	3		8	1
104	2021-01-13 19:26:34.564615-05	12	Question object (12)	3		8	1
105	2021-01-13 19:26:34.569563-05	11	Question object (11)	3		8	1
106	2021-01-13 19:26:34.574676-05	10	Question object (10)	3		8	1
107	2021-01-13 19:26:34.582432-05	9	Question object (9)	3		8	1
108	2021-01-13 19:30:05.451026-05	208	Question object (208)	3		8	1
109	2021-01-13 19:30:05.460442-05	207	Question object (207)	3		8	1
110	2021-01-13 19:30:05.462461-05	206	Question object (206)	3		8	1
111	2021-01-13 19:30:05.464478-05	205	Question object (205)	3		8	1
112	2021-01-13 19:30:05.466429-05	204	Question object (204)	3		8	1
113	2021-01-13 19:30:05.468395-05	203	Question object (203)	3		8	1
114	2021-01-13 19:30:05.470313-05	202	Question object (202)	3		8	1
115	2021-01-13 19:30:05.472266-05	201	Question object (201)	3		8	1
116	2021-01-13 19:30:05.475384-05	200	Question object (200)	3		8	1
117	2021-01-13 19:30:05.477786-05	199	Question object (199)	3		8	1
118	2021-01-13 19:30:05.479755-05	198	Question object (198)	3		8	1
119	2021-01-13 19:30:05.482102-05	197	Question object (197)	3		8	1
120	2021-01-13 19:30:05.484014-05	196	Question object (196)	3		8	1
121	2021-01-13 19:30:05.485959-05	195	Question object (195)	3		8	1
122	2021-01-13 19:30:05.488713-05	194	Question object (194)	3		8	1
123	2021-01-13 19:30:05.496342-05	193	Question object (193)	3		8	1
124	2021-01-13 19:30:05.502365-05	192	Question object (192)	3		8	1
125	2021-01-13 19:30:05.509812-05	191	Question object (191)	3		8	1
126	2021-01-13 19:30:05.516358-05	190	Question object (190)	3		8	1
127	2021-01-13 19:30:05.522231-05	189	Question object (189)	3		8	1
128	2021-01-13 19:30:05.528346-05	188	Question object (188)	3		8	1
129	2021-01-13 19:30:05.534342-05	187	Question object (187)	3		8	1
130	2021-01-13 19:30:05.539152-05	186	Question object (186)	3		8	1
131	2021-01-13 19:30:05.544069-05	185	Question object (185)	3		8	1
132	2021-01-13 19:30:05.547278-05	184	Question object (184)	3		8	1
133	2021-01-13 19:30:05.550438-05	183	Question object (183)	3		8	1
134	2021-01-13 19:30:05.552807-05	182	Question object (182)	3		8	1
135	2021-01-13 19:30:05.555128-05	181	Question object (181)	3		8	1
136	2021-01-13 19:30:05.558885-05	180	Question object (180)	3		8	1
137	2021-01-13 19:30:05.561974-05	179	Question object (179)	3		8	1
138	2021-01-13 19:30:05.564961-05	178	Question object (178)	3		8	1
139	2021-01-13 19:30:05.566982-05	177	Question object (177)	3		8	1
140	2021-01-13 19:30:05.569143-05	176	Question object (176)	3		8	1
141	2021-01-13 19:30:05.571429-05	175	Question object (175)	3		8	1
142	2021-01-13 19:30:05.574362-05	174	Question object (174)	3		8	1
143	2021-01-13 19:30:05.577715-05	173	Question object (173)	3		8	1
144	2021-01-13 19:30:05.579961-05	172	Question object (172)	3		8	1
145	2021-01-13 19:30:05.582704-05	171	Question object (171)	3		8	1
146	2021-01-13 19:30:05.585153-05	170	Question object (170)	3		8	1
147	2021-01-13 19:30:05.587349-05	169	Question object (169)	3		8	1
148	2021-01-13 19:30:05.590167-05	168	Question object (168)	3		8	1
149	2021-01-13 19:30:05.593156-05	167	Question object (167)	3		8	1
150	2021-01-13 19:30:05.595326-05	166	Question object (166)	3		8	1
151	2021-01-13 19:30:05.597684-05	165	Question object (165)	3		8	1
152	2021-01-13 19:30:05.600159-05	164	Question object (164)	3		8	1
153	2021-01-13 19:30:05.602541-05	163	Question object (163)	3		8	1
154	2021-01-13 19:30:05.604999-05	162	Question object (162)	3		8	1
155	2021-01-13 19:30:05.608611-05	161	Question object (161)	3		8	1
156	2021-01-13 19:30:05.611606-05	160	Question object (160)	3		8	1
157	2021-01-13 19:30:05.614541-05	159	Question object (159)	3		8	1
158	2021-01-13 19:30:05.619512-05	158	Question object (158)	3		8	1
159	2021-01-13 19:30:05.624692-05	157	Question object (157)	3		8	1
160	2021-01-13 19:30:05.632389-05	156	Question object (156)	3		8	1
161	2021-01-13 19:30:05.638009-05	155	Question object (155)	3		8	1
162	2021-01-13 19:30:05.64566-05	154	Question object (154)	3		8	1
163	2021-01-13 19:30:05.652201-05	153	Question object (153)	3		8	1
164	2021-01-13 19:30:05.661408-05	152	Question object (152)	3		8	1
165	2021-01-13 19:30:05.667949-05	151	Question object (151)	3		8	1
166	2021-01-13 19:30:05.674622-05	150	Question object (150)	3		8	1
167	2021-01-13 19:30:05.682701-05	149	Question object (149)	3		8	1
168	2021-01-13 19:30:05.68832-05	148	Question object (148)	3		8	1
169	2021-01-13 19:30:05.695769-05	147	Question object (147)	3		8	1
170	2021-01-13 19:30:05.701407-05	146	Question object (146)	3		8	1
171	2021-01-13 19:30:05.706814-05	145	Question object (145)	3		8	1
172	2021-01-13 19:30:05.714288-05	144	Question object (144)	3		8	1
173	2021-01-13 19:30:05.720202-05	143	Question object (143)	3		8	1
174	2021-01-13 19:30:05.726891-05	142	Question object (142)	3		8	1
175	2021-01-13 19:30:05.732284-05	141	Question object (141)	3		8	1
176	2021-01-13 19:30:05.738744-05	140	Question object (140)	3		8	1
177	2021-01-13 19:30:05.747965-05	139	Question object (139)	3		8	1
178	2021-01-13 19:30:05.751148-05	138	Question object (138)	3		8	1
179	2021-01-13 19:30:05.753758-05	137	Question object (137)	3		8	1
180	2021-01-13 19:30:05.756505-05	136	Question object (136)	3		8	1
181	2021-01-13 19:30:05.759964-05	135	Question object (135)	3		8	1
182	2021-01-13 19:30:05.762542-05	134	Question object (134)	3		8	1
183	2021-01-13 19:30:05.765201-05	133	Question object (133)	3		8	1
184	2021-01-13 19:30:05.76775-05	132	Question object (132)	3		8	1
185	2021-01-13 19:30:05.770287-05	131	Question object (131)	3		8	1
186	2021-01-13 19:30:05.772925-05	130	Question object (130)	3		8	1
187	2021-01-13 19:30:05.776064-05	129	Question object (129)	3		8	1
188	2021-01-13 19:30:05.779179-05	128	Question object (128)	3		8	1
189	2021-01-13 19:30:05.781517-05	127	Question object (127)	3		8	1
190	2021-01-13 19:30:05.783774-05	126	Question object (126)	3		8	1
191	2021-01-13 19:30:05.786013-05	125	Question object (125)	3		8	1
192	2021-01-13 19:30:05.788241-05	124	Question object (124)	3		8	1
193	2021-01-13 19:30:05.791723-05	123	Question object (123)	3		8	1
194	2021-01-13 19:30:05.794857-05	122	Question object (122)	3		8	1
195	2021-01-13 19:30:05.79757-05	121	Question object (121)	3		8	1
196	2021-01-13 19:30:05.800034-05	120	Question object (120)	3		8	1
197	2021-01-13 19:30:05.802314-05	119	Question object (119)	3		8	1
198	2021-01-13 19:30:05.804799-05	118	Question object (118)	3		8	1
199	2021-01-13 19:30:05.808693-05	117	Question object (117)	3		8	1
200	2021-01-13 19:30:05.812272-05	116	Question object (116)	3		8	1
201	2021-01-13 19:30:05.81502-05	115	Question object (115)	3		8	1
202	2021-01-13 19:30:05.817765-05	114	Question object (114)	3		8	1
203	2021-01-13 19:30:05.820363-05	113	Question object (113)	3		8	1
204	2021-01-13 19:30:05.823464-05	112	Question object (112)	3		8	1
205	2021-01-13 19:30:05.826961-05	111	Question object (111)	3		8	1
206	2021-01-13 19:30:05.830433-05	110	Question object (110)	3		8	1
207	2021-01-13 19:30:05.833121-05	109	Question object (109)	3		8	1
208	2021-01-13 19:56:51.163552-05	455	Question object (455)	2	[]	8	1
209	2021-01-13 20:32:17.571248-05	1549	Question object (1549)	3		8	1
210	2021-01-13 20:34:24.204012-05	1548	Question object (1548)	3		8	1
211	2021-01-13 20:34:24.214047-05	1547	Question object (1547)	3		8	1
212	2021-01-13 20:34:24.216593-05	1546	Question object (1546)	3		8	1
213	2021-01-13 20:34:24.219049-05	1545	Question object (1545)	3		8	1
214	2021-01-13 20:34:24.221154-05	1544	Question object (1544)	3		8	1
215	2021-01-13 20:34:24.223677-05	1543	Question object (1543)	3		8	1
216	2021-01-13 20:34:24.22584-05	1542	Question object (1542)	3		8	1
217	2021-01-13 20:34:24.227909-05	1541	Question object (1541)	3		8	1
218	2021-01-13 20:34:24.22983-05	1540	Question object (1540)	3		8	1
219	2021-01-13 20:34:24.232409-05	1539	Question object (1539)	3		8	1
220	2021-01-13 20:34:24.234832-05	1538	Question object (1538)	3		8	1
221	2021-01-13 20:34:24.238245-05	1537	Question object (1537)	3		8	1
222	2021-01-13 20:34:24.241112-05	1536	Question object (1536)	3		8	1
223	2021-01-13 20:34:24.243865-05	1535	Question object (1535)	3		8	1
224	2021-01-13 20:34:24.245919-05	1534	Question object (1534)	3		8	1
225	2021-01-13 20:34:24.248341-05	1533	Question object (1533)	3		8	1
226	2021-01-13 20:34:24.251282-05	1532	Question object (1532)	3		8	1
227	2021-01-13 20:34:24.253549-05	1531	Question object (1531)	3		8	1
228	2021-01-13 20:34:24.25599-05	1530	Question object (1530)	3		8	1
229	2021-01-13 20:34:24.258676-05	1529	Question object (1529)	3		8	1
230	2021-01-13 20:34:24.261445-05	1528	Question object (1528)	3		8	1
231	2021-01-13 20:34:24.263993-05	1527	Question object (1527)	3		8	1
232	2021-01-13 20:34:24.266645-05	1526	Question object (1526)	3		8	1
233	2021-01-13 20:34:24.268864-05	1525	Question object (1525)	3		8	1
234	2021-01-13 20:34:24.271136-05	1524	Question object (1524)	3		8	1
235	2021-01-13 20:34:24.273535-05	1523	Question object (1523)	3		8	1
236	2021-01-13 20:34:24.275724-05	1522	Question object (1522)	3		8	1
237	2021-01-13 20:34:24.277677-05	1521	Question object (1521)	3		8	1
238	2021-01-13 20:34:24.279554-05	1520	Question object (1520)	3		8	1
239	2021-01-13 20:34:24.282357-05	1519	Question object (1519)	3		8	1
240	2021-01-13 20:34:24.285796-05	1518	Question object (1518)	3		8	1
241	2021-01-13 20:34:24.288716-05	1517	Question object (1517)	3		8	1
242	2021-01-13 20:34:24.29102-05	1516	Question object (1516)	3		8	1
243	2021-01-13 20:34:24.293236-05	1515	Question object (1515)	3		8	1
244	2021-01-13 20:34:24.295338-05	1514	Question object (1514)	3		8	1
245	2021-01-13 20:34:24.297323-05	1513	Question object (1513)	3		8	1
246	2021-01-13 20:34:24.300408-05	1512	Question object (1512)	3		8	1
247	2021-01-13 20:37:18.740629-05	2	Team object (2)	1	[{"added": {}}]	7	1
248	2021-01-13 20:37:33.929749-05	3	Team object (3)	1	[{"added": {}}]	7	1
249	2021-01-13 20:37:39.386244-05	4	Team object (4)	1	[{"added": {}}]	7	1
250	2021-01-13 20:37:46.349544-05	5	Team object (5)	1	[{"added": {}}]	7	1
251	2021-01-13 20:38:02.585513-05	6	Team object (6)	1	[{"added": {}}]	7	1
252	2021-01-13 20:38:07.747026-05	7	Team object (7)	1	[{"added": {}}]	7	1
253	2021-01-13 20:38:14.357716-05	8	Team object (8)	1	[{"added": {}}]	7	1
254	2021-01-13 20:38:17.879193-05	9	Team object (9)	1	[{"added": {}}]	7	1
255	2021-01-13 20:38:23.344198-05	10	Team object (10)	1	[{"added": {}}]	7	1
256	2021-01-13 20:38:41.797998-05	11	Team object (11)	1	[{"added": {}}]	7	1
257	2021-01-13 20:38:47.083054-05	12	Team object (12)	1	[{"added": {}}]	7	1
258	2021-01-13 20:38:54.774822-05	13	Team object (13)	1	[{"added": {}}]	7	1
259	2021-01-13 20:39:01.632071-05	14	Team object (14)	1	[{"added": {}}]	7	1
260	2021-01-13 20:39:10.965167-05	15	Team object (15)	1	[{"added": {}}]	7	1
261	2021-01-13 20:39:30.926132-05	16	Team object (16)	1	[{"added": {}}]	7	1
262	2021-01-13 20:39:38.68345-05	17	Team object (17)	1	[{"added": {}}]	7	1
263	2021-01-13 20:39:43.810507-05	18	Team object (18)	1	[{"added": {}}]	7	1
264	2021-01-13 20:39:49.786581-05	19	Team object (19)	1	[{"added": {}}]	7	1
265	2021-01-13 20:39:56.022065-05	20	Team object (20)	1	[{"added": {}}]	7	1
266	2021-01-13 20:40:08.409358-05	20	Team object (20)	2	[{"changed": {"fields": ["Division name"]}}]	7	1
267	2021-01-13 20:40:31.027453-05	21	Team object (21)	1	[{"added": {}}]	7	1
268	2021-01-13 20:40:38.6455-05	22	Team object (22)	1	[{"added": {}}]	7	1
269	2021-01-13 20:40:45.064684-05	23	Team object (23)	1	[{"added": {}}]	7	1
270	2021-01-13 20:40:52.231311-05	24	Team object (24)	1	[{"added": {}}]	7	1
271	2021-01-13 20:40:58.335321-05	25	Team object (25)	1	[{"added": {}}]	7	1
272	2021-01-13 20:41:04.870723-05	26	Team object (26)	1	[{"added": {}}]	7	1
273	2021-01-13 20:41:09.883876-05	27	Team object (27)	1	[{"added": {}}]	7	1
274	2021-01-13 20:41:15.061897-05	28	Team object (28)	1	[{"added": {}}]	7	1
275	2021-01-13 20:41:20.642464-05	29	Team object (29)	1	[{"added": {}}]	7	1
276	2021-01-13 20:41:25.252859-05	30	Team object (30)	1	[{"added": {}}]	7	1
277	2021-01-13 20:41:32.153411-05	31	Team object (31)	1	[{"added": {}}]	7	1
278	2021-01-13 20:51:00.74309-05	1	Team object (1)	2	[{"changed": {"fields": ["Division name"]}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	court	team
8	court	question
9	court	court
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-13 15:36:28.9077-05
2	auth	0001_initial	2021-01-13 15:36:28.956553-05
3	admin	0001_initial	2021-01-13 15:36:29.05224-05
4	admin	0002_logentry_remove_auto_add	2021-01-13 15:36:29.081061-05
5	admin	0003_logentry_add_action_flag_choices	2021-01-13 15:36:29.093682-05
6	contenttypes	0002_remove_content_type_name	2021-01-13 15:36:29.115289-05
7	auth	0002_alter_permission_name_max_length	2021-01-13 15:36:29.152028-05
8	auth	0003_alter_user_email_max_length	2021-01-13 15:36:29.16232-05
9	auth	0004_alter_user_username_opts	2021-01-13 15:36:29.174582-05
10	auth	0005_alter_user_last_login_null	2021-01-13 15:36:29.184579-05
11	auth	0006_require_contenttypes_0002	2021-01-13 15:36:29.18753-05
12	auth	0007_alter_validators_add_error_messages	2021-01-13 15:36:29.196954-05
13	auth	0008_alter_user_username_max_length	2021-01-13 15:36:29.213096-05
14	auth	0009_alter_user_last_name_max_length	2021-01-13 15:36:29.223539-05
15	auth	0010_alter_group_name_max_length	2021-01-13 15:36:29.238311-05
16	auth	0011_update_proxy_permissions	2021-01-13 15:36:29.247678-05
17	auth	0012_alter_user_first_name_max_length	2021-01-13 15:36:29.257569-05
18	court	0001_initial	2021-01-13 15:36:29.266272-05
19	court	0002_auto_20201226_1505	2021-01-13 15:36:29.277711-05
20	court	0003_auto_20201226_1526	2021-01-13 15:36:29.284526-05
21	court	0004_auto_20201226_2012	2021-01-13 15:36:29.289246-05
22	court	0005_auto_20201229_2235	2021-01-13 15:36:29.306847-05
23	court	0006_court	2021-01-13 15:36:29.330385-05
24	court	0007_auto_20210107_1741	2021-01-13 15:36:29.37677-05
25	court	0008_auto_20210113_0134	2021-01-13 15:36:29.389635-05
26	sessions	0001_initial	2021-01-13 15:36:29.406381-05
27	court	0009_auto_20210113_2316	2021-01-13 18:16:42.730142-05
28	court	0010_auto_20210114_0127	2021-01-13 20:27:47.232534-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
rao54ldkm543d8tofcluu96oxpdrrrif	.eJxVjEEOwiAQRe_C2hAGLENcuvcMZGAGqRqalHbVeHdt0oVu_3vvbyrSutS4dpnjyOqiQJ1-t0T5KW0H_KB2n3Se2jKPSe-KPmjXt4nldT3cv4NKvX5rKeALEjgWQgdD8A6RbCY2CDYBmIKGXChiIZy991mYfaDBmcRISb0_4BI37w:1kznJX:Er6NMQmDb2-GlL62TVPUZabo3WsWQBrEvDkgZMl-Qsk	2021-01-27 16:04:23.344627-05
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: court_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.court_question_id_seq', 1617, true);


--
-- Name: court_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.court_team_id_seq', 31, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 278, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: court_court court_court_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.court_court
    ADD CONSTRAINT court_court_pkey PRIMARY KEY (court_id);


--
-- Name: court_question court_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.court_question
    ADD CONSTRAINT court_question_pkey PRIMARY KEY (id);


--
-- Name: court_team court_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.court_team
    ADD CONSTRAINT court_team_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: court_court_court_id_af048547_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX court_court_court_id_af048547_like ON public.court_court USING btree (court_id varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

