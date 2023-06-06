--
-- PostgreSQL database dump
--

-- Dumped from database version 13.10 (Ubuntu 13.10-1.pgdg22.04+1)
-- Dumped by pg_dump version 13.10 (Ubuntu 13.10-1.pgdg22.04+1)

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
-- Name: authors; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    author_ol_id character varying,
    name character varying NOT NULL,
    picture_url character varying,
    about text
);


ALTER TABLE public.authors OWNER TO linuxuser;

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_author_id_seq OWNER TO linuxuser;

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying NOT NULL,
    primary_isbn10 character varying(20),
    primary_isbn13 character varying(20) NOT NULL,
    description text,
    contributor_note character varying(100),
    walmart_link character varying
);


ALTER TABLE public.books OWNER TO linuxuser;

--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.books_authors (
    book_author_id integer NOT NULL,
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.books_authors OWNER TO linuxuser;

--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.books_authors_book_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_authors_book_author_id_seq OWNER TO linuxuser;

--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.books_authors_book_author_id_seq OWNED BY public.books_authors.book_author_id;


--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_book_id_seq OWNER TO linuxuser;

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;


--
-- Name: books_categories; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.books_categories (
    book_category_id integer NOT NULL,
    book_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.books_categories OWNER TO linuxuser;

--
-- Name: books_categories_book_category_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.books_categories_book_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_categories_book_category_id_seq OWNER TO linuxuser;

--
-- Name: books_categories_book_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.books_categories_book_category_id_seq OWNED BY public.books_categories.book_category_id;


--
-- Name: books_lists; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.books_lists (
    book_list_id integer NOT NULL,
    book_id integer NOT NULL,
    list_id integer NOT NULL
);


ALTER TABLE public.books_lists OWNER TO linuxuser;

--
-- Name: books_lists_book_list_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.books_lists_book_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_lists_book_list_id_seq OWNER TO linuxuser;

--
-- Name: books_lists_book_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.books_lists_book_list_id_seq OWNED BY public.books_lists.book_list_id;


--
-- Name: books_shelves; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.books_shelves (
    book_shelf_id integer NOT NULL,
    book_id integer NOT NULL,
    shelf_id integer NOT NULL
);


ALTER TABLE public.books_shelves OWNER TO linuxuser;

--
-- Name: books_shelves_book_shelf_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.books_shelves_book_shelf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_shelves_book_shelf_id_seq OWNER TO linuxuser;

--
-- Name: books_shelves_book_shelf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.books_shelves_book_shelf_id_seq OWNED BY public.books_shelves.book_shelf_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL
);


ALTER TABLE public.categories OWNER TO linuxuser;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO linuxuser;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: covers; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.covers (
    cover_id integer NOT NULL,
    book_id integer NOT NULL,
    cover_url character varying NOT NULL,
    source character varying(10) NOT NULL
);


ALTER TABLE public.covers OWNER TO linuxuser;

--
-- Name: covers_cover_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.covers_cover_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.covers_cover_id_seq OWNER TO linuxuser;

--
-- Name: covers_cover_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.covers_cover_id_seq OWNED BY public.covers.cover_id;


--
-- Name: lists; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.lists (
    list_id integer NOT NULL,
    list_name character varying(100) NOT NULL,
    nyt_list_name_encoded character varying(100) NOT NULL
);


ALTER TABLE public.lists OWNER TO linuxuser;

--
-- Name: lists_list_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.lists_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lists_list_id_seq OWNER TO linuxuser;

--
-- Name: lists_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.lists_list_id_seq OWNED BY public.lists.list_id;


--
-- Name: shelves; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.shelves (
    shelf_id integer NOT NULL,
    user_id integer NOT NULL,
    shelf_type character varying NOT NULL
);


ALTER TABLE public.shelves OWNER TO linuxuser;

--
-- Name: shelves_shelf_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.shelves_shelf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shelves_shelf_id_seq OWNER TO linuxuser;

--
-- Name: shelves_shelf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.shelves_shelf_id_seq OWNED BY public.shelves.shelf_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO linuxuser;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO linuxuser;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: books book_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);


--
-- Name: books_authors book_author_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_authors ALTER COLUMN book_author_id SET DEFAULT nextval('public.books_authors_book_author_id_seq'::regclass);


--
-- Name: books_categories book_category_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_categories ALTER COLUMN book_category_id SET DEFAULT nextval('public.books_categories_book_category_id_seq'::regclass);


--
-- Name: books_lists book_list_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_lists ALTER COLUMN book_list_id SET DEFAULT nextval('public.books_lists_book_list_id_seq'::regclass);


--
-- Name: books_shelves book_shelf_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_shelves ALTER COLUMN book_shelf_id SET DEFAULT nextval('public.books_shelves_book_shelf_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: covers cover_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.covers ALTER COLUMN cover_id SET DEFAULT nextval('public.covers_cover_id_seq'::regclass);


--
-- Name: lists list_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.lists ALTER COLUMN list_id SET DEFAULT nextval('public.lists_list_id_seq'::regclass);


--
-- Name: shelves shelf_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.shelves ALTER COLUMN shelf_id SET DEFAULT nextval('public.shelves_shelf_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.authors (author_id, author_ol_id, name, picture_url, about) FROM stdin;
1	\N	Nora Roberts	\N	\N
2	\N	Emily Henry	\N	\N
3	\N	Colleen Hoover	\N	\N
4	\N	Abraham Verghese	\N	\N
5	\N	Colleen Hoover	\N	\N
6	\N	Rebecca Yarros	\N	\N
7	\N	Bonnie Garmus	\N	\N
8	\N	Don Bentley	\N	\N
9	\N	Carley Fortune	\N	\N
10	\N	Barbara Kingsolver	\N	\N
11	\N	Colleen Hoover	\N	\N
12	\N	Taylor Jenkins Reid	\N	\N
13	\N	Laura Dave	\N	\N
14	\N	Freida McFadden	\N	\N
15	\N	Hannah Grace	\N	\N
16	\N	David Grann	\N	\N
17	\N	David Grann	\N	\N
18	\N	Peter Attia, MD	\N	\N
19	\N	Bessel A. Van der Kolk	\N	\N
20	\N	David Von Drehle	\N	\N
21	\N	Jennette McCurdy	\N	\N
22	\N	Prince Harry, The Duke of Sussex	\N	\N
23	\N	Michelle Zauner	\N	\N
24	\N	Andy Cohen	\N	\N
25	\N	Elise Loehnen	\N	\N
26	\N	Jonathan Freedland	\N	\N
27	\N	Michelle Obama	\N	\N
28	\N	Jamie Loftus	\N	\N
29	\N	Robin Wall Kimmerer	\N	\N
30	\N	bell hooks	\N	\N
31	\N	Nora Roberts	\N	\N
32	\N	Rebecca Yarros	\N	\N
33	\N	James Patterson	\N	\N
34	\N	Maxine Paetro	\N	\N
35	\N	David Baldacci	\N	\N
36	\N	Don Bentley	\N	\N
37	\N	R. F. Kuang	\N	\N
38	\N	Ann Napolitano	\N	\N
39	\N	Gabrielle Zevin	\N	\N
40	\N	Tom Hanks	\N	\N
41	\N	Jack Carr	\N	\N
42	\N	Stacey Abrams	\N	\N
43	\N	Luke Russert	\N	\N
44	\N	Matthew Desmond	\N	\N
45	\N	Jonathan Eig	\N	\N
46	\N	David Remnick	\N	\N
47	\N	Stephen Vladeck	\N	\N
48	\N	Matthew McConaughey	\N	\N
49	\N	Matt Haig	\N	\N
50	\N	Colleen Hoover	\N	\N
51	\N	Colleen Hoover	\N	\N
52	\N	Tarryn Fisher	\N	\N
53	\N	Colleen Hoover	\N	\N
54	\N	Alex Michaelides	\N	\N
55	\N	Hernan Diaz	\N	\N
56	\N	Lucy Score	\N	\N
57	\N	Samantha Irby	\N	\N
58	\N	Jeannette Walls	\N	\N
59	\N	Daniel Kahneman	\N	\N
60	\N	S. C. Gwynne	\N	\N
61	\N	Malcolm Gladwell	\N	\N
62	\N	Tara Westover	\N	\N
63	\N	Tina Turner	\N	\N
64	\N	Malcolm Gladwell	\N	\N
65	\N	Angela Duckworth	\N	\N
66	\N	James Clear	\N	\N
67	\N	Joanna Gaines	\N	\N
68	\N	Tinx	\N	\N
69	\N	Rick Rubin	\N	\N
70	\N	Charlie Mackesy	\N	\N
71	\N	Glenn Boozan	\N	\N
72	\N	Ramit Sethi	\N	\N
73	\N	Admiral William H. McRaven	\N	\N
74	\N	Mark Manson	\N	\N
75	\N	T.d. Jakes	\N	\N
76	\N	Rick Riordan	\N	\N
77	\N	Mark Oshiro	\N	\N
78	\N	R. J. Palacio	\N	\N
79	\N	Alan Gratz	\N	\N
80	\N	Beth Lincoln	\N	\N
81	\N	Dave Eggers	\N	\N
82	\N	America's Test Kitchen Kids (COR)	\N	\N
83	\N	A.F. Steadman	\N	\N
84	\N	Katherine Applegate	\N	\N
85	\N	A.F. Steadman	\N	\N
86	\N	Kiyash Monsef	\N	\N
87	\N	Gregory Lang	\N	\N
88	\N	Susanna Leonard Hill	\N	\N
89	\N	Amy Krouse Rosenthal	\N	\N
90	\N	Kobi Yamada	\N	\N
91	\N	Emily Winfield Martin	\N	\N
92	\N	Drew Daywalt	\N	\N
93	\N	Eric Carle	\N	\N
94	\N	Eric Carle	\N	\N
95	\N	Adam Rubin	\N	\N
96	\N	Peter H. Reynolds	\N	\N
97	\N	Sandra Boynton	\N	\N
98	\N	Jeff Kinney	\N	\N
99	\N	Holly Jackson	\N	\N
100	\N	Katherine Applegate	\N	\N
101	\N	Jenny Han	\N	\N
102	\N	Suzanne Collins	\N	\N
103	\N	J. K. Rowling	\N	\N
104	\N	Dav Pilkey	\N	\N
105	\N	Rick Riordan	\N	\N
106	\N	Jennifer Lynn Barnes	\N	\N
107	\N	Tui T. Sutherland	\N	\N
108	\N	Alice Oseman	\N	\N
109	\N	Holly Jackson	\N	\N
110	\N	Alice Oseman	\N	\N
111	\N	Angeline Boulley	\N	\N
112	\N	Adam Silvera	\N	\N
113	\N	Alex Aster	\N	\N
114	\N	J. Elle	\N	\N
115	\N	Chasten Buttigieg	\N	\N
116	\N	Alexandra Bracken	\N	\N
117	\N	Becky Albertalli	\N	\N
118	\N	William H. McRaven	\N	\N
119	\N	Brené Brown	\N	\N
120	\N	Jocko Willink	\N	\N
121	\N	Leif Babin	\N	\N
122	\N	Paris Hilton	\N	\N
123	\N	Dav Pilkey	\N	\N
124	\N	Dav Pilkey	\N	\N
125	\N	Dav Pilkey	\N	\N
126	\N	Tui T. Sutherland	\N	\N
127	\N	Dav Pilkey	\N	\N
128	\N	Jerry Craft	\N	\N
129	\N	Eiichiro Oda	\N	\N
130	\N	Naoya Matsumoto	\N	\N
131	\N	Dav Pilkey	\N	\N
132	\N	Ann M. Martin	\N	\N
133	\N	Kevin Eastman	\N	\N
134	\N	Peter Laird	\N	\N
135	\N	Tom Waltz	\N	\N
136	\N	Dav Pilkey	\N	\N
137	\N	Tatsuya Endo	\N	\N
138	\N	Dav Pilkey	\N	\N
139	\N	Stuart Gibbs	\N	\N
140	\N	James Patterson	\N	\N
141	\N	James O. Born	\N	\N
142	\N	Danielle Steel	\N	\N
143	\N	Sandra Brown	\N	\N
144	\N	Nora Roberts	\N	\N
145	\N	James Patterson	\N	\N
146	\N	J. D. Barker	\N	\N
147	\N	David Baldacci	\N	\N
148	\N	William W. Johnstone	\N	\N
149	\N	J.A. Johnstone	\N	\N
150	\N	Don Bentley	\N	\N
151	\N	William W. Johnstone	\N	\N
152	\N	J.A. Johnstone	\N	\N
153	\N	Megan Miranda	\N	\N
154	\N	Debbie Macomber	\N	\N
155	\N	Lisa Jackson	\N	\N
156	\N	Nora Roberts	\N	\N
157	\N	Debbie Macomber	\N	\N
158	\N	Lee Tobin McClain	\N	\N
159	\N	John Grisham	\N	\N
160	\N	Katherine Applegate	\N	\N
161	\N	Peter Brown	\N	\N
162	\N	Barbara O'Connor	\N	\N
163	\N	Linda Sue Park	\N	\N
164	\N	Gordon Korman	\N	\N
165	\N	Katherine Applegate	\N	\N
166	\N	Lynda Mullaly Hunt	\N	\N
167	\N	Rosanne Parry	\N	\N
168	\N	Sharon M. Draper	\N	\N
169	\N	Tae Keller	\N	\N
170	\N	Laura Nowlin	\N	\N
171	\N	Kathleen Glasgow	\N	\N
172	\N	Lynn Painter	\N	\N
173	\N	Amber Smith	\N	\N
174	\N	Karen M. McManus	\N	\N
175	\N	Natasha Preston	\N	\N
176	\N	Adam Silvera	\N	\N
177	\N	Leigh Bardugo	\N	\N
178	\N	Markus Zusak	\N	\N
179	\N	Stephanie Garber	\N	\N
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books (book_id, title, primary_isbn10, primary_isbn13, description, contributor_note, walmart_link) FROM stdin;
2	HAPPY PLACE	0593441273	9780593441275	<b><b>INSTANT #1 NEW YORK TIMES BESTSELLER!<br><br>“The beach-read master hooks us again."—<i>People </i></b><br><br>Named a Most Anticipated Book of 2023 by BuzzFeed ∙ Paste Magazine ∙ Elle <b>∙</b> Southern Living ∙ <b>SheReads <b>∙</b> Culturess <b>∙ Medium <b>∙ Her Campus <b>∙</b> Readers Digest <b>∙ Zibby Mag</b></b></b></b> and more!<br><br>A couple who broke up months ago pretend to still be together for their annual weeklong vacation with their best friends in this glittering and wise new novel from #1 <i>New York Times</i> bestselling author Emily Henry.</b><br>  <br> Harriet and Wyn have been the perfect couple since they met in college—they go together like salt and pepper, honey and tea, lobster and rolls. Except, now—for reasons they’re still not discussing—they don’t.<br>  <br> They broke up five months ago. And still haven’t told their best friends.<br>  <br> Which is how they find themselves sharing a bedroom at the Maine cottage that has been their friend group’s yearly getaway for the last decade. Their annual respite from the world, where for one vibrant, blissful week they leave behind their daily lives; have copious amounts of cheese, wine, and seafood; and soak up the salty coastal air with the people who understand them most.<br>  <br> Only this year, Harriet and Wyn are lying through their teeth while trying not to notice how desperately they still want each other. Because the cottage is for sale and this is the last week they’ll all have together in this place. They can’t stand to break their friends’ hearts, and so they’ll play their parts. Harriet will be the driven surgical resident who never starts a fight, and Wyn will be the laid-back charmer who never lets the cracks show. It’s a flawless plan (if you look at it from a great distance and through a pair of sunscreen-smeared sunglasses). After years of being in love, how hard can it be to fake it for one week…in front of those who know you best?		https://www.walmart.com/ip/Happy-Place-Hardcover-9780593441275/1599677634
3	IT ENDS WITH US	1501110365	9781501110368	<b><b>From the #1 <i>New York Times</i> bestselling author of <i>It Starts with Us </i>and <i>All Your Perfects</i>, a</b><b> “brave and heartbreaking novel that digs its claws into you and doesn’t let go, long after you’ve finished it” (Anna Todd, <i>New York Times</i> bestselling author) about a workaholic with a too-good-to-be-true romance can’t stop thinking about her first love—</b></b><b>soon to be a major motion picture starring Blake Lively and Justin Baldoni.</b><br><br>Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.<br> <br>Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.<br> <br>As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.<br> <br>An honest, evocative, and tender novel, <i>It Ends with Us</i> is “a glorious and touching read, a forever keeper. The kind of book that gets handed down” (<i>USA TODAY</i>).		https://www.walmart.com/ip/It-Ends-with-Us-It-Ends-with-Us-Series-1-Paperback-9781501110368/50552397
4	THE COVENANT OF WATER	0802162177	9780802162175	<p><b>OPRAH'S BOOK CLUB PICK - INSTANT <i>NEW YORK TIMES</i> BESTSELLER </b></p><p>From the New York Times-bestselling author of Cutting for Stone comes a stunning and magisterial epic of love, faith, and medicine, set in Kerala, South India, following three generations of a family seeking the answers to a strange secret</p><p></p><b>"One of the best books I've read in my entire life. It's epic. It's transportive . . . It was unputdownable!"-Oprah Winfrey, OprahDaily.com</b></p><p><b></b></p>The Covenant of Water is the long-awaited new novel by Abraham Verghese, the author of the major word-of-mouth bestseller Cutting for Stone, which has sold over 1.5 million copies in the United States alone and remained on the New York Times bestseller list for over two years.<br></p><br><p>Spanning the years 1900 to 1977, The Covenant of Water is set in Kerala, on South India's Malabar Coast, and follows three generations of a family that suffers a peculiar affliction: in every generation, at least one person dies by drowning--and in Kerala, water is everywhere. At the turn of the century, a twelve-year-old girl from Kerala's long-existing Christian community, grieving the death of her father, is sent by boat to her wedding, where she will meet her forty-year-old husband for the first time. From this unforgettable new beginning, the young girl--and future matriarch, known as Big Ammachi--will witness unthinkable changes over the span of her extraordinary life, full of joy and triumph as well as hardship and loss, her faith and love the only constants.</p><br><p>A shimmering evocation of a bygone India and of the passage of time itself, The Covenant of Water is a hymn to progress in medicine and to human understanding, and a humbling testament to the difficulties undergone by past generations for the sake of those alive today. It is one of the most masterful literary novels published in recent years.</p>		https://www.walmart.com/ip/The-Covenant-of-Water-Oprah-s-Book-Club-Hardcover-9780802162175/1190463425
5	IT STARTS WITH US	1668001225	9781668001226	<b>Before <i>It Ends with Us</i>, it started with Atlas. Colleen Hoover tells fan favorite Atlas’s side of the story and shares what comes next in this long-anticipated sequel to the “glorious and touching” (<i>USA TODAY</i>) #1 <i>New York Times</i> bestseller <i>It Ends with Us</i>.</b><br><br>Lily and her ex-husband, Ryle, have just settled into a civil coparenting rhythm when she suddenly bumps into her first love, Atlas, again. After nearly two years separated, she is elated that for once, time is on their side, and she immediately says yes when Atlas asks her on a date.<br> <br>But her excitement is quickly hampered by the knowledge that, though they are no longer married, Ryle is still very much a part of her life—and Atlas Corrigan is the one man he will hate being in his ex-wife and daughter’s life.<br> <br>Switching between the perspectives of Lily and Atlas, <i>It Starts with Us</i> picks up right where the epilogue for the “gripping, pulse-pounding” (Sarah Pekkanen, author of <i>Perfect Neighbors</i>) bestselling phenomenon <i>It Ends with Us</i> left off. Revealing more about Atlas’s past and following Lily as she embraces a second chance at true love while navigating a jealous ex-husband, it proves that “no one delivers an emotional read like Colleen Hoover” (Anna Todd, <i>New York Times</i> bestselling author).		https://www.walmart.com/ip/It-Starts-with-Us-A-Novel-Paperback-9781668001226/425060443
131	LORD OF THE FLEAS	1338741071	9781338741070	<b>The Supa Buddies convene to deal with some new villains in the fifth Dog Man book from worldwide bestselling author and artist Dav Pilkey.</b><br></br>When a fresh bunch of baddies bust up the town, Dog Man is called into action -- and this time he isn't alone. With a cute kitten and a remarkable robot by his side, our heroes must save the day by joining forces with an unlikely ally: Petey, the World's Most Evil Cat. But can the villainous Petey avoid vengeance and venture into virtue? <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of being true to one's self.		https://www.walmart.com/ip/Dog-Man-Lord-of-the-Fleas-A-Graphic-Novel-Dog-Man-5-From-the-Creator-of-Captain-Underpants-Volume-5-Series-5-Hardcover-9781338741070/864574249
7	LESSONS IN CHEMISTRY	038554734X	9780385547345	<b><i>NEW YORK TIMES</i> BESTSELLER • <i>GOOD MORNING AMERICA</i> BOOK CLUB PICK • A must-read debut! Meet Elizabeth Zott: a “formidable, unapologetic and inspiring” (<i>PARADE</i>) scientist in 1960s California whose career takes a detour when she becomes the unlikely star of a beloved TV cooking show in this novel that is “irresistible, satisfying and full of fuel. It reminds you that change takes time and always requires heat” (<i>The New York Times Book Review</i>).</b><br><br><b>"A unique heroine ... you'll find yourself wishing she wasn’t fictional." —<i>Seattle Times</i></b><br><br><b><i> </i></b>Chemist Elizabeth Zott is not your average woman. In fact, Elizabeth Zott would be the first to point out that there is no such thing as an <i>average</i> woman. But it’s the early 1960s and her all-male team at Hastings Research Institute takes a very unscientific view of equality. Except for one: Calvin Evans; the lonely, brilliant, Nobel–prize nominated grudge-holder who falls in love with—of all things—her mind. True chemistry results. <br><br>But like science, life is unpredictable. Which is why a few years later Elizabeth Zott finds herself not only a single mother, but the reluctant star of America’s most beloved cooking show <i>Supper at Six</i>. Elizabeth’s unusual approach to cooking (“combine one tablespoon acetic acid with a pinch of sodium chloride”) proves revolutionary. But as her following grows, not everyone is happy. Because as it turns out, Elizabeth Zott isn’t just teaching women to cook. She’s daring them to change the status quo. <br><br>Laugh-out-loud funny, shrewdly observant, and studded with a dazzling cast of supporting characters, <i>Lessons in Chemistry</i> is as original and vibrant as its protagonist.		https://www.walmart.com/ip/Lessons-in-Chemistry-Hardcover-9780385547345/989542800
9	MEET ME AT THE LAKE	0593438558	9780593438558	<b><b>THE INSTANT #1 <i>NEW YORK TIMES</i> BESTSELLER!<br><br>A Most Anticipated Book by <i>Today </i>∙ Oprah Daily ∙ <b>Katie Couric Media ∙ </b>BuzzFeed ∙ SheReads ∙ Zibby Mag ∙ <b>PopSugar ∙ <b>BookRiot ∙ <b>Culturess ∙ </b></b></b>Her Campus ∙ The Everygirl ∙ and more!</b><br><br>A random connection sends two strangers on a daylong adventure where they make a promise one keeps and the other breaks, with life-changing effects, in this breathtaking new novel from the <i>New York Times</i> bestselling author of <i>Every Summer After.<br></i></b><br>Fern Brookbanks has wasted far too much of her adult life thinking about Will Baxter. She spent just twenty-four hours in her early twenties with the aggravatingly attractive, idealistic artist, a chance encounter that spiraled into a daylong adventure in the city. The timing was wrong, but their connection was undeniable: they shared every secret, every dream, and made a pact to meet one year later. Fern showed up. Will didn’t.<br><br>At thirty-two, Fern’s life doesn’t look at all how she once imagined it would. Instead of living in the city, Fern’s back home, running her mother’s lakeside resort—something she vowed never to do. The place is in disarray, her ex-boyfriend’s the manager, and Fern doesn’t know where to begin.<br><br>She needs a plan—a lifeline. To her surprise, it comes in the form of Will, who arrives nine years too late, with a suitcase in tow and an offer to help on his lips. Will may be the only person who understands what Fern’s going through. But how could she possibly trust this expensive-suit wearing mirage who seems nothing like the young man she met all those years ago. Will is hiding something, and Fern’s not sure she wants to know what it is. <br><br>But ten years ago, Will Baxter rescued Fern. Can she do the same for him?		https://www.walmart.com/ip/Meet-Me-at-the-Lake-Paperback-9780593438558/1674652123
10	DEMON COPPERHEAD	0063251922	9780063251922	<p>WINNER OF THE 2023 PULITZER PRIZE FOR FICTION</p><p>A New York Times "Ten Best Books of 2022 - An Oprah's Book Club Selection - An Instant New York Times Bestseller - An Instant Wall Street Journal Bestseller - A #1 Washington Post Bestseller </p><p>"Demon is a voice for the ages--akin to Huck Finn or Holden Caulfield--only even more resilient." --Beth Macy, author of Dopesick</p><p>"May be the best novel of 2022. . . . Equal parts hilarious and heartbreaking, this is the story of an irrepressible boy nobody wants, but readers will love." (Ron Charles, Washington Post)</p><p>From the acclaimed author of The Poisonwood Bible and The Bean Trees, a brilliant novel that enthralls, compels, and captures the heart as it evokes a young hero's unforgettable journey to maturity</p><p>Set in the mountains of southern Appalachia, Demon Copperhead is the story of a boy born to a teenaged single mother in a single-wide trailer, with no assets beyond his dead father's good looks and copper-colored hair, a caustic wit, and a fierce talent for survival. Relayed in his own unsparing voice, Demon braves the modern perils of foster care, child labor, derelict schools, athletic success, addiction, disastrous loves, and crushing losses. Through all of it, he reckons with his own invisibility in a popular culture where even the superheroes have abandoned rural people in favor of cities.</p><p>Many generations ago, Charles Dickens wrote David Copperfield from his experience as a survivor of institutional poverty and its damages to children in his society. Those problems have yet to be solved in ours. Dickens is not a prerequisite for readers of this novel, but he provided its inspiration. In transposing a Victorian epic novel to the contemporary American South, Barbara Kingsolver enlists Dickens' anger and compassion, and above all, his faith in the transformative powers of a good story. Demon Copperhead speaks for a new generation of lost boys, and all those born into beautiful, cursed places they can't imagine leaving behind.</p>		https://www.walmart.com/ip/Demon-Copperhead-A-Pulitzer-Prize-Winner-Hardcover-9780063251922/907140374
11	VERITY	1538724731	9781538724736	<b>#1 <i>New York Times</i></b><b> Bestseller</b><br> <br> <b><i>USA Today</i> Bestseller<br> <br> <i>The Globe and Mail</i> Bestseller<br> <br> <i>Publishers Weekly</i> Bestseller<br> <br> <br> <br> <i>Whose truth is the lie? </i>Stay up all night reading the sensational psychological thriller that has readers obsessed, from the #1 <i>New York Times</i> bestselling author of <i>It Ends With Us</i>.</b><br> <br> <br> <br> Lowen Ashleigh is a struggling writer on the brink of financial ruin when she accepts the job offer of a lifetime. Jeremy Crawford, husband of bestselling author Verity Crawford, has hired Lowen to complete the remaining books in a successful series his injured wife is unable to finish.<br> <br> <br> <br> Lowen arrives at the Crawford home, ready to sort through years of Verity's notes and outlines, hoping to find enough material to get her started. What Lowen doesn't expect to uncover in the chaotic office is an unfinished autobiography Verity never intended for anyone to read. Page after page of bone-chilling admissions, including Verity's recollection of the night her family was forever altered.<br> <br> <br> <br> Lowen decides to keep the manuscript hidden from Jeremy, knowing its contents could devastate the already grieving father. But as Lowen's feelings for Jeremy begin to intensify, she recognizes all the ways she could benefit if he were to read his wife's words. After all, no matter how devoted Jeremy is to his injured wife, a truth this horrifying would make it impossible for him to continue loving her.		https://www.walmart.com/ip/Verity-Paperback-9781538724736/209173710
12	THE SEVEN HUSBANDS OF EVELYN HUGO	1501161938	9781501161933	<b><i>NEW YORK TIMES</i></b><b> BESTSELLER</b><br> <br><b>“If you</b>’<b>re looking for a book to take on holiday this summer, <i>The Seven Husbands of Evelyn Hugo</i> has got all the glitz and glamour to make it a perfect beach read.” —<i>Bustle</i></b><br> <br><b>From the <i>New York Times</i> bestselling author of <i>Daisy Jones & the Six</i>—an entrancing and “wildly addictive journey of a reclusive Hollywood starlet” (<i>PopSugar</i>) as she reflects on her relentless rise to the top and the risks she took, the loves she lost, and the long-held secrets the public could never imagine.</b><br><br>Aging and reclusive Hollywood movie icon Evelyn Hugo is finally ready to tell the truth about her glamorous and scandalous life. But when she chooses unknown magazine reporter Monique Grant for the job, no one is more astounded than Monique herself. Why her? Why now?<br> <br>Monique is not exactly on top of the world. Her husband has left her, and her professional life is going nowhere. Regardless of why Evelyn has selected her to write her biography, Monique is determined to use this opportunity to jumpstart her career.<br> <br>Summoned to Evelyn’s luxurious apartment, Monique listens in fascination as the actress tells her story. From making her way to Los Angeles in the 1950s to her decision to leave show business in the ‘80s, and, of course, the seven husbands along the way, Evelyn unspools a tale of ruthless ambition, unexpected friendship, and a great forbidden love. Monique begins to feel a very real connection to the legendary star, but as Evelyn’s story near its conclusion, it becomes clear that her life intersects with Monique’s own in tragic and irreversible ways.<br> <br>“Heartbreaking, yet beautiful” (Jamie Blynn, <i>Us Weekly</i>), <i>The Seven Husbands of Evelyn Hugo </i>is “Tinseltown drama at its finest” (<i>Redbook</i>): a mesmerizing journey through the splendor of old Hollywood into the harsh realities of the present day as two women struggle with what it means—and what it costs—to face the truth.		https://www.walmart.com/ip/The-Seven-Husbands-of-Evelyn-Hugo-Paperback-9781501161933/56174413
13	THE LAST THING HE TOLD ME	1501171356	9781501171352	<b>Perfect summer reading! Don’t miss the #1 <i>New York Times</i> bestselling blockbuster and Reese Witherspoon Book Club Pick that’s sold over 2 million copies–now an Apple TV+ Limited series starring Jennifer Garner!</b><br> <br><b>The “page-turning, exhilarating” (<i>PopSugar</i>) and “heartfelt thriller” (<i>Real Simple</i>) about a woman who thinks she’s found the love of her life—until he disappears.</b><br><br>Before Owen Michaels disappears, he smuggles a note to his beloved wife of one year: <i>Protect her</i>. Despite her confusion and fear, Hannah Hall knows exactly to whom the note refers—Owen’s sixteen-year-old daughter, Bailey. Bailey, who lost her mother tragically as a child. Bailey, who wants absolutely nothing to do with her new stepmother.<br> <br>As Hannah’s increasingly desperate calls to Owen go unanswered, as the FBI arrests Owen’s boss, as a US marshal and federal agents arrive at her Sausalito home unannounced, Hannah quickly realizes her husband isn’t who he said he was. And that Bailey just may hold the key to figuring out Owen’s true identity—and why he really disappeared.<br> <br>Hannah and Bailey set out to discover the truth. But as they start putting together the pieces of Owen’s past, they soon realize they’re also building a new future—one neither of them could have anticipated.<br> <br>With its breakneck pacing, dizzying plot twists, and evocative family drama, <i>The Last Thing He Told Me</i> is a “page-turning, exhilarating, and unforgettable” (<i>PopSugar</i>) suspense novel.		https://www.walmart.com/ip/The-Last-Thing-He-Told-Me-Paperback-9781501171352/1261819081
14	THE HOUSEMAID	1538742578	9781538742570	<b>Don't miss the <i>New York Times</i> and <i>USA Today</i> bestseller and addictive psychological thriller with a jaw-dropping twist that's burning up Instagram and TikTok--Freida McFadden's <i>The Housemaid</i> is perfect for fans of Ruth Ware, Lisa Jewell, and</b> <i><b>Verity.</b></i><br> <br> <br> <br> <b>"Welcome to the family," Nina Winchester says as I shake her elegant, manicured hand. I smile politely, gazing around the marble hallway. Working here is my last chance to start fresh. I can pretend to be whoever I like. But I'll soon learn that the Winchesters' secrets are far more dangerous than my own...</b><br> <br> <br> <br> Every day I clean the Winchesters' beautiful house top to bottom. I collect their daughter from school. And I cook a delicious meal for the whole family before heading up to eat alone in my tiny room on the top floor.<br> <br> <br> <br> I try to ignore how Nina makes a mess just to watch me clean it up. How she tells strange lies about her own daughter. And how her husband Andrew seems more broken every day. But as I look into Andrew's handsome brown eyes, so full of pain, it's hard not to imagine what it would be like to live Nina's life. The walk-in closet, the fancy car, the perfect husband.<br> <br> <br> <br> I only try on one of Nina's pristine white dresses once. Just to see what it's like. But she soon finds out... and by the time I realize my attic bedroom door only locks from the outside, it's far too late.<br> <br> <br> <br> But I reassure myself: the Winchesters don't know who I really am.<br> <br> <br> <br> They don't know what I'm capable of...		https://www.walmart.com/ip/The-Housemaid-Paperback-9781538742570/1738959383
15	ICEBREAKER	1668026031	9781668026038	<b><i>NEW YORK TIMES </i>BESTSELLER</b><br> <br><b>A TikTok sensation! Sparks fly when a competitive figure skater and hockey team captain are forced to share a rink.</b><b> </b><br><br>Anastasia Allen has worked her entire life for a shot at Team USA. It looks like everything is going according to plan when she gets a full scholarship to the University of California, Maple Hills and lands a place on their competitive figure skating team.<br> <br>Nothing will stand in her way, not even the captain of the hockey team, Nate Hawkins.<br> <br>Nate’s focus as team captain is on keeping his team on the ice. Which is tricky when a facilities mishap means they are forced to share a rink with the figure skating team—including Anastasia, who clearly can’t stand him. <br> <br>But when Anastasia’s skating partner faces an uncertain future, she may have to look to Nate to take her shot. <br> <br>Sparks fly, but Anastasia isn’t worried…because she could never like a hockey player, right?		https://www.walmart.com/ip/The-Maple-Hills-Icebreaker-Series-1-Paperback-9781668026038/2153291790
16	KILLERS OF THE FLOWER MOON	0307742482	9780307742483	<b><b>#1 <i>NEW YORK TIMES</i> BESTSELLER • A twisting, haunting true-life murder mystery about one of the most monstrous crimes in American history, from the author of <i>The Wager</i> and <i>The Lost City of Z, </i>“one of the preeminent adventure and true-crime writers working today."—<i>New York Magazine • </i>NATIONAL BOOK AWARD FINALIST <i>• </i>SOON TO BE A MAJOR MOTION PICTURE<br><br> “A shocking whodunit…What more could fans of true-crime thrillers ask?”—<i>USA Today</i></b><br><br>“A masterful work of literary journalism crafted with the urgency of a mystery.” —<i>The Boston Globe</i></b><br><br>In the 1920s, the richest people per capita in the world were members of the Osage Nation in Oklahoma. After oil was discovered beneath their land, the Osage rode in chauffeured automobiles, built mansions, and sent their children to study in Europe.<br><br>Then, one by one, the Osage began to be killed off. The family of an Osage woman, Mollie Burkhart, became a prime target. One of her relatives was shot. Another was poisoned. And it was just the beginning, as more and more Osage were dying under mysterious circumstances, and many of those who dared to investigate the killings were themselves murdered. <br><br>As the death toll rose, the newly created FBI took up the case, and the young director, J. Edgar Hoover, turned to a former Texas Ranger named Tom White to try to unravel the mystery. White put together an undercover team, including a Native American agent who infiltrated the region, and together with the Osage began to expose one of the most chilling conspiracies in American history.<br><br><b>Look for David Grann’s latest <b>#1 <i>New York Times</i> bestselling </b>book, <i>The Wager</i>!</b>		https://www.walmart.com/ip/Killers-of-the-Flower-Moon-The-Osage-Murders-and-the-Birth-of-the-FBI-Paperback-9780307742483/269040787
17	THE WAGER	0385534264	9780385534260	<b>From the #1 <i>New York Times</i> bestselling author of <i>Killers of the Flower Moon</i>, a page-turning story of shipwreck, survival, and savagery, culminating in a court martial that reveals a shocking truth. With the twists and turns of a thriller Grann unearths the deeper meaning of the events on the <i>Wager</i>, showing that it was not only the captain and crew who ended up on trial, but the very idea of empire.</b><br><br>On January 28, 1742, a ramshackle vessel of patched-together wood and cloth washed up on the coast of Brazil. Inside were thirty emaciated men, barely alive, and they had an extraordinary tale to tell. They were survivors of His Majesty’s Ship the Wager, a British vessel that had left England in 1740 on a secret mission during an imperial war with Spain. While the Wager had been chasing a Spanish treasure-filled galleon known as “the prize of all the oceans,” it had wrecked on a desolate island off the coast of Patagonia. The men, after being marooned for months and facing starvation, built the flimsy craft and sailed for more than a hundred days, traversing 2500 miles of storm-wracked seas. They were greeted as heroes.<br><br>But then ... six months later, another, even more decrepit craft landed on the coast of Chile. This boat contained just three castaways, and they told a very different story. The thirty sailors who landed in Brazil were not heroes – they were mutineers. The first group responded with countercharges of their own, of a tyrannical and murderous senior officer and his henchmen. It became clear that while stranded on the island the crew had fallen into anarchy, with warring factions fighting for dominion over the barren wilderness. As accusations of treachery and murder flew, the Admiralty convened a court martial to determine who was telling the truth. The stakes were life-and-death—for whomever the court found guilty could hang.<br><br><i>The Wager</i> is a grand tale of human behavior at the extremes told by one of our greatest nonfiction writers. Grann’s recreation of the hidden world on a British warship rivals the work of Patrick O’Brian, his portrayal of the castaways’ desperate straits stands up to the classics of survival writing such as <i>The Endurance</i>, and his account of the court martial has the savvy of a Scott Turow thriller. As always with Grann’s work, the incredible twists of the narrative hold the reader spellbound.		https://www.walmart.com/ip/The-Wager-A-Tale-of-Shipwreck-Mutiny-and-Murder-Hardcover-9780385534260/1279060948
18	OUTLIVE	0593236599	9780593236598	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • A groundbreaking manifesto on living better and longer that challenges the conventional medical thinking on aging and reveals a new approach to preventing chronic disease and extending long-term health, from a visionary physician and leading longevity expert</b><br> <br><b>“One of the most important books you’ll ever read.”—Steven D. Levitt, <i>New York Times </i>bestselling author of <i>Freakonomics</i></b><br> <br>Wouldn’t you like to live longer? And better? In this operating manual for longevity, Dr. Peter Attia draws on the latest science to deliver innovative nutritional interventions, techniques for optimizing exercise and sleep, and tools for addressing emotional and mental health.<br> <br>For all its successes, mainstream medicine has failed to make much progress against the diseases of aging that kill most people: heart disease, cancer, Alzheimer’s disease, and type 2 diabetes. Too often, it intervenes with treatments too late to help, prolonging lifespan at the expense of healthspan, or quality of life. Dr. Attia believes we must replace this outdated framework with a personalized, proactive strategy for longevity, one where we take action now, rather than waiting.<br> <br>This is not “biohacking,” it’s science: a well-founded strategic and tactical approach to extending lifespan while also improving our physical, cognitive, and emotional health. Dr. Attia’s aim is less to tell you <i>what to do</i> and more to help you learn <i>how to think</i> about long-term health, in order to create the best plan for you as an individual. In <i>Outlive</i>, readers will discover:<br> <br>• Why the cholesterol test at your annual physical doesn’t tell you enough about your actual risk of dying from a heart attack.<br>• That you may already suffer from an extremely common yet underdiagnosed liver condition that could be a precursor to the chronic diseases of aging.<br>• Why exercise is the most potent pro-longevity “drug”—and how to begin training for the “Centenarian Decathlon.”<br>• Why you should forget about diets, and focus instead on <i>nutritional biochemistry, </i>using technology and data to personalize your eating pattern.<br>• Why striving for physical health and longevity, but ignoring emotional health, could be the ultimate curse of all.<br> <br>Aging and longevity are far more malleable than we think; our fate is not set in stone. With the right roadmap, you can plot a different path for your life, one that lets you outlive your genes to make each decade better than the one before.		https://www.walmart.com/ip/Outlive-The-Science-and-Art-of-Longevity-Hardcover-9780593236598/944282792
19	THE BODY KEEPS THE SCORE	0143127748	9780143127741	<b>#1 <i>New York Times </i>bestseller<br><br>“Essential reading for anyone interested in understanding and treating traumatic stress and the scope of its impact on society.” —Alexander McFarlane, Director of the Centre for Traumatic Stress Studies<br><br>A pioneering researcher transforms our understanding of trauma and offers a bold new paradigm for healing in this <b><b><b><i>New York Times</i> bestseller</b></b></b></b><br> <br>Trauma is a fact of life. Veterans and their families deal with the painful aftermath of combat; one in five Americans has been molested; one in four grew up with alcoholics; one in three couples have engaged in physical violence. Dr. Bessel van der Kolk, one of the world’s foremost experts on trauma, has spent over three decades working with survivors. In <i>The Body Keeps the Score</i>, he uses recent scientific advances to show how trauma literally reshapes both body and brain, compromising sufferers’ capacities for pleasure, engagement, self-control, and trust. He explores innovative treatments—from neurofeedback and meditation to sports, drama, and yoga—that offer new paths to recovery by activating the brain’s natural neuroplasticity. Based on Dr. van der Kolk’s own research and that of other leading specialists, <i>The Body Keeps the Score </i>exposes the tremendous power of our relationships both to hurt and to heal—and offers new hope for reclaiming lives.		https://www.walmart.com/ip/The-Body-Keeps-the-Score-Brain-Mind-and-Body-in-the-Healing-of-Trauma-Paperback-9780143127741/44721590
20	THE BOOK OF CHARLIE	1476773920	9781476773926	<b>One of our nation’s most prominent writers finds the truth about how to live a long and happy life in the centenarian next door.</b><br><br>When a veteran Washington journalist moved to Kansas, he met a new neighbor who was more than a century old. Little did he know that he was beginning a long friendship—and a profound lesson in the meaning of life. Charlie White was no ordinary neighbor. Born before radio, Charlie lived long enough to use a smartphone. When a shocking tragedy interrupted his idyllic boyhood, Charlie mastered survival strategies that reflect thousands of years of human wisdom. Thus armored, Charlie’s sense of adventure carried him on an epic journey across the continent, and later found him swinging across bandstands of the Jazz Age, racing aboard ambulances through Depression-era gangster wars, improvising techniques for early open-heart surgery, and cruising the Amazon as a guest of Peru’s president.<br> <br>David Von Drehle came to understand that Charlie’s resilience and willingness to grow made this remarkable neighbor a master in the art of thriving through times of dramatic change. As a gift to his children, he set out to tell Charlie’s secrets. <i>The Book of Charlie</i> is a gospel of grit—the inspiring story of one man’s journey through a century of upheaval. The history that unfolds through Charlie’s story reminds you that the United States has always been a divided nation, a questing nation, an inventive nation—a nation of Charlies in the rollercoaster pursuit of a good and meaningful life.		\N
21	I'M GLAD MY MOM DIED	1982185821	9781982185824	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER</b><br> <b>#1 INTERNATIONAL BESTSELLER</b><br> <br><b>A heartbreaking and hilarious memoir by <i>iCarly </i>and <i>Sam & Cat </i>star Jennette McCurdy about her struggles as a former child actor—including eating disorders, addiction, and a complicated relationship with her overbearing mother—and how she retook control of her life. </b><br><br>Jennette McCurdy was six years old when she had her first acting audition. Her mother’s dream was for her only daughter to become a star, and Jennette would do anything to make her mother happy. So she went along with what Mom called “calorie restriction,” eating little and weighing herself five times a day. She endured extensive at-home makeovers while Mom chided, “Your eyelashes are invisible, okay? You think Dakota Fanning doesn’t tint hers?” She was even showered by Mom until age sixteen while sharing her diaries, email, and all her income.<br> <br>In <i>I’m Glad My Mom Died</i>, Jennette recounts all this in unflinching detail—just as she chronicles what happens when the dream finally comes true. Cast in a new Nickelodeon series called <i>iCarly</i>, she is thrust into fame. Though Mom is ecstatic, emailing fan club moderators and getting on a first-name basis with the paparazzi (“Hi Gale!”), Jennette is riddled with anxiety, shame, and self-loathing, which manifest into eating disorders, addiction, and a series of unhealthy relationships. These issues only get worse when, soon after taking the lead in the <i>iCarly</i> spinoff <i>Sam & Cat</i> alongside Ariana Grande, her mother dies of cancer. Finally, after discovering therapy and quitting acting, Jennette embarks on recovery and decides for the first time in her life what she really wants.<br> <br>Told with refreshing candor and dark humor, <i>I’m Glad My Mom Died</i> is an inspiring story of resilience, independence, and the joy of shampooing your own hair.		https://www.walmart.com/ip/I-m-Glad-My-Mom-Died-Hardcover-9781982185824/586530707
22	SPARE	0593593804	9780593593806	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • Discover the global phenomenon that tells an unforgettable story of love, loss, and healing.<br><br>“Compellingly artful . . . [a] blockbuster memoir.”—<i>The New Yorker</i><br><br></b>It was one of the most searing images of the twentieth century: two young boys, two princes, walking behind their mother’s coffin as the world watched in sorrow—and horror. As Princess Diana was laid to rest, billions wondered what Prince William and Prince Harry must be thinking and feeling—and how their lives would play out from that point on.<br><br>For Harry, this is that story at last.<br><br>Before losing his mother, twelve-year-old Prince Harry was known as the carefree one, the happy-go-lucky Spare to the more serious Heir. Grief changed everything. He struggled at school, struggled with anger, with loneliness—and, because he blamed the press for his mother’s death, he struggled to accept life in the spotlight.<br><br>At twenty-one, he joined the British Army. The discipline gave him structure, and two combat tours made him a hero at home. But he soon felt more lost than ever, suffering from post-traumatic stress and prone to crippling panic attacks. Above all, he couldn’t find true love. <br><br>Then he met Meghan. The world was swept away by the couple’s cinematic romance and rejoiced in their fairy-tale wedding. But from the beginning, Harry and Meghan were preyed upon by the press, subjected to waves of abuse, racism, and lies. Watching his wife suffer, their safety and mental health at risk, Harry saw no other way to prevent the tragedy of history repeating itself but to flee his mother country. Over the centuries, leaving the Royal Family was an act few had dared. The last to try, in fact, had been his mother. . . .<br><br>For the first time, Prince Harry tells his own story, chronicling his journey with raw, unflinching honesty. A landmark publication, <i>Spare</i> is full of insight, revelation, self-examination, and hard-won wisdom about the eternal power of love over grief.		https://www.walmart.com/ip/Spare-by-Prince-Harry-Hardcover-9780593593806/1223312476
23	CRYING IN H MART	1984898957	9781984898951	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • From the indie rock sensation known as Japanese Breakfast, an unforgettable memoir about family, food, grief, love, and growing up Korean American—“in losing her mother and cooking to bring her back to life, Zauner became herself” (NPR). • CELEBRATING OVER ONE YEAR ON THE <i>NEW YORK TIMES</i> BESTSELLER LIST</b><br><br>In this exquisite story of family, food, grief, and endurance, Michelle Zauner proves herself far more than a dazzling singer, songwriter, and guitarist. With humor and heart, she tells of growing up one of the few Asian American kids at her school in Eugene, Oregon; of struggling with her mother's particular, high expectations of her; of a painful adolescence; of treasured months spent in her grandmother's tiny apartment in Seoul, where she and her mother would bond, late at night, over heaping plates of food. <br><br>As she grew up, moving to the East Coast for college, finding work in the restaurant industry, and performing gigs with her fledgling band--and meeting the man who would become her husband--her Koreanness began to feel ever more distant, even as she found the life she wanted to live. It was her mother's diagnosis of terminal cancer, when Michelle was twenty-five, that forced a reckoning with her identity and brought her to reclaim the gifts of taste, language, and history her mother had given her.<br><br>Vivacious and plainspoken, lyrical and honest, Zauner's voice is as radiantly alive on the page as it is onstage. Rich with intimate anecdotes that will resonate widely, and complete with family photos, <i>Crying in H Mart</i> is a book to cherish, share, and reread.		https://www.walmart.com/ip/Crying-in-H-Mart-A-Memoir-Paperback-9781984898951/1428578876
133	THE RUSSIAN	1538703580	9781538703588	<b>When a serial killer crashes Detective Michael Bennett's wedding, he and his new partner uncover a gruesome string of cold-case homicides across the country.<br> <br> ​</b><br> <br> Weeks before NYPD Detective Michael Bennett is to marry his longtime love, Mary Catherine, an assassin announces his presence in the city with a string of grisly murders. Each victim is a young woman. And each has been killed in a manner as precise as it was gruesome.<br> <br> <br> <br> Tasked with working alongside the FBI, Bennett and his gung-ho new partner uncover multiple cold-case homicides across the country that fit the same distinctive pattern--proving the perpetrator they seek is as experienced at ending lives as he is at evading detection.<br> <br> <br> <br> Bennett promises Mary Catherine that the case won't affect their upcoming wedding. But as Bennett prepares to make a lifetime commitment, the killer has a lethal vow of his own to fulfill.		https://www.walmart.com/ip/A-Michael-Bennett-Thriller-The-Russian-Series-13-Paperback-9781538703588/1547263200
152	RESTART	1338053809	9781338053807	<b>#1 <i>New York Times</i> bestselling author Gordon Korman harkens back to his <i>No More Dead Dogs</i> days in this new stand-alone that takes a more serious tone than ever before.</b><br></br>Chase's memory just went out the window. <p>Chase doesn't remember falling off the roof. He doesn't remember hitting his head. He doesn't, in fact, remember <i>anything</i>. He wakes up in a hospital room and suddenly has to learn his whole life all over again . . . starting with his own name. <p>He knows he's Chase. But who <i>is</i> Chase? When he gets back to school, he sees that different kids have very different reactions to his return. <p>Some kids treat him like a hero. Some kids are clearly afraid of him. <p>One girl in particular is so angry with him that she pours her frozen yogurt on his head the first chance she gets. <p>Pretty soon, it's not only a question of who Chase is--it's a question of who he <i>was</i> . . . and who he's going to be. <p>From the #1 bestselling author of <i>Swindle</i> and <i>Slacker</i>, <i>Restart</i> is the spectacular story of a kid with a messy past who has to figure out what it means to get a clean start.		https://www.walmart.com/ip/Restart-Paperback-9781338053807/990538438
24	THE DADDY DIARIES	1250890926	9781250890924	<p><b>The Instant <i>New York Times</i> Bestseller!</b><br><b><i><br>New York Times </i>bestselling author Andy Cohen goes from bottle service to baby bottles in </b><b>a hilarious, heartwarming, and name-dropping account of the most important year of his life.</b><br><br>Andy Cohen has taken on the most important job of his life—father— and boy (and girl!) does he have a lot to say about it!<br><br>One of Andy Cohen’s most momentous years starts off with a hangover the morning after an<i> epic</i> New Year’s Eve broadcast. But Andy doesn’t have time to dwell on the drama, as his role as media mogul is now matched with the responsibilities, joys, and growing pains of parenthood.<br><br>This fast-paced, mile-a-minute look behind the scenes of living the so-called glamorous life in Manhattan now takes firm aim at life at home. With a three-year-old son, Ben, and a daughter, Lucy, born in May, stories of late-night parties are replaced by early mornings with Ben, drama at the play-ground, and the musings of a single dad trying to navigate having it all. All this is set against the backdrop of constant Housewives drama, hijinks behind the scenes at <i>Watch What Happens Live,</i> a revolving door of famous faces, and a worried mother (and newly minted grandmother) in St. Louis.<br><br>Buckle up, bottle up, and get ready for a laugh-out-loud and surprisingly poignant look at the ways in which family changes everything and the superficial gets very real. Watch what happens!</p>		https://www.walmart.com/ip/The-Daddy-Diaries-The-Year-I-Grew-Up-Hardcover-9781250890924/2991559426
25	ON OUR BEST BEHAVIOR	059324303X	9780593243039	<b><i>NEW YORK TIMES </i>BESTSELLER • A groundbreaking exploration of the ancient rules women unwittingly follow in order to be considered “good,” revealing how the Seven Deadly Sins still control and distort our lives and illuminating a path toward a more balanced, spiritually complete way to live</b><br><br><i>Why do women equate self-denial with being good? </i><br><br>We congratulate ourselves when we resist the donut in the office breakroom. We celebrate our restraint when we hold back from sending an email in anger. We feel virtuous when we wake up at dawn to get a jump on the day. We put others’ needs ahead of our own and believe this makes us exemplary. In <i>On Our Best Behavior</i>, journalist Elise Loehnen explains that these impulses—often lauded as unselfish, distinctly feminine instincts—are actually ingrained in us by a culture that reaps the benefits, via an extraordinarily effective collection of mores known as the Seven Deadly Sins.  <br><br>Since being codified by the Christian church in the fourth century, the Seven Deadly Sins—pride, greed, lust, envy, gluttony, wrath, and sloth—have exerted insidious power. Even today, in our largely secular, patriarchal society, they continue to circumscribe women’s behavior. For example, seeing sloth as sinful leads women to deny themselves rest; a fear of gluttony drives them to ignore their appetites; and an aversion to greed prevents them from negotiating for themselves and contributes to the 55 percent gender wealth gap.  <br><br>In <i>On Our Best Behavior,</i> Loehnen reveals how we’ve been programmed to obey the rules represented by these sins and how doing so qualifies us as “good.” This probing analysis of contemporary culture and thoroughly researched history explains how women have internalized the patriarchy, and how they unwittingly reinforce it. By sharing her own story and the spiritual wisdom of other traditions, Loehnen shows how we can break free and discover the integrity and wholeness we seek.		https://www.walmart.com/ip/On-Our-Best-Behavior-The-Seven-Deadly-Sins-and-the-Price-Women-Pay-to-Be-Good-Hardcover-9780593243039/2982246312
26	THE ESCAPE ARTIST	0063112361	9780063112360	<p>Winner of the National Jewish Book Award - New York Times Bestseller</p><p>"A brilliant and heart-wrenching book, with universal and timely lessons about the power of information--and misinformation. Is it possible to stop mass murder by telling the truth?" -- Yuval Noah Harari, bestselling author of Sapiens: A Brief History of Humankind and Homo Deus: A Brief History of Tomorrow</p><p>A complex hero. A forgotten story. The first witness to reveal the full truth of the Holocaust . . .</p><p>Award-winning journalist and bestselling novelist Jonathan Freedland tells the astonishing true story of Rudolf Vrba, the man who broke out of Auschwitz to warn the world of a truth too few were willing to hear.</p><p>In April 1944, Rudolf Vrba became one of the very first Jews to escape from Auschwitz and make his way to freedom--among only a tiny handful who ever pulled off that near-impossible feat. He did it to reveal the truth of the death camp to the world--and to warn the last Jews of Europe what fate awaited them. Against all odds, Vrba and his fellow escapee, Fred Wetzler, climbed mountains, crossed rivers, and narrowly missed German bullets until they had smuggled out the first full account of Auschwitz the world had ever seen--a forensically detailed report that eventually reached Franklin Roosevelt, Winston Churchill, and the Pope.</p><p>And yet too few heeded the warning that Vrba had risked everything to deliver. Though Vrba helped save two hundred thousand Jewish lives, he never stopped believing it could have been so many more.</p><p>This is the story of a brilliant yet troubled man--a gifted "escape artist" who, even as a teenager, understood that the difference between truth and lies can be the difference between life and death. Rudolf Vrba deserves to take his place alongside Anne Frank, Oskar Schindler, and Primo Levi as one of the handful of individuals whose stories define our understanding of the Holocaust.</p>		https://www.walmart.com/ip/The-Escape-Artist-The-Man-Who-Broke-Out-of-Auschwitz-to-Warn-the-World-Paperback-9780063112360/1129839737
27	THE LIGHT WE CARRY	0593237463	9780593237465	<b><b>#1 <i>NEW YORK TIMES </i>AND <i>USA TODAY</i> BESTSELLER • ONE OF <i>TIME</i>’S 100 MUST-READ BOOKS OF 2022 • </b>In an inspiring follow-up to her critically acclaimed, #1 bestselling memoir <i>Becoming, </i>former First Lady Michelle Obama shares practical wisdom and powerful strategies for staying hopeful and balanced in today’s highly uncertain world. </b><br>  <br>There may be no tidy solutions or pithy answers to life’s big challenges, but Michelle Obama believes that we can all locate and lean on a set of tools to help us better navigate change and remain steady within flux. In<i> The Light We Carry,</i> she opens a frank and honest dialogue with readers, considering the questions many of us wrestle with: How do we build enduring and honest relationships? How can we discover strength and community inside our differences? What tools do we use to address feelings of self-doubt or helplessness? What do we do when it all starts to feel like too much?<br> <br>Michelle Obama offers readers a series of fresh stories and insightful reflections on change, challenge, and power, including her belief that when we light up for others, we can illuminate the richness and potential of the world around us, discovering deeper truths and new pathways for progress. Drawing from her experiences as a mother, daughter, spouse, friend, and First Lady, she shares the habits and principles she has developed to successfully adapt to change and overcome various obstacles—the earned wisdom that helps her continue to “become.” She details her most valuable practices, like “starting kind,” “going high,” and assembling a “kitchen table” of trusted friends and mentors. With trademark humor, candor, and compassion, she also explores issues connected to race, gender, and visibility, encouraging readers to work through fear, find strength in community, and live with boldness.<br> <br>“When we are able to recognize our own light, we become empowered to use it,” writes Michelle Obama. A rewarding blend of powerful stories and profound advice that will ignite conversation, <i>The Light We Carry</i> inspires readers to examine their own lives, identify their sources of gladness, and connect meaningfully in a turbulent world.		https://www.walmart.com/ip/The-Light-We-Carry-Overcoming-in-Uncertain-Times-by-Michelle-Obama-Hardcover-9780593237465/1575974215
28	RAW DOG	1250847745	9781250847744	<p><b>Part travelogue, part culinary history, all capitalist critique—comedian Jamie Loftus's debut, <i>Raw Dog</i>, will take you on a cross-country road trip in the summer of 2021, and reveal what the creation, culture, and class influence of hot dogs says about America now.<br></b><br><b>“Wise and funny”</b> —ANDY RICHTER •<b> “Gonzo yet vulnerable” </b>—GABE DUNN • <b>“Hot dog <i>Moby-Dick</i>”</b> —BRANSON REESE • <b>“Revealing, funny, sad, horny, and insatiably curious” </b>—SARAH MARSHALL •<b> “A wild ride”</b> —ROBERT EVANS •<b> “Deeply incisive and hilariously honest” </b>—JACK O’BRIEN •<b> “One of the freshest and most insightful new comedic voices of this decade.” </b>—LINDSAY ELLIS <br><br>Hot dogs. Poor people created them. Rich people found a way to charge fifteen dollars for them. They’re high culture, they’re low culture, they’re sports food, they’re kids' food, they’re hangover food, and they’re deeply American, despite having no basis whatsoever in America's Indigenous traditions. You can love them, you can hate them, but you can’t avoid the great American hot dog.<br><br><i>Raw Dog: The Naked Truth About Hot Dogs</i> is part investigation into the cultural and culinary significance of hot dogs and part travelog documenting a cross-country road trip researching them as they’re served today. From avocado and spice in the West to ass-shattering chili in the East to an entire salad on a slice of meat in Chicago, Loftus, her pets, and her ex eat their way across the country during the strange summer of 2021. It’s a brief window into the year between waves of a plague that the American government has the resources to temper, but not the interest.<br><br>So grab a dog, lay out your picnic blanket, and dig into the delicious and inevitable product of centuries of violence, poverty, and ambition, now rolling around at your local 7-Eleven.<br><br><b>The hardcover edition of <i>Raw Dog: The Naked Truth About Hot Dogs</i> includes gorgeous endpapers, an illustrated case, as well as illustrations by the author throughout.</b><br><br>"<i>Raw Dog</i> will leave you nourished." —<i>BuzzFeed<br><br></i>"You will certainly never read a funnier book about taking a hot dog-themed road trip across America." —<i>Glamour<br></i></p>		https://www.walmart.com/ip/Raw-Dog-The-Naked-Truth-about-Hot-Dogs-Hardcover-9781250847744/1010116140
140	TOM CLANCY: ZERO HOUR	0593422740	9780593422748	<b><b>Jack Ryan, Jr. is the one man who can prevent a second Korean War in the latest thrilling entry in the #1 <i>New York Times</i> bestselling series.</b></b><br><br>When the leader of North Korea is catastrophically injured, his incapacitation inadvertently triggers a “dead-man’s switch,” activating an army of sleeper agents in South Korea and precipitating a struggle for succession. <br> <br>Jack Ryan, Jr. is in Seoul to interview a potential addition to the Campus.  But his benign trip takes a deadly turn when a wave of violence perpetrated by North Korean operatives grips South Korea’s capital.  A mysterious voice from North Korea offers Jack a way to stop the peninsula’s rush to war, but her price may be more than he can afford to pay.		https://www.walmart.com/ip/Jack-Ryan-Jr-Novel-Tom-Clancy-Zero-Hour-Paperback-9780593422748/1351240118
29	BRAIDING SWEETGRASS	1571313567	9781571313560	"An inspired weaving of indigenous knowledge, plant science, and personal narrative from a distinguished professor of science and a Native American whose previous book, Gathering Moss, was awarded the John Burroughs Medal for outstanding nature writing. As a botanist and professor of plant ecology, Robin Wall Kimmerer has spent a career learning how to ask questions of nature using the tools of science. As a Potawatomi woman, she learned from elders, family, and history that the Potawatomi, as well as a majority of other cultures indigenous to this land, consider plants and animals to be our oldest teachers. In Braiding Sweetgrass, Kimmerer brings these two lenses of knowing together to reveal what it means to see humans as "the younger brothers of creation." As she explores these themes she circles toward a central argument: the awakening of a wider ecological consciousness requires the acknowledgement and celebration of our reciprocal relationship with the world. Once we begin to listen for the languages of other beings, we can begin to understand the innumerable life-giving gifts the world provides us and learn to offer our thanks, our care, and our own gifts in return"--		\N
30	ALL ABOUT LOVE	0060959479	9780060959470	<p>"The word "love" is most often defined as a noun, yet...we would all love to better if we used it as a verb," writes bell hooks as she comes out fighting and on fire in <i>All About Love</i>. Here, at her most provacative and intensely personel, the renowned scholar, cultural critic, and feminist skewers our view of love as romance. In its place she offers a proactive new ethic for a people and a society bereft with lovelessness.</p><p>As bell hooks uses her incisive mind and razor-sharp pen to explode th question "What is love?" her answers strike at both the mind and heart. In thirteen concise chapters, hooks examines her own search for emotional connection and society's failure to provide a model for learning to love. Razing the cultural paradigm that the ideal love is infused with sex and desire, she provides a new path to love that is sacred, redemptive, and healing for the individuals and for a nation. <i>The Utne Reader </i>declared bell hooks one of the "100 Visionaries Who Can Change Your Life." <i>All About Love</i> is a powerful affirmation of just how profoundly she can.</p>		\N
31	IDENTITY	1250284112	9781250284112	<p><b>The #1<i> New York Times</i>-bestselling author's terrifying new thriller about one man's ice-cold malice, and one woman's fight to reclaim her life.</b><br><br>Former Army brat Morgan Albright has finally planted roots in a friendly neighborhood near Baltimore. Her friend and roommate Nina helps her make the mortgage payments, as does Morgan's job as a bartender. But after she and Nina host their first dinner party—attended by Luke, the flirtatious IT guy who'd been chatting her up at the bar—her carefully built world is shattered. The back door glass is broken, cash and jewelry are missing, her car is gone, and Nina lies dead on the floor.<br><br> Soon, a horrific truth emerges: It was Morgan who let the monster in. "Luke" is actually a cold-hearted con artist named Gavin who targets a particular type of woman, steals her assets and identity, and then commits his ultimate goal: murder.<br><br> What the FBI tells Morgan is beyond chilling. Nina wasn't his type. Morgan is. Nina was simply in the wrong place at the wrong time. And Morgan's nightmare is just beginning. Soon she has no choice but to flee to her mother's home in Vermont. While she struggles to build something new, she meets another man, Miles Jameson. He isn't flashy or flirtatious, and his family business has deep roots in town. But Gavin is still out there hunting new victims, and he hasn't forgotten the one who got away.</p>		https://www.walmart.com/ip/Identity-Hardcover-9781250284112/1849710301
32	FOURTH WING	1649374046	9781649374042	<p><b>An Instant <i>New York Times</i> Bestseller<br>A Goodreads Most Anticipated Book<br></b><br><i>"Suspenseful, sexy, and with incredibly entertaining storytelling, the first in Yarros' Empyrean series will delight fans of romantic, adventure-filled fantasy."</i> —<i><b>Booklist</b></i><b>, starred review</b><br><br><i>"</i>Fourth Wing<i> will have your heart pounding from beginning to end... A fantasy like you've never read before."</i> <b>―#1 <i>New York Times</i> bestselling author Jennifer L. Armentrout</b><br><br><br><b>Enter the brutal and elite world of a war college for dragon riders from <i>New York Times</i> bestselling author Rebecca Yarros</b><br><br>Twenty-year-old Violet Sorrengail was supposed to enter the Scribe Quadrant, living a quiet life among books and history. Now, the commanding general—also known as her tough-as-talons mother—has ordered Violet to join the hundreds of candidates striving to become the elite of Navarre: <i>dragon riders</i>.<br><br>But when you’re smaller than everyone else and your body is brittle, death is only a heartbeat away...because dragons don’t bond to “fragile” humans. They incinerate them.<br><br>With fewer dragons willing to bond than cadets, most would kill Violet to better their own chances of success. The rest would kill her just for being her mother’s daughter—like Xaden Riorson, the most powerful and ruthless wingleader in the Riders Quadrant.<br><br>She’ll need every edge her wits can give her just to see the next sunrise.<br><br>Yet, with every day that passes, the war outside grows more deadly, the kingdom's protective wards are failing, and the death toll continues to rise. Even worse, Violet begins to suspect leadership is hiding a terrible secret.<br><br>Friends, enemies, lovers. Everyone at Basgiath War College has an agenda—because once you enter, there are only two ways out: <i>graduate or die</i>.<br><br>The Empyrean series is best enjoyed in order.<br>Reading Order:<br>Book #1 Fourth Wing<br>Book #2 Iron Flame</p>		https://www.walmart.com/ip/Empyrean-Fourth-Wing-Series-1-Hardcover-9781649374042/1865552154
33	THE 23RD MIDNIGHT	0316402788	9780316402781	<p><b>The latest in this "successful and suspenseful" (<i>Entertainment Weekly</i>) series: an attention-seeking copycat is recreating murders by a famous killer from the Women's Murder Club's past--with devastating new twists. </b></p> Detective Lindsay Boxer put serial killer Evan Burke in jail. <p> Reporter Cindy Thomas wrote a book that put him on the bestseller list. <p> An obsessed maniac has turned Burke's true-crime story into a playbook. And is embellishing it with gruesome touches all his own. <p> Now Lindsay's tracking an elusive suspect, and the entire Murder Club is facing destruction.		https://www.walmart.com/ip/A-Women-s-Murder-Club-Thriller-The-23rd-Midnight-If-You-Haven-t-Read-the-Women-s-Murder-Club-Start-Here-Series-23-Hardcover-9780316402781/1489950112
34	SIMPLY LIES	1538750635	9781538750636	<p><b>From the #1 <i>New York Times</i> bestselling author of <i>The 6:20 Man</i> comes a twisting new psychological thriller in which two women--one a former detective, the other a dangerous con artist--go head-to-head in an electrifying game of cat and mouse.</b><br> <br> <br> Mickey Gibson, single mother and former detective, leads a hectic life similar to that of many moms: juggling the demands of her two small children with the tasks of her job working remotely for ProEye, a global investigation company that hunts down wealthy tax and credit cheats. </p> <p>When Mickey gets a call from a colleague named Arlene Robinson, she thinks nothing of Arlene's unusual request for her to go inventory the vacant home of an arms dealer who cheated ProEye's clients and fled. That is, until she arrives at the mansion to discover a dead body in a secret room--and that nothing is as it seems. </p> <p>Not only does the arms dealer not exist but the murder victim turns out to be Harry Langhorne, a man with mob ties who used to be in Witness Protection. What's more, no one named Arlene Robinson works at ProEye. </p> <p>In the blink of an eye, Gibson has become a prime suspect in a murder investigation--and now her job is also on the line until she proves that she was set up. Before long, Gibson is locked in a battle of wits with a brilliant woman with no name, a hidden past, and unknown motives--whose end game is as mysterious as it is deadly. </p>		https://www.walmart.com/ip/Simply-Lies-A-Psychological-Thriller-Hardcover-9781538750636/1265821041
132	SPY CAMP	1534499377	9781534499379	<b>The second book in the <i>New York Times</i> bestselling Spy School series continues in graphic novel form as aspiring spy Ben Ripley must spend his summer in top-secret training—and is thrown back into danger.</b><br><br>Ben Ripley is a middle schooler whose school is not exactly average—he’s spent the last year training to be a top-level spy and dodging all sorts of associated danger. So now that summer’s finally here, Ben would like to have some fun and relax. But that’s not going to happen during required spy survival training at a rustic wilderness camp, where SPYDER, an enemy spy organization, has infiltrated the spies’ ranks. Can Ben root out the enemy before it takes him out—for good?<br> <br>Venture into the perilous wilderness with Ben in action-packed, full-color panels.	Illustrated by Anjan Sarkar	https://www.walmart.com/ip/Spy-School-Spy-Camp-the-Graphic-Novel-Paperback-9781534499379/1307589998
35	TOM CLANCY: FLASH POINT	0593422783	9780593422786	<b>If there’s one thing Jack Ryan, Jr’s father taught him, it’s that freedom isn’t free, but nothing can prepare Jack for the price he must pay in the latest electrifying entry in the #1 <i>New York Times</i> bestselling series.</b><br><br>Jack Ryan Jr. is in a world of trouble. When a benign surveillance operation takes a deadly turn, Jack finds himself locked in a struggle with an unseen enemy bent on destroying the Campus. The chase leads Jack to the South China Sea where a midair collision between aircraft from rival nations threatens to serve as a flash point for the entire region. As Jack frantically tries to put the pieces of the conspiracy together, the Campus is hit with a crippling attack. When the dust settles, Jack is one of the few operators still standing and the Campus’s de facto leader. But the fight is just beginning. <br><br>As tensions escalate, Jack’s mysterious adversary executes a brilliant campaign to paralyze the American government even as China inches closer to invading Taiwan. With the odds stacked against him and no help in sight, Jack and his shattered team must stop the world’s two remaining super powers from stumbling into war even as the noose around the Campus grows ever tighter.<br>Every operation has a cost.<br><br>This time the bill might just be too much to pay.		https://www.walmart.com/ip/Jack-Ryan-Jr-Novel-Tom-Clancy-Flash-Point-Hardcover-9780593422786/1587852436
36	YELLOWFACE	0063250837	9780063250833	<p>White lies. Dark humor. Deadly consequences... Bestselling sensation Juniper Song is not who she says she is, she didn't write the book she claims she wrote, and she is most certainly not Asian American--in this chilling and hilariously cutting novel from R.F. Kuang, the #1 New York Times bestselling author of Babel. </p> <p>Authors June Hayward and Athena Liu were supposed to be twin rising stars. But Athena's a literary darling. June Hayward is literally nobody. Who wants stories about basic white girls, June thinks.</p> <p>So when June witnesses Athena's death in a freak accident, she acts on impulse: she steals Athena's just-finished masterpiece, an experimental novel about the unsung contributions of Chinese laborers during World War I.</p> <p>So what if June edits Athena's novel and sends it to her agent as her own work? So what if she lets her new publisher rebrand her as Juniper Song--complete with an ambiguously ethnic author photo? Doesn't this piece of history deserve to be told, whoever the teller? That's what June claims, and the New York Times bestseller list seems to agree.</p> <p>But June can't get away from Athena's shadow, and emerging evidence threatens to bring June's (stolen) success down around her. As June races to protect her secret, she discovers exactly how far she will go to keep what she thinks she deserves.</p> <p>With its totally immersive first-person voice, Yellowface grapples with questions of diversity, racism, and cultural appropriation, as well as the terrifying alienation of social media. R.F. Kuang's novel is timely, razor-sharp, and eminently readable. </p>		https://www.walmart.com/ip/Yellowface-Hardcover-9780063250833/1272625767
37	HELLO BEAUTIFUL	0593243730	9780593243732	<b><b><i>NEW YORK TIMES </i>BESTSELLER • </b>OPRAH’S BOOK CLUB PICK • From the author of <i>Dear Edward</i> comes a “powerfully affecting” (<i>People</i>) family story that asks: Can love make a broken person whole?</b><br><br><b>“Another tender tearjerker . . . Napolitano chronicles life’s highs and lows with aching precision.”—<i>The Washington Post</i></b><br><br>William Waters grew up in a house silenced by tragedy, where his parents could hardly bear to look at him, much less love him—so when he meets the spirited and ambitious Julia Padavano in his freshman year of college, it’s as if the world has lit up around him. With Julia comes her family, as she and her three sisters are inseparable: Sylvie, the family’s dreamer, is happiest with her nose in a book; Cecelia is a free-spirited artist; and Emeline patiently takes care of them all. With the Padavanos, William experiences a newfound contentment; every moment in their house is filled with loving chaos.<br><br>But then darkness from William’s past surfaces, jeopardizing not only Julia’s carefully orchestrated plans for their future, but the sisters’ unshakeable devotion to one another. The result is a catastrophic family rift that changes their lives for generations. Will the loyalty that once rooted them be strong enough to draw them back together when it matters most?<br><br>An exquisite homage to Louisa May Alcott’s timeless classic, <i>Little Women</i>, <i>Hello Beautiful</i> is a profoundly moving portrait of what is possible when we choose to love someone not in spite of who they are, but because of it.		https://www.walmart.com/ip/Hello-Beautiful-Oprah-s-Book-Club-Hardcover-9780593243732/1394479276
38	TOMORROW, AND TOMORROW, AND TOMORROW	0593321200	9780593321201	<b><i>NEW YORK TIMES </i>BEST SELLER <b>• </b>In this exhilarating novel by the best-selling author of <i>The Storied Life of A. J. Fikry</i> two friends—often in love, but never lovers—come together as creative partners in the world of video game design, where success brings them fame, joy, tragedy, duplicity, and, ultimately, a kind of immortality.</b><br><br><b>"Utterly brilliant. In this sweeping, gorgeously written novel, Gabrielle Zevin charts the beauty, tenacity, and fragility of human love and creativity.... One of the best books I've ever read." —John Green</b><br>  <br> On a bitter-cold day, in the December of his junior year at Harvard, Sam Masur exits a subway car and sees, amid the hordes of people waiting on the platform, Sadie Green. He calls her name. For a moment, she pretends she hasn’t heard him, but then, she turns, and a game begins: a legendary collaboration that will launch them to stardom. These friends, intimates since childhood, borrow money, beg favors, and, before even graduating college, they have created their first blockbuster,<i> Ichigo</i>. Overnight, the world is theirs. Not even twenty-five years old, Sam and Sadie are brilliant, successful, and rich, but these qualities won’t protect them from their own creative ambitions or the betrayals of their hearts.<br>  <br> Spanning thirty years, from Cambridge, Massachusetts, to Venice Beach, California, and lands in between and far beyond, Gabrielle Zevin’s <i>Tomorrow, and Tomorrow, and Tomorrow</i> is a dazzling and intricately imagined novel that examines the multifarious nature of identity, disability, failure, the redemptive possibilities in play, and above all, our need to connect: to be loved and to love. Yes, it is a love story, but it is not one you have read before.		https://www.walmart.com/ip/Tomorrow-and-Tomorrow-and-Tomorrow-Hardcover-9780593321201/820077421
39	THE MAKING OF ANOTHER MAJOR MOTION PICTURE MASTERPIECE	052565559X	9780525655596	<b>From the Academy Award-winning actor and best-selling author: a novel about the making of a star-studded, multimillion-dollar superhero action film . . . and the humble comic books that inspired it. Funny, touching, and wonderfully thought-provoking, while also capturing the changes in America and American culture since World War II.</b><br><br>Part One of this story takes place in 1947. A troubled soldier, returning from the war, meets his talented five-year-old nephew, leaves an indelible impression, and then disappears for twenty-three years.<br><br><i>Cut to 1970: </i>The nephew, now drawing underground comic books in Oakland, California, reconnects with his uncle and, remembering the comic book he saw when he was five, draws a new version with his uncle as a World War II fighting hero. <br><br><i>Cut to the present day:</i> A commercially successful director discovers the 1970 comic book and decides to turn it into a contemporary superhero movie.<br><br><i>Cue the cast:</i> We meet the film’s extremely difficult male star, his wonderful leading lady, the eccentric writer/director, the producer, the gofer production assistant, and everyone else on both sides of the camera.<br><br><i>Bonus material:</i> Interspersed throughout are three comic books that are featured in the story—all created by Tom Hanks himself—including the comic book that becomes the official tie-in to this novel’s "major motion picture masterpiece."		https://www.walmart.com/ip/The-Making-of-Another-Major-Motion-Picture-Masterpiece-Hardcover-9780525655596/1097806244
40	ONLY THE DEAD	1982181699	9781982181697	<b>Navy SEAL James Reece faces a devastating global conspiracy in this high-adrenaline thriller that is ripped from the headlines—from the #1 <i>New York Times</i> bestselling author and “one of the top writers of political thrillers” (<i>Bookreporter</i>), Jack Carr.</b><br><br>In 1980, a freshman congressman was gunned down in Rhode Island, sending shockwaves through Washington that are still reverberating over four decades later.<br> <br>Now, with the world on the brink of war and a weakened United States facing rampant inflation, political division, and shocking assassinations, a secret cabal of global elites is ready to assume control. And with the world’s most dangerous man locked in solitary confinement, the conspirators believe the final obstacle to complete domination has been eliminated. They’re wrong.<br> <br>From the firms of Wall Street to the corridors of power in Washington, DC, and Moscow, secrets from the past have the uncanny ability to rise to the surface in the present.<br> <br>With the odds stacked against him, James Reece is on a mission generations in the making. Unfortunately for his enemies, the former SEAL is not concerned with odds. He is on the warpath. And when James Reece picks up his tomahawk and sniper rifle, no one is out of range.<br> <br>From “a master novelist” (<i>Ballistic</i> <i>Magazine</i>), “quintessential hero James Reece is exactly what’s needed in today’s chaotic political milieu” (K.J. Howe, author of <i>Skyjack</i>).		\N
41	ROGUE JUSTICE	038554832X	9780385548328	<b>The phenomenal Stacey Abrams, #1 <i>New York Times </i>bestselling author of <i>While Justice Sleeps</i>, returns with another intricately plotted, riveting suspense novel featuring Avery Keene, an ingenious Supreme Court clerk who becomes entangled in a case that has the dark underpinnings of a potential national crisis.</b><br><br>Avery Keene is back, trying to get her feet on solid ground after unraveling a conspiracy that took down the President of the United States in <i>While Justice Sleeps. </i>But as the sparks of impeachment hearings and political skirmishes swirl around her, Avery is approached at a legal conference by Preston Davies, an unassuming young man and fellow law clerk to a federal judge in Idaho. Davies believes his boss, Judge Francesca Whitner, was being blackmailed in the days before she recently took her own life, and he gives Avery a file, a burner phone, and a fearful warning that there are highly dangerous people involved. Moments later, Avery is shocked when she witnesses Davies being murdered.<br><br>After breaking the encrypted file Davies gave to her, Avery reveals a list of names—all federal judges—and, alarmingly, all judges on the FISA Court (the United States Foreign Intelligence Surveillance Court), also known as America’s "secret court." It is this body that grants permission to the government to wiretap American individuals or corporations suspected of terrorism. Avery knows Judge Whitner had been extorted, but as she investigates the names and cases associated with other judges on the list she begins to see a frightening pattern—and she worries that something far more sinister may be unfolding. Drawing from today’s headlines and weaving them together with her unique insider perspective, Stacey Abrams combines twisting plotlines, wry wit, and clever puzzles to create another immensely entertaining suspense novel.		\N
42	LOOK FOR ME THERE	0785291814	9780785291817	<p>In Look for Me There, Luke Russert traverses terrain both physical and deeply personal. On his journey to some of the world's most stunning destinations, he visits the internal places of grief, family, faith, ambition, and purpose--with intense self-reflection, honesty, and courage."--Savannah Guthrie, coanchor of Today</p><p>"Look for me there," news legend Tim Russert would tell his son, Luke, when confirming a pickup spot at an airport, sporting event, or rock concert. After Tim died unexpectedly, Luke kept looking for his father, following in Tim's footsteps and carving out a highly successful career at NBC News. After eight years covering politics on television, Luke realized he had no good answer as to why he was chasing his father's legacy. As the son of two accomplished parents--his mother is journalist Maureen Orth of Vanity Fair--Luke felt the pressure of high expectations but suddenly decided to leave the familiar path behind.</p><p>Instead, Luke set out on his own to find answers. What began as several open-ended months of travel to decompress and reassess morphed into a three-plus-year odyssey across six continents to discover the world and, ultimately, to find himself.</p><p>Chronicling the important lessons and historical understandings Luke discovered from his travels, Look for Me There is both the vivid narrative of that journey and the emotional story of a young man taking charge of his life, reexamining his relationship with his parents, and finally grieving his larger-than-life father, who died too young. </p><p>For anyone uncertain about the direction of their life or unsure of how to move forward after a loss, Look for Me There is a poignant reflection that offers encouragement to examine our choices, take risks, and discover our truest selves.</p>		https://www.walmart.com/ip/Look-for-Me-There-Grieving-My-Father-Finding-Myself-Hardcover-9780785291817/1264065850
43	POVERTY, BY AMERICA	0593239911	9780593239919	<b>The Pulitzer Prize–winning, bestselling author of <i>Evicted</i> reimagines the debate on poverty, making a new and bracing argument about why it persists in America: because the rest of us benefit from it.</b><br> <br>The United States, the richest country on earth, has more poverty than any other advanced democracy. Why? Why does this land of plenty allow one in every eight of its children to go without basic necessities, permit scores of its citizens to live and die on the streets, and authorize its corporations to pay poverty wages? <br> <br>In this landmark book, acclaimed sociologist Matthew Desmond draws on history, research, and original reporting to show how affluent Americans knowingly and unknowingly keep poor people poor. Those of us who are financially secure exploit the poor, driving down their wages while forcing them to overpay for housing and access to cash and credit. We prioritize the subsidization of our wealth over the alleviation of poverty, designing a welfare state that gives the most to those who need the least. And we stockpile opportunity in exclusive communities, creating zones of concentrated riches alongside those of concentrated despair. Some lives are made small so that others may grow.<br> <br>Elegantly written and fiercely argued, this compassionate book gives us new ways of thinking about a morally urgent problem. It also helps us imagine solutions. Desmond builds a startlingly original and ambitious case for ending poverty. He calls on us all to become poverty abolitionists, engaged in a politics of collective belonging to usher in a new age of shared prosperity and, at last, true freedom.		https://www.walmart.com/ip/Poverty-by-America-Hardcover-9780593239919/1052198205
44	KING: A LIFE	0374279292	9780374279295	<p><b>AN INSTANT <i>NEW YORK TIMES</i> BESTSELLER | </b><b>A <i>Washington Post </i>and National Indie Bestseller</b><br><b><br>“Supple, penetrating, heartstring-pulling and compulsively readable . . . Eig’s book is worthy of its subject.” —Dwight Garner, <i>The New York Times </i>(Book Review Editors' Choice)</b><br><br><b>"[<i>King </i>is] infused with the narrative energy of a thriller . . . The most compelling account of King’s life in a generation.” —Mark Whitaker, <i>The Washington Post</i></b><br><b><br>"No book could be more timely than Jonathan Eig’s sweeping and majestic new <i>King . . .</i> Eig has created 2023′s most vital tome." —Will Bunch, <i>The Philadelphia Inquirer</i></b><br><b><br>Hailed by the <i>New York Times</i> as "the new definitive biography," King mixes revelatory new research with accessible storytelling to offer an MLK for our times.<br><br></b>Vividly written and exhaustively researched, Jonathan Eig’s <i>King: A Life</i> is the first major biography in decades of the civil rights icon Martin Luther King Jr.—and the first to include recently declassified FBI files. In this revelatory new portrait of the preacher and activist who shook the world, the bestselling biographer gives us an intimate view of the courageous and often emotionally troubled human being who demanded peaceful protest for his movement but was rarely at peace with himself. He casts fresh light on the King family’s origins as well as MLK’s complex relationships with his wife, father, and fellow activists. <i>King </i>reveals a minister wrestling with his own human frailties and dark moods, a citizen hunted by his own government, and a man determined to fight for justice even if it proved to be a fight to the death. As he follows MLK from the classroom to the pulpit to the streets of Birmingham, Selma, and Memphis, Eig dramatically re-creates the journey of a man who recast American race relations and became our only modern-day founding father—as well as the nation’s most mourned martyr.<br><br>In this landmark biography, Eig gives us an MLK for our times: a deep thinker, a brilliant strategist, and a committed radical who led one of history’s greatest movements, and whose demands for racial and economic justice remain as urgent today as they were in his lifetime.<br><br><b>Includes 8 pages of black-and-white photographs</b></p>		https://www.walmart.com/ip/King-A-Life-Hardcover-9780374279295/1909391625
45	HOLDING THE NOTE	1400043611	9781400043613	<b>The Pulitzer Prize–winning author, journalist, and editor of <i>The New Yorker</i> gathers his writing on musicians and music, from opera and jazz to rock, pop, and the blues.</b><br><br>From the obsessively brilliant Charlie Parker expert Phil Schaap to the eternally major Paul McCartney; from the undimmed genius of Aretha Franklin to the torch-bearing octogenarian of the Chicago blues, Buddy Guy, these pieces bring us into close contact with a variety of musical standouts across the spectrum of genre, generation, and approaches to their art. We're treated to the pleasures we've come to expect from David Remnick: his signature ease on the page with subjects of all stripes, his perfectly turned sentences, and his deep and broad understanding of American popular culture. We are also treated to the pleasure of his sheer love of music. "'Respect' is as precise an artifact as a Ming vase," he writes, and it is with that same wit and reverence that he approaches each conversation, each melody, each shining soul in these indispensable explorations of the art perhaps most difficult to find words for.		https://www.walmart.com/ip/Holding-the-Note-Profiles-in-Popular-Music-Hardcover-9781400043613/1007041525
46	THE SHADOW DOCKET	1541602633	9781541602632	"At 11:34 PM on April 9, 2021, the Supreme Court issued an emergency ruling. California governor Gavin Newsom's bid to enact enhanced COVID restrictions was overturned in a sweeping redefinition of existing law. The shadowy circumstances of this ruling-an unsigned decision made in just a few pages, without a full briefing, and in the middle of the night-are not typical of the Supreme Court. But, as legal scholar and expert Stephen Vladeck shows, they're becoming far too common. The Supreme Court has always had the authority to issue emergency rulings-halting an execution or preventing a law from going into effect until lower courts could rule on its constitutionality-but until recently, it did so only in exceptional circumstances and issued only narrow rulings. Yet in the past decade, the court has expanded its use of the behind-the-scenes "shadow docket" dramatically, handing down major decisions that impact millions of Americans without oral argument or signed opinions, and often without any legal reasoning at all. While typical cases take years, shadow docket cases can take weeks. They typically fly under the public radar, too-until now. In The Shadow Docket, University of Texas law professor Steve Vladeck offers a comprehensive analysis of the shadow docket, tracing its emergence in the 1970s in the wake of major court decisions on the death penalty and its recent embrace by a conservative-leaning court that has expanded it to set policy on everything from election law to abortion to immigration. Yet while Republican appointees have been most enthusiastic in their use of the shadow docket, the docket itself is not partisan, and Vladeck makes the case that Americans of all political stripes have a stake in bringing the court's decision-making processes back into the light. Rigorous yet accessible, The Shadow Docket exposes a disturbing institutional crisis that threatens the foundations of our democracy, and calls for sweeping reform"--		\N
47	GREENLIGHTS	0593139135	9780593139134	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • <b>Discover the life-changing memoir that has inspired millions of readers through the Academy Award®–winning actor’s unflinching honesty, unconventional wisdom, and lessons learned the hard way about living with greater satisfaction.</b></b><br><b><br>“The No. 1 celebrity memoir of the past 10 years.”—<i>USA Today</i></b><br><br><b>“McConaughey’s book invites us to grapple with the lessons of his life as he did—and to see that the point was never to win, but to understand.”—Mark Manson, author of <i>The Subtle Art of Not Giving a F*ck</i></b><br><br>I’ve been in this life for fifty years, been trying to work out its riddle for forty-two, and been keeping diaries of clues to that riddle for the last thirty-five. Notes about successes and failures, joys and sorrows, things that made me marvel, and things that made me laugh out loud. How to be fair. How to have less stress. How to have fun. How to hurt people less. How to get hurt less. How to be a good man. How to have meaning in life. How to be more me.<br> <br>Recently, I worked up the courage to sit down with those diaries. I found stories I experienced, lessons I learned and forgot, poems, prayers, prescriptions, beliefs about what matters, some great photographs, and a whole bunch of bumper stickers. I found a reliable theme, an approach to living that gave me more satisfaction, at the time, and still: If you know how, and when, to deal with life’s challenges—how to <i>get relative with the inevitable</i>—you can enjoy a state of success I call “catching greenlights.”<br> <br>So I took a one-way ticket to the desert and wrote this book: an album, a record, a story of my life so far. This is fifty years of my sights and seens, felts and figured-outs, cools and shamefuls. Graces, truths, and beauties of brutality. Getting away withs, getting caughts, and getting wets while trying to dance between the raindrops.<br> <br>Hopefully, it’s medicine that tastes good, a couple of aspirin instead of the infirmary, a spaceship to Mars without needing your pilot’s license, going to church without having to be born again, and laughing through the tears.<br> <br>It’s a love letter. <b>To life.</b><br> <br>It’s also a guide to catching more greenlights—and to realizing that the yellows and reds eventually turn green too.<br> <br>Good luck.<br><br><b>The short dust jacket included with this hardcover edition is an intentional design choice.</b>		https://www.walmart.com/ip/Greenlights-Hardcover-9780593139134/187566361
48	THE MIDNIGHT LIBRARY	0525559493	9780525559498	<b><b><b><b>The #1 <i>New York Times </i>bestselling WORLDWIDE phenomenon </b><br> <br> <b>Winner of the Goodreads Choice Award for Fiction | A Good Morning America Book Club Pick | <i>Independent (</i>London) Ten Best Books of the Year</b><br> <br> <b>"A feel-good book guaranteed to lift your spirits."<i>—The Washington Post</i> <br><br> The dazzling reader-favorite about the choices that go into a life well lived, from the acclaimed author of <i>How To Stop Time </i>and<i> The Comfort Book.</i></b><br> <b> </b></b></b></b><br>Somewhere out beyond the edge of the universe there is a library that contains an infinite number of books, each one the story of another reality. One tells the story of your life as it is, along with another book for the other life you could have lived if you had made a different choice at any point in your life. While we all wonder how our lives might have been, what if you had the chance to go to the library and see for yourself? Would any of these other lives truly be better?<br><br>In <i>The Midnight Library</i>, Matt Haig's enchanting blockbuster novel, Nora Seed finds herself faced with this decision. Faced with the possibility of changing her life for a new one, following a different career, undoing old breakups, realizing her dreams of becoming a glaciologist; she must search within herself as she travels through the Midnight Library to decide what is truly fulfilling in life, and what makes it worth living in the first place.		https://www.walmart.com/ip/The-Midnight-Library-Paperback-9780525559498/1925432607
49	UGLY LOVE	1476753180	9781476753188	<b>From Colleen Hoover, the #1 <i>New York Times</i> bestselling author of <i>It Starts with Us</i> and <i>It Ends with Us, </i>a<i> </i>heart-wrenching love story that proves attraction at first sight can be messy. </b><br><br>When Tate Collins meets airline pilot Miles Archer, she doesn't think it's love at first sight. They wouldn’t even go so far as to consider themselves friends. The only thing Tate and Miles have in common is an undeniable mutual attraction. Once their desires are out in the open, they realize they have the perfect set-up. He doesn’t want love, she doesn’t have time for love, so that just leaves the sex. Their arrangement could be surprisingly seamless, as long as Tate can stick to the only two rules Miles has for her.<br> <br>Never ask about the past. <br> Don’t expect a future.<br> <br>They think they can handle it, but realize almost immediately they can’t handle it at all.<br> <br>Hearts get infiltrated. <br> Promises get broken. <br> Rules get shattered.<br> Love gets ugly.		https://www.walmart.com/ip/Ugly-Love-Paperback-9781476753188/33937525
50	NEVER NEVER	1335004882	9781335004888	AN INSTANT #1 NEW YORK TIMES BESTSELLER!<br> <br> <br> <br> Never stop...Never forget...Just remember.<br> <br> <br> <br> Colleen Hoover, the #1 New York Times bestselling author of It Starts with Us joins forces with Tarryn Fisher, the New York Times bestselling author of The Wives. Together, they have created a gripping, twisty, romantic mystery unlike any other.<br> <br> <br> <br> Charlie Wynwood and Silas Nash have been best friends since they could walk. They've been in love since the age of fourteen. But as of this morning...they are complete strangers. Their first kiss, their first fight, the moment they fell in love...every memory has vanished. Now Charlie and Silas must work together to uncover the truth about what happened to them and why.<br> <br> <br> <br> But the more they learn about the couple they used to be...the more they question why they were ever together to begin with. Forgetting is terrifying, but remembering may be worse.<br> <br> <br> <br> Heart-stopping and utterly captivating, the complete Never Never series, now available in one volume, will leave readers breathless and believing in the power of love.<br> <br> <br> <br> <br> <br>		https://www.walmart.com/ip/Never-Never-Paperback-9781335004888/1951979807
51	HEART BONES	1668021919	9781668021910	<b><b>From the #1 <i>New York Times</i> bestselling author of <i>It Ends with Us</i> and <i>It Starts with Us</i>!</b><br> <br><b>Moving, passionate, and unforgettable, Colleen Hoover's novel follows two young adults from completely different backgrounds embarking on a tentative romance, unaware of what the future holds.</b></b><br><br>After a childhood filled with poverty and neglect, Beyah Grim finally has her hard-earned ticket out of Kentucky with a full ride to Penn State. But two months before she’s finally free to change her life for the better, an unexpected death leaves her homeless and forced to spend the remainder of her summer in Texas with a father she barely knows.<br> <br>Devastated and anxious for the summer to go by quickly, Beyah has no time or patience for Samson, the wealthy, brooding guy next door. Yet, the connection between them is too intense to ignore. But with their upcoming futures sending them to opposite ends of the country, the two decide to maintain only a casual summer fling. Too bad neither has any idea that a rip current is about to drag both their hearts out to sea.		https://www.walmart.com/ip/Heart-Bones-Paperback-9781668021910/1705258788
52	THE SILENT PATIENT	125030170X	9781250301703	<p><b>**THE INSTANT #1 <i>NEW YORK TIMES </i>BESTSELLER**</b><br><br>"An unforgettable—and Hollywood-bound—new thriller... A mix of Hitchcockian suspense, Agatha Christie plotting, and Greek tragedy."<br><b>—<i>Entertainment Weekly</i></b><br><br><b><i>The Silent Patient</i> is a shocking psychological thriller of a woman’s act of violence against her husband—and of the therapist obsessed with uncovering her motive.</b><br><br>Alicia Berenson’s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London’s most desirable areas. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word.<br><br>Alicia’s refusal to talk, or give any kind of explanation, turns a domestic tragedy into something far grander, a mystery that captures the public imagination and casts Alicia into notoriety. The price of her art skyrockets, and she, the silent patient, is hidden away from the tabloids and spotlight at the Grove, a secure forensic unit in North London.<br><br>Theo Faber is a criminal psychotherapist who has waited a long time for the opportunity to work with Alicia. His determination to get her to talk and unravel the mystery of why she shot her husband takes him down a twisting path into his own motivations—a search for the truth that threatens to consume him....</p>		https://www.walmart.com/ip/The-Silent-Patient-Paperback-9781250301703/676599252
53	TRUST	0593420322	9780593420324	<b><b><b><b><b><b>WINNER OF THE PULITZER PRIZE FOR FICTION<br><br>A <i>NEW YORK TIMES </i>BESTSELLER<br><br>ONE OF <i>THE NEW YORK TIMES </i>TOP TEN BOOKS OF 2022<br><b><b>ONE OF BARACK OBAMA'S FAVORITE BOOKS OF 2022</b><br></b>LONGLISTED FOR THE 2022 BOOKER PRIZE<br></b></b><br>“Buzzy and enthralling …A glorious novel about empires and erasures, husbands and wives, staggering fortunes and unspeakable misery…Fun as hell to read.” <b>—</b>Oprah Daily</b><br><br>"A genre-bending, time-skipping story about New York City’s elite in the roaring ’20s and Great Depression."<b>—</b><i>Vanity Fair</i><br><br><b><b>“A riveting story of class, capitalism, and greed.” —<i>Esquire</i><br><b><b><b><b><b><b><br>"Exhilarating.” <b><b>—</b></b><i>New York Times</i><br></b></b></b></b></b></b></b></b></b></b></b><br>Even through the roar and effervescence of the 1920s, everyone in New York has heard of Benjamin and Helen Rask. He is a legendary Wall Street tycoon; she is the daughter of eccentric aristocrats. Together, they have risen to the very top of a world of seemingly endless wealth—all as a decade of excess and speculation draws to an end. But at what cost have they acquired their immense fortune? This is the mystery at the center of <i>Bonds</i>, a successful 1937 novel that all of New York seems to have read. Yet there are other versions of this tale of privilege and deceit.<br>    Hernan Diaz’s <i>TRUST </i>elegantly puts these competing narratives into conversation with one another—and in tension with the perspective of one woman bent on disentangling fact from fiction. The result is a novel that spans over a century and becomes more exhilarating with each new revelation.<br>    At once an immersive story and a brilliant literary puzzle, <i>TRUST</i> engages the reader in a quest for the truth while confronting the deceptions that often live at the heart of personal relationships, the reality-warping force of capital, and the ease with which power can manipulate facts.		https://www.walmart.com/ip/Trust-Pulitzer-Prize-Winner-Paperback-9780593420324/2045342804
54	THINGS WE NEVER GOT OVER	194563183X	9781945631832	<p>New York Times bestselling author Lucy Score brings you a grumpy/sunshine romance guaranteed to knock you out. Welcome to Knockemout, Virginia, the small town with the best coffee, the best whiskey and the hottest bad boy heroes you've ever laid hands--I mean eyes--on."</p> <p>Knox Morgan doesn't tolerate drama, especially in the form of a stranded runaway bride.</p> <p>Naomi Witt is on the run. Not just from her fiancé and a church full of well-wishers, but from her entire life. Although if you ask her, Naomi's riding to the rescue of her estranged hot mess of a twin, Tina, to Knockemout, a rough-around-the-edges town where disputes are settled the old-fashioned way...with fists and beer. Usually in that order.</p> <p>Too bad for Naomi, her evil twin hasn't changed at all. After helping herself to Naomi's car and cash, Tina leaves behind something unexpected: the niece Naomi didn't know she had. Now she's a guardian to an eleven-year-old-going-on-thirty with no car, no money, and no plan.</p> <p>There's a reason this bearded, bad-boy barber doesn't get involved with high-maintenance women, especially not Type-A romantic ones. But since Naomi's life imploded right in front of him, the least Knox can do is help her out of her jam. And just as soon as she stops getting into new trouble, he can leave her alone and get back to his quiet, solitary life.</p> <p>At least, that's the plan.</p>		https://www.walmart.com/ip/Knockemout-Things-We-Never-Got-Over-Series-1-Paperback-9781945631832/113612313
55	QUIETLY HOSTILE	0593315693	9780593315699	<b>A much-anticipated, hilarious new essay collection from #1 <i>New York Times</i> bestselling unabashed fan-favorite Samantha Irby invites us to share in the gory particulars of her real life, all that festers behind the glitter and glam.</b><br><br>Beloved writer Samantha Irby has returned to the printed page for her much-anticipated, sidesplitting fourth book following her 2020 breakout, <i>Wow, No Thank You</i>, a Vintage Books Original.<br><br>The success of Irby’s career has taken her to new heights. She fields calls with job offers from Hollywood and walks the red carpet with the iconic ladies of Sex and the City. Finally, she has made it. But, behind all that new-found glam, Irby is just trying to keep her life together as she always had.<br><br>Her teeth are poisoning her from inside her mouth, and her diarrhea is back. She gets turned away from a restaurant for wearing ugly clothes, she goes to therapy and tries out Lexapro, gets healed with RReiki, explores the power of crystals, and becomes addicted to QVC. Making light of herself as she takes us on an outrageously funny tour of all the details that make up a true portrait of her life, Irby is once again the relatable, uproarious tonic we all need. <br><br>A VINTAGE ORIGINAL.		\N
56	THE GLASS CASTLE	074324754X	9780743247542	<b>Now a major motion picture from Lionsgate starring Brie Larson, Woody Harrelson, and Naomi Watts.</b><br> <br> <b>MORE THAN SEVEN YEARS ON <i>THE NEW YORK TIMES</i> BESTSELLER LIST</b><br> The perennially bestselling, extraordinary, one-of-a-kind, “nothing short of spectacular” (<i>Entertainment Weekly</i>) memoir from one of the world’s most gifted storytellers.<br><br><i>The Glass Castle </i>is a remarkable memoir of resilience and redemption, and a revelatory look into a family at once deeply dysfunctional and uniquely vibrant. When sober, Jeannette’s brilliant and charismatic father captured his children’s imagination, teaching them physics, geology, and how to embrace life fearlessly. But when he drank, he was dishonest and destructive. Her mother was a free spirit who abhorred the idea of domesticity and didn’t want the responsibility of raising a family.<br> <br>The Walls children learned to take care of themselves. They fed, clothed, and protected one another, and eventually found their way to New York. Their parents followed them, choosing to be homeless even as their children prospered.<br> <br><i>The Glass Castle </i>is truly astonishing—a memoir permeated by the intense love of a peculiar but loyal family.		https://www.walmart.com/ip/The-Glass-Castle-A-Memoir-Paperback-9780743247542/4125897
57	THINKING, FAST AND SLOW	0374533555	9780374533557	When we can and cannot trust our intuitions in making business and personal decisions.		\N
58	EMPIRE OF THE SUMMER MOON	1416591060	9781416591061	<b>Finalist for the Pulitzer Prize</b><br> This stunning historical account of the forty-year battle between Comanche Indians and white settlers for control of the American West was a major <i>New York Times</i> bestseller. <p>In the tradition of <i>Bury My Heart at Wounded Knee, </i>a stunningly vivid historical account of the forty-year battle between Comanche Indians and white settlers for control of the American West, centering on Quanah, the greatest Comanche chief of them all. <p> S. C. Gwynne's <i>Empire of the Summer Moon</i><b> </b>spans two astonishing stories. The first traces the rise and fall of the Comanches, the most powerful Indian tribe in American history. The second entails one of the most remarkable narratives ever to come out of the Old West: the epic saga of the pioneer woman Cynthia Ann Parker and her mixed-blood son Quanah, who became the last and greatest chief of the Comanches. <p> Although readers may be more familiar with the tribal names Apache and Sioux, it was in fact the legendary fighting ability of the Comanches that determined just how and when the American West opened up. Comanche boys became adept bareback riders by age six; full Comanche braves were considered the best horsemen who ever rode. They were so masterful at war and so skillful with their arrows and lances that they stopped the northern drive of colonial Spain from Mexico and halted the French expansion westward from Louisiana. White settlers arriving in Texas from the eastern United States were surprised to find the frontier being rolled <i>backward </i>by Comanches incensed by the invasion of their tribal lands. So effective were the Comanches that they forced the creation of the Texas Rangers and account for the advent of the new weapon specifically designed to fight them: the six-gun. <p> The war with the Comanches lasted four decades, in effect holding up the development of the new American nation. Gwynne's exhilarating account delivers a sweeping narrative that encompasses Spanish colonialism, the Civil War, the destruction of the buffalo herds, and the arrival of the railroads--a historical feast for anyone interested in how the United States came into being. <p> Against this backdrop Gwynne presents the compelling drama of Cynthia Ann Parker, a lovely nine-year-old girl with cornflower-blue eyes who was kidnapped by Comanches from the far Texas frontier in 1836. She grew to love her captors and became infamous as the "White Squaw" who refused to return until her tragic capture by Texas Rangers in 1860. More famous still was her son Quanah, a warrior who was never defeated and whose guerrilla wars in the Texas Panhandle made him a legend. <p> S. C. Gwynne's account of these events is meticulously researched, intellectually provocative, and, above all, thrillingly told. <i>Empire of the Summer Moon </i>announces him as a major new writer of American history.		\N
59	TALKING TO STRANGERS	0316299227	9780316299220	<b>Malcolm Gladwell, host of the podcast <i>Revisionist History</i> and author of the #1 <i>New York Times</i> bestseller <i>Outliers</i>, offers a powerful examination of our interactions with strangers</b><b>, </b><b>and why they often go wrong</b><b>--now with a new afterword by the author.</b><br> <br> <br> <br> <b>A Best Book of the Year: <i>The Financial Times, Bloomberg, Chicago Tribune,</i> and <i>Detroit Free Press</i></b><br> <br> <br> <br> How did Fidel Castro fool the CIA for a generation? Why did Neville Chamberlain think he could trust Adolf Hitler? Why are campus sexual assaults on the rise? Do television sitcoms teach us something about the way we relate to one another that isn't true?<br> <br> <br> <br> <i>Talking to Strangers</i> is a challenging and controversial excursion through history, psychology, and scandals taken straight from the news. In it, Malcolm Gladwell revisits the deceptions of Bernie Madoff, the suicide of Sylvia Plath, and the death of Sandra Bland--throwing our understanding of these and other stories into doubt.<br> <br> <br> <br> Something is very wrong, Gladwell argues, with the tools and strategies we use to make sense of people we don't know, and the resulting conflict and misunderstanding have a profound effect on our lives and our world. Now, with <i>Talking to Strangers</i>, Malcolm Gladwell brings us a gripping guidebook for troubled times.		https://www.walmart.com/ip/Talking-to-Strangers-What-We-Should-Know-about-the-People-We-Don-t-Know-Paperback-9780316299220/195596443
60	EDUCATED	0399590528	9780399590528	<b>#1 <i>NEW YORK TIMES, WALL STREET JOURNAL,</i> AND <i>BOSTON GLOBE</i> BESTSELLER • One of the most acclaimed books of our time: an unforgettable memoir about a young woman who, kept out of school, leaves her survivalist family and goes on to earn a PhD from Cambridge University</b><br> <br><b>“Extraordinary . . . an act of courage and self-invention.”—<i>The New York Times</i></b><br> <br><b>NAMED ONE OF THE TEN BEST BOOKS OF THE YEAR BY <i>THE NEW YORK TIMES BOOK REVIEW</i> • ONE OF PRESIDENT BARACK OBAMA’S FAVORITE BOOKS OF THE YEAR • BILL GATES’S HOLIDAY READING LIST • FINALIST: National Book Critics Circle’s Award In Autobiography and John Leonard Prize For Best First Book • PEN/Jean Stein Book Award • <i>Los Angeles Times</i> Book Prize</b><br> <br>Born to survivalists in the mountains of Idaho, Tara Westover was seventeen the first time she set foot in a classroom. Her family was so isolated from mainstream society that there was no one to ensure the children received an education, and no one to intervene when one of Tara’s older brothers became violent. When another brother got himself into college, Tara decided to try a new kind of life. Her quest for knowledge transformed her, taking her over oceans and across continents, to Harvard and to Cambridge University. Only then would she wonder if she’d traveled too far, if there was still a way home.<br> <br><b>“Beautiful and propulsive . . . Despite the singularity of [Westover’s] childhood, the questions her book poses are universal: How much of ourselves should we give to those we love? And how much must we betray them to grow up?”—<i>Vogue</i></b><br><b><br>ONE OF THE BEST BOOKS OF THE YEAR: <i>The Washington Post, O: The Oprah Magazine, Time,</i> NPR, <i>Good Morning America, San Francisco Chronicle, The Guardian, The Economist, Financial Times</i>,<i> Newsday, New York Post, theSkimm, Refinery29, Bloomberg, Self, Real Simple, Town & Country, Bustle, Paste, Publishers Weekly</i>,<i> Library Journal, LibraryReads, Book Riot,</i> Pamela Paul, KQED, New York Public Library</b>		https://www.walmart.com/ip/Educated-A-Memoir-Paperback-9780399590528/106050477
61	MY LOVE STORY	1501198254	9781501198250	<b>In this <i>New York Times </i>bestseller, Tina Turner—the long-reigning queen of rock & roll and living legend—sets the record straight about her illustrious career and complicated personal life in this eye-opening and compelling memoir.</b><br><br>From her early years in Nutbush, Tennessee to her rise to fame alongside Ike Turner to her phenomenal success in the 1980s and beyond, Tina candidly examines her personal history, from her darkest hours to her happiest moments and everything in between.<br> <br> <i>My Love Story </i>is an explosive and inspiring story of a woman who dared to break any barriers put in her way. Emphatically showcasing Tina’s signature blend of strength, energy, heart, and soul, this is a gorgeously wrought memoir as enthralling and moving as any of her greatest hits.		https://www.walmart.com/ip/My-Love-Story-Paperback-9781501198250/185393329
62	THE BOMBER MAFIA	0316296813	9780316296816	<p><b>Dive into this "truly compelling" (<i>Good Morning America</i>) <i>New York Times</i> bestseller that explores how technology and best intentions collide in the heat of war--from the creator and host of the podcast <i>Revisionist History.</i></b></p> In <i>The Bomber Mafia</i><i>,</i> Malcolm Gladwell weaves together the stories of a Dutch genius and his homemade computer, a band of brothers in central Alabama, a British psychopath, and pyromaniacal chemists at Harvard to examine one of the greatest moral challenges in modern American history.<br> <br> <br> <br> Most military thinkers in the years leading up to World War II saw the airplane as an afterthought. But a small band of idealistic strategists, the "Bomber Mafia," asked: What if precision bombing could cripple the enemy <i>and</i> make war far less lethal? <br> <br> <br> <br> In contrast, the bombing of Tokyo on the deadliest night of the war was the brainchild of General Curtis LeMay, whose brutal pragmatism and scorched-earth tactics in Japan cost thousands of civilian lives, but may have spared even more by averting a planned US invasion. In <i>The Bomber Mafia,</i> Gladwell asks, "Was it worth it?"<br> <br> <br> <br> Things might have gone differently had LeMay's predecessor, General Haywood Hansell, remained in charge. Hansell believed in precision bombing, but when he and Curtis LeMay squared off for a leadership handover in the jungles of Guam, LeMay emerged victorious, leading to the darkest night of World War II. <i>The Bomber Mafia</i> is a riveting tale of persistence, innovation, and the incalculable wages of war.		\N
63	GRIT	1501111116	9781501111112	<b>In this instant <i>New York Times </i>bestseller, Angela Duckworth shows anyone striving to succeed that the secret to outstanding achievement is not talent, but a special blend of passion and persistence she calls “grit.” “Inspiration for non-geniuses everywhere” (<i>People</i>).</b><br><br>The daughter of a scientist who frequently noted her lack of “genius,” Angela Duckworth is now a celebrated researcher and professor. It was her early eye-opening stints in teaching, business consulting, and neuroscience that led to her hypothesis about what really drives success: not genius, but a unique combination of passion and long-term perseverance.<br> <br> In <i>Grit</i>, she takes us into the field to visit cadets struggling through their first days at West Point, teachers working in some of the toughest schools, and young finalists in the National Spelling Bee. She also mines fascinating insights from history and shows what can be gleaned from modern experiments in peak performance. Finally, she shares what she’s learned from interviewing dozens of high achievers—from JP Morgan CEO Jamie Dimon to <i>New Yorker</i> cartoon editor Bob Mankoff to Seattle Seahawks Coach Pete Carroll.<br> <br> “Duckworth’s ideas about the cultivation of tenacity have clearly changed some lives for the better” (<i>The New York Times Book Review</i>). Among <i>Grit</i>’s most valuable insights: any effort you make ultimately counts <i>twice </i>toward your goal; grit can be <i>learned</i>, regardless of IQ or circumstances; when it comes to child-rearing, neither a warm embrace nor high standards will work by themselves; how to trigger lifelong interest; the magic of the Hard Thing Rule; and so much more. Winningly personal, insightful, and even life-changing, <i>Grit</i> is a book about what goes through your head when you fall down, and how<i> that</i>—not talent or luck—makes all the difference. This is “a fascinating tour of the psychological research on success” (<i>The Wall Street Journal)</i>.		https://www.walmart.com/ip/Grit-The-Power-of-Passion-and-Perseverance-Paperback-9781501111112/535292575
64	ATOMIC HABITS	0735211299	9780735211292	<b>The #1<i> New York Times</i> bestseller. Over 10 million copies sold!<br><br><i>Tiny Changes, Remarkable Results</i></b><br><br>No matter your goals, <i>Atomic Habits</i> offers a proven framework for improving--every day. James Clear, one of the world's leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.<br><br>If you're having trouble changing your habits, the problem isn't you. The problem is your system. Bad habits repeat themselves again and again not because you don't want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you'll get a proven system that can take you to new heights.<br><br>Clear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field.<br><br>Learn how to:<br><ul><li>make time for new habits (even when life gets crazy);</li></ul><ul><li>overcome a lack of motivation and willpower;</li></ul><ul><li>design your environment to make success easier;</li></ul><ul><li>get back on track when you fall off course;</li></ul>...and much more.<br><br><i>Atomic Habits</i> will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.		https://www.walmart.com/ip/Atomic-Habits-An-Easy-Proven-Way-to-Build-Good-Habits-Break-Bad-Ones-Hardcover-9780735211292/703412326
65	MAGNOLIA TABLE, VOL. 3	0062820176	9780062820174	<br> <br> <p>Joanna Gaines--cofounder of Magnolia, cook and host of Magnolia Table with Joanna Gaines, and New York Times bestselling author--brings us her third cookbook filled with timeless and nostalgic recipes--now reimagined--for today's home cook. </p> <p>Whether it's in the making, the gathering, or the tasting of something truly delicious, this collection of recipes from Magnolia Table, Volume 3 is an invitation to savor every moment. In Joanna's first cookbook, the #1 New York Times bestselling Magnolia Table, she introduced readers to her favorite passed-down family recipes. For her second cookbook, Magnolia Table, Volume 2, she pushed herself beyond her comfort zone to develop new recipes for her family. In this, her third cookbook, Joanna shares the recipes--old and new--that she's enjoyed the most over the years. The result is a cookbook filled with recipes that are timeless, creative, and delicious! Just as in her past books, within each recipe Joanna speaks to the reader, explaining why she likes a recipe, what inspired her to create it in the first place, and how she prefers to serve it. The book is beautifully photographed and filled with dishes you will want to bring into your own home, including:</p> <ul> <li>Honey Butter Layered Biscuit Bites </li> <li>Bananas Foster Pancakes </li> <li>Brussels Sprout Gruyére Gratin </li> <li>White Chicken Alfredo Lasagna </li> <li>Garlic Shrimp over Parmesan Risotto </li> <li>Peanut Butter Pie </li> <li>Brownie Cookies </li> </ul> <br> <br>		https://www.walmart.com/ip/Magnolia-Table-Volume-3-A-Collection-of-Recipes-for-Gathering-Hardcover-9780062820174/2628564176
66	THE SHIFT	1668007630	9781668007631	<b><b>The lifestyle creator, advice expert, and host of the <i>It’s Me, Tinx</i> podcast shares her hilarious and (sometimes brutally) honest wisdom on how to shift your approach to life, step into your confidence, and enjoy the journey.</b><b> </b></b><br><br>It’s time to get laser focused on what makes us feel happy and fulfilled. Lifestyle creator, advice expert, and podcast host Tinx wants to take your hand and guide you to a new way of thinking about life, love, happiness, and friendships—where dating evolves into era of self-discovery and not just a means to an end, sharing wisdom becomes a collective power, and chaos turns into a source of creativity. Making small but mighty shifts in thinking can be a tool for personal growth that fuels you instead of fatigues you. The point is to know yourself, discover what you fulfills you, and have fun along the way.<br> <br>In <i>The Shift</i>, Tinx collects all her revolutionary theories and hilarious personal anecdotes in one place, presenting you with a guide to simple mindset shifts that will completely change the way you approach decision making and relationships.<br> <br>Through her own stories, from the good to the bad, Tinx will help you better understand how to step into your power and own self-worth. Some say you cannot love another before you learn to love yourself: Tinx will teach you how to do both at the same time. And she’ll do it while making you laugh out loud.<br> <br>With her signature wit and candor, Tinx will teach you:<br> -How to change your scarcity mindset<br> -How to understand and employ her famous Box Theory dating concept<br> -How to feed the things that fulfill you<br> -How living well is the best revenge<br> -How therapy can reframe struggles into strengths<br> -How to break up with dignity<br> -How knowing your worth makes you a better friend and partner		\N
67	THE CREATIVE ACT	0593652886	9780593652886	<b>The #1 <i>New York Times </i>bestseller.<br><br>"The ultimate graduation gift...It’s a book I wish I would have had on my shelf when I was 25. It’s a book I would give to people who are 25." — Steve Levitt, <i>People I (Mostly) Admire</i><br><br>"A gorgeous and inspiring work of art on creation, creativity, the work of the artist. It will gladden the hearts of writers and artists everywhere, and get them working again with a new sense of meaning and direction. A stunning accomplishment.” —Anne Lamott<br><br><b>From the legendary music producer, a master at helping people connect with the wellsprings of their creativity, comes a beautifully crafted book many years in the making that offers that same deep wisdom to all of us.</b></b><br><br>“<i>I set out to write a book about what to do to make a great work of art. Instead, it revealed itself to be a book on how to be.” —Rick Rubin</i><br><br>Many famed music producers are known for a particular sound that has its day. Rick Rubin is known for something else: creating a space where artists of all different genres and traditions can home in on who they really are and what they really offer. He has made a practice of helping people transcend their self-imposed expectations in order to reconnect with a state of innocence from which the surprising becomes inevitable. Over the years, as he has thought deeply about where creativity comes from and where it doesn’t, he has learned that being an artist isn’t about your specific output, it’s about your relationship to the world. Creativity has a place in everyone’s life, and everyone can make that place larger. In fact, there are few more important responsibilities.<br><br><i>The Creative Act</i> is a beautiful and generous course of study that illuminates the path of the artist as a road we all can follow. It distills the wisdom gleaned from a lifetime’s work into a luminous reading experience that puts the power to create moments—and lifetimes—of exhilaration and transcendence within closer reach for all of us.		https://www.walmart.com/ip/The-Creative-ACT-A-Way-of-Being-Hardcover-9780593652886/1846324621
68	THE BOY, THE MOLE, THE FOX AND THE HORSE	0062976583	9780062976581	<p>Charlie Mackesy's beloved The Boy, the Mole, the Fox and the Horse has been adapted into an Academy Award(R) winning animated short film, now available to stream on Apple TV+</p><p>#1 NEW YORK TIMES BESTSELLER - WALL STREET JOURNAL BESTSELLER - USA TODAY BESTSELLER</p><p>"The Boy, the Mole, the Fox and the Horse is not only a thought-provoking, discussion-worthy story, the book itself is an object of art."- Elizabeth Egan, The New York Times</p><p>From British illustrator, artist, and author Charlie Mackesy comes a journey for all ages that explores life's universal lessons, featuring 100 color and black-and-white drawings.</p><p>"What do you want to be when you grow up?" asked the mole.</p><p>"Kind," said the boy.</p><p>Charlie Mackesy offers inspiration and hope in uncertain times in this beautiful book, following the tale of a curious boy, a greedy mole, a wary fox and a wise horse who find themselves together in sometimes difficult terrain, sharing their greatest fears and biggest discoveries about vulnerability, kindness, hope, friendship and love. The shared adventures and important conversations between the four friends are full of life lessons that have connected with readers of all ages. </p>		https://www.walmart.com/ip/The-Boy-the-Mole-the-Fox-and-the-Horse-Hardcover-9780062976581/524110345
69	THERE ARE MOMS WAY WORSE THAN YOU	1523515643	9781523515646	<b>A hilarious and reassuring gift for every mom: because we’re all doing the best we can, and the natural world is filled with moms worse than you!</b><br><br><i>A mom giraffe is pretty nice until the fetus drops.</i><br><i>She’ll birth a newborn baby calf, then kick him ’til he walks.</i><br>  <br><i>Whenever you feel guilty that you haven’t cleaned the house:</i><br><i>Sexton beetles raise their kids in a decomposing mouse.</i><br>  <br> A koala mom will feed her kids her own poop. Yes, poop. Panda moms will abandon one twin because raising two is, well, just too much. And every now and then a cuddly little hamster mom will —yup— eat her newborn pups.<br> These and other true facts from the animal kingdom offer a hilarious reality check on what constitutes “good parenting.” So, human mother, time to stop worrying about the job you're doing —because you’re a <i>great</i> mom.<br>  	Illustrated by Priscilla Witte	https://www.walmart.com/ip/There-Are-Moms-Way-Worse-Than-You-Irrefutable-Proof-That-You-Are-Indeed-a-Fantastic-Parent-Hardcover-9781523515646/705932356
70	I WILL TEACH YOU TO BE RICH, SECOND EDITION	1523505745	9781523505746	<b>The groundbreaking <i>NEW YORK TIMES</i> and <i>WALL STREET JOURNAL</i> BESTSELLER that taught a generation how to earn more, save more, and live a rich life—now in a revised 2nd edition.</b><br>  <br> Buy as many lattes as you want. Choose the right accounts and investments so your money grows for you—automatically. Best of all, spend guilt-free on the things you love.<br>  <br> Personal finance expert Ramit Sethi has been called a “wealth wizard” by <i>Forbes</i> and the “new guru on the block” by <i>Fortune</i>. Now he’s updated and expanded his modern money classic for a new age, delivering a simple, powerful, no-BS 6-week program that just works.<br>  <br><i>I Will Teach You to Be Rich</i> will show you:<br> • How to crush your debt and student loans faster than you thought possible<br> • How to set up no-fee, high-interest bank accounts that won’t gouge you for every penny<br> • How Ramit automates his finances so his money goes exactly where he wants it to—and how you can do it too<br> • How to talk your way out of late fees (with word-for-word scripts)<br> • How to save hundreds or even thousands per month (and still buy what you love)<br> • A set-it-and-forget-it investment strategy that’s dead simple and beats financial advisors at their own game<br> • How to handle buying a car or a house, paying for a wedding, having kids, and other big expenses—stress free<br> • The exact words to use to negotiate a big raise at work<br>  <br><b>Plus, this 10th anniversary edition features over 80 new pages, including:</b><br> • New tools<br> • New insights on money and psychology<br> • Amazing stories of how previous readers used the book to create their rich lives<br>  <br> Master your money—and then get on with your life.<br><br>  		https://www.walmart.com/ip/I-Will-Teach-You-to-Be-Rich-No-Guilt-No-Excuses-Just-a-6-Week-Program-That-Works-Second-Edition-Edition-2-Paperback-9781523505746/623694930
71	MAKE YOUR BED	1455570249	9781455570249	<b>Based on a Navy SEAL's inspiring graduation speech, this #1 <i>New York Times</i> bestseller of powerful life lessons "should be read by every leader in America" (<i>Wall Street Journal</i>).</b><i><br>If you want to change the world, start off by making your bed.</i><br><br><i></i>On May 17, 2014, Admiral William H. McRaven addressed the graduating class of the University of Texas at Austin on their Commencement day. Taking inspiration from the university's slogan, "What starts here changes the world," he shared the ten principles he learned during Navy Seal training that helped him overcome challenges not only in his training and long Naval career, but also throughout his life; and he explained how anyone can use these basic lessons to change themselves-and the world-for the better.<br><br>Admiral McRaven's original speech went viral with over 10 million views. Building on the core tenets laid out in his speech, McRaven now recounts tales from his own life and from those of people he encountered during his military service who dealt with hardship and made tough decisions with determination, compassion, honor, and courage. Told with great humility and optimism, this timeless book provides simple wisdom, practical advice, and words of encouragement that will inspire readers to achieve <i>more</i>, even in life's darkest moments. <br>"Powerful." --USA Today<br><br>"Full of captivating personal anecdotes from inside the national security vault." --Washington Post<br><br>"Superb, smart, and succinct." --Forbes		https://www.walmart.com/ip/Make-Your-Bed-Little-Things-That-Can-Change-Your-Life-and-Maybe-the-World-Hardcover-9781455570249/55218760
72	THE SUBTLE ART OF NOT GIVING A F*CK	0062457713	9780062457714	<p>New York Times Bestseller</p><p>In this generation-defining self-help guide, a superstar blogger cuts through the crap to show us how to stop trying to be "positive" all the time so that we can truly become better, happier people.</p><p>For decades, we’ve been told that positive thinking is the key to a happy, rich life. "F**k positivity," Mark Manson says. "Let’s be honest, shit is f**ked and we have to live with it." In his wildly popular Internet blog, Manson doesn’t sugarcoat or equivocate. He tells it like it is—a dose of raw, refreshing, honest truth that is sorely lacking today. The Subtle Art of Not Giving a F**k is his antidote to the coddling, let’s-all-feel-good mindset that has infected modern society and spoiled a generation, rewarding them with gold medals just for showing up. </p><p>Manson makes the argument, backed both by academic research and well-timed poop jokes, that improving our lives hinges not on our ability to turn lemons into lemonade, but on learning to stomach lemons better. Human beings are flawed and limited—"not everybody can be extraordinary, there are winners and losers in society, and some of it is not fair or your fault." Manson advises us to get to know our limitations and accept them. Once we embrace our fears, faults, and uncertainties, once we stop running and avoiding and start confronting painful truths, we can begin to find the courage, perseverance, honesty, responsibility, curiosity, and forgiveness we seek. </p><p>There are only so many things we can give a f**k about so we need to figure out which ones really matter, Manson makes clear. While money is nice, caring about what you do with your life is better, because true wealth is about experience. A much-needed grab-you-by-the-shoulders-and-look-you-in-the-eye moment of real-talk, filled with entertaining stories and profane, ruthless humor, The Subtle Art of Not Giving a F**k is a refreshing slap for a generation to help them lead contented, grounded lives.</p>		\N
73	DISRUPTIVE THINKING	1546004009	9781546004004	<p><b>*A <i>NEW YORK TIMES</i> BESTSELLER!* <p> Think differently and find the courage to challenge the status quo with this mindset-shifting guide to meaningful change.</b></p> For most of our lives, we are encouraged to trudge along the well-worn paths of those who have come before us. We learn the rules - in our families, in our schools, in our workplaces, in our churches - and most of the messages we receive tell us that following the rules will allow us to arrive at the lives we desire. <p> But when change becomes not only desirable but also urgently necessary, this way of being no longer serves us. In fact, in every human endeavor, every major leap forward, has involved a cataclysmic challenge to existing ways of thinking and being. Breakthroughs, by definition, run against the grain and almost always encounter skepticism and opposition. <p> In this book for leaders, thinkers, doers, and creators, Bishop T.D. Jakes illuminates the pathway to encouraging and unleashing disruptive thinking and provides the wisdom and practical skills we need to evolve our most original and potentially transformational ideas from vision to reality. Through his insight into how our minds and emotions work and through his experiences as a pastor, entrepreneur, and creator, Bishop Jakes leads us into a new way of relating to and transforming the world around us for good. <i>Disruptive Thinking</i> will show you the mindset and the tools you need to create groundbreaking and meaningful change in your own life and in the world around you. <br>		https://www.walmart.com/ip/Disruptive-Thinking-A-Daring-Strategy-to-Change-How-We-Live-Lead-and-Love-Hardcover-9781546004004/1426680893
74	THE SUN AND THE STAR	1368081150	9781368081153	<b>Demigods Nico di Angelo and Will Solace must endure the terrors of Tartarus to rescue an old friend in this thrilling adventure co-written by <i>New York Times</i> #1 best-selling author Rick Riordan and award-winning author Mark Oshiro.</b><br><br>Percy Jackson fans, rejoice! Nico and Will have a book of their own!<br><br>As the son of Hades, Nico di Angelo has been through so much, from the premature deaths of his mother and sister, to being outed against his will, to losing his friend Jason during the trials of Apollo. But there <i>is </i>a ray of sunshine in his life—literally: his boyfriend, Will Solace, the son of Apollo. Together the two demigods can overcome any obstacle or foe. At least, that's been the case so far...<br><br>Now Nico is being plagued by a voice calling out to him from Tartarus, the lowest part of the Underworld. He thinks he knows who it is: a reformed Titan named Bob whom Percy and Annabeth had to leave behind when they escaped Hades's realm. Nico's dreams and Rachel Dare's latest prophecy leave little doubt in Nico's mind that Bob is in some kind of trouble. Nico has to go on this quest, whether Mr. D and Chiron like it or not. And of course Will insists on coming with. But can a being made of light survive in the darkest part of the world? and what does the prophecy mean that Nico will have to "leave something of equal value behind?" <br><br><b>Nico will have to face demons both internal and external as his relationship with Will is tested to the core in this standalone adventure featuring two of the most popular characters in the Percy Jackson saga.</b><br><br>Complete your Nico di Angelo collection with these series by Rick Riordan: Percy Jackson and the Olympians • The Heroes of Olympus • The Trials of Apollo		https://www.walmart.com/ip/From-the-World-of-Percy-Jackson-The-Sun-and-the-Star-Hardcover-9781368081153/1988860175
75	WONDER	0375869026	9780375869020	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER •</b> <b>Millions of people have fallen in love with Auggie Pullman, an ordinary boy with an extraordinary face</b>—<b>who shows us that kindness brings us together no matter how far apart we are.</b> <b>Read the book that inspired the Choose Kind movement, a major motion picture, and the critically acclaimed graphic novel <i>White Bird.</i><br><br>And don't miss R.J. Palacio's highly anticipated new novel, <i>Pony, </i>available now!<br> </b><br><i>I won't describe what I look like. Whatever you're thinking, it's probably worse.</i> <br> <br>August Pullman was born with a facial difference that, up until now, has prevented him from going to a mainstream school. Starting 5th grade at Beecher Prep, he wants nothing more than to be treated as an ordinary kid—but his new classmates can’t get past Auggie’s extraordinary face. Beginning from Auggie’s point of view and expanding to include his classmates, his sister, her boyfriend, and others, the perspectives converge to form a portrait of one community’s struggle with empathy, compassion, and acceptance. In a world where bullying among young people is an epidemic, this is a refreshing new narrative full of heart and hope.<br> <br>R.J. Palacio has called her debut novel “a meditation on kindness” —indeed, every reader will come away with a greater appreciation for the simple courage of friendship. Auggie is a hero to root for, a diamond in the rough who proves that you can’t blend in when you were born to stand out. <i><br></i>		https://www.walmart.com/ip/Wonder-Hardcover-9780375869020/16658937
76	REFUGEE	0545880831	9780545880831	A tour de force from acclaimed author Alan Gratz (<i>Prisoner B-3087</i>), this timely -- and timeless -- novel tells the powerful story of three different children seeking refuge.<p></p><b>A <i>New York Times</i> bestseller!</b>JOSEF is a Jewish boy living in 1930s Nazi Germany. With the threat of concentration camps looming, he and his family board a ship bound for the other side of the world . . .ISABEL is a Cuban girl in 1994. With riots and unrest plaguing her country, she and her family set out on a raft, hoping to find safety in America . . .MAHMOUD is a Syrian boy in 2015. With his homeland torn apart by violence and destruction, he and his family begin a long trek toward Europe . . .All three kids go on harrowing journeys in search of refuge. All will face unimaginable dangers -- from drownings to bombings to betrayals. But there is always the hope of <i>tomorrow</i>. And although Josef, Isabel, and Mahmoud are separated by continents and decades, shocking connections will tie their stories together in the end.This action-packed novel tackles topics both timely and timeless: courage, survival, and the quest for home.		https://www.walmart.com/ip/Refugee-Hardcover-9780545880831/55600952
77	THE SWIFTS	0593533232	9780593533239	<b>Instant <i>New York Times </i>Bestseller!<br><br>“<i>Knives Out</i> feel by way of Lemony Snicket…This archly told, never muddled debut whodunit reveals a roster of distinct characters, a labyrinthine setting and plot, and a mystery that is as clever as its heroine.” – <i>Publishers Weekly</i>, starred review<br><br>“The suspenseful denouement is positively writhing with twists.” —<i>Booklist</i>, starred review</b><br><br>On the day they are born, every Swift child is brought before the sacred Family Dictionary. They are given a name, and a definition. A definition it is assumed they will grow up to match. <br><i>Meet Shenanigan Swift: Little sister. Risk-taker. Mischief-maker.</i><br><br><i> </i>Shenanigan is getting ready for the big Swift Family Reunion and plotting her next great scheme: hunting for Grand-Uncle Vile’s long-lost treasure. She’s excited to finally meet her arriving relatives—until one of them gives Arch-Aunt Schadenfreude a deadly shove down the stairs.<br><br>So what if everyone thinks she’ll never be more than a troublemaker, just because of her name? Shenanigan knows she can become whatever she wants, even a detective. And she’s determined to follow the twisty clues and catch the killer.<br><br>Deliciously suspenseful and delightfully clever, <i>The Swifts</i> is a remarkable debut that is both brilliantly contemporary and instantly classic. A celebration of words and individuality, it's packed with games, wordplay, and lots and lots of mischief as Shenanigan sets out to save her family and define herself in a world where definitions are so important.<br><br><i>Cover may vary.</i>	Illustrated by Claire Powell	https://www.walmart.com/ip/The-Swifts-A-Dictionary-of-Scoundrels-Hardcover-9780593533239/1846479591
78	THE EYES AND THE IMPOSSIBLE	1952119456	9781952119453	A New York Times bestseller and Today Show Summer Pick <p>A wild, lyrical, hilarious and beautiful story of a wild dog living and surviving in an urban park</p> Johannes, a free dog, lives in a park hemmed in on three sides by dense human neighborhoods, and on one side by the ocean. His job is to be the Eyes--to see everything that happens within the park and report to the park's elders, three ancient bison who ensure the Equilibrium. His friends--a stalwart seagull, a mordant raccoon, a one-eyed squirrel, and a pelican who can read--work with him as the Assistant Eyes, observing the humans and other animals who share the park and making sure everything is in balance.</p> But changes are afoot. More humans, including Trouble Travelers, arrive in the park. A new building, containing mysterious and hypnotic rectangles, goes up. And then there are the goats--an actual boatload of goats--who appear, along with a shocking revelation that changes Johannes' view of the world.</p> Readers will thrill to Johannes's inimitable and wonderful voice, and will gorge on this unforgettable story of friendship, beauty, liberation, and running very, very fast.</p><br>		\N
79	THE COMPLETE COOKBOOK FOR YOUNG CHEFS	1492670022	9781492670025	<p>The #1 New York Times Best Seller <br> IACP Award Winner</p><p>Want to bake the most-awesome-ever cupcakes? Or surprise your family with breakfast tacos on Sunday morning? Looking for a quick snack after school? Or maybe something special for a sleepover? It's all here. Learn to cook like a pro--it's easier than you think.</p><p>For the first time ever, America's Test Kitchen is bringing their scientific know-how, rigorous testing, and hands-on learning to KIDS in the kitchen </p><p>Using kid-tested and approved recipes, America's Test Kitchen has created THE cookbook every kid chef needs on their shelf. Whether you're cooking for yourself, your friends, or your family, The Complete Cookbook for Young Chefs has delicious recipes that will wow </p><ul><li> Recipes were thoroughly tested by more than 750 kids to get them just right for cooks of all skill levels--including recipes for breakfast, snacks and beverages, dinners, desserts, and more.</li><li> Step-by-step photos of tips and techniques will help young chefs feel like pros in their own kitchen</li><li> Testimonials (and even some product reviews ) from kid test cooks who worked alongside America's Test Kitchen will encourage young chefs that they truly are learning the best recipes from the best cooks.</li></ul><p>By empowering young chefs to make their own choices in the kitchen, America's Test Kitchen is building a new generation of confident cooks, engaged eaters, and curious experimenters.<br></p>		https://www.walmart.com/ip/The-Complete-Cookbook-for-Young-Chefs-100-Recipes-That-You-ll-Love-to-Cook-and-Eat-Hardcover-9781492670025/320536587
80	SKANDAR AND THE PHANTOM RIDER	None	9781665942621	Skandar and his friends investigate how immortal unicorns are being slain.		\N
81	ODDER	1250147425	9781250147424	<p><b>Now a #1 <i>New York Times</i> bestseller! A touching and lyrical tale about a remarkable sea otter, from Newbery Medalist Katherine Applegate, author of <i>Wishtree</i>. <br></b><br>Meet Odder, the Queen of Play: <br><br><i>Nobody has her moves.</i><br><i>She doesn’t just swim to the bottom,</i><br><i>she dive-bombs.</i><br><i>She doesn’t just somersault,</i><br><i>she triple-doughnuts.</i><br><i>She doesn’t just ride the waves,</i><br><i>she makes them.</i><br><br>Odder spends her days off the coast of central California, practicing her underwater acrobatics and spinning the quirky stories for which she’s known. She’s a fearless daredevil, curious to a fault. But when Odder comes face-to-face with a hungry great white shark, her life takes a dramatic turn, one that will challenge everything she believes about herself—and about the humans who hope to save her.<br><br>Inspired by the true story of a Monterey Bay Aquarium program that pairs orphaned otter pups with surrogate mothers, this poignant and humorous tale told in free verse examines bravery and healing through the eyes of one of nature’s most beloved and charming animals.</p>	Illustrated by Charles Santoso	https://www.walmart.com/ip/Odder-Hardcover-9781250147424/394036389
82	SKANDAR AND THE UNICORN THIEF	1665912731	9781665912730	<p>Soar into a breathtaking world of heroes and unicorns as you’ve never seen them before in this fantastical middle grade debut perfect for fans of the Percy Jackson and Eragon series!</p><p><br></p><p>Skandar Smith has always yearned to leave the Mainland and escape to the secretive Island, where wild unicorns roam free. He’s spent years studying for his Hatchery exam, the annual test that selects a handful of Mainlander thirteen-year-olds to train to become unicorn riders. But on the day of Skandar’s exam, things go horribly wrong, and his hopes are shattered…until a mysterious figure knocks on his door at midnight, bearing a message: the Island is in peril and Skandar must answer its call.</p><p><br></p><p>Skandar is thrust into a world of epic sky battles, dangerous clashes with wild unicorns, and rumors of a shadowy villain amassing a unicorn army. And the closer Skandar grows to his newfound friends and community of riders, the harder it becomes to keep his secrets—especially when he discovers their lives may all be in graver danger than he ever imagined.</p>		https://www.walmart.com/ip/Skandar-Skandar-and-the-Unicorn-Thief-Series-1-Hardcover-9781665912730/996448545
83	ONCE THERE WAS	1665928506	9781665928502	<b>A <i>New York Times </i>bestseller!</b><br> <br><b><i>Fantastic Beasts and Where to Find Them</i> meets Neil Gaiman in this thrilling novel about an Iranian American girl who discovers that her father was secretly a veterinarian to mythical creatures—and that she must take up his mantle, despite the many dangers.</b><br><br><i>Once was, once wasn’t.</i><br> <br>So began the stories Marjan’s father told her as a little girl—fables like the story of the girl who sprung a unicorn from a hunter’s snare, or the nomad boy who rescued a baby shirdal. Tales of extraordinary beasts that filled her with curiosity and wonder.<br> <br>But Marjan’s not a little girl anymore. In the wake of her father’s sudden death, she is trying to hold it all together: her schoolwork, friendships, and keeping her dad’s shoestring veterinary practice from going under. Then, one day, she receives a visitor who reveals something stunning: Marjan’s father was no ordinary veterinarian. The creatures out of the stories he told her were real—and he traveled the world to care for them. And now that he’s gone, she must take his place.<br> <br>Marjan steps into a secret world hidden in plain sight, where mythical creatures are bought and sold, treasured and trapped. She finds friends she never knew she needed—a charming British boy who grew up with a griffon, a runaway witch seeking magic and home—while trying to hide her double life from her old friends and classmates.<br> <br>The deeper Marjan gets into treating these animals, the closer she comes to finding who killed her father—and to a shocking truth that will reawaken her sense of wonder and put humans and beasts in the gravest of danger.		https://www.walmart.com/ip/Once-There-Was-Once-There-Was-Hardcover-9781665928502/1265936319
84	WHY A DAUGHTER NEEDS A DAD	1492667838	9781492667834	<p>A New York Times and USA Today bestseller! The perfect Father's Day gift of love or sweet keepsake for a daughter of any age to show why Dad is so amazing!</p><p>This new picture book for kids ages 3-7 and beyond is a touching story showing all the ways a father will help his daughter grow. This is the gift for every girl dad and little girl to celebrate their special bond! Featuring charming animal illustrations and heartwarming rhymes about the moments fathers and daughters share, Why a Daughter Needs a Dad is the perfect story to connect father and child together.</p><p>From the first time I held you, so perfect and new, </p><p>I promised to do everything that I could do</p><p>To help you become your most wonderful YOU, </p><p>My darling, my daughter, my girl.</p><p>For new dads, fathers-to-be, or for that perfect father-daughter moment at birthdays and other special occasions, this sweet storybook celebrates how a father is always there for his little girl. reminding her to be artistic, thoughtful, honest, and smart, but most of all, true to herself.	Illustrated by Sydney Hanson	https://www.walmart.com/ip/Why-a-Daughter-Needs-a-Dad-Hardcover-9781492667834/289342997
85	I WISH YOU MORE	1452126992	9781452126999	Some books are about a single wish. Some books are about three wishes. The infallible team of Amy Krouse Rosenthal and Tom Lichtenheld have combined their extraordinary talents to create this exuberant, inspirational book for kids of endless good wishes. Wishes for curiosity and wonder, for friendship and strength, laughter and peace. Whether celebrating life's joyous milestones, sharing words of encouragement, or observing the wonder of everyday moments, this sweet and uplifting book is perfect for wishers of every age.<br><br>Whether this is a preschool graduation gift, a present for elementary kids, or just a positive book for kids in your life, this book of wishes is sure to bring positivity to all who read it.	Illustrated by Tom Lichtenheld	https://www.walmart.com/ip/I-Wish-You-More-Hardcover-9781452126999/40793691
86	BECAUSE I HAD A TEACHER	1943200084	9781943200085	We all remember our favorite teacher.<p>Where would we be without them - those special people who inspire us, support us, and encourage us? Whether they're an educator, a coach, or a mentor, this book is for them. To celebrate the worlds they open up for us and to thank them for the difference they make.<p>This heartwarming book is a thank you gift for great teachers everywhere. Perfect for National Teacher Day, Teacher Appreciation Week, the end of the school year, or just because.	Illustrated by Natalie Russell	https://www.walmart.com/ip/Because-I-Had-a-Teacher-Hardcover-9781943200085/55361884
87	THE WONDERFUL THINGS YOU WILL BE	0385376715	9780385376716	<b>The<i> New York Times</i> bestseller that celebrates the dreams, acceptance, and love that parents have for their children . . . now and forever. This is the perfect heartfelt gift for kids of all ages, plus a great choice for baby showers, birthdays, graduations, and other new beginnings!<br></b> <br> From brave and bold to creative and clever, Emily Winfield Martin's rhythmic rhyme expresses all the loving things that parents think of when they look at their children. With beautiful, lush illustrations and a stunning gatefold that opens at the end, this is a book that families will love reading over and over. <br><br><i> The Wonderful Things You Will Be</i> has a loving and truthful message that will endure for lifetimes and makes a great gift to the ones you love for any occasion.		https://www.walmart.com/ip/The-Wonderful-Things-You-Will-Be-9780385376716/45144360
88	THE DAY THE CRAYONS QUIT	0399255370	9780399255373	<b>The hilarious, colorful #1 <i>New York Times</i> bestselling phenomenon that every kid wants! Gift a copy to someone you love today.<br></b><br> Poor Duncan just wants to color. But when he opens his box of crayons, he finds only letters, all saying the same thing: His crayons have had enough! They quit! Blue crayon needs a break from coloring all those bodies of water. Black crayon wants to be used for more than just outlining.  And Orange and Yellow are no longer speaking—each believes he is the true color of the sun. What can Duncan possibly do to appease all of the crayons and get them back to doing what they do best?<br><br>With giggle-inducing text from Drew Daywalt and bold and bright illustrations from Oliver Jeffers, <i>The Day the Crayons Quit</i> is the perfect gift for new parents, baby showers, back-to-school, or any time of year! Perfect for fans of <i>Don't Let the Pigeon Drive the Bus </i>by Mo Willems and <i>The True Story of the Three Little Pigs </i>by Jon Sciezka and Lane Smith. <br><br><b>Praise for <i>The Day the Crayons Quit:</i></b><br><br><b>Amazon’s 2013 Best Picture Book of the Year</b><br><b>A Barnes & Noble Best Book of 2013</b><br><b>Goodreads’ 2013 Best Picture Book of the Year </b><br><b>Winner of the E.B. White Read-Aloud Award</b><br><br>* “Hilarious . . . Move over, <i>Click, Clack, Moo</i>; we’ve got a new contender for the most successful picture-book strike.” –<b><i>BCCB</i>, starred review </b><br><br>“Jeffers . . . elevates crayon drawing to remarkable heights.” –<b><i>Booklist</i></b><br><br>“Fresh and funny.” –<b><i>The Wall Street Journal</i></b><br><br>"This book will have children asking to have it read again and again.” –<b><i>Library Media Connection</i></b><br><br>* “This colorful title should make for an uproarious storytime.” –<b><i>School Library Journal</i>, starred review </b><br><br>* “These memorable personalities will leave readers glancing apprehensively at their own crayon boxes.” –<b><i>Publishers Weekly</i>, starred review </b><br><br>“Utterly original.” –<b><i>San Francisco Chronicle</i></b>	Illustrated by Oliver Jeffers	https://www.walmart.com/ip/The-Day-the-Crayons-Quit-Hardcover-9780399255373/22093842
89	THANK YOU, TEACHER FROM THE VERY HUNGRY CATERPILLAR	0593226186	9780593226186	<b>Show your teachers how much you appreciate them in this colorful book of thanks featuring The Very Hungry Caterpillar.</b><br><br>Perfect for National Teacher Day, Teacher Appreciation Week, the end of the school year, or just because! This heartwarming gift book is a perfect thank-you gift for teachers everywhere. Using bright and colorful Eric Carle imagery, plus The Very Hungry Caterpillar, this story provides all the reasons why the teachers in our lives are so special and why we're so thankful for them.		https://www.walmart.com/ip/Thank-You-Teacher-from-The-Very-Hungry-Caterpillar-9780593226186/651293828
90	I LOVE DAD WITH THE VERY HUNGRY CATERPILLAR	152478589X	9781524785895	<b>Show Dad how much you care with this little message of love from The Very Hungry Caterpillar!</b><br><br>Celebrate Dad's special day by saying "I Love You"--with a little help from The Very Hungry Caterpillar. This bright and colorful book is the ideal way to tell the person you call "Dad" how much you appreciate him. It's the perfect gift for Father's Day, Dad's birthday, or any day that you want to show Dad just how much you care.		https://www.walmart.com/ip/World-of-Eric-Carle-I-Love-Dad-with-the-Very-Hungry-Caterpillar-Hardcover-9781524785895/758939815
91	DRAGONS LOVE TACOS	0803736800	9780803736801	<b>A #1 <i>New York Times</i> bestselling phenomenon, this deliciously funny read-aloud is an unforgettable tale of new friends and the perfect snack that will make you laugh until spicy salsa comes out of your nose.</b><br><br> Dragons love tacos. They love chicken tacos, beef tacos, great big tacos, and teeny tiny tacos. So if you want to lure a bunch of dragons to your party, you should definitely serve tacos. Buckets and buckets of tacos. Unfortunately, where there are tacos, there is also salsa. And if a dragon accidentally eats spicy salsa . . . oh, boy. You're in red-hot trouble.<br><br>This makes the perfect gift for any special occasion, from award-winning team of Adam Rubin and Daniel Salmieri who created <i>Dragons Love Tacos 2: The Sequel</i>,<i> El Chupacabras</i>, <i>High Five</i>, <i>Robo-Sauce, and Secret Pizza Party.</i>	Illustrated by Daniel Salmieri	https://www.walmart.com/ip/Dragons-Love-Tacos-Hardcover-9780803736801/19483962
92	BE YOU!	1338572318	9781338572315	<b>A <i>New York Times</i> Bestseller!</b><b>Creative visionary of The Word Collector, Happy Dreamer, and The Dot, #1 <i>New York Times </i>bestseller Peter H. Reynolds creates a joyful celebration of individuality--and staying true to Y-O-U!</b><p></p><p><b>An Amazon Best Book of 2020!</b></p><p></p><p><b>Be curious...</b></p><p><b>Be adventurous...</b></p><p><b>Be brave...</b></p><p><b>BE YOU!</b></p><p></p> <p>Discover a joyful reminder of the ways that every child is unique and special, from the beloved creator of <i>The Dot</i>, <i>Happy Dreamer</i>, and <i>New York Times</i> bestseller, <i>The Word Collector</i>. Here, Reynolds reminds readers to "be your own work of art." To be patient, persistent, and true. Because there is one, and <i>only</i> one, YOU.</p></p><p></p> <p>In the tradition of books like <i>Oh, the Places You'll Go! </i>and <i>I Wish You More</i> comes a wholly original, inspirational celebration of individuality as only Peter H. Reynolds can create!</p></p>		https://www.walmart.com/ip/Be-You-Hardcover-9781338572315/602286529
93	WOO HOO! YOU'RE DOING GREAT!	0316486795	9780316486798	<p><b>Bestselling, beloved author Sandra Boynton--and a very exuberant chicken!--have an important message to share in this inspiring and highly giftable all-ages picture book for every life milestone!</b><br> <br> Whether you are learning to skate, baking a cake, or even making a mistake, this hilarious and heartfelt rhyming book reminds us that trying our best is reason to celebrate. From children trying to master new skills to adults who had a hard week at work, we all get overwhelmed sometimes and need reassurance. And who better to offer it than a chicken exclaiming: "WOO HOO! YOU'RE DOING GREAT!"<br> <br> The ideal gift to cheer on kids and adults through life's milestones--both big and small--including moving up ceremonies and graduations, birthdays, testing out a hobby, starting out somewhere new, and so much more.</p>		https://www.walmart.com/ip/Woo-Hoo-You-re-Doing-Great-Hardcover-9780316486798/1210889316
94	DIARY OF A WIMPY KID	141976294X	9781419762949	<b>In <i>Diper Överlöde</i>, book 17 of the Diary of a Wimpy Kid series from #1 international bestselling author Jeff Kinney, Greg Heffley is finding out that the road to fame and glory comes with some hard knocks.</b><br> <br> <br> <br> When he decides to tag along with his brother Rodrick's band, Löded Diper, Greg doesn't realize what he's getting into. But he soon learns that late nights, unpaid gigs, fighting between band members, and money troubles are all part of the rock 'n' roll lifestyle.<br> <br> <br> <br> Can Greg help Löded Diper become the legends they think they are? Or will too much time with Rodrick's band be a diper överlöde?	Written and illustrated by Jeff Kinney	https://www.walmart.com/ip/Diary-of-a-Wimpy-Kid-Diper-verl-de-Diary-of-a-Wimpy-Kid-Book-17-Series-17-Hardcover-9781419762949/909171066
95	A GOOD GIRL'S GUIDE TO MURDER	1984896393	9781984896391	<b>THE MUST-READ MULTIMILLION BESTSELLING MYSTERY SERIES • Everyone is talking about <i>A Good Girl's Guide to Murder</i>! With shades of Serial and Making a Murderer this is the story about an investigation turned obsession, full of twists and turns and with an ending you'll never expect.</b><br><br>Everyone in Fairview knows the story.<br><br>Pretty and popular high school senior Andie Bell was murdered by her boyfriend, Sal Singh, who then killed himself. It was all anyone could talk about. And five years later, Pip sees how the tragedy still haunts her town.<br><br>But she can't shake the feeling that there was more to what happened that day. She knew Sal when she was a child, and he was always so kind to her. How could he possibly have been a killer?<br><br>Now a senior herself, Pip decides to reexamine the closed case for her final project, at first just to cast doubt on the original investigation. But soon she discovers a trail of dark secrets that might actually prove Sal innocent . . . and the line between past and present begins to blur. Someone in Fairview doesn't want Pip digging around for answers, and now her own life might be in danger.<br><br><br><b>And don't miss the sequel, </b><i><b>Good Girl, Bad Blood!</b> </i><br><br><b>"The perfect nail-biting mystery." —Natasha Preston, #1 <i>New York Times </i>bestselling author</b>		https://www.walmart.com/ip/Good-Girl-s-Guide-to-Murder-9781984896391/192090257
96	THE ONE AND ONLY	0063080087	9780063080089	<p>An instant #1 New York Times bestseller!</p><p>From beloved powerhouse author Katherine Applegate comes The One and Only Ruby, starring the adorable baby elephant from the Newbery Medal-winning modern classic The One and Only Ivan and its bestselling sequel, The One and Only Bob. </p><p>Ruby's story picks up a few months after the events of The One and Only Bob. Now living in a wildlife sanctuary, Ruby's caretaker from the elephant orphanage in Africa where she grew up is visiting. Seeing him again brings back a flood of memories both happy and sad of her life before the circus, and she recounts the time she spent in the African savannah to Ivan and Bob.</p><p>In the timeless way that only Katherine Applegate could craft, this highly anticipated novel in verse is the perfect mix of heartfelt and humorous, poignant and sweet. Artist Patricia Castelao returns to the world of Ivan and his friends with gorgeous black-and-white interior illustrations to complete the story.</p><p>The One and Only Ruby features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p><p>This middle grade novel is an excellent choice for tween readers in grades 5 to 8, for independent reading, homeschooling, and sharing in the classroom.</p><p>Don't miss the film adaptation of The One and Only Ivan, now streaming on Disney+!</p>		https://www.walmart.com/ip/The-One-and-Only-Ruby-Hardcover-9780063080089/1934831947
97	THE SUMMER I TURNED PRETTY TRILOGY	1416968296	9781416968290	<b><b>Now an Original Series on Prime Video!</b><br> <br><b>Belly has an unforgettable summer in this stunning start to the Summer I Turned Pretty series from the <i>New York Times</i> bestselling author of <i>To All the Boys I’ve Loved Before</i> (now a major motion picture!), Jenny Han.</b></b><br><br><i>Some summers are just destined to be pretty.</i><br> <br>Belly measures her life in summers. Everything good, everything magical happens between the months of June and August. Winters are simply a time to count the weeks until the next summer, a place away from the beach house, away from Susannah, and most importantly, away from Jeremiah and Conrad. They are the boys that Belly has known since her very first summer—they have been her brother figures, her crushes, and everything in between. But one summer, one wonderful and terrible summer, the more everything changes, the more it all ends up just the way it should have been all along.		https://www.walmart.com/ip/Summer-I-Turned-Pretty-The-Summer-I-Turned-Pretty-Paperback-9781416968290/11975370
98	THE HUNGER GAMES	1338635174	9781338635171	<b>Ambition will fuel him.</b><b>Competition will drive him.</b><b>But power has its price.</b><p></p>It is the morning of the reaping that will kick off the tenth annual Hunger Games. In the Capitol, eighteen-year-old Coriolanus Snow is preparing for his one shot at glory as a mentor in the Games. The once-mighty house of Snow has fallen on hard times, its fate hanging on the slender chance that Coriolanus will be able to outcharm, outwit, and outmaneuver his fellow students to mentor the winning tribute. The odds are against him. He's been given the humiliating assignment of mentoring the female tribute from District 12, the lowest of the low. Their fates are now completely intertwined -- every choice Coriolanus makes could lead to favor or failure, triumph or ruin. Inside the arena, it will be a fight to the death. Outside the arena, Coriolanus starts to feel for his doomed tribute... and must weigh his need to follow the rules against his desire to survive no matter what it takes.		https://www.walmart.com/ip/Hunger-Games-The-Ballad-of-Songbirds-and-Snakes-a-Hunger-Games-Novel-Hardcover-9781338635171/747291272
99	HARRY POTTER	059035342X	9780590353427	Harry Potter has never been the star of a Quidditch team, scoring points while riding a broom far above the ground. He knows no spells, has never helped to hatch a dragon, and has never worn a cloak of invisibility.All he knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley - a great big swollen spoiled bully. Harry's room is a tiny closet at the foot of the stairs, and he hasn't had a birthday party in eleven years.But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to an incredible place that Harry - and anyone who reads about him - will find unforgettable.For it's there that he finds not only friends, aerial sports, and magic in everything from classes to meals, but a great destiny that's been waiting for him... if Harry can survive the encounter.		https://www.walmart.com/ip/Harry-Potter-Harry-Potter-and-the-Sorcerer-s-Stone-Series-01-Paperback-9780590353427/667070
100	CAPTAIN UNDERPANTS	1338865390	9781338865394	<b>Celebrate the 25th and a half anniversary of THE ADVENTURES OF CAPTAIN UNDERPANTS with a special edition featuring a BRAND NEW 32-page DOG MAN comic!</b><p></p><p>George and Harold are best friends who enjoy making their own comic books. Together they've created the greatest superhero in the history of their elementary school: Captain Underpants! His true identity is SO secret, even HE doesn't know who he is! Tra-la-laaaaa! It's can't-miss fun!</p><p>After the Captain Underpants adventure, join George and Harold as they share their never-before-seen bonus comics: <i>Captain Underpants Meets Dog Man</i> and <i>Dog Man and the League of Misfits</i>.</p><p><i>The Adventures of Captain Underpants</i> is the first book in the worldwide bestselling Captain Underpants series by Dav Pilkey. Dive into the newest graphic novel in the Dog Man series: <b>Dog Man: Twenty Thousand Fleas Under the Sea</b>. For even more adventures, creativity, and humor, join Flippy and Li'l Petey in the <b>Cat Kid Comic Club</b> series. Reading gives you superpowers!</p>	Written and illustrated by Dav Pilkey	https://www.walmart.com/ip/Captain-Underpants-The-Adventures-of-Captain-Underpants-Now-with-a-Dog-Man-Comic-25-1-2-Anniversary-Edition-Hardcover-9781338865394/738685319
101	PERCY JACKSON & THE OLYMPIANS	1484707230	9781484707234	All five books in the blockbuster Percy Jackson and the Olympians series, in paperback, have been collected in a boxed set fit for demigods. Now with glorious new cover art and packaged with a special poster, this value-priced set includes the best-selling The Lightning Thief, The Sea of Monsters, The Titan's Curse, The Battle of the Labyrinth, and The Last Olympian. Whether it is for readers who are experiencing Percy's thrilling adventures with Greek gods and monsters for the first time, or for fans who want to devour the saga again, this gift will be prized by young and old.		https://www.walmart.com/ip/Percy-Jackson-the-Olympians-Percy-Jackson-and-the-Olympians-5-Book-Paperback-Boxed-Set-W-Poster-Mixed-media-product-9781484707234/29454736
102	THE INHERITANCE GAMES	0759555400	9780759555402	<b>OVER 2 MILLION COPIES SOLD OF THE #1 BESTSELLING SERIES!<br> <br> <br> <br> Don't miss this <i>New York Times</i> bestselling "impossible to put down" (Buzzfeed) novel with deadly stakes, thrilling twists, and juicy secrets -- perfect for fans of <i>One of Us is Lying</i> and <i>Knives Out</i>.</b><br> <br> <br> <br> Avery Grambs has a plan for a better future: survive high school, win a scholarship, and get out. But her fortunes change in an instant when billionaire Tobias Hawthorne dies and leaves Avery virtually his entire fortune. The catch? Avery has no idea why -- or even who Tobias Hawthorne is.<br> <br> <br> <br> To receive her inheritance, Avery must move into sprawling, secret passage-filled Hawthorne House, where every room bears the old man's touch -- and his love of puzzles, riddles, and codes. Unfortunately for Avery, Hawthorne House is also occupied by the family that Tobias Hawthorne just dispossessed. This includes the four Hawthorne grandsons: dangerous, magnetic, brilliant boys who grew up with every expectation that one day, they would inherit billions. Heir apparent Grayson Hawthorne is convinced that Avery must be a conwoman, and he's determined to take her down. His brother, Jameson, views her as their grandfather's last hurrah: a twisted riddle, a puzzle to be solved. Caught in a world of wealth and privilege with danger around every turn, Avery will have to play the game herself just to survive.<br> <br> <br> <br> **<i>Avery's story continues in</i> The Hawthorne Legacy <i>and</i> The Final Gambit		\N
103	WINGS OF FIRE	1338883194	9781338883190	<b>Discover where it all began! The #1 <i>New York Times </i>and <i>USA Today </i>bestselling series takes flight in this epic adventure of five dragons destined and determined to save their world.</b><p></p><p>Clay has lived his whole life under the mountain. The MudWing dragonet knows that war is raging between the dragon tribes in the world outside -- a war that he and four other dragonets are destined to end, according to the mysterious Prophecy they've been taught. The five "chosen" dragonets were stolen from their homes while they were still in their eggs and hidden away ever since -- all to fulfill the Prophecy.</p><p></p><p>But not every dragonet wants a destiny. And when danger threatens one of their own, Clay and his friends must choose freedom over fate . . . leave the mountain . . . and set the dragon world on a course that no one could have predicted.</p>		https://www.walmart.com/ip/Wings-of-Fire-The-Dragonet-Prophecy-Wings-of-Fire-1-Paperback-9781338883190/968967655
104	SOLITAIRE	1338863428	9781338863420	<b>The amazing novel that introduced Nick and Charlie from HEARTSTOPPER -- and the unforgettable Tori Spring.</b><p></p><p>Tori Spring isn't sure how to be happy again. Then she meets Michael Holden, and they try to unmask the mysterious Solitaire (and survive high school) in Alice Oseman's stunning, unflinchinghonest debut novel, which first introduced her fan-favorite Heartstopper characters Nick and Charlie.</p>		https://www.walmart.com/ip/Solitaire-Hardcover-9781338863420/1920158803
105	FIVE SURVIVE	0593374169	9780593374160	<b>Eight hours. Six friends. Five survive. A road trip turns deadly in this addictive YA thriller from the bestselling author of the worldwide phenomenon A GOOD GIRL'S GUIDE TO MURDER. </b><br><br>Red Kenny is on a road trip for spring break with five friends: Her best friend - the older brother - his perfect girlfriend - a secret crush - a classmate - and a killer. <br><br>When their RV breaks down in the middle of nowhere with no cell service, they soon realize this is no accident. They have been trapped by someone out there in the dark, someone who clearly wants one of them dead.<br><br>With eight hours until dawn, the six friends must escape, or figure out which of them is the target. But is there a liar among them? Buried secrets will be forced to light and tensions inside the RV will reach deadly levels. Not all of them will survive the night. . . .		https://www.walmart.com/ip/Five-Survive-Hardcover-9780593374160/733279476
106	NICK AND CHARLIE	1338885103	9781338885101	<p>From the mega-bestselling creator of <i>Heartstopper</i>, a must-have novella in which <i>Heartstopper's</i> lead characters, Nick and Charlie, face one of their biggest challenges yet.</p><p></p><p><i>Absence makes the heart grow fonder... right? </i></p><p>Everyone knows that Nick and Charlie love their nearly inseparable life together. But soon Nick will be leaving for university, and Charlie, a year younger, will be left behind. Everyone's asking if they're staying together, which is a stupid question... or at least that's what Nick and Charlie assume at first.</p><p>As the time to say goodbye gets inevitably closer, both Nick and Charlie start to question whether their love is strong enough to survive being apart. Charlie is sure he's holding Nick back... and Nick can't tell what Charlie's thinking.</p><p>Things spiral from there.</p><p>Everyone knows that first loves rarely last forever. What will it take for Nick and Charlie to defy the odds?</p>		https://www.walmart.com/ip/Nick-and-Charlie-Hardcover-9781338885101/1982451356
107	WARRIOR GIRL UNEARTHED	1250766583	9781250766588	<p><b>An Instant <i>New York Times</i> bestseller!<br>#1 Indies Bestseller!<br>An Amazon Best Book of the Month!<br>An Indigo Teen Staff Pick of the Month!<br>An Indie Next Pick!</b><br><b>FIVE STARRED REVIEWS FOR <i>WARRIOR GIRL UNEARTHED</i>!</b><b><br><br>#1 New York Times bestselling author of Firekeeper's Daughter Angeline Boulley takes us back to Sugar Island in this high-stakes thriller about the power of discovering your stolen history.</b><br><br>Perry Firekeeper-Birch has always known who she is - the laidback twin, the troublemaker, the best fisher on Sugar Island. Her aspirations won't ever take her far from home, and she wouldn't have it any other way. But as the rising number of missing Indigenous women starts circling closer to home, as her family becomes embroiled in a high-profile murder investigation, and as greedy grave robbers seek to profit off of what belongs to her Anishinaabe tribe, Perry begins to question everything. <br><br>In order to reclaim this inheritance for her people, Perry has no choice but to take matters into her own hands. She can only count on her friends and allies, including her overachieving twin and a charming new boy in town with unwavering morals. Old rivalries, sister secrets, and botched heists cannot - will not - stop her from uncovering the mystery before the ancestors and missing women are lost forever.<br><br><b>Sometimes, the truth shouldn't stay buried.</b></p>		\N
108	THE FIRST TO DIE AT THE END	0063240807	9780063240803	<p>In this prequel to the bestselling phenomenon They Both Die at the End, two new strangers spend a life-changing day together after Death-Cast first makes their fateful calls. #1 New York Times bestseller!</p> <p>It's the night before Death-Cast goes live, and there's one question on everyone's mind: Can Death-Cast actually predict when someone will die, or is it just an elaborate hoax?</p> <p>Orion Pagan has waited years for someone to tell him that he's going to die. He has a serious heart condition, and he signed up for Death-Cast so he could know what's coming.</p> <p>Valentino Prince is restarting his life in New York. He has a long and promising future ahead and he only registered for Death-Cast after his twin sister nearly died in a car accident.</p> <p>Orion and Valentino cross paths in Times Square and immediately feel a deep connection. But when the first round of End Day calls goes out, their lives are changed forever--one of them receives a call, and the other doesn't. Though neither boy is certain how the day will end, they know they want to spend it together...even if that means their goodbye will be heartbreaking.</p> <p>Told with acclaimed author Adam Silvera's signature bittersweet touch, this story celebrates the lasting impact that people have on each other and proves that life is always worth living to the fullest. </p> <p>* A Publishers Weekly Best Book of the Year *</p>		https://www.walmart.com/ip/The-First-to-Die-at-the-End-9780063240803/696176005
109	LIGHTLARK	1419760866	9781419760860	<b>An instant #1 National Bestselle</b><b>r--so</b><b>on to be a major motion picture. #BookTok phenomenon and award-winning author Alex Aster delivers readers a masterfully written, utterly gripping YA fantasy novel </b> <p> Welcome to the Centennial. <p> Every 100 years, the island of Lightlark appears to host the Centennial, a deadly game that only the rulers of six realms are invited to play. The invitation is a summons--a call to embrace victory and ruin, baubles and blood. The Centennial offers the six rulers one final chance to break the curses that have plagued their realms for centuries. Each ruler has something to hide. Each realm's curse is uniquely wicked. To destroy the curses, one ruler must die. <p> Isla Crown is the young ruler of Wildling--a realm of temptresses cursed to kill anyone they fall in love with. They are feared and despised, and are counting on Isla to end their suffering by succeeding at the Centennial. <p> To survive, Isla must lie, cheat, and betray...even as love complicates everything. <p><b>Filled with secrets, deception, romance, and twists worthy of the darkest thrillers, <i>Lightlark </i>is a must-read for fans of legendary fantasy writers Marie Lu, Marissa Meyer, and Leigh Bardugo. </b>		https://www.walmart.com/ip/The-Lightlark-Saga-Lightlark-the-Lightlark-Saga-Book-1-Hardcover-9781419760860/585961876
110	THE LITTLE MERMAID: AGAINST THE TIDE	1368077226	9781368077224	<b>An original novel written by <i>New York Times</i> best-selling author J. Elle inspired by Disney upcoming live action reimagining of <i>The Little Mermaid</i>.</b><br> <br> After the death of Ariel's mother, the queen of the sea, the seven daughters of King Triton have grown estranged at best. It's been years since Ariel's older sisters have visited home. But this year's Coral Moon is fast approaching, and it's a special one for Ariel. Finally fifteen, she will be dubbed the Protector of her very own ocean territory as is tradition, and her sisters have agreed to visit for the celebration.<br> <br> But the ceremony is halted when Mala, one of the most renowned daughters of Triton, is abducted. The only clue to where she might have been taken is a hastily scribbled seaweed note, which says, "What could have saved Mother could save me, too." To rescue Mala, Ariel must work together with her siblings, traveling to various seas, outsmarting dangerous ocean creatures, and delving into forbidden waters to find the truth of what happened to their mother. But as Ariel and her sisters begin uncovering new secrets about their family and their kingdom, Ariel will have to face the loss of a mother she never had a chance to know and discover what it means to be both a good sister and a strong leader.<br> <br> And the clock is ticking, because on the day of the festival, when the moon turns a true shade of coral, her sister will be lost, like her mother, forever.		https://www.walmart.com/ip/The-Little-Mermaid-Against-the-Tide-Hardcover-9781368077224/1538756037
111	I HAVE SOMETHING TO TELL YOU—FOR YOUNG ADULTS	1665904372	9781665904377	<b>An instant <i>New York Times</i> bestseller!</b><br> <br><b>The young adult adaptation of the hopeful and refreshingly candid bestselling memoir by the husband of a former Democratic presidential candidate about growing up gay in his small Midwestern town. Completely rewritten with new stories, including resources for readers, parents, and teachers.</b><br><br>Growing up, Chasten Glezman Buttigieg didn’t always fit in. He felt different from his father and brothers, who loved to hunt and go camping, and out of place in the rural, conservative small town where he lived. Back then, blending in was more important than feeling seen.<br> <br>So, when Chasten realized he was gay, he kept that part of himself hidden away for a long, painful time. With incredible bravery, and the support of his loved ones, Chasten eventually came out—and when he did, he learned that being true to himself was the most rewarding journey of all.<br> <br>Finding acceptance and self-love can seem like a tremendous challenge, but it’s never impossible. With honesty, courage, and warmth, Chasten relays his experience of growing up in America and embracing his identity, while inspiring young people across the country to do the same.		\N
112	SILVER IN THE BONE	0593481658	9780593481653	<b>#1 <i>New York Times</i> bestselling author Alexandra Bracken cements her status as one of the top fantasy authors writing today in this stunning series opener inspired by Arthurian legend and fueled by love, revenge, and pure adrenaline!</b><br><br>Tamsin Lark didn’t ask to be a Hollower. As a mortal with no magical talent, she was never meant to break into ancient crypts, or compete with sorceresses and Cunningfolk for the treasures inside. But after her thieving foster father disappeared without so much as a goodbye, it was the only way to keep herself—and her brother, Cabell—alive.<br><br>Ten years later, rumors are swirling that her guardian vanished with a powerful ring from Arthurian legend. A run-in with her rival Emrys ignites Tamsin’s hope that the ring could free Cabell from a curse that threatens both of them. But they aren’t the only ones who covet the ring.<br><br>As word spreads, greedy Hollowers start circling, and many would kill to have it for themselves. While Emrys is the last person Tamsin would choose to partner with, she needs all the help she can get to edge out her competitors in the race for the ring. Together, they dive headfirst into a vipers’ nest of dark magic, exposing a deadly secret with the power to awaken ghosts of the past and shatter her last hope of saving her brother. . . .		https://www.walmart.com/ip/Silver-in-the-Bone-Silver-in-the-Bone-Hardcover-9780593481653/1254127135
113	IMOGEN, OBVIOUSLY	0063045877	9780063045873	<p>With humor and insight, #1 New York Times bestseller Becky Albertalli explores the nuances of sexuality, identity, and friendship in this timely new novel.</p> <p>Imogen Scott may be hopelessly heterosexual, but she's got the World's Greatest Ally title locked down.</p> <p>She's never missed a Pride Alliance meeting. She knows more about queer media discourse than her very queer little sister. She even has two queer best friends. There's Gretchen, a fellow high school senior, who helps keep Imogen's biases in check. And then there's Lili--newly out and newly thriving with a cool new squad of queer college friends.</p> <p>Imogen's thrilled for Lili. Any ally would be. And now that she's finally visiting Lili on campus, she's bringing her ally A game. Any support Lili needs, Imogen's all in.</p> <p>Even if that means bending the truth, just a little.</p> <p>Like when Lili drops a tiny queer bombshell: she's told all her college friends that Imogen and Lili used to date. And none of them know that Imogen is a raging hetero--not even Lili's best friend, Tessa.</p> <p>Of course, the more time Imogen spends with chaotic, freckle-faced Tessa, the more she starts to wonder if her truth was ever all that straight to begin with. . .</p>		https://www.walmart.com/ip/Imogen-Obviously-Hardcover-9780063045873/1824429447
114	THE WISDOM OF THE BULLFROG	1538707942	9781538707944	<b>THE INSTANT #1 <i>New York Times</i> BESTSELLER<br> <br> <br> <br> From the acclaimed, bestselling author of <i>Make Your Bed</i>--a short, inspirational book of advice and leadership lessons that Admiral McRaven collected over his four decades as a Navy SEAL.</b><br> <br> <br> <br> The title "Bullfrog" is given to the Navy SEAL who has served the longest on active duty. Admiral McRaven was honored to receive this honor in 2011 when he took charge of the United States Special Operations Command. When McRaven retired in 2014, he had 37 years as a Navy SEAL under his belt, leading men and women at every level of the special operations community. In the ensuing four years, he served as Chancellor to the entire University of Texas System, with its 230,000 students and 100,000 faculty and health care workers.<br> <br> <br> <br> During those four decades, Admiral McRaven dealt with every conceivable leadership challenge, from commanding combat operations--including the capture of Saddam Hussein, the rescue of Captain Phillips, and the raid for Osama bin Laden. <br> <br> <br> <br> THE WISDOM OF THE BULLFROG draws on these and countless other experiences from Admiral McRaven's incredible life, including crisis situations, management debates, organizational transitions, and ethical dilemmas, to provide readers with the most important leadership lessons he has learned over the course of his forty years of service. Each chapter provides a <i>Make Your Bed</i>-like parable, rich with insights like those featured in his bestselling memoir, <i>Sea Stories</i>, about the specific leadership traits required to be at the top of your game, including: <ul> <li>Who Dares, Wins</li> <li>Run to the Sound of the Guns</li> <li>No Plan Survives First Contact with the Enemy</li> </ul> THE WISDOM OF THE BULLFROG is Admiral McRaven's clear-eyed treatise on the leadership qualities that separate the good from the truly great.		https://www.walmart.com/ip/The-Wisdom-of-the-Bullfrog-Leadership-Made-Simple-But-Not-Easy-Hardcover-9781538707944/1956892337
115	DARE TO LEAD	0399592520	9780399592522	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • Brené Brown has taught us what it means to dare greatly, rise strong, and brave the wilderness. Now, based on new research conducted with leaders, change makers, and culture shifters, she’s showing us how to put those ideas into practice so we can step up and lead.<br><br><b>Don’t miss the five-part HBO Max docuseries <i>Brené Brown: Atlas of the Heart</i>!</b><br><br>NAMED ONE OF THE BEST BOOKS OF THE YEAR BY </b><i><b>BLOOMBERG</b><br></i><br> Leadership is not about titles, status, and wielding power. A leader is anyone who takes responsibility for recognizing the potential in people and ideas, and has the courage to develop that potential.<br><br> When we dare to lead, we don’t pretend to have the right answers; we stay curious and ask the right questions. We don’t see power as finite and hoard it; we know that power becomes infinite when we share it with others. We don’t avoid difficult conversations and situations; we lean into vulnerability when it’s necessary to do good work.<br><br> But daring leadership in a culture defined by scarcity, fear, and uncertainty requires skill-building around traits that are deeply and uniquely human. The irony is that we’re choosing not to invest in developing the hearts and minds of leaders at the exact same time as we’re scrambling to figure out what we have to offer that machines and AI can’t do better and faster. What can <i>we</i> do better? Empathy, connection, and courage, to start.<br><br> Four-time #1 <i>New York Times</i> bestselling author Brené Brown has spent the past two decades studying the emotions and experiences that give meaning to our lives, and the past seven years working with transformative leaders and teams spanning the globe. She found that leaders in organizations ranging from small entrepreneurial startups and family-owned businesses to nonprofits, civic organizations, and Fortune 50 companies all ask the same question: <br><br> <b>How do you cultivate braver, more daring leaders, and how do you embed the value of courage in your culture? </b><br><br> In this new book, Brown uses research, stories, and examples to answer these questions in the no-BS<i> </i>style that millions of readers have come to expect and love.<br><br> Brown writes, “One of the most important findings of my career is that daring leadership is a collection of four skill sets that are 100 percent teachable, observable, and measurable. It’s learning and unlearning that requires brave work, tough conversations, and showing up with your whole heart. Easy? No. Because choosing courage over comfort is not always our default. Worth it? Always. We want to be brave with our lives and our work. It’s why we’re here.”<br><br>Whether you’ve read <i>Daring Greatly </i>and<i> Rising Strong</i> or you’re new to Brené Brown’s work, this book is for anyone who wants to step up and into brave leadership.		https://www.walmart.com/ip/Dare-to-Lead-Brave-Work-Tough-Conversations-Whole-Hearts-9780399592522/895520119
116	EXTREME OWNERSHIP	1250183863	9781250183866	<p><b>From Jocko Wilnick, the <i>New York Times</i> best selling author of <i>Discipline Equals Freedom</i> and <i>Leadership Strategy and Tactics</i>, an updated edition of the blockbuster bestselling leadership book that took America and the world by storm, two U.S. Navy SEAL officers who led the most highly decorated special forces unit of the Iraq War demonstrate how to apply powerful leadership principles from the battlefield to business and life. Now with an excerpt from the authors' new book, THE DICHOTOMY OF LEADERSHIP. </b><br><br>Combat, the most intense and dynamic environment imaginable, teaches the toughest leadership lessons, with absolutely everything at stake. Jocko Willink and Leif Babin learned this reality first-hand on the most violent and dangerous battlefield in Iraq. As leaders of SEAL Team Three’s Task Unit Bruiser, their mission was one many thought impossible: help U.S. forces secure Ramadi, a violent, insurgent-held city deemed “all but lost.” In gripping, firsthand accounts of heroism, tragic loss, and hard-won victories, they learned that leadership—at every level—is the most important factor in whether a team succeeds or fails. <br><br>Willink and Babin returned home from deployment and instituted SEAL leadership training to pass on their harsh lessons of self-discipline, mental toughness and self-defense learned in combat to help forge the next generation of SEAL leaders. After leaving the SEAL Teams, they launched a company, Echelon Front, to teach those same leadership principles to leaders in businesses, companies, and organizations across the civilian sector. Since that time, they have trained countless leaders and worked with hundreds of companies in virtually every industry across the U.S. and internationally, teaching them how to develop their own high-performance teams and most effectively lead those teams to dominate their battlefields.<br><br>Since it’s release in October 2015, <i>Extreme Ownership</i> has revolutionized leadership development and set a new standard for literature on the subject. Required reading for many of the most successful organizations, it has become an integral part of the official leadership training programs for scores of business teams, military units, and first responders. Detailing the resilient mindset and total focus principles that enable SEAL units to accomplish the most difficult combat missions, Extreme Ownership demonstrates how to apply them to any team or organization, in any leadership environment. A compelling narrative with powerful instruction and direct application, <i>Extreme Ownership</i> challenges leaders everywhere to fulfill their ultimate purpose: lead and win.</p>		https://www.walmart.com/ip/Extreme-Ownership-How-U-S-Navy-Seals-Lead-and-Win-9781250183866/56088894
117	PARIS	0063224623	9780063224629	<p>From the woman who is credited for launching what we know as the celebrity focused, "brand" driven, social media obsessed popular culture of today, comes an honest and surprising memoir that reckons with that truth, and shows that there is so much more to Paris Hilton than you might believe.</p> <p>I was born in New York City on February 17, 1981, three days after Valentine's Day. </p> <p>From the time I was a toddler, my brain skipped and flickered with the chemical imbalance of ADHD. Sometimes it was too much.</p> <p>I'm not bragging or complaining about it, just telling you: This is my brain. It has a lot to do with how this whole book thing is going to play out, because I love run-on sentences--and dashes. And sentence fragments. I'm probably going to jump around a lot while I tell the story.</p> <p>I came of age during the most turbulent pop culture period ever.</p> <p>The character I played--part Lucy, part Marilyn--was my steel-plated armor.</p> <p>People loved her. Or they loved to hate her, which was just as marketable. I leaned into that character, my ticket to financial freedom and a safe place to hide. I made sure I never had a quiet moment to figure out who I was without her. I was afraid of that moment because I didn't know what I'd find.</p> <p>I wrote this book in an effort to understand my place in a watershed moment: the technology renaissance, the age of influencers. I also wrote this book so that the world could know who I am today. I focused on key aspects of my life that led to what I am most proud of--how my power was taken away from me and how I took it back, how I built a thriving business, a marriage and a family.</p> <p>There are so many young women who need to hear this story. I don't want them to learn from my mistakes; I want them to stop hating themselves for their own mistakes. I want them to laugh and cry and embrace every aspect of who they are with fearlessness and pride. We all have our own brand of intelligence, and, girl, fuck fitting in.</p>		https://www.walmart.com/ip/Paris-The-Memoir-Hardcover-9780063224629/1577003196
118	TWENTY THOUSAND FLEAS UNDER THE SEA	1338801910	9781338801910	<b>DOG MAN IS BACK! The highly anticipated new graphic novel in the #1 worldwide bestselling series starring everyone's favorite canine superhero by award-winning author and illustrator Dav Pilkey!</b><p></p><p>Piggy has returned, and his newest plot is his most diabolical yet. WHAT other new villains are on the horizon? WHERE are they all coming from? And WHO will step forward to save the city when scoundrels sabotage our Supa Buddies?</p><p>With themes of friendship and doing good, <i>Dog Man: Twenty Thousand Fleas Under the Sea</i> is packed with action and hilarity. Featuring "Chomp-O-Rama," a brand-new song, a monstrous Mighty Mite -- and so much more than ever before! IT'S HEROIC, IT'S EPIC!</p><p>For more creative, heartfelt adventures, join Flippy and Li'l Petey in the <b>Cat Kid Comic Club</b> series. And don't forget the series that started it all: Captain Underpants! A new edition of <i>The Adventures of Captain Underpants</i> includes <b>a brand new Dog Man comic!</b> Look for <b>Dog Man with Love: The Official Coloring Book</b>, too!</p>		https://www.walmart.com/ip/Dog-Man-Twenty-Thousand-Fleas-Under-the-Sea-A-Graphic-Novel-Dog-Man-11-From-the-Creator-of-Captain-Underpants-Hardcover-9781338801910/1655299107
119	COLLABORATIONS	1338846620	9781338846621	<b>The Cat Kid Comic Club learns to collaborate in this creative, funny, and insightful graphic novel by Dav Pilkey, the author and illustrator of Dog Man.</b><p></p><p>Excitement and imagination run wild as Naomi, Melvin, Poppy, Gilbert, Curly, and their siblings get back to making comics with originality and laughter. But wait -- have they cleaned their rooms yet?!</p><p>After their chores, the rambunctious group presents even more amazing mini-comics: a thrilling ride in "Chubbs McSpiderbutt," an action-packed romp in "Frogzilla," reflective haikus in "In the Autumn Pond," a candy-coated mystery in "Mallo Cop," and much, much more. By working together, the baby frogs discover that small things can have a huge impact.</p><p>In this innovative graphic novel series, award-winning author and illustrator Dav Pilkey employs a variety of techniques -- including origami, acrylic paints, colored pencils, photography, collage, gouache, watercolors, and more -- to capture the creative and joyful spirit of collaboration. The variety of art styles, paired with Pilkey's trademark storytelling and humor, inspires imagination and innovation for readers of all ages.</p>		https://www.walmart.com/ip/Cat-Kid-Comic-Club-Cat-Kid-Comic-Club-Collaborations-A-Graphic-Novel-Cat-Kid-Comic-Club-4-From-the-Creator-of-Dog-Man-Hardcover-9781338846621/604431043
120	MOTHERING HEIGHTS	1338680455	9781338680454	Dog Man and Petey face their biggest challenges yet in the tenth Dog Man book from worldwide bestselling author and illustrator Dav Pilkey.<p></p><p>Dog Man is down on his luck, Petey confronts his not so purr-fect past, and Grampa is up to no good. The world is spinning out of control as new villains spill into town. Everything seems dark and full of despair. But hope is not lost. Can the incredible power of love save the day?</p><p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including love, empathy, kindness, persistence, and the importance of doing good.</p>		https://www.walmart.com/ip/Dog-Man-Dog-Man-Mothering-Heights-A-Graphic-Novel-Dog-Man-10-From-the-Creator-of-Captain-Underpants-Volume-10-Series-10-Hardcover-9781338680454/547544257
121	MOON RISING	1338730894	9781338730890	<b>The graphic novel adaptations of the #1 New York Times bestselling Wings of Fire series continue to set the world on fire!</b><p></p><p>Peace has come to Pyrrhia... for now.</p><p></p><p>The war between the tribes is finally over, and now the dragonets of the prophecy have a plan for lasting peace: Jade Mountain Academy, a school that will gather dragonets from all the tribes and teach them to live together, perhaps even as friends.</p><p></p><p>Moonwatcher isn't sure how she feels about school, however. Hidden in the rainforest for most of her life, the young NightWing has an awful secret. She can read minds, and even see the future. Living in a cave with dozens of other dragons is noisy, exhausting--and dangerous.</p><p></p><p>In just a few days, Moon finds herself overwhelmed by her secret powers and bombarded by strange thoughts, including those of a mysterious dragon who might be a terrible enemy. And when someone starts attacking dragons within the academy, Moon has a choice to make: Stay hidden and safe? Or risk everything to save her new friends?</p><p></p><p></p><p>The #1 <i>New York Times</i> bestselling Wings of Fire series soars to new heights in the sixth graphic novel adaptation, with art by Mike Holmes.</p>	Illustrated by Mike Holmes	https://www.walmart.com/ip/Wings-of-Fire-Graphix-Moon-Rising-A-Graphic-Novel-Wings-of-Fire-Graphic-Novel-6-Paperback-9781338730890/799647988
122	GRIME AND PUNISHMENT	1338535625	9781338535624	<b>The next great Dog Man adventure from the worldwide bestselling author and artist Dav Pilkey. You'll howl with laughter </b><br><br> The Supa Buddies bamboozled the baddies, but all's not right in the world. Dog Man has a new problem to pound, and he's going to need his entire pack to help him. Will he go barking up the wrong tree?<br><br> Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of doing good.		https://www.walmart.com/ip/Dog-Man-Dog-Man-Grime-and-Punishment-A-Graphic-Novel-Dog-Man-9-From-the-Creator-of-Captain-Underpants-Volume-9-Series-9-Hardcover-9781338535624/401704483
124	ONE PIECE, VOL. 102	1974736555	9781974736553	<b>Join Monkey D. Luffy and his swashbuckling crew in their search for the ultimate treasure, One Piece!</b><br><br>As a child, Monkey D. Luffy dreamed of becoming King of the Pirates. But his life changed when he accidentally gained the power to stretch like rubber...at the cost of never being able to swim again! Years later, Luffy sets off in search of the One Piece, said to be the greatest treasure in the world...<br><br>Luffy is back to face Kaido once again, but does he stand any more of a chance in this rematch against the strongest man alive? And on other parts of the island, Sanji and Zolo go up against Kaido’s strongest warriors. Both will need to raise their fighting skills in order to overcome these adversaries!		\N
127	MARY ANNE'S BAD LUCK MYSTERY	1338616102	9781338616101	<b>A brand-new Baby-sitters Club graphic novel adapted by newcomer Cynthia Yuan Cheng!</b><p></p><p>Mary Anne should never have thrown away that chain letter she got in the mail. Ever since she did, bad things have been happening to everyone in The Baby-sitters Club. With Halloween coming up, Mary Anne's even more worried -- what kind of spooky thing will happen next?</p><p>Then Mary Anne finds a new note in her mailbox: <i>Wear this bad-luck charm</i>, it says. <i>OR ELSE.</i> Mary Anne has to follow the note's instructions. But who sent the charm? And why did they send it to Mary Anne?</p><p>The BSC might never see an end to their bad luck if they don't solve this mystery soon!</p>	Illustrated by Cynthia Yuan Cheng	https://www.walmart.com/ip/Baby-Sitters-Club-Graphix-Mary-Anne-s-Bad-Luck-Mystery-A-Graphic-Novel-the-Baby-Sitters-Club-13-Paperback-9781338616101/773317113
128	TEENAGE MUTANT NINJA TURTLES: THE LAST RONIN	1684058414	9781684058419	<b>A <i>New York Times</i> Bestseller!Who is the Last Ronin? In a future, battle-ravaged New York City, a lone surviving Turtle embarks on a seemingly hopeless mission seeking justice for the family he lost. From legendary TMNT co-creators Kevin Eastman and Peter Laird, get ready for the final story of the Teenage Mutant Ninja Turtles three decades in the making!</b><br><br>What terrible events destroyed his family and left New York a crumbling, post-apocalyptic nightmare? All will be revealed in this climactic Turtle tale that sees longtime friends becoming enemies and new allies emerging in the most unexpected places. Can the surviving Turtle triumph?<br><br>Eastman and Laird are joined by writer <b>Tom Waltz</b>, who penned the first 100 issues of IDW's ongoing TMNT series, and artists <b>Esau & Isaac Escorza</b> (<i>Heavy Metal</i>) and <b>Ben Bishop</b> (<i>The Far Side of the Moon</i>) with an Introduction by filmmaker <b>Robert Rodriguez</b>!<br><br>Collects the complete five-issue miniseries in a new graphic novel, an adventure as fulfilling for longtime Turtles fans as it is accessible for readers just discovering the heroes in a half shell.		https://www.walmart.comhttps://wrd.walmart.com/track
129	FETCH-22	1338323210	9781338323214	<b>Li'l Petey gets caught in some family drama in the eighth Dog Man book from worldwide bestselling author and artist Dav Pilkey.</b><br></br>Petey the Cat is out of jail, and he has a brand-new lease on life. While Petey's reevaluated what matters most, Li'l Petey is struggling to find the good in the world. Can Petey and Dog Man stop fighting like cats and dogs long enough to put their paws together and work as a team? They need each other now more than ever -- Li'l Petey (and the world) is counting on them! <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of doing good.		https://www.walmart.com/ip/Dog-Man-Dog-Man-Fetch-22-A-Graphic-Novel-Dog-Man-8-From-the-Creator-of-Captain-Underpants-Volume-8-Series-8-Hardcover-9781338323214/463057477
130	SPY X FAMILY, VOL. 9	1974736288	9781974736287	<b>An action-packed comedy about a fake family that includes a spy, an assassin and a telepath!</b><br><br>Master spy Twilight is unparalleled when it comes to going undercover on dangerous missions for the betterment of the world. But when he receives the ultimate assignment—to get married and have a kid—he may finally be in over his head!<br><br>Yor’s on assignment and finds herself up against a gang of assassins on board a luxury cruiser. Meanwhile, Loid and Anya each discover that bombs have been planted throughout the ship! Will their best efforts be enough to save the vessel?		\N
125	KAIJU NO. 8, VOL. 6	1974736334	9781974736331	<b>Kafka wants to clean up kaiju, but not literally! Will a sudden metamorphosis stand in the way of his dream?</b><br><br>With the highest kaiju-emergence rates in the world, Japan is no stranger to attack by deadly monsters. Enter the Japan Defense Force, a military organization tasked with the neutralization of kaiju. Kafka Hibino, a kaiju-corpse cleanup man, has always dreamed of joining the force. But when he gets another shot at achieving his childhood dream, he undergoes an unexpected transformation. How can he fight kaiju now that he’s become one himself?!<br><br>Kafka has encountered Kaiju No. 9, but he finds himself unable to transform. Luckily, Kikoru comes to the rescue and goes head-to-head with it. Meanwhile, the Kaiju No. 9 that Captain Narumi encountered undergoes an evolution during battle! With the pressure on, Director General Shinomiya is left with no choice but to act!		https://www.walmart.com/ip/Kaiju-No-8-Kaiju-No-8-Vol-6-Series-6-Paperback-9781974736331/1789563892
126	FOR WHOM THE BALL ROLLS	1338236598	9781338236590	The Supa Buddies have been working hard to help Dog Man overcome his bad habits. But when his obsessions turn to fears, Dog Man finds himself the target of an all-new supervillain! Meanwhile, Petey the Cat has been released from jail and starts a new life with Li'l Petey. But when Petey's own father arrives, Petey must face his past to understand the difference between being good and doing good. <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of being true to one's self.		https://www.walmart.com/ip/Dog-Man-Dog-Man-For-Whom-the-Ball-Rolls-A-Graphic-Novel-Dog-Man-7-From-the-Creator-of-Captain-Underpants-Volume-7-Series-7-Hardcover-9781338236590/236144796
135	TWO ALONE	0778334449	9780778334446	The only way to stay alive is to stick together.<br> <br> When their plane crashes in the remote reaches of the Northwest Territories, confident businesswoman Rusty Carlson finds herself hurt and alone with a man she can't stand to be around. Vietnam vet Cooper Landry holds a deep-rooted grudge against beautiful women, but he's survived far worse and he'll be damned if he lets them both die in the wilderness.<br> <br> The ex-soldier's training has prepared him with the skills to defend against the predators in the dense woods--both animal and human--but that's not all that awaits the couple. What Rusty and Cooper couldn't have expected is their shared desire for more than just survival...<br> <br>		\N
137	DEATH OF THE BLACK WIDOW	1538753081	9781538753088	<b>She destroys the men she loves--and escapes every time. The most dangerous killer James Patterson has ever created is also his most seductive.</b><br> <br> <br> <br> On his first night with Detroit PD, Officer Walter O'Brien is called to a murder scene. A terrified twenty-year-old has bludgeoned her kidnapper with skill that shocks even O'Brien's veteran partner. The young woman is also a brilliant escape artist. Her bold flight from police custody makes the case impossible to solve--and, for Walter, even more impossible to forget.<br> <br> <br> <br> By the time Walter's promoted to detective, his fascination with the missing, gray-eyed woman is approaching obsession. And when Walter discovers that he's not alone in his search, one truth is certain. This deadly string of secrets didn't begin in his home city--but he's going to make sure it ends there. <br> <br>		https://www.walmart.com/ip/Death-of-the-Black-Widow-Paperback-9781538753088/1904421594
138	MERCY	1538719711	9781538719718	<b>FBI Agent Atlee Pine's harrowing search for her long-lost sister Mercy reaches a boiling point in this breakneck thriller from #1 <i>New York Times</i> bestselling author David Baldacci. </b><br> <br> <br> <br> For her entire life, FBI agent Atlee Pine has been searching for her twin sister, Mercy, who was abducted at the age of six and never seen again. Mercy's disappearance left behind a damaged family that later shattered beyond repair when Atlee's parents inexplicably abandoned her.<br> <br> <br> <br> Now, after a perilous investigation that nearly proved fatal, Atlee has finally discovered not only the reason behind her parents' abandonment and Mercy's kidnapping, but also the most promising breakthrough yet: proof that Mercy survived her abduction and then escaped her captors many years ago. <br> <br> <br> <br> Though Atlee is tantalizingly close to her family at last, the final leg of her long road to Mercy will be the most treacherous yet. Mercy left at least one dead body behind before fleeing her captors years before. Atlee has no idea if her sister is still alive, and if so, how she has been surviving all this time. When the truth is finally revealed, Atlee Pine will face the greatest danger yet, and it may well cost her everything.		https://www.walmart.com/ip/Atlee-Pine-Thriller-Mercy-Series-4-Paperback-9781538719718/1240347082
139	THE JENSENS OF COLORADO	0786050136	9780786050130	<b>THE FIRST FAMILY OF THE AMERICAN FRONTIER<br> <br><i>The national bestselling novels of William W. and J.A. Johnstone bring the American West to crackling life. Now together in one omnibus for the first time, three epic sagas of the fearless—and ever-growing—Jensen clan—pioneers willing to fight for justice.</i></b><br><br><b>THOSE JENSEN BOYS</b><br>Ace and Chance are as reckless and wild as the frontier itself. Their father is Luke Jensen, thought killed in the Civil War. Their uncle Smoke is one of the fiercest gunfighters in the West. It’s no surprise the twins have a knack for taking risks—and blasting their way out of them.<br><br><b>THE JENSEN BRAND</b><br>Smoke is injured swapping bullets with cow thieves on the Sugarloaf Ranch and Sally puts out a call for help to the rest of the Jensen clan. Just back from studying in Europe, Denise Jensen can ride like a man, shoot like her daddy, and face down the deadliest outlaws like nobody’s business.<br><br><b>HEART OF THE MOUNTAIN MAN </b><br>Smoke has no choice but to come down off the mountain and go head-to-head with outlaw Big Jim Slaughter to save his friend Monte Carson. A fiery clash of courage, fury, and guns is on the docket, and only one man will be left standing after the dust settles.		\N
136	LEGACY	1250775000	9781250775009	<p><b>#1 <i>New York Times</i> bestselling author Nora Roberts presents <i>Legacy</i>, a new novel of a mother and a daughter, of ambition and romance, and of a traumatic past reawakened by a terrifying threat...</b><br><br>Adrian Rizzo was seven when she met her father for the first time. That was the day he nearly killed her—before her mother, Lina, stepped in.<br><br>Soon after, Adrian was dropped off at her grandparents’ house in Maryland, where she spent a long summer drinking lemonade, playing with dogs, making a new best friend—and developing the stirrings of a crush on her friend’s ten-year-old brother. Lina, meanwhile, traveled the country promoting her fitness brand and turning it into a billion-dollar business. There was no point in dwelling on the past.<br><br>A decade later, Adrian has created her own line of yoga and workout videos, following in Lina’s footsteps but intent on maintaining creative control. And she’s just as cool-headed and ambitious as her mother. They aren’t close, but they’re cordial—as long as neither crosses the other.<br><br>But while Lina dismisses the death threats that Adrian starts getting as a routine part of her daughter’s growing celebrity, Adrian can’t help but find the vicious rhymes unsettling. Year after year, they keep arriving—the postmarks changing, but the menacing tone the same. They continue after she returns to Maryland and becomes reacquainted with Raylan, her childhood crush, all grown up and as gorgeously green-eyed as ever. Sometimes it even seems like the terrifying messages are indeed routine, like nothing will come of them. Until the murders start, and the escalation begins...</p>		https://www.walmart.com/ip/Legacy-Paperback-9781250775009/676513816
141	SAVE IT FOR SUNDAY	078604957X	9780786049578	<b><i>From the greatest western writers of the 21st century, the second adventure featuring circuit rider Taylor Callahan. a mysterious man in black who rides from town to town with a bible in hand and guns in his holsters, delivering the word of God and hard-fought justice…</i></b><br><br><b>From Confederate marauder to rebel gunfighter to repentant preacherman, circuit rider Taylor Callahan’s road to perdition has been a hellish ride. Sinners beware.</b><br><b> </b><br>After riding with Missouri bushwhackers, Taylor Callahan vowed to never take another life. He’s making good on it in Peaceful Valley. By day, swamping a saloon. By night, preaching the Good Book. But this little settlement is about to become anything but peaceable. When the marshal takes a bullet in a sheepman-cattleman skirmish he pins a badge on Taylor leaving the circuit rider open to whole new world of hell . . .<b> </b><br><b> </b><br>A railroad engineer building a line from Laramie to Denver is cutting across Arapaho land starting a war on Peace Treaty Peak. If that’s not enough to set the county on fire, Taylor’s trigger-happy past comes calling. The revenge-seeking Harris boys are hot on his tail. With the marshal down, Peaceful Valley is ripe for the taking—and blasting Taylor to kingdom come is part of the deal. If keeping the peace means breaking Taylor’s vow so be it. He’s looking forward to strapping on his Colt .45 again. That’s the gospel truth.		\N
143	ONE NIGHT	006108185X	9780061081859	<p>From #1 <i>New York Times</i> bestselling author Debbie Macomber comes a remarkable story of dreams awakened and lives transformed in . . . One Night </p> <p>Carrie Jamison has the success part of "having it all" down pat—but "love/marriage/family" seem just out of reach. Still, she enjoys the admiration of everyone at KUTE radio . . . well, <i>almost</i> everyone. Serious, straightlaced newscaster Kyle Harris disapproves of Carrie, which leads to tension, confrontation . . . and then, inexplicably, to one extraordinary night! </p> <p>Now Kyle's determined to make an honest woman out of her! But though her dreams seem merely an "I do" away, Carrie needs to <i>really</i> know if love or guilt is inflaming Kyle's ardor. Because if it isn't true love, this happily-ever-after is never going to happen. </p>		https://www.walmart.com/ip/Avon-Romance-One-Night-Paperback-9780061081859/533708
145	SOMEDAY WITH YOU	1335452796	9781335452795	Two classic stories about getting a second chance to embrace life and discover love!<br> <br> Cordina's Crown Jewel<br> <br> On the run from her palace, Her Royal Highness Camilla de Cordina wants to be just plain Camilla MacGee, even if it's only for a few weeks. Working in rural Vermont for the handsome yet grouchy archaeologist Delaney Caine is the perfect cover. But Camilla's irritation with the man soon turns into desire, and eventually the royal runaway knows she'll have to confess her secret...<br> <br> Unfinished Business<br> <br> Concert pianist Vanessa Sexton has finally returned to her small Maryland hometown after having her heart shattered by her high school sweetheart twelve years ago. Once a reckless boy, Brady Tucker has now become a solid, dependable man. Still, he stood her up on the most important night of her life--can she ever trust him again?		https://www.walmart.com/ip/Royals-of-Cordina-Someday-with-You-Paperback-9781335452795/593169985
146	READY FOR MARRIAGE	1335498419	9781335498410	BESTSELLING AUTHOR COLLECTION<br> Reader-favorite romances in collectible volumes from our bestselling authors.<br> <br> Ready for Marriage by #1 New York Times bestselling author Debbie Macomber Three years ago, Mary Jo Summerhill fell completely in love with Evan Dryden. But his family said she wasn't the "right kind of wife" for Evan. Mary Jo agreed--she didn't belong in his world. So she lied and broke his heart.<br> <br> But now Mary Jo's parents are facing legal trouble, and she needs Evan's professional advice. Meanwhile, Evan wants answers to all the questions he's had for the past three years. Do they have a second chance?<br> <br> FREE BONUS STORY INCLUDED IN THIS VOLUME!<br> <br> A Family for Easter by New York Times bestselling author Lee Tobin McClain<br> <br> When wealthy single mom Fiona Farmingham rents her carriage house to widowed Eduardo Delgado, it's purely in friendship. But with half a dozen little matchmakers involved, can they find the courage to reach for happiness once more?		https://www.walmart.com/ip/Ready-for-Marriage-a-Family-for-Easter-Paperback-9781335498410/1340911324
150	WISH	1250144051	9781250144058	<p><b>Don't miss Barbara O'Connor's other middle-grade work—like <i>Wonderland; How to Steal a Dog; Greetings from Nowhere; Fame and Glory in Freedom, Georgia; The Fantastic Secret of Owen Jester; </i>and more!</b><br><br><i>A touching, </i>New York Times<i>–bestselling story about a girl and her dog, perfect for young animal lovers.</i><br><br>Eleven-year-old Charlie Reese has been making the same secret wish every day since fourth grade. She even has a list of all the ways there are to make the wish, such as cutting off the pointed end of a slice of pie and wishing on it as she takes the last bite. But when she is sent to the Blue Ridge Mountains of North Carolina to live with family she barely knows, it seems unlikely that her wish will ever come true. That is until she meets <br>Wishbone, a skinny stray dog who captures her heart, and Howard, a neighbor boy who proves surprising in lots of ways. Suddenly Charlie is in serious danger of discovering that what she thought she wanted may not be what she needs at all. <br><br>From award-winning author Barbara O'Connor comes a middle-grade novel about a girl who, with the help of a true-blue friend, a big-hearted aunt and uncle, and the dog of her dreams, unexpectedly learns the true meaning of family in the least likely of places.<br><br>This title has Common Core connections.</p>		https://www.walmart.com/ip/Wish-Paperback-9781250144058/55992104
151	A LONG WALK TO WATER	0547577311	9780547577319			https://www.walmart.com/ip/A-Long-Walk-to-Water-Based-on-a-True-Story-Paperback-9780547577319/15699322
148	THE ONE AND ONLY IVAN	0061992275	9780061992278	<p>Soon to be a major motion picture!</p><p>Winner of the Newbery Medal and a #1 New York Times bestseller</p><p>This unforgettable novel from renowned author Katherine Applegate celebrates the transformative power of unexpected friendship. Inspired by the true story of a captive gorilla known as Ivan, this illustrated book is told from the point of view of Ivan himself. </p><p>Having spent twenty-seven years behind the glass walls of his enclosure in a shopping mall, Ivan has grown accustomed to humans watching him. He hardly ever thinks about his life in the jungle. Instead, Ivan occupies himself with television, his friends Stella and Bob, and painting. But when he meets Ruby, a baby elephant taken from the wild, he is forced to see their home, and his art, through new eyes.</p><p>In the tradition of timeless stories like Charlotte's Web and Stuart Little, Katherine Applegate blends humor and poignancy to create an unforgettable story of friendship, art, and hope.</p><p>The One and Only Ivan features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p><p>Plus don't miss Katherine Applegate's Endling series!</p>	Illustrated by Patricia Castelao	https://www.walmart.com/ip/The-One-and-Only-Ivan-Paperback-9780061992278/30039951
149	THE WILD ROBOT	0316382000	9780316382007	<b><i>Wall-E</i> meets <i>Hatchet</i> in this <i>New York Times </i>bestselling illustrated middle grade novel from Caldecott Honor winner Peter Brown</b><i><b><br></b></i><i>Can a robot survive in the wilderness?</i><br> When robot Roz opens her eyes for the first time, she discovers that she is all alone on a remote, wild island. She has no idea how she got there or what her purpose is--but she knows she needs to survive. After battling a violent storm and escaping a vicious bear attack, she realizes that her only hope for survival is to adapt to her surroundings and learn from the island's unwelcoming animal inhabitants. <br>As Roz slowly befriends the animals, the island starts to feel like home--until, one day the robot's mysterious past comes back to haunt her.<br>From bestselling and award-winning author and illustrator Peter Brown comes a heartwarming and action-packed novel about what happens when nature and technology collide.<br>		https://www.walmart.com/ip/Wild-Robot-The-Wild-Robot-Series-1-Paperback-9780316382007/56199040
156	OUT OF MY MIND	1416971718	9781416971719	<b>A <i>New York Times</i> bestseller for three years and counting!</b><br> <br><b>“A gutsy, candid, and compelling story. It speaks volumes.” —<i>School Library Journal </i>(starred review)</b><br> <b>“Unflinching and realistic.” —<i>Kirkus</i><i> </i><i>Reviews</i> (starred review)</b><br> <br><b>From award-winning author Sharon Draper comes a story that will forever change how we all look at anyone with a disability, perfect for fans of RJ Palacio’s <i>Wonder</i>.</b><br><br>Eleven-year-old Melody is not like most people. She can’t walk. She can’t talk. She can’t write. All because she has cerebral palsy. But she also has a photographic memory; she can remember every detail of everything she has ever experienced. She’s the smartest kid in her whole school, but NO ONE knows it. Most people—her teachers, her doctors, her classmates—dismiss her as mentally challenged because she can’t tell them otherwise. But Melody refuses to be defined by her disability. And she’s determined to let everyone know it…somehow.		https://www.walmart.com/ip/Out-of-My-Mind-Paperback-9781416971719/16382407
154	FISH IN A TREE	0142426423	9780142426425	<b>"Fans of R.J. Palacio’s <i>Wonder</i> will appreciate this feel-good story of friendship and unconventional smarts.” —<i>Kirkus Reviews</i></b><br><br>Ally has been smart enough to fool a lot of smart people. Every time she lands in a new school, she is able to hide her inability to read by creating clever yet disruptive distractions.  She is afraid to ask for help; after all, how can you cure dumb? However, her newest teacher Mr. Daniels sees the bright, creative kid underneath the trouble maker. With his help, Ally learns not to be so hard on herself and that dyslexia is nothing to be ashamed of. As her confidence grows, Ally feels free to be herself and the world starts opening up with possibilities. She discovers that there’s a lot more to her—and to everyone—than a label, and that great minds don’t always think alike.<br><br>The author of the beloved <i>One for the Murphys</i> gives readers an emotionally-charged, uplifting novel that will speak to anyone who’s ever thought there was something wrong with them because they didn’t fit in. This paperback edition includes The Sketchbook of Impossible Things and discussion questions.<br><br><b>A <i>New York Times</i> Bestseller! </b><br><br>* “Unforgettable and uplifting.”<b>—<i>School Library Connection</i>, <b>starred review</b><br><br></b>* "Offering hope to those who struggle academically and demonstrating that a disability does not equal stupidity, this is as unique as its heroine.”<b>—<i>Booklist</i>, <b>starred review</b><br><br></b>* “Mullaly Hunt again paints a nuanced portrayal of a sensitive, smart girl struggling with circumstances beyond her control." <b>—<i>School Library Journal</i>, <b>starred review</b> </b>		https://www.walmart.com/ip/Fish-in-a-Tree-Paperback-9780142426425/49368007
160	BETTER THAN THE MOVIES	1534467637	9781534467637	<b>A <i>USA TODAY</i> and <i>New York Times</i> bestseller</b><br> <br><b>Perfect for fans of Kasie West and Jenn Bennett, this “sweet and funny” (Kerry Winfrey, author of <i>Waiting for Tom Hanks</i>) teen rom-com follows a hopelessly romantic teen girl and her cute yet obnoxious neighbor as they scheme to get her noticed by her untouchable crush.</b><br><br>Perpetual daydreamer Liz Buxbaum gave her heart to Michael a long time ago. But her cool, aloof forever crush never really saw her before he moved away. Now that he’s back in town, Liz will do whatever it takes to get on his radar—and maybe snag him as a prom date—even befriend Wes Bennet.<br> <br>The annoyingly attractive next-door neighbor might seem like a prime candidate for romantic comedy fantasies, but Wes has only been a pain in Liz’s butt since they were kids. Pranks involving frogs and decapitated lawn gnomes do not a potential boyfriend make. Yet, somehow, Wes and Michael are hitting it off, which means Wes is Liz’s in.<br> <br>But as Liz and Wes scheme to get Liz noticed by Michael so she can have her magical prom moment, she’s shocked to discover that she likes being around Wes. And as they continue to grow closer, she must reexamine everything she thought she knew about love—and rethink her own ideas of what Happily Ever After should look like.		https://www.walmart.com/ip/Better-Than-the-Movies-Paperback-9781534467637/346854326
161	THE WAY I USED TO BE	1481449362	9781481449366	<b><i>New York Times </i>bestseller! In the tradition of <i>Speak, </i>Amber Smith's extraordinary debut novel “</b><b>is a heart-twisting, but ultimately hopeful, exploration of how pain can lead to strength” (<i>The Boston Globe</i>).</b><br><br>Eden was always good at being good. Starting high school didn’t change who she was. But the night her brother’s best friend rapes her, Eden’s world capsizes.<br> <br>What was once simple, is now complex. What Eden once loved—who she once loved—she now hates. What she thought she knew to be true, is now lies. Nothing makes sense anymore, and she knows she’s supposed to tell someone what happened but she can’t. So she buries it instead. And she buries the way she used to be.<br> <br>Told in four parts—freshman, sophomore, junior, and senior year—this provocative debut reveals the deep cuts of trauma. But it also demonstrates one young woman’s strength as she navigates the disappointment and unbearable pains of adolescence, of first love and first heartbreak, of friendships broken and rebuilt, all while learning to embrace the power of survival she never knew she had hidden within her heart.		https://www.walmart.com/ip/The-Way-I-Used-to-Be-The-Way-I-Used-to-Be-Paperback-9781481449366/55218263
158	IF HE HAD BEEN WITH ME	1728205484	9781728205489	<p>A New York Times Bestseller</p><p>*A BookTok Viral Sensation* </p><p>An achingly authentic and raw portrait of love, regret, and the life-altering impact of the relationships we hold closest to us, this YA romance bestseller is perfect for fans of Colleen Hoover, Jenny Han, and You've Reached Sam. </p><p>If he had been with me, everything would have been different...</p><p>Autumn and Finn used to be inseparable. But then something changed. Or they changed. Now, they do their best to ignore each other.</p><p>Autumn has her boyfriend Jamie, and her close-knit group of friends. And Finn has become that boy at school, the one everyone wants to be around.</p><p>That still doesn't stop the way Autumn feels every time she and Finn cross paths, and the growing, nagging thought that maybe things could have been different. Maybe they should be together.</p><p>But come August, things will change forever. And as time passes, Autumn will be forced to confront how else life might have been different if they had never parted ways...</p><p>Captivating and heartbreaking, If He Had Been with Me is perfect for readers looking for: </p><ul><li>Contemporary teen romance books</li><li>Unputdownable & bingeworthy novels</li><li>Complex emotional YA stories</li><li>TikTok Books</li><li>Jenny Han meets Dear Even Hanson</li><li>Colleen Hover fans</li></ul>		https://www.walmart.com/ip/If-He-Had-Been-with-Me-Paperback-9781728205489/201902853
165	SIX OF CROWS	125007696X	9781250076960	<p><b>See the Grishaverse com</b><b>e to life on screen with <i>Shadow and Bone</i>, now a Netflix original series. </b><br><br><b>Discover what comes next for heist trio Kaz, Inej, and Jesper -- and the star-crossed Nina and Matthias -- in the</b><b> #1 <i>New York Times</i> bestseller <i>Six of Crows, </i></b><b>Book One of the Six of Crows Duology</b><b>.</b><br><br>Ketterdam: a bustling hub of international trade where anything can be had for the right price—and no one knows that better than criminal prodigy Kaz Brekker. Kaz is offered a chance at a deadly heist that could make him rich beyond his wildest dreams. But he can't pull it off alone. . . .<br><br> <i>A convict with a thirst for revenge.<br><br> A sharpshooter who can't walk away from a wager.<br><br> A runaway with a privileged past.<br><br> A spy known as the Wraith.<br><br> A Heartrender using her magic to survive the slums. <br><br> A thief with a gift for unlikely escapes. </i><br><br> Six dangerous outcasts. One impossible heist. Kaz's crew is the only thing that might stand between the world and destruction—if they don't kill each other first.<br><br> <i>Six of Crows</i> by Leigh Bardugo returns to the breathtaking world of the Grishaverse in this unforgettable tale about the opportunity—and the adventure—of a lifetime.<br><br> <b>Praise for <i>Six of Crows</i>:</b><br><br>“<i>Six of Crows</i> is <b>a twisty and elegantly crafted masterpiece </b>that thrilled me from the beginning to end.” –<i>New York Times</i>-bestselling author Holly Black<br><br> “<i>Six of Crows</i> [is] one of those <b>all-too-rare, unputdownable </b>books that keeps your eyes glued to the page and your brain scrambling to figure out what’s going to happen next.” –Michael Dante DiMartino, co-creator of <i>Avatar: The Last Airbender</i> and <i>The Legend of Korra</i><br><br> “There's conflict between morality and amorality and an appetite for sometimes grimace-inducing violence that recalls the Game of Thrones series. But for every bloody exchange there are pages of <b>crackling dialogue and sumptuous description</b>. Bardugo dives deep into this world, with full color and sound. If you're not careful, <b>it'll steal all your time</b>.” —<i>The New York Times Book Review</i><br><br> Read all the books in the Grishaverse!<br><br><b>The Shadow and Bone Trilogy </b><br> (previously published as The Grisha Trilogy)<br> <i>Shadow and Bone</i><br> <i>Siege and Storm</i><br> <i>Ruin and Rising</i><br><br> <b>The Six of Crows Duology</b><br> <i>Six of Crows</i><br> <i>Crooked Kingdom</i><br><br><b>The King of Scars Duology</b><br><i>King of Scars</i><br><br> <i>The Language of Thorns: Midnight Tales and Dangerous Magic</i><br><i>The Severed Moon: A Year-Long Journal of Magic</i><br><br><b>Praise for the Grishaverse</b><br><br> “A master of fantasy.” —<i>The Huffington Post</i><br> “Utterly, extremely bewitching.” —<i>The Guardian</i><br> “This is what fantasy is for.” —<i>The New York Times Book Review</i><br> “[A] world that feels real enough to have its own passport stamp.” —NPR<br> “The darker it gets for the good guys, the better.” —<i>Entertainment Weekly</i><br> “Sultry, sweeping and picturesque. . . . Impossible to put down.” —<i>USA Today</i><br> “There’s a level of emotional and historical sophistication within Bardugo’s original epic fantasy that sets it apart.” —<i>Vanity Fair</i><br> “Unlike anything I’ve ever read.” —Veronica Roth, bestselling author of <i>Divergent</i><br> “Bardugo crafts a first-rate adventure, a poignant romance, and an intriguing mystery!” —Rick Riordan, bestselling author of the Percy Jackson series</p>		https://www.walmart.com/ip/Six-of-Crows-Six-of-Crows-Series-1-Paperback-9781250076960/53596627
166	THE BOOK THIEF	0375842209	9780375842207	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • ONE OF <i>TIME</i> MAGAZINE’S 100 BEST YA BOOKS OF ALL TIME<br><br>The extraordinary, beloved novel about the ability of books to feed the soul even in the darkest of times.</b><br><br><i>When Death has a story to tell, you listen.</i><br><br> It is 1939. Nazi Germany. The country is holding its breath. Death has never been busier, and will become busier still.<br><br> Liesel Meminger is a foster girl living outside of Munich, who scratches out a meager existence for herself by stealing when she encounters something she can’t resist–books. With the help of her accordion-playing foster father, she learns to read and shares her stolen books with her neighbors during bombing raids as well as with the Jewish man hidden in her basement. <br><br> In superbly crafted writing that burns with intensity, award-winning author Markus Zusak, author of <i>I Am the Messenger,</i> has given us one of the most enduring stories of our time.<br>  <br> “The kind of book that can be life-changing.” —<i>The New York Times</i><br>  <br> “Deserves a place on the same shelf with <i>The Diary of a Young Girl </i>by Anne Frank.” —<i>USA Today</i><br><br><b>DON’T MISS <i>BRIDGE OF CLAY</i>, MARKUS ZUSAK’S FIRST NOVEL SINCE <i>THE BOOK THIEF.</i></b>		https://www.walmart.com/ip/The-Book-Thief-Paperback-9780375842207/5665872
167	ONCE UPON A BROKEN HEART		9781250898326			\N
123	SCHOOL TRIP	0062885537	9780062885531	<br> <br> <p>New York Times bestselling author Jerry Craft is back with the newest adventures of Jordan, Drew, Liam, and all the characters that fans first met in New Kid, winner of the Newbery Award and the Coretta Scott King Author Award! In this full-color contemporary graphic novel, the gang from Riverdale Academy Day is heading to Paris, for an international education like you've never seen before...</p> <p>Jordan, Drew, Liam, Maury, and their friends from Riverdale Academy Day School are heading out on a school trip to Paris. As an aspiring artist himself, Jordan can't wait to see all the amazing art in the famous City of Lights.</p> <p>But when their trusted faculty guides are replaced at the last minute, the school trip takes an unexpected--and hilarious--turn. Especially when trying to find their way around a foreign city ends up being almost as tricky as navigating the same friendships, fears, and differences that they struggle with at home.</p> <p>Will Jordan and his friends embrace being exposed to a new language, unfamiliar food, and a different culture Or will they all end up feeling like the "new kid"</p> <p>Don't miss the two hilarious and powerful companion novels by Jerry Craft, New Kid and Class Act!</p>		https://www.walmart.com/ip/School-Trip-A-Graphic-Novel-Paperback-9780062885531/1897076343
163	THE ISLAND	0593481496	9780593481493	<b>INSTANT<i> NEW YORK TIMES</i> BESTSELLER • Hot on the heels of the <i>New York Times </i>bestseller<i>s The Twin </i>and<i> The Lake</i>, another pulse-pounding read from the undisputed queen of YA thrillers!<br><br>They said goodbye to their friends and family for the weekend. They weren’t counting on forever.</b><br><br>Jagged Island: a private amusement park for the very rich—or the very influential. Liam, James, Will, Ava, Harper, and Paisley—social media influencers with millions of followers—have been invited for an exclusive weekend before the park opens. They’ll make posts and videos for their channels and report every second of their VIP treatment. <br><br>When the teens arrive, they're stunned: the resort is even better than they’d imagined. Their hotel rooms are unreal, the park’s themed rides are incredible, and the island is hauntingly beautiful. They’re given a jam-packed itinerary for the weekend. <br><br>But soon they'll discover that something's missing from their schedule: getting off the island alive.		https://www.walmart.com/ip/The-Island-Paperback-9780593481493/1248501683
134	SUSPECTS	1984821709	9781984821706	<b><b><i>NEW YORK TIMES </i>BESTSELLER • A dedicated CIA agent becomes an unexpected ally to a woman haunted by the kidnapping of her family, in this thrilling novel from #1 <i>New York Times</i> bestselling author Danielle Steel.</b></b><br><br>Theodora Morgan is fashion royalty. Founder of a wildly popular online shopping service, she is one of the most successful businesswomen in the world, although she prefers to keep a low profile, especially over the last months. It was a year ago when the unthinkable struck her family, and her husband, industry mogul Matthieu Pasquier, and their son were kidnapped and held for ransom—a nightmare that ended in tragedy.<br> <br>The case has gone cold, despite evidence linking the crime to Matthieu’s Russian competitors. Theo has reluctantly gone back to work running her company. On the flight to a launch party for one of her highly anticipated pop-up shops in New York City, she crosses paths with high-society networker Pierre de Vaumont. Theo politely invites him to her event—unaware that Pierre has been flagged by the CIA.<br> <br>Senior supervising CIA operative Mike Andrews investigates Pierre’s suspicious Russian contacts and clears him to enter the country, but when he realizes that Theodora Morgan is on the same flight, he becomes concerned for her safety. Posing as a lawyer, Mike begins a covert mission—starting with Theo’s opening party. When Mike and Theo meet, their connection is instant, but Theo is completely unaware of Mike’s true objective or identity… or that the life she is rebuilding is in grave danger.		https://www.walmart.com/ip/Suspects-Paperback-9781984821706/2225478056
142	THE LAST HOUSE GUEST	1668012790	9781668012796	<b>**A Reese Witherspoon x Hello Sunshine Book Club Pick and <i>New York Times </i>bestseller<i>**</i></b><br> <br><b>A year after a summer guest dies under suspicious circumstances, her best friend lives under a cloud of grief and suspicion in this “fast-paced and gripping” (<i>People</i>) thriller filled with “dizzying plot twists and multiple surprise endings” (<i>The New York Times Book Review).</i></b><br><br>Littleport, Maine, has always felt like two separate towns: an ideal vacation enclave for the wealthy, whose summer homes line the coastline; and a simple harbor community for the year-round residents whose livelihoods rely on service to the visitors.<br> <br>Typically, fierce friendships never develop between a local and a summer girl—but that’s just what happens with visitor Sadie Loman and Littleport resident Avery Greer. Each summer for almost a decade, the girls are inseparable—until Sadie is found dead. While the police rule the death a suicide, Avery can’t help but feel there are those in the community, including a local detective and Sadie’s brother, Parker, who blame her. Someone knows more than they’re saying, and Avery is intent on clearing her name, before the facts get twisted against her.<br> <br>“A riveting read…from master of suspense, Megan Miranda,” (Mary Kubica, <i>New York Times </i>bestselling author of <i>The Good Girl</i>) <i>The Last House Guest</i> is a clever, twisty mystery that brilliantly explores the elusive nature of memory and the complexities of female friendships.		https://www.walmart.com/ip/The-Last-House-Guest-Paperback-9781668012796/1834809191
144	GETTING EVEN	1420155547	9781420155549	<b>Who doesn’t fantasize about a little payback? Revenge is a timeless, all-too-human desire, and it’s a common thread in <i>Yesterday’s Lies </i>and <i>Zachary’s Law – </i>two classic, fan-favorite novels by #1 <i>New York Times</i> bestselling author Lisa Jackson that are now available in one thrilling romantic suspense omnibus of revenge, obsession, and deception…</b><br><br><i>“Trask McFadden is back.”</i> Those are words that Tory has been waiting to hear, half in dread, half with longing. It’s been five years since Trask landed her father behind bars for horse swindling, using things she’d told him in confidence. Her father died there, but now Trask insists he has information that could help prove who was really responsible for the crime, not to mention his own brother’s death. Trask needs <i>her</i> help. But he won’t get it, not after destroying her family, her ranch, and the love they shared.<br><br>Lauren Regis’s ex-husband has kidnapped her children. There’s nothing she won’t do to get them back, including hiring Zachary Winters. The unconventional attorney has made a name for himself by locating people—especially those who don’t want to be found. But he’s got a darker reputation too, and there are rumors swirling about the fate of his ex-wife. How much is Lauren willing to trust him—or to lose?		https://www.walmart.com/ip/Getting-Even-Two-Thrilling-Novels-of-Suspense-Paperback-9781420155549/1391904503
147	THE JUDGE'S LIST	0593157834	9780593157831	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • Investigator Lacy Stoltz follows the trail of a serial killer, and closes in on a shocking suspect—a sitting judge—in “one of the best crime reads of the year.… Bristling with high-tech detail and shivering with suspense…. Worth staying up all night to finish” (<i>Wall Street Journal</i>).</b><br><br>In <i>The Whistler</i>, Lacy Stoltz investigated a corrupt judge who was taking millions in bribes from a crime syndicate. She put the criminals away, but only after being attacked and nearly killed. Three years later, and approaching forty, she is tired of her work for the Florida Board on Judicial Conduct and ready for a change.<br><br>Then she meets a mysterious woman who is so frightened she uses a number of aliases. Jeri Crosby’s father was murdered twenty years earlier in a case that remains unsolved and that has grown stone cold. But Jeri has a suspect whom she has become obsessed with and has stalked for two decades. Along the way, she has discovered other victims.<br><br>Suspicions are easy enough, but proof seems impossible. The man is brilliant, patient, and always one step ahead of law enforcement. He is the most cunning of all serial killers. He knows forensics, police procedure, and most important: he knows the law.<br><br>He is a judge, in Florida—under Lacy’s jurisdiction.<br><br>He has a list, with the names of his victims and targets, all unsuspecting people unlucky enough to have crossed his path and wronged him in some way. How can Lacy pursue him, without becoming the next name on his list?<br><br>The Judge’s List is by any measure John Grisham’s most surprising, chilling novel yet.<br><b><i> </i></b><br><b><i>Don’t miss John Grisham’s new book, </i>THE EXCHANGE: AFTER<i> THE FIRM, coming soon!</i></b>		https://www.walmart.com/ip/The-Whistler-The-Judge-s-List-Paperback-9780593157831/293350024
153	THE ONE AND ONLY BOB	0062991329	9780062991324	<p>A #1 New York Times bestseller and a #1 Indie bestseller!</p> <p>"Good dog Bob. Great to have a best friend."--Danny DeVito</p> <p>Return to the unforgettable world of the Newbery Medal-winning and #1 New York Times bestselling novel The One and Only Ivan in this incredible sequel, starring Ivan's friend Bob! Catch up with these beloved friends before you see the star-studded film adaptation of The One and Only Ivan, now available on Disney+!</p> <p>Bob sets out on a dangerous journey in search of his long-lost sister with the help of his two best friends, Ivan and Ruby. As a hurricane approaches and time is running out, Bob finds courage he never knew he had and learns the true meaning of friendship and family.</p> <p>Bob, Ivan, and Ruby have touched the hearts of millions of readers, and their story isn't over yet. Catch up with these beloved friends before the star-studded film adaptation of The One and Only Ivan hits theaters in August 2020!</p> <p>One and Only Bob is an instant #1 New York Times bestseller, embraced by new and old fans of Katherine Applegate's beloved One and Only Ivan. Great for summer reading or anytime! A Today show pick for "25 children's books your kids and teens won't be able to put down this summer!"</p> <p>In the tradition of timeless stories like Charlotte's Web and Stuart Little, Katherine Applegate blends humor and poignancy to create an unforgettable story of friendship, family, and hope.</p> <p>The One and Only Bob features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p> <p>This acclaimed middle grade novel is an excellent choice for tween readers in grades 5 to 8, for independent reading, homeschooling, and sharing in the classroom.</p>	Illustrated by Patricia Castelao	https://www.walmart.com/ip/The-One-and-Only-Bob-Paperback-9780062991324/259165477
155	A WOLF CALLED WANDER	006289594X	9780062895943	<p>A New York Times bestseller! "Don't miss this dazzling tour de force."--Katherine Applegate, Newbery Medal winning author of The One and Only Ivan</p><p>This gripping novel about survival and family is based on the real story of one wolf's incredible journey to find a safe place to call home. Illustrated throughout, this irresistible tale by award-winning author Rosanne Parry is for fans of Sara Pennypacker's Pax and Katherine Applegate's The One and Only Ivan. </p><p>Swift, a young wolf cub, lives with his pack in the mountains learning to hunt, competing with his brothers and sisters for hierarchy, and watching over a new litter of cubs. Then a rival pack attacks, and Swift and his family scatter.</p><p>Alone and scared, Swift must flee and find a new home. His journey takes him a remarkable one thousand miles across the Pacific Northwest. The trip is full of peril, and Swift encounters forest fires, hunters, highways, and hunger before he finds his new home. </p><p>Inspired by the extraordinary true story of a wolf named OR-7 (or Journey), this irresistible tale of survival invites readers to experience and imagine what it would be like to be one of the most misunderstood animals on earth. This gripping and appealing novel about family, courage, loyalty, and the natural world is for fans of Fred Gipson's Old Yeller and Katherine Applegate's Endling. </p><p>Includes black-and-white illustrations throughout and a map as well as information about the real wolf who inspired the novel.</p><p>Plus don't miss Rosanne Parry's stand-alone companion novel, A Whale of the Wild.</p>	Illustrated by Mónica Armiño	https://www.walmart.com/ip/Voice-of-the-Wilderness-Novel-A-Wolf-Called-Wander-Paperback-9780062895943/566466948
157	WHEN YOU TRAP A TIGER	1524715735	9781524715731	<b>WINNER OF THE NEWBERY MEDAL • WINNER OF THE ASIAN/PACIFIC AMERICAN AWARD FOR CHILDREN'S LITERATURE • #1 <i>NEW YORK TIMES</i> BESTSELLER<br><br>Would you make a deal with a magical tiger? This uplifting story brings Korean folklore to life as a girl goes on a quest to unlock the power of stories and save her grandmother.</b><br><br><i>Some stories refuse to stay bottled up...</i><br><br>When Lily and her family move in with her sick grandmother, a magical tiger straight out of her halmoni's Korean folktales arrives, prompting Lily to unravel a secret family history. Long, long ago, Halmoni stole something from the tigers. Now they want it back. And when one of the tigers approaches Lily with a deal--return what her grandmother stole in exchange for Halmoni's health--Lily is tempted to agree. But deals with tigers are never what they seem! With the help of her sister and her new friend Ricky, Lily must find her voice...and the courage to face a tiger.<br><br>Tae Keller, the award-winning author of <i>The Science of Breakable Things</i>, shares a sparkling tale about the power of stories and the magic of family. Think <i>Walk Two Moons </i>meets <i>Where the Mountain Meets the Moon</i>!<br><br>"If stories were written in the stars ... this wondrous tale would be one of the brightest." <i>--Booklist</i>, Starred Review		https://www.walmart.com/ip/When-You-Trap-a-Tiger-Newbery-Medal-Winner-Paperback-9781524715731/1146959073
159	GIRL IN PIECES	1101934743	9781101934746	<b><b>#1 <i>NEW YORK TIMES</i> BESTSELLER</b><br><br></b>"<b>A haunting, beautiful, and necessary book.</b>"<i>—</i>Nicola Yoon<i>, #1 <i>New York Times</i></i> bestselling author of <i><i>Everything, Everything<br></i></i> <br>Charlotte Davis is in pieces. At seventeen she’s already lost more than most people do in a lifetime. But she’s learned how to forget. The broken glass washes away the sorrow until there is nothing but calm. You don’t have to think about your father and the river. Your best friend, who is gone forever. Or your mother, who has nothing left to give you. <br><br>Every new scar hardens Charlie’s heart just a little more, yet it still hurts so much. It hurts enough to not care anymore, which is sometimes what has to happen before you can find your way back from the edge. <br><br>A deeply moving portrait of a girl in a world that owes her nothing, and has taken so much, and the journey she undergoes to put herself back together. Kathleen Glasgow's debut is heartbreakingly real and unflinchingly honest. It’s a story you won’t be able to look away from.<i><i><br></i></i> <br>And don’t miss Kathleen Glasgow's novels <b><i>You’d Be Home Now </i></b>and <b><i>How to Make Friends with the Dark</i></b>, both raw and powerful stories of life.		https://www.walmart.com/ip/Girl-in-Pieces-Paperback-9781101934746/423327139
162	ONE OF US IS LYING	1524714755	9781524714758	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • NAMED ONE OF THE TEN BEST BOOKS OF THE YEAR BY <i>ENTERTAINMENT WEEKLY • BUZZFEED • POPCRUSH</i></b><br><b><br>“Pretty Little Liars meets The Breakfast Club” (<i>Entertainment Weekly</i>) in this addictive mystery about what happens when five strangers walk into detention and only four walk out alive. </b><br> <br>Pay close attention and you might solve this.<br>On Monday afternoon, five students at Bayview High walk into detention.<br><br>    Bronwyn, <b>the brain</b>, is Yale-bound and never breaks a rule.<br>    Addy,<b> the beauty</b>, is the picture-perfect homecoming princess.<br>    Nate, <b>the criminal</b>, is already on probation for dealing.<br>    Cooper, <b>the athlete</b>, is the all-star baseball pitcher.<br>    And Simon, <b>the outcast</b>, is the creator of Bayview High’s notorious gossip app.<br> <br>Only, Simon never makes it out of that classroom. Before the end of detention Simon's dead. And according to investigators, his death wasn’t an accident. On Monday, he died. But on Tuesday, he’d planned to post juicy reveals about all four of his high-profile classmates, which makes all four of them suspects in his murder. Or are they the perfect patsies for a killer who’s still on the loose?<br><br>Everyone has secrets, right? What really matters is how far you would go to protect them.<br><br><b><b>All the secrets of the Bayview Four will be revealed in the TV series now streaming on NBC's Peacock! <br><br><b>And don’t miss the #1 <i>New York Times </i>bestselling sequel, <i>One of Us is Next</i>!</b></b></b>		https://www.walmart.com/ip/One-of-Us-Is-Lying-Paperback-9781524714758/1564922403
164	THEY BOTH DIE AT THE END	0062457802	9780062457806	<p>Adam Silvera reminds us that there’s no life without death and no love without loss in this devastating yet uplifting story about two people whose lives change over the course of one unforgettable day.</p><p>New York Times bestseller * 4 starred reviews * A School Library Journal Best Book of the Year * A Kirkus Best Book of the Year * A Booklist Editors' Choice of 2017 * A Bustle Best YA Novel of 2017 * A Paste Magazine Best YA Book of 2017 * A Book Riot Best Queer Book of 2017 * A Buzzfeed Best YA Book of the Year * A BookPage Best YA Book of the Year </p><p>On September 5, a little after midnight, Death-Cast calls Mateo Torrez and Rufus Emeterio to give them some bad news: They’re going to die today.</p><p>Mateo and Rufus are total strangers, but, for different reasons, they’re both looking to make a new friend on their End Day. The good news: There’s an app for that. It’s called the Last Friend, and through it, Rufus and Mateo are about to meet up for one last great adventure—to live a lifetime in a single day.</p><p>In the tradition of Before I Fall and If I Stay, They Both Die at the End is a tour de force from acclaimed author Adam Silvera, whose debut, More Happy Than Not, the New York Times called “profound.”</p><p>Featuring a map of the novel’s characters and their connections, an exclusive essay by the author, and a behind-the-scenes look at the early outlines for this critically acclaimed bestseller. </p>		https://www.walmart.com/ip/They-Both-Die-at-the-End-Paperback-9780062457806/662656755
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_authors (book_author_id, book_id, author_id) FROM stdin;
2	2	2
3	3	3
4	4	4
5	5	5
7	7	7
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
16	16	16
17	17	17
18	18	18
19	19	19
20	20	20
21	21	21
22	22	22
23	23	23
24	24	24
25	25	25
26	26	26
27	27	27
28	28	28
29	29	29
30	30	30
31	31	31
32	32	32
33	33	33
34	33	34
35	34	35
36	35	36
37	36	37
38	37	38
39	38	39
40	39	40
41	40	41
42	41	42
43	42	43
44	43	44
45	44	45
46	45	46
47	46	47
48	47	48
49	48	49
50	49	50
51	50	51
52	50	52
53	51	53
54	52	54
55	53	55
56	54	56
57	55	57
58	56	58
59	57	59
60	58	60
61	59	61
62	60	62
63	61	63
64	62	64
65	63	65
66	64	66
67	65	67
68	66	68
69	67	69
70	68	70
71	69	71
72	70	72
73	71	73
74	72	74
75	73	75
76	74	76
77	74	77
78	75	78
79	76	79
80	77	80
81	78	81
82	79	82
83	80	83
84	81	84
85	82	85
86	83	86
87	84	87
88	84	88
89	85	89
90	86	90
91	87	91
92	88	92
93	89	93
94	90	94
95	91	95
96	92	96
97	93	97
98	94	98
99	95	99
100	96	100
101	97	101
102	98	102
103	99	103
104	100	104
105	101	105
106	102	106
107	103	107
108	104	108
109	105	109
110	106	110
111	107	111
112	108	112
113	109	113
114	110	114
115	111	115
116	112	116
117	113	117
118	114	118
119	115	119
120	116	120
121	116	121
122	117	122
123	118	123
124	119	124
125	120	125
126	121	126
127	122	127
128	123	128
129	124	129
130	125	130
131	126	131
132	127	132
133	128	133
134	128	134
135	128	135
136	129	136
137	130	137
138	131	138
139	132	139
140	133	140
141	133	141
142	134	142
143	135	143
144	136	144
145	137	145
146	137	146
147	138	147
148	139	148
149	139	149
150	140	150
151	141	151
152	141	152
153	142	153
154	143	154
155	144	155
156	145	156
157	146	157
158	146	158
159	147	159
160	148	160
161	149	161
162	150	162
163	151	163
164	152	164
165	153	165
166	154	166
167	155	167
168	156	168
169	157	169
170	158	170
171	159	171
172	160	172
173	161	173
174	162	174
175	163	175
176	164	176
177	165	177
178	166	178
179	167	179
\.


--
-- Data for Name: books_categories; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_categories (book_category_id, book_id, category_id) FROM stdin;
7	2	2
8	2	7
9	2	8
10	2	5
11	2	6
12	3	2
13	3	7
14	3	5
15	3	9
16	3	6
17	4	2
18	4	10
19	4	11
20	4	12
21	5	2
22	5	7
23	5	5
24	5	9
25	5	6
31	7	2
32	7	12
33	7	17
34	7	18
40	9	2
41	9	7
42	9	5
43	9	6
44	10	21
45	10	12
46	10	22
47	10	2
48	11	23
49	11	1
50	11	2
51	11	7
52	11	4
53	11	6
54	12	2
55	12	24
56	12	7
57	12	5
58	12	6
59	12	25
60	13	1
61	13	2
62	13	5
63	13	11
64	13	4
65	14	23
66	14	1
67	14	2
68	14	26
69	14	4
70	15	2
71	15	7
72	15	8
73	15	6
74	15	27
75	16	28
76	16	29
77	16	30
78	16	31
79	16	32
80	16	33
81	16	34
82	17	35
83	17	28
84	17	36
85	17	37
86	17	31
87	17	38
88	17	39
89	17	33
90	17	34
91	18	40
92	18	41
93	18	42
94	18	43
95	18	44
96	18	45
97	18	46
98	18	34
99	19	47
100	19	48
101	19	49
102	19	10
103	19	50
104	19	51
105	19	52
106	19	53
107	19	54
108	19	55
109	19	34
110	20	56
111	20	57
112	20	30
113	20	58
114	20	59
115	20	32
116	20	33
117	20	45
118	20	34
119	21	57
120	21	60
121	21	61
122	21	62
123	21	63
124	21	34
125	22	35
126	22	37
127	22	57
128	22	64
129	22	33
130	22	63
131	22	34
132	23	65
133	23	66
134	23	57
135	23	67
136	23	68
137	23	69
138	23	62
139	23	34
140	24	57
141	24	60
142	24	70
143	24	71
144	24	62
145	24	34
146	25	72
147	25	73
148	25	5
149	25	74
150	25	33
151	25	75
152	25	34
153	26	76
154	26	30
155	26	77
156	26	78
157	26	33
158	26	79
159	26	34
160	27	56
161	27	57
162	27	5
163	27	45
164	27	63
165	27	34
166	28	72
167	28	80
168	28	81
169	28	68
170	28	69
171	28	82
172	28	83
173	28	84
174	28	33
175	28	85
176	28	34
177	29	86
178	29	87
179	29	34
180	30	72
181	30	88
182	30	89
183	30	90
184	30	62
185	30	91
186	30	34
187	31	1
188	31	2
189	31	3
190	31	4
191	31	5
192	31	6
193	32	13
194	32	14
195	32	2
196	32	15
197	32	16
198	33	1
199	33	92
200	33	2
201	33	93
202	33	4
203	33	94
204	34	13
205	34	1
206	34	2
207	34	3
208	34	4
209	35	1
210	35	2
211	35	19
212	35	20
213	35	4
214	36	2
215	37	2
216	37	5
217	37	95
218	37	11
219	37	12
220	38	96
221	38	97
222	38	12
223	38	2
224	39	98
225	39	2
226	39	58
227	39	99
228	39	12
229	40	1
230	40	2
231	40	100
232	40	101
233	40	4
234	41	102
235	41	1
236	41	2
237	41	101
238	41	4
239	42	80
240	42	62
241	42	57
242	42	84
243	42	103
244	42	63
245	42	104
246	42	34
247	43	72
248	43	105
249	43	106
250	43	107
251	43	108
252	43	109
253	43	34
254	44	72
255	44	57
256	44	30
257	44	88
258	44	110
259	44	89
260	44	32
261	44	111
262	44	33
263	44	91
264	44	105
265	44	34
266	45	112
267	45	86
268	45	113
269	45	114
270	45	34
271	46	115
272	46	116
273	46	117
274	46	118
275	46	105
276	46	34
277	47	56
278	47	119
279	47	57
280	47	70
281	47	73
282	47	45
283	47	75
284	47	34
285	48	120
286	48	2
287	48	5
288	48	121
289	48	12
290	49	2
291	49	7
292	49	5
293	49	9
294	49	6
295	50	1
296	50	2
297	50	21
298	50	4
299	50	9
300	50	6
301	51	2
302	51	7
303	51	5
304	51	9
305	51	6
306	52	4
307	52	23
308	52	1
309	52	2
310	53	11
311	53	2
312	53	58
313	53	122
314	53	12
315	54	2
316	54	7
317	54	8
318	54	22
319	54	6
320	55	123
321	55	81
322	55	57
323	55	124
324	55	86
325	55	63
326	55	34
327	56	57
328	56	5
329	56	12
330	56	63
331	56	34
332	57	34
333	58	65
334	58	125
335	58	29
336	58	57
337	58	126
338	58	127
339	58	128
340	58	32
341	58	33
342	58	34
343	59	47
344	59	129
345	59	130
346	59	131
347	59	132
348	59	34
349	60	57
350	60	5
351	60	133
352	60	63
353	60	34
354	61	57
355	61	5
356	61	114
357	61	63
358	61	34
359	62	19
360	62	134
361	62	32
362	62	135
363	62	99
364	62	33
365	62	136
366	62	34
367	63	137
368	63	56
369	63	47
370	63	138
371	63	45
372	63	34
373	64	56
374	64	47
375	64	139
376	64	140
377	64	45
378	64	132
379	64	141
380	65	57
381	65	68
382	65	142
383	65	143
384	65	144
385	65	141
386	66	56
387	66	81
388	66	57
389	66	83
390	66	90
391	66	62
392	66	85
393	66	45
394	66	63
395	66	141
396	67	73
397	67	145
398	67	114
399	67	45
400	67	75
401	67	141
402	68	56
403	68	98
404	68	146
405	68	147
406	68	59
407	68	12
408	68	45
409	68	141
410	69	148
411	69	81
412	69	149
413	69	150
414	69	83
415	69	62
416	69	87
417	69	104
418	69	141
419	70	140
420	70	151
421	70	141
422	71	137
423	71	56
424	71	119
425	71	152
426	71	59
427	71	153
428	71	45
429	71	141
430	72	137
431	72	56
432	72	119
433	72	59
434	72	45
435	72	141
436	73	141
437	74	154
438	74	155
439	74	156
440	74	157
441	74	158
442	74	159
443	74	160
444	75	155
445	75	161
446	75	162
447	75	163
448	75	164
449	75	159
450	75	160
451	76	13
452	76	165
453	76	155
454	76	166
455	76	167
456	76	58
457	76	2
458	76	168
459	76	159
460	76	160
461	77	169
462	77	155
463	77	170
464	77	171
465	77	159
466	77	160
467	78	148
468	78	172
469	78	159
470	78	160
471	79	173
472	79	174
473	79	175
474	79	176
475	79	164
476	79	159
477	79	160
478	80	159
479	80	160
480	81	148
481	81	177
482	81	97
483	81	166
484	81	155
485	81	178
486	81	159
487	81	160
488	82	148
489	82	13
490	82	154
491	82	155
492	82	179
493	82	159
494	82	160
495	83	148
496	83	13
497	83	155
498	83	179
499	83	180
500	83	159
501	83	160
502	84	169
503	84	181
504	84	155
505	84	166
506	84	182
507	84	183
508	84	184
509	84	173
510	84	159
511	85	185
512	85	155
513	85	186
514	85	159
515	86	148
516	86	185
517	86	187
518	86	155
519	86	166
520	86	188
521	86	163
522	86	189
523	86	159
524	87	169
525	87	187
526	87	155
527	87	190
528	87	191
529	87	159
530	88	185
531	88	181
532	88	166
533	88	155
534	88	192
535	88	193
536	88	159
537	89	181
538	89	166
539	89	155
540	89	183
541	89	163
542	89	159
543	90	148
544	90	169
545	90	155
546	90	182
547	90	194
548	90	90
549	90	159
550	91	148
551	91	155
552	91	179
553	91	180
554	91	193
555	91	159
556	92	166
557	92	189
558	92	155
559	92	181
560	92	159
561	93	148
562	93	181
563	93	195
564	93	196
565	93	197
566	93	166
567	93	189
568	93	155
569	93	193
570	93	159
571	94	193
572	94	155
573	94	98
574	94	159
575	95	166
576	95	172
577	95	198
578	95	199
579	95	200
580	95	159
581	96	159
582	97	169
583	97	97
584	97	7
585	97	166
586	97	155
587	97	201
588	97	172
589	97	202
590	97	6
591	97	203
592	97	159
593	98	13
594	98	166
595	98	172
596	98	168
597	98	204
598	98	205
599	98	159
600	99	154
601	99	155
602	99	159
603	100	97
604	100	166
605	100	155
606	100	206
607	100	193
608	100	159
609	101	13
610	101	154
611	101	155
612	101	156
613	101	157
614	101	159
615	102	13
616	102	169
617	102	207
618	102	7
619	102	166
620	102	172
621	102	6
622	102	203
623	102	171
624	102	159
625	103	148
626	103	13
627	103	154
628	103	155
629	103	179
630	103	159
631	104	35
632	104	181
633	104	166
634	104	172
635	104	208
636	104	189
637	104	209
638	105	166
639	105	172
640	105	198
641	105	199
642	105	200
643	105	209
644	106	35
645	106	181
646	106	21
647	106	166
648	106	172
649	106	208
650	106	6
651	106	158
652	106	209
653	107	126
654	107	166
655	107	172
656	107	210
657	107	208
658	107	198
659	107	203
660	107	209
661	108	66
662	108	181
663	108	97
664	108	211
665	108	166
666	108	172
667	108	158
668	108	209
669	109	212
670	109	14
671	109	172
672	109	6
673	109	209
674	110	148
675	110	177
676	110	213
677	110	172
678	110	214
679	110	180
680	110	209
681	111	215
682	111	57
683	111	173
684	111	216
685	111	189
686	111	158
687	111	209
688	112	13
689	112	14
690	112	172
691	112	156
692	112	6
693	112	217
694	112	209
695	113	97
696	113	7
697	113	166
698	113	172
699	113	8
700	113	6
701	113	209
702	114	137
703	114	45
704	114	218
705	115	56
706	115	219
707	115	47
708	115	140
709	115	45
710	115	132
711	115	218
712	116	56
713	116	219
714	116	220
715	116	57
716	116	119
717	116	19
718	116	140
719	116	218
720	117	114
721	117	75
722	117	60
723	117	73
724	117	57
725	117	221
726	117	218
727	118	13
728	118	98
729	118	155
730	118	206
731	118	18
732	118	193
733	118	222
734	119	98
735	119	155
736	119	206
737	119	18
738	119	193
739	119	222
740	120	13
741	120	98
742	120	155
743	120	206
744	120	18
745	120	222
746	121	148
747	121	13
748	121	98
749	121	155
750	121	179
751	121	222
752	122	13
753	122	98
754	122	155
755	122	206
756	122	18
757	122	222
758	123	35
759	123	98
760	123	211
761	123	197
762	123	155
763	123	166
764	123	208
765	123	32
766	123	163
767	123	18
768	123	223
769	123	222
770	124	13
771	124	14
772	124	98
773	124	224
774	124	225
775	124	222
776	125	13
777	125	98
778	125	225
779	125	121
780	125	18
781	125	222
782	126	13
783	126	98
784	126	155
785	126	206
786	126	18
787	126	193
788	126	222
789	127	98
790	127	97
791	127	166
792	127	155
793	127	201
794	127	222
795	128	224
796	128	204
797	128	121
798	128	98
799	128	222
800	129	13
801	129	98
802	129	155
803	129	206
804	129	18
805	129	222
806	130	13
807	130	98
808	130	225
809	130	226
810	130	18
811	130	222
812	131	13
813	131	98
814	131	155
815	131	206
816	131	18
817	131	222
818	132	13
819	132	171
820	132	98
821	132	155
822	132	18
823	132	94
824	132	222
825	133	1
826	133	92
827	133	2
828	133	3
829	133	4
830	133	94
831	134	6
832	134	1
833	134	2
834	134	7
835	134	5
836	134	4
837	135	6
838	135	1
839	135	4
840	135	2
841	136	6
842	136	5
843	136	4
844	136	2
845	137	23
846	137	1
847	137	2
848	137	227
849	137	4
850	137	94
851	137	228
852	138	13
853	138	229
854	138	1
855	138	2
856	138	4
857	138	94
858	139	13
859	139	2
860	139	230
861	139	58
862	140	1
863	140	2
864	140	19
865	140	20
866	140	4
867	141	13
868	141	2
869	141	230
870	141	58
871	142	1
872	142	2
873	142	5
874	142	22
875	142	4
876	143	6
877	143	2
878	144	23
879	144	1
880	144	2
881	144	26
882	144	4
883	145	2
884	145	7
885	145	64
886	145	5
887	145	6
888	146	2
889	146	7
890	146	22
891	146	6
892	146	231
893	147	4
894	147	102
895	147	1
896	147	2
897	148	148
898	148	232
899	148	97
900	148	166
901	148	155
902	148	233
903	148	160
904	149	148
905	149	13
906	149	234
907	149	155
908	149	188
909	149	168
910	149	235
911	149	160
912	150	148
913	150	169
914	150	97
915	150	155
916	150	166
917	150	236
918	150	160
919	151	160
920	152	237
921	152	97
922	152	166
923	152	155
924	152	163
925	152	160
926	153	148
927	153	169
928	153	97
929	153	155
930	153	166
931	153	95
932	153	236
933	153	160
934	154	97
935	154	166
936	154	155
937	154	161
938	154	163
939	154	160
940	155	148
941	155	13
942	155	238
943	155	169
944	155	155
945	155	168
946	155	160
947	156	239
948	156	169
949	156	173
950	156	155
951	156	166
952	156	161
953	156	164
954	156	160
955	157	240
956	157	66
957	157	241
958	157	169
959	157	166
960	157	155
961	157	156
962	157	160
963	158	21
964	158	172
965	158	209
966	159	181
967	159	166
968	159	172
969	159	203
970	159	205
971	159	209
972	160	181
973	160	97
974	160	155
975	160	166
976	160	172
977	160	8
978	160	6
979	160	209
980	161	242
981	161	181
982	161	166
983	161	243
984	161	172
985	161	203
986	161	189
987	161	209
988	162	97
989	162	166
990	162	172
991	162	198
992	162	171
993	162	209
994	163	13
995	163	244
996	163	172
997	163	198
998	163	209
999	164	66
1000	164	97
1001	164	166
1002	164	172
1003	164	158
1004	164	209
1005	165	13
1006	165	14
1007	165	172
1008	165	209
1009	166	66
1010	166	169
1011	166	166
1012	166	77
1013	166	172
1014	166	245
1015	166	58
1016	166	209
1017	167	209
\.


--
-- Data for Name: books_lists; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_lists (book_list_id, book_id, list_id) FROM stdin;
2	2	1
3	3	1
4	4	1
5	5	1
7	7	1
9	9	1
10	10	1
11	11	1
12	12	1
13	13	1
14	14	1
15	15	1
16	16	2
17	17	2
18	18	2
19	19	2
20	20	2
21	21	2
22	22	2
23	23	2
24	24	2
25	25	2
26	26	2
27	27	2
28	28	2
29	29	2
30	30	2
31	31	3
32	2	3
33	4	3
34	7	3
35	32	3
36	10	3
37	33	3
38	34	3
39	35	3
40	36	3
41	37	3
42	38	3
43	39	3
44	40	3
45	41	3
46	17	4
47	18	4
48	20	4
49	21	4
50	22	4
51	25	4
52	27	4
53	24	4
54	28	4
55	42	4
56	43	4
57	44	4
58	45	4
59	46	4
60	47	4
61	3	5
62	5	5
63	9	5
64	11	5
65	12	5
66	48	5
67	13	5
68	15	5
69	49	5
70	14	5
71	50	5
72	51	5
73	52	5
74	53	5
75	54	5
76	16	6
77	19	6
78	23	6
79	26	6
80	29	6
81	30	6
82	55	6
83	56	6
84	57	6
85	58	6
86	59	6
87	60	6
88	61	6
89	62	6
90	63	6
91	64	7
92	65	7
93	66	7
94	67	7
95	68	7
96	69	7
97	70	7
98	71	7
99	72	7
100	73	7
101	74	8
102	75	8
103	76	8
104	77	8
105	78	8
106	79	8
107	80	8
108	81	8
109	82	8
110	83	8
111	84	9
112	85	9
113	86	9
114	87	9
115	88	9
116	89	9
117	90	9
118	91	9
119	92	9
120	93	9
121	94	10
122	95	10
123	96	10
124	97	10
125	98	10
126	99	10
127	100	10
128	101	10
129	102	10
130	103	10
131	104	11
132	105	11
133	106	11
134	107	11
135	108	11
136	109	11
137	110	11
138	111	11
139	112	11
140	113	11
141	64	12
142	114	12
143	67	12
144	43	12
145	115	12
146	70	12
147	57	12
148	116	12
149	117	12
150	63	12
151	118	13
152	119	13
153	120	13
154	121	13
155	122	13
156	123	13
157	124	13
158	125	13
159	126	13
160	127	13
161	128	13
162	129	13
163	130	13
164	131	13
165	132	13
166	133	14
167	134	14
168	135	14
169	136	14
170	137	14
171	138	14
172	139	14
173	140	14
174	141	14
175	142	14
176	143	14
177	144	14
178	145	14
179	146	14
180	147	14
181	148	15
182	149	15
183	150	15
184	151	15
185	152	15
8	35	1
6	32	1
186	153	15
187	154	15
188	155	15
189	156	15
190	157	15
191	158	16
192	159	16
193	160	16
194	161	16
195	162	16
196	163	16
197	164	16
198	165	16
199	166	16
200	167	16
1	31	1
\.


--
-- Data for Name: books_shelves; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_shelves (book_shelf_id, book_id, shelf_id) FROM stdin;
1	121	4
2	122	4
3	124	4
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Thrillers
2	Fiction
3	Crime
4	Suspense
5	Women
6	Romance
7	Contemporary
8	Romantic Comedy
9	New Adult
10	Medical
11	Family Life
12	Literary
13	Action & Adventure
14	Fantasy
15	Dragons & Mythical Creatures
16	Epic
17	Feminist
18	Humorous
19	Military
20	War & Military
21	Coming of Age
22	Small Town & Rural
23	Psychological
24	Lgbtq+
25	Bisexual
26	Domestic
27	Sports
28	True Crime
29	Indigenous Peoples in the Americas
30	20th Century
31	Murder
32	United States
33	History
34	Nonfiction
35	Europe
36	Mass Murder
37	Great Britain
38	Georgian Era (1714-1837)
39	Maritime History & Piracy
40	Human Anatomy & Physiology
41	Life Sciences
42	Health & Fitness
43	Aging
44	Science
45	Self-Help
46	Longevity
47	Psychology
48	Psychopathology
49	Psychotherapy
50	Psychiatry
51	Post-Traumatic Stress Disorder (PTSD)
52	Depression
53	Mental Illness
54	Schizophrenia
55	Mental Health
56	Personal Growth
57	Biography & Autobiography
58	Historical
59	Happiness
60	Entertainment & Performing Arts
61	Dysfunctional Families
62	Family & Relationships
63	Personal Memoirs
64	Royalty
65	Cultural, Ethnic & Regional
66	Death, Grief, Bereavement
67	Asian & Asian American
68	Cooking
69	Essays & Narratives
70	Rich & Famous
71	Alternative Family
72	Social Science
73	Inspiration & Personal Growth
74	Women's Studies
75	Body, Mind & Spirit
76	Social History
77	Holocaust
78	Modern
79	Jewish
80	Essays & Travelogues
81	Humor
82	Agriculture & Food
83	Topic
84	Travel
85	Celebrity & Popular Culture
86	Essays
87	Nature
88	Ethnic Studies
89	African American & Black Studies
90	Love & Romance
91	American
92	Police Procedural
93	Women Sleuths
94	Mystery & Detective
95	Siblings
96	Cultural Heritage
97	Friendship
98	Comics & Graphic Novels
99	World War II
100	Espionage
101	Political
102	Legal
103	Fatherhood
104	Parenting
105	Political Science
106	Public Policy
107	Social Classes & Economic Disparity
108	Social Policy
109	Poverty & Homelessness
110	Social Activists
111	Civil Rights
112	Genres & Styles
113	History & Criticism
114	Music
115	Judicial Power
116	Judicial Branch
117	Law
118	American Government
119	Success
120	Time Travel
121	Science Fiction
122	Marriage & Divorce
123	Form
124	Literary Collections
125	19th Century
126	Indigenous
127	State & Local
128	Southwest (AZ, NM, OK, TX)
129	Language Arts & Disciplines
130	Communication Studies
131	Interpersonal Relations
132	Social Psychology
133	Religious
134	Wars & Conflicts
135	Pacific Theater
136	Aviation & Space
137	Motivational & Inspirational
138	Cognitive Psychology & Cognition
139	Organizational Behavior
140	Business & Economics
141	Advice & How-To
142	Culinary
143	Seasonal
144	Entertaining
145	Creativity
146	Philosophy
147	Ethics & Moral Philosophy
148	Animals
149	Motherhood
150	Marriage & Family
151	Personal Finance
152	Self-Esteem
153	Affirmations
154	Fantasy & Magic
155	Juvenile Fiction
156	Legends, Myths, Fables
157	Greek & Roman
158	Lgbtq
159	Children's Books
160	Middle Grade Books
161	Disabilities
162	Diseases, Illnesses & Injuries
163	School & Education
164	Health & Daily Living
165	Emigration & Immigration
166	Social Themes
167	Military & Wars
168	Survival Stories
169	Family
170	Books & Libraries
171	Mysteries & Detective Stories
172	Young Adult Fiction
173	Juvenile Nonfiction
174	Cooking & Food
175	Crafts & Hobbies
176	Daily Activities
177	Marine Life
178	Mammals
179	Dragons, Unicorns & Mythical
180	Fairy Tales & Folklore
181	Emotions & Feelings
182	Parents
183	Holidays & Celebrations
184	Father's Day
185	Concepts
186	Opposites
187	Imagination & Play
188	Bears
189	Self-Esteem & Self-Reliance
190	Bedtime & Dreams
191	New Baby
192	Colors
193	Humorous Stories
194	Butterflies, Moths & Caterpillars
195	Stories in Verse
196	Farm Animals
197	New Experience
198	Thrillers & Suspense
199	Prejudice & Racism
200	Law & Crime
201	Adolescence & Coming of Age
202	Dating & Sex
203	Girls & Women
204	Dystopian
205	Physical & Emotional Abuse
206	Superheroes
207	Class Differences
208	People & Places
209	Young Adult Books
210	Activism & Social Justice
211	Boys & Men
212	Dark Fantasy
213	Mermaids & Mermen
214	Adaptations
215	Social Topics
216	Young Adult Nonfiction
217	Arthurian
218	Business
219	Leadership
220	Self-help
221	Individual Composer & Musician
222	Graphic Books
223	African American & Black
224	Media Tie-In
225	Manga
226	Crime & Mystery
227	Amateur Sleuth
228	Detective and mystery stories
229	International Crime & Mystery
230	Westerns
231	Clean & Wholesome
232	Zoos
233	Apes, Monkeys, etc
234	Ducks, Geese, etc
235	Robots
236	Dogs
237	Bullying
238	Wolves, Coyotes & Wild Dogs
239	Physical Impairments
240	Multigenerational
241	Asian
242	Violence
243	Sexual Abuse
244	Horror
245	Orphans & Foster Homes
\.


--
-- Data for Name: covers; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.covers (cover_id, book_id, cover_url, source) FROM stdin;
2	2	https://storage.googleapis.com/du-prd/books/images/9780593441275.jpg	NYT
3	3	https://storage.googleapis.com/du-prd/books/images/9781501110375.jpg	NYT
4	4	https://storage.googleapis.com/du-prd/books/images/9780802162175.jpg	NYT
5	5	https://storage.googleapis.com/du-prd/books/images/9781668001226.jpg	NYT
7	7	https://storage.googleapis.com/du-prd/books/images/9780385547345.jpg	NYT
9	9	https://storage.googleapis.com/du-prd/books/images/9780593438558.jpg	NYT
10	10	https://storage.googleapis.com/du-prd/books/images/9780063251922.jpg	NYT
11	11	https://storage.googleapis.com/du-prd/books/images/9781791392796.jpg	NYT
12	12	https://storage.googleapis.com/du-prd/books/images/9781501161933.jpg	NYT
13	13	https://storage.googleapis.com/du-prd/books/images/9781501171345.jpg	NYT
14	14	https://storage.googleapis.com/du-prd/books/images/9781538742570.jpg	NYT
15	15	https://storage.googleapis.com/du-prd/books/images/9781668026038.jpg	NYT
16	16	https://storage.googleapis.com/du-prd/books/images/9780385534246.jpg	NYT
17	17	https://storage.googleapis.com/du-prd/books/images/9780385534260.jpg	NYT
18	18	https://storage.googleapis.com/du-prd/books/images/9780593236598.jpg	NYT
19	19	https://storage.googleapis.com/du-prd/books/images/9780670785933.jpg	NYT
20	20	https://storage.googleapis.com/du-prd/books/images/9781476773926.jpg	NYT
21	21	https://storage.googleapis.com/du-prd/books/images/9781982185824.jpg	NYT
22	22	https://storage.googleapis.com/du-prd/books/images/9780593593806.jpg	NYT
23	23	https://storage.googleapis.com/du-prd/books/images/9780525657743.jpg	NYT
24	24	https://storage.googleapis.com/du-prd/books/images/9781250890924.jpg	NYT
25	25	https://storage.googleapis.com/du-prd/books/images/9780593243039.jpg	NYT
26	26	https://storage.googleapis.com/du-prd/books/images/9780063112360.jpg	NYT
27	27	https://storage.googleapis.com/du-prd/books/images/9780593237465.jpg	NYT
28	28	https://storage.googleapis.com/du-prd/books/images/9781250847744.jpg	NYT
29	29	https://storage.googleapis.com/du-prd/books/images/9781571313560.jpg	NYT
30	30	https://storage.googleapis.com/du-prd/books/images/9780060959470.jpg	NYT
31	31	https://storage.googleapis.com/du-prd/books/images/9781250284112.jpg	NYT
32	32	https://storage.googleapis.com/du-prd/books/images/9781649374042.jpg	NYT
33	33	https://storage.googleapis.com/du-prd/books/images/9780316402781.jpg	NYT
34	34	https://storage.googleapis.com/du-prd/books/images/9781538750636.jpg	NYT
35	35	https://storage.googleapis.com/du-prd/books/images/9780593422786.jpg	NYT
36	36	https://storage.googleapis.com/du-prd/books/images/9780063250833.jpg	NYT
37	37	https://storage.googleapis.com/du-prd/books/images/9780593243732.jpg	NYT
38	38	https://storage.googleapis.com/du-prd/books/images/9780593321201.jpg	NYT
39	39	https://storage.googleapis.com/du-prd/books/images/9780525655596.jpg	NYT
40	40	https://storage.googleapis.com/du-prd/books/images/9781982181697.jpg	NYT
41	41	https://storage.googleapis.com/du-prd/books/images/9780385548328.jpg	NYT
42	42	https://storage.googleapis.com/du-prd/books/images/9780785291817.jpg	NYT
43	43	https://storage.googleapis.com/du-prd/books/images/9780593239919.jpg	NYT
44	44	https://storage.googleapis.com/du-prd/books/images/9780374279295.jpg	NYT
45	45	https://storage.googleapis.com/du-prd/books/images/9781400043613.jpg	NYT
46	46	https://storage.googleapis.com/du-prd/books/images/9781541602632.jpg	NYT
47	47	https://storage.googleapis.com/du-prd/books/images/9780593139134.jpg	NYT
48	48	https://storage.googleapis.com/du-prd/books/images/9780525559474.jpg	NYT
49	49	https://storage.googleapis.com/du-prd/books/images/9781476753195.jpg	NYT
50	50	https://storage.googleapis.com/du-prd/books/images/9781335004888.jpg	NYT
51	51	https://storage.googleapis.com/du-prd/books/images/9781668021910.jpg	NYT
52	52	https://storage.googleapis.com/du-prd/books/images/9781250301697.jpg	NYT
53	53	https://storage.googleapis.com/du-prd/books/images/9780593420317.jpg	NYT
54	54	https://storage.googleapis.com/du-prd/books/images/9781945631832.jpg	NYT
55	55	https://storage.googleapis.com/du-prd/books/images/9780593315699.jpg	NYT
56	56	https://storage.googleapis.com/du-prd/books/images/9780743247542.jpg	NYT
57	57	https://storage.googleapis.com/du-prd/books/images/9781429969352.jpg	NYT
58	58	https://storage.googleapis.com/du-prd/books/images/9781416591061.jpg	NYT
59	59	https://storage.googleapis.com/du-prd/books/images/9780316478526.jpg	NYT
60	60	https://storage.googleapis.com/du-prd/books/images/9780399590504.jpg	NYT
61	61	https://storage.googleapis.com/du-prd/books/images/9781501198243.jpg	NYT
62	62	https://storage.googleapis.com/du-prd/books/images/9780316296618.jpg	NYT
63	63	https://storage.googleapis.com/du-prd/books/images/9781501111129.jpg	NYT
64	64	https://storage.googleapis.com/du-prd/books/images/9780735211292.jpg	NYT
65	65	https://storage.googleapis.com/du-prd/books/images/9780062820174.jpg	NYT
66	66	https://storage.googleapis.com/du-prd/books/images/9781668007631.jpg	NYT
67	67	https://storage.googleapis.com/du-prd/books/images/9780593652886.jpg	NYT
68	68	https://storage.googleapis.com/du-prd/books/images/9780062976581.jpg	NYT
69	69	https://storage.googleapis.com/du-prd/books/images/9781523515646.jpg	NYT
70	70	https://storage.googleapis.com/du-prd/books/images/9781523507870.jpg	NYT
71	71	https://storage.googleapis.com/du-prd/books/images/9781455570249.jpg	NYT
72	72	https://storage.googleapis.com/du-prd/books/images/9780062457714.jpg	NYT
73	73	https://storage.googleapis.com/du-prd/books/images/9781546004004.jpg	NYT
74	74	https://storage.googleapis.com/du-prd/books/images/9781368081153.jpg	NYT
75	75	https://storage.googleapis.com/du-prd/books/images/9780375899881.jpg	NYT
76	76	https://storage.googleapis.com/du-prd/books/images/9780545880831.jpg	NYT
77	77	https://storage.googleapis.com/du-prd/books/images/9780593533239.jpg	NYT
78	78	https://storage.googleapis.com/du-prd/books/images/9781524764203.jpg	NYT
79	79	https://storage.googleapis.com/du-prd/books/images/9781492670025.jpg	NYT
80	80	https://storage.googleapis.com/du-prd/books/images/9781665912761.jpg	NYT
81	81	https://storage.googleapis.com/du-prd/books/images/9781250147424.jpg	NYT
82	82	https://storage.googleapis.com/du-prd/books/images/9781665927222.jpg	NYT
83	83	https://storage.googleapis.com/du-prd/books/images/9781665928502.jpg	NYT
84	84	https://storage.googleapis.com/du-prd/books/images/9781492667834.jpg	NYT
85	85	https://storage.googleapis.com/du-prd/books/images/9781452126999.jpg	NYT
86	86	https://storage.googleapis.com/du-prd/books/images/9781943200085.jpg	NYT
87	87	https://storage.googleapis.com/du-prd/books/images/9780385376716.jpg	NYT
88	88	https://storage.googleapis.com/du-prd/books/images/9780399255373.jpg	NYT
89	89	https://storage.googleapis.com/du-prd/books/images/9780593226186.jpg	NYT
90	90	https://storage.googleapis.com/du-prd/books/images/9781524785895.jpg	NYT
91	91	https://storage.googleapis.com/du-prd/books/images/9780803736801.jpg	NYT
92	92	https://storage.googleapis.com/du-prd/books/images/9781338572315.jpg	NYT
93	93	https://storage.googleapis.com/du-prd/books/images/9780316486798.jpg	NYT
94	94	https://storage.googleapis.com/du-prd/books/images/9781419711329.jpg	NYT
95	95	https://storage.googleapis.com/du-prd/books/images/9780593379851.jpg	NYT
96	96	https://storage.googleapis.com/du-prd/books/images/9780063080089.jpg	NYT
97	97	https://storage.googleapis.com/du-prd/books/images/9781416995586.jpg	NYT
98	98	https://storage.googleapis.com/du-prd/books/images/9780545663267.jpg	NYT
99	99	https://storage.googleapis.com/du-prd/books/images/9780590353427.jpg	NYT
100	100	https://storage.googleapis.com/du-prd/books/images/9780545175340.jpg	NYT
101	101	https://storage.googleapis.com/du-prd/books/images/9781423131892.jpg	NYT
102	102	https://storage.googleapis.com/du-prd/books/images/9780316370950.jpg	NYT
103	103	https://storage.googleapis.com/du-prd/books/images/9780545349215.jpg	NYT
104	104	https://storage.googleapis.com/du-prd/books/images/9781339016238.jpg	NYT
105	105	https://storage.googleapis.com/du-prd/books/images/9780593374160.jpg	NYT
106	106	https://storage.googleapis.com/du-prd/books/images/9781338885101.jpg	NYT
107	107	https://storage.googleapis.com/du-prd/books/images/9781250766588.jpg	NYT
108	108	https://storage.googleapis.com/du-prd/books/images/9780063240803.jpg	NYT
109	109	https://storage.googleapis.com/du-prd/books/images/9781419760860.jpg	NYT
110	110	https://storage.googleapis.com/du-prd/books/images/9781368077224.jpg	NYT
111	111	https://storage.googleapis.com/du-prd/books/images/9781665904377.jpg	NYT
112	112	https://storage.googleapis.com/du-prd/books/images/9780593705834.jpg	NYT
113	113	https://storage.googleapis.com/du-prd/books/images/9780063045873.jpg	NYT
114	114	https://storage.googleapis.com/du-prd/books/images/9781538707944.jpg	NYT
115	115	https://storage.googleapis.com/du-prd/books/images/9780399592522.jpg	NYT
116	116	https://storage.googleapis.com/du-prd/books/images/9781466874961.jpg	NYT
117	117	https://storage.googleapis.com/du-prd/books/images/9780063224629.jpg	NYT
118	118	https://storage.googleapis.com/du-prd/books/images/9781338801910.jpg	NYT
119	119	https://storage.googleapis.com/du-prd/books/images/9781338846621.jpg	NYT
120	120	https://storage.googleapis.com/du-prd/books/images/9781338680454.jpg	NYT
121	121	https://storage.googleapis.com/du-prd/books/images/9781338730890.jpg	NYT
122	122	https://storage.googleapis.com/du-prd/books/images/9781338535624.jpg	NYT
123	123	https://storage.googleapis.com/du-prd/books/images/9780062885531.jpg	NYT
124	124	https://storage.googleapis.com/du-prd/books/images/9781974736553.jpg	NYT
125	125	https://storage.googleapis.com/du-prd/books/images/9781974736331.jpg	NYT
126	126	https://storage.googleapis.com/du-prd/books/images/9781338236590.jpg	NYT
127	127	https://storage.googleapis.com/du-prd/books/images/9781338616101.jpg	NYT
128	128	https://storage.googleapis.com/du-prd/books/images/9781684058419.jpg	NYT
129	129	https://storage.googleapis.com/du-prd/books/images/9781338323214.jpg	NYT
130	130	https://storage.googleapis.com/du-prd/books/images/9781974736287.jpg	NYT
131	131	https://storage.googleapis.com/du-prd/books/images/9780545935173.jpg	NYT
132	132	https://storage.googleapis.com/du-prd/books/images/9781534499379.jpg	NYT
133	133	https://storage.googleapis.com/du-prd/books/images/9780316420389.jpg	NYT
134	134	https://storage.googleapis.com/du-prd/books/images/9781984821676.jpg	NYT
135	135	https://storage.googleapis.com/du-prd/books/images/9780778334446.jpg	NYT
136	136	https://storage.googleapis.com/du-prd/books/images/9781250272935.jpg	NYT
137	137	https://storage.googleapis.com/du-prd/books/images/9781538753095.jpg	NYT
138	138	https://storage.googleapis.com/du-prd/books/images/9781538719725.jpg	NYT
139	139	https://storage.googleapis.com/du-prd/books/images/9780786050130.jpg	NYT
140	140	https://storage.googleapis.com/du-prd/books/images/9780593422724.jpg	NYT
141	141	https://storage.googleapis.com/du-prd/books/images/9780786049578.jpg	NYT
142	142	https://storage.googleapis.com/du-prd/books/images/9781501165375.jpg	NYT
143	143	https://storage.googleapis.com/du-prd/books/images/9780061081859.jpg	NYT
144	144	https://storage.googleapis.com/du-prd/books/images/9781420155549.jpg	NYT
145	145	https://storage.googleapis.com/du-prd/books/images/9781335147530.jpg	NYT
146	146	https://storage.googleapis.com/du-prd/books/images/9781335498410.jpg	NYT
147	147	https://storage.googleapis.com/du-prd/books/images/9780385546027.jpg	NYT
148	148	https://storage.googleapis.com/du-prd/books/images/9780061992278.jpg	NYT
149	149	https://storage.googleapis.com/du-prd/books/images/9780316381994.jpg	NYT
150	150	https://storage.googleapis.com/du-prd/books/images/9781250144058.jpg	NYT
151	151	https://storage.googleapis.com/du-prd/books/images/9780547577319.jpg	NYT
152	152	https://storage.googleapis.com/du-prd/books/images/9781338053807.jpg	NYT
153	153	https://storage.googleapis.com/du-prd/books/images/9780062991317.jpg	NYT
154	154	https://storage.googleapis.com/du-prd/books/images/9780399162596.jpg	NYT
155	155	https://storage.googleapis.com/du-prd/books/images/9780062895936.jpg	NYT
156	156	https://storage.googleapis.com/du-prd/books/images/9781416971719.jpg	NYT
157	157	https://storage.googleapis.com/du-prd/books/images/9781524715700.jpg	NYT
158	158	https://storage.googleapis.com/du-prd/books/images/9781402277832.jpg	NYT
159	159	https://storage.googleapis.com/du-prd/books/images/9781101934715.jpg	NYT
160	160	https://storage.googleapis.com/du-prd/books/images/9781534467637.jpg	NYT
161	161	https://storage.googleapis.com/du-prd/books/images/9781481449359.jpg	NYT
162	162	https://storage.googleapis.com/du-prd/books/images/9781524714680.jpg	NYT
163	163	https://storage.googleapis.com/du-prd/books/images/9780593481493.jpg	NYT
164	164	https://storage.googleapis.com/du-prd/books/images/9780062457790.jpg	NYT
165	165	https://storage.googleapis.com/du-prd/books/images/9781627792127.jpg	NYT
166	166	https://storage.googleapis.com/du-prd/books/images/9780375842207.jpg	NYT
167	167	https://storage.googleapis.com/du-prd/books/images/9781250268396.jpg	NYT
\.


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.lists (list_id, list_name, nyt_list_name_encoded) FROM stdin;
1	Combined Print & E-Book Fiction	combined-print-and-e-book-fiction
2	Combined Print & E-Book Nonfiction	combined-print-and-e-book-nonfiction
3	Hardcover Fiction	hardcover-fiction
4	Hardcover Nonfiction	hardcover-nonfiction
5	Paperback Trade Fiction	trade-fiction-paperback
6	Paperback Nonfiction	paperback-nonfiction
7	Advice, How-To & Miscellaneous	advice-how-to-and-miscellaneous
8	Children’s Middle Grade Hardcover	childrens-middle-grade-hardcover
9	Children’s Picture Books	picture-books
10	Children’s Series	series-books
11	Young Adult Hardcover	young-adult-hardcover
12	Business	business-books
13	Graphic Books and Manga	graphic-books-and-manga
14	Mass Market	mass-market-monthly
15	Middle Grade Paperback	middle-grade-paperback-monthly
16	Young Adult Paperback	young-adult-paperback-monthly
\.


--
-- Data for Name: shelves; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.shelves (shelf_id, user_id, shelf_type) FROM stdin;
1	1	To Read
2	1	Already Read
3	1	Favorites
4	2	To Read
5	2	Already Read
6	2	Favorites
7	3	To Read
8	3	Already Read
9	3	Favorites
10	4	To Read
11	4	Already Read
12	4	Favorites
13	5	To Read
14	5	Already Read
15	5	Favorites
16	6	To Read
17	6	Already Read
18	6	Favorites
19	7	To Read
20	7	Already Read
21	7	Favorites
22	8	To Read
23	8	Already Read
24	8	Favorites
25	9	To Read
26	9	Already Read
27	9	Favorites
28	10	To Read
29	10	Already Read
30	10	Favorites
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.users (user_id, user_name, email, password) FROM stdin;
1	Test User 0	user0@test.com	$pbkdf2-sha256$200000$TIlxjhHCGCNkDKG0NqZ0Dg$T7/OwINpxNt3y.NscBBWZRZatCazx1F/gjsyad0KGVw
2	Test User 1	user1@test.com	$pbkdf2-sha256$200000$3nsP4Twn5Fxr7b1XqpXS2g$m5YHkh/LYTKgnmRhxfuqbxWVkD1i2aTxAmWrkRx9duo
3	Test User 2	user2@test.com	$pbkdf2-sha256$200000$QsgZAwCgtLYWglAqZcy5Fw$GIej0R0GVkZHP0WM0SNi6uRnBy7lj.klZ4ogVvpPFww
4	Test User 3	user3@test.com	$pbkdf2-sha256$200000$Rqh1jpFyTsl5DyHEmPMeYw$mTzgAegvBc5ICgwvBDA94j9oBa2AONAleCrI/eploq8
5	Test User 4	user4@test.com	$pbkdf2-sha256$200000$ydk7ByDEmHPuvZcSwlhLqQ$4xqxLsmIjni28r3PcJ8YhmI6Lb7ZmCcYtIl.9/3xsCY
6	Test User 5	user5@test.com	$pbkdf2-sha256$200000$ZgzhXItRai0FgFDq3Vtr7Q$PtsnihaiOVaVLizX5etJIC.KV.wkvmd.g25hK.kSIqA
7	Test User 6	user6@test.com	$pbkdf2-sha256$200000$TYmRknKO0VprLYWw1jrnPA$JwdIA/CpFYeeiv66H3cEovNv2NEqCPI2RK44Kwu0AMo
8	Test User 7	user7@test.com	$pbkdf2-sha256$200000$bK11Tqn1/l8L4by3FsIYYw$YvAC0Oj3qBC/MmkxHV/nHF6qaKu.Qx1qJk5tfYzsqi0
9	Test User 8	user8@test.com	$pbkdf2-sha256$200000$.f//f49RyhnDuPf.P4cQ4g$.RZTmnNp0OUZLhmELp043CKNg.OwgqaHXkOkErCLhfU
10	Test User 9	user9@test.com	$pbkdf2-sha256$200000$OSdEKOVcC4GQck4JIWQs5Q$1YkEsa1JyIU2BnkYAYCv2jTlLUaWMCfHd4YlMy/x.S4
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 179, true);


--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_authors_book_author_id_seq', 179, true);


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_book_id_seq', 167, true);


--
-- Name: books_categories_book_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_categories_book_category_id_seq', 1017, true);


--
-- Name: books_lists_book_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_lists_book_list_id_seq', 200, true);


--
-- Name: books_shelves_book_shelf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_shelves_book_shelf_id_seq', 3, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 245, true);


--
-- Name: covers_cover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.covers_cover_id_seq', 167, true);


--
-- Name: lists_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.lists_list_id_seq', 16, true);


--
-- Name: shelves_shelf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.shelves_shelf_id_seq', 30, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


--
-- Name: authors authors_author_ol_id_key; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_author_ol_id_key UNIQUE (author_ol_id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: books_authors books_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_authors
    ADD CONSTRAINT books_authors_pkey PRIMARY KEY (book_author_id);


--
-- Name: books_categories books_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_pkey PRIMARY KEY (book_category_id);


--
-- Name: books_lists books_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_lists
    ADD CONSTRAINT books_lists_pkey PRIMARY KEY (book_list_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: books books_primary_isbn13_key; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_primary_isbn13_key UNIQUE (primary_isbn13);


--
-- Name: books_shelves books_shelves_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_shelves
    ADD CONSTRAINT books_shelves_pkey PRIMARY KEY (book_shelf_id);


--
-- Name: categories categories_category_name_key; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_name_key UNIQUE (category_name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: covers covers_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.covers
    ADD CONSTRAINT covers_pkey PRIMARY KEY (cover_id);


--
-- Name: lists lists_list_name_key; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_list_name_key UNIQUE (list_name);


--
-- Name: lists lists_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (list_id);


--
-- Name: shelves shelves_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.shelves
    ADD CONSTRAINT shelves_pkey PRIMARY KEY (shelf_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: books_authors books_authors_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_authors
    ADD CONSTRAINT books_authors_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- Name: books_authors books_authors_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_authors
    ADD CONSTRAINT books_authors_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: books_categories books_categories_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: books_categories books_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: books_lists books_lists_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_lists
    ADD CONSTRAINT books_lists_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: books_lists books_lists_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_lists
    ADD CONSTRAINT books_lists_list_id_fkey FOREIGN KEY (list_id) REFERENCES public.lists(list_id);


--
-- Name: books_shelves books_shelves_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_shelves
    ADD CONSTRAINT books_shelves_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: books_shelves books_shelves_shelf_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_shelves
    ADD CONSTRAINT books_shelves_shelf_id_fkey FOREIGN KEY (shelf_id) REFERENCES public.shelves(shelf_id);


--
-- Name: covers covers_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.covers
    ADD CONSTRAINT covers_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: shelves shelves_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.shelves
    ADD CONSTRAINT shelves_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

