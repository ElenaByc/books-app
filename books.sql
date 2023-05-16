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
    contributor_note character varying(100)
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
1	\N	James Patterson	\N	\N
2	\N	Maxine Paetro	\N	\N
3	\N	Emily Henry	\N	\N
4	\N	Carley Fortune	\N	\N
5	\N	Abraham Verghese	\N	\N
6	\N	Rebecca Yarros	\N	\N
7	\N	Danielle Steel	\N	\N
8	\N	Colleen Hoover	\N	\N
9	\N	Bonnie Garmus	\N	\N
10	\N	David Baldacci	\N	\N
11	\N	Colleen Hoover	\N	\N
12	\N	Laura Dave	\N	\N
13	\N	Colleen Hoover	\N	\N
14	\N	Mo Xiang Mo Xiang Tong Xiu	\N	\N
15	\N	Taylor Jenkins Reid	\N	\N
16	\N	Ann Napolitano	\N	\N
17	\N	David Grann	\N	\N
18	\N	Michelle Obama	\N	\N
19	\N	Luke Russert	\N	\N
20	\N	Peter Attia, MD	\N	\N
21	\N	Bessel A. Van der Kolk	\N	\N
22	\N	Prince Harry, The Duke of Sussex	\N	\N
23	\N	Jennette McCurdy	\N	\N
24	\N	Michelle Zauner	\N	\N
25	\N	Deborah Roberts	\N	\N
26	\N	Jonathan Freedland	\N	\N
27	\N	David Grann	\N	\N
28	\N	Minka Kelly	\N	\N
29	\N	Isabel Wilkerson	\N	\N
30	\N	Katy Hessel	\N	\N
31	\N	Matthew McConaughey	\N	\N
32	\N	James Patterson	\N	\N
33	\N	Maxine Paetro	\N	\N
34	\N	Patti Callahan Henry	\N	\N
35	\N	Gabrielle Zevin	\N	\N
36	\N	Jeannette Walls	\N	\N
37	\N	Justin Cronin	\N	\N
38	\N	Colleen Hoover	\N	\N
39	\N	Sunny Hostin	\N	\N
40	\N	Shelby Van Pelt	\N	\N
41	\N	Matthew Desmond	\N	\N
42	\N	Jack Curry	\N	\N
43	\N	Kat Timpf	\N	\N
44	\N	Laura Dern	\N	\N
45	\N	Diane Ladd	\N	\N
46	\N	Michio Kaku	\N	\N
47	\N	Colleen Hoover	\N	\N
48	\N	Tarryn Fisher	\N	\N
49	\N	Freida McFadden	\N	\N
50	\N	Colleen Hoover	\N	\N
51	\N	Hannah Grace	\N	\N
52	\N	Colleen Hoover	\N	\N
53	\N	Alex Michaelides	\N	\N
54	\N	Sarah Adams	\N	\N
55	\N	Lucy Score	\N	\N
56	\N	Robin Wall Kimmerer	\N	\N
57	\N	bell hooks	\N	\N
58	\N	Viola Davis	\N	\N
59	\N	Daniel Kahneman	\N	\N
60	\N	Tara Westover	\N	\N
61	\N	S. C. Gwynne	\N	\N
62	\N	David Graeber	\N	\N
63	\N	David Wengrow	\N	\N
64	\N	Angela Duckworth	\N	\N
65	\N	Jeannette Walls	\N	\N
66	\N	Malcolm Gladwell	\N	\N
67	\N	John Green	\N	\N
68	\N	Joanna Gaines	\N	\N
69	\N	James Clear	\N	\N
70	\N	Jessie Inchauspe	\N	\N
71	\N	Rick Rubin	\N	\N
72	\N	Charlie Mackesy	\N	\N
73	\N	Ramit Sethi	\N	\N
74	\N	Miranda Lambert	\N	\N
75	\N	Kayleigh McEnany	\N	\N
76	\N	William H. McRaven	\N	\N
77	\N	Rainn Wilson	\N	\N
78	\N	Rick Riordan	\N	\N
79	\N	Mark Oshiro	\N	\N
80	\N	R. J. Palacio	\N	\N
81	\N	A.F. Steadman	\N	\N
82	\N	Alan Gratz	\N	\N
83	\N	Zaila Avant-garde	\N	\N
84	\N	America's Test Kitchen Kids (COR)	\N	\N
85	\N	Soman Chainani	\N	\N
86	\N	Katherine Applegate	\N	\N
87	\N	Claribel A. Ortega	\N	\N
88	\N	Brian Selznick	\N	\N
89	\N	Kobi Yamada	\N	\N
90	\N	Adam Rubin	\N	\N
91	\N	Eric Carle	\N	\N
92	\N	Emily Winfield Martin	\N	\N
93	\N	Luvvie Ajayi Jones	\N	\N
94	\N	Gregory Lang	\N	\N
95	\N	Susanna Leonard Hill	\N	\N
96	\N	Jazmyn Simon	\N	\N
97	\N	Dulé Hill	\N	\N
98	\N	Eric Carle	\N	\N
99	\N	Drew Daywalt	\N	\N
100	\N	Vashti Harrison	\N	\N
101	\N	Katherine Applegate	\N	\N
102	\N	Suzanne Collins	\N	\N
103	\N	Jeff Kinney	\N	\N
104	\N	Holly Jackson	\N	\N
105	\N	J. K. Rowling	\N	\N
106	\N	Jenny Han	\N	\N
107	\N	Dav Pilkey	\N	\N
108	\N	Rick Riordan	\N	\N
109	\N	Leigh Bardugo	\N	\N
110	\N	Jennifer Lynn Barnes	\N	\N
111	\N	Alice Oseman	\N	\N
112	\N	Angeline Boulley	\N	\N
113	\N	Becky Albertalli	\N	\N
114	\N	Jason Reynolds	\N	\N
115	\N	Holly Jackson	\N	\N
116	\N	Alice Oseman	\N	\N
117	\N	Adam Silvera	\N	\N
118	\N	J. Elle	\N	\N
119	\N	Alexandra Bracken	\N	\N
120	\N	Alex Aster	\N	\N
121	\N	Brené Brown	\N	\N
122	\N	Jocko Willink	\N	\N
123	\N	Leif Babin	\N	\N
124	\N	Paris Hilton	\N	\N
125	\N	Dav Pilkey	\N	\N
126	\N	Dav Pilkey	\N	\N
127	\N	Dav Pilkey	\N	\N
128	\N	Tui T. Sutherland	\N	\N
129	\N	Dav Pilkey	\N	\N
130	\N	Jerry Craft	\N	\N
131	\N	Eiichiro Oda	\N	\N
132	\N	Naoya Matsumoto	\N	\N
133	\N	Dav Pilkey	\N	\N
134	\N	Ann M. Martin	\N	\N
135	\N	Kevin Eastman	\N	\N
136	\N	Peter Laird	\N	\N
137	\N	Tom Waltz	\N	\N
138	\N	Dav Pilkey	\N	\N
139	\N	Tatsuya Endo	\N	\N
140	\N	Dav Pilkey	\N	\N
141	\N	Stuart Gibbs	\N	\N
142	\N	James Patterson	\N	\N
143	\N	James O. Born	\N	\N
144	\N	Danielle Steel	\N	\N
145	\N	Sandra Brown	\N	\N
146	\N	Nora Roberts	\N	\N
147	\N	James Patterson	\N	\N
148	\N	J. D. Barker	\N	\N
149	\N	David Baldacci	\N	\N
150	\N	William W. Johnstone	\N	\N
151	\N	J.A. Johnstone	\N	\N
152	\N	Don Bentley	\N	\N
153	\N	William W. Johnstone	\N	\N
154	\N	J.A. Johnstone	\N	\N
155	\N	Megan Miranda	\N	\N
156	\N	Debbie Macomber	\N	\N
157	\N	Lisa Jackson	\N	\N
158	\N	Nora Roberts	\N	\N
159	\N	Debbie Macomber	\N	\N
160	\N	Lee Tobin McClain	\N	\N
161	\N	John Grisham	\N	\N
162	\N	Katherine Applegate	\N	\N
163	\N	Peter Brown	\N	\N
164	\N	Barbara O'Connor	\N	\N
165	\N	Linda Sue Park	\N	\N
166	\N	Gordon Korman	\N	\N
167	\N	Katherine Applegate	\N	\N
168	\N	Lynda Mullaly Hunt	\N	\N
169	\N	Rosanne Parry	\N	\N
170	\N	Sharon M. Draper	\N	\N
171	\N	Tae Keller	\N	\N
172	\N	Laura Nowlin	\N	\N
173	\N	Kathleen Glasgow	\N	\N
174	\N	Lynn Painter	\N	\N
175	\N	Amber Smith	\N	\N
176	\N	Karen M. McManus	\N	\N
177	\N	Natasha Preston	\N	\N
178	\N	Adam Silvera	\N	\N
179	\N	Leigh Bardugo	\N	\N
180	\N	Markus Zusak	\N	\N
181	\N	Stephanie Garber	\N	\N
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books (book_id, title, primary_isbn10, primary_isbn13, description, contributor_note) FROM stdin;
1	THE 23RD MIDNIGHT	0316402982	9780316402989	<p><b>The Instant #1 <i>New York Times</i> Bestseller!</b><br><br><b>An attention-seeking copycat is recreating murders by a famous killer from the Women’s Murder Club’s past—with devastating new twists.  </b></p> Detective Lindsay Boxer put serial killer Evan Burke in jail. <br>  <br> Reporter Cindy Thomas wrote a book that put him on the bestseller list.<br>  <br> An obsessed maniac has turned Burke’s true-crime story into a playbook. And is embellishing it with gruesome touches all his own. <br>  <br> Now Lindsay’s tracking an elusive suspect, and the entire Murder Club is facing destruction.	
2	HAPPY PLACE	0593441273	9780593441275	<b>A couple who broke up months ago pretend to still be together for their annual weeklong vacation with their best friends in this glittering and wise new novel from #1 <i>New York Times</i> bestselling author Emily Henry.</b><br>  <br> Harriet and Wyn have been the perfect couple since they met in college—they go together like salt and pepper, honey and tea, lobster and rolls. Except, now—for reasons they’re still not discussing—they don’t.<br>  <br> They broke up five months ago. And still haven’t told their best friends.<br>  <br> Which is how they find themselves sharing a bedroom at the Maine cottage that has been their friend group’s yearly getaway for the last decade. Their annual respite from the world, where for one vibrant, blissful week they leave behind their daily lives; have copious amounts of cheese, wine, and seafood; and soak up the salty coastal air with the people who understand them most.<br>  <br> Only this year, Harriet and Wyn are lying through their teeth while trying not to notice how desperately they still want each other. Because the cottage is for sale and this is the last week they’ll all have together in this place. They can’t stand to break their friends’ hearts, and so they’ll play their parts. Harriet will be the driven surgical resident who never starts a fight, and Wyn will be the laid-back charmer who never lets the cracks show. It’s a flawless plan (if you look at it from a great distance and through a pair of sunscreen-smeared sunglasses). After years of being in love, how hard can it be to fake it for one week…in front of those who know you best?	
3	MEET ME AT THE LAKE	0593438558	9780593438558	<b>A random connection sends two strangers on a daylong adventure where they make a promise one keeps and the other breaks, with life-changing effects, in this breathtaking new novel from the <i>New York Times</i> bestselling author of <i>Every Summer After.<br></i></b><br>Fern Brookbanks has wasted far too much of her adult life thinking about Will Baxter. She spent just twenty-four hours in her early twenties with the aggravatingly attractive, idealistic artist, a chance encounter that spiraled into a daylong adventure in the city. The timing was wrong, but their connection was undeniable: they shared every secret, every dream, and made a pact to meet one year later. Fern showed up. Will didn’t.<br><br>At thirty-two, Fern’s life doesn’t look at all how she once imagined it would. Instead of living in the city, Fern’s back home, running her mother’s lakeside resort—something she vowed never to do. The place is in disarray, her ex-boyfriend’s the manager, and Fern doesn’t know where to begin.<br><br>She needs a plan—a lifeline. To her surprise, it comes in the form of Will, who arrives nine years too late, with a suitcase in tow and an offer to help on his lips. Will may be the only person who understands what Fern’s going through. But how could she possibly trust this expensive-suit wearing mirage who seems nothing like the young man she met all those years ago. Will is hiding something, and Fern’s not sure she wants to know what it is. <br><br>But ten years ago, Will Baxter rescued Fern. Can she do the same for him?	
4	THE COVENANT OF WATER	0802162177	9780802162175	<p><b>From the <i>New York Times</i>-bestselling author of <i>Cutting for Stone </i>comes a stunning and magisterial epic of love, faith, and medicine, set in Kerala, South India, and following three generations of a family seeking the answers to a strange secret</b></p> <p><i>The Covenant of Water </i>is the long-awaited new novel by Abraham Verghese, the author of the major word-of-mouth bestseller <i>Cutting for Stone</i>, which has sold over 1.5 million copies in the United States alone and remained on the <i>New York Times </i>bestseller list for over two years.</p> <p>Spanning the years 1900 to 1977, <i>The Covenant of Water </i>is set in Kerala, on South India's Malabar Coast, and follows three generations of a family that suffers a peculiar affliction: in every generation, at least one person dies by drowning--and in Kerala, water is everywhere. At the turn of the century, a twelve-year-old girl from Kerala's long-existing Christian community, grieving the death of her father, is sent by boat to her wedding, where she will meet her forty-year-old husband for the first time. From this unforgettable new beginning, the young girl--and future matriarch, known as Big Ammachi--will witness unthinkable changes over the span of her extraordinary life, full of joy and triumph as well as hardship and loss, her faith and love the only constants.</p> <p>A shimmering evocation of a bygone India and of the passage of time itself, <i>The Covenant of Water </i>is a hymn to progress in medicine and to human understanding, and a humbling testament to the difficulties undergone by past generations for the sake of those alive today. It is one of the most masterful literary novels published in recent years.</p>	
5	FOURTH WING	1649374046	9781649374042	<p><b>LIMITED FIRST PRINT EDITION—featuring spray-painted edges with stenciled flying dragons, as well as gorgeously detailed map endpapers. This breathtaking first edition is only available for a limited time and while supplies last.<br></b><br><i>"Suspenseful, sexy, and with incredibly entertaining storytelling, the first in Yarros' Empyrean series will delight fans of romantic, adventure-filled fantasy."</i> —<i><b>Booklist</b></i><b>, starred review</b><br><br><i>"</i>Fourth Wing<i> will have your heart pounding from beginning to end... A fantasy like you've never read before."</i> <b>―#1 <i>New York Times</i> bestselling author Jennifer L. Armentrout</b><br><br><br><b>Enter the brutal and elite world of a war college for dragon riders from <i>USA Today</i> bestselling author Rebecca Yarros</b><br><br>Twenty-year-old Violet Sorrengail was supposed to enter the Scribe Quadrant, living a quiet life among books and history. Now, the commanding general—also known as her tough-as-talons mother—has ordered Violet to join the hundreds of candidates striving to become the elite of Navarre: <i>dragon riders</i>.<br><br>But when you’re smaller than everyone else and your body is brittle, death is only a heartbeat away...because dragons don’t bond to “fragile” humans. They incinerate them.<br><br>With fewer dragons willing to bond than cadets, most would kill Violet to better their own chances of success. The rest would kill her just for being her mother’s daughter—like Xaden Riorson, the most powerful and ruthless wingleader in the Riders Quadrant.<br><br>She’ll need every edge her wits can give her just to see the next sunrise.<br><br>Yet, with every day that passes, the war outside grows more deadly, the kingdom's protective wards are failing, and the death toll continues to rise. Even worse, Violet begins to suspect leadership is hiding a terrible secret.<br><br>Friends, enemies, lovers. Everyone at Basgiath War College has an agenda—because once you enter, there are only two ways out: <i>graduate or die</i>.</p>	
84	DRAGONS LOVE TACOS	0803736800	9780803736801	<b>A #1 <i>New York Times</i> bestselling phenomenon, this deliciously funny read-aloud is an unforgettable tale of new friends and the perfect snack that will make you laugh until spicy salsa comes out of your nose.</b><br><br> Dragons love tacos. They love chicken tacos, beef tacos, great big tacos, and teeny tiny tacos. So if you want to lure a bunch of dragons to your party, you should definitely serve tacos. Buckets and buckets of tacos. Unfortunately, where there are tacos, there is also salsa. And if a dragon accidentally eats spicy salsa . . . oh, boy. You're in red-hot trouble.<br><br>This makes the perfect gift for any special occasion, from award-winning team of Adam Rubin and Daniel Salmieri who created <i>Dragons Love Tacos 2: The Sequel</i>,<i> El Chupacabras</i>, <i>High Five</i>, <i>Robo-Sauce, and Secret Pizza Party.</i>	Illustrated by daniel salmieri
85	THANK YOU, TEACHER FROM THE VERY HUNGRY CATERPILLAR	0593226186	9780593226186	<b>Show your teachers how much you appreciate them in this colorful book of thanks featuring The Very Hungry Caterpillar.</b><br><br>Perfect for National Teacher Day, Teacher Appreciation Week, the end of the school year, or just because! This heartwarming gift book is a perfect thank-you gift for teachers everywhere. Using bright and colorful Eric Carle imagery, plus The Very Hungry Caterpillar, this story provides all the reasons why the teachers in our lives are so special and why we're so thankful for them.	
6	THE WEDDING PLANNER	1984821776	9781984821775	<b>In this captivating novel from #1 <i>New York Times</i> bestselling author Danielle Steel, a wildly successful, unmarried wedding planner leads her clients to happily ever after.</b><br><br>Faith Ferguson is New York’s most in-demand wedding planner, an arbiter of taste for elegant affairs, lavish ceremonies, and exclusive fêtes. She appreciates a simple celebration as much as a dazzling event, for she knows that a dream wedding is not necessarily the most expensive one.<br><br> As much as Faith enjoys her work, her two failed engagements leave her with no desire to get married herself. She finds fulfillment in her close relationship with her twin sister, Hope, her role as a mentor for her assistant, Violet, and her career. <br><br> This year, new clients have flocked to her, and she signs up an extravagant reception, a mid-sized gathering, and an intimate soirée, in addition to her mother’s next marriage and Violet’s modest ceremony. Faith finds herself forming bonds with her new clients and their loved ones—most notably the handsome brother of one of her grooms.<br><br> But weddings are not always all champagne and roses, and in no time, Faith is grappling with private quarrels, unplanned pregnancies, family scandals, dark secrets, and the possibility of cancelled ceremonies. Through her own journey, Faith will prove once and for all that there is not just one path to happily ever after.<br><br> In <i>The Wedding Planner,</i> Danielle Steel presents an enchanting story about the winding road to love and the many ways to find joy while staying true to oneself.	
7	IT ENDS WITH US	1501110365	9781501110368	<b><b>From the #1 <i>New York Times</i> bestselling author of <i>It Starts with Us </i>and <i>All Your Perfects</i>, a</b><b> “brave and heartbreaking novel that digs its claws into you and doesn’t let go, long after you’ve finished it” (Anna Todd, <i>New York Times</i> bestselling author) about a workaholic with a too-good-to-be-true romance can’t stop thinking about her first love—</b></b><b>soon to be a major motion picture starring Blake Lively and Justin Baldoni.</b><br><br>Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.<br> <br>Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.<br> <br>As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.<br> <br>An honest, evocative, and tender novel, <i>It Ends with Us</i> is “a glorious and touching read, a forever keeper. The kind of book that gets handed down” (<i>USA TODAY</i>).	
8	LESSONS IN CHEMISTRY	038554734X	9780385547345	<b><i>NEW YORK TIMES</i> BESTSELLER • <i>GOOD MORNING AMERICA</i> BOOK CLUB PICK • A must-read debut! Meet Elizabeth Zott: a “formidable, unapologetic and inspiring” (<i>PARADE</i>) scientist in 1960s California whose career takes a detour when she becomes the unlikely star of a beloved TV cooking show in this novel that is “irresistible, satisfying and full of fuel. It reminds you that change takes time and always requires heat” (<i>The New York Times Book Review</i>).</b><br><br><b>"A unique heroine ... you'll find yourself wishing she wasn’t fictional." —<i>Seattle Times</i></b><br><br><b><i> </i></b>Chemist Elizabeth Zott is not your average woman. In fact, Elizabeth Zott would be the first to point out that there is no such thing as an <i>average</i> woman. But it’s the early 1960s and her all-male team at Hastings Research Institute takes a very unscientific view of equality. Except for one: Calvin Evans; the lonely, brilliant, Nobel–prize nominated grudge-holder who falls in love with—of all things—her mind. True chemistry results. <br><br>But like science, life is unpredictable. Which is why a few years later Elizabeth Zott finds herself not only a single mother, but the reluctant star of America’s most beloved cooking show <i>Supper at Six</i>. Elizabeth’s unusual approach to cooking (“combine one tablespoon acetic acid with a pinch of sodium chloride”) proves revolutionary. But as her following grows, not everyone is happy. Because as it turns out, Elizabeth Zott isn’t just teaching women to cook. She’s daring them to change the status quo. <br><br>Laugh-out-loud funny, shrewdly observant, and studded with a dazzling cast of supporting characters, <i>Lessons in Chemistry</i> is as original and vibrant as its protagonist.	
9	SIMPLY LIES	1538750635	9781538750636	<p><b>From the #1 <i>New York Times</i> bestselling author of <i>The 6:20 Man</i> comes a twisting new psychological thriller in which two women--one a former detective, the other a dangerous con artist--go head-to-head in an electrifying game of cat and mouse.</b><br> <br> <br> Mickey Gibson, single mother and former detective, leads a hectic life similar to that of many moms: juggling the demands of her two small children with the tasks of her job working remotely for ProEye, a global investigation company that hunts down wealthy tax and credit cheats. </p> <p>When Mickey gets a call from a colleague named Arlene Robinson, she thinks nothing of Arlene's unusual request for her to go inventory the vacant home of an arms dealer who cheated ProEye's clients and fled. That is, until she arrives at the mansion to discover a dead body in a secret room--and that nothing is as it seems. </p> <p>Not only does the arms dealer not exist but the murder victim turns out to be Harry Langhorne, a man with mob ties who used to be in Witness Protection. What's more, no one named Arlene Robinson works at ProEye. </p> <p>In the blink of an eye, Gibson has become a prime suspect in a murder investigation--and now her job is also on the line until she proves that she was set up. Before long, Gibson is locked in a battle of wits with a brilliant woman with no name, a hidden past, and unknown motives--whose end game is as mysterious as it is deadly. </p>	
86	THE WONDERFUL THINGS YOU WILL BE	0385376715	9780385376716	<b>The<i> New York Times</i> bestseller that celebrates the dreams, acceptance, and love that parents have for their children . . . now and forever. This is the perfect heartfelt gift for kids of all ages, plus a great choice for baby showers, birthdays, graduations, and other new beginnings!<br></b> <br> From brave and bold to creative and clever, Emily Winfield Martin's rhythmic rhyme expresses all the loving things that parents think of when they look at their children. With beautiful, lush illustrations and a stunning gatefold that opens at the end, this is a book that families will love reading over and over. <br><br><i> The Wonderful Things You Will Be</i> has a loving and truthful message that will endure for lifetimes and makes a great gift to the ones you love for any occasion.	
10	IT STARTS WITH US	1668001225	9781668001226	<b>Before <i>It Ends with Us</i>, it started with Atlas. Colleen Hoover tells fan favorite Atlas’s side of the story and shares what comes next in this long-anticipated sequel to the “glorious and touching” (<i>USA TODAY</i>) #1 <i>New York Times</i> bestseller <i>It Ends with Us</i>.</b><br><br>Lily and her ex-husband, Ryle, have just settled into a civil coparenting rhythm when she suddenly bumps into her first love, Atlas, again. After nearly two years separated, she is elated that for once, time is on their side, and she immediately says yes when Atlas asks her on a date.<br> <br>But her excitement is quickly hampered by the knowledge that, though they are no longer married, Ryle is still very much a part of her life—and Atlas Corrigan is the one man he will hate being in his ex-wife and daughter’s life.<br> <br>Switching between the perspectives of Lily and Atlas, <i>It Starts with Us</i> picks up right where the epilogue for the “gripping, pulse-pounding” (Sarah Pekkanen, author of <i>Perfect Neighbors</i>) bestselling phenomenon <i>It Ends with Us</i> left off. Revealing more about Atlas’s past and following Lily as she embraces a second chance at true love while navigating a jealous ex-husband, it proves that “no one delivers an emotional read like Colleen Hoover” (Anna Todd, <i>New York Times</i> bestselling author).	
11	THE LAST THING HE TOLD ME	1501171356	9781501171352	<b>#1 <i>NEW YORK TIMES</i> BLOCKBUSTER</b> * <b>REESE WITHERSPOON BOOK CLUB PICK * NOW AN APPLE TV+ LIMITED SERIES STARRING JENNIFER GARNER * MORE THAN 2 MILLION COPIES SOLD</b><br> <br><b>The “page-turning, exhilarating” (<i>PopSugar</i>) and “heartfelt thriller” (<i>Real Simple</i>) about a woman who thinks she’s found the love of her life—until he disappears.</b><br><br>Before Owen Michaels disappears, he smuggles a note to his beloved wife of one year: <i>Protect her</i>. Despite her confusion and fear, Hannah Hall knows exactly to whom the note refers—Owen’s sixteen-year-old daughter, Bailey. Bailey, who lost her mother tragically as a child. Bailey, who wants absolutely nothing to do with her new stepmother.<br> <br>As Hannah’s increasingly desperate calls to Owen go unanswered, as the FBI arrests Owen’s boss, as a US marshal and federal agents arrive at her Sausalito home unannounced, Hannah quickly realizes her husband isn’t who he said he was. And that Bailey just may hold the key to figuring out Owen’s true identity—and why he really disappeared.<br> <br>Hannah and Bailey set out to discover the truth. But as they start putting together the pieces of Owen’s past, they soon realize they’re also building a new future—one neither of them could have anticipated.<br> <br>With its breakneck pacing, dizzying plot twists, and evocative family drama, <i>The Last Thing He Told Me</i> is a “page-turning, exhilarating, and unforgettable” (<i>PopSugar</i>) suspense novel.	
12	VERITY	1538724731	9781538724736	<b>#1 <i>New York Times</i></b><b> Bestseller</b><br> <br> <b><i>USA Today</i> Bestseller<br> <br> <i>The Globe and Mail</i> Bestseller<br> <br> <i>Publishers Weekly</i> Bestseller<br> <br> <br> <br> <i>Whose truth is the lie? </i>Stay up all night reading the sensational psychological thriller that has readers obsessed, from the #1 <i>New York Times</i> bestselling author of <i>It Ends With Us</i>.</b><br> <br> <br> <br> Lowen Ashleigh is a struggling writer on the brink of financial ruin when she accepts the job offer of a lifetime. Jeremy Crawford, husband of bestselling author Verity Crawford, has hired Lowen to complete the remaining books in a successful series his injured wife is unable to finish.<br> <br> <br> <br> Lowen arrives at the Crawford home, ready to sort through years of Verity's notes and outlines, hoping to find enough material to get her started. What Lowen doesn't expect to uncover in the chaotic office is an unfinished autobiography Verity never intended for anyone to read. Page after page of bone-chilling admissions, including Verity's recollection of the night her family was forever altered.<br> <br> <br> <br> Lowen decides to keep the manuscript hidden from Jeremy, knowing its contents could devastate the already grieving father. But as Lowen's feelings for Jeremy begin to intensify, she recognizes all the ways she could benefit if he were to read his wife's words. After all, no matter how devoted Jeremy is to his injured wife, a truth this horrifying would make it impossible for him to continue loving her.	
13	GRANDMASTER OF DEMONIC CULTIVATION: MO DAO ZU SHI, VOL. 5	1685798403	9781685798406	<b>Limited Edition (one printing only!) of the <i>NEW YORK TIMES</i> BEST SELLER! Also known as <i>MDZS,</i> the blockbuster danmei/Boys' Love novels from China that inspired comics, animation, and the live-action series <i>The Untamed</i>!<br> <br> In this final book (Volume 5), read the conclusion to this historical fantasy tale of two powerful men who find each other through life and death. Also includes bonus stories!</b><br> <br> Wei Wuxian and Lan Wangji are headed for a showdown at Guanyin Temple, where their path converges with Jin Guangyao and Nie Mingjue's reassembled fierce corpse. With decades-long schemes finally unveiled, and terrible secrets unearthed, the events of this rain-battered night will decide not just the future of the entire cultivation world...but also that of a love story two lifetimes in the making.<br> <br> Also included in this final volume are eight short stories about what happens when an epic tale ends but life goes on. From magical incense burners to tense banquets, lotus-pod-hunting to Night Hunts with the juniors--these stories span dawn to dusk and so much more!<br> <br> <b>This limited Special Edition contains the Standard Edition, but with bonus merchandise shrinkwrapped to the book: a set of five postcards, a double-sided bookmark, two folded mini posters, a sticker sheet, and a lined notebook. Don't miss the new art from guest artists included in this special merch!</b>	
14	THE SEVEN HUSBANDS OF EVELYN HUGO	1501161938	9781501161933	<b><i>NEW YORK TIMES</i></b><b> BESTSELLER</b><br> <br><b>“If you</b>’<b>re looking for a book to take on holiday this summer, <i>The Seven Husbands of Evelyn Hugo</i> has got all the glitz and glamour to make it a perfect beach read.” —<i>Bustle</i></b><br> <br><b>From the <i>New York Times</i> bestselling author of <i>Daisy Jones & the Six</i>—an entrancing and “wildly addictive journey of a reclusive Hollywood starlet” (<i>PopSugar</i>) as she reflects on her relentless rise to the top and the risks she took, the loves she lost, and the long-held secrets the public could never imagine.</b><br><br>Aging and reclusive Hollywood movie icon Evelyn Hugo is finally ready to tell the truth about her glamorous and scandalous life. But when she chooses unknown magazine reporter Monique Grant for the job, no one is more astounded than Monique herself. Why her? Why now?<br> <br>Monique is not exactly on top of the world. Her husband has left her, and her professional life is going nowhere. Regardless of why Evelyn has selected her to write her biography, Monique is determined to use this opportunity to jumpstart her career.<br> <br>Summoned to Evelyn’s luxurious apartment, Monique listens in fascination as the actress tells her story. From making her way to Los Angeles in the 1950s to her decision to leave show business in the ‘80s, and, of course, the seven husbands along the way, Evelyn unspools a tale of ruthless ambition, unexpected friendship, and a great forbidden love. Monique begins to feel a very real connection to the legendary star, but as Evelyn’s story near its conclusion, it becomes clear that her life intersects with Monique’s own in tragic and irreversible ways.<br> <br>“Heartbreaking, yet beautiful” (Jamie Blynn, <i>Us Weekly</i>), <i>The Seven Husbands of Evelyn Hugo </i>is “Tinseltown drama at its finest” (<i>Redbook</i>): a mesmerizing journey through the splendor of old Hollywood into the harsh realities of the present day as two women struggle with what it means—and what it costs—to face the truth.	
27	TELL ME EVERYTHING	1250852064	9781250852069	<p><b>“A timely, urgent portrait of working-class American women.”</b><br><b>—Gabrielle Union</b><br><br><b>In her highly anticipated memoir <i>Tell Me Everything</i>,</b><b> Minka Kelly shares a story as powerful as it is page-turning.<br></b><br>Fans know her as the spoiled, rich cheerleader Lyla Garrity on <i>Friday Night Lights</i> or as the affluent, mysterious Samantha on the HBO megahit <i>Euphoria</i>. But as revealed for the first time in these pages, Minka Kelly’s life has been anything but easy.<br><br>Raised by a single mother who worked as a stripper and struggled with addiction, Minka spent years waking up in strange apartments as she and her mom bounced around the country, relying on friends and relatives to take them in. At times they even lived in storage units. She reconnected with her father, Aerosmith’s Rick Dufay, and eventually made her way to Los Angeles, where she landed the role of a lifetime on <i>Friday Night Lights</i>.<br><br>Now an established actress and philanthropist, Minka takes this next step in her career as a writer. She has poured her soul into the pages of this book, which ultimately tells a story of triumph over adversity, and how resilience and love are all we have in the end.</p>	
28	CASTE	None	9780593230268	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • OPRAH’S BOOK CLUB PICK • “An instant American classic and almost certainly the keynote nonfiction book of the American century thus far.”—Dwight Garner, <i>The New York Times</i></b><br><br><b>The Pulitzer Prize–winning, bestselling author of <i>The Warmth of Other Suns</i> examines the unspoken caste system that has shaped America and shows how our lives today are still defined by a hierarchy of human divisions.</b><br><br><b>#1 NONFICTION BOOK OF THE YEAR: <i>Time<br></i>ONE OF THE BEST BOOKS OF THE YEAR: <i>The Washington Post, The New York Times, Los Angeles Times, The Boston Globe, O: The Oprah Magazine,</i> NPR, <i>Bloomberg, The Christian Science Monitor, New York Post,</i> The New York Public Library, <i>Fortune, Smithsonian Magazine, Marie Claire, Slate, Library Journal, Kirkus Reviews</i></b><br><br><b>Winner of the Carl Sandberg Literary Award • Winner of the Los Angeles Times Book Prize • National Book Award Longlist • National Book Critics Circle Award Finalist • Dayton Literary Peace Prize Finalist • PEN/John Kenneth Galbraith Award for Nonfiction Finalist • PEN/Jean Stein Book Award Longlist • Kirkus Prize Finalist</b><br><br><i>“As we go about our daily lives, caste is the wordless usher in a darkened theater, flashlight cast down in the aisles, guiding us to our assigned seats for a performance. The hierarchy of caste is not about feelings or morality. It is about power—which groups have it and which do not.”</i><br> <br>In this brilliant book, Isabel Wilkerson gives us a masterful portrait of an unseen phenomenon in America as she explores, through an immersive, deeply researched, and beautifully written narrative and stories about real people, how America today and throughout its history has been shaped by a hidden caste system, a rigid hierarchy of human rankings.<br> <br>Beyond race, class, or other factors, there is a powerful caste system that influences people’s lives and behavior and the nation’s fate. Linking the caste systems of America, India, and Nazi Germany, Wilkerson explores eight pillars that underlie caste systems across civilizations, including divine will, bloodlines, stigma, and more. Using riveting stories about people—including Martin Luther King, Jr., baseball’s Satchel Paige, a single father and his toddler son, Wilkerson herself, and many others—she shows the ways that the insidious undertow of caste is experienced every day. She documents how the Nazis studied the racial systems in America to plan their outcasting of the Jews; she discusses why the cruel logic of caste requires that there be a bottom rung for those in the middle to measure themselves against; she writes about the surprising health costs of caste, in depression and life expectancy, and the effects of this hierarchy on our culture and politics. Finally, she points forward to ways America can move beyond the artificial and destructive separations of human divisions, toward hope in our common humanity.<br><br>Original and revealing, <i>Caste: The Origins of Our Discontents</i> is an eye-opening story of people and history, and a reexamination of what lies under the surface of ordinary lives and of American life today.	
15	HELLO BEAUTIFUL	0593243730	9780593243732	<b><b><i>NEW YORK TIMES </i>BESTSELLER • </b>OPRAH’S BOOK CLUB PICK • From the author of <i>Dear Edward</i> comes a “powerfully affecting” (<i>People</i>) family story that asks: Can love make a broken person whole?</b><br><br><b>“Another tender tearjerker . . . Napolitano chronicles life’s highs and lows with aching precision.”—<i>The Washington Post</i></b><br><br>William Waters grew up in a house silenced by tragedy, where his parents could hardly bear to look at him, much less love him—so when he meets the spirited and ambitious Julia Padavano in his freshman year of college, it’s as if the world has lit up around him. With Julia comes her family, as she and her three sisters are inseparable: Sylvie, the family’s dreamer, is happiest with her nose in a book; Cecelia is a free-spirited artist; and Emeline patiently takes care of them all. With the Padavanos, William experiences a newfound contentment; every moment in their house is filled with loving chaos.<br><br>But then darkness from William’s past surfaces, jeopardizing not only Julia’s carefully orchestrated plans for their future, but the sisters’ unshakeable devotion to one another. The result is a catastrophic family rift that changes their lives for generations. Will the loyalty that once rooted them be strong enough to draw them back together when it matters most?<br><br>An exquisite homage to Louisa May Alcott’s timeless classic, <i>Little Women</i>, <i>Hello Beautiful</i> is a profoundly moving portrait of what is possible when we choose to love someone not in spite of who they are, but because of it.	
16	THE WAGER	0385534264	9780385534260	<b>From the #1 <i>New York Times</i> bestselling author of <i>Killers of the Flower Moon</i>, a page-turning story of shipwreck, survival, and savagery, culminating in a court martial that reveals a shocking truth. With the twists and turns of a thriller Grann unearths the deeper meaning of the events on the <i>Wager</i>, showing that it was not only the captain and crew who ended up on trial, but the very idea of empire.</b><br><br>On January 28, 1742, a ramshackle vessel of patched-together wood and cloth washed up on the coast of Brazil. Inside were thirty emaciated men, barely alive, and they had an extraordinary tale to tell. They were survivors of His Majesty’s Ship the Wager, a British vessel that had left England in 1740 on a secret mission during an imperial war with Spain. While the Wager had been chasing a Spanish treasure-filled galleon known as “the prize of all the oceans,” it had wrecked on a desolate island off the coast of Patagonia. The men, after being marooned for months and facing starvation, built the flimsy craft and sailed for more than a hundred days, traversing 2500 miles of storm-wracked seas. They were greeted as heroes.<br><br>But then ... six months later, another, even more decrepit craft landed on the coast of Chile. This boat contained just three castaways, and they told a very different story. The thirty sailors who landed in Brazil were not heroes – they were mutineers. The first group responded with countercharges of their own, of a tyrannical and murderous senior officer and his henchmen. It became clear that while stranded on the island the crew had fallen into anarchy, with warring factions fighting for dominion over the barren wilderness. As accusations of treachery and murder flew, the Admiralty convened a court martial to determine who was telling the truth. The stakes were life-and-death—for whomever the court found guilty could hang.<br><br><i>The Wager</i> is a grand tale of human behavior at the extremes told by one of our greatest nonfiction writers. Grann’s recreation of the hidden world on a British warship rivals the work of Patrick O’Brian, his portrayal of the castaways’ desperate straits stands up to the classics of survival writing such as <i>The Endurance</i>, and his account of the court martial has the savvy of a Scott Turow thriller. As always with Grann’s work, the incredible twists of the narrative hold the reader spellbound.	
17	THE LIGHT WE CARRY	0593237463	9780593237465	<b>In an inspiring follow-up to her critically acclaimed, #1 bestselling memoir <i>Becoming, </i>former First Lady Michelle Obama shares practical wisdom and powerful strategies for staying hopeful and balanced in today’s highly uncertain world. </b><br>  <br>There may be no tidy solutions or pithy answers to life’s big challenges, but Michelle Obama believes that we can all locate and lean on a set of tools to help us better navigate change and remain steady within flux. In<i> The Light We Carry,</i> she opens a frank and honest dialogue with readers, considering the questions many of us wrestle with: How do we build enduring and honest relationships? How can we discover strength and community inside our differences? What tools do we use to address feelings of self-doubt or helplessness? What do we do when it all starts to feel like too much?<br> <br>Michelle Obama offers readers a series of fresh stories and insightful reflections on change, challenge, and power, including her belief that when we light up for others, we can illuminate the richness and potential of the world around us, discovering deeper truths and new pathways for progress. Drawing from her experiences as a mother, daughter, spouse, friend, and First Lady, she shares the habits and principles she has developed to successfully adapt to change and overcome various obstacles—the earned wisdom that helps her continue to “become.” She details her most valuable practices, like “starting kind,” “going high,” and assembling a “kitchen table” of trusted friends and mentors. With trademark humor, candor, and compassion, she also explores issues connected to race, gender, and visibility, encouraging readers to work through fear, find strength in community, and live with boldness.<br> <br>“When we are able to recognize our own light, we become empowered to use it,” writes Michelle Obama. A rewarding blend of powerful stories and profound advice that will ignite conversation, <i>The Light We Carry</i> inspires readers to examine their own lives, identify their sources of gladness, and connect meaningfully in a turbulent world.	
18	LOOK FOR ME THERE	0785291814	9780785291817	<p>In Look for Me There, Luke Russert traverses terrain both physical and deeply personal. On his journey to some of the world's most stunning destinations, he visits the internal places of grief, family, faith, ambition, and purpose--with intense self-reflection, honesty, and courage."--Savannah Guthrie, coanchor of Today</p><p>"Look for me there," news legend Tim Russert would tell his son, Luke, when confirming a pickup spot at an airport, sporting event, or rock concert. After Tim died unexpectedly, Luke kept looking for his father, following in Tim's footsteps and carving out a highly successful career at NBC News. After eight years covering politics on television, Luke realized he had no good answer as to why he was chasing his father's legacy. As the son of two accomplished parents--his mother is journalist Maureen Orth of Vanity Fair--Luke felt the pressure of high expectations but suddenly decided to leave the familiar path behind.</p><p>Instead, Luke set out on his own to find answers. What began as several open-ended months of travel to decompress and reassess morphed into a three-plus-year odyssey across six continents to discover the world and, ultimately, to find himself.</p><p>Chronicling the important lessons and historical understandings Luke discovered from his travels, Look for Me There is both the vivid narrative of that journey and the emotional story of a young man taking charge of his life, reexamining his relationship with his parents, and finally grieving his larger-than-life father, who died too young. </p><p>For anyone uncertain about the direction of their life or unsure of how to move forward after a loss, Look for Me There is a poignant reflection that offers encouragement to examine our choices, take risks, and discover our truest selves.</p>	
19	OUTLIVE	0593236599	9780593236598	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • A groundbreaking manifesto on living better and longer that challenges the conventional medical thinking on aging and reveals a new approach to preventing chronic disease and extending long-term health, from a visionary physician and leading longevity expert</b><br> <br><b>“One of the most important books you’ll ever read.”—Steven D. Levitt, <i>New York Times </i>bestselling author of <i>Freakonomics</i></b><br> <br>Wouldn’t you like to live longer? And better? In this operating manual for longevity, Dr. Peter Attia draws on the latest science to deliver innovative nutritional interventions, techniques for optimizing exercise and sleep, and tools for addressing emotional and mental health.<br> <br>For all its successes, mainstream medicine has failed to make much progress against the diseases of aging that kill most people: heart disease, cancer, Alzheimer’s disease, and type 2 diabetes. Too often, it intervenes with treatments too late to help, prolonging lifespan at the expense of healthspan, or quality of life. Dr. Attia believes we must replace this outdated framework with a personalized, proactive strategy for longevity, one where we take action now, rather than waiting.<br> <br>This is not “biohacking,” it’s science: a well-founded strategic and tactical approach to extending lifespan while also improving our physical, cognitive, and emotional health. Dr. Attia’s aim is less to tell you <i>what to do</i> and more to help you learn <i>how to think</i> about long-term health, in order to create the best plan for you as an individual. In <i>Outlive</i>, readers will discover:<br> <br>• Why the cholesterol test at your annual physical doesn’t tell you enough about your actual risk of dying from a heart attack.<br>• That you may already suffer from an extremely common yet underdiagnosed liver condition that could be a precursor to the chronic diseases of aging.<br>• Why exercise is the most potent pro-longevity “drug”—and how to begin training for the “Centenarian Decathlon.”<br>• Why you should forget about diets, and focus instead on <i>nutritional biochemistry, </i>using technology and data to personalize your eating pattern.<br>• Why striving for physical health and longevity, but ignoring emotional health, could be the ultimate curse of all.<br> <br>Aging and longevity are far more malleable than we think; our fate is not set in stone. With the right roadmap, you can plot a different path for your life, one that lets you outlive your genes to make each decade better than the one before.	
20	THE BODY KEEPS THE SCORE	0143127748	9780143127741	<b>#1 <i>New York Times </i>bestseller<br><br>“Essential reading for anyone interested in understanding and treating traumatic stress and the scope of its impact on society.” —Alexander McFarlane, Director of the Centre for Traumatic Stress Studies<br><br>A pioneering researcher transforms our understanding of trauma and offers a bold new paradigm for healing in this <b><b><b><i>New York Times</i> bestseller</b></b></b></b><br> <br>Trauma is a fact of life. Veterans and their families deal with the painful aftermath of combat; one in five Americans has been molested; one in four grew up with alcoholics; one in three couples have engaged in physical violence. Dr. Bessel van der Kolk, one of the world’s foremost experts on trauma, has spent over three decades working with survivors. In <i>The Body Keeps the Score</i>, he uses recent scientific advances to show how trauma literally reshapes both body and brain, compromising sufferers’ capacities for pleasure, engagement, self-control, and trust. He explores innovative treatments—from neurofeedback and meditation to sports, drama, and yoga—that offer new paths to recovery by activating the brain’s natural neuroplasticity. Based on Dr. van der Kolk’s own research and that of other leading specialists, <i>The Body Keeps the Score </i>exposes the tremendous power of our relationships both to hurt and to heal—and offers new hope for reclaiming lives.	
21	SPARE	0593593804	9780593593806	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • Discover the global phenomenon that tells an unforgettable story of love, loss, and healing.<br><br>“Compellingly artful . . . [a] blockbuster memoir.”—<i>The New Yorker</i><br><br></b>It was one of the most searing images of the twentieth century: two young boys, two princes, walking behind their mother’s coffin as the world watched in sorrow—and horror. As Princess Diana was laid to rest, billions wondered what Prince William and Prince Harry must be thinking and feeling—and how their lives would play out from that point on.<br><br>For Harry, this is that story at last.<br><br>Before losing his mother, twelve-year-old Prince Harry was known as the carefree one, the happy-go-lucky Spare to the more serious Heir. Grief changed everything. He struggled at school, struggled with anger, with loneliness—and, because he blamed the press for his mother’s death, he struggled to accept life in the spotlight.<br><br>At twenty-one, he joined the British Army. The discipline gave him structure, and two combat tours made him a hero at home. But he soon felt more lost than ever, suffering from post-traumatic stress and prone to crippling panic attacks. Above all, he couldn’t find true love. <br><br>Then he met Meghan. The world was swept away by the couple’s cinematic romance and rejoiced in their fairy-tale wedding. But from the beginning, Harry and Meghan were preyed upon by the press, subjected to waves of abuse, racism, and lies. Watching his wife suffer, their safety and mental health at risk, Harry saw no other way to prevent the tragedy of history repeating itself but to flee his mother country. Over the centuries, leaving the Royal Family was an act few had dared. The last to try, in fact, had been his mother. . . .<br><br>For the first time, Prince Harry tells his own story, chronicling his journey with raw, unflinching honesty. A landmark publication, <i>Spare</i> is full of insight, revelation, self-examination, and hard-won wisdom about the eternal power of love over grief.	
22	I'M GLAD MY MOM DIED	1982185821	9781982185824	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER</b><br> <b>#1 INTERNATIONAL BESTSELLER</b><br> <br><b>A heartbreaking and hilarious memoir by <i>iCarly </i>and <i>Sam & Cat </i>star Jennette McCurdy about her struggles as a former child actor—including eating disorders, addiction, and a complicated relationship with her overbearing mother—and how she retook control of her life. </b><br><br>Jennette McCurdy was six years old when she had her first acting audition. Her mother’s dream was for her only daughter to become a star, and Jennette would do anything to make her mother happy. So she went along with what Mom called “calorie restriction,” eating little and weighing herself five times a day. She endured extensive at-home makeovers while Mom chided, “Your eyelashes are invisible, okay? You think Dakota Fanning doesn’t tint hers?” She was even showered by Mom until age sixteen while sharing her diaries, email, and all her income.<br> <br>In <i>I’m Glad My Mom Died</i>, Jennette recounts all this in unflinching detail—just as she chronicles what happens when the dream finally comes true. Cast in a new Nickelodeon series called <i>iCarly</i>, she is thrust into fame. Though Mom is ecstatic, emailing fan club moderators and getting on a first-name basis with the paparazzi (“Hi Gale!”), Jennette is riddled with anxiety, shame, and self-loathing, which manifest into eating disorders, addiction, and a series of unhealthy relationships. These issues only get worse when, soon after taking the lead in the <i>iCarly</i> spinoff <i>Sam & Cat</i> alongside Ariana Grande, her mother dies of cancer. Finally, after discovering therapy and quitting acting, Jennette embarks on recovery and decides for the first time in her life what she really wants.<br> <br>Told with refreshing candor and dark humor, <i>I’m Glad My Mom Died</i> is an inspiring story of resilience, independence, and the joy of shampooing your own hair.	
23	CRYING IN H MART	1984898957	9781984898951	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • From the indie rock sensation known as Japanese Breakfast, an unforgettable memoir about family, food, grief, love, and growing up Korean American—“in losing her mother and cooking to bring her back to life, Zauner became herself” (NPR) • CELEBRATING OVER ONE YEAR ON THE <i>NEW YORK TIMES</i> BESTSELLER LIST</b><br><br>In this exquisite story of family, food, grief, and endurance, Michelle Zauner proves herself far more than a dazzling singer, songwriter, and guitarist. With humor and heart, she tells of growing up one of the few Asian American kids at her school in Eugene, Oregon; of struggling with her mother's particular, high expectations of her; of a painful adolescence; of treasured months spent in her grandmother's tiny apartment in Seoul, where she and her mother would bond, late at night, over heaping plates of food. <br><br>As she grew up, moving to the East Coast for college, finding work in the restaurant industry, and performing gigs with her fledgling band--and meeting the man who would become her husband--her Koreanness began to feel ever more distant, even as she found the life she wanted to live. It was her mother's diagnosis of terminal cancer, when Michelle was twenty-five, that forced a reckoning with her identity and brought her to reclaim the gifts of taste, language, and history her mother had given her.<br><br>Vivacious and plainspoken, lyrical and honest, Zauner's voice is as radiantly alive on the page as it is onstage. Rich with intimate anecdotes that will resonate widely, and complete with family photos, <i>Crying in H Mart</i> is a book to cherish, share, and reread.	
24	LESSONS LEARNED AND CHERISHED	1368095054	9781368095051	<b>A giftable collection of essays from celebrity contributors celebrating the great work of teachers or a teacher they admire, curated by ABC journalist Deborah Roberts. Contributors include Oprah Winfrey, Spike Lee, Jenna Bush Hager, Robin Roberts, Brooke Shields, Octavia Spencer, Misty Copeland, among others.</b><br><br>Everyone can name a teacher that had an impact on their life. Educators not only open our minds to new ideas, but they also help us recognize our potential and our passions. However, they rarely get credit for the life changing work they do, and they may not have any idea how that work can impact a student all the way into adulthood. <br><br><br>In <i>The Teacher Who Changed My Life</i>, renowned ABC journalist Deborah Roberts curates a collection of essays, letters, and musings from celebrity friends and colleagues alike that share how teachers changed them and helped them get to where they are today.	
25	THE ESCAPE ARTIST	0063112361	9780063112360	<p>"A brilliant and heart-wrenching book, with universal and timely lessons about the power of information--and misinformation. Is it possible to stop mass murder by telling the truth?" -- Yuval Noah Harari, bestselling author of Sapiens: A Brief History of Humankind and Homo Deus: A Brief History of Tomorrow</p> <p>A complex hero. A forgotten story. The first witness to reveal the full truth of the Holocaust . . .</p> <p>Award-winning journalist and bestselling novelist Jonathan Freedland tells the astonishing true story of Rudolf Vrba, the man who broke out of Auschwitz to warn the world of a truth too few were willing to hear.</p> <p>In April 1944, Rudolf Vrba became one of the very first Jews to escape from Auschwitz and make his way to freedom--among only a tiny handful who ever pulled off that near-impossible feat. He did it to reveal the truth of the death camp to the world--and to warn the last Jews of Europe what fate awaited them. Against all odds, Vrba and his fellow escapee, Fred Wetzler, climbed mountains, crossed rivers, and narrowly missed German bullets until they had smuggled out the first full account of Auschwitz the world had ever seen--a forensically detailed report that eventually reached Franklin Roosevelt, Winston Churchill, and the Pope.</p> <p>And yet too few heeded the warning that Vrba had risked everything to deliver. Though Vrba helped save two hundred thousand Jewish lives, he never stopped believing it could have been so many more.</p> <p>This is the story of a brilliant yet troubled man--a gifted "escape artist" who, even as a teenager, understood that the difference between truth and lies can be the difference between life and death. Rudolf Vrba deserves to take his place alongside Anne Frank, Oskar Schindler, and Primo Levi as one of the handful of individuals whose stories define our understanding of the Holocaust.</p>	
26	KILLERS OF THE FLOWER MOON	0307742482	9780307742483	<b><b>#1 <i>NEW YORK TIMES</i> BESTSELLER • A twisting, haunting true-life murder mystery about one of the most monstrous crimes in American history, from the author of <i>The Wager</i> and <i>The Lost City of Z, </i>“one of the preeminent adventure and true-crime writers working today."—<i>New York Magazine • </i>NATIONAL BOOK AWARD FINALIST <i>• </i>SOON TO BE A MAJOR MOTION PICTURE<br><br> “A shocking whodunit…What more could fans of true-crime thrillers ask?”—<i>USA Today</i></b><br><br>“A masterful work of literary journalism crafted with the urgency of a mystery.” —<i>The Boston Globe</i></b><br><br>In the 1920s, the richest people per capita in the world were members of the Osage Nation in Oklahoma. After oil was discovered beneath their land, the Osage rode in chauffeured automobiles, built mansions, and sent their children to study in Europe.<br><br>Then, one by one, the Osage began to be killed off. The family of an Osage woman, Mollie Burkhart, became a prime target. One of her relatives was shot. Another was poisoned. And it was just the beginning, as more and more Osage were dying under mysterious circumstances, and many of those who dared to investigate the killings were themselves murdered. <br><br>As the death toll rose, the newly created FBI took up the case, and the young director, J. Edgar Hoover, turned to a former Texas Ranger named Tom White to try to unravel the mystery. White put together an undercover team, including a Native American agent who infiltrated the region, and together with the Osage began to expose one of the most chilling conspiracies in American history.<br><br><b>Look for David Grann’s latest <b>#1 <i>New York Times</i> bestselling </b>book, <i>The Wager</i>!</b>	
87	LITTLE TROUBLEMAKER MAKES A MESS	0593526090	9780593526095	<b>A story about a little troublemaker with a big heart from the <i>New York Times </i>bestselling author and noted speaker Luvvie Ajayi Jones</b><br><br><i>Whoops!</i><br><br>Little Luvvie loves her mom. She loves her sister. And she loves doing nice things for other people.<br><br>But what happens when doing something nice means breaking some rules? Little Luvvie is about to find out.<br><br>Written by the <i>New York Times</i> bestselling author Luvvie Ajayi Jones with bright, bold art by Joey Spiotto, this funny, sweet story about a bighearted girl with the best of intentions is sure to become a family favorite.	Illustrated by joey spiotto
29	THE STORY OF ART WITHOUT MEN	0393881865	9780393881868	<b>The story of art for our times—one with women at the center, brought together for the first time by the creator of @thegreatwomenartists.</b><br><p>From Leonardo da Vinci to Jean-Michel Basquiat, the great painters and sculptures who have defined the fine art canon have largely been men. Katy Hessel seeks to right that wrong by cataloging, celebrating, and elevating women artists and placing their groundbreaking work in its historical, political, and cultural context. From the Renaissance to the present day, Hessel breaks down each time period and movement using a global lens, expanding the canon to include the work of non-Western artists, queer and racially marginalized artists, photographers, textile artists, and more.</p> <p>Discover the glittering Sofonisba Anguissola of the Renaissance and the radical work of Harriet Powers in the nineteenth century. Explore the Dutch Golden Age, the astonishing work of postwar artists in Latin America, and the women defining art in the 2020s. Featuring more than 100 works of art in color, <i>The Story of Art Without Men</i> is a timeless and essential addition to any library.</p>	
30	GREENLIGHTS	0593139135	9780593139134	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • <b>Discover the life-changing memoir that has inspired millions of readers through the Academy Award®–winning actor’s unflinching honesty, unconventional wisdom, and lessons learned the hard way about living with greater satisfaction.</b></b><br><b><br>“The No. 1 celebrity memoir of the past 10 years.”—<i>USA Today</i></b><br><br><b>“McConaughey’s book invites us to grapple with the lessons of his life as he did—and to see that the point was never to win, but to understand.”—Mark Manson, author of <i>The Subtle Art of Not Giving a F*ck</i></b><br><br>I’ve been in this life for fifty years, been trying to work out its riddle for forty-two, and been keeping diaries of clues to that riddle for the last thirty-five. Notes about successes and failures, joys and sorrows, things that made me marvel, and things that made me laugh out loud. How to be fair. How to have less stress. How to have fun. How to hurt people less. How to get hurt less. How to be a good man. How to have meaning in life. How to be more me.<br> <br>Recently, I worked up the courage to sit down with those diaries. I found stories I experienced, lessons I learned and forgot, poems, prayers, prescriptions, beliefs about what matters, some great photographs, and a whole bunch of bumper stickers. I found a reliable theme, an approach to living that gave me more satisfaction, at the time, and still: If you know how, and when, to deal with life’s challenges—how to <i>get relative with the inevitable</i>—you can enjoy a state of success I call “catching greenlights.”<br> <br>So I took a one-way ticket to the desert and wrote this book: an album, a record, a story of my life so far. This is fifty years of my sights and seens, felts and figured-outs, cools and shamefuls. Graces, truths, and beauties of brutality. Getting away withs, getting caughts, and getting wets while trying to dance between the raindrops.<br> <br>Hopefully, it’s medicine that tastes good, a couple of aspirin instead of the infirmary, a spaceship to Mars without needing your pilot’s license, going to church without having to be born again, and laughing through the tears.<br> <br>It’s a love letter. <b>To life.</b><br> <br>It’s also a guide to catching more greenlights—and to realizing that the yellows and reds eventually turn green too.<br> <br>Good luck.<br><br><b>The short dust jacket included with this hardcover edition is an intentional design choice.</b>	
31	THE 23RD MIDNIGHT	0316402788	9780316402781	<p><b>The latest in this "successful and suspenseful" (<i>Entertainment Weekly</i>) series: an attention-seeking copycat is recreating murders by a famous killer from the Women's Murder Club's past--with devastating new twists. </b></p> Detective Lindsay Boxer put serial killer Evan Burke in jail. <br> <br> <br> <br> Reporter Cindy Thomas wrote a book that put him on the bestseller list.<br> <br> <br> <br> An obsessed maniac has turned Burke's true-crime story into a playbook. And is embellishing it with gruesome touches all his own. <br> <br> <br> <br> Now Lindsay's tracking an elusive suspect, and the entire Murder Club is facing destruction.	
32	THE SECRET BOOK OF FLORA LEA	1668011832	9781668011836	<b>When a woman discovers a rare book that has connections to her past, long-held secrets about her missing sister and their childhood spent in the English countryside during World War II are revealed.</b><br><br>In the war-torn London of 1939, fourteen-year-old Hazel and five-year-old Flora are evacuated to a rural village to escape the horrors of the Second World War. Living with the kind Bridie Aberdeen and her teenage son, Harry, in a charming stone cottage along the River Thames, Hazel fills their days with walks and games to distract her young sister, including one that she creates for her sister and her sister alone—a fairy tale about a magical land, a secret place they can escape to that is all their own.<br> <br>But the unthinkable happens when young Flora suddenly vanishes while playing near the banks of the river. Shattered, Hazel blames herself for her sister’s disappearance, and she carries that guilt into adulthood as a private burden she feels she deserves.<br> <br>Twenty years later, Hazel is in London, ready to move on from her job at a cozy rare bookstore to a career at Sotheby’s. With a charming boyfriend and her elegantly timeworn Bloomsbury flat, Hazel’s future seems determined. But her tidy life is turned upside down when she unwraps a package containing an illustrated book called <i>Whisperwood and the River of Stars</i>. Hazel never told a soul about the imaginary world she created just for Flora. Could this book hold the secrets to Flora’s disappearance? Could it be a sign that her beloved sister is still alive after all these years?<br> <br>As Hazel embarks on a feverish quest, revisiting long-dormant relationships and bravely opening wounds from her past, her career and future hang in the balance. An astonishing twist ultimately reveals the truth in this transporting and refreshingly original novel about the bond between sisters, the complications of conflicted love, and the enduring magic of storytelling.	
33	TOMORROW, AND TOMORROW, AND TOMORROW	0593321200	9780593321201	<b><i>NEW YORK TIMES </i>BEST SELLER <b>• </b>In this exhilarating novel by the best-selling author of <i>The Storied Life of A. J. Fikry</i> two friends—often in love, but never lovers—come together as creative partners in the world of video game design, where success brings them fame, joy, tragedy, duplicity, and, ultimately, a kind of immortality.</b><br><br><b>"Utterly brilliant. In this sweeping, gorgeously written novel, Gabrielle Zevin charts the beauty, tenacity, and fragility of human love and creativity.... One of the best books I've ever read." —John Green</b><br>  <br> On a bitter-cold day, in the December of his junior year at Harvard, Sam Masur exits a subway car and sees, amid the hordes of people waiting on the platform, Sadie Green. He calls her name. For a moment, she pretends she hasn’t heard him, but then, she turns, and a game begins: a legendary collaboration that will launch them to stardom. These friends, intimates since childhood, borrow money, beg favors, and, before even graduating college, they have created their first blockbuster,<i> Ichigo</i>. Overnight, the world is theirs. Not even twenty-five years old, Sam and Sadie are brilliant, successful, and rich, but these qualities won’t protect them from their own creative ambitions or the betrayals of their hearts.<br>  <br> Spanning thirty years, from Cambridge, Massachusetts, to Venice Beach, California, and lands in between and far beyond, Gabrielle Zevin’s <i>Tomorrow, and Tomorrow, and Tomorrow</i> is a dazzling and intricately imagined novel that examines the multifarious nature of identity, disability, failure, the redemptive possibilities in play, and above all, our need to connect: to be loved and to love. Yes, it is a love story, but it is not one you have read before.	
44	NEVER NEVER	1335004882	9781335004888	AN INSTANT #1 NEW YORK TIMES BESTSELLER!<br> <br> <br> <br> Never stop...Never forget...Just remember.<br> <br> <br> <br> Colleen Hoover, the #1 New York Times bestselling author of It Starts with Us joins forces with Tarryn Fisher, the New York Times bestselling author of The Wives. Together, they have created a gripping, twisty, romantic mystery unlike any other.<br> <br> <br> <br> Charlie Wynwood and Silas Nash have been best friends since they could walk. They've been in love since the age of fourteen. But as of this morning...they are complete strangers. Their first kiss, their first fight, the moment they fell in love...every memory has vanished. Now Charlie and Silas must work together to uncover the truth about what happened to them and why.<br> <br> <br> <br> But the more they learn about the couple they used to be...the more they question why they were ever together to begin with. Forgetting is terrifying, but remembering may be worse.<br> <br> <br> <br> Heart-stopping and utterly captivating, the complete Never Never series, now available in one volume, will leave readers breathless and believing in the power of love.<br> <br> <br> <br> <br> <br>	
34	HANG THE MOON	1501117297	9781501117299	<b><b>The instant <i>New York Times </i>bestseller! Named a <b><b>LibraryReads Pick for March 2023 and a </b></b>Most Anticipated Book of 2023 by<i> Oprah Daily,</i> <i>Elle,</i> and <i>LitHub</i>!</b><br> <br> <b><b>From Jeannette Walls, the #1 <i>New York Times </i>bestselling author of <i>The Glass Castle</i>, comes a riveting new novel about an indomitable young woman in Virginia during Prohibition.</b></b></b><br><br><i>Most folk thought Sallie Kincaid was a nobody who’d amount to nothing. Sallie had other plans.</i><br> <br>Sallie Kincaid is the daughter of the biggest man in a small town, the charismatic Duke Kincaid. Born at the turn of the 20th century into a life of comfort and privilege, Sallie remembers little about her mother who died in a violent argument with the Duke. By the time she is just eight years old, the Duke has remarried and had a son, Eddie. While Sallie is her father’s daughter, sharp-witted and resourceful, Eddie is his mother’s son, timid and cerebral. When Sallie tries to teach young Eddie to be more like their father, her daredevil coaching leads to an accident, and Sallie is cast out.<br> <br>Nine years later, she returns, determined to reclaim her place in the family. That’s a lot more complicated than Sallie expected, and she enters a world of conflict and lawlessness. Sallie confronts the secrets and scandals that hide in the shadows of the Big House, navigates the factions in the family and town, and finally comes into her own as a bold, sometimes reckless bootlegger.<br> <br>You will fall in love with Sallie Kincaid, a feisty and fearless, terrified and damaged young woman who refuses to be corralled.	
35	THE FERRYMAN	052561947X	9780525619475	<b>“Next to impossible to put down . . . exciting, mysterious, and totally satisfying.”—STEPHEN KING</b><br> <br><b>From the <i>New York Times</i> bestselling author of <i>The Passage</i> comes a riveting standalone novel about a group of survivors on a hidden island utopia—where the truth isn't what it seems.</b><br><br>Founded by the mysterious genius known as the Designer, the archipelago of Prospera lies hidden from the horrors of a deteriorating outside world. In this island paradise, Prospera’s lucky citizens enjoy long, fulfilling lives until the monitors embedded in their forearms, meant to measure their physical health and psychological well-being, fall below 10 percent. Then they retire themselves, embarking on a ferry ride to the island known as the Nursery, where their failing bodies are renewed, their memories are wiped clean, and they are readied to restart life afresh. <br><br>Proctor Bennett, of the Department of Social Contracts, has a satisfying career as a ferryman, gently shepherding people through the retirement process—and, when necessary, enforcing it. But all is not well with Proctor. For one thing, he’s been dreaming—which is supposed to be impossible in Prospera. For another, his monitor percentage has begun to drop alarmingly fast. And then comes the day he is summoned to retire his own father, who gives him a disturbing and cryptic message before being wrestled onto the ferry.<br><br>Meanwhile, something is stirring. The Support Staff, ordinary men and women who provide the labor to keep Prospera running, have begun to question their place in the social order. Unrest is building, and there are rumors spreading of a resistance group—known as “Arrivalists”—who may be fomenting revolution. <br><br>Soon Proctor finds himself questioning everything he once believed, entangled with a much bigger cause than he realized—and on a desperate mission to uncover the truth.	
36	IT ENDS WITH US	1668021048	9781668021040	<b><b>A special hardcover collector’s edition of <i>It Ends with Us</i>, featuring an exclusive Q&A between Colleen Hoover and her mother, a beautiful foil cover, and newly designed endpapers—from the #1 <i>New York Times</i> bestselling author of <i>It Starts with Us </i>and soon to be a major motion picture starring Blake Lively and Justin Baldoni.</b></b><br><br>Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.<br> <br>Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.<br> <br>As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.<br> <br>An honest, evocative, and tender novel, <i>It Ends with Us</i> is “a glorious and touching read, a forever keeper. The kind of book that gets handed down” (<i>USA TODAY</i>).	
37	SUMMER ON SAG HARBOR	0062994212	9780062994219	<p>Following her New York Times bestseller Summer on the Bluffs, The View cohost and three-time Emmy Award winner Sunny Hostin spirits readers away to the warm beaches of Sag Harbor for the compelling second novel in her acclaimed Summer series.</p> <p>In a hidden enclave in Sag Harbor, affectionately known as SANS--Sag Harbor Hills, Azurest, and Nineveh--there's a close-knit community of African American elites who escape the city and enjoy the beautiful warm weather and beaches at their vacation homes. Since the 1930s, very few have known about this part of the Hamptons on Long Island, and the residents like it that way.</p> <p>That is, until real estate developers discover the hidden gem. And now, the residents must fight for the soul of SANS.</p> <p>Against the odds, Olivia Jones has blazed her own enviable career path and built her name in the finance world. But hidden behind the veneer of her success, there is a gaping hole. Mourning both the loss and the betrayal of Omar, a surrogate father to her and her two godsisters, Olivia is driven to solve the mystery of what happened to her biological father, a police officer unjustly killed when she was a little girl.</p> <p>Untethered from her life in New York City, Olivia moves to a summer home in Sag Harbor and begins forging a new community out in SANS. Friendships blossom with Kara, an ambitious art curator; and Whitney, the wife of an ex-basketball player and current president of the Sag Harbor Homeowners Association; and a sexy new neighbor and single father, Garrett, who makes her reconsider her engagement with Anderson. She also takes to a kind, older gentleman named Mr. Whittingham, but soon discovers he too is not without his own troubles.</p> <p>As the summer stretches on, each relationship teaches her more about who she really is. Though not without cost, Olivia's search for her authentic identity in the secret history of her family of origin and her fight to preserve her new Black utopia, will lead her to redefine the meaning of love, friendship, community, and family--and restore her faith in herself, her relationships, and her chosen path.</p>	
38	REMARKABLY BRIGHT CREATURES	0063204150	9780063204157	<p>AN INSTANT NEW YORK TIMES BESTSELLER</p><p>A Read With Jenna Today Show Book Club Pick!</p><p>NAMED A BEST BOOK OF SUMMER by: Chicago Tribune * The View * Southern Living * USA Today</p><p>"Remarkably Bright Creatures [is] an ultimately feel-good but deceptively sensitive debut. . . . Memorable and tender." -- Washington Post </p><p>For fans of A Man Called Ove, a charming, witty and compulsively readable exploration of friendship, reckoning, and hope that traces a widow's unlikely connection with a giant Pacific octopus</p><p>After Tova Sullivan's husband died, she began working the night shift at the Sowell Bay Aquarium, mopping floors and tidying up. Keeping busy has always helped her cope, which she's been doing since her eighteen-year-old son, Erik, mysteriously vanished on a boat in Puget Sound over thirty years ago.</p><p>Tova becomes acquainted with curmudgeonly Marcellus, a giant Pacific octopus living at the aquarium. Marcellus knows more than anyone can imagine but wouldn't dream of lifting one of his eight arms for his human captors--until he forms a remarkable friendship with Tova.</p><p>Ever the detective, Marcellus deduces what happened the night Tova's son disappeared. And now Marcellus must use every trick his old invertebrate body can muster to unearth the truth for her before it's too late. </p><p>Shelby Van Pelt's debut novel is a gentle reminder that sometimes taking a hard look at the past can help uncover a future that once felt impossible.</p>	
39	POVERTY, BY AMERICA	0593239911	9780593239919	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • The Pulitzer Prize–winning author of <i>Evicted</i> reimagines the debate on poverty, making a “provocative and compelling” (NPR) argument about why it persists in America: because the rest of us benefit from it.<br><br>“Urgent and accessible . . . Its moral force is a gut punch.”—<i>The New Yorker</i></b><br> <br><b>ONE OF THE MOST ANTICIPATED BOOKS OF 2023: <i>The Washington Post, Time, Esquire, Newsweek, Minneapolis Star Tribune, Elle, Salon, Lit Hub, Kirkus Reviews<br></i></b><br>The United States, the richest country on earth, has more poverty than any other advanced democracy. Why? Why does this land of plenty allow one in every eight of its children to go without basic necessities, permit scores of its citizens to live and die on the streets, and authorize its corporations to pay poverty wages? <br> <br>In this landmark book, acclaimed sociologist Matthew Desmond draws on history, research, and original reporting to show how affluent Americans knowingly and unknowingly keep poor people poor. Those of us who are financially secure exploit the poor, driving down their wages while forcing them to overpay for housing and access to cash and credit. We prioritize the subsidization of our wealth over the alleviation of poverty, designing a welfare state that gives the most to those who need the least. And we stockpile opportunity in exclusive communities, creating zones of concentrated riches alongside those of concentrated despair. Some lives are made small so that others may grow.<br> <br>Elegantly written and fiercely argued, this compassionate book gives us new ways of thinking about a morally urgent problem. It also helps us imagine solutions. Desmond builds a startlingly original and ambitious case for ending poverty. He calls on us all to become poverty abolitionists, engaged in a politics of collective belonging to usher in a new age of shared prosperity and, at last, true freedom.	
40	THE 1998 YANKEES	1538722976	9781538722978	<b>"The 1998 Yankees were a perfectly constructed team. Jack Curry does an amazing job of telling the tales of that phenomenal group." --David Cone</b><br> <br> <br> <br> <b>Discover the inside story of the Yankees' unprecedented talent with this gripping account from a reporter who was there for the team's 125 wins.​</b><br> <br> <br> <br> The visiting clubhouse in San Diego was soggy, sweaty and sticky after the 1998 Yankees swept the Padres in four games and celebrated winning their 24th World Series title. The players raised bottles of Champagne, sprayed the bubbly on each other and reveled in a baseball season that might have been more memorable than any in history.<br> <br> <br> <br> Jack Curry was part of that unforgettable scene as a reporter, navigating around the clubhouse to ask the same, pertinent question. After winning an unprecedented 125 games and pummeling teams along the way, were these Yankees, the Yankees of Jeter, Mariano, Posada, Pettitte, Bernie, O'Neill, Tino and so many other vital players, the best team ever?<br> <br> <br> <br> "Right now, you would have to call them the best team ever," said owner George Steinbrenner.<br> <br> <br> <br> Twenty five years later, Curry revisits that season to discuss how that team was built and why the Yankees were such a talented, refreshing and successful club. This book includes new interviews with more than 25 players, coaches and executives, who revealed some behind-the-stories about the magical journey and who also discussed the depth of this historic squad.<br> <br> <br> <br> "From the first man to the 25th man on the roster, I don't think there's a team that had more talent and a team whose players knew their roles as well as our players did," said pitcher David Cone. "If you're using that as a barometer for the best team of all-time, then I think you can call us the best team of all-time."<br> <br> <br> <br> During that wondrous season, Don Zimmer, a Yankee coach and a baseball lifer who began his career with the Brooklyn Dodgers in 1954, told associates there would never be another team like the 1998 Yankees. Zimmer was right. Twenty five years later, Curry describes how and why that Yankee team could be the best ever.	
41	YOU CAN'T JOKE ABOUT THAT	0063270420	9780063270428	<p>What happens when we can't joke about some of the most important stuff in life?</p> <p>In a 2019 study, 40% of people reported censoring themselves out of fear that voicing their views would alienate them from the people they care about most. Those people should probably not read this book in public.</p> <p>In You Can't Joke About That, Kat Timpf shows why much of the way we talk about sensitive subjects is wrong. We've created all the wrong rules. We push ourselves into unnecessary conflicts when we should feel like we're all in this together. When someone says "you can't joke about that," what they really mean is "this is a subject that makes people sad or angry."</p> <p>Hilariously and movingly, Timpf argues that those subjects are actually the most important to joke about. She shows us we can find healing through humor regarding things you probably don't want to bring up in polite conversation, like traumatic break-ups, cancer, being broke, Dave Chappelle, rape jokes, aging, ostomy bags, religion, body image, dead moms, religion, the lab leak theory, transgender swimmers, gushing wounds, campus censorship, and bad Christmas presents. </p> <p>This book is Kat Timpf with her hair down, except since hers is mostly extensions, this book is Kat Timpf with her hair out. Read it because you want to get to know her better. Read it because it's the best book on free speech and comedy in a generation. Read it because you want to laugh out loud... even at the kind of stuff we're afraid to say out loud. Just read it, and you'll be glad you did.</p>	
42	HONEY, BABY, MINE	153872037X	9781538720370	<b>"As actors, Dern and Ladd have spent decades peeling back layers to reveal their characters' fears and desires. It's when they turn that focus to each other and themselves that something remarkable emerges."--<i>New York Times</i> <p> A collection of deeply personal conversations from award-winning actress and activist Laura Dern and the woman she admires most, her mother--legendary actress Diane Ladd. <br> </b> <br><i>What happens when we are brave enough to speak our truths to the ones we love the most?</i> <p> Laura Dern and Diane Ladd always had a close relationship, but the stakes were raised when Diane developed a sudden life-threatening illness. Diane's doctor prescribed long walks to build back her lung capacity. The exertion was challenging, and Laura soon learned the best way to distract her mom was to get her talking and telling stories. <p> Their conversations along the way began to break down the traditional barriers between mothers and daughters. They discussed the most personal topics: love, sex, marriage, divorce, art, ambition, and legacy. In <i>Honey, Baby, Mine</i>, Laura and Diane share these conversations, as well as reflections and anecdotes, taking readers on an intimate tour of their lives. Complementing these candid exchanges, they have included photos, family recipes, and other mementos. The result is a celebration of the power of leaving nothing unsaid that will make you want to call the people you love the most and start talking.	
43	QUANTUM SUPREMACY	0385548362	9780385548366	<b>An exhilarating tour of humanity's next great technological achievement—quantum computing—which may eventually unravel the deepest mysteries of science and solve some of humanity's biggest problems, like global warming, world hunger, and incurable disease, by the bestselling author of <i>The God Equation.</i></b><br><br>The runaway success of the microchip processor may be reaching its end. Running up against the physical constraints of smaller and smaller sizes, traditional silicon chips are not likely to prove useful in solving humanity’s greatest challenges, from climate change, to global starvation, to incurable diseases. But the quantum computer, which harnesses the power and complexity of the atomic realm, already promises to be every bit as revolutionary as the transistor and microchip once were. Its unprecedented gains in computing power herald advancements that could change every aspect of our daily lives. <br><br>Automotive companies, medical researchers, and consulting firms are betting on quantum computing, hoping to exploit its power to design more efficient vehicles, create life-saving new drugs, and streamline industries to revolutionize the economy. But this is only the beginning. Quantum computers could allow us to finally create nuclear fusion reactors that create clean, renewable energy without radioactive waste or threats of meltdown. They could help us crack the biological processes that generate natural, cheap fertilizer and enable us to feed the world’s growing populations. And they could unravel the fiendishly difficult protein folding that lies at the heart of previously incurable diseases like Alzheimer’s, ALS, and Parkinson’s, helping us to live longer, healthier lives. There is not a single problem humanity faces that couldn’t be addressed by quantum computing. Told with Kaku’s signature clarity and enthusiasm, <i>Quantum Supremacy</i> is the story of this exciting frontier and the race to claim humanity’s future.	
89	REPEAT AFTER ME	0593426975	9780593426975	<b>From parents and actors Jazmyn Simon and Dulé Hill comes a picture book filled with beautiful, inspiring affirmations reminding kiddos of their infinite wonder. Perfect for children of any age!</b><br><br><i>I am worthy. I am loved. I am enough.</i><br><i> </i>Every child, no matter their age, needs to know how loved they are and, more importantly, should love themselves. In this gorgeously illustrated book of affirmations, young readers are told how cherished, deserving, and gifted they are.<br><br>In their tender picture book, actors Jazmyn Simon and Dulé Hill tell children about the magic of self-love and standing firm, regardless of outside voices and doubt. Children will feel their confidence grow as they repeat the encouraging words on the page, take in the warm illustrations, and learn to believe in themselves!	Illustrated by shamar knight-justice
45	THE HOUSEMAID	1538742578	9781538742570	<b>Don't miss the <i>USA Today</i> bestseller and addictive psychological thriller with a jaw-dropping twist that's burning up Instagram--Freida McFadden's <i>The Housemaid</i> is perfect for fans of Ruth Ware, Lisa Jewell, and</b> <i><b>Verity.</b></i><br> <br> <br> <br> <b>"Welcome to the family," Nina Winchester says as I shake her elegant, manicured hand. I smile politely, gazing around the marble hallway. Working here is my last chance to start fresh. I can pretend to be whoever I like. But I'll soon learn that the Winchesters' secrets are far more dangerous than my own...</b><br> <br> <br> <br> Every day I clean the Winchesters' beautiful house top to bottom. I collect their daughter from school. And I cook a delicious meal for the whole family before heading up to eat alone in my tiny room on the top floor.<br> <br> <br> <br> I try to ignore how Nina makes a mess just to watch me clean it up. How she tells strange lies about her own daughter. And how her husband Andrew seems more broken every day. But as I look into Andrew's handsome brown eyes, so full of pain, it's hard not to imagine what it would be like to live Nina's life. The walk-in closet, the fancy car, the perfect husband.<br> <br> <br> <br> I only try on one of Nina's pristine white dresses once. Just to see what it's like. But she soon finds out... and by the time I realize my attic bedroom door only locks from the outside, it's far too late.<br> <br> <br> <br> But I reassure myself: the Winchesters don't know who I really am.<br> <br> <br> <br> They don't know what I'm capable of...	
46	UGLY LOVE	1476753180	9781476753188	<b>From Colleen Hoover, the #1 <i>New York Times</i> bestselling author of <i>It Starts with Us</i> and <i>It Ends with Us, </i>a<i> </i>heart-wrenching love story that proves attraction at first sight can be messy. </b><br><br>When Tate Collins meets airline pilot Miles Archer, she doesn't think it's love at first sight. They wouldn’t even go so far as to consider themselves friends. The only thing Tate and Miles have in common is an undeniable mutual attraction. Once their desires are out in the open, they realize they have the perfect set-up. He doesn’t want love, she doesn’t have time for love, so that just leaves the sex. Their arrangement could be surprisingly seamless, as long as Tate can stick to the only two rules Miles has for her.<br> <br>Never ask about the past. <br> Don’t expect a future.<br> <br>They think they can handle it, but realize almost immediately they can’t handle it at all.<br> <br>Hearts get infiltrated. <br> Promises get broken. <br> Rules get shattered.<br> Love gets ugly.	
47	ICEBREAKER	1668026031	9781668026038	<b><i>NEW YORK TIMES </i>BESTSELLER</b><br> <br><b>A TikTok sensation! Sparks fly when a competitive figure skater and hockey team captain are forced to share a rink.</b><b> </b><br><br>Anastasia Allen has worked her entire life for a shot at Team USA. It looks like everything is going according to plan when she gets a full scholarship to the University of California, Maple Hills and lands a place on their competitive figure skating team.<br> <br>Nothing will stand in her way, not even the captain of the hockey team, Nate Hawkins.<br> <br>Nate’s focus as team captain is on keeping his team on the ice. Which is tricky when a facilities mishap means they are forced to share a rink with the figure skating team—including Anastasia, who clearly can’t stand him. <br> <br>But when Anastasia’s skating partner faces an uncertain future, she may have to look to Nate to take her shot. <br> <br>Sparks fly, but Anastasia isn’t worried…because she could never like a hockey player, right?	
48	HEART BONES	1668021919	9781668021910	<b><b>From the #1 <i>New York Times</i> bestselling author of <i>It Ends with Us</i> and <i>It Starts with Us</i>!</b><br> <br><b>Moving, passionate, and unforgettable, Colleen Hoover's novel follows two young adults from completely different backgrounds embarking on a tentative romance, unaware of what the future holds.</b></b><br><br>After a childhood filled with poverty and neglect, Beyah Grim finally has her hard-earned ticket out of Kentucky with a full ride to Penn State. But two months before she’s finally free to change her life for the better, an unexpected death leaves her homeless and forced to spend the remainder of her summer in Texas with a father she barely knows.<br> <br>Devastated and anxious for the summer to go by quickly, Beyah has no time or patience for Samson, the wealthy, brooding guy next door. Yet, the connection between them is too intense to ignore. But with their upcoming futures sending them to opposite ends of the country, the two decide to maintain only a casual summer fling. Too bad neither has any idea that a rip current is about to drag both their hearts out to sea.	
49	THE SILENT PATIENT	125030170X	9781250301703	<p><b>**THE INSTANT #1 <i>NEW YORK TIMES </i>BESTSELLER**</b><br><br>"An unforgettable—and Hollywood-bound—new thriller... A mix of Hitchcockian suspense, Agatha Christie plotting, and Greek tragedy."<br><b>—<i>Entertainment Weekly</i></b><br><br><b><i>The Silent Patient</i> is a shocking psychological thriller of a woman’s act of violence against her husband—and of the therapist obsessed with uncovering her motive.</b><br><br>Alicia Berenson’s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London’s most desirable areas. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word.<br><br>Alicia’s refusal to talk, or give any kind of explanation, turns a domestic tragedy into something far grander, a mystery that captures the public imagination and casts Alicia into notoriety. The price of her art skyrockets, and she, the silent patient, is hidden away from the tabloids and spotlight at the Grove, a secure forensic unit in North London.<br><br>Theo Faber is a criminal psychotherapist who has waited a long time for the opportunity to work with Alicia. His determination to get her to talk and unravel the mystery of why she shot her husband takes him down a twisting path into his own motivations—a search for the truth that threatens to consume him....</p>	
60	THE GLASS CASTLE	074324754X	9780743247542	<b>Now a major motion picture from Lionsgate starring Brie Larson, Woody Harrelson, and Naomi Watts.</b><br> <br> <b>MORE THAN SEVEN YEARS ON <i>THE NEW YORK TIMES</i> BESTSELLER LIST</b><br> The perennially bestselling, extraordinary, one-of-a-kind, “nothing short of spectacular” (<i>Entertainment Weekly</i>) memoir from one of the world’s most gifted storytellers.<br><br><i>The Glass Castle </i>is a remarkable memoir of resilience and redemption, and a revelatory look into a family at once deeply dysfunctional and uniquely vibrant. When sober, Jeannette’s brilliant and charismatic father captured his children’s imagination, teaching them physics, geology, and how to embrace life fearlessly. But when he drank, he was dishonest and destructive. Her mother was a free spirit who abhorred the idea of domesticity and didn’t want the responsibility of raising a family.<br> <br>The Walls children learned to take care of themselves. They fed, clothed, and protected one another, and eventually found their way to New York. Their parents followed them, choosing to be homeless even as their children prospered.<br> <br><i>The Glass Castle </i>is truly astonishing—a memoir permeated by the intense love of a peculiar but loyal family.	
50	PRACTICE MAKES PERFECT	0593500806	9780593500804	<b>A small-town sweetheart and an emotionally unavailable bad boy try to find some common ground in this chemistry-filled romance from the author of <i>The Cheat Sheet</i> and <i>When in Rome.</i></b><br><br>Annie Walker is on a quest to find her perfect match—someone who complements her happy, quiet life running the local flower shop in Rome, Kentucky. But finding her dream man may be harder than Annie imagined. Everyone knows everyone in her hometown, and the dating prospects are getting fewer by the day. After she overhears her latest date say she is “so unbelievably boring,” Annie starts to think the problem might be her. Is it too late to become flirtatious and fun like the leading ladies in her favorite romance movies? Maybe she only needs a little practice . . . and Annie has the perfect person in mind to be her tutor: Will Griffin.<br><br>Will—the sexy , tattooed, and absolutely gorgeous bodyguard—is temporarily back in Rome, providing security for Amelia Rose as excitement builds for her upcoming marriage to Noah Walker, Annie’s brother. He has one personal objective while on the job: stay away from Annie Walker and any other possible attachments to this sleepy town. But no sooner than he gets settled, Will finds himself tasked with helping Annie find the love of her life by becoming the next leading lady of Rome, Kentucky. Will wants no part in changing the sweet and lovely Annie. He knows for a fact that some stuffy, straitlaced guy won’t make her happy, but he doesn’t have the heart to say no.<br><br>Amid steamy practice dates and strictly “educational” tutoring lessons, Annie discovers there are more layers to Will’s usual stoic attitude. As the lines of their friendship become dangerously blurred, Annie reconsiders her dream guy. Maybe her love life doesn’t need to be perfect—it just needs to be real.	
51	THINGS WE NEVER GOT OVER	194563183X	9781945631832	<p>New York Times bestselling author Lucy Score brings you a grumpy/sunshine romance guaranteed to knock you out. Welcome to Knockemout, Virginia, the small town with the best coffee, the best whiskey and the hottest bad boy heroes you've ever laid hands--I mean eyes--on."</p> <p>Knox Morgan doesn't tolerate drama, especially in the form of a stranded runaway bride.</p> <p>Naomi Witt is on the run. Not just from her fiancé and a church full of well-wishers, but from her entire life. Although if you ask her, Naomi's riding to the rescue of her estranged hot mess of a twin, Tina, to Knockemout, a rough-around-the-edges town where disputes are settled the old-fashioned way...with fists and beer. Usually in that order.</p> <p>Too bad for Naomi, her evil twin hasn't changed at all. After helping herself to Naomi's car and cash, Tina leaves behind something unexpected: the niece Naomi didn't know she had. Now she's a guardian to an eleven-year-old-going-on-thirty with no car, no money, and no plan.</p> <p>There's a reason this bearded, bad-boy barber doesn't get involved with high-maintenance women, especially not Type-A romantic ones. But since Naomi's life imploded right in front of him, the least Knox can do is help her out of her jam. And just as soon as she stops getting into new trouble, he can leave her alone and get back to his quiet, solitary life.</p> <p>At least, that's the plan.</p>	
52	BRAIDING SWEETGRASS	1571313567	9781571313560	"An inspired weaving of indigenous knowledge, plant science, and personal narrative from a distinguished professor of science and a Native American whose previous book, Gathering Moss, was awarded the John Burroughs Medal for outstanding nature writing. As a botanist and professor of plant ecology, Robin Wall Kimmerer has spent a career learning how to ask questions of nature using the tools of science. As a Potawatomi woman, she learned from elders, family, and history that the Potawatomi, as well as a majority of other cultures indigenous to this land, consider plants and animals to be our oldest teachers. In Braiding Sweetgrass, Kimmerer brings these two lenses of knowing together to reveal what it means to see humans as "the younger brothers of creation." As she explores these themes she circles toward a central argument: the awakening of a wider ecological consciousness requires the acknowledgement and celebration of our reciprocal relationship with the world. Once we begin to listen for the languages of other beings, we can begin to understand the innumerable life-giving gifts the world provides us and learn to offer our thanks, our care, and our own gifts in return"--	
53	ALL ABOUT LOVE	0060959479	9780060959470	<p>"The word "love" is most often defined as a noun, yet...we would all love to better if we used it as a verb," writes bell hooks as she comes out fighting and on fire in <i>All About Love</i>. Here, at her most provacative and intensely personel, the renowned scholar, cultural critic, and feminist skewers our view of love as romance. In its place she offers a proactive new ethic for a people and a society bereft with lovelessness.</p><p>As bell hooks uses her incisive mind and razor-sharp pen to explode th question "What is love?" her answers strike at both the mind and heart. In thirteen concise chapters, hooks examines her own search for emotional connection and society's failure to provide a model for learning to love. Razing the cultural paradigm that the ideal love is infused with sex and desire, she provides a new path to love that is sacred, redemptive, and healing for the individuals and for a nation. <i>The Utne Reader </i>declared bell hooks one of the "100 Visionaries Who Can Change Your Life." <i>All About Love</i> is a powerful affirmation of just how profoundly she can.</p>	
80	ODDER	1250147425	9781250147424	<p><b>Now a #1 <i>New York Times</i> bestseller! A touching and lyrical tale about a remarkable sea otter, from Newbery Medalist Katherine Applegate, author of <i>Wishtree</i>. <br></b><br>Meet Odder, the Queen of Play: <br><br><i>Nobody has her moves.</i><br><i>She doesn’t just swim to the bottom,</i><br><i>she dive-bombs.</i><br><i>She doesn’t just somersault,</i><br><i>she triple-doughnuts.</i><br><i>She doesn’t just ride the waves,</i><br><i>she makes them.</i><br><br>Odder spends her days off the coast of central California, practicing her underwater acrobatics and spinning the quirky stories for which she’s known. She’s a fearless daredevil, curious to a fault. But when Odder comes face-to-face with a hungry great white shark, her life takes a dramatic turn, one that will challenge everything she believes about herself—and about the humans who hope to save her.<br><br>Inspired by the true story of a Monterey Bay Aquarium program that pairs orphaned otter pups with surrogate mothers, this poignant and humorous tale told in free verse examines bravery and healing through the eyes of one of nature’s most beloved and charming animals.</p>	Illustrated by charles santoso
90	I LOVE MOM WITH THE VERY HUNGRY CATERPILLAR	0451533461	9780451533463	<b>Celebrate Mom's special day with The Very Hungry Caterpillar in this colorful book featuring Eric Carle's joyful illustrations.<br><br></b>Show Mom just how much she means with this colorful book from the World of Eric Carle. Join The Very Hungry Caterpillar as he honors Mother's Day and celebrates incredible parents everywhere. With joyful illustrations and colorful creatures, this charming keepsake is a great way to show parents, grandparents, soon-to-be mothers, aunts, friends, or whomever you call "Mom" just how much you care.	
54	FINDING ME	006303736X	9780063037366	<p>OPRAH'S BOOK CLUB PICK * A HARPERS BAZAAR BEST BOOK OF 2022 * A PARADE MOST ANTICIPATED BOOK * A MARIE CLAIRE MOST ANTICIPATED BOOK</p> <p>"It's clear from the first page that Davis is going to serve a more intimate, unpolished account than is typical of the average (often ghost-written) celebrity memoir; Finding Me reads like Davis is sitting you down for a one-on-one conversation about her life, warts and all."--USA Today</p> <p>"[A] fulfilling narrative of struggle and success....Her gorgeous storytelling will inspire anyone wishing to shed old labels."--Los Angeles Times</p> <br> <br> <p>In my book, you will meet a little girl named Viola who ran from her past until she made a life-changing decision to stop running forever.</p> <p>This is my story, from a crumbling apartment in Central Falls, Rhode Island, to the stage in New York City, and beyond. This is the path I took to finding my purpose but also my voice in a world that didn't always see me.</p> <p>As I wrote Finding Me, my eyes were open to the truth of how our stories are often not given close examination. We are forced to reinvent them to fit into a crazy, competitive, judgmental world. So I wrote this for anyone running through life untethered, desperate and clawing their way through murky memories, trying to get to some form of self-love. For anyone who needs reminding that a life worth living can only be born from radical honesty and the courage to shed facades and be . . . you.</p> <p>Finding Me is a deep reflection, a promise, and a love letter of sorts to self. My hope is that my story will inspire you to light up your own life with creative expression and rediscover who you were before the world put a label on you.</p>	
55	THINKING, FAST AND SLOW	0374533555	9780374533557	When we can and cannot trust our intuitions in making business and personal decisions.	
56	EDUCATED	0399590528	9780399590528	<b>#1 <i>NEW YORK TIMES, WALL STREET JOURNAL,</i> AND <i>BOSTON GLOBE</i> BESTSELLER • One of the most acclaimed books of our time: an unforgettable memoir about a young woman who, kept out of school, leaves her survivalist family and goes on to earn a PhD from Cambridge University</b><br> <br><b>“Extraordinary . . . an act of courage and self-invention.”—<i>The New York Times</i></b><br> <br><b>NAMED ONE OF THE TEN BEST BOOKS OF THE YEAR BY <i>THE NEW YORK TIMES BOOK REVIEW</i> • ONE OF PRESIDENT BARACK OBAMA’S FAVORITE BOOKS OF THE YEAR • BILL GATES’S HOLIDAY READING LIST • FINALIST: National Book Critics Circle’s Award In Autobiography and John Leonard Prize For Best First Book • PEN/Jean Stein Book Award • <i>Los Angeles Times</i> Book Prize</b><br> <br>Born to survivalists in the mountains of Idaho, Tara Westover was seventeen the first time she set foot in a classroom. Her family was so isolated from mainstream society that there was no one to ensure the children received an education, and no one to intervene when one of Tara’s older brothers became violent. When another brother got himself into college, Tara decided to try a new kind of life. Her quest for knowledge transformed her, taking her over oceans and across continents, to Harvard and to Cambridge University. Only then would she wonder if she’d traveled too far, if there was still a way home.<br> <br><b>“Beautiful and propulsive . . . Despite the singularity of [Westover’s] childhood, the questions her book poses are universal: How much of ourselves should we give to those we love? And how much must we betray them to grow up?”—<i>Vogue</i></b><br><b><br>ONE OF THE BEST BOOKS OF THE YEAR: <i>The Washington Post, O: The Oprah Magazine, Time,</i> NPR, <i>Good Morning America, San Francisco Chronicle, The Guardian, The Economist, Financial Times</i>,<i> Newsday, New York Post, theSkimm, Refinery29, Bloomberg, Self, Real Simple, Town & Country, Bustle, Paste, Publishers Weekly</i>,<i> Library Journal, LibraryReads, Book Riot,</i> Pamela Paul, KQED, New York Public Library</b>	
57	EMPIRE OF THE SUMMER MOON	1416591060	9781416591061	<b>Finalist for the Pulitzer Prize</b><br> This stunning historical account of the forty-year battle between Comanche Indians and white settlers for control of the American West was a major <i>New York Times</i> bestseller. <p>In the tradition of <i>Bury My Heart at Wounded Knee, </i>a stunningly vivid historical account of the forty-year battle between Comanche Indians and white settlers for control of the American West, centering on Quanah, the greatest Comanche chief of them all. <p> S. C. Gwynne's <i>Empire of the Summer Moon</i><b> </b>spans two astonishing stories. The first traces the rise and fall of the Comanches, the most powerful Indian tribe in American history. The second entails one of the most remarkable narratives ever to come out of the Old West: the epic saga of the pioneer woman Cynthia Ann Parker and her mixed-blood son Quanah, who became the last and greatest chief of the Comanches. <p> Although readers may be more familiar with the tribal names Apache and Sioux, it was in fact the legendary fighting ability of the Comanches that determined just how and when the American West opened up. Comanche boys became adept bareback riders by age six; full Comanche braves were considered the best horsemen who ever rode. They were so masterful at war and so skillful with their arrows and lances that they stopped the northern drive of colonial Spain from Mexico and halted the French expansion westward from Louisiana. White settlers arriving in Texas from the eastern United States were surprised to find the frontier being rolled <i>backward </i>by Comanches incensed by the invasion of their tribal lands. So effective were the Comanches that they forced the creation of the Texas Rangers and account for the advent of the new weapon specifically designed to fight them: the six-gun. <p> The war with the Comanches lasted four decades, in effect holding up the development of the new American nation. Gwynne's exhilarating account delivers a sweeping narrative that encompasses Spanish colonialism, the Civil War, the destruction of the buffalo herds, and the arrival of the railroads--a historical feast for anyone interested in how the United States came into being. <p> Against this backdrop Gwynne presents the compelling drama of Cynthia Ann Parker, a lovely nine-year-old girl with cornflower-blue eyes who was kidnapped by Comanches from the far Texas frontier in 1836. She grew to love her captors and became infamous as the "White Squaw" who refused to return until her tragic capture by Texas Rangers in 1860. More famous still was her son Quanah, a warrior who was never defeated and whose guerrilla wars in the Texas Panhandle made him a legend. <p> S. C. Gwynne's account of these events is meticulously researched, intellectually provocative, and, above all, thrillingly told. <i>Empire of the Summer Moon </i>announces him as a major new writer of American history.	
58	THE DAWN OF EVERYTHING	1250858801	9781250858801	<p><b>INSTANT </b><b><i>NEW YORK TIMES </i>BESTSELLER</b> <br><br><b>A dramatically new understanding of human history, challenging our most fundamental assumptions about social evolution—from the development of agriculture and cities to the origins of the state, democracy, and inequality—and revealing new possibilities for human emancipation.<br></b><br>For generations, our remote ancestors have been cast as primitive and childlike—either free and equal innocents, or thuggish and warlike. Civilization, we are told, could be achieved only by sacrificing those original freedoms or by taming our baser instincts. In their major <i>New York Times</i> bestseller, <i>The Dawn of Everything</i>, David Graeber and David Wengrow fundamentally challenge these assumptions and recast our understanding of human history. We will never again see the past in the same way.<br><br>Drawing on pathbreaking research in archaeology and anthropology, Graeber and Wengrow reveal how history becomes a far more interesting place once we learn to throw off our conceptual blinders and perceive what’s really there. If humans did not spend 95 percent of their evolutionary past in tiny bands of hunter-gatherers, what were they doing during all that time? If agriculture and cities did not mean a plunge into hierarchy and domination, then what kinds of social and economic organizations did they lead to? The answers are often unexpected, and suggest that the course of human history may be less set in stone, and more open to playful, hopeful possibilities, than we tend to assume.<br><br>Destined to be a classic, <i>The Dawn of Everything</i> signals a paradigm shift, profoundly transforming our understanding of the human past and making space to imagine new forms of freedom, new ways of organizing society. This is a monumental book of formidable intellectual and political range, animated by curiosity, moral vision, and hopefulness.</p>	
59	GRIT	1501111116	9781501111112	<b>In this instant <i>New York Times </i>bestseller, Angela Duckworth shows anyone striving to succeed that the secret to outstanding achievement is not talent, but a special blend of passion and persistence she calls “grit.” “Inspiration for non-geniuses everywhere” (<i>People</i>).</b><br><br>The daughter of a scientist who frequently noted her lack of “genius,” Angela Duckworth is now a celebrated researcher and professor. It was her early eye-opening stints in teaching, business consulting, and neuroscience that led to her hypothesis about what really drives success: not genius, but a unique combination of passion and long-term perseverance.<br> <br> In <i>Grit</i>, she takes us into the field to visit cadets struggling through their first days at West Point, teachers working in some of the toughest schools, and young finalists in the National Spelling Bee. She also mines fascinating insights from history and shows what can be gleaned from modern experiments in peak performance. Finally, she shares what she’s learned from interviewing dozens of high achievers—from JP Morgan CEO Jamie Dimon to <i>New Yorker</i> cartoon editor Bob Mankoff to Seattle Seahawks Coach Pete Carroll.<br> <br> “Duckworth’s ideas about the cultivation of tenacity have clearly changed some lives for the better” (<i>The New York Times Book Review</i>). Among <i>Grit</i>’s most valuable insights: any effort you make ultimately counts <i>twice </i>toward your goal; grit can be <i>learned</i>, regardless of IQ or circumstances; when it comes to child-rearing, neither a warm embrace nor high standards will work by themselves; how to trigger lifelong interest; the magic of the Hard Thing Rule; and so much more. Winningly personal, insightful, and even life-changing, <i>Grit</i> is a book about what goes through your head when you fall down, and how<i> that</i>—not talent or luck—makes all the difference. This is “a fascinating tour of the psychological research on success” (<i>The Wall Street Journal)</i>.	
88	WHY A SON NEEDS A MOM	1728235847	9781728235844	<p>Based on Gregory Lang's New York Times bestselling original series! The perfect Mother's Day gift of love or sweet keepsake to show why Mom is so special! </p><p>A touching picture book for kids ages 3-7 and beyond showcasing all the ways a mother will help her child grow, this is the gift for every mom and little boy to celebrate their special bond. Featuring charming animal illustrations and heartwarming rhymes about the loving moments mothers and sons share, Why a Son Needs a Mom is the perfect story to connect mother and son together.</p><p>From the moment that I saw your beautiful face, </p><p>Held you close to my heart in a mother's embrace, </p><p>I promised to help you grow with strength and grace.</p><p>My dear one, my sweet son, my boy.</p><p>For new moms, mothers-to-be, or for that perfect mother-son moment at birthdays and other special occasions all year, this sweet storybook celebrates how a mother helps her little boy grow with strength and love.	Illustrated by gail yerrill
61	TALKING TO STRANGERS	0316299227	9780316299220	<b>Malcolm Gladwell, host of the podcast <i>Revisionist History</i> and author of the #1 <i>New York Times</i> bestseller <i>Outliers</i>, offers a powerful examination of our interactions with strangers</b><b>, </b><b>and why they often go wrong</b><b>--now with a new afterword by the author.</b><br> <br> <br> <br> <b>A Best Book of the Year: <i>The Financial Times, Bloomberg, Chicago Tribune,</i> and <i>Detroit Free Press</i></b><br> <br> <br> <br> How did Fidel Castro fool the CIA for a generation? Why did Neville Chamberlain think he could trust Adolf Hitler? Why are campus sexual assaults on the rise? Do television sitcoms teach us something about the way we relate to one another that isn't true?<br> <br> <br> <br> <i>Talking to Strangers</i> is a challenging and controversial excursion through history, psychology, and scandals taken straight from the news. In it, Malcolm Gladwell revisits the deceptions of Bernie Madoff, the suicide of Sylvia Plath, and the death of Sandra Bland--throwing our understanding of these and other stories into doubt.<br> <br> <br> <br> Something is very wrong, Gladwell argues, with the tools and strategies we use to make sense of people we don't know, and the resulting conflict and misunderstanding have a profound effect on our lives and our world. Now, with <i>Talking to Strangers</i>, Malcolm Gladwell brings us a gripping guidebook for troubled times.	
62	THE ANTHROPOCENE REVIEWED	0525555242	9780525555247	<b>“Masterful. <i>The Anthropocene Reviewed</i> is a beautiful, timely book about the human condition—and a timeless reminder to pay attention to your attention.” —Adam Grant, #1 bestselling author of <i>Think Again</i> and host of the podcast <i>Re:Thinking</i></b><br><b><br>The instant #1 bestseller from John Green, author of <i>The Fault in Our Stars</i> and <i>Turtles All the Way Down</i>, is now available in paperback with two brand-new essays!<br><br></b>“Gloriously personal and life-affirming. The perfect book for right now.”<i> —People<br>“</i>Essential to the human conversation.” —<i>Library Journal, starred review</i><br><br>The Anthropocene is the current geologic age, in which humans have profoundly reshaped the planet and its biodiversity. In this remarkable symphony of essays, bestselling author John Green reviews different facets of the human-centered planet on a five-star scale—from the QWERTY keyboard and sunsets to Canada geese and Penguins of Madagascar. Funny, complex, and rich with detail, the  reviews chart the contradictions of contemporary humanity.<br><br>John Green’s gift for storytelling shines throughout this masterful collection. The Anthropocene Reviewed is an open-hearted exploration of the paths we forge and an unironic celebration of falling in love with the world.	
63	MAGNOLIA TABLE, VOL. 3	0062820176	9780062820174	<br> <br> <p>Joanna Gaines--cofounder of Magnolia, cook and host of Magnolia Table with Joanna Gaines, and New York Times bestselling author--brings us her third cookbook filled with timeless and nostalgic recipes--now reimagined--for today's home cook. </p> <p>Whether it's in the making, the gathering, or the tasting of something truly delicious, this collection of recipes from Magnolia Table, Volume 3 is an invitation to savor every moment. In Joanna's first cookbook, the #1 New York Times bestselling Magnolia Table, she introduced readers to her favorite passed-down family recipes. For her second cookbook, Magnolia Table, Volume 2, she pushed herself beyond her comfort zone to develop new recipes for her family. In this, her third cookbook, Joanna shares the recipes--old and new--that she's enjoyed the most over the years. The result is a cookbook filled with recipes that are timeless, creative, and delicious! Just as in her past books, within each recipe Joanna speaks to the reader, explaining why she likes a recipe, what inspired her to create it in the first place, and how she prefers to serve it. The book is beautifully photographed and filled with dishes you will want to bring into your own home, including:</p> <ul> <li>Honey Butter Layered Biscuit Bites </li> <li>Bananas Foster Pancakes </li> <li>Brussels Sprout Gruyére Gratin </li> <li>White Chicken Alfredo Lasagna </li> <li>Garlic Shrimp over Parmesan Risotto </li> <li>Peanut Butter Pie </li> <li>Brownie Cookies </li> </ul> <br> <br>	
64	ATOMIC HABITS	0735211299	9780735211292	<b>The #1<i> New York Times</i> bestseller. Over 10 million copies sold!<br><br><i>Tiny Changes, Remarkable Results</i></b><br><br>No matter your goals, <i>Atomic Habits</i> offers a proven framework for improving--every day. James Clear, one of the world's leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.<br><br>If you're having trouble changing your habits, the problem isn't you. The problem is your system. Bad habits repeat themselves again and again not because you don't want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you'll get a proven system that can take you to new heights.<br><br>Clear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field.<br><br>Learn how to:<br><ul><li>make time for new habits (even when life gets crazy);</li></ul><ul><li>overcome a lack of motivation and willpower;</li></ul><ul><li>design your environment to make success easier;</li></ul><ul><li>get back on track when you fall off course;</li></ul>...and much more.<br><br><i>Atomic Habits</i> will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.	
81	THE GOLDEN FROG GAMES	1338745794	9781338745795	<p><b>Get ready for more magic, mayhem, and monstruos! From Claribel A. Ortega, author of Frizzy and Ghost Squad, comes the sequel to the instant New York Times bestselling and #1 Indie bestselling Witchlings.</b></p><p></p><p>Every four years, the Twelve Towns gather for a legendary magical tournament--the Golden Frog Games.</p><p></p><p>With Ravenskill hosting this year's games, all eyes are on Seven Salazar, Valley Pepperhorn and Thorn Laroux: the most famous Spares in the Twelve Towns. Thorn is ready to compete as a fashion champion, but when a forbidden hex is used to turn her fellow champions to stone, suspicion lands on the Witchlings. </p><p></p><p>As the Witchlings attempt to unravel the mystery of the stonifications, future Uncle Seven is harboring a dangerous secret: While she's supposed to be able to communicate with animals, the voices she hears most clearly belong to monstruos, and one spine-chilling voice is the loudest of all.</p><p></p><p>Can Seven fix her broken magic and find out who is stonifying the champions . . . before Thorn becomes the next victim?</p><p></p>	
82	BIG TREE	1338180630	9781338180633	<p><b>The fate of all life on Earth may depend on the bravery of two little seeds in this epic adventure from the #1 <i>New York Times</i> bestselling creator and Caldecott Medalist of <i>The Invention of Hugo Cabret</i>.</b></p><p></p><p>"The tale of the natural world is the greatest story we have to tell, and Brian delivers a brilliant chapter of that tale throughout the pages of <i>Big Tree</i>."<b> -- STEVEN SPIELBERG</b></p><p><b>* </b>"An enthralling and expansive meditation on what it means to be alive on this planet."<b></b>--<b><i><i>Booklist</i></i>, starred review</b></p><p><b>* </b>"A balanced and rich book. . . . Powerful."<b></b>-- <b><i>The Bulletin of the Center for Children's Books</i>, starred and recommended review</b></p><p><b>* </b>"In evocative prose and peppery dialogue . . . the cinematic story journeys across time and space, contemplating the power of life to heal."<b></b>-- <b><i>Publishers Weekly</i>, starred review</b></p><p><b>*</b> "A special, one-of-a-kind book for the whole family that readers won't soon forget." <b>-- <i>School Library Journal</i>, starred review</b></p><p>"Inspirational, important, and beautiful. A fable for our times."<b> -- Alan Gratz, bestselling author of <i>Refugee</i> and <i>Ground Zero</i></b></p><p><b><i>"Hello, stars. I thought I heard you calling me."</i></b></p><p>A mysterious voice has been speaking to Louise in her dreams. She and her brother Merwin are Sycamore seeds, who hope to one day set down roots and become big trees. But when a fire forces them to leave their mama tree prematurely, they find themselves catapulted into the unknown, far from home. Alone and unprepared, they must use their wits and imagination to navigate a dangerous world--filled with dinosaurs, meteors, and volcanoes!--and the fear of never finding a safe place to grow up. As the mysterious voice gets louder, Louise comes to realize their mission in life may be much bigger than either of them ever could have imagined!</p><p>Brimming with humor, wonder, mystery, and a profound sense of hope, <i>Big Tree</i> is a trailblazing adventure, illustrated with nearly 300 pages of breathtaking pictures. It is Selznick's most imaginative and far-reaching work to date and a singular reading experience for the whole family.</p><p>The audiobook edition of BIG TREE is brought magnificently to life by Meryl Streep and features music composed by Ernest Troost.</p>	
65	THE GLUCOSE GODDESS METHOD	1668024527	9781668024522	<b>From the #1 internationally bestselling author of<i> Glucose Revolution</i>, a four-week, four-step program for living a healthier, happier life with balanced blood sugar including over 100 recipes, an interactive workbook, and the guidance to make the “new science of nutrition…practical for everyone” (Robert H. Lustig, MD, MSL, <i>New York Times </i>bestselling author of <i>Fat Chance</i>).</b><br><br>Do you suffer from cravings, chronic fatigue, or sugar addiction? Do you sometimes wake up in the morning feeling unable to face the day? Most of the population is stuck on a glucose roller coaster.<br> <br>In her first book, the instant #1 internationally bestselling <i>Glucose Revolution</i>, Jessie Inchauspé offered a revolutionary framework for healing through science-backed nutrition hacks. Now, in <i>The Glucose Goddess Method</i>, she shares the “best practical guide for managing glucose to maximize health and longevity” (David Sinclair, PhD, <i>New York Times </i>bestselling author of <i>Lifespan</i>) with this four-week program to incorporating the principles of how to avoid glucose spikes into your everyday life.<br> <br>Complete with 100 recipes and an interactive workbook, you are guided through four simple, science-proven ways to steady your blood sugar, gaining boundless energy, curbing your cravings, clearing your skin, slowing your ageing process, and sleeping better than you ever have before. You will create positive new habits for life. The best part? You won’t be counting calories and can still eat all the foods you love.	
66	THE CREATIVE ACT	0593652886	9780593652886	<b>The #1 <i>New York Times </i>bestseller.<br><br>"The ultimate graduation gift...It’s a book I wish I would have had on my shelf when I was 25. It’s a book I would give to people who are 25." — Steve Levitt, <i>People I (Mostly) Admire</i><br><br>"A gorgeous and inspiring work of art on creation, creativity, the work of the artist. It will gladden the hearts of writers and artists everywhere, and get them working again with a new sense of meaning and direction. A stunning accomplishment.” —Anne Lamott<br><br><b>From the legendary music producer, a master at helping people connect with the wellsprings of their creativity, comes a beautifully crafted book many years in the making that offers that same deep wisdom to all of us.</b></b><br><br>“<i>I set out to write a book about what to do to make a great work of art. Instead, it revealed itself to be a book on how to be.” —Rick Rubin</i><br><br>Many famed music producers are known for a particular sound that has its day. Rick Rubin is known for something else: creating a space where artists of all different genres and traditions can home in on who they really are and what they really offer. He has made a practice of helping people transcend their self-imposed expectations in order to reconnect with a state of innocence from which the surprising becomes inevitable. Over the years, as he has thought deeply about where creativity comes from and where it doesn’t, he has learned that being an artist isn’t about your specific output, it’s about your relationship to the world. Creativity has a place in everyone’s life, and everyone can make that place larger. In fact, there are few more important responsibilities.<br><br><i>The Creative Act</i> is a beautiful and generous course of study that illuminates the path of the artist as a road we all can follow. It distills the wisdom gleaned from a lifetime’s work into a luminous reading experience that puts the power to create moments—and lifetimes—of exhilaration and transcendence within closer reach for all of us.	
67	THE BOY, THE MOLE, THE FOX AND THE HORSE	0062976583	9780062976581	<p>Charlie Mackesy's beloved The Boy, the Mole, the Fox and the Horse has been adapted into an Academy Award(R) winning animated short film, now available to stream on Apple TV+</p><p>#1 NEW YORK TIMES BESTSELLER - WALL STREET JOURNAL BESTSELLER - USA TODAY BESTSELLER</p><p>"The Boy, the Mole, the Fox and the Horse is not only a thought-provoking, discussion-worthy story, the book itself is an object of art."- Elizabeth Egan, The New York Times</p><p>From British illustrator, artist, and author Charlie Mackesy comes a journey for all ages that explores life's universal lessons, featuring 100 color and black-and-white drawings.</p><p>"What do you want to be when you grow up?" asked the mole.</p><p>"Kind," said the boy.</p><p>Charlie Mackesy offers inspiration and hope in uncertain times in this beautiful book, following the tale of a curious boy, a greedy mole, a wary fox and a wise horse who find themselves together in sometimes difficult terrain, sharing their greatest fears and biggest discoveries about vulnerability, kindness, hope, friendship and love. The shared adventures and important conversations between the four friends are full of life lessons that have connected with readers of all ages. </p>	
68	I WILL TEACH YOU TO BE RICH, SECOND EDITION	1523505745	9781523505746	<b>The groundbreaking <i>NEW YORK TIMES</i> and <i>WALL STREET JOURNAL</i> BESTSELLER that taught a generation how to earn more, save more, and live a rich life—now in a revised 2nd edition.</b><br>  <br> Buy as many lattes as you want. Choose the right accounts and investments so your money grows for you—automatically. Best of all, spend guilt-free on the things you love.<br>  <br> Personal finance expert Ramit Sethi has been called a “wealth wizard” by <i>Forbes</i> and the “new guru on the block” by <i>Fortune</i>. Now he’s updated and expanded his modern money classic for a new age, delivering a simple, powerful, no-BS 6-week program that just works.<br>  <br><i>I Will Teach You to Be Rich</i> will show you:<br> • How to crush your debt and student loans faster than you thought possible<br> • How to set up no-fee, high-interest bank accounts that won’t gouge you for every penny<br> • How Ramit automates his finances so his money goes exactly where he wants it to—and how you can do it too<br> • How to talk your way out of late fees (with word-for-word scripts)<br> • How to save hundreds or even thousands per month (and still buy what you love)<br> • A set-it-and-forget-it investment strategy that’s dead simple and beats financial advisors at their own game<br> • How to handle buying a car or a house, paying for a wedding, having kids, and other big expenses—stress free<br> • The exact words to use to negotiate a big raise at work<br>  <br><b>Plus, this 10th anniversary edition features over 80 new pages, including:</b><br> • New tools<br> • New insights on money and psychology<br> • Amazing stories of how previous readers used the book to create their rich lives<br>  <br> Master your money—and then get on with your life.<br><br>  	
83	BECAUSE I HAD A TEACHER	1943200084	9781943200085	We all remember our favorite teacher.<p>Where would we be without them - those special people who inspire us, support us, and encourage us? Whether they're an educator, a coach, or a mentor, this book is for them. To celebrate the worlds they open up for us and to thank them for the difference they make.<p>This heartwarming book is a thank you gift for great teachers everywhere. Perfect for National Teacher Day, Teacher Appreciation Week, the end of the school year, or just because.	Illustrated by natalie russell
69	Y'ALL EAT YET?	0063087782	9780063087781	<p>From country music sensation Miranda Lambert, comes a gorgeous cookbook sharing a wide array of tasty favorite recipes, straight outta Texas and collected from all the fabulous women who helped make Miranda who she is today. </p> <p>If you're going to have a Bitchin Kitchen, you're going to need a few things--plenty of room, plenty of good food for sharing, high spirits (in both senses) and all the friends and family you can fit. For Miranda Lambert, a good time means sharing a great meal with the women who helped raise her back in Texas--her mom and a colorful bunch of best friends who could raise the roof, come through in a pinch, celebrate, cry, and really, really cook. Miranda Lambert invites readers into this special circle of sisterhood with collection of recipes and stories. Y'all Eat Yet? is full of recipes for meals that fill your belly, and your soul, food meant to be shared, meant to be eaten with your fingers off of paper plates, or on your fanciest antique China. Some were handed down to Miranda from her mom and grandma, some come from the circle of cherished friends who helped raise her, and all of them are meant to be easy to prepare and shared with those you love. True to Miranda's personality, Y'all Eat Yet? is sassy and inviting. Whether she's cooking up omelets in her tricked-out Airstream to serve with Mimosas or laying out the Whiskey cupcakes next to Nonny's Banana pudding, Y'all Eat Yet? delivers food you want to make alongside charming stories that show just why Miranda Lambert is one of the most beloved artists in country music today.</p>	
70	SERENITY IN THE STORM	1637587295	9781637587294	<b>Kayleigh McEnany brings to life the key cultural and political issues of our time, from the fall of Afghanistan to the Supreme Court’s abortion decision, analyzing world events through the lens of faith and providing readers with <i>Serenity in the Storm</i>.</b><br><br>Our world, without question, is experiencing aberrational times. The ravages and life-altering realities of COVID-19 that I worked through as White House press secretary were just the start of it. What followed was a series of history-defining events. From the fall of Afghanistan to the nationwide crime wave, we’ve all endured painful images of death, destruction, and chaos.<br> <br> Meanwhile, radical teachings on gender and race have infiltrated our nation’s schools, poisoning the minds of our children—all at a time when our country feels more divided than ever before. Along with these twenty-first century realities can come a feeling of despair and discouragement. Indeed, I hear it all the time as I crisscross the country: Americans feel disheartened and seek hope.<br> <br> <i>Serenity in the Storm </i>provides that hope. Despite the challenges we face, there is cause for great optimism for men and women of faith. In Afghanistan, the underground church is thriving. On the key issues of life and liberty, the Supreme Court of the United States has delivered enormous and consequential victories. In our schools, voters have spoken unmistakably against the insidious doctrines of critical race and gender theory. There is no doubt that God is at work as He hears the prayers of the faithful!<br> <br> Taking a similar format to my <i>New York Times</i> bestselling book, <i>For Such a Time as This</i>, I analyze our domestic and international challenges through the lens of faith. Though we have lived through dark times and unsettled waters, the storms we face have prompted many great leaders to rise to the moment and have left a yearning in the human heart for a Savior, Jesus Christ, who is walking alongside us every step of the way.	
71	THE WISDOM OF THE BULLFROG	1538707942	9781538707944	<b>THE INSTANT #1 <i>New York Times</i> BESTSELLER<br> <br> <br> <br> From the acclaimed, bestselling author of <i>Make Your Bed</i>--a short, inspirational book of advice and leadership lessons that Admiral McRaven collected over his four decades as a Navy SEAL.</b><br> <br> <br> <br> The title "Bullfrog" is given to the Navy SEAL who has served the longest on active duty. Admiral McRaven was honored to receive this honor in 2011 when he took charge of the United States Special Operations Command. When McRaven retired in 2014, he had 37 years as a Navy SEAL under his belt, leading men and women at every level of the special operations community. In the ensuing four years, he served as Chancellor to the entire University of Texas System, with its 230,000 students and 100,000 faculty and health care workers.<br> <br> <br> <br> During those four decades, Admiral McRaven dealt with every conceivable leadership challenge, from commanding combat operations--including the capture of Saddam Hussein, the rescue of Captain Phillips, and the raid for Osama bin Laden. <br> <br> <br> <br> THE WISDOM OF THE BULLFROG draws on these and countless other experiences from Admiral McRaven's incredible life, including crisis situations, management debates, organizational transitions, and ethical dilemmas, to provide readers with the most important leadership lessons he has learned over the course of his forty years of service. Each chapter provides a <i>Make Your Bed</i>-like parable, rich with insights like those featured in his bestselling memoir, <i>Sea Stories</i>, about the specific leadership traits required to be at the top of your game, including: <ul> <li>Who Dares, Wins</li> <li>Run to the Sound of the Guns</li> <li>No Plan Survives First Contact with the Enemy</li> </ul> THE WISDOM OF THE BULLFROG is Admiral McRaven's clear-eyed treatise on the leadership qualities that separate the good from the truly great.	
72	SOUL BOOM	0306828278	9780306828270	"The trauma that our world experienced in recent years--as result of both the pandemic and societal tensions that threaten to overwhelm us-has been unprecedented and is not going away anytime soon. It is clear that existing political and economic systems are not enough to bring the change that the world needs. In this book, Rainn Wilson explores the possibility and hope for a spiritual revolution, a 'Soul Boom' in order to address today's greatest issues--mental health, racism and sexism, climate change, and economic injustice. For Wilson, this is very serious and essential pursuit, but he brings great humor and his own unique perspective to the conversation. He feels that, culturally, we've thrown the baby out with the bathwater--and that bathwater is spirituality, Faith and the Sacred. The baby is us, and we are in need of profound healing and a unifying understanding of the world that religion provides. Sharing his experience of losing his father during the summer of 2020 as well as his personal struggles with addiction and mental health, Wilson is an empathetic narrator and thinker who readers will appreciate and trust. Wilson's approach to spirituality--the non-physical, eternal aspects of ourselves--is relatable and will apply to people of all beliefs, even the skeptics. Filled with genuine insight--not to mention enlightening Kung Fu and Star Trek references--the book offers the keys to delving into ancient wisdom and seeking out practical, transformative answers to life's biggest questions"--	
73	THE SUN AND THE STAR	1368081150	9781368081153	<b>Demigods Nico di Angelo and Will Solace must endure the terrors of Tartarus to rescue an old friend in this thrilling adventure co-written by <i>New York Times</i> #1 best-selling author Rick Riordan and award-winning author Mark Oshiro.</b><br><br>Percy Jackson fans, rejoice! Nico and Will have a book of their own!<br><br>As the son of Hades, Nico di Angelo has been through so much, from the premature deaths of his mother and sister, to being outed against his will, to losing his friend Jason during the trials of Apollo. But there <i>is </i>a ray of sunshine in his life—literally: his boyfriend, Will Solace, the son of Apollo. Together the two demigods can overcome any obstacle or foe. At least, that's been the case so far...<br><br>Now Nico is being plagued by a voice calling out to him from Tartarus, the lowest part of the Underworld. He thinks he knows who it is: a reformed Titan named Bob whom Percy and Annabeth had to leave behind when they escaped Hades's realm. Nico's dreams and Rachel Dare's latest prophecy leave little doubt in Nico's mind that Bob is in some kind of trouble. Nico has to go on this quest, whether Mr. D and Chiron like it or not. And of course Will insists on coming with. But can a being made of light survive in the darkest part of the world? and what does the prophecy mean that Nico will have to "leave something of equal value behind?" <br><br><b>Nico will have to face demons both internal and external as his relationship with Will is tested to the core in this standalone adventure featuring two of the most popular characters in the Percy Jackson saga.</b><br><br>Complete your Nico di Angelo collection with these series by Rick Riordan: Percy Jackson and the Olympians • The Heroes of Olympus • The Trials of Apollo	
74	WONDER	0375869026	9780375869020	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER •</b> <b>Millions of people have fallen in love with Auggie Pullman, an ordinary boy with an extraordinary face</b>—<b>who shows us that kindness brings us together no matter how far apart we are.</b> <b>Read the book that inspired the Choose Kind movement, a major motion picture, and the critically acclaimed graphic novel <i>White Bird.</i><br><br>And don't miss R.J. Palacio's highly anticipated new novel, <i>Pony, </i>available now!<br> </b><br><i>I won't describe what I look like. Whatever you're thinking, it's probably worse.</i> <br> <br>August Pullman was born with a facial difference that, up until now, has prevented him from going to a mainstream school. Starting 5th grade at Beecher Prep, he wants nothing more than to be treated as an ordinary kid—but his new classmates can’t get past Auggie’s extraordinary face. Beginning from Auggie’s point of view and expanding to include his classmates, his sister, her boyfriend, and others, the perspectives converge to form a portrait of one community’s struggle with empathy, compassion, and acceptance. In a world where bullying among young people is an epidemic, this is a refreshing new narrative full of heart and hope.<br> <br>R.J. Palacio has called her debut novel “a meditation on kindness” —indeed, every reader will come away with a greater appreciation for the simple courage of friendship. Auggie is a hero to root for, a diamond in the rough who proves that you can’t blend in when you were born to stand out. <i><br></i>	
75	SKANDAR AND THE PHANTOM RIDER	1665912766	9781665912761	<b>Skandar’s adventure among the warrior unicorns continues in this spectacular sequel to the instant <i>New York Times</i> and international bestseller <i>Skandar and the Unicorn Thief.</i></b><br><br>Skandar Smith has achieved his dream: to train as a unicorn rider. But as Skandar and his friends enter their second year at the Eyrie, a new threat arises. Immortal wild unicorns are somehow being killed, a prophecy warns of terrible danger, and elemental destruction begins to ravage the Island.<br> <br>Meanwhile, Skandar’s sister, Kenna, longs to join him, and Skandar is determined to help her, no matter what. As the storm gathers, can Skandar find the key to stop the Island tearing itself apart before it’s too late for them all?	
76	REFUGEE	0545880831	9780545880831	A tour de force from acclaimed author Alan Gratz (<i>Prisoner B-3087</i>), this timely -- and timeless -- novel tells the powerful story of three different children seeking refuge.<p></p><b>A <i>New York Times</i> bestseller!</b>JOSEF is a Jewish boy living in 1930s Nazi Germany. With the threat of concentration camps looming, he and his family board a ship bound for the other side of the world . . .ISABEL is a Cuban girl in 1994. With riots and unrest plaguing her country, she and her family set out on a raft, hoping to find safety in America . . .MAHMOUD is a Syrian boy in 2015. With his homeland torn apart by violence and destruction, he and his family begin a long trek toward Europe . . .All three kids go on harrowing journeys in search of refuge. All will face unimaginable dangers -- from drownings to bombings to betrayals. But there is always the hope of <i>tomorrow</i>. And although Josef, Isabel, and Mahmoud are separated by continents and decades, shocking connections will tie their stories together in the end.This action-packed novel tackles topics both timely and timeless: courage, survival, and the quest for home.	
77	IT'S NOT BRAGGING IF IT'S TRUE	0593568990	9780593568996	<b><i>NEW YORK TIMES</i> BESTSELLER • Kids will be inspired to embrace their inner weirdness and persevere through obstacles after reading this empowering collection of true stories from teenage Scripps National Spelling Bee champ and Guinness World Record holder Zaila Avant-garde! Includes 8 pages of never-before-seen photos.</b><br><br>After Zaila Avant-garde became the first African American student to win the Scripps National Spelling Bee in 2021, she turned into an overnight sensation. People wanted to know who she was and how she'd achieved so much while so young. <br><br>In this nonfiction book, Zaila shares the personal anecdotes that have shaped her life and extends advice to readers on living authentically. While Zaila is an exceptional and inspiring young woman, she has fears and anxieties just like everyone else; what makes her remarkable is the way she chooses to move through the obstacles in front of her.<br><br>Zaila shares about her family, her accomplishments, her experience of being homeschooled, and so much more in order to motivate and uplift other kids who have small-, medium-, and even big-sized dreams.	
78	THE COMPLETE COOKBOOK FOR YOUNG CHEFS	1492670022	9781492670025	<p>The #1 New York Times Best Seller <br> IACP Award Winner</p><p>Want to bake the most-awesome-ever cupcakes? Or surprise your family with breakfast tacos on Sunday morning? Looking for a quick snack after school? Or maybe something special for a sleepover? It's all here. Learn to cook like a pro--it's easier than you think.</p><p>For the first time ever, America's Test Kitchen is bringing their scientific know-how, rigorous testing, and hands-on learning to KIDS in the kitchen </p><p>Using kid-tested and approved recipes, America's Test Kitchen has created THE cookbook every kid chef needs on their shelf. Whether you're cooking for yourself, your friends, or your family, The Complete Cookbook for Young Chefs has delicious recipes that will wow </p><ul><li> Recipes were thoroughly tested by more than 750 kids to get them just right for cooks of all skill levels--including recipes for breakfast, snacks and beverages, dinners, desserts, and more.</li><li> Step-by-step photos of tips and techniques will help young chefs feel like pros in their own kitchen</li><li> Testimonials (and even some product reviews ) from kid test cooks who worked alongside America's Test Kitchen will encourage young chefs that they truly are learning the best recipes from the best cooks.</li></ul><p>By empowering young chefs to make their own choices in the kitchen, America's Test Kitchen is building a new generation of confident cooks, engaged eaters, and curious experimenters.<br></p>	
79	FALL OF THE SCHOOL FOR GOOD AND EVIL	0063269538	9780063269538	<p>THE SCHOOL FOR GOOD AND EVIL is the #1 movie now streaming on Netflix--starring Academy Award winner Charlize Theron, Kerry Washington, Laurence Fishburne, Michelle Yeoh, Sofia Wylie, Sophie Anne Caruso, Jamie Flatters, Earl Cave, Kit Young, and many others! </p> <p>What rises . . . must fall.</p> <p>Two brothers</p> <p>One Good.</p> <p>One Evil.</p> <p>In exchange for power and immortality,</p> <p>they watch over the Endless Woods</p> <p>and rule the School for Good and Evil.</p> <p>Yet all School Masters must face a test.</p> <p>Theirs is loyalty.</p> <p>But what happens when loyalty is corrupted? When the bonds of blood are broken?</p> <p>Who will survive? Who will die? And what will become of the school and its students?</p> <p>The journey that started a hundred years ago throttles towards its end. This final chapter in the duology that began with the RISE OF THE SCHOOL FOR GOOD AND EVIL brings the tale of the twin School Masters to the brink of war and a shocking conclusion that will change the course of the school forever. </p>	Illustrated by raidesart
91	THE DAY THE CRAYONS QUIT	0399255370	9780399255373	<b>The hilarious, colorful #1 <i>New York Times</i> bestselling phenomenon that every kid wants! Gift a copy to someone you love today.<br></b><br> Poor Duncan just wants to color. But when he opens his box of crayons, he finds only letters, all saying the same thing: His crayons have had enough! They quit! Blue crayon needs a break from coloring all those bodies of water. Black crayon wants to be used for more than just outlining.  And Orange and Yellow are no longer speaking—each believes he is the true color of the sun. What can Duncan possibly do to appease all of the crayons and get them back to doing what they do best?<br><br>With giggle-inducing text from Drew Daywalt and bold and bright illustrations from Oliver Jeffers, <i>The Day the Crayons Quit</i> is the perfect gift for new parents, baby showers, back-to-school, or any time of year! Perfect for fans of <i>Don't Let the Pigeon Drive the Bus </i>by Mo Willems and <i>The True Story of the Three Little Pigs </i>by Jon Sciezka and Lane Smith. <br><br><b>Praise for <i>The Day the Crayons Quit:</i></b><br><br><b>Amazon’s 2013 Best Picture Book of the Year</b><br><b>A Barnes & Noble Best Book of 2013</b><br><b>Goodreads’ 2013 Best Picture Book of the Year </b><br><b>Winner of the E.B. White Read-Aloud Award</b><br><br>* “Hilarious . . . Move over, <i>Click, Clack, Moo</i>; we’ve got a new contender for the most successful picture-book strike.” –<b><i>BCCB</i>, starred review </b><br><br>“Jeffers . . . elevates crayon drawing to remarkable heights.” –<b><i>Booklist</i></b><br><br>“Fresh and funny.” –<b><i>The Wall Street Journal</i></b><br><br>"This book will have children asking to have it read again and again.” –<b><i>Library Media Connection</i></b><br><br>* “This colorful title should make for an uproarious storytime.” –<b><i>School Library Journal</i>, starred review </b><br><br>* “These memorable personalities will leave readers glancing apprehensively at their own crayon boxes.” –<b><i>Publishers Weekly</i>, starred review </b><br><br>“Utterly original.” –<b><i>San Francisco Chronicle</i></b>	Illustrated by oliver jeffers
92	BIG	0316353221	9780316353229	<b>From a <i>New York Times</i> bestselling and award-winning creator, this deeply moving story shares valuable lessons about fitting in, standing out, and the beauty of joyful acceptance.</b><br> <br> <br> <br> The first picture book written and illustrated by award-winning creator Vashti Harrison traces a child's journey to self-love and shows the power of words to both hurt and heal. With spare text and exquisite illustrations, this emotional exploration of being big in a world that prizes small is a tender portrayal of how you can stand out and feel invisible at the same time.<br> <br>	
93	THE ONE AND ONLY	0063080087	9780063080089	<p>From beloved powerhouse author Katherine Applegate comes The One and Only Ruby, starring the adorable baby elephant from the Newbery Medal-winning modern classic The One and Only Ivan and its bestselling sequel, The One and Only Bob.</p> <p>Ruby's story picks up a few months after the events of The One and Only Bob. Now living in a wildlife sanctuary, Ruby's caretaker from the elephant orphanage in Africa where she grew up is visiting. Seeing him again brings back a flood of memories both happy and sad of her life before the circus, and she recounts the time she spent in the African savannah to Ivan and Bob.</p> <p>In the timeless way that only Katherine Applegate could craft, this highly anticipated novel in verse is the perfect mix of heartfelt and humorous, poignant and sweet. Artist Patricia Castelao returns to the world of Ivan and his friends with gorgeous black-and-white interior illustrations to complete the story.</p> <p>The One and Only Ruby features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p> <p>This middle grade novel is an excellent choice for tween readers in grades 5 to 8, for independent reading, homeschooling, and sharing in the classroom.</p> <p>Don't miss the film adaptation of The One and Only Ivan, now streaming on Disney+!</p>	
94	THE HUNGER GAMES	1338635174	9781338635171	<b>Ambition will fuel him.</b><b>Competition will drive him.</b><b>But power has its price.</b><p></p>It is the morning of the reaping that will kick off the tenth annual Hunger Games. In the Capitol, eighteen-year-old Coriolanus Snow is preparing for his one shot at glory as a mentor in the Games. The once-mighty house of Snow has fallen on hard times, its fate hanging on the slender chance that Coriolanus will be able to outcharm, outwit, and outmaneuver his fellow students to mentor the winning tribute. The odds are against him. He's been given the humiliating assignment of mentoring the female tribute from District 12, the lowest of the low. Their fates are now completely intertwined -- every choice Coriolanus makes could lead to favor or failure, triumph or ruin. Inside the arena, it will be a fight to the death. Outside the arena, Coriolanus starts to feel for his doomed tribute... and must weigh his need to follow the rules against his desire to survive no matter what it takes.	
95	DIARY OF A WIMPY KID	141976294X	9781419762949	<b>In <i>Diper Överlöde</i>, book 17 of the Diary of a Wimpy Kid series from #1 international bestselling author Jeff Kinney, Greg Heffley is finding out that the road to fame and glory comes with some hard knocks.</b><br> <br> <br> <br> When he decides to tag along with his brother Rodrick's band, Löded Diper, Greg doesn't realize what he's getting into. But he soon learns that late nights, unpaid gigs, fighting between band members, and money troubles are all part of the rock 'n' roll lifestyle.<br> <br> <br> <br> Can Greg help Löded Diper become the legends they think they are? Or will too much time with Rodrick's band be a diper överlöde?	Written and illustrated by jeff kinney
96	A GOOD GIRL'S GUIDE TO MURDER	1984896393	9781984896391	<b>THE MUST-READ MULTIMILLION BESTSELLING MYSTERY SERIES • Everyone is talking about <i>A Good Girl's Guide to Murder</i>! With shades of Serial and Making a Murderer this is the story about an investigation turned obsession, full of twists and turns and with an ending you'll never expect.</b><br><br>Everyone in Fairview knows the story.<br><br>Pretty and popular high school senior Andie Bell was murdered by her boyfriend, Sal Singh, who then killed himself. It was all anyone could talk about. And five years later, Pip sees how the tragedy still haunts her town.<br><br>But she can't shake the feeling that there was more to what happened that day. She knew Sal when she was a child, and he was always so kind to her. How could he possibly have been a killer?<br><br>Now a senior herself, Pip decides to reexamine the closed case for her final project, at first just to cast doubt on the original investigation. But soon she discovers a trail of dark secrets that might actually prove Sal innocent . . . and the line between past and present begins to blur. Someone in Fairview doesn't want Pip digging around for answers, and now her own life might be in danger.<br><br><br><b>And don't miss the sequel, </b><i><b>Good Girl, Bad Blood!</b> </i><br><br><b>"The perfect nail-biting mystery." —Natasha Preston, #1 <i>New York Times </i>bestselling author</b>	
97	HARRY POTTER	059035342X	9780590353427	Harry Potter has never been the star of a Quidditch team, scoring points while riding a broom far above the ground. He knows no spells, has never helped to hatch a dragon, and has never worn a cloak of invisibility.All he knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley - a great big swollen spoiled bully. Harry's room is a tiny closet at the foot of the stairs, and he hasn't had a birthday party in eleven years.But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to an incredible place that Harry - and anyone who reads about him - will find unforgettable.For it's there that he finds not only friends, aerial sports, and magic in everything from classes to meals, but a great destiny that's been waiting for him... if Harry can survive the encounter.	
98	THE SUMMER I TURNED PRETTY TRILOGY	1416968296	9781416968290	<b><b>Now an Original Series on Prime Video!</b><br> <br><b>Belly has an unforgettable summer in this stunning start to the Summer I Turned Pretty series from the <i>New York Times</i> bestselling author of <i>To All the Boys I’ve Loved Before</i> (now a major motion picture!), Jenny Han.</b></b><br><br><i>Some summers are just destined to be pretty.</i><br> <br>Belly measures her life in summers. Everything good, everything magical happens between the months of June and August. Winters are simply a time to count the weeks until the next summer, a place away from the beach house, away from Susannah, and most importantly, away from Jeremiah and Conrad. They are the boys that Belly has known since her very first summer—they have been her brother figures, her crushes, and everything in between. But one summer, one wonderful and terrible summer, the more everything changes, the more it all ends up just the way it should have been all along.	
99	CAPTAIN UNDERPANTS	1338865390	9781338865394	<b>Celebrate the 25th and a half anniversary of THE ADVENTURES OF CAPTAIN UNDERPANTS with a special edition featuring a BRAND NEW 32-page DOG MAN comic!</b><p></p><p>George and Harold are best friends who enjoy making their own comic books. Together they've created the greatest superhero in the history of their elementary school: Captain Underpants! His true identity is SO secret, even HE doesn't know who he is! Tra-la-laaaaa! It's can't-miss fun!</p><p>After the Captain Underpants adventure, join George and Harold as they share their never-before-seen bonus comics: <i>Captain Underpants Meets Dog Man</i> and <i>Dog Man and the League of Misfits</i>.</p><p><i>The Adventures of Captain Underpants</i> is the first book in the worldwide bestselling Captain Underpants series by Dav Pilkey. Dive into the newest graphic novel in the Dog Man series: <b>Dog Man: Twenty Thousand Fleas Under the Sea</b>. For even more adventures, creativity, and humor, join Flippy and Li'l Petey in the <b>Cat Kid Comic Club</b> series. Reading gives you superpowers!</p>	Written and illustrated by dav pilkey
100	PERCY JACKSON & THE OLYMPIANS	0786838655	9780786838653	A boy battles mythological monsters.	
101	SHADOW AND BONE TRILOGY	125019623X	9781250196231	<p><b>See the Grishaverse come to life on screen with the Netflix series, <i>Shadow and Bone</i>. Just wait for the daring rogue Nikolai to join the fold in Season 2 -- covering explosive events of both Siege and Storm and Ruin and Rising -- streaming now! </b> <p><b>All three books in Leigh Bardugo's <i>New York Times</i>-bestselling Shadow and Bone Trilogy are now available together in a beautiful paperback boxed set.<br></b><br>Soldier. Summoner. Saint. Follow Alina Starkov through <i>Shadow and Bone</i>, <i>Siege and Storm</i>, and <i>Ruin and Rising</i> as she discovers her dormant powers and is swept up in a world of luxury and illusion. As Alina struggles to fit into her new life, a threat to the kingdom of Ravka grows--one that will test old alliances and challenge the very limits of magic, one that will forge a leader from a frightened girl. <p><b>Praise for The Shadow and Bone Trilogy: <br></b><br>"<b>This is what fantasy is for.</b>" --Laini Taylor for <i>The </i><i>New York Times </i>on <i>Shadow and Bone</i> <p>"Set in a <b>fascinating, unique world rich with detail</b>, <i>Shadow and Bone</i> was <b>unlike anything I've ever read</b>. Alina is a clever, sympathetic character I will gladly follow into the next installment--which can't come soon enough!" --Veronica Roth, <i>New York Times</i>-bestselling author of <i>Divergent, </i> on <i>Shadow and Bone</i></p>	
102	THE INHERITANCE GAMES	0759555400	9780759555402	<b>2 MILLION COPIES SOLD OF THE #1 BESTSELLING SERIES!<br> <br> <br> <br> Don't miss this <i>New York Times</i> bestselling "impossible to put down" (Buzzfeed) novel with deadly stakes, thrilling twists, and juicy secrets -- perfect for fans of <i>One of Us is Lying</i> and <i>Knives Out</i>.</b><br> <br> <br> <br> Avery Grambs has a plan for a better future: survive high school, win a scholarship, and get out. But her fortunes change in an instant when billionaire Tobias Hawthorne dies and leaves Avery virtually his entire fortune. The catch? Avery has no idea why -- or even who Tobias Hawthorne is.<br> <br> <br> <br> To receive her inheritance, Avery must move into sprawling, secret passage-filled Hawthorne House, where every room bears the old man's touch -- and his love of puzzles, riddles, and codes. Unfortunately for Avery, Hawthorne House is also occupied by the family that Tobias Hawthorne just dispossessed. This includes the four Hawthorne grandsons: dangerous, magnetic, brilliant boys who grew up with every expectation that one day, they would inherit billions. Heir apparent Grayson Hawthorne is convinced that Avery must be a conwoman, and he's determined to take her down. His brother, Jameson, views her as their grandfather's last hurrah: a twisted riddle, a puzzle to be solved. Caught in a world of wealth and privilege with danger around every turn, Avery will have to play the game herself just to survive.<br> <br> <br> <br> **<i>Avery's story continues in</i> The Hawthorne Legacy <i>and</i> The Final Gambit	
103	SOLITAIRE	None	9781339016238	Tori Spring is determined to find out who's behind the blog called Solitaire, which has caused serious pranks at her school.	
104	WARRIOR GIRL UNEARTHED	1250766583	9781250766588	<p><b>#1 New York Times bestselling author of Firekeeper's Daughter Angeline Boulley takes us back to Sugar Island in this high-stakes thriller about the power of discovering your stolen history.</b><br><br>Perry Firekeeper-Birch has always known who she is - the laidback twin, the troublemaker, the best fisher on Sugar Island. Her aspirations won't ever take her far from home, and she wouldn't have it any other way. But as the rising number of missing Indigenous women starts circling closer to home, as her family becomes embroiled in a high-profile murder investigation, and as greedy grave robbers seek to profit off of what belongs to her Anishinaabe tribe, Perry begins to question everything. <br><br>In order to reclaim this inheritance for her people, Perry has no choice but to take matters into her own hands. She can only count on her friends and allies, including her overachieving twin and a charming new boy in town with unwavering morals. Old rivalries, sister secrets, and botched heists cannot - will not - stop her from uncovering the mystery before the ancestors and missing women are lost forever.<br><br><b>Sometimes, the truth shouldn't stay buried.</b></p>	
105	IMOGEN, OBVIOUSLY	0063045877	9780063045873	<p>With humor and insight, #1 New York Times bestseller Becky Albertalli explores the nuances of sexuality, identity, and friendship in this timely new novel.</p> <p>Imogen Scott may be hopelessly heterosexual, but she's got the World's Greatest Ally title locked down.</p> <p>She's never missed a Pride Alliance meeting. She knows more about queer media discourse than her very queer little sister. She even has two queer best friends. There's Gretchen, a fellow high school senior, who helps keep Imogen's biases in check. And then there's Lili--newly out and newly thriving with a cool new squad of queer college friends.</p> <p>Imogen's thrilled for Lili. Any ally would be. And now that she's finally visiting Lili on campus, she's bringing her ally A game. Any support Lili needs, Imogen's all in.</p> <p>Even if that means bending the truth, just a little.</p> <p>Like when Lili drops a tiny queer bombshell: she's told all her college friends that Imogen and Lili used to date. And none of them know that Imogen is a raging hetero--not even Lili's best friend, Tessa.</p> <p>Of course, the more time Imogen spends with chaotic, freckle-faced Tessa, the more she starts to wonder if her truth was ever all that straight to begin with. . .</p>	
106	MILES MORALES SUSPENDED	1665918462	9781665918466	<b>From #1 <i>New York Times</i> bestselling author Jason Reynolds comes the high-flying sequel to his groundbreaking young adult novel <i>Miles Morales: Spider-Man</i> about the adventures of the unassuming, everyday kid who just so happens to be Spider-Man.</b><br><br>Miles Morales is still just your average teenager. He has unexpectedly become totally obsessed with poetry and can never seem to do much more than babble around his crush. Nothing too weird. Oh! Except, just yesterday, he used his spidey superpowers to save the world (no biggie) from an evil mastermind called The Warden. And the grand prize Miles gets for that is…<br> <br>Suspension.<br> <br>But what begins as a long boring day of in-school suspension is interrupted by a little <i>bzzz</i> in his mind. His spidey-sense is telling him there’s something not quite right here, and soon he finds himself in a fierce battle with an insidious…termite?! His unexpected foe is hiding a secret, one that could lead to the destruction of the world’s history—especially Black and Brown history—and only Miles can stop him. Yeah, just a typical day in the life of your friendly neighborhood Spider-Man.	Illustrated by zeke peña
107	FIVE SURVIVE	0593374169	9780593374160	<b>Eight hours. Six friends. Five survive. A road trip turns deadly in this addictive YA thriller from the bestselling author of the worldwide phenomenon A GOOD GIRL'S GUIDE TO MURDER. </b><br><br>Red Kenny is on a road trip for spring break with five friends: Her best friend - the older brother - his perfect girlfriend - a secret crush - a classmate - and a killer. <br><br>When their RV breaks down in the middle of nowhere with no cell service, they soon realize this is no accident. They have been trapped by someone out there in the dark, someone who clearly wants one of them dead.<br><br>With eight hours until dawn, the six friends must escape, or figure out which of them is the target. But is there a liar among them? Buried secrets will be forced to light and tensions inside the RV will reach deadly levels. Not all of them will survive the night. . . .	
108	NICK AND CHARLIE	1338885103	9781338885101	<p>From the mega-bestselling creator of <i>Heartstopper</i>, a must-have novella in which <i>Heartstopper's</i> lead characters, Nick and Charlie, face one of their biggest challenges yet.</p><p></p><p><i>Absence makes the heart grow fonder... right? </i></p><p>Everyone knows that Nick and Charlie love their nearly inseparable life together. But soon Nick will be leaving for university, and Charlie, a year younger, will be left behind. Everyone's asking if they're staying together, which is a stupid question... or at least that's what Nick and Charlie assume at first.</p><p>As the time to say goodbye gets inevitably closer, both Nick and Charlie start to question whether their love is strong enough to survive being apart. Charlie is sure he's holding Nick back... and Nick can't tell what Charlie's thinking.</p><p>Things spiral from there.</p><p>Everyone knows that first loves rarely last forever. What will it take for Nick and Charlie to defy the odds?</p>	
109	THE FIRST TO DIE AT THE END	0063240807	9780063240803	<p>In this prequel to the bestselling phenomenon They Both Die at the End, two new strangers spend a life-changing day together after Death-Cast first makes their fateful calls. #1 New York Times bestseller!</p> <p>It's the night before Death-Cast goes live, and there's one question on everyone's mind: Can Death-Cast actually predict when someone will die, or is it just an elaborate hoax?</p> <p>Orion Pagan has waited years for someone to tell him that he's going to die. He has a serious heart condition, and he signed up for Death-Cast so he could know what's coming.</p> <p>Valentino Prince is restarting his life in New York. He has a long and promising future ahead and he only registered for Death-Cast after his twin sister nearly died in a car accident.</p> <p>Orion and Valentino cross paths in Times Square and immediately feel a deep connection. But when the first round of End Day calls goes out, their lives are changed forever--one of them receives a call, and the other doesn't. Though neither boy is certain how the day will end, they know they want to spend it together...even if that means their goodbye will be heartbreaking.</p> <p>Told with acclaimed author Adam Silvera's signature bittersweet touch, this story celebrates the lasting impact that people have on each other and proves that life is always worth living to the fullest. </p> <p>* A Publishers Weekly Best Book of the Year *</p>	
123	KAIJU NO. 8, VOL. 6	1974736334	9781974736331	<b>Kafka wants to clean up kaiju, but not literally! Will a sudden metamorphosis stand in the way of his dream?</b><br><br>With the highest kaiju-emergence rates in the world, Japan is no stranger to attack by deadly monsters. Enter the Japan Defense Force, a military organization tasked with the neutralization of kaiju. Kafka Hibino, a kaiju-corpse cleanup man, has always dreamed of joining the force. But when he gets another shot at achieving his childhood dream, he undergoes an unexpected transformation. How can he fight kaiju now that he’s become one himself?!<br><br>Kafka has encountered Kaiju No. 9, but he finds himself unable to transform. Luckily, Kikoru comes to the rescue and goes head-to-head with it. Meanwhile, the Kaiju No. 9 that Captain Narumi encountered undergoes an evolution during battle! With the pressure on, Director General Shinomiya is left with no choice but to act!	
124	FOR WHOM THE BALL ROLLS	1338236598	9781338236590	The Supa Buddies have been working hard to help Dog Man overcome his bad habits. But when his obsessions turn to fears, Dog Man finds himself the target of an all-new supervillain! Meanwhile, Petey the Cat has been released from jail and starts a new life with Li'l Petey. But when Petey's own father arrives, Petey must face his past to understand the difference between being good and doing good. <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of being true to one's self.	
110	THE LITTLE MERMAID: AGAINST THE TIDE	1368077226	9781368077224	<b>An original novel written by <i>New York Times</i> best-selling author J. Elle inspired by Disney upcoming live action reimagining of <i>The Little Mermaid</i>.</b><br> <br> After the death of Ariel's mother, the queen of the sea, the seven daughters of King Triton have grown estranged at best. It's been years since Ariel's older sisters have visited home. But this year's Coral Moon is fast approaching, and it's a special one for Ariel. Finally fifteen, she will be dubbed the Protector of her very own ocean territory as is tradition, and her sisters have agreed to visit for the celebration.<br> <br> But the ceremony is halted when Mala, one of the most renowned daughters of Triton, is abducted. The only clue to where she might have been taken is a hastily scribbled seaweed note, which says, "What could have saved Mother could save me, too." To rescue Mala, Ariel must work together with her siblings, traveling to various seas, outsmarting dangerous ocean creatures, and delving into forbidden waters to find the truth of what happened to their mother. But as Ariel and her sisters begin uncovering new secrets about their family and their kingdom, Ariel will have to face the loss of a mother she never had a chance to know and discover what it means to be both a good sister and a strong leader.<br> <br> And the clock is ticking, because on the day of the festival, when the moon turns a true shade of coral, her sister will be lost, like her mother, forever.	
111	SILVER IN THE BONE	0593481658	9780593481653	<b><b>INSTANT #1 <i>NEW YORK TIMES</i> BESTSELLER • From the critically acclaimed author of <i>Lore</i> comes a stunning new Arthurian fantasy—the tale of a teenage girl who seeks her destiny in the cursed ruins of Avalon, driven by love, revenge, and pure adrenaline!</b><br><br>"<b>Simmering with magic, peril, romance, and heartbreak</b>."<b> </b></b>—Leigh Bardugo, #1 <i>New York Times</i> bestselling author of <i>Shadow and Bone</i><br><br>Born without a trace of magic, Tamsin Lark is no match for the sorceresses and Hollowers who populate the magical underground of Boston. But when the only parent she’s ever known disappears without so much as a goodbye, she has no choice but to join in their cutthroat pursuit of enchanted relics to keep herself—and her brother, Cabell—alive.<br><br>Ten years later, rumors are swirling that her guardian found a powerful ring from Arthurian legend just before he vanished. A run-in with her rival Emrys ignites Tamsin’s hope that the ring could free Cabell from a curse that threatens both of them. But they aren’t the only ones who covet the ring.<br><br>As word spreads, greedy Hollowers start circling, and many would kill to have it for themselves. While Emrys is the last person Tamsin would choose to partner with, she needs all the help she can get to edge out her competitors in the race for the ring. Together, they dive headfirst into a vipers’ nest of dark magic, exposing a deadly secret with the power to awaken ghosts of the past and shatter her last hope of saving her brother. . . .<br><i><br></i>	
112	LIGHTLARK	1419760866	9781419760860	<b>An instant #1 National Bestselle</b><b>r--so</b><b>on to be a major motion picture. #BookTok phenomenon and award-winning author Alex Aster delivers readers a masterfully written, utterly gripping YA fantasy novel </b> <p> Welcome to the Centennial. <p> Every 100 years, the island of Lightlark appears to host the Centennial, a deadly game that only the rulers of six realms are invited to play. The invitation is a summons--a call to embrace victory and ruin, baubles and blood. The Centennial offers the six rulers one final chance to break the curses that have plagued their realms for centuries. Each ruler has something to hide. Each realm's curse is uniquely wicked. To destroy the curses, one ruler must die. <p> Isla Crown is the young ruler of Wildling--a realm of temptresses cursed to kill anyone they fall in love with. They are feared and despised, and are counting on Isla to end their suffering by succeeding at the Centennial. <p> To survive, Isla must lie, cheat, and betray...even as love complicates everything. <p><b>Filled with secrets, deception, romance, and twists worthy of the darkest thrillers, <i>Lightlark </i>is a must-read for fans of legendary fantasy writers Marie Lu, Marissa Meyer, and Leigh Bardugo. </b>	
113	DARE TO LEAD	0399592520	9780399592522	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • Brené Brown has taught us what it means to dare greatly, rise strong, and brave the wilderness. Now, based on new research conducted with leaders, change makers, and culture shifters, she’s showing us how to put those ideas into practice so we can step up and lead.<br><br><b>Don’t miss the five-part HBO Max docuseries <i>Brené Brown: Atlas of the Heart</i>!</b><br><br>NAMED ONE OF THE BEST BOOKS OF THE YEAR BY </b><i><b>BLOOMBERG</b><br></i><br> Leadership is not about titles, status, and wielding power. A leader is anyone who takes responsibility for recognizing the potential in people and ideas, and has the courage to develop that potential.<br><br> When we dare to lead, we don’t pretend to have the right answers; we stay curious and ask the right questions. We don’t see power as finite and hoard it; we know that power becomes infinite when we share it with others. We don’t avoid difficult conversations and situations; we lean into vulnerability when it’s necessary to do good work.<br><br> But daring leadership in a culture defined by scarcity, fear, and uncertainty requires skill-building around traits that are deeply and uniquely human. The irony is that we’re choosing not to invest in developing the hearts and minds of leaders at the exact same time as we’re scrambling to figure out what we have to offer that machines and AI can’t do better and faster. What can <i>we</i> do better? Empathy, connection, and courage, to start.<br><br> Four-time #1 <i>New York Times</i> bestselling author Brené Brown has spent the past two decades studying the emotions and experiences that give meaning to our lives, and the past seven years working with transformative leaders and teams spanning the globe. She found that leaders in organizations ranging from small entrepreneurial startups and family-owned businesses to nonprofits, civic organizations, and Fortune 50 companies all ask the same question: <br><br> <b>How do you cultivate braver, more daring leaders, and how do you embed the value of courage in your culture? </b><br><br> In this new book, Brown uses research, stories, and examples to answer these questions in the no-BS<i> </i>style that millions of readers have come to expect and love.<br><br> Brown writes, “One of the most important findings of my career is that daring leadership is a collection of four skill sets that are 100 percent teachable, observable, and measurable. It’s learning and unlearning that requires brave work, tough conversations, and showing up with your whole heart. Easy? No. Because choosing courage over comfort is not always our default. Worth it? Always. We want to be brave with our lives and our work. It’s why we’re here.”<br><br>Whether you’ve read <i>Daring Greatly </i>and<i> Rising Strong</i> or you’re new to Brené Brown’s work, this book is for anyone who wants to step up and into brave leadership.	
114	EXTREME OWNERSHIP	1250183863	9781250183866	<p><b>From Jocko Wilnick, the <i>New York Times</i> best selling author of <i>Discipline Equals Freedom</i> and <i>Leadership Strategy and Tactics</i>, an updated edition of the blockbuster bestselling leadership book that took America and the world by storm, two U.S. Navy SEAL officers who led the most highly decorated special forces unit of the Iraq War demonstrate how to apply powerful leadership principles from the battlefield to business and life. Now with an excerpt from the authors' new book, THE DICHOTOMY OF LEADERSHIP. </b><br><br>Combat, the most intense and dynamic environment imaginable, teaches the toughest leadership lessons, with absolutely everything at stake. Jocko Willink and Leif Babin learned this reality first-hand on the most violent and dangerous battlefield in Iraq. As leaders of SEAL Team Three’s Task Unit Bruiser, their mission was one many thought impossible: help U.S. forces secure Ramadi, a violent, insurgent-held city deemed “all but lost.” In gripping, firsthand accounts of heroism, tragic loss, and hard-won victories, they learned that leadership—at every level—is the most important factor in whether a team succeeds or fails. <br><br>Willink and Babin returned home from deployment and instituted SEAL leadership training to pass on their harsh lessons of self-discipline, mental toughness and self-defense learned in combat to help forge the next generation of SEAL leaders. After leaving the SEAL Teams, they launched a company, Echelon Front, to teach those same leadership principles to leaders in businesses, companies, and organizations across the civilian sector. Since that time, they have trained countless leaders and worked with hundreds of companies in virtually every industry across the U.S. and internationally, teaching them how to develop their own high-performance teams and most effectively lead those teams to dominate their battlefields.<br><br>Since it’s release in October 2015, <i>Extreme Ownership</i> has revolutionized leadership development and set a new standard for literature on the subject. Required reading for many of the most successful organizations, it has become an integral part of the official leadership training programs for scores of business teams, military units, and first responders. Detailing the resilient mindset and total focus principles that enable SEAL units to accomplish the most difficult combat missions, Extreme Ownership demonstrates how to apply them to any team or organization, in any leadership environment. A compelling narrative with powerful instruction and direct application, <i>Extreme Ownership</i> challenges leaders everywhere to fulfill their ultimate purpose: lead and win.</p>	
115	PARIS	0063224623	9780063224629	<p>From the woman who is credited for launching what we know as the celebrity focused, "brand" driven, social media obsessed popular culture of today, comes an honest and surprising memoir that reckons with that truth, and shows that there is so much more to Paris Hilton than you might believe.</p> <p>I was born in New York City on February 17, 1981, three days after Valentine's Day. </p> <p>From the time I was a toddler, my brain skipped and flickered with the chemical imbalance of ADHD. Sometimes it was too much.</p> <p>I'm not bragging or complaining about it, just telling you: This is my brain. It has a lot to do with how this whole book thing is going to play out, because I love run-on sentences--and dashes. And sentence fragments. I'm probably going to jump around a lot while I tell the story.</p> <p>I came of age during the most turbulent pop culture period ever.</p> <p>The character I played--part Lucy, part Marilyn--was my steel-plated armor.</p> <p>People loved her. Or they loved to hate her, which was just as marketable. I leaned into that character, my ticket to financial freedom and a safe place to hide. I made sure I never had a quiet moment to figure out who I was without her. I was afraid of that moment because I didn't know what I'd find.</p> <p>I wrote this book in an effort to understand my place in a watershed moment: the technology renaissance, the age of influencers. I also wrote this book so that the world could know who I am today. I focused on key aspects of my life that led to what I am most proud of--how my power was taken away from me and how I took it back, how I built a thriving business, a marriage and a family.</p> <p>There are so many young women who need to hear this story. I don't want them to learn from my mistakes; I want them to stop hating themselves for their own mistakes. I want them to laugh and cry and embrace every aspect of who they are with fearlessness and pride. We all have our own brand of intelligence, and, girl, fuck fitting in.</p>	
116	TWENTY THOUSAND FLEAS UNDER THE SEA	1338801910	9781338801910	<b>DOG MAN IS BACK! The highly anticipated new graphic novel in the #1 worldwide bestselling series starring everyone's favorite canine superhero by award-winning author and illustrator Dav Pilkey!</b><p></p><p>Piggy has returned, and his newest plot is his most diabolical yet. WHAT other new villains are on the horizon? WHERE are they all coming from? And WHO will step forward to save the city when scoundrels sabotage our Supa Buddies?</p><p>With themes of friendship and doing good, <i>Dog Man: Twenty Thousand Fleas Under the Sea</i> is packed with action and hilarity. Featuring "Chomp-O-Rama," a brand-new song, a monstrous Mighty Mite -- and so much more than ever before! IT'S HEROIC, IT'S EPIC!</p><p>For more creative, heartfelt adventures, join Flippy and Li'l Petey in the <b>Cat Kid Comic Club</b> series. And don't forget the series that started it all: Captain Underpants! A new edition of <i>The Adventures of Captain Underpants</i> includes <b>a brand new Dog Man comic!</b> Look for <b>Dog Man with Love: The Official Coloring Book</b>, too!</p>	
117	COLLABORATIONS	1338846620	9781338846621	<b>The Cat Kid Comic Club learns to collaborate in this creative, funny, and insightful graphic novel by Dav Pilkey, the author and illustrator of Dog Man.</b><p></p><p>Excitement and imagination run wild as Naomi, Melvin, Poppy, Gilbert, Curly, and their siblings get back to making comics with originality and laughter. But wait -- have they cleaned their rooms yet?!</p><p>After their chores, the rambunctious group presents even more amazing mini-comics: a thrilling ride in "Chubbs McSpiderbutt," an action-packed romp in "Frogzilla," reflective haikus in "In the Autumn Pond," a candy-coated mystery in "Mallo Cop," and much, much more. By working together, the baby frogs discover that small things can have a huge impact.</p><p>In this innovative graphic novel series, award-winning author and illustrator Dav Pilkey employs a variety of techniques -- including origami, acrylic paints, colored pencils, photography, collage, gouache, watercolors, and more -- to capture the creative and joyful spirit of collaboration. The variety of art styles, paired with Pilkey's trademark storytelling and humor, inspires imagination and innovation for readers of all ages.</p>	
118	MOTHERING HEIGHTS	1338680455	9781338680454	Dog Man and Petey face their biggest challenges yet in the tenth Dog Man book from worldwide bestselling author and illustrator Dav Pilkey.<p></p><p>Dog Man is down on his luck, Petey confronts his not so purr-fect past, and Grampa is up to no good. The world is spinning out of control as new villains spill into town. Everything seems dark and full of despair. But hope is not lost. Can the incredible power of love save the day?</p><p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including love, empathy, kindness, persistence, and the importance of doing good.</p>	
119	MOON RISING	1338730894	9781338730890	<b>The graphic novel adaptations of the #1 New York Times bestselling Wings of Fire series continue to set the world on fire!</b><p></p><p>Peace has come to Pyrrhia... for now.</p><p></p><p>The war between the tribes is finally over, and now the dragonets of the prophecy have a plan for lasting peace: Jade Mountain Academy, a school that will gather dragonets from all the tribes and teach them to live together, perhaps even as friends.</p><p></p><p>Moonwatcher isn't sure how she feels about school, however. Hidden in the rainforest for most of her life, the young NightWing has an awful secret. She can read minds, and even see the future. Living in a cave with dozens of other dragons is noisy, exhausting--and dangerous.</p><p></p><p>In just a few days, Moon finds herself overwhelmed by her secret powers and bombarded by strange thoughts, including those of a mysterious dragon who might be a terrible enemy. And when someone starts attacking dragons within the academy, Moon has a choice to make: Stay hidden and safe? Or risk everything to save her new friends?</p><p></p><p></p><p>The #1 <i>New York Times</i> bestselling Wings of Fire series soars to new heights in the sixth graphic novel adaptation, with art by Mike Holmes.</p>	Illustrated by mike holmes
120	GRIME AND PUNISHMENT	1338535625	9781338535624	<b>The next great Dog Man adventure from the worldwide bestselling author and artist Dav Pilkey. You'll howl with laughter </b><br><br> The Supa Buddies bamboozled the baddies, but all's not right in the world. Dog Man has a new problem to pound, and he's going to need his entire pack to help him. Will he go barking up the wrong tree?<br><br> Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of doing good.	
121	SCHOOL TRIP	0062885537	9780062885531	<p>New York Times bestselling author Jerry Craft is back with the newest adventures of Jordan, Drew, Liam, and all the characters that fans first met in New Kid, winner of the Newbery Award and the Coretta Scott King Author Award! In this full-color contemporary graphic novel, the gang from Riverdale Academy Day is heading to Paris, for an international education like you've never seen before ...</p><p>Jordan, Drew, Liam, Maury, and their friends from Riverdale Academy Day School are heading out on a school trip to Paris. As an aspiring artist himself, Jordan can't wait to see all the amazing art in the famous City of Lights.</p><p>But when their trusted faculty guides are replaced at the last minute, the school trip takes an unexpected--and hilarious--turn. Especially when trying to find their way around a foreign city ends up being almost as tricky as navigating the same friendships, fears, and differences that they struggle with at home.</p><p>Will Jordan and his friends embrace being exposed to a new language, unfamiliar food, and a different culture? Or will they all end up feeling like the "new kid"?</p><p>Don't miss the two hilarious and powerful companion novels by Jerry Craft, New Kid and Class Act!</p>	
122	ONE PIECE, VOL. 102	1974736555	9781974736553	<b>Join Monkey D. Luffy and his swashbuckling crew in their search for the ultimate treasure, One Piece!</b><br><br>As a child, Monkey D. Luffy dreamed of becoming King of the Pirates. But his life changed when he accidentally gained the power to stretch like rubber...at the cost of never being able to swim again! Years later, Luffy sets off in search of the One Piece, said to be the greatest treasure in the world...<br><br>Luffy is back to face Kaido once again, but does he stand any more of a chance in this rematch against the strongest man alive? And on other parts of the island, Sanji and Zolo go up against Kaido’s strongest warriors. Both will need to raise their fighting skills in order to overcome these adversaries!	
125	MARY ANNE'S BAD LUCK MYSTERY	1338616102	9781338616101	<b>A brand-new Baby-sitters Club graphic novel adapted by newcomer Cynthia Yuan Cheng!</b><p></p><p>Mary Anne should never have thrown away that chain letter she got in the mail. Ever since she did, bad things have been happening to everyone in The Baby-sitters Club. With Halloween coming up, Mary Anne's even more worried -- what kind of spooky thing will happen next?</p><p>Then Mary Anne finds a new note in her mailbox: <i>Wear this bad-luck charm</i>, it says. <i>OR ELSE.</i> Mary Anne has to follow the note's instructions. But who sent the charm? And why did they send it to Mary Anne?</p><p>The BSC might never see an end to their bad luck if they don't solve this mystery soon!</p>	Illustrated by cynthia yuan cheng
126	TEENAGE MUTANT NINJA TURTLES: THE LAST RONIN	1684058414	9781684058419	<b>A <i>New York Times</i> Bestseller!Who is the Last Ronin? In a future, battle-ravaged New York City, a lone surviving Turtle embarks on a seemingly hopeless mission seeking justice for the family he lost. From legendary TMNT co-creators Kevin Eastman and Peter Laird, get ready for the final story of the Teenage Mutant Ninja Turtles three decades in the making!</b><br><br>What terrible events destroyed his family and left New York a crumbling, post-apocalyptic nightmare? All will be revealed in this climactic Turtle tale that sees longtime friends becoming enemies and new allies emerging in the most unexpected places. Can the surviving Turtle triumph?<br><br>Eastman and Laird are joined by writer <b>Tom Waltz</b>, who penned the first 100 issues of IDW's ongoing TMNT series, and artists <b>Esau & Isaac Escorza</b> (<i>Heavy Metal</i>) and <b>Ben Bishop</b> (<i>The Far Side of the Moon</i>) with an Introduction by filmmaker <b>Robert Rodriguez</b>!<br><br>Collects the complete five-issue miniseries in a new graphic novel, an adventure as fulfilling for longtime Turtles fans as it is accessible for readers just discovering the heroes in a half shell.	
127	FETCH-22	1338323210	9781338323214	<b>Li'l Petey gets caught in some family drama in the eighth Dog Man book from worldwide bestselling author and artist Dav Pilkey.</b><br></br>Petey the Cat is out of jail, and he has a brand-new lease on life. While Petey's reevaluated what matters most, Li'l Petey is struggling to find the good in the world. Can Petey and Dog Man stop fighting like cats and dogs long enough to put their paws together and work as a team? They need each other now more than ever -- Li'l Petey (and the world) is counting on them! <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of doing good.	
128	SPY X FAMILY, VOL. 9	1974736288	9781974736287	<b>An action-packed comedy about a fake family that includes a spy, an assassin and a telepath!</b><br><br>Master spy Twilight is unparalleled when it comes to going undercover on dangerous missions for the betterment of the world. But when he receives the ultimate assignment—to get married and have a kid—he may finally be in over his head!<br><br>Yor’s on assignment and finds herself up against a gang of assassins on board a luxury cruiser. Meanwhile, Loid and Anya each discover that bombs have been planted throughout the ship! Will their best efforts be enough to save the vessel?	
129	LORD OF THE FLEAS	1338741071	9781338741070	<b>The Supa Buddies convene to deal with some new villains in the fifth Dog Man book from worldwide bestselling author and artist Dav Pilkey.</b><br></br>When a fresh bunch of baddies bust up the town, Dog Man is called into action -- and this time he isn't alone. With a cute kitten and a remarkable robot by his side, our heroes must save the day by joining forces with an unlikely ally: Petey, the World's Most Evil Cat. But can the villainous Petey avoid vengeance and venture into virtue? <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of being true to one's self.	
130	SPY CAMP	1534499377	9781534499379	<b>The second book in the <i>New York Times</i> bestselling Spy School series continues in graphic novel form as aspiring spy Ben Ripley must spend his summer in top-secret training—and is thrown back into danger.</b><br><br>Ben Ripley is a middle schooler whose school is not exactly average—he’s spent the last year training to be a top-level spy and dodging all sorts of associated danger. So now that summer’s finally here, Ben would like to have some fun and relax. But that’s not going to happen during required spy survival training at a rustic wilderness camp, where SPYDER, an enemy spy organization, has infiltrated the spies’ ranks. Can Ben root out the enemy before it takes him out—for good?	Illustrated by anjan sarkar
131	THE RUSSIAN	1538703580	9781538703588	<b>When a serial killer crashes Detective Michael Bennett's wedding, he and his new partner uncover a gruesome string of cold-case homicides across the country.<br> <br> ​</b><br> <br> Weeks before NYPD Detective Michael Bennett is to marry his longtime love, Mary Catherine, an assassin announces his presence in the city with a string of grisly murders. Each victim is a young woman. And each has been killed in a manner as precise as it was gruesome.<br> <br> <br> <br> Tasked with working alongside the FBI, Bennett and his gung-ho new partner uncover multiple cold-case homicides across the country that fit the same distinctive pattern--proving the perpetrator they seek is as experienced at ending lives as he is at evading detection.<br> <br> <br> <br> Bennett promises Mary Catherine that the case won't affect their upcoming wedding. But as Bennett prepares to make a lifetime commitment, the killer has a lethal vow of his own to fulfill.	
138	TOM CLANCY: ZERO HOUR	0593422740	9780593422748	<b><b>Jack Ryan, Jr. is the one man who can prevent a second Korean War in the latest thrilling entry in the #1 <i>New York Times</i> bestselling series.</b></b><br><br>When the leader of North Korea is catastrophically injured, his incapacitation inadvertently triggers a “dead-man’s switch,” activating an army of sleeper agents in South Korea and precipitating a struggle for succession. <br> <br>Jack Ryan, Jr. is in Seoul to interview a potential addition to the Campus.  But his benign trip takes a deadly turn when a wave of violence perpetrated by North Korean operatives grips South Korea’s capital.  A mysterious voice from North Korea offers Jack a way to stop the peninsula’s rush to war, but her price may be more than he can afford to pay.	
139	SAVE IT FOR SUNDAY	078604957X	9780786049578	<b><i>From the greatest western writers of the 21st century, the second adventure featuring circuit rider Taylor Callahan. a mysterious man in black who rides from town to town with a bible in hand and guns in his holsters, delivering the word of God and hard-fought justice…</i></b><br><br><b>From Confederate marauder to rebel gunfighter to repentant preacherman, circuit rider Taylor Callahan’s road to perdition has been a hellish ride. Sinners beware.</b><br><b> </b><br>After riding with Missouri bushwhackers, Taylor Callahan vowed to never take another life. He’s making good on it in Peaceful Valley. By day, swamping a saloon. By night, preaching the Good Book. But this little settlement is about to become anything but peaceable. When the marshal takes a bullet in a sheepman-cattleman skirmish he pins a badge on Taylor leaving the circuit rider open to whole new world of hell . . .<b> </b><br><b> </b><br>A railroad engineer building a line from Laramie to Denver is cutting across Arapaho land starting a war on Peace Treaty Peak. If that’s not enough to set the county on fire, Taylor’s trigger-happy past comes calling. The revenge-seeking Harris boys are hot on his tail. With the marshal down, Peaceful Valley is ripe for the taking—and blasting Taylor to kingdom come is part of the deal. If keeping the peace means breaking Taylor’s vow so be it. He’s looking forward to strapping on his Colt .45 again. That’s the gospel truth.	
132	SUSPECTS	1984821709	9781984821706	<b><b><i>NEW YORK TIMES </i>BESTSELLER • A dedicated CIA agent becomes an unexpected ally to a woman haunted by the kidnapping of her family, in this thrilling novel from #1 <i>New York Times</i> bestselling author Danielle Steel.</b></b><br><br>Theodora Morgan is fashion royalty. Founder of a wildly popular online shopping service, she is one of the most successful businesswomen in the world, although she prefers to keep a low profile, especially over the last months. It was a year ago when the unthinkable struck her family, and her husband, industry mogul Matthieu Pasquier, and their son were kidnapped and held for ransom—a nightmare that ended in tragedy.<br> <br>The case has gone cold, despite evidence linking the crime to Matthieu’s Russian competitors. Theo has reluctantly gone back to work running her company. On the flight to a launch party for one of her highly anticipated pop-up shops in New York City, she crosses paths with high-society networker Pierre de Vaumont. Theo politely invites him to her event—unaware that Pierre has been flagged by the CIA.<br> <br>Senior supervising CIA operative Mike Andrews investigates Pierre’s suspicious Russian contacts and clears him to enter the country, but when he realizes that Theodora Morgan is on the same flight, he becomes concerned for her safety. Posing as a lawyer, Mike begins a covert mission—starting with Theo’s opening party. When Mike and Theo meet, their connection is instant, but Theo is completely unaware of Mike’s true objective or identity… or that the life she is rebuilding is in grave danger.	
133	TWO ALONE	0778334449	9780778334446	The only way to stay alive is to stick together.<br> <br> When their plane crashes in the remote reaches of the Northwest Territories, confident businesswoman Rusty Carlson finds herself hurt and alone with a man she can't stand to be around. Vietnam vet Cooper Landry holds a deep-rooted grudge against beautiful women, but he's survived far worse and he'll be damned if he lets them both die in the wilderness.<br> <br> The ex-soldier's training has prepared him with the skills to defend against the predators in the dense woods--both animal and human--but that's not all that awaits the couple. What Rusty and Cooper couldn't have expected is their shared desire for more than just survival...<br> <br>	
134	LEGACY	1250775000	9781250775009	<p><b>#1 <i>New York Times</i> bestselling author Nora Roberts presents <i>Legacy</i>, a new novel of a mother and a daughter, of ambition and romance, and of a traumatic past reawakened by a terrifying threat...</b><br><br>Adrian Rizzo was seven when she met her father for the first time. That was the day he nearly killed her—before her mother, Lina, stepped in.<br><br>Soon after, Adrian was dropped off at her grandparents’ house in Maryland, where she spent a long summer drinking lemonade, playing with dogs, making a new best friend—and developing the stirrings of a crush on her friend’s ten-year-old brother. Lina, meanwhile, traveled the country promoting her fitness brand and turning it into a billion-dollar business. There was no point in dwelling on the past.<br><br>A decade later, Adrian has created her own line of yoga and workout videos, following in Lina’s footsteps but intent on maintaining creative control. And she’s just as cool-headed and ambitious as her mother. They aren’t close, but they’re cordial—as long as neither crosses the other.<br><br>But while Lina dismisses the death threats that Adrian starts getting as a routine part of her daughter’s growing celebrity, Adrian can’t help but find the vicious rhymes unsettling. Year after year, they keep arriving—the postmarks changing, but the menacing tone the same. They continue after she returns to Maryland and becomes reacquainted with Raylan, her childhood crush, all grown up and as gorgeously green-eyed as ever. Sometimes it even seems like the terrifying messages are indeed routine, like nothing will come of them. Until the murders start, and the escalation begins...</p>	
135	DEATH OF THE BLACK WIDOW	1538753081	9781538753088	<b>She destroys the men she loves--and escapes every time. The most dangerous killer James Patterson has ever created is also his most seductive.</b><br> <br> <br> <br> On his first night with Detroit PD, Officer Walter O'Brien is called to a murder scene. A terrified twenty-year-old has bludgeoned her kidnapper with skill that shocks even O'Brien's veteran partner. The young woman is also a brilliant escape artist. Her bold flight from police custody makes the case impossible to solve--and, for Walter, even more impossible to forget.<br> <br> <br> <br> By the time Walter's promoted to detective, his fascination with the missing, gray-eyed woman is approaching obsession. And when Walter discovers that he's not alone in his search, one truth is certain. This deadly string of secrets didn't begin in his home city--but he's going to make sure it ends there. <br> <br>	
136	MERCY	1538719711	9781538719718	<b>FBI Agent Atlee Pine's harrowing search for her long-lost sister Mercy reaches a boiling point in this breakneck thriller from #1 <i>New York Times</i> bestselling author David Baldacci. </b><br> <br> <br> <br> For her entire life, FBI agent Atlee Pine has been searching for her twin sister, Mercy, who was abducted at the age of six and never seen again. Mercy's disappearance left behind a damaged family that later shattered beyond repair when Atlee's parents inexplicably abandoned her.<br> <br> <br> <br> Now, after a perilous investigation that nearly proved fatal, Atlee has finally discovered not only the reason behind her parents' abandonment and Mercy's kidnapping, but also the most promising breakthrough yet: proof that Mercy survived her abduction and then escaped her captors many years ago. <br> <br> <br> <br> Though Atlee is tantalizingly close to her family at last, the final leg of her long road to Mercy will be the most treacherous yet. Mercy left at least one dead body behind before fleeing her captors years before. Atlee has no idea if her sister is still alive, and if so, how she has been surviving all this time. When the truth is finally revealed, Atlee Pine will face the greatest danger yet, and it may well cost her everything.	
137	THE JENSENS OF COLORADO	0786050136	9780786050130	<b>THE FIRST FAMILY OF THE AMERICAN FRONTIER<br> <br><i>The national bestselling novels of William W. and J.A. Johnstone bring the American West to crackling life. Now together in one omnibus for the first time, three epic sagas of the fearless—and ever-growing—Jensen clan—pioneers willing to fight for justice.</i></b><br><br><b>THOSE JENSEN BOYS</b><br>Ace and Chance are as reckless and wild as the frontier itself. Their father is Luke Jensen, thought killed in the Civil War. Their uncle Smoke is one of the fiercest gunfighters in the West. It’s no surprise the twins have a knack for taking risks—and blasting their way out of them.<br><br><b>THE JENSEN BRAND</b><br>Smoke is injured swapping bullets with cow thieves on the Sugarloaf Ranch and Sally puts out a call for help to the rest of the Jensen clan. Just back from studying in Europe, Denise Jensen can ride like a man, shoot like her daddy, and face down the deadliest outlaws like nobody’s business.<br><br><b>HEART OF THE MOUNTAIN MAN </b><br>Smoke has no choice but to come down off the mountain and go head-to-head with outlaw Big Jim Slaughter to save his friend Monte Carson. A fiery clash of courage, fury, and guns is on the docket, and only one man will be left standing after the dust settles.	
140	THE LAST HOUSE GUEST	1668012790	9781668012796	<b>**A Reese Witherspoon x Hello Sunshine Book Club Pick and <i>New York Times </i>bestseller<i>**</i></b><br> <br><b>A year after a summer guest dies under suspicious circumstances, her best friend lives under a cloud of grief and suspicion in this “fast-paced and gripping” (<i>People</i>) thriller filled with “dizzying plot twists and multiple surprise endings” (<i>The New York Times Book Review).</i></b><br><br>Littleport, Maine, has always felt like two separate towns: an ideal vacation enclave for the wealthy, whose summer homes line the coastline; and a simple harbor community for the year-round residents whose livelihoods rely on service to the visitors.<br> <br>Typically, fierce friendships never develop between a local and a summer girl—but that’s just what happens with visitor Sadie Loman and Littleport resident Avery Greer. Each summer for almost a decade, the girls are inseparable—until Sadie is found dead. While the police rule the death a suicide, Avery can’t help but feel there are those in the community, including a local detective and Sadie’s brother, Parker, who blame her. Someone knows more than they’re saying, and Avery is intent on clearing her name, before the facts get twisted against her.<br> <br>“A riveting read…from master of suspense, Megan Miranda,” (Mary Kubica, <i>New York Times </i>bestselling author of <i>The Good Girl</i>) <i>The Last House Guest</i> is a clever, twisty mystery that brilliantly explores the elusive nature of memory and the complexities of female friendships.	
141	ONE NIGHT	006108185X	9780061081859	<p>From #1 <i>New York Times</i> bestselling author Debbie Macomber comes a remarkable story of dreams awakened and lives transformed in . . . One Night </p> <p>Carrie Jamison has the success part of "having it all" down pat—but "love/marriage/family" seem just out of reach. Still, she enjoys the admiration of everyone at KUTE radio . . . well, <i>almost</i> everyone. Serious, straightlaced newscaster Kyle Harris disapproves of Carrie, which leads to tension, confrontation . . . and then, inexplicably, to one extraordinary night! </p> <p>Now Kyle's determined to make an honest woman out of her! But though her dreams seem merely an "I do" away, Carrie needs to <i>really</i> know if love or guilt is inflaming Kyle's ardor. Because if it isn't true love, this happily-ever-after is never going to happen. </p>	
142	GETTING EVEN	1420155547	9781420155549	<b>Who doesn’t fantasize about a little payback? Revenge is a timeless, all-too-human desire, and it’s a common thread in <i>Yesterday’s Lies </i>and <i>Zachary’s Law – </i>two classic, fan-favorite novels by #1 <i>New York Times</i> bestselling author Lisa Jackson that are now available in one thrilling romantic suspense omnibus of revenge, obsession, and deception…</b><br><br><i>“Trask McFadden is back.”</i> Those are words that Tory has been waiting to hear, half in dread, half with longing. It’s been five years since Trask landed her father behind bars for horse swindling, using things she’d told him in confidence. Her father died there, but now Trask insists he has information that could help prove who was really responsible for the crime, not to mention his own brother’s death. Trask needs <i>her</i> help. But he won’t get it, not after destroying her family, her ranch, and the love they shared.<br><br>Lauren Regis’s ex-husband has kidnapped her children. There’s nothing she won’t do to get them back, including hiring Zachary Winters. The unconventional attorney has made a name for himself by locating people—especially those who don’t want to be found. But he’s got a darker reputation too, and there are rumors swirling about the fate of his ex-wife. How much is Lauren willing to trust him—or to lose?	
143	SOMEDAY WITH YOU	1335452796	9781335452795	Two classic stories about getting a second chance to embrace life and discover love!<br> <br> Cordina's Crown Jewel<br> <br> On the run from her palace, Her Royal Highness Camilla de Cordina wants to be just plain Camilla MacGee, even if it's only for a few weeks. Working in rural Vermont for the handsome yet grouchy archaeologist Delaney Caine is the perfect cover. But Camilla's irritation with the man soon turns into desire, and eventually the royal runaway knows she'll have to confess her secret...<br> <br> Unfinished Business<br> <br> Concert pianist Vanessa Sexton has finally returned to her small Maryland hometown after having her heart shattered by her high school sweetheart twelve years ago. Once a reckless boy, Brady Tucker has now become a solid, dependable man. Still, he stood her up on the most important night of her life--can she ever trust him again?	
144	READY FOR MARRIAGE	1335498419	9781335498410	BESTSELLING AUTHOR COLLECTION<br> Reader-favorite romances in collectible volumes from our bestselling authors.<br> <br> Ready for Marriage by #1 New York Times bestselling author Debbie Macomber Three years ago, Mary Jo Summerhill fell completely in love with Evan Dryden. But his family said she wasn't the "right kind of wife" for Evan. Mary Jo agreed--she didn't belong in his world. So she lied and broke his heart.<br> <br> But now Mary Jo's parents are facing legal trouble, and she needs Evan's professional advice. Meanwhile, Evan wants answers to all the questions he's had for the past three years. Do they have a second chance?<br> <br> FREE BONUS STORY INCLUDED IN THIS VOLUME!<br> <br> A Family for Easter by New York Times bestselling author Lee Tobin McClain<br> <br> When wealthy single mom Fiona Farmingham rents her carriage house to widowed Eduardo Delgado, it's purely in friendship. But with half a dozen little matchmakers involved, can they find the courage to reach for happiness once more?	
145	THE JUDGE'S LIST	0593157834	9780593157831	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • Investigator Lacy Stoltz follows the trail of a serial killer, and closes in on a shocking suspect—a sitting judge—in “one of the best crime reads of the year.… Bristling with high-tech detail and shivering with suspense…. Worth staying up all night to finish” (<i>Wall Street Journal</i>).</b><br><br>In <i>The Whistler</i>, Lacy Stoltz investigated a corrupt judge who was taking millions in bribes from a crime syndicate. She put the criminals away, but only after being attacked and nearly killed. Three years later, and approaching forty, she is tired of her work for the Florida Board on Judicial Conduct and ready for a change.<br><br>Then she meets a mysterious woman who is so frightened she uses a number of aliases. Jeri Crosby’s father was murdered twenty years earlier in a case that remains unsolved and that has grown stone cold. But Jeri has a suspect whom she has become obsessed with and has stalked for two decades. Along the way, she has discovered other victims.<br><br>Suspicions are easy enough, but proof seems impossible. The man is brilliant, patient, and always one step ahead of law enforcement. He is the most cunning of all serial killers. He knows forensics, police procedure, and most important: he knows the law.<br><br>He is a judge, in Florida—under Lacy’s jurisdiction.<br><br>He has a list, with the names of his victims and targets, all unsuspecting people unlucky enough to have crossed his path and wronged him in some way. How can Lacy pursue him, without becoming the next name on his list?<br><br>The Judge’s List is by any measure John Grisham’s most surprising, chilling novel yet.<br><b><i> </i></b><br><b><i>Don’t miss John Grisham’s new book, </i>THE EXCHANGE: AFTER<i> THE FIRM, coming soon!</i></b>	
146	THE ONE AND ONLY IVAN	0061992275	9780061992278	<p>Soon to be a major motion picture!</p><p>Winner of the Newbery Medal and a #1 New York Times bestseller</p><p>This unforgettable novel from renowned author Katherine Applegate celebrates the transformative power of unexpected friendship. Inspired by the true story of a captive gorilla known as Ivan, this illustrated book is told from the point of view of Ivan himself. </p><p>Having spent twenty-seven years behind the glass walls of his enclosure in a shopping mall, Ivan has grown accustomed to humans watching him. He hardly ever thinks about his life in the jungle. Instead, Ivan occupies himself with television, his friends Stella and Bob, and painting. But when he meets Ruby, a baby elephant taken from the wild, he is forced to see their home, and his art, through new eyes.</p><p>In the tradition of timeless stories like Charlotte's Web and Stuart Little, Katherine Applegate blends humor and poignancy to create an unforgettable story of friendship, art, and hope.</p><p>The One and Only Ivan features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p><p>Plus don't miss Katherine Applegate's Endling series!</p>	Illustrated by patricia castelao
147	THE WILD ROBOT	0316382000	9780316382007	<b><i>Wall-E</i> meets <i>Hatchet</i> in this <i>New York Times </i>bestselling illustrated middle grade novel from Caldecott Honor winner Peter Brown</b><i><b><br></b></i><i>Can a robot survive in the wilderness?</i><br> When robot Roz opens her eyes for the first time, she discovers that she is all alone on a remote, wild island. She has no idea how she got there or what her purpose is--but she knows she needs to survive. After battling a violent storm and escaping a vicious bear attack, she realizes that her only hope for survival is to adapt to her surroundings and learn from the island's unwelcoming animal inhabitants. <br>As Roz slowly befriends the animals, the island starts to feel like home--until, one day the robot's mysterious past comes back to haunt her.<br>From bestselling and award-winning author and illustrator Peter Brown comes a heartwarming and action-packed novel about what happens when nature and technology collide.<br>	
148	WISH	1250144051	9781250144058	<p><b>Don't miss Barbara O'Connor's other middle-grade work—like <i>Wonderland; How to Steal a Dog; Greetings from Nowhere; Fame and Glory in Freedom, Georgia; The Fantastic Secret of Owen Jester; </i>and more!</b><br><br><i>A touching, </i>New York Times<i>–bestselling story about a girl and her dog, perfect for young animal lovers.</i><br><br>Eleven-year-old Charlie Reese has been making the same secret wish every day since fourth grade. She even has a list of all the ways there are to make the wish, such as cutting off the pointed end of a slice of pie and wishing on it as she takes the last bite. But when she is sent to the Blue Ridge Mountains of North Carolina to live with family she barely knows, it seems unlikely that her wish will ever come true. That is until she meets <br>Wishbone, a skinny stray dog who captures her heart, and Howard, a neighbor boy who proves surprising in lots of ways. Suddenly Charlie is in serious danger of discovering that what she thought she wanted may not be what she needs at all. <br><br>From award-winning author Barbara O'Connor comes a middle-grade novel about a girl who, with the help of a true-blue friend, a big-hearted aunt and uncle, and the dog of her dreams, unexpectedly learns the true meaning of family in the least likely of places.<br><br>This title has Common Core connections.</p>	
149	A LONG WALK TO WATER	0547577311	9780547577319		
150	RESTART	1338053809	9781338053807	<b>#1 <i>New York Times</i> bestselling author Gordon Korman harkens back to his <i>No More Dead Dogs</i> days in this new stand-alone that takes a more serious tone than ever before.</b><br></br>Chase's memory just went out the window. <p>Chase doesn't remember falling off the roof. He doesn't remember hitting his head. He doesn't, in fact, remember <i>anything</i>. He wakes up in a hospital room and suddenly has to learn his whole life all over again . . . starting with his own name. <p>He knows he's Chase. But who <i>is</i> Chase? When he gets back to school, he sees that different kids have very different reactions to his return. <p>Some kids treat him like a hero. Some kids are clearly afraid of him. <p>One girl in particular is so angry with him that she pours her frozen yogurt on his head the first chance she gets. <p>Pretty soon, it's not only a question of who Chase is--it's a question of who he <i>was</i> . . . and who he's going to be. <p>From the #1 bestselling author of <i>Swindle</i> and <i>Slacker</i>, <i>Restart</i> is the spectacular story of a kid with a messy past who has to figure out what it means to get a clean start.	
151	THE ONE AND ONLY BOB	0062991329	9780062991324	<p>A #1 New York Times bestseller and a #1 Indie bestseller!</p> <p>"Good dog Bob. Great to have a best friend."--Danny DeVito</p> <p>Return to the unforgettable world of the Newbery Medal-winning and #1 New York Times bestselling novel The One and Only Ivan in this incredible sequel, starring Ivan's friend Bob! Catch up with these beloved friends before you see the star-studded film adaptation of The One and Only Ivan, now available on Disney+!</p> <p>Bob sets out on a dangerous journey in search of his long-lost sister with the help of his two best friends, Ivan and Ruby. As a hurricane approaches and time is running out, Bob finds courage he never knew he had and learns the true meaning of friendship and family.</p> <p>Bob, Ivan, and Ruby have touched the hearts of millions of readers, and their story isn't over yet. Catch up with these beloved friends before the star-studded film adaptation of The One and Only Ivan hits theaters in August 2020!</p> <p>One and Only Bob is an instant #1 New York Times bestseller, embraced by new and old fans of Katherine Applegate's beloved One and Only Ivan. Great for summer reading or anytime! A Today show pick for "25 children's books your kids and teens won't be able to put down this summer!"</p> <p>In the tradition of timeless stories like Charlotte's Web and Stuart Little, Katherine Applegate blends humor and poignancy to create an unforgettable story of friendship, family, and hope.</p> <p>The One and Only Bob features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p> <p>This acclaimed middle grade novel is an excellent choice for tween readers in grades 5 to 8, for independent reading, homeschooling, and sharing in the classroom.</p>	Illustrated by patricia castelao
152	FISH IN A TREE	0142426423	9780142426425	<b>"Fans of R.J. Palacio’s <i>Wonder</i> will appreciate this feel-good story of friendship and unconventional smarts.” —<i>Kirkus Reviews</i></b><br><br>Ally has been smart enough to fool a lot of smart people. Every time she lands in a new school, she is able to hide her inability to read by creating clever yet disruptive distractions.  She is afraid to ask for help; after all, how can you cure dumb? However, her newest teacher Mr. Daniels sees the bright, creative kid underneath the trouble maker. With his help, Ally learns not to be so hard on herself and that dyslexia is nothing to be ashamed of. As her confidence grows, Ally feels free to be herself and the world starts opening up with possibilities. She discovers that there’s a lot more to her—and to everyone—than a label, and that great minds don’t always think alike.<br><br>The author of the beloved <i>One for the Murphys</i> gives readers an emotionally-charged, uplifting novel that will speak to anyone who’s ever thought there was something wrong with them because they didn’t fit in. This paperback edition includes The Sketchbook of Impossible Things and discussion questions.<br><br><b>A <i>New York Times</i> Bestseller! </b><br><br>* “Unforgettable and uplifting.”<b>—<i>School Library Connection</i>, <b>starred review</b><br><br></b>* "Offering hope to those who struggle academically and demonstrating that a disability does not equal stupidity, this is as unique as its heroine.”<b>—<i>Booklist</i>, <b>starred review</b><br><br></b>* “Mullaly Hunt again paints a nuanced portrayal of a sensitive, smart girl struggling with circumstances beyond her control." <b>—<i>School Library Journal</i>, <b>starred review</b> </b>	
153	A WOLF CALLED WANDER	006289594X	9780062895943	<p>A New York Times bestseller! "Don't miss this dazzling tour de force."--Katherine Applegate, Newbery Medal winning author of The One and Only Ivan</p><p>This gripping novel about survival and family is based on the real story of one wolf's incredible journey to find a safe place to call home. Illustrated throughout, this irresistible tale by award-winning author Rosanne Parry is for fans of Sara Pennypacker's Pax and Katherine Applegate's The One and Only Ivan. </p><p>Swift, a young wolf cub, lives with his pack in the mountains learning to hunt, competing with his brothers and sisters for hierarchy, and watching over a new litter of cubs. Then a rival pack attacks, and Swift and his family scatter.</p><p>Alone and scared, Swift must flee and find a new home. His journey takes him a remarkable one thousand miles across the Pacific Northwest. The trip is full of peril, and Swift encounters forest fires, hunters, highways, and hunger before he finds his new home. </p><p>Inspired by the extraordinary true story of a wolf named OR-7 (or Journey), this irresistible tale of survival invites readers to experience and imagine what it would be like to be one of the most misunderstood animals on earth. This gripping and appealing novel about family, courage, loyalty, and the natural world is for fans of Fred Gipson's Old Yeller and Katherine Applegate's Endling. </p><p>Includes black-and-white illustrations throughout and a map as well as information about the real wolf who inspired the novel.</p><p>Plus don't miss Rosanne Parry's stand-alone companion novel, A Whale of the Wild.</p>	Illustrated by mónica armiño
154	OUT OF MY MIND	1416971718	9781416971719	<b>A <i>New York Times</i> bestseller for three years and counting!</b><br> <br><b>“A gutsy, candid, and compelling story. It speaks volumes.” —<i>School Library Journal </i>(starred review)</b><br> <b>“Unflinching and realistic.” —<i>Kirkus</i><i> </i><i>Reviews</i> (starred review)</b><br> <br><b>From award-winning author Sharon Draper comes a story that will forever change how we all look at anyone with a disability, perfect for fans of RJ Palacio’s <i>Wonder</i>.</b><br><br>Eleven-year-old Melody is not like most people. She can’t walk. She can’t talk. She can’t write. All because she has cerebral palsy. But she also has a photographic memory; she can remember every detail of everything she has ever experienced. She’s the smartest kid in her whole school, but NO ONE knows it. Most people—her teachers, her doctors, her classmates—dismiss her as mentally challenged because she can’t tell them otherwise. But Melody refuses to be defined by her disability. And she’s determined to let everyone know it…somehow.	
155	WHEN YOU TRAP A TIGER	1524715735	9781524715731	<b>WINNER OF THE NEWBERY MEDAL • WINNER OF THE ASIAN/PACIFIC AMERICAN AWARD FOR CHILDREN'S LITERATURE • #1 <i>NEW YORK TIMES</i> BESTSELLER<br><br>Would you make a deal with a magical tiger? This uplifting story brings Korean folklore to life as a girl goes on a quest to unlock the power of stories and save her grandmother.</b><br><br><i>Some stories refuse to stay bottled up...</i><br><br>When Lily and her family move in with her sick grandmother, a magical tiger straight out of her halmoni's Korean folktales arrives, prompting Lily to unravel a secret family history. Long, long ago, Halmoni stole something from the tigers. Now they want it back. And when one of the tigers approaches Lily with a deal--return what her grandmother stole in exchange for Halmoni's health--Lily is tempted to agree. But deals with tigers are never what they seem! With the help of her sister and her new friend Ricky, Lily must find her voice...and the courage to face a tiger.<br><br>Tae Keller, the award-winning author of <i>The Science of Breakable Things</i>, shares a sparkling tale about the power of stories and the magic of family. Think <i>Walk Two Moons </i>meets <i>Where the Mountain Meets the Moon</i>!<br><br>"If stories were written in the stars ... this wondrous tale would be one of the brightest." <i>--Booklist</i>, Starred Review	
156	IF HE HAD BEEN WITH ME	1728205484	9781728205489	<p>A New York Times Bestseller</p><p>*A BookTok Viral Sensation* </p><p>An achingly authentic and raw portrait of love, regret, and the life-altering impact of the relationships we hold closest to us, this YA romance bestseller is perfect for fans of Colleen Hoover, Jenny Han, and You've Reached Sam. </p><p>If he had been with me, everything would have been different...</p><p>Autumn and Finn used to be inseparable. But then something changed. Or they changed. Now, they do their best to ignore each other.</p><p>Autumn has her boyfriend Jamie, and her close-knit group of friends. And Finn has become that boy at school, the one everyone wants to be around.</p><p>That still doesn't stop the way Autumn feels every time she and Finn cross paths, and the growing, nagging thought that maybe things could have been different. Maybe they should be together.</p><p>But come August, things will change forever. And as time passes, Autumn will be forced to confront how else life might have been different if they had never parted ways...</p><p>Captivating and heartbreaking, If He Had Been with Me is perfect for readers looking for: </p><ul><li>Contemporary teen romance books</li><li>Unputdownable & bingeworthy novels</li><li>Complex emotional YA stories</li><li>TikTok Books</li><li>Jenny Han meets Dear Even Hanson</li><li>Colleen Hover fans</li></ul>	
157	GIRL IN PIECES	1101934743	9781101934746	<b><b>#1 <i>NEW YORK TIMES</i> BESTSELLER</b><br><br></b>"<b>A haunting, beautiful, and necessary book.</b>"<i>—</i>Nicola Yoon<i>, #1 <i>New York Times</i></i> bestselling author of <i><i>Everything, Everything<br></i></i> <br>Charlotte Davis is in pieces. At seventeen she’s already lost more than most people do in a lifetime. But she’s learned how to forget. The broken glass washes away the sorrow until there is nothing but calm. You don’t have to think about your father and the river. Your best friend, who is gone forever. Or your mother, who has nothing left to give you. <br><br>Every new scar hardens Charlie’s heart just a little more, yet it still hurts so much. It hurts enough to not care anymore, which is sometimes what has to happen before you can find your way back from the edge. <br><br>A deeply moving portrait of a girl in a world that owes her nothing, and has taken so much, and the journey she undergoes to put herself back together. Kathleen Glasgow's debut is heartbreakingly real and unflinchingly honest. It’s a story you won’t be able to look away from.<i><i><br></i></i> <br>And don’t miss Kathleen Glasgow's novels <b><i>You’d Be Home Now </i></b>and <b><i>How to Make Friends with the Dark</i></b>, both raw and powerful stories of life.	
158	BETTER THAN THE MOVIES	1534467637	9781534467637	<b>A <i>USA TODAY</i> and <i>New York Times</i> bestseller</b><br> <br><b>Perfect for fans of Kasie West and Jenn Bennett, this “sweet and funny” (Kerry Winfrey, author of <i>Waiting for Tom Hanks</i>) teen rom-com follows a hopelessly romantic teen girl and her cute yet obnoxious neighbor as they scheme to get her noticed by her untouchable crush.</b><br><br>Perpetual daydreamer Liz Buxbaum gave her heart to Michael a long time ago. But her cool, aloof forever crush never really saw her before he moved away. Now that he’s back in town, Liz will do whatever it takes to get on his radar—and maybe snag him as a prom date—even befriend Wes Bennet.<br> <br>The annoyingly attractive next-door neighbor might seem like a prime candidate for romantic comedy fantasies, but Wes has only been a pain in Liz’s butt since they were kids. Pranks involving frogs and decapitated lawn gnomes do not a potential boyfriend make. Yet, somehow, Wes and Michael are hitting it off, which means Wes is Liz’s in.<br> <br>But as Liz and Wes scheme to get Liz noticed by Michael so she can have her magical prom moment, she’s shocked to discover that she likes being around Wes. And as they continue to grow closer, she must reexamine everything she thought she knew about love—and rethink her own ideas of what Happily Ever After should look like.	
159	THE WAY I USED TO BE	1481449362	9781481449366	<b><i>New York Times </i>bestseller! In the tradition of <i>Speak, </i>Amber Smith's extraordinary debut novel “</b><b>is a heart-twisting, but ultimately hopeful, exploration of how pain can lead to strength” (<i>The Boston Globe</i>).</b><br><br>Eden was always good at being good. Starting high school didn’t change who she was. But the night her brother’s best friend rapes her, Eden’s world capsizes.<br> <br>What was once simple, is now complex. What Eden once loved—who she once loved—she now hates. What she thought she knew to be true, is now lies. Nothing makes sense anymore, and she knows she’s supposed to tell someone what happened but she can’t. So she buries it instead. And she buries the way she used to be.<br> <br>Told in four parts—freshman, sophomore, junior, and senior year—this provocative debut reveals the deep cuts of trauma. But it also demonstrates one young woman’s strength as she navigates the disappointment and unbearable pains of adolescence, of first love and first heartbreak, of friendships broken and rebuilt, all while learning to embrace the power of survival she never knew she had hidden within her heart.	
160	ONE OF US IS LYING	1524714755	9781524714758	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • NAMED ONE OF THE TEN BEST BOOKS OF THE YEAR BY <i>ENTERTAINMENT WEEKLY • BUZZFEED • POPCRUSH</i></b><br><b><br>“Pretty Little Liars meets The Breakfast Club” (<i>Entertainment Weekly</i>) in this addictive mystery about what happens when five strangers walk into detention and only four walk out alive. </b><br> <br>Pay close attention and you might solve this.<br>On Monday afternoon, five students at Bayview High walk into detention.<br><br>    Bronwyn, <b>the brain</b>, is Yale-bound and never breaks a rule.<br>    Addy,<b> the beauty</b>, is the picture-perfect homecoming princess.<br>    Nate, <b>the criminal</b>, is already on probation for dealing.<br>    Cooper, <b>the athlete</b>, is the all-star baseball pitcher.<br>    And Simon, <b>the outcast</b>, is the creator of Bayview High’s notorious gossip app.<br> <br>Only, Simon never makes it out of that classroom. Before the end of detention Simon's dead. And according to investigators, his death wasn’t an accident. On Monday, he died. But on Tuesday, he’d planned to post juicy reveals about all four of his high-profile classmates, which makes all four of them suspects in his murder. Or are they the perfect patsies for a killer who’s still on the loose?<br><br>Everyone has secrets, right? What really matters is how far you would go to protect them.<br><br><b><b>All the secrets of the Bayview Four will be revealed in the TV series now streaming on NBC's Peacock! <br><br><b>And don’t miss the #1 <i>New York Times </i>bestselling sequel, <i>One of Us is Next</i>!</b></b></b>	
161	THE ISLAND	0593481496	9780593481493	<b>Hot on the heels of the <i>New York Times </i>bestseller<i>s The Twin </i>and<i> The Lake</i>, another pulse-pounding read from the undisputed queen of YA thrillers!<br><br>They said goodbye to their friends and family for the weekend. They weren’t counting on forever.</b><br><br>Jagged Island: a private amusement park for the very rich—or the very influential. Liam, James, Will, Ava, Harper, and Paisley—social media influencers with millions of followers—have been invited for an exclusive weekend before the park opens. They’ll make posts and videos for their channels and report every second of their VIP treatment. <br><br>When the teens arrive, they're stunned: the resort is even better than they’d imagined. Their hotel rooms are unreal, the park’s themed rides are incredible, and the island is hauntingly beautiful. They’re given a jam-packed itinerary for the weekend. <br><br>But soon they'll discover that something's missing from their schedule: getting off the island alive.	
162	THEY BOTH DIE AT THE END	0062457802	9780062457806	<p>Adam Silvera reminds us that there’s no life without death and no love without loss in this devastating yet uplifting story about two people whose lives change over the course of one unforgettable day.</p><p>New York Times bestseller * 4 starred reviews * A School Library Journal Best Book of the Year * A Kirkus Best Book of the Year * A Booklist Editors' Choice of 2017 * A Bustle Best YA Novel of 2017 * A Paste Magazine Best YA Book of 2017 * A Book Riot Best Queer Book of 2017 * A Buzzfeed Best YA Book of the Year * A BookPage Best YA Book of the Year </p><p>On September 5, a little after midnight, Death-Cast calls Mateo Torrez and Rufus Emeterio to give them some bad news: They’re going to die today.</p><p>Mateo and Rufus are total strangers, but, for different reasons, they’re both looking to make a new friend on their End Day. The good news: There’s an app for that. It’s called the Last Friend, and through it, Rufus and Mateo are about to meet up for one last great adventure—to live a lifetime in a single day.</p><p>In the tradition of Before I Fall and If I Stay, They Both Die at the End is a tour de force from acclaimed author Adam Silvera, whose debut, More Happy Than Not, the New York Times called “profound.”</p><p>Featuring a map of the novel’s characters and their connections, an exclusive essay by the author, and a behind-the-scenes look at the early outlines for this critically acclaimed bestseller. </p>	
163	SIX OF CROWS	125007696X	9781250076960	<p><b>See the Grishaverse com</b><b>e to life on screen with <i>Shadow and Bone</i>, now a Netflix original series. </b><br><br><b>Discover what comes next for heist trio Kaz, Inej, and Jesper -- and the star-crossed Nina and Matthias -- in the</b><b> #1 <i>New York Times</i> bestseller <i>Six of Crows, </i></b><b>Book One of the Six of Crows Duology</b><b>.</b><br><br>Ketterdam: a bustling hub of international trade where anything can be had for the right price—and no one knows that better than criminal prodigy Kaz Brekker. Kaz is offered a chance at a deadly heist that could make him rich beyond his wildest dreams. But he can't pull it off alone. . . .<br><br> <i>A convict with a thirst for revenge.<br><br> A sharpshooter who can't walk away from a wager.<br><br> A runaway with a privileged past.<br><br> A spy known as the Wraith.<br><br> A Heartrender using her magic to survive the slums. <br><br> A thief with a gift for unlikely escapes. </i><br><br> Six dangerous outcasts. One impossible heist. Kaz's crew is the only thing that might stand between the world and destruction—if they don't kill each other first.<br><br> <i>Six of Crows</i> by Leigh Bardugo returns to the breathtaking world of the Grishaverse in this unforgettable tale about the opportunity—and the adventure—of a lifetime.<br><br> <b>Praise for <i>Six of Crows</i>:</b><br><br>“<i>Six of Crows</i> is <b>a twisty and elegantly crafted masterpiece </b>that thrilled me from the beginning to end.” –<i>New York Times</i>-bestselling author Holly Black<br><br> “<i>Six of Crows</i> [is] one of those <b>all-too-rare, unputdownable </b>books that keeps your eyes glued to the page and your brain scrambling to figure out what’s going to happen next.” –Michael Dante DiMartino, co-creator of <i>Avatar: The Last Airbender</i> and <i>The Legend of Korra</i><br><br> “There's conflict between morality and amorality and an appetite for sometimes grimace-inducing violence that recalls the Game of Thrones series. But for every bloody exchange there are pages of <b>crackling dialogue and sumptuous description</b>. Bardugo dives deep into this world, with full color and sound. If you're not careful, <b>it'll steal all your time</b>.” —<i>The New York Times Book Review</i><br><br> Read all the books in the Grishaverse!<br><br><b>The Shadow and Bone Trilogy </b><br> (previously published as The Grisha Trilogy)<br> <i>Shadow and Bone</i><br> <i>Siege and Storm</i><br> <i>Ruin and Rising</i><br><br> <b>The Six of Crows Duology</b><br> <i>Six of Crows</i><br> <i>Crooked Kingdom</i><br><br><b>The King of Scars Duology</b><br><i>King of Scars</i><br><br> <i>The Language of Thorns: Midnight Tales and Dangerous Magic</i><br><i>The Severed Moon: A Year-Long Journal of Magic</i><br><br><b>Praise for the Grishaverse</b><br><br> “A master of fantasy.” —<i>The Huffington Post</i><br> “Utterly, extremely bewitching.” —<i>The Guardian</i><br> “This is what fantasy is for.” —<i>The New York Times Book Review</i><br> “[A] world that feels real enough to have its own passport stamp.” —NPR<br> “The darker it gets for the good guys, the better.” —<i>Entertainment Weekly</i><br> “Sultry, sweeping and picturesque. . . . Impossible to put down.” —<i>USA Today</i><br> “There’s a level of emotional and historical sophistication within Bardugo’s original epic fantasy that sets it apart.” —<i>Vanity Fair</i><br> “Unlike anything I’ve ever read.” —Veronica Roth, bestselling author of <i>Divergent</i><br> “Bardugo crafts a first-rate adventure, a poignant romance, and an intriguing mystery!” —Rick Riordan, bestselling author of the Percy Jackson series</p>	
164	THE BOOK THIEF	0375842209	9780375842207	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • ONE OF <i>TIME</i> MAGAZINE’S 100 BEST YA BOOKS OF ALL TIME<br><br>The extraordinary, beloved novel about the ability of books to feed the soul even in the darkest of times.</b><br><br><i>When Death has a story to tell, you listen.</i><br><br> It is 1939. Nazi Germany. The country is holding its breath. Death has never been busier, and will become busier still.<br><br> Liesel Meminger is a foster girl living outside of Munich, who scratches out a meager existence for herself by stealing when she encounters something she can’t resist–books. With the help of her accordion-playing foster father, she learns to read and shares her stolen books with her neighbors during bombing raids as well as with the Jewish man hidden in her basement. <br><br> In superbly crafted writing that burns with intensity, award-winning author Markus Zusak, author of <i>I Am the Messenger,</i> has given us one of the most enduring stories of our time.<br>  <br> “The kind of book that can be life-changing.” —<i>The New York Times</i><br>  <br> “Deserves a place on the same shelf with <i>The Diary of a Young Girl </i>by Anne Frank.” —<i>USA Today</i><br><br><b>DON’T MISS <i>BRIDGE OF CLAY</i>, MARKUS ZUSAK’S FIRST NOVEL SINCE <i>THE BOOK THIEF.</i></b>	
165	ONCE UPON A BROKEN HEART		9781250898326		
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_authors (book_author_id, book_id, author_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	3	4
5	4	5
6	5	6
7	6	7
8	7	8
9	8	9
10	9	10
11	10	11
12	11	12
13	12	13
14	13	14
15	14	15
16	15	16
17	16	17
18	17	18
19	18	19
20	19	20
21	20	21
22	21	22
23	22	23
24	23	24
25	24	25
26	25	26
27	26	27
28	27	28
29	28	29
30	29	30
31	30	31
32	31	32
33	31	33
34	32	34
35	33	35
36	34	36
37	35	37
38	36	38
39	37	39
40	38	40
41	39	41
42	40	42
43	41	43
44	42	44
45	42	45
46	43	46
47	44	47
48	44	48
49	45	49
50	46	50
51	47	51
52	48	52
53	49	53
54	50	54
55	51	55
56	52	56
57	53	57
58	54	58
59	55	59
60	56	60
61	57	61
62	58	62
63	58	63
64	59	64
65	60	65
66	61	66
67	62	67
68	63	68
69	64	69
70	65	70
71	66	71
72	67	72
73	68	73
74	69	74
75	70	75
76	71	76
77	72	77
78	73	78
79	73	79
80	74	80
81	75	81
82	76	82
83	77	83
84	78	84
85	79	85
86	80	86
87	81	87
88	82	88
89	83	89
90	84	90
91	85	91
92	86	92
93	87	93
94	88	94
95	88	95
96	89	96
97	89	97
98	90	98
99	91	99
100	92	100
101	93	101
102	94	102
103	95	103
104	96	104
105	97	105
106	98	106
107	99	107
108	100	108
109	101	109
110	102	110
111	103	111
112	104	112
113	105	113
114	106	114
115	107	115
116	108	116
117	109	117
118	110	118
119	111	119
120	112	120
121	113	121
122	114	122
123	114	123
124	115	124
125	116	125
126	117	126
127	118	127
128	119	128
129	120	129
130	121	130
131	122	131
132	123	132
133	124	133
134	125	134
135	126	135
136	126	136
137	126	137
138	127	138
139	128	139
140	129	140
141	130	141
142	131	142
143	131	143
144	132	144
145	133	145
146	134	146
147	135	147
148	135	148
149	136	149
150	137	150
151	137	151
152	138	152
153	139	153
154	139	154
155	140	155
156	141	156
157	142	157
158	143	158
159	144	159
160	144	160
161	145	161
162	146	162
163	147	163
164	148	164
165	149	165
166	150	166
167	151	167
168	152	168
169	153	169
170	154	170
171	155	171
172	156	172
173	157	173
174	158	174
175	159	175
176	160	176
177	161	177
178	162	178
179	163	179
180	164	180
181	165	181
\.


--
-- Data for Name: books_categories; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_categories (book_category_id, book_id, category_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	3
9	2	8
10	2	9
11	2	3
12	2	10
13	2	11
14	2	3
15	3	9
16	3	3
17	3	10
18	3	11
19	3	3
20	4	12
21	4	13
22	4	3
23	4	14
24	4	3
25	5	15
26	5	16
27	5	3
28	5	17
29	5	18
30	5	3
31	6	13
32	6	9
33	6	3
34	6	10
35	6	11
36	6	3
37	7	9
38	7	3
39	7	3
40	7	10
41	7	19
42	7	11
43	7	3
44	8	12
45	8	20
46	8	21
47	8	3
48	8	3
49	9	3
50	9	17
51	9	4
52	9	6
53	9	7
54	9	3
55	10	9
56	10	3
57	10	19
58	10	10
59	10	11
60	10	3
61	11	13
62	11	3
63	11	4
64	11	11
65	11	6
66	11	3
67	12	9
68	12	3
69	12	10
70	12	3
71	12	4
72	12	6
73	12	22
74	12	3
75	13	3
76	13	23
77	13	9
78	13	24
79	13	3
80	14	23
81	14	9
82	14	3
83	14	10
84	14	25
85	14	11
86	14	3
87	15	26
88	15	12
89	15	13
90	15	3
91	15	11
92	15	3
93	16	27
94	16	28
95	16	29
96	16	30
97	16	31
98	16	32
99	16	33
100	16	34
101	16	31
102	17	35
103	17	36
104	17	37
105	17	38
106	17	11
107	17	38
108	18	35
109	18	39
110	18	40
111	18	41
112	18	38
113	18	42
114	18	43
115	18	38
116	19	44
117	19	45
118	19	46
119	19	47
120	19	48
121	19	37
122	19	49
123	19	48
124	20	50
125	20	51
126	20	52
127	20	53
128	20	54
129	20	14
130	20	55
131	20	50
132	20	56
133	20	57
134	20	58
135	20	14
136	21	35
137	21	29
138	21	28
139	21	30
140	21	38
141	21	59
142	21	38
143	22	35
144	22	60
145	22	41
146	22	38
147	22	61
148	22	38
149	23	62
150	23	63
151	23	41
152	23	38
153	23	64
154	23	65
155	23	66
156	23	38
157	24	67
158	24	68
159	24	69
160	24	70
161	24	38
162	24	71
163	24	70
164	25	72
165	25	29
166	25	73
167	25	74
168	25	75
169	25	76
170	25	29
171	26	77
172	26	27
173	26	29
174	26	78
175	26	75
176	26	31
177	26	31
178	27	60
179	27	38
180	27	35
181	27	11
182	27	38
183	28	79
184	28	72
185	28	29
186	28	80
187	28	81
188	28	82
189	28	81
190	29	29
191	29	83
192	29	11
193	29	84
194	29	84
195	30	85
196	30	86
197	30	87
198	30	88
199	30	36
200	30	37
201	30	38
202	30	38
203	31	1
204	31	2
205	31	3
206	31	4
207	31	5
208	31	6
209	31	3
210	32	89
211	32	90
212	32	12
213	32	3
214	32	75
215	32	11
216	32	3
217	33	3
218	33	91
219	33	12
220	33	92
221	33	3
222	34	89
223	34	12
224	34	93
225	34	94
226	34	3
227	34	75
228	34	3
229	35	95
230	35	96
231	35	3
232	35	97
233	35	4
234	35	6
235	35	3
236	36	9
237	36	3
238	36	19
239	36	10
240	36	11
241	36	3
242	37	13
243	37	3
244	37	11
245	37	98
246	37	91
247	37	99
248	37	3
249	38	12
250	38	13
251	38	3
252	38	100
253	38	101
254	39	102
255	39	79
256	39	103
257	39	104
258	39	81
259	39	105
260	39	81
261	40	106
262	40	29
263	40	107
264	40	108
265	40	107
266	41	109
267	41	110
268	41	111
269	41	112
270	41	113
271	41	104
272	41	114
273	41	111
274	42	35
275	42	115
276	42	60
277	42	41
278	42	38
279	42	43
280	42	38
281	43	116
282	43	117
283	43	45
284	43	118
285	43	119
286	43	120
287	43	121
288	43	116
289	44	122
290	44	9
291	44	3
292	44	19
293	44	4
294	44	6
295	44	3
296	45	3
297	45	3
298	45	123
299	45	4
300	45	6
301	45	22
302	46	9
303	46	3
304	46	19
305	46	10
306	46	11
307	46	3
308	47	8
309	47	9
310	47	3
311	47	10
312	47	124
313	47	3
314	48	9
315	48	3
316	48	19
317	48	10
318	48	11
319	48	3
320	49	3
321	49	6
322	49	4
323	49	22
324	49	3
325	50	8
326	50	9
327	50	3
328	50	10
329	50	11
330	50	3
331	51	8
332	51	9
333	51	3
334	51	3
335	51	10
336	51	125
337	51	3
338	52	68
339	52	126
340	52	126
341	53	127
342	53	128
343	53	41
344	53	81
345	53	113
346	53	129
347	53	41
348	54	35
349	54	36
350	54	37
351	54	38
352	54	130
353	54	11
354	54	38
355	56	35
356	56	38
357	56	131
358	56	11
359	56	38
360	57	77
361	57	29
362	57	78
363	57	132
364	57	133
365	57	38
366	57	134
367	57	135
368	57	66
369	57	38
370	58	136
371	58	137
372	58	45
373	58	46
374	58	72
375	58	29
376	58	138
377	58	81
378	58	139
379	58	29
380	59	50
381	59	140
382	59	36
383	59	37
384	59	141
385	59	37
386	60	35
387	60	38
388	60	12
389	60	11
390	60	38
391	61	50
392	61	142
393	61	143
394	61	144
395	61	145
396	61	144
397	62	35
398	62	68
399	62	70
400	62	81
401	62	38
402	62	38
403	63	38
404	63	146
405	63	147
406	63	65
407	63	148
408	64	50
409	64	36
410	64	37
411	64	145
412	64	149
413	64	150
414	64	150
415	65	151
416	65	152
417	65	153
418	65	48
419	65	65
420	65	154
421	65	155
422	65	65
423	66	85
424	66	156
425	66	88
426	66	157
427	66	37
428	66	37
429	67	158
430	67	12
431	67	36
432	67	159
433	67	37
434	67	160
435	67	161
436	67	159
437	68	150
438	68	162
439	68	150
440	69	163
441	69	156
442	69	164
443	69	165
444	69	166
445	69	113
446	69	65
447	69	167
448	69	168
449	69	65
450	70	169
451	70	81
452	70	170
453	70	171
454	70	104
455	70	172
456	70	104
457	71	37
458	71	140
459	71	37
460	72	173
461	73	174
462	73	175
463	73	176
464	73	177
465	73	178
466	73	177
467	74	177
468	74	179
469	74	180
470	74	181
471	74	182
472	74	177
473	75	183
474	75	17
475	75	100
476	75	177
477	75	176
478	75	177
479	76	89
480	76	184
481	76	3
482	76	185
483	76	186
484	76	17
485	76	177
486	76	187
487	76	3
488	77	188
489	77	189
490	77	190
491	77	38
492	77	191
493	77	66
494	77	191
495	78	191
496	78	192
497	78	179
498	78	193
499	78	194
500	78	191
501	79	195
502	79	176
503	79	177
504	79	187
505	79	91
506	79	196
507	80	197
508	80	100
509	80	177
510	80	187
511	80	198
512	80	91
513	80	177
514	81	91
515	81	177
516	81	187
517	81	177
518	82	177
519	83	199
520	83	189
521	83	100
522	83	177
523	83	187
524	83	180
525	83	200
526	83	177
527	83	201
528	83	177
529	84	183
530	84	202
531	84	100
532	84	177
533	84	196
534	84	177
535	85	203
536	85	204
537	85	177
538	85	187
539	85	180
540	85	177
541	86	205
542	86	206
543	86	207
544	86	177
545	86	200
546	86	177
547	87	208
548	87	189
549	87	177
550	87	187
551	87	194
552	87	177
553	88	203
554	88	209
555	88	204
556	88	206
557	88	210
558	88	177
559	88	187
560	88	177
561	89	189
562	89	206
563	89	78
564	89	177
565	89	187
566	89	98
567	89	211
568	89	177
569	90	206
570	90	100
571	90	177
572	90	129
573	90	177
574	91	203
575	91	212
576	91	202
577	91	177
578	91	187
579	91	201
580	91	177
581	92	203
582	92	189
583	92	213
584	92	177
585	92	187
586	92	177
587	94	95
588	94	186
589	94	17
590	94	187
591	94	214
592	94	215
593	95	159
594	95	177
595	95	202
596	95	177
597	96	216
598	96	217
599	96	218
600	96	187
601	96	215
602	96	215
603	97	176
604	97	177
605	97	177
606	98	188
607	98	9
608	98	219
609	98	206
610	98	220
611	98	10
612	98	177
613	98	187
614	98	91
615	98	215
616	98	177
617	99	202
618	99	221
619	99	177
620	99	187
621	99	91
622	99	177
623	101	215
624	101	16
625	101	18
626	101	215
627	102	188
628	102	9
629	102	215
630	102	17
631	102	206
632	102	222
633	102	10
634	102	187
635	102	223
636	102	215
637	102	215
638	104	188
639	104	216
640	104	132
641	104	187
642	104	224
643	104	211
644	104	215
645	104	215
646	105	8
647	105	9
648	105	10
649	105	187
650	105	91
651	105	215
652	106	208
653	106	213
654	106	221
655	106	187
656	106	215
657	106	215
658	107	216
659	107	217
660	107	218
661	107	187
662	107	215
663	107	215
664	108	174
665	108	203
666	108	122
667	108	28
668	108	9
669	108	215
670	108	187
671	108	211
672	108	215
673	108	215
674	109	174
675	109	203
676	109	215
677	109	64
678	109	187
679	109	225
680	109	91
681	109	215
682	110	195
683	110	197
684	110	215
685	110	226
686	110	100
687	110	196
688	110	215
689	111	227
690	111	228
691	111	9
692	111	18
693	111	178
694	111	215
695	111	215
696	112	227
697	112	9
698	112	215
699	112	18
700	112	215
701	112	215
702	113	50
703	113	36
704	113	37
705	113	229
706	113	145
707	113	150
708	113	150
709	114	87
710	114	36
711	114	230
712	114	38
713	114	229
714	114	231
715	114	150
716	114	38
717	115	85
718	115	60
719	115	38
720	115	232
721	115	156
722	115	88
723	116	20
724	116	202
725	116	159
726	116	17
727	116	221
728	116	177
729	116	177
730	116	177
731	117	20
732	117	202
733	117	159
734	117	221
735	117	177
736	118	20
737	118	159
738	118	17
739	118	221
740	118	177
741	118	177
742	119	183
743	119	159
744	119	17
745	119	100
746	119	177
747	119	177
748	120	20
749	120	159
750	120	17
751	120	221
752	120	177
753	120	177
754	121	20
755	121	159
756	121	28
757	121	78
758	121	177
759	121	187
760	121	180
761	121	225
762	121	98
763	121	233
764	121	211
765	121	177
766	122	159
767	122	17
768	122	234
769	122	18
770	122	235
771	122	159
772	123	20
773	123	159
774	123	17
775	123	97
776	123	234
777	123	159
778	124	20
779	124	202
780	124	159
781	124	17
782	124	221
783	124	177
784	124	177
785	125	159
786	125	220
787	125	177
788	125	187
789	125	91
790	125	177
791	126	97
792	126	235
793	126	159
794	126	95
795	126	159
796	127	20
797	127	159
798	127	17
799	127	221
800	127	177
801	127	177
802	128	20
803	128	159
804	128	17
805	128	234
806	128	236
807	128	159
808	129	20
809	129	159
810	129	17
811	129	221
812	129	177
813	130	20
814	130	159
815	130	222
816	130	17
817	130	177
818	130	5
819	130	177
820	131	1
821	131	3
822	131	4
823	131	5
824	131	6
825	131	7
826	132	9
827	132	3
828	132	10
829	132	6
830	132	4
831	132	11
832	132	3
833	133	3
834	133	9
835	133	6
836	133	4
837	133	3
838	134	3
839	134	9
840	134	4
841	134	11
842	134	3
843	135	237
844	135	3
845	135	4
846	135	5
847	135	6
848	135	22
849	135	238
850	136	239
851	136	3
852	136	17
853	136	4
854	136	5
855	136	6
856	136	3
857	137	89
858	137	240
859	137	3
860	137	17
861	137	3
862	138	3
863	138	231
864	138	4
865	138	6
866	138	241
867	138	3
868	139	89
869	139	240
870	139	3
871	139	17
872	139	3
873	140	3
874	140	4
875	140	11
876	140	125
877	140	6
878	140	3
879	141	3
880	141	9
881	141	3
882	142	3
883	142	6
884	142	4
885	142	123
886	142	22
887	142	3
888	143	9
889	143	3
890	143	10
891	143	59
892	143	11
893	143	3
894	144	9
895	144	242
896	144	3
897	144	10
898	144	125
899	144	3
900	145	3
901	145	243
902	145	6
903	145	4
904	145	3
905	146	244
906	146	100
907	146	177
908	146	187
909	146	91
910	146	245
911	146	177
912	147	199
913	147	186
914	147	17
915	147	100
916	147	177
917	147	246
918	147	247
919	147	177
920	148	206
921	148	100
922	148	177
923	148	187
924	148	248
925	148	91
926	148	177
927	150	177
928	150	187
929	150	180
930	150	249
931	150	91
932	150	177
933	151	26
934	151	206
935	151	100
936	151	177
937	151	187
938	151	248
939	151	91
940	151	177
941	152	177
942	152	187
943	152	180
944	152	91
945	152	181
946	152	177
947	153	250
948	153	186
949	153	17
950	153	206
951	153	100
952	153	177
953	153	177
954	154	206
955	154	177
956	154	179
957	154	251
958	154	191
959	154	187
960	154	181
961	154	191
962	155	252
963	155	206
964	155	177
965	155	187
966	155	64
967	155	178
968	155	253
969	155	177
970	156	122
971	156	215
972	156	215
973	157	203
974	157	188
975	157	187
976	157	214
977	157	215
978	157	215
979	158	203
980	158	8
981	158	9
982	158	177
983	158	187
984	158	91
985	158	215
986	158	177
987	159	203
988	159	254
989	159	188
990	159	189
991	159	255
992	159	187
993	159	215
994	159	215
995	160	216
996	160	222
997	160	187
998	160	91
999	160	215
1000	160	215
1001	161	216
1002	161	256
1003	161	17
1004	161	215
1005	161	215
1006	162	174
1007	162	64
1008	162	187
1009	162	91
1010	162	215
1011	162	215
1012	163	17
1013	163	215
1014	163	18
1015	163	215
1016	164	89
1017	164	206
1018	164	64
1019	164	187
1020	164	257
1021	164	76
1022	164	215
1023	164	215
\.


--
-- Data for Name: books_lists; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_lists (book_list_id, book_id, list_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
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
31	2	3
32	5	3
33	31	3
34	4	3
35	8	3
36	6	3
37	9	3
38	32	3
39	15	3
40	33	3
41	34	3
42	35	3
43	36	3
44	37	3
45	38	3
46	16	4
47	17	4
48	19	4
49	18	4
50	21	4
51	24	4
52	22	4
53	29	4
54	30	4
55	39	4
56	40	4
57	27	4
58	41	4
59	42	4
60	43	4
61	3	5
62	7	5
63	10	5
64	13	5
65	11	5
66	14	5
67	12	5
68	44	5
69	45	5
70	46	5
71	47	5
72	48	5
73	49	5
74	50	5
75	51	5
76	20	6
77	23	6
78	25	6
79	26	6
80	52	6
81	53	6
82	54	6
83	55	6
84	56	6
85	57	6
86	58	6
87	59	6
88	60	6
89	61	6
90	62	6
91	63	7
92	64	7
93	65	7
94	66	7
95	67	7
96	68	7
97	69	7
98	70	7
99	71	7
100	72	7
101	73	8
102	74	8
103	75	8
104	76	8
105	77	8
106	78	8
107	79	8
108	80	8
109	81	8
110	82	8
111	83	9
112	84	9
113	85	9
114	86	9
115	87	9
116	88	9
117	89	9
118	90	9
119	91	9
120	92	9
121	93	10
122	94	10
123	95	10
124	96	10
125	97	10
126	98	10
127	99	10
128	100	10
129	101	10
130	102	10
131	103	11
132	104	11
133	105	11
134	106	11
135	107	11
136	108	11
137	109	11
138	110	11
139	111	11
140	112	11
141	64	12
142	71	12
143	66	12
144	39	12
145	113	12
146	68	12
147	55	12
148	114	12
149	115	12
150	59	12
151	116	13
152	117	13
153	118	13
154	119	13
155	120	13
156	121	13
157	122	13
158	123	13
159	124	13
160	125	13
161	126	13
162	127	13
163	128	13
164	129	13
165	130	13
166	131	14
167	132	14
168	133	14
169	134	14
170	135	14
171	136	14
172	137	14
173	138	14
174	139	14
175	140	14
176	141	14
177	142	14
178	143	14
179	144	14
180	145	14
181	146	15
182	147	15
183	148	15
184	149	15
185	150	15
186	151	15
187	152	15
188	153	15
189	154	15
190	155	15
191	156	16
192	157	16
193	158	16
194	159	16
195	160	16
196	161	16
197	162	16
198	163	16
199	164	16
200	165	16
\.


--
-- Data for Name: books_shelves; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_shelves (book_shelf_id, book_id, shelf_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Police Procedural
2	Women Sleuths
3	Fiction
4	Suspense
5	Mystery & Detective
6	Thrillers
7	Crime
8	Romantic Comedy
9	Romance
10	Contemporary
11	Women
12	Literary
13	Family Life
14	Medical
15	Dragons & Mythical Creatures
16	Epic
17	Action & Adventure
18	Fantasy
19	New Adult
20	Humorous
21	Feminist
22	Psychological
23	Lgbtq+
24	Gay
25	Bisexual
26	Siblings
27	Murder
28	Europe
29	History
30	Great Britain
31	True Crime
32	Georgian Era (1714-1837)
33	Maritime History & Piracy
34	Mass Murder
35	Personal Memoirs
36	Personal Growth
37	Self-Help
38	Biography & Autobiography
39	Essays & Travelogues
40	Fatherhood
41	Family & Relationships
42	Travel
43	Parenting
44	Aging
45	Science
46	Life Sciences
47	Human Anatomy & Physiology
48	Health & Fitness
49	Longevity
50	Psychology
51	Psychopathology
52	Mental Illness
53	Psychiatry
54	Depression
55	Post-Traumatic Stress Disorder (PTSD)
56	Schizophrenia
57	Psychotherapy
58	Mental Health
59	Royalty
60	Entertainment & Performing Arts
61	Dysfunctional Families
62	Essays & Narratives
63	Asian & Asian American
64	Death, Grief, Bereavement
65	Cooking
66	Cultural, Ethnic & Regional
67	Educators
68	Essays
69	Education
70	Literary Collections
71	Teacher & Student Mentoring
72	Social History
73	Jewish
74	Modern
75	20th Century
76	Holocaust
77	Indigenous Peoples in the Americas
78	United States
79	Social Classes & Economic Disparity
80	Sociology
81	Social Science
82	Social Theory
83	Women Artists
84	Art
85	Inspiration & Personal Growth
86	Rich & Famous
87	Success
88	Body, Mind & Spirit
89	Historical
90	World War II
91	Friendship
92	Cultural Heritage
93	Biographical
94	Sagas
95	Dystopian
96	Apocalyptic & Post-Apocalyptic
97	Science Fiction
98	African American & Black
99	Marriage & Divorce
100	Animals
101	Human-animal relationships
102	Social Policy
103	Public Policy
104	Political Science
105	Poverty & Homelessness
106	Statistics
107	Sports & Recreation
108	Baseball
109	Topic
110	Politics
111	Humor
112	Literary Criticism
113	American
114	Censorship
115	Motherhood
116	Computers
117	Physics
118	Quantum Computing
119	Technology & Engineering
120	Quantum Theory
121	Social Aspects
122	Coming of Age
123	Domestic
124	Sports
125	Small Town & Rural
126	Nature
127	Ethnic Studies
128	African American & Black Studies
129	Love & Romance
130	Self-Esteem
131	Religious
132	Indigenous
133	19th Century
134	State & Local
135	Southwest (AZ, NM, OK, TX)
136	Civilization
137	Evolution
138	Anthropology
139	Cultural & Social
140	Motivational & Inspirational
141	Cognitive Psychology & Cognition
142	Communication Studies
143	Interpersonal Relations
144	Language Arts & Disciplines
145	Social Psychology
146	Seasonal
147	Entertaining
148	Culinary
149	Organizational Behavior
150	Business & Economics
151	Diet & Nutrition
152	Diets
153	Diabetic & Sugar-Free
154	Weight Loss
155	Health & Healing
156	Music
157	Creativity
158	Ethics & Moral Philosophy
159	Comics & Graphic Novels
160	Philosophy
161	Happiness
162	Personal Finance
163	Courses & Dishes
164	Sandwiches
165	Country & Bluegrass
166	Southern States
167	Genres & Styles
168	Regional & Ethnic
169	Political Process
170	Commentary & Opinion
171	Religion
172	Christian Living
173	Religions
174	Lgbtq
175	Greek & Roman
176	Fantasy & Magic
177	Juvenile Fiction
178	Legends, Myths, Fables
179	Health & Daily Living
180	School & Education
181	Disabilities
182	Diseases, Illnesses & Injuries
183	Dragons, Unicorns & Mythical
184	Emigration & Immigration
185	Military & Wars
186	Survival Stories
187	Social Themes
188	Girls & Women
189	Self-Esteem & Self-Reliance
190	Social Topics
191	Juvenile Nonfiction
192	Daily Activities
193	Crafts & Hobbies
194	Cooking & Food
195	Adaptations
196	Fairy Tales & Folklore
197	Marine Life
198	Mammals
199	Bears
200	Imagination & Play
201	Concepts
202	Humorous Stories
203	Emotions & Feelings
204	Holidays & Celebrations
205	Bedtime & Dreams
206	Family
207	New Baby
208	Values & Virtues
209	Parents
210	Mother's Day
211	People & Places
212	Colors
213	Diversity & Multicultural
214	Physical & Emotional Abuse
215	Young Adult Fiction
216	Thrillers & Suspense
217	Law & Crime
218	Prejudice & Racism
219	Dating & Sex
220	Adolescence & Coming of Age
221	Superheroes
222	Mysteries & Detective Stories
223	Class Differences
224	Activism & Social Justice
225	Boys & Men
226	Mermaids & Mermen
227	Dark Fantasy
228	Arthurian
229	Leadership
230	Self-help
231	Military
232	Individual Composer & Musician
233	New Experience
234	Manga
235	Media Tie-In
236	Crime & Mystery
237	Amateur Sleuth
238	Detective and mystery stories
239	International Crime & Mystery
240	Westerns
241	War & Military
242	Clean & Wholesome
243	Legal
244	Zoos
245	Apes, Monkeys, etc
246	Ducks, Geese, etc
247	Robots
248	Dogs
249	Bullying
250	Wolves, Coyotes & Wild Dogs
251	Physical Impairments
252	Multigenerational
253	Asian
254	Sexual Abuse
255	Violence
256	Horror
257	Orphans & Foster Homes
\.


--
-- Data for Name: covers; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.covers (cover_id, book_id, cover_url, source) FROM stdin;
1	1	https://storage.googleapis.com/du-prd/books/images/9780316402781.jpg	NYT
2	2	https://storage.googleapis.com/du-prd/books/images/9780593441275.jpg	NYT
3	3	https://storage.googleapis.com/du-prd/books/images/9780593438558.jpg	NYT
4	4	https://storage.googleapis.com/du-prd/books/images/9780802162175.jpg	NYT
5	5	https://storage.googleapis.com/du-prd/books/images/9781649374042.jpg	NYT
6	6	https://storage.googleapis.com/du-prd/books/images/9781984821775.jpg	NYT
7	7	https://storage.googleapis.com/du-prd/books/images/9781501110375.jpg	NYT
8	8	https://storage.googleapis.com/du-prd/books/images/9780385547345.jpg	NYT
9	9	https://storage.googleapis.com/du-prd/books/images/9781538750636.jpg	NYT
10	10	https://storage.googleapis.com/du-prd/books/images/9781668001226.jpg	NYT
11	11	https://storage.googleapis.com/du-prd/books/images/9781501171345.jpg	NYT
12	12	https://storage.googleapis.com/du-prd/books/images/9781791392796.jpg	NYT
13	13	https://storage.googleapis.com/du-prd/books/images/9781685798406.jpg	NYT
14	14	https://storage.googleapis.com/du-prd/books/images/9781501161933.jpg	NYT
15	15	https://storage.googleapis.com/du-prd/books/images/9780593243732.jpg	NYT
16	16	https://storage.googleapis.com/du-prd/books/images/9780385534260.jpg	NYT
17	17	https://storage.googleapis.com/du-prd/books/images/9780593237465.jpg	NYT
18	18	https://storage.googleapis.com/du-prd/books/images/9780785291817.jpg	NYT
19	19	https://storage.googleapis.com/du-prd/books/images/9780593236598.jpg	NYT
20	20	https://storage.googleapis.com/du-prd/books/images/9780670785933.jpg	NYT
21	21	https://storage.googleapis.com/du-prd/books/images/9780593593806.jpg	NYT
22	22	https://storage.googleapis.com/du-prd/books/images/9781982185824.jpg	NYT
23	23	https://storage.googleapis.com/du-prd/books/images/9780525657743.jpg	NYT
24	24	https://storage.googleapis.com/du-prd/books/images/9781368095051.jpg	NYT
25	25	https://storage.googleapis.com/du-prd/books/images/9780063112360.jpg	NYT
26	26	https://storage.googleapis.com/du-prd/books/images/9780385534246.jpg	NYT
27	27	https://storage.googleapis.com/du-prd/books/images/9781250852069.jpg	NYT
28	28	https://storage.googleapis.com/du-prd/books/images/9780593230251.jpg	NYT
29	29	https://storage.googleapis.com/du-prd/books/images/9780393881868.jpg	NYT
30	30	https://storage.googleapis.com/du-prd/books/images/9780593139134.jpg	NYT
31	31	https://storage.googleapis.com/du-prd/books/images/9780316402781.jpg	NYT
32	32	https://storage.googleapis.com/du-prd/books/images/9781668011836.jpg	NYT
33	33	https://storage.googleapis.com/du-prd/books/images/9780593321201.jpg	NYT
34	34	https://storage.googleapis.com/du-prd/books/images/9781501117299.jpg	NYT
35	35	https://storage.googleapis.com/du-prd/books/images/9780525619475.jpg	NYT
36	36	https://storage.googleapis.com/du-prd/books/images/9781501110375.jpg	NYT
37	37	https://storage.googleapis.com/du-prd/books/images/9780062994219.jpg	NYT
38	38	https://storage.googleapis.com/du-prd/books/images/9780063204157.jpg	NYT
39	39	https://storage.googleapis.com/du-prd/books/images/9780593239919.jpg	NYT
40	40	https://storage.googleapis.com/du-prd/books/images/9781538722978.jpg	NYT
41	41	https://storage.googleapis.com/du-prd/books/images/9780063270428.jpg	NYT
42	42	https://storage.googleapis.com/du-prd/books/images/9781538720370.jpg	NYT
43	43	https://storage.googleapis.com/du-prd/books/images/9780385548366.jpg	NYT
44	44	https://storage.googleapis.com/du-prd/books/images/9781335004888.jpg	NYT
45	45	https://storage.googleapis.com/du-prd/books/images/9781538742570.jpg	NYT
46	46	https://storage.googleapis.com/du-prd/books/images/9781476753195.jpg	NYT
47	47	https://storage.googleapis.com/du-prd/books/images/9781668026038.jpg	NYT
48	48	https://storage.googleapis.com/du-prd/books/images/9781668021910.jpg	NYT
49	49	https://storage.googleapis.com/du-prd/books/images/9781250301697.jpg	NYT
50	50	https://storage.googleapis.com/du-prd/books/images/9780593500804.jpg	NYT
51	51	https://storage.googleapis.com/du-prd/books/images/9781945631832.jpg	NYT
52	52	https://storage.googleapis.com/du-prd/books/images/9781571313560.jpg	NYT
53	53	https://storage.googleapis.com/du-prd/books/images/9780060959470.jpg	NYT
54	54	https://storage.googleapis.com/du-prd/books/images/9780063037328.jpg	NYT
55	55	https://storage.googleapis.com/du-prd/books/images/9781429969352.jpg	NYT
56	56	https://storage.googleapis.com/du-prd/books/images/9780399590504.jpg	NYT
57	57	https://storage.googleapis.com/du-prd/books/images/9781416591061.jpg	NYT
58	58	https://storage.googleapis.com/du-prd/books/images/9780374157357.jpg	NYT
59	59	https://storage.googleapis.com/du-prd/books/images/9781501111129.jpg	NYT
60	60	https://storage.googleapis.com/du-prd/books/images/9780743247542.jpg	NYT
61	61	https://storage.googleapis.com/du-prd/books/images/9780316478526.jpg	NYT
62	62	https://storage.googleapis.com/du-prd/books/images/9780525555216.jpg	NYT
63	63	https://storage.googleapis.com/du-prd/books/images/9780062820174.jpg	NYT
64	64	https://storage.googleapis.com/du-prd/books/images/9780735211292.jpg	NYT
65	65	https://storage.googleapis.com/du-prd/books/images/9781668024522.jpg	NYT
66	66	https://storage.googleapis.com/du-prd/books/images/9780593652886.jpg	NYT
67	67	https://storage.googleapis.com/du-prd/books/images/9780062976581.jpg	NYT
68	68	https://storage.googleapis.com/du-prd/books/images/9781523507870.jpg	NYT
69	69	https://storage.googleapis.com/du-prd/books/images/9780063087781.jpg	NYT
70	70	https://storage.googleapis.com/du-prd/books/images/9781637587294.jpg	NYT
71	71	https://storage.googleapis.com/du-prd/books/images/9781538707944.jpg	NYT
72	72	https://storage.googleapis.com/du-prd/books/images/9780306828270.jpg	NYT
73	73	https://storage.googleapis.com/du-prd/books/images/9781368081153.jpg	NYT
74	74	https://storage.googleapis.com/du-prd/books/images/9780375899881.jpg	NYT
75	75	https://storage.googleapis.com/du-prd/books/images/9781665912761.jpg	NYT
76	76	https://storage.googleapis.com/du-prd/books/images/9780545880831.jpg	NYT
77	77	https://storage.googleapis.com/du-prd/books/images/9780593568996.jpg	NYT
78	78	https://storage.googleapis.com/du-prd/books/images/9781492670025.jpg	NYT
79	79	https://storage.googleapis.com/du-prd/books/images/9780063269538.jpg	NYT
80	80	https://storage.googleapis.com/du-prd/books/images/9781250147424.jpg	NYT
81	81	https://storage.googleapis.com/du-prd/books/images/9781338745795.jpg	NYT
82	82	https://storage.googleapis.com/du-prd/books/images/9781338180633.jpg	NYT
83	83	https://storage.googleapis.com/du-prd/books/images/9781943200085.jpg	NYT
84	84	https://storage.googleapis.com/du-prd/books/images/9780803736801.jpg	NYT
85	85	https://storage.googleapis.com/du-prd/books/images/9780593226186.jpg	NYT
86	86	https://storage.googleapis.com/du-prd/books/images/9780385376716.jpg	NYT
87	87	https://storage.googleapis.com/du-prd/books/images/9780593526095.jpg	NYT
88	88	https://storage.googleapis.com/du-prd/books/images/9781728235844.jpg	NYT
89	89	https://storage.googleapis.com/du-prd/books/images/9780593426975.jpg	NYT
90	90	https://storage.googleapis.com/du-prd/books/images/9780451533463.jpg	NYT
91	91	https://storage.googleapis.com/du-prd/books/images/9780399255373.jpg	NYT
92	92	https://storage.googleapis.com/du-prd/books/images/9780316353229.jpg	NYT
93	93	https://storage.googleapis.com/du-prd/books/images/9780063080089.jpg	NYT
94	94	https://storage.googleapis.com/du-prd/books/images/9780545663267.jpg	NYT
95	95	https://storage.googleapis.com/du-prd/books/images/9781419711329.jpg	NYT
96	96	https://storage.googleapis.com/du-prd/books/images/9780593379851.jpg	NYT
97	97	https://storage.googleapis.com/du-prd/books/images/9780590353427.jpg	NYT
98	98	https://storage.googleapis.com/du-prd/books/images/9781416995586.jpg	NYT
99	99	https://storage.googleapis.com/du-prd/books/images/9780545175340.jpg	NYT
100	100	https://storage.googleapis.com/du-prd/books/images/9781423131892.jpg	NYT
101	101	https://storage.googleapis.com/du-prd/books/images/9781250027436.jpg	NYT
102	102	https://storage.googleapis.com/du-prd/books/images/9780316370950.jpg	NYT
103	103	https://storage.googleapis.com/du-prd/books/images/9781339016238.jpg	NYT
104	104	https://storage.googleapis.com/du-prd/books/images/9781250766588.jpg	NYT
105	105	https://storage.googleapis.com/du-prd/books/images/9780063045873.jpg	NYT
106	106	https://storage.googleapis.com/du-prd/books/images/9781665918466.jpg	NYT
107	107	https://storage.googleapis.com/du-prd/books/images/9780593374160.jpg	NYT
108	108	https://storage.googleapis.com/du-prd/books/images/9781338885101.jpg	NYT
109	109	https://storage.googleapis.com/du-prd/books/images/9780063240803.jpg	NYT
110	110	https://storage.googleapis.com/du-prd/books/images/9781368077224.jpg	NYT
111	111	https://storage.googleapis.com/du-prd/books/images/9780593705834.jpg	NYT
112	112	https://storage.googleapis.com/du-prd/books/images/9781419760860.jpg	NYT
113	113	https://storage.googleapis.com/du-prd/books/images/9780399592522.jpg	NYT
114	114	https://storage.googleapis.com/du-prd/books/images/9781466874961.jpg	NYT
115	115	https://storage.googleapis.com/du-prd/books/images/9780063224629.jpg	NYT
116	116	https://storage.googleapis.com/du-prd/books/images/9781338801910.jpg	NYT
117	117	https://storage.googleapis.com/du-prd/books/images/9781338846621.jpg	NYT
118	118	https://storage.googleapis.com/du-prd/books/images/9781338680454.jpg	NYT
119	119	https://storage.googleapis.com/du-prd/books/images/9781338730890.jpg	NYT
120	120	https://storage.googleapis.com/du-prd/books/images/9781338535624.jpg	NYT
121	121	https://storage.googleapis.com/du-prd/books/images/9780062885531.jpg	NYT
122	122	https://storage.googleapis.com/du-prd/books/images/9781974736553.jpg	NYT
123	123	https://storage.googleapis.com/du-prd/books/images/9781974736331.jpg	NYT
124	124	https://storage.googleapis.com/du-prd/books/images/9781338236590.jpg	NYT
125	125	https://storage.googleapis.com/du-prd/books/images/9781338616101.jpg	NYT
126	126	https://storage.googleapis.com/du-prd/books/images/9781684058419.jpg	NYT
127	127	https://storage.googleapis.com/du-prd/books/images/9781338323214.jpg	NYT
128	128	https://storage.googleapis.com/du-prd/books/images/9781974736287.jpg	NYT
129	129	https://storage.googleapis.com/du-prd/books/images/9780545935173.jpg	NYT
130	130	https://storage.googleapis.com/du-prd/books/images/9781534499379.jpg	NYT
131	131	https://storage.googleapis.com/du-prd/books/images/9780316420389.jpg	NYT
132	132	https://storage.googleapis.com/du-prd/books/images/9781984821676.jpg	NYT
133	133	https://storage.googleapis.com/du-prd/books/images/9780778334446.jpg	NYT
134	134	https://storage.googleapis.com/du-prd/books/images/9781250272935.jpg	NYT
135	135	https://storage.googleapis.com/du-prd/books/images/9781538753095.jpg	NYT
136	136	https://storage.googleapis.com/du-prd/books/images/9781538719725.jpg	NYT
137	137	https://storage.googleapis.com/du-prd/books/images/9780786050130.jpg	NYT
138	138	https://storage.googleapis.com/du-prd/books/images/9780593422724.jpg	NYT
139	139	https://storage.googleapis.com/du-prd/books/images/9780786049578.jpg	NYT
140	140	https://storage.googleapis.com/du-prd/books/images/9781501165375.jpg	NYT
141	141	https://storage.googleapis.com/du-prd/books/images/9780061081859.jpg	NYT
142	142	https://storage.googleapis.com/du-prd/books/images/9781420155549.jpg	NYT
143	143	https://storage.googleapis.com/du-prd/books/images/9781335147530.jpg	NYT
144	144	https://storage.googleapis.com/du-prd/books/images/9781335498410.jpg	NYT
145	145	https://storage.googleapis.com/du-prd/books/images/9780385546027.jpg	NYT
146	146	https://storage.googleapis.com/du-prd/books/images/9780061992278.jpg	NYT
147	147	https://storage.googleapis.com/du-prd/books/images/9780316381994.jpg	NYT
148	148	https://storage.googleapis.com/du-prd/books/images/9781250144058.jpg	NYT
149	149	https://storage.googleapis.com/du-prd/books/images/9780547577319.jpg	NYT
150	150	https://storage.googleapis.com/du-prd/books/images/9781338053807.jpg	NYT
151	151	https://storage.googleapis.com/du-prd/books/images/9780062991317.jpg	NYT
152	152	https://storage.googleapis.com/du-prd/books/images/9780399162596.jpg	NYT
153	153	https://storage.googleapis.com/du-prd/books/images/9780062895936.jpg	NYT
154	154	https://storage.googleapis.com/du-prd/books/images/9781416971719.jpg	NYT
155	155	https://storage.googleapis.com/du-prd/books/images/9781524715700.jpg	NYT
156	156	https://storage.googleapis.com/du-prd/books/images/9781402277832.jpg	NYT
157	157	https://storage.googleapis.com/du-prd/books/images/9781101934715.jpg	NYT
158	158	https://storage.googleapis.com/du-prd/books/images/9781534467637.jpg	NYT
159	159	https://storage.googleapis.com/du-prd/books/images/9781481449359.jpg	NYT
160	160	https://storage.googleapis.com/du-prd/books/images/9781524714680.jpg	NYT
161	161	https://storage.googleapis.com/du-prd/books/images/9780593481493.jpg	NYT
162	162	https://storage.googleapis.com/du-prd/books/images/9780062457790.jpg	NYT
163	163	https://storage.googleapis.com/du-prd/books/images/9781627792127.jpg	NYT
164	164	https://storage.googleapis.com/du-prd/books/images/9780375842207.jpg	NYT
165	165	https://storage.googleapis.com/du-prd/books/images/9781250268396.jpg	NYT
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
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.users (user_id, email, password) FROM stdin;
1	user0@test.com	test
2	user1@test.com	test
3	user2@test.com	test
4	user3@test.com	test
5	user4@test.com	test
6	user5@test.com	test
7	user6@test.com	test
8	user7@test.com	test
9	user8@test.com	test
10	user9@test.com	test
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 181, true);


--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_authors_book_author_id_seq', 181, true);


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_book_id_seq', 165, true);


--
-- Name: books_categories_book_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_categories_book_category_id_seq', 1023, true);


--
-- Name: books_lists_book_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_lists_book_list_id_seq', 200, true);


--
-- Name: books_shelves_book_shelf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_shelves_book_shelf_id_seq', 1, false);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 257, true);


--
-- Name: covers_cover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.covers_cover_id_seq', 165, true);


--
-- Name: lists_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.lists_list_id_seq', 16, true);


--
-- Name: shelves_shelf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.shelves_shelf_id_seq', 1, false);


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

