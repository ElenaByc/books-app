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
1	\N	Emily Henry	\N	\N
2	\N	Colleen Hoover	\N	\N
3	\N	Tom Hanks	\N	\N
4	\N	Rebecca Yarros	\N	\N
5	\N	Bonnie Garmus	\N	\N
6	\N	Colleen Hoover	\N	\N
7	\N	James Patterson	\N	\N
8	\N	Maxine Paetro	\N	\N
9	\N	Julia Quinn	\N	\N
10	\N	Shonda Rhimes	\N	\N
11	\N	Barbara Kingsolver	\N	\N
12	\N	Carley Fortune	\N	\N
13	\N	Abraham Verghese	\N	\N
14	\N	Laura Dave	\N	\N
15	\N	David Baldacci	\N	\N
16	\N	Colleen Hoover	\N	\N
17	\N	Ann Napolitano	\N	\N
18	\N	Prince Harry, The Duke of Sussex	\N	\N
19	\N	David Grann	\N	\N
20	\N	Andy Cohen	\N	\N
21	\N	Michelle Obama	\N	\N
22	\N	Bessel A. Van der Kolk	\N	\N
23	\N	Peter Attia, MD	\N	\N
24	\N	Jennette McCurdy	\N	\N
25	\N	Michelle Zauner	\N	\N
26	\N	Luke Russert	\N	\N
27	\N	Andrew McCarthy	\N	\N
28	\N	David Grann	\N	\N
29	\N	Matthew McConaughey	\N	\N
30	\N	Robin Wall Kimmerer	\N	\N
31	\N	bell hooks	\N	\N
32	\N	Deborah Roberts	\N	\N
33	\N	Ann Napolitano	\N	\N
34	\N	Danielle Steel	\N	\N
35	\N	Gabrielle Zevin	\N	\N
36	\N	Patti Callahan Henry	\N	\N
37	\N	Susan Patterson	\N	\N
38	\N	Susan DiLallo	\N	\N
39	\N	James Patterson	\N	\N
40	\N	Shelby Van Pelt	\N	\N
41	\N	Kat Timpf	\N	\N
42	\N	Mary Louise Kelly	\N	\N
43	\N	Timothy Egan	\N	\N
44	\N	James Risen	\N	\N
45	\N	Ashlee Vance	\N	\N
46	\N	Taylor Jenkins Reid	\N	\N
47	\N	Colleen Hoover	\N	\N
48	\N	Colleen Hoover	\N	\N
49	\N	Tarryn Fisher	\N	\N
50	\N	Amal El-Mohtar	\N	\N
51	\N	Max Gladstone	\N	\N
52	\N	Colleen Hoover	\N	\N
53	\N	Freida McFadden	\N	\N
54	\N	Alex Michaelides	\N	\N
55	\N	Hannah Grace	\N	\N
56	\N	Taylor Jenkins Reid	\N	\N
57	\N	Matt Haig	\N	\N
58	\N	Jonathan Freedland	\N	\N
59	\N	Viola Davis	\N	\N
60	\N	S. C. Gwynne	\N	\N
61	\N	Tara Westover	\N	\N
62	\N	Daniel Kahneman	\N	\N
63	\N	Jeannette Walls	\N	\N
64	\N	Angela Duckworth	\N	\N
65	\N	Malcolm Gladwell	\N	\N
66	\N	David Graeber	\N	\N
67	\N	David Wengrow	\N	\N
68	\N	Atul Gawande	\N	\N
69	\N	Joanna Gaines	\N	\N
70	\N	James Clear	\N	\N
71	\N	Glenn Boozan	\N	\N
72	\N	Rick Rubin	\N	\N
73	\N	Charlie Mackesy	\N	\N
74	\N	T.d. Jakes	\N	\N
75	\N	Jessie Inchauspe	\N	\N
76	\N	Ramit Sethi	\N	\N
77	\N	Miranda Lambert	\N	\N
78	\N	Shannon Bream	\N	\N
79	\N	Rick Riordan	\N	\N
80	\N	Mark Oshiro	\N	\N
81	\N	Dave Eggers	\N	\N
82	\N	Alan Gratz	\N	\N
83	\N	R. J. Palacio	\N	\N
84	\N	A.F. Steadman	\N	\N
85	\N	Katherine Applegate	\N	\N
86	\N	America's Test Kitchen Kids (COR)	\N	\N
87	\N	Soman Chainani	\N	\N
88	\N	Kiyash Monsef	\N	\N
89	\N	Brian Selznick	\N	\N
90	\N	Tiffany Hammond	\N	\N
91	\N	Eric Carle	\N	\N
92	\N	Gregory Lang	\N	\N
93	\N	Susanna Leonard Hill	\N	\N
94	\N	Kobi Yamada	\N	\N
95	\N	Emily Winfield Martin	\N	\N
96	\N	Eric Carle	\N	\N
97	\N	Adam Rubin	\N	\N
98	\N	Sandra Boynton	\N	\N
99	\N	Drew Daywalt	\N	\N
100	\N	Amy Krouse Rosenthal	\N	\N
101	\N	Suzanne Collins	\N	\N
102	\N	Katherine Applegate	\N	\N
103	\N	Jeff Kinney	\N	\N
104	\N	Holly Jackson	\N	\N
105	\N	Jenny Han	\N	\N
106	\N	J. K. Rowling	\N	\N
107	\N	Dav Pilkey	\N	\N
108	\N	Tui T. Sutherland	\N	\N
109	\N	Jennifer Lynn Barnes	\N	\N
110	\N	Ellen Morgan	\N	\N
111	\N	Who HQ	\N	\N
112	\N	Alice Oseman	\N	\N
113	\N	Holly Jackson	\N	\N
114	\N	Angeline Boulley	\N	\N
115	\N	Becky Albertalli	\N	\N
116	\N	Alice Oseman	\N	\N
117	\N	Alexandra Bracken	\N	\N
118	\N	Adam Silvera	\N	\N
119	\N	J. Elle	\N	\N
120	\N	Alex Aster	\N	\N
121	\N	Holly Black	\N	\N
122	\N	William H. McRaven	\N	\N
123	\N	Matthew Desmond	\N	\N
124	\N	Brené Brown	\N	\N
125	\N	Jocko Willink	\N	\N
126	\N	Leif Babin	\N	\N
127	\N	Paris Hilton	\N	\N
128	\N	Dav Pilkey	\N	\N
129	\N	Dav Pilkey	\N	\N
130	\N	Dav Pilkey	\N	\N
131	\N	Tui T. Sutherland	\N	\N
132	\N	Dav Pilkey	\N	\N
133	\N	Jerry Craft	\N	\N
134	\N	Eiichiro Oda	\N	\N
135	\N	Naoya Matsumoto	\N	\N
136	\N	Dav Pilkey	\N	\N
137	\N	Ann M. Martin	\N	\N
138	\N	Kevin Eastman	\N	\N
139	\N	Peter Laird	\N	\N
140	\N	Tom Waltz	\N	\N
141	\N	Dav Pilkey	\N	\N
142	\N	Tatsuya Endo	\N	\N
143	\N	Dav Pilkey	\N	\N
144	\N	Stuart Gibbs	\N	\N
145	\N	James Patterson	\N	\N
146	\N	James O. Born	\N	\N
147	\N	Danielle Steel	\N	\N
148	\N	Sandra Brown	\N	\N
149	\N	Nora Roberts	\N	\N
150	\N	James Patterson	\N	\N
151	\N	J. D. Barker	\N	\N
152	\N	David Baldacci	\N	\N
153	\N	William W. Johnstone	\N	\N
154	\N	J.A. Johnstone	\N	\N
155	\N	Don Bentley	\N	\N
156	\N	William W. Johnstone	\N	\N
157	\N	J.A. Johnstone	\N	\N
158	\N	Megan Miranda	\N	\N
159	\N	Debbie Macomber	\N	\N
160	\N	Lisa Jackson	\N	\N
161	\N	Nora Roberts	\N	\N
162	\N	Debbie Macomber	\N	\N
163	\N	Lee Tobin McClain	\N	\N
164	\N	John Grisham	\N	\N
165	\N	Katherine Applegate	\N	\N
166	\N	Peter Brown	\N	\N
167	\N	Barbara O'Connor	\N	\N
168	\N	Linda Sue Park	\N	\N
169	\N	Gordon Korman	\N	\N
170	\N	Katherine Applegate	\N	\N
171	\N	Lynda Mullaly Hunt	\N	\N
172	\N	Rosanne Parry	\N	\N
173	\N	Sharon M. Draper	\N	\N
174	\N	Tae Keller	\N	\N
175	\N	Laura Nowlin	\N	\N
176	\N	Kathleen Glasgow	\N	\N
177	\N	Lynn Painter	\N	\N
178	\N	Amber Smith	\N	\N
179	\N	Karen M. McManus	\N	\N
180	\N	Natasha Preston	\N	\N
181	\N	Adam Silvera	\N	\N
182	\N	Leigh Bardugo	\N	\N
183	\N	Markus Zusak	\N	\N
184	\N	Stephanie Garber	\N	\N
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books (book_id, title, primary_isbn10, primary_isbn13, description, contributor_note) FROM stdin;
1	HAPPY PLACE	0593441273	9780593441275	<b>A couple who broke up months ago pretend to still be together for their annual weeklong vacation with their best friends in this glittering and wise new novel from #1 <i>New York Times</i> bestselling author Emily Henry.</b><br>  <br> Harriet and Wyn have been the perfect couple since they met in college—they go together like salt and pepper, honey and tea, lobster and rolls. Except, now—for reasons they’re still not discussing—they don’t.<br>  <br> They broke up five months ago. And still haven’t told their best friends.<br>  <br> Which is how they find themselves sharing a bedroom at the Maine cottage that has been their friend group’s yearly getaway for the last decade. Their annual respite from the world, where for one vibrant, blissful week they leave behind their daily lives; have copious amounts of cheese, wine, and seafood; and soak up the salty coastal air with the people who understand them most.<br>  <br> Only this year, Harriet and Wyn are lying through their teeth while trying not to notice how desperately they still want each other. Because the cottage is for sale and this is the last week they’ll all have together in this place. They can’t stand to break their friends’ hearts, and so they’ll play their parts. Harriet will be the driven surgical resident who never starts a fight, and Wyn will be the laid-back charmer who never lets the cracks show. It’s a flawless plan (if you look at it from a great distance and through a pair of sunscreen-smeared sunglasses). After years of being in love, how hard can it be to fake it for one week…in front of those who know you best?	
2	IT ENDS WITH US	1501110365	9781501110368	<b><b>From the #1 <i>New York Times</i> bestselling author of <i>It Starts with Us </i>and <i>All Your Perfects</i>, a</b><b> “brave and heartbreaking novel that digs its claws into you and doesn’t let go, long after you’ve finished it” (Anna Todd, <i>New York Times</i> bestselling author) about a workaholic with a too-good-to-be-true romance can’t stop thinking about her first love—</b></b><b>soon to be a major motion picture starring Blake Lively and Justin Baldoni.</b><br><br>Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.<br> <br>Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.<br> <br>As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.<br> <br>An honest, evocative, and tender novel, <i>It Ends with Us</i> is “a glorious and touching read, a forever keeper. The kind of book that gets handed down” (<i>USA TODAY</i>).	
3	THE MAKING OF ANOTHER MAJOR MOTION PICTURE MASTERPIECE	052565559X	9780525655596	<b>From the Academy Award-winning actor and best-selling author: a novel about the making of a star-studded, multimillion-dollar superhero action film . . . and the humble comic books that inspired it. Funny, touching, and wonderfully thought-provoking, while also capturing the changes in America and American culture since World War II.</b><br><br>Part One of this story takes place in 1947. A troubled soldier, returning from the war, meets his talented five-year-old nephew, leaves an indelible impression, and then disappears for twenty-three years.<br><br><i>Cut to 1970: </i>The nephew, now drawing underground comic books in Oakland, California, reconnects with his uncle and, remembering the comic book he saw when he was five, draws a new version with his uncle as a World War II fighting hero. <br><br><i>Cut to the present day:</i> A commercially successful director discovers the 1970 comic book and decides to turn it into a contemporary superhero movie.<br><br><i>Cue the cast:</i> We meet the film’s extremely difficult male star, his wonderful leading lady, the eccentric writer/director, the producer, the gofer production assistant, and everyone else on both sides of the camera.<br><br><i>Bonus material:</i> Interspersed throughout are three comic books that are featured in the story—all created by Tom Hanks himself—including the comic book that becomes the official tie-in to this novel’s "major motion picture masterpiece."	
4	FOURTH WING	1649374046	9781649374042	<p><b>LIMITED FIRST PRINT EDITION—featuring spray-painted edges with stenciled flying dragons, as well as gorgeously detailed map endpapers. This breathtaking first edition is only available for a limited time and while supplies last.<br></b><br><i>"Suspenseful, sexy, and with incredibly entertaining storytelling, the first in Yarros' Empyrean series will delight fans of romantic, adventure-filled fantasy."</i> —<i><b>Booklist</b></i><b>, starred review</b><br><br><i>"</i>Fourth Wing<i> will have your heart pounding from beginning to end... A fantasy like you've never read before."</i> <b>―#1 <i>New York Times</i> bestselling author Jennifer L. Armentrout</b><br><br><br><b>Enter the brutal and elite world of a war college for dragon riders from <i>USA Today</i> bestselling author Rebecca Yarros</b><br><br>Twenty-year-old Violet Sorrengail was supposed to enter the Scribe Quadrant, living a quiet life among books and history. Now, the commanding general—also known as her tough-as-talons mother—has ordered Violet to join the hundreds of candidates striving to become the elite of Navarre: <i>dragon riders</i>.<br><br>But when you’re smaller than everyone else and your body is brittle, death is only a heartbeat away...because dragons don’t bond to “fragile” humans. They incinerate them.<br><br>With fewer dragons willing to bond than cadets, most would kill Violet to better their own chances of success. The rest would kill her just for being her mother’s daughter—like Xaden Riorson, the most powerful and ruthless wingleader in the Riders Quadrant.<br><br>She’ll need every edge her wits can give her just to see the next sunrise.<br><br>Yet, with every day that passes, the war outside grows more deadly, the kingdom's protective wards are failing, and the death toll continues to rise. Even worse, Violet begins to suspect leadership is hiding a terrible secret.<br><br>Friends, enemies, lovers. Everyone at Basgiath War College has an agenda—because once you enter, there are only two ways out: <i>graduate or die</i>.</p>	
5	LESSONS IN CHEMISTRY	038554734X	9780385547345	<b><i>NEW YORK TIMES</i> BESTSELLER • <i>GOOD MORNING AMERICA</i> BOOK CLUB PICK • A must-read debut! Meet Elizabeth Zott: a “formidable, unapologetic and inspiring” (<i>PARADE</i>) scientist in 1960s California whose career takes a detour when she becomes the unlikely star of a beloved TV cooking show in this novel that is “irresistible, satisfying and full of fuel. It reminds you that change takes time and always requires heat” (<i>The New York Times Book Review</i>).</b><br><br><b>"A unique heroine ... you'll find yourself wishing she wasn’t fictional." —<i>Seattle Times</i></b><br><br><b><i> </i></b>Chemist Elizabeth Zott is not your average woman. In fact, Elizabeth Zott would be the first to point out that there is no such thing as an <i>average</i> woman. But it’s the early 1960s and her all-male team at Hastings Research Institute takes a very unscientific view of equality. Except for one: Calvin Evans; the lonely, brilliant, Nobel–prize nominated grudge-holder who falls in love with—of all things—her mind. True chemistry results. <br><br>But like science, life is unpredictable. Which is why a few years later Elizabeth Zott finds herself not only a single mother, but the reluctant star of America’s most beloved cooking show <i>Supper at Six</i>. Elizabeth’s unusual approach to cooking (“combine one tablespoon acetic acid with a pinch of sodium chloride”) proves revolutionary. But as her following grows, not everyone is happy. Because as it turns out, Elizabeth Zott isn’t just teaching women to cook. She’s daring them to change the status quo. <br><br>Laugh-out-loud funny, shrewdly observant, and studded with a dazzling cast of supporting characters, <i>Lessons in Chemistry</i> is as original and vibrant as its protagonist.	
6	IT STARTS WITH US	1668001225	9781668001226	<b>Before <i>It Ends with Us</i>, it started with Atlas. Colleen Hoover tells fan favorite Atlas’s side of the story and shares what comes next in this long-anticipated sequel to the “glorious and touching” (<i>USA TODAY</i>) #1 <i>New York Times</i> bestseller <i>It Ends with Us</i>.</b><br><br>Lily and her ex-husband, Ryle, have just settled into a civil coparenting rhythm when she suddenly bumps into her first love, Atlas, again. After nearly two years separated, she is elated that for once, time is on their side, and she immediately says yes when Atlas asks her on a date.<br> <br>But her excitement is quickly hampered by the knowledge that, though they are no longer married, Ryle is still very much a part of her life—and Atlas Corrigan is the one man he will hate being in his ex-wife and daughter’s life.<br> <br>Switching between the perspectives of Lily and Atlas, <i>It Starts with Us</i> picks up right where the epilogue for the “gripping, pulse-pounding” (Sarah Pekkanen, author of <i>Perfect Neighbors</i>) bestselling phenomenon <i>It Ends with Us</i> left off. Revealing more about Atlas’s past and following Lily as she embraces a second chance at true love while navigating a jealous ex-husband, it proves that “no one delivers an emotional read like Colleen Hoover” (Anna Todd, <i>New York Times</i> bestselling author).	
7	THE 23RD MIDNIGHT	0316402788	9780316402781	<p><b>The latest in this "successful and suspenseful" (<i>Entertainment Weekly</i>) series: an attention-seeking copycat is recreating murders by a famous killer from the Women's Murder Club's past--with devastating new twists. </b></p> Detective Lindsay Boxer put serial killer Evan Burke in jail. <br> <br> <br> <br> Reporter Cindy Thomas wrote a book that put him on the bestseller list.<br> <br> <br> <br> An obsessed maniac has turned Burke's true-crime story into a playbook. And is embellishing it with gruesome touches all his own. <br> <br> <br> <br> Now Lindsay's tracking an elusive suspect, and the entire Murder Club is facing destruction.	
8	QUEEN CHARLOTTE	0063305089	9780063305083	<p>From #1 New York Times bestselling author Julia Quinn and television pioneer Shonda Rhimes comes a powerful and romantic novel of Bridgerton's Queen Charlotte and King George III's great love story and how it sparked a societal shift, inspired by the original series Queen Charlotte: A Bridgerton Story, created by Shondaland for Netflix.</p> <p>"We are one crown. His weight is mine, and mine is his..."</p> <p>In 1761, on a sunny day in September, a King and Queen met for the very first time. They were married within hours.</p> <p>Born a German Princess, Charlotte of Mecklenburg-Strelitz was beautiful, headstrong, and fiercely intelligent... not precisely the attributes the British Court had been seeking in a spouse for the young King George III. But her fire and independence were exactly what she needed, because George had secrets... secrets with the potential to shake the very foundations of the monarchy.</p> <p>Thrust into her new role as a royal, Charlotte must learn to navigate the intricate politics of the court... all the while guarding her heart, because she is falling in love with the King, even as he pushes her away. Above all she must learn to rule, and to understand that she has been given the power to remake society. She must fight--for herself, for her husband, and for all her new subjects who look to her for guidance and grace. For she will never be just Charlotte again. She must instead fulfill her destiny... as Queen.</p>	
9	DEMON COPPERHEAD	0063251922	9780063251922	<p>A NEW YORK TIMES "TEN BEST BOOKS OF 2022"</p> <p>An Oprah's Book Club Selection * An Instant New York Times Bestseller * An Instant Wall Street Journal Bestseller * A #1 Washington Post Bestseller </p> <p>"Demon is a voice for the ages--akin to Huck Finn or Holden Caulfield--only even more resilient." --Beth Macy, author of Dopesick</p> <p>"May be the best novel of 2022. . . . Equal parts hilarious and heartbreaking, this is the story of an irrepressible boy nobody wants, but readers will love." (Ron Charles, Washington Post)</p> <p>From the acclaimed author of The Poisonwood Bible and The Bean Trees, a brilliant novel that enthralls, compels, and captures the heart as it evokes a young hero's unforgettable journey to maturity</p> <p>Set in the mountains of southern Appalachia, Demon Copperhead is the story of a boy born to a teenaged single mother in a single-wide trailer, with no assets beyond his dead father's good looks and copper-colored hair, a caustic wit, and a fierce talent for survival. Relayed in his own unsparing voice, Demon braves the modern perils of foster care, child labor, derelict schools, athletic success, addiction, disastrous loves, and crushing losses. Through all of it, he reckons with his own invisibility in a popular culture where even the superheroes have abandoned rural people in favor of cities.</p> <p>Many generations ago, Charles Dickens wrote David Copperfield from his experience as a survivor of institutional poverty and its damages to children in his society. Those problems have yet to be solved in ours. Dickens is not a prerequisite for readers of this novel, but he provided its inspiration. In transposing a Victorian epic novel to the contemporary American South, Barbara Kingsolver enlists Dickens' anger and compassion, and above all, his faith in the transformative powers of a good story. Demon Copperhead speaks for a new generation of lost boys, and all those born into beautiful, cursed places they can't imagine leaving behind.</p>	
10	MEET ME AT THE LAKE	0593438558	9780593438558	<b><b>THE INSTANT #1 <i>NEW YORK TIMES</i> BESTSELLER!<br><br>A Most Anticipated Book by <i>Today </i>∙ Oprah Daily ∙ <b>Katie Couric Media ∙ </b>BuzzFeed ∙ SheReads ∙ Zibby Mag ∙ <b>PopSugar ∙ <b>BookRiot ∙ <b>Culturess ∙ </b></b></b>Her Campus ∙ The Everygirl ∙ and more!</b><br><br>A random connection sends two strangers on a daylong adventure where they make a promise one keeps and the other breaks, with life-changing effects, in this breathtaking new novel from the <i>New York Times</i> bestselling author of <i>Every Summer After.<br></i></b><br>Fern Brookbanks has wasted far too much of her adult life thinking about Will Baxter. She spent just twenty-four hours in her early twenties with the aggravatingly attractive, idealistic artist, a chance encounter that spiraled into a daylong adventure in the city. The timing was wrong, but their connection was undeniable: they shared every secret, every dream, and made a pact to meet one year later. Fern showed up. Will didn’t.<br><br>At thirty-two, Fern’s life doesn’t look at all how she once imagined it would. Instead of living in the city, Fern’s back home, running her mother’s lakeside resort—something she vowed never to do. The place is in disarray, her ex-boyfriend’s the manager, and Fern doesn’t know where to begin.<br><br>She needs a plan—a lifeline. To her surprise, it comes in the form of Will, who arrives nine years too late, with a suitcase in tow and an offer to help on his lips. Will may be the only person who understands what Fern’s going through. But how could she possibly trust this expensive-suit wearing mirage who seems nothing like the young man she met all those years ago. Will is hiding something, and Fern’s not sure she wants to know what it is. <br><br>But ten years ago, Will Baxter rescued Fern. Can she do the same for him?	
43	UGLY LOVE	1476753180	9781476753188	<b>From Colleen Hoover, the #1 <i>New York Times</i> bestselling author of <i>It Starts with Us</i> and <i>It Ends with Us, </i>a<i> </i>heart-wrenching love story that proves attraction at first sight can be messy. </b><br><br>When Tate Collins meets airline pilot Miles Archer, she doesn't think it's love at first sight. They wouldn’t even go so far as to consider themselves friends. The only thing Tate and Miles have in common is an undeniable mutual attraction. Once their desires are out in the open, they realize they have the perfect set-up. He doesn’t want love, she doesn’t have time for love, so that just leaves the sex. Their arrangement could be surprisingly seamless, as long as Tate can stick to the only two rules Miles has for her.<br> <br>Never ask about the past. <br> Don’t expect a future.<br> <br>They think they can handle it, but realize almost immediately they can’t handle it at all.<br> <br>Hearts get infiltrated. <br> Promises get broken. <br> Rules get shattered.<br> Love gets ugly.	
11	THE COVENANT OF WATER	0802162177	9780802162175	<p><b>From the <i>New York Times</i>-bestselling author of <i>Cutting for Stone </i>comes a stunning and magisterial epic of love, faith, and medicine, set in Kerala, South India, and following three generations of a family seeking the answers to a strange secret</b></p> <p><i>The Covenant of Water </i>is the long-awaited new novel by Abraham Verghese, the author of the major word-of-mouth bestseller <i>Cutting for Stone</i>, which has sold over 1.5 million copies in the United States alone and remained on the <i>New York Times </i>bestseller list for over two years.</p> <p>Spanning the years 1900 to 1977, <i>The Covenant of Water </i>is set in Kerala, on South India's Malabar Coast, and follows three generations of a family that suffers a peculiar affliction: in every generation, at least one person dies by drowning--and in Kerala, water is everywhere. At the turn of the century, a twelve-year-old girl from Kerala's long-existing Christian community, grieving the death of her father, is sent by boat to her wedding, where she will meet her forty-year-old husband for the first time. From this unforgettable new beginning, the young girl--and future matriarch, known as Big Ammachi--will witness unthinkable changes over the span of her extraordinary life, full of joy and triumph as well as hardship and loss, her faith and love the only constants.</p> <p>A shimmering evocation of a bygone India and of the passage of time itself, <i>The Covenant of Water </i>is a hymn to progress in medicine and to human understanding, and a humbling testament to the difficulties undergone by past generations for the sake of those alive today. It is one of the most masterful literary novels published in recent years.</p>	
12	THE LAST THING HE TOLD ME	1501171356	9781501171352	<b>The perfect gift for Mother’s Day! Don’t miss the #1 <i>New York Times </i>bestselling blockbuster and Reese Witherspoon Book Club Pick that’s sold over 2 million copies—now an Apple TV+ Limited series starring Jennifer Garner!</b><br> <br><b>The “page-turning, exhilarating” (<i>PopSugar</i>) and “heartfelt thriller” (<i>Real Simple</i>) about a woman who thinks she’s found the love of her life—until he disappears.</b><br><br>Before Owen Michaels disappears, he smuggles a note to his beloved wife of one year: <i>Protect her</i>. Despite her confusion and fear, Hannah Hall knows exactly to whom the note refers—Owen’s sixteen-year-old daughter, Bailey. Bailey, who lost her mother tragically as a child. Bailey, who wants absolutely nothing to do with her new stepmother.<br> <br>As Hannah’s increasingly desperate calls to Owen go unanswered, as the FBI arrests Owen’s boss, as a US marshal and federal agents arrive at her Sausalito home unannounced, Hannah quickly realizes her husband isn’t who he said he was. And that Bailey just may hold the key to figuring out Owen’s true identity—and why he really disappeared.<br> <br>Hannah and Bailey set out to discover the truth. But as they start putting together the pieces of Owen’s past, they soon realize they’re also building a new future—one neither of them could have anticipated.<br> <br>With its breakneck pacing, dizzying plot twists, and evocative family drama, <i>The Last Thing He Told Me</i> is a “page-turning, exhilarating, and unforgettable” (<i>PopSugar</i>) suspense novel.	
13	SIMPLY LIES	1538750635	9781538750636	<p><b>From the #1 <i>New York Times</i> bestselling author of <i>The 6:20 Man</i> comes a twisting new psychological thriller in which two women--one a former detective, the other a dangerous con artist--go head-to-head in an electrifying game of cat and mouse.</b><br> <br> <br> Mickey Gibson, single mother and former detective, leads a hectic life similar to that of many moms: juggling the demands of her two small children with the tasks of her job working remotely for ProEye, a global investigation company that hunts down wealthy tax and credit cheats. </p> <p>When Mickey gets a call from a colleague named Arlene Robinson, she thinks nothing of Arlene's unusual request for her to go inventory the vacant home of an arms dealer who cheated ProEye's clients and fled. That is, until she arrives at the mansion to discover a dead body in a secret room--and that nothing is as it seems. </p> <p>Not only does the arms dealer not exist but the murder victim turns out to be Harry Langhorne, a man with mob ties who used to be in Witness Protection. What's more, no one named Arlene Robinson works at ProEye. </p> <p>In the blink of an eye, Gibson has become a prime suspect in a murder investigation--and now her job is also on the line until she proves that she was set up. Before long, Gibson is locked in a battle of wits with a brilliant woman with no name, a hidden past, and unknown motives--whose end game is as mysterious as it is deadly. </p>	
14	VERITY	1538724731	9781538724736	<b>#1 <i>New York Times</i></b><b> Bestseller</b><br> <br> <b><i>USA Today</i> Bestseller<br> <br> <i>The Globe and Mail</i> Bestseller<br> <br> <i>Publishers Weekly</i> Bestseller<br> <br> <br> <br> <i>Whose truth is the lie? </i>Stay up all night reading the sensational psychological thriller that has readers obsessed, from the #1 <i>New York Times</i> bestselling author of <i>It Ends With Us</i>.</b><br> <br> <br> <br> Lowen Ashleigh is a struggling writer on the brink of financial ruin when she accepts the job offer of a lifetime. Jeremy Crawford, husband of bestselling author Verity Crawford, has hired Lowen to complete the remaining books in a successful series his injured wife is unable to finish.<br> <br> <br> <br> Lowen arrives at the Crawford home, ready to sort through years of Verity's notes and outlines, hoping to find enough material to get her started. What Lowen doesn't expect to uncover in the chaotic office is an unfinished autobiography Verity never intended for anyone to read. Page after page of bone-chilling admissions, including Verity's recollection of the night her family was forever altered.<br> <br> <br> <br> Lowen decides to keep the manuscript hidden from Jeremy, knowing its contents could devastate the already grieving father. But as Lowen's feelings for Jeremy begin to intensify, she recognizes all the ways she could benefit if he were to read his wife's words. After all, no matter how devoted Jeremy is to his injured wife, a truth this horrifying would make it impossible for him to continue loving her.	
44	NEVER NEVER	1335004882	9781335004888	AN INSTANT #1 NEW YORK TIMES BESTSELLER!<br> <br> <br> <br> Never stop...Never forget...Just remember.<br> <br> <br> <br> Colleen Hoover, the #1 New York Times bestselling author of It Starts with Us joins forces with Tarryn Fisher, the New York Times bestselling author of The Wives. Together, they have created a gripping, twisty, romantic mystery unlike any other.<br> <br> <br> <br> Charlie Wynwood and Silas Nash have been best friends since they could walk. They've been in love since the age of fourteen. But as of this morning...they are complete strangers. Their first kiss, their first fight, the moment they fell in love...every memory has vanished. Now Charlie and Silas must work together to uncover the truth about what happened to them and why.<br> <br> <br> <br> But the more they learn about the couple they used to be...the more they question why they were ever together to begin with. Forgetting is terrifying, but remembering may be worse.<br> <br> <br> <br> Heart-stopping and utterly captivating, the complete Never Never series, now available in one volume, will leave readers breathless and believing in the power of love.<br> <br> <br> <br> <br> <br>	
15	HELLO BEAUTIFUL	0593243749	9780593243749	<b><b><i>NEW YORK TIMES </i>BESTSELLER • </b>OPRAH’S BOOK CLUB PICK • From the author of <i>Dear Edward</i> comes a “powerfully affecting” (<i>People</i>) family story that asks: Can love make a broken person whole?</b><br><br><b>“Another tender tearjerker . . . Napolitano chronicles life’s highs and lows with aching precision.”—<i>The Washington Post</i></b><br><br>William Waters grew up in a house silenced by tragedy, where his parents could hardly bear to look at him, much less love him—so when he meets the spirited and ambitious Julia Padavano in his freshman year of college, it’s as if the world has lit up around him. With Julia comes her family, as she and her three sisters are inseparable: Sylvie, the family’s dreamer, is happiest with her nose in a book; Cecelia is a free-spirited artist; and Emeline patiently takes care of them all. With the Padavanos, William experiences a newfound contentment; every moment in their house is filled with loving chaos.<br><br>But then darkness from William’s past surfaces, jeopardizing not only Julia’s carefully orchestrated plans for their future, but the sisters’ unshakeable devotion to one another. The result is a catastrophic family rift that changes their lives for generations. Will the loyalty that once rooted them be strong enough to draw them back together when it matters most?<br><br>An exquisite homage to Louisa May Alcott’s timeless classic, <i>Little Women</i>, <i>Hello Beautiful</i> is a profoundly moving portrait of what is possible when we choose to love someone not in spite of who they are, but because of it.	
16	SPARE	0593593804	9780593593806	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • Discover the global phenomenon that tells an unforgettable story of love, loss, and healing.<br><br>“Compellingly artful . . . [a] blockbuster memoir.”—<i>The New Yorker</i><br><br></b>It was one of the most searing images of the twentieth century: two young boys, two princes, walking behind their mother’s coffin as the world watched in sorrow—and horror. As Princess Diana was laid to rest, billions wondered what Prince William and Prince Harry must be thinking and feeling—and how their lives would play out from that point on.<br><br>For Harry, this is that story at last.<br><br>Before losing his mother, twelve-year-old Prince Harry was known as the carefree one, the happy-go-lucky Spare to the more serious Heir. Grief changed everything. He struggled at school, struggled with anger, with loneliness—and, because he blamed the press for his mother’s death, he struggled to accept life in the spotlight.<br><br>At twenty-one, he joined the British Army. The discipline gave him structure, and two combat tours made him a hero at home. But he soon felt more lost than ever, suffering from post-traumatic stress and prone to crippling panic attacks. Above all, he couldn’t find true love. <br><br>Then he met Meghan. The world was swept away by the couple’s cinematic romance and rejoiced in their fairy-tale wedding. But from the beginning, Harry and Meghan were preyed upon by the press, subjected to waves of abuse, racism, and lies. Watching his wife suffer, their safety and mental health at risk, Harry saw no other way to prevent the tragedy of history repeating itself but to flee his mother country. Over the centuries, leaving the Royal Family was an act few had dared. The last to try, in fact, had been his mother. . . .<br><br>For the first time, Prince Harry tells his own story, chronicling his journey with raw, unflinching honesty. A landmark publication, <i>Spare</i> is full of insight, revelation, self-examination, and hard-won wisdom about the eternal power of love over grief.	
17	THE WAGER	0385534264	9780385534260	<b>From the #1 <i>New York Times</i> bestselling author of <i>Killers of the Flower Moon</i>, a page-turning story of shipwreck, survival, and savagery, culminating in a court martial that reveals a shocking truth. With the twists and turns of a thriller Grann unearths the deeper meaning of the events on the <i>Wager</i>, showing that it was not only the captain and crew who ended up on trial, but the very idea of empire.</b><br><br>On January 28, 1742, a ramshackle vessel of patched-together wood and cloth washed up on the coast of Brazil. Inside were thirty emaciated men, barely alive, and they had an extraordinary tale to tell. They were survivors of His Majesty’s Ship the Wager, a British vessel that had left England in 1740 on a secret mission during an imperial war with Spain. While the Wager had been chasing a Spanish treasure-filled galleon known as “the prize of all the oceans,” it had wrecked on a desolate island off the coast of Patagonia. The men, after being marooned for months and facing starvation, built the flimsy craft and sailed for more than a hundred days, traversing 2500 miles of storm-wracked seas. They were greeted as heroes.<br><br>But then ... six months later, another, even more decrepit craft landed on the coast of Chile. This boat contained just three castaways, and they told a very different story. The thirty sailors who landed in Brazil were not heroes – they were mutineers. The first group responded with countercharges of their own, of a tyrannical and murderous senior officer and his henchmen. It became clear that while stranded on the island the crew had fallen into anarchy, with warring factions fighting for dominion over the barren wilderness. As accusations of treachery and murder flew, the Admiralty convened a court martial to determine who was telling the truth. The stakes were life-and-death—for whomever the court found guilty could hang.<br><br><i>The Wager</i> is a grand tale of human behavior at the extremes told by one of our greatest nonfiction writers. Grann’s recreation of the hidden world on a British warship rivals the work of Patrick O’Brian, his portrayal of the castaways’ desperate straits stands up to the classics of survival writing such as <i>The Endurance</i>, and his account of the court martial has the savvy of a Scott Turow thriller. As always with Grann’s work, the incredible twists of the narrative hold the reader spellbound.	
18	THE DADDY DIARIES	1250890926	9781250890924	<p><b><i>New York Times </i>bestselling author Andy Cohen goes from bottle service to baby bottles in </b><b>a hilarious, heartwarming, and name-dropping account of the most important year of his life.</b><br><br>Andy Cohen has taken on the most important job of his life—father— and boy (and girl!) does he have a lot to say about it!<br><br>One of Andy Cohen’s most momentous years starts off with a hangover the morning after an<i> epic</i> New Year’s Eve broadcast. But Andy doesn’t have time to dwell on the drama, as his role as media mogul is now matched with the responsibilities, joys, and growing pains of parenthood.<br><br>This fast-paced, mile-a-minute look behind the scenes of living the so-called glamorous life in Manhattan now takes firm aim at life at home. With a three-year-old son, Ben, and a daughter, Lucy, born in May, stories of late-night parties are replaced by early mornings with Ben, drama at the play-ground, and the musings of a single dad trying to navigate having it all. All this is set against the backdrop of constant Housewives drama, hijinks behind the scenes at <i>Watch What Happens Live,</i> a revolving door of famous faces, and a worried mother (and newly minted grandmother) in St. Louis.<br><br>Buckle up, bottle up, and get ready for a laugh-out-loud and surprisingly poignant look at the ways in which family changes everything and the superficial gets very real. Watch what happens!</p>	
19	THE LIGHT WE CARRY	0593237463	9780593237465	<b><b>#1 <i>NEW YORK TIMES </i>AND <i>USA TODAY</i> BESTSELLER • ONE OF <i>TIME</i>’S 100 MUST-READ BOOKS OF 2022 • </b>In an inspiring follow-up to her critically acclaimed, #1 bestselling memoir <i>Becoming, </i>former First Lady Michelle Obama shares practical wisdom and powerful strategies for staying hopeful and balanced in today’s highly uncertain world. </b><br>  <br>There may be no tidy solutions or pithy answers to life’s big challenges, but Michelle Obama believes that we can all locate and lean on a set of tools to help us better navigate change and remain steady within flux. In<i> The Light We Carry,</i> she opens a frank and honest dialogue with readers, considering the questions many of us wrestle with: How do we build enduring and honest relationships? How can we discover strength and community inside our differences? What tools do we use to address feelings of self-doubt or helplessness? What do we do when it all starts to feel like too much?<br> <br>Michelle Obama offers readers a series of fresh stories and insightful reflections on change, challenge, and power, including her belief that when we light up for others, we can illuminate the richness and potential of the world around us, discovering deeper truths and new pathways for progress. Drawing from her experiences as a mother, daughter, spouse, friend, and First Lady, she shares the habits and principles she has developed to successfully adapt to change and overcome various obstacles—the earned wisdom that helps her continue to “become.” She details her most valuable practices, like “starting kind,” “going high,” and assembling a “kitchen table” of trusted friends and mentors. With trademark humor, candor, and compassion, she also explores issues connected to race, gender, and visibility, encouraging readers to work through fear, find strength in community, and live with boldness.<br> <br>“When we are able to recognize our own light, we become empowered to use it,” writes Michelle Obama. A rewarding blend of powerful stories and profound advice that will ignite conversation, <i>The Light We Carry</i> inspires readers to examine their own lives, identify their sources of gladness, and connect meaningfully in a turbulent world.	
20	THE BODY KEEPS THE SCORE	0143127748	9780143127741	<b>#1 <i>New York Times </i>bestseller<br><br>“Essential reading for anyone interested in understanding and treating traumatic stress and the scope of its impact on society.” —Alexander McFarlane, Director of the Centre for Traumatic Stress Studies<br><br>A pioneering researcher transforms our understanding of trauma and offers a bold new paradigm for healing in this <b><b><b><i>New York Times</i> bestseller</b></b></b></b><br> <br>Trauma is a fact of life. Veterans and their families deal with the painful aftermath of combat; one in five Americans has been molested; one in four grew up with alcoholics; one in three couples have engaged in physical violence. Dr. Bessel van der Kolk, one of the world’s foremost experts on trauma, has spent over three decades working with survivors. In <i>The Body Keeps the Score</i>, he uses recent scientific advances to show how trauma literally reshapes both body and brain, compromising sufferers’ capacities for pleasure, engagement, self-control, and trust. He explores innovative treatments—from neurofeedback and meditation to sports, drama, and yoga—that offer new paths to recovery by activating the brain’s natural neuroplasticity. Based on Dr. van der Kolk’s own research and that of other leading specialists, <i>The Body Keeps the Score </i>exposes the tremendous power of our relationships both to hurt and to heal—and offers new hope for reclaiming lives.	
21	OUTLIVE	0593236599	9780593236598	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • A groundbreaking manifesto on living better and longer that challenges the conventional medical thinking on aging and reveals a new approach to preventing chronic disease and extending long-term health, from a visionary physician and leading longevity expert</b><br> <br><b>“One of the most important books you’ll ever read.”—Steven D. Levitt, <i>New York Times </i>bestselling author of <i>Freakonomics</i></b><br> <br>Wouldn’t you like to live longer? And better? In this operating manual for longevity, Dr. Peter Attia draws on the latest science to deliver innovative nutritional interventions, techniques for optimizing exercise and sleep, and tools for addressing emotional and mental health.<br> <br>For all its successes, mainstream medicine has failed to make much progress against the diseases of aging that kill most people: heart disease, cancer, Alzheimer’s disease, and type 2 diabetes. Too often, it intervenes with treatments too late to help, prolonging lifespan at the expense of healthspan, or quality of life. Dr. Attia believes we must replace this outdated framework with a personalized, proactive strategy for longevity, one where we take action now, rather than waiting.<br> <br>This is not “biohacking,” it’s science: a well-founded strategic and tactical approach to extending lifespan while also improving our physical, cognitive, and emotional health. Dr. Attia’s aim is less to tell you <i>what to do</i> and more to help you learn <i>how to think</i> about long-term health, in order to create the best plan for you as an individual. In <i>Outlive</i>, readers will discover:<br> <br>• Why the cholesterol test at your annual physical doesn’t tell you enough about your actual risk of dying from a heart attack.<br>• That you may already suffer from an extremely common yet underdiagnosed liver condition that could be a precursor to the chronic diseases of aging.<br>• Why exercise is the most potent pro-longevity “drug”—and how to begin training for the “Centenarian Decathlon.”<br>• Why you should forget about diets, and focus instead on <i>nutritional biochemistry, </i>using technology and data to personalize your eating pattern.<br>• Why striving for physical health and longevity, but ignoring emotional health, could be the ultimate curse of all.<br> <br>Aging and longevity are far more malleable than we think; our fate is not set in stone. With the right roadmap, you can plot a different path for your life, one that lets you outlive your genes to make each decade better than the one before.	
22	I'M GLAD MY MOM DIED	1982185821	9781982185824	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER</b><br> <b>#1 INTERNATIONAL BESTSELLER</b><br> <br><b>A heartbreaking and hilarious memoir by <i>iCarly </i>and <i>Sam & Cat </i>star Jennette McCurdy about her struggles as a former child actor—including eating disorders, addiction, and a complicated relationship with her overbearing mother—and how she retook control of her life. </b><br><br>Jennette McCurdy was six years old when she had her first acting audition. Her mother’s dream was for her only daughter to become a star, and Jennette would do anything to make her mother happy. So she went along with what Mom called “calorie restriction,” eating little and weighing herself five times a day. She endured extensive at-home makeovers while Mom chided, “Your eyelashes are invisible, okay? You think Dakota Fanning doesn’t tint hers?” She was even showered by Mom until age sixteen while sharing her diaries, email, and all her income.<br> <br>In <i>I’m Glad My Mom Died</i>, Jennette recounts all this in unflinching detail—just as she chronicles what happens when the dream finally comes true. Cast in a new Nickelodeon series called <i>iCarly</i>, she is thrust into fame. Though Mom is ecstatic, emailing fan club moderators and getting on a first-name basis with the paparazzi (“Hi Gale!”), Jennette is riddled with anxiety, shame, and self-loathing, which manifest into eating disorders, addiction, and a series of unhealthy relationships. These issues only get worse when, soon after taking the lead in the <i>iCarly</i> spinoff <i>Sam & Cat</i> alongside Ariana Grande, her mother dies of cancer. Finally, after discovering therapy and quitting acting, Jennette embarks on recovery and decides for the first time in her life what she really wants.<br> <br>Told with refreshing candor and dark humor, <i>I’m Glad My Mom Died</i> is an inspiring story of resilience, independence, and the joy of shampooing your own hair.	
23	CRYING IN H MART	1984898957	9781984898951	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • From the indie rock sensation known as Japanese Breakfast, an unforgettable memoir about family, food, grief, love, and growing up Korean American—“in losing her mother and cooking to bring her back to life, Zauner became herself” (NPR). • CELEBRATING OVER ONE YEAR ON THE <i>NEW YORK TIMES</i> BESTSELLER LIST</b><br><br>In this exquisite story of family, food, grief, and endurance, Michelle Zauner proves herself far more than a dazzling singer, songwriter, and guitarist. With humor and heart, she tells of growing up one of the few Asian American kids at her school in Eugene, Oregon; of struggling with her mother's particular, high expectations of her; of a painful adolescence; of treasured months spent in her grandmother's tiny apartment in Seoul, where she and her mother would bond, late at night, over heaping plates of food. <br><br>As she grew up, moving to the East Coast for college, finding work in the restaurant industry, and performing gigs with her fledgling band--and meeting the man who would become her husband--her Koreanness began to feel ever more distant, even as she found the life she wanted to live. It was her mother's diagnosis of terminal cancer, when Michelle was twenty-five, that forced a reckoning with her identity and brought her to reclaim the gifts of taste, language, and history her mother had given her.<br><br>Vivacious and plainspoken, lyrical and honest, Zauner's voice is as radiantly alive on the page as it is onstage. Rich with intimate anecdotes that will resonate widely, and complete with family photos, <i>Crying in H Mart</i> is a book to cherish, share, and reread.	
24	LOOK FOR ME THERE	0785291814	9780785291817	<p>In Look for Me There, Luke Russert traverses terrain both physical and deeply personal. On his journey to some of the world's most stunning destinations, he visits the internal places of grief, family, faith, ambition, and purpose--with intense self-reflection, honesty, and courage."--Savannah Guthrie, coanchor of Today</p><p>"Look for me there," news legend Tim Russert would tell his son, Luke, when confirming a pickup spot at an airport, sporting event, or rock concert. After Tim died unexpectedly, Luke kept looking for his father, following in Tim's footsteps and carving out a highly successful career at NBC News. After eight years covering politics on television, Luke realized he had no good answer as to why he was chasing his father's legacy. As the son of two accomplished parents--his mother is journalist Maureen Orth of Vanity Fair--Luke felt the pressure of high expectations but suddenly decided to leave the familiar path behind.</p><p>Instead, Luke set out on his own to find answers. What began as several open-ended months of travel to decompress and reassess morphed into a three-plus-year odyssey across six continents to discover the world and, ultimately, to find himself.</p><p>Chronicling the important lessons and historical understandings Luke discovered from his travels, Look for Me There is both the vivid narrative of that journey and the emotional story of a young man taking charge of his life, reexamining his relationship with his parents, and finally grieving his larger-than-life father, who died too young. </p><p>For anyone uncertain about the direction of their life or unsure of how to move forward after a loss, Look for Me There is a poignant reflection that offers encouragement to examine our choices, take risks, and discover our truest selves.</p>	
25	WALKING WITH SAM	1538709201	9781538709207	<b>An intimate, funny, and poignant travel memoir following <i>New York Times</i> bestselling author and actor Andrew McCarthy as he walks the Camino de Santiago with his son Sam.</b><br> <br> <b> </b><br> <br> When Andrew McCarthy's eldest son began to take his first steps into adulthood, McCarthy found himself wishing time would slow down. Looking to create a more meaningful connection with Sam before he fled the nest, as well as recreate his own life-altering journey decades before, McCarthy decided the two of them should set out on a trek like few others: 500 miles across Spain's Camino de Santiago.<br> <br> <br> <br> Over the course of the journey, the pair traversed an unforgiving landscape, having more honest conversations in five weeks than they'd had in the preceding two decades. Discussions of divorce, the trauma of school, McCarthy's difficult relationship with his own father, fame, and Flaming Hot Cheetos threatened to either derail their relationship or cement it. <i>Walking With Sam</i> captures this intimate, candid and hopeful expedition as the father son duo travel across the country and towards one another.	
26	KILLERS OF THE FLOWER MOON	0307742482	9780307742483	<b><b>#1 <i>NEW YORK TIMES</i> BESTSELLER • A twisting, haunting true-life murder mystery about one of the most monstrous crimes in American history, from the author of <i>The Wager</i> and <i>The Lost City of Z, </i>“one of the preeminent adventure and true-crime writers working today."—<i>New York Magazine • </i>NATIONAL BOOK AWARD FINALIST <i>• </i>SOON TO BE A MAJOR MOTION PICTURE<br><br> “A shocking whodunit…What more could fans of true-crime thrillers ask?”—<i>USA Today</i></b><br><br>“A masterful work of literary journalism crafted with the urgency of a mystery.” —<i>The Boston Globe</i></b><br><br>In the 1920s, the richest people per capita in the world were members of the Osage Nation in Oklahoma. After oil was discovered beneath their land, the Osage rode in chauffeured automobiles, built mansions, and sent their children to study in Europe.<br><br>Then, one by one, the Osage began to be killed off. The family of an Osage woman, Mollie Burkhart, became a prime target. One of her relatives was shot. Another was poisoned. And it was just the beginning, as more and more Osage were dying under mysterious circumstances, and many of those who dared to investigate the killings were themselves murdered. <br><br>As the death toll rose, the newly created FBI took up the case, and the young director, J. Edgar Hoover, turned to a former Texas Ranger named Tom White to try to unravel the mystery. White put together an undercover team, including a Native American agent who infiltrated the region, and together with the Osage began to expose one of the most chilling conspiracies in American history.<br><br><b>Look for David Grann’s latest <b>#1 <i>New York Times</i> bestselling </b>book, <i>The Wager</i>!</b>	
46	HEART BONES	1668021919	9781668021910	<b><b>From the #1 <i>New York Times</i> bestselling author of <i>It Ends with Us</i> and <i>It Starts with Us</i>!</b><br> <br><b>Moving, passionate, and unforgettable, Colleen Hoover's novel follows two young adults from completely different backgrounds embarking on a tentative romance, unaware of what the future holds.</b></b><br><br>After a childhood filled with poverty and neglect, Beyah Grim finally has her hard-earned ticket out of Kentucky with a full ride to Penn State. But two months before she’s finally free to change her life for the better, an unexpected death leaves her homeless and forced to spend the remainder of her summer in Texas with a father she barely knows.<br> <br>Devastated and anxious for the summer to go by quickly, Beyah has no time or patience for Samson, the wealthy, brooding guy next door. Yet, the connection between them is too intense to ignore. But with their upcoming futures sending them to opposite ends of the country, the two decide to maintain only a casual summer fling. Too bad neither has any idea that a rip current is about to drag both their hearts out to sea.	
27	GREENLIGHTS	0593139135	9780593139134	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • <b>Discover the life-changing memoir that has inspired millions of readers through the Academy Award®–winning actor’s unflinching honesty, unconventional wisdom, and lessons learned the hard way about living with greater satisfaction.</b></b><br><b><br>“The No. 1 celebrity memoir of the past 10 years.”—<i>USA Today</i></b><br><br><b>“McConaughey’s book invites us to grapple with the lessons of his life as he did—and to see that the point was never to win, but to understand.”—Mark Manson, author of <i>The Subtle Art of Not Giving a F*ck</i></b><br><br>I’ve been in this life for fifty years, been trying to work out its riddle for forty-two, and been keeping diaries of clues to that riddle for the last thirty-five. Notes about successes and failures, joys and sorrows, things that made me marvel, and things that made me laugh out loud. How to be fair. How to have less stress. How to have fun. How to hurt people less. How to get hurt less. How to be a good man. How to have meaning in life. How to be more me.<br> <br>Recently, I worked up the courage to sit down with those diaries. I found stories I experienced, lessons I learned and forgot, poems, prayers, prescriptions, beliefs about what matters, some great photographs, and a whole bunch of bumper stickers. I found a reliable theme, an approach to living that gave me more satisfaction, at the time, and still: If you know how, and when, to deal with life’s challenges—how to <i>get relative with the inevitable</i>—you can enjoy a state of success I call “catching greenlights.”<br> <br>So I took a one-way ticket to the desert and wrote this book: an album, a record, a story of my life so far. This is fifty years of my sights and seens, felts and figured-outs, cools and shamefuls. Graces, truths, and beauties of brutality. Getting away withs, getting caughts, and getting wets while trying to dance between the raindrops.<br> <br>Hopefully, it’s medicine that tastes good, a couple of aspirin instead of the infirmary, a spaceship to Mars without needing your pilot’s license, going to church without having to be born again, and laughing through the tears.<br> <br>It’s a love letter. <b>To life.</b><br> <br>It’s also a guide to catching more greenlights—and to realizing that the yellows and reds eventually turn green too.<br> <br>Good luck.<br><br><b>The short dust jacket included with this hardcover edition is an intentional design choice.</b>	
28	BRAIDING SWEETGRASS	1571313567	9781571313560	"An inspired weaving of indigenous knowledge, plant science, and personal narrative from a distinguished professor of science and a Native American whose previous book, Gathering Moss, was awarded the John Burroughs Medal for outstanding nature writing. As a botanist and professor of plant ecology, Robin Wall Kimmerer has spent a career learning how to ask questions of nature using the tools of science. As a Potawatomi woman, she learned from elders, family, and history that the Potawatomi, as well as a majority of other cultures indigenous to this land, consider plants and animals to be our oldest teachers. In Braiding Sweetgrass, Kimmerer brings these two lenses of knowing together to reveal what it means to see humans as "the younger brothers of creation." As she explores these themes she circles toward a central argument: the awakening of a wider ecological consciousness requires the acknowledgement and celebration of our reciprocal relationship with the world. Once we begin to listen for the languages of other beings, we can begin to understand the innumerable life-giving gifts the world provides us and learn to offer our thanks, our care, and our own gifts in return"--	
29	ALL ABOUT LOVE	0060959479	9780060959470	<p>"The word "love" is most often defined as a noun, yet...we would all love to better if we used it as a verb," writes bell hooks as she comes out fighting and on fire in <i>All About Love</i>. Here, at her most provacative and intensely personel, the renowned scholar, cultural critic, and feminist skewers our view of love as romance. In its place she offers a proactive new ethic for a people and a society bereft with lovelessness.</p><p>As bell hooks uses her incisive mind and razor-sharp pen to explode th question "What is love?" her answers strike at both the mind and heart. In thirteen concise chapters, hooks examines her own search for emotional connection and society's failure to provide a model for learning to love. Razing the cultural paradigm that the ideal love is infused with sex and desire, she provides a new path to love that is sacred, redemptive, and healing for the individuals and for a nation. <i>The Utne Reader </i>declared bell hooks one of the "100 Visionaries Who Can Change Your Life." <i>All About Love</i> is a powerful affirmation of just how profoundly she can.</p>	
30	LESSONS LEARNED AND CHERISHED	1368095054	9781368095051	<b>A giftable collection of essays from celebrity contributors celebrating the great work of teachers or a teacher they admire, curated by ABC journalist Deborah Roberts. Contributors include Oprah Winfrey, Spike Lee, Jenna Bush Hager, Robin Roberts, Brooke Shields, Octavia Spencer, Misty Copeland, among others.</b><br><br>Everyone can name a teacher that had an impact on their life. Educators not only open our minds to new ideas, but they also help us recognize our potential and our passions. However, they rarely get credit for the life changing work they do, and they may not have any idea how that work can impact a student all the way into adulthood. <br><br><br>In <i>The Teacher Who Changed My Life</i>, renowned ABC journalist Deborah Roberts curates a collection of essays, letters, and musings from celebrity friends and colleagues alike that share how teachers changed them and helped them get to where they are today.	
31	HELLO BEAUTIFUL	0593243730	9780593243732	<b><b><i>NEW YORK TIMES </i>BESTSELLER • </b>OPRAH’S BOOK CLUB PICK • From the author of <i>Dear Edward</i> comes a “powerfully affecting” (<i>People</i>) family story that asks: Can love make a broken person whole?</b><br><br><b>“Another tender tearjerker . . . Napolitano chronicles life’s highs and lows with aching precision.”—<i>The Washington Post</i></b><br><br>William Waters grew up in a house silenced by tragedy, where his parents could hardly bear to look at him, much less love him—so when he meets the spirited and ambitious Julia Padavano in his freshman year of college, it’s as if the world has lit up around him. With Julia comes her family, as she and her three sisters are inseparable: Sylvie, the family’s dreamer, is happiest with her nose in a book; Cecelia is a free-spirited artist; and Emeline patiently takes care of them all. With the Padavanos, William experiences a newfound contentment; every moment in their house is filled with loving chaos.<br><br>But then darkness from William’s past surfaces, jeopardizing not only Julia’s carefully orchestrated plans for their future, but the sisters’ unshakeable devotion to one another. The result is a catastrophic family rift that changes their lives for generations. Will the loyalty that once rooted them be strong enough to draw them back together when it matters most?<br><br>An exquisite homage to Louisa May Alcott’s timeless classic, <i>Little Women</i>, <i>Hello Beautiful</i> is a profoundly moving portrait of what is possible when we choose to love someone not in spite of who they are, but because of it.	
32	THE WEDDING PLANNER	1984821776	9781984821775	<b>In this captivating novel from #1 <i>New York Times</i> bestselling author Danielle Steel, a wildly successful, unmarried wedding planner leads her clients to happily ever after.</b><br><br>Faith Ferguson is New York’s most in-demand wedding planner, an arbiter of taste for elegant affairs, lavish ceremonies, and exclusive fêtes. She appreciates a simple celebration as much as a dazzling event, for she knows that a dream wedding is not necessarily the most expensive one.<br><br> As much as Faith enjoys her work, her two failed engagements leave her with no desire to get married herself. She finds fulfillment in her close relationship with her twin sister, Hope, her role as a mentor for her assistant, Violet, and her career. <br><br> This year, new clients have flocked to her, and she signs up an extravagant reception, a mid-sized gathering, and an intimate soirée, in addition to her mother’s next marriage and Violet’s modest ceremony. Faith finds herself forming bonds with her new clients and their loved ones—most notably the handsome brother of one of her grooms.<br><br> But weddings are not always all champagne and roses, and in no time, Faith is grappling with private quarrels, unplanned pregnancies, family scandals, dark secrets, and the possibility of cancelled ceremonies. Through her own journey, Faith will prove once and for all that there is not just one path to happily ever after.<br><br> In <i>The Wedding Planner,</i> Danielle Steel presents an enchanting story about the winding road to love and the many ways to find joy while staying true to oneself.	
33	TOMORROW, AND TOMORROW, AND TOMORROW	0593321200	9780593321201	<b><i>NEW YORK TIMES </i>BEST SELLER <b>• </b>In this exhilarating novel by the best-selling author of <i>The Storied Life of A. J. Fikry</i> two friends—often in love, but never lovers—come together as creative partners in the world of video game design, where success brings them fame, joy, tragedy, duplicity, and, ultimately, a kind of immortality.</b><br><br><b>"Utterly brilliant. In this sweeping, gorgeously written novel, Gabrielle Zevin charts the beauty, tenacity, and fragility of human love and creativity.... One of the best books I've ever read." —John Green</b><br>  <br> On a bitter-cold day, in the December of his junior year at Harvard, Sam Masur exits a subway car and sees, amid the hordes of people waiting on the platform, Sadie Green. He calls her name. For a moment, she pretends she hasn’t heard him, but then, she turns, and a game begins: a legendary collaboration that will launch them to stardom. These friends, intimates since childhood, borrow money, beg favors, and, before even graduating college, they have created their first blockbuster,<i> Ichigo</i>. Overnight, the world is theirs. Not even twenty-five years old, Sam and Sadie are brilliant, successful, and rich, but these qualities won’t protect them from their own creative ambitions or the betrayals of their hearts.<br>  <br> Spanning thirty years, from Cambridge, Massachusetts, to Venice Beach, California, and lands in between and far beyond, Gabrielle Zevin’s <i>Tomorrow, and Tomorrow, and Tomorrow</i> is a dazzling and intricately imagined novel that examines the multifarious nature of identity, disability, failure, the redemptive possibilities in play, and above all, our need to connect: to be loved and to love. Yes, it is a love story, but it is not one you have read before.	
34	THE SECRET BOOK OF FLORA LEA	1668011832	9781668011836	<b>When a woman discovers a rare book that has connections to her past, long-held secrets about her missing sister and their childhood spent in the English countryside during World War II are revealed.</b><br><br>In the war-torn London of 1939, fourteen-year-old Hazel and five-year-old Flora are evacuated to a rural village to escape the horrors of the Second World War. Living with the kind Bridie Aberdeen and her teenage son, Harry, in a charming stone cottage along the River Thames, Hazel fills their days with walks and games to distract her young sister, including one that she creates for her sister and her sister alone—a fairy tale about a magical land, a secret place they can escape to that is all their own.<br> <br>But the unthinkable happens when young Flora suddenly vanishes while playing near the banks of the river. Shattered, Hazel blames herself for her sister’s disappearance, and she carries that guilt into adulthood as a private burden she feels she deserves.<br> <br>Twenty years later, Hazel is in London, ready to move on from her job at a cozy rare bookstore to a career at Sotheby’s. With a charming boyfriend and her elegantly timeworn Bloomsbury flat, Hazel’s future seems determined. But her tidy life is turned upside down when she unwraps a package containing an illustrated book called <i>Whisperwood and the River of Stars</i>. Hazel never told a soul about the imaginary world she created just for Flora. Could this book hold the secrets to Flora’s disappearance? Could it be a sign that her beloved sister is still alive after all these years?<br> <br>As Hazel embarks on a feverish quest, revisiting long-dormant relationships and bravely opening wounds from her past, her career and future hang in the balance. An astonishing twist ultimately reveals the truth in this transporting and refreshingly original novel about the bond between sisters, the complications of conflicted love, and the enduring magic of storytelling.	
35	THINGS I WISH I TOLD MY MOTHER	0316406201	9780316406208	<p><b>"Every mother and daughter should have conversations that change their lives. This book will win your heart!" -Elin Hilderbrand, author of <i>The Hotel Nantucket</i></b><br> <br> <br> <br> A mother and daughter on vacation in Paris unpack a lifetime of secrets and hopes--with a giant Pattersonian twist at the end!<br> <br> <br> <br> <b>Every daughter has her own distinctive voice, her inimitable style, and her secrets.</b><br> <br> Laurie is an artist, a collector of experiences. She travels the world with a worn beige duffel bag.<br> <br> <br> <br> <b>Every mother has her own distinctive voice, her inimitable style, and her secrets.</b><br> <br> "Dr. Liz," Laurie's mother, is an elegant perfectionist who travels the world with a matched set of suitcases.</p> <p>When Laurie surprises her mother with a dream vacation, it brings an unexpected sparkle to her eyes. So begins <i>Things I Wish I Told My Mother</i>. You will wish this novel never ends.</p>	
36	REMARKABLY BRIGHT CREATURES	0063204150	9780063204157	<p>AN INSTANT NEW YORK TIMES BESTSELLER</p><p>A Read With Jenna Today Show Book Club Pick!</p><p>NAMED A BEST BOOK OF SUMMER by: Chicago Tribune * The View * Southern Living * USA Today</p><p>"Remarkably Bright Creatures [is] an ultimately feel-good but deceptively sensitive debut. . . . Memorable and tender." -- Washington Post </p><p>For fans of A Man Called Ove, a charming, witty and compulsively readable exploration of friendship, reckoning, and hope that traces a widow's unlikely connection with a giant Pacific octopus</p><p>After Tova Sullivan's husband died, she began working the night shift at the Sowell Bay Aquarium, mopping floors and tidying up. Keeping busy has always helped her cope, which she's been doing since her eighteen-year-old son, Erik, mysteriously vanished on a boat in Puget Sound over thirty years ago.</p><p>Tova becomes acquainted with curmudgeonly Marcellus, a giant Pacific octopus living at the aquarium. Marcellus knows more than anyone can imagine but wouldn't dream of lifting one of his eight arms for his human captors--until he forms a remarkable friendship with Tova.</p><p>Ever the detective, Marcellus deduces what happened the night Tova's son disappeared. And now Marcellus must use every trick his old invertebrate body can muster to unearth the truth for her before it's too late. </p><p>Shelby Van Pelt's debut novel is a gentle reminder that sometimes taking a hard look at the past can help uncover a future that once felt impossible.</p>	
45	THIS IS HOW YOU LOSE THE TIME WAR	1534430997	9781534430990	<b>“[An] exquisitely crafted tale...Part epistolary romance, part mind-blowing science fiction adventure, this dazzling story unfolds bit by bit, revealing layers of meaning as it plays with cause and effect, wildly imaginative technologies, and increasingly intricate wordplay...This short novel warrants multiple readings to fully unlock its complexities.” —<i>Publishers Weekly </i>(starred review). </b><br> <br> <b>From award-winning authors Amal El-Mohtar and Max Gladstone comes an enthralling, romantic novel spanning time and space about two time-traveling rivals who fall in love and must change the past to ensure their future. </b><br><br>Among the ashes of a dying world, an agent of the Commandment finds a letter. It reads: <i>Burn before reading.</i><br> <br>Thus begins an unlikely correspondence between two rival agents hellbent on securing the best possible future for their warring factions. Now, what began as a taunt, a battlefield boast, becomes something more. Something epic. Something romantic. Something that could change the past and the future.<br> <br>Except the discovery of their bond would mean the death of each of them. There’s still a war going on, after all. And someone has to win. That’s how war works, right?<br> <br>Cowritten by two beloved and award-winning sci-fi writers, <i>This Is How You Lose the Time War </i>is an epic love story spanning time and space.	
37	YOU CAN'T JOKE ABOUT THAT	0063270420	9780063270428	<p>What happens when we can't joke about some of the most important stuff in life?</p> <p>In a 2019 study, 40% of people reported censoring themselves out of fear that voicing their views would alienate them from the people they care about most. Those people should probably not read this book in public.</p> <p>In You Can't Joke About That, Kat Timpf shows why much of the way we talk about sensitive subjects is wrong. We've created all the wrong rules. We push ourselves into unnecessary conflicts when we should feel like we're all in this together. When someone says "you can't joke about that," what they really mean is "this is a subject that makes people sad or angry."</p> <p>Hilariously and movingly, Timpf argues that those subjects are actually the most important to joke about. She shows us we can find healing through humor regarding things you probably don't want to bring up in polite conversation, like traumatic break-ups, cancer, being broke, Dave Chappelle, rape jokes, aging, ostomy bags, religion, body image, dead moms, religion, the lab leak theory, transgender swimmers, gushing wounds, campus censorship, and bad Christmas presents. </p> <p>This book is Kat Timpf with her hair down, except since hers is mostly extensions, this book is Kat Timpf with her hair out. Read it because you want to get to know her better. Read it because it's the best book on free speech and comedy in a generation. Read it because you want to laugh out loud... even at the kind of stuff we're afraid to say out loud. Just read it, and you'll be glad you did.</p>	
38	IT. GOES. SO. FAST.	1250859859	9781250859853	<p><b>An Instant <i>New York Times </i>Bestseller</b><br><br>“This voice-driven, relatable, heartfelt and emotional story will make any parent tear up.”<br><b>—Good Morning America, “15 Delightful Books Perfect for Spring Reading”</b><br><b><i><br>Operating Instructions</i></b><b> meets Glennon Doyle in this new book by famed NPR reporter Mary Louise Kelly that is destined to become a classic—about the year before her son goes to college—and the joys, losses and surprises that happen along the way.</b><br><br>The time for do-overs is over.<br><br>Ever since she became a parent, Mary Louise Kelly has said “next year.” Next year will be the year she makes it to her son James’s soccer games (which are on weekdays at 4 p.m., right when she is on the air on NPR’s <i>All Things Considered</i>, talking to millions of listeners). Drive carpool for her son Alexander? Not if she wants to do that story about Ukraine and interview the secretary of state. Like millions of parents who wrestle with raising children while pursuing a career, she has never been cavalier about these decisions. The bargain she has always made with herself is this: this time I’ll get on the plane, and next year I’ll find a way to be there for the mom stuff.<br><br>Well, James and Alexander are now seventeen and fifteen, and a realization has overtaken Mary Louise: her older son will be leaving soon for college. There used to be years to make good on her promises; now, there are months, weeks, minutes. And with the devastating death of her beloved father, Mary Louise is facing act three of her life head-on.<br><br> Mary Louise is coming to grips with the reality every parent faces. Childhood has a definite expiration date. You have only so many years with your kids before they leave your house to build their own lives. It’s what every parent is supposed to want, what they raise their children to do. But it is bittersweet. Mary Louise is also dealing with the realities of having aging parents. This pivotal time brings with it the enormous questions of what you did right and what you did wrong.<br><br> This chronicle of her eldest child’s final year at home, of losing her father, as well as other curve balls thrown at her, is not a definitive answer―not for herself and certainly not for any other parent. But her questions, her issues, will resonate with every parent. And, yes, especially with mothers, who are judged more harshly by society and, more important, judge themselves more harshly. What would she do if she had to decide all over again?<br><br> Mary Louise’s thoughts as she faces the coming year will speak to anyone who has ever cared about a child or a parent. <i>It. Goes. So. Fast.</i> is honest, funny, poignant, revelatory, and immensely relatable.</p>	
39	A FEVER IN THE HEARTLAND	0735225265	9780735225268	<b><b>AN INSTANT <i>NEW YORK TIMES</i> BESTSELLER</b><br><br><b>"With narrative elan, Egan gives us a riveting saga of how a predatory con man became one of the most powerful people in 1920s America, Grand Dragon of the Ku Klux Klan, with a plan to rule the country—and how a grisly murder of a woman brought him down. Compelling and chillingly resonant with our own time." —Erik Larson, author of <i>The Splendid and the Vile</i></b><br><br>“Riveting…Egan is a brilliant researcher and lucid writer.” <b>—<i>Minneapolis Star Tribune</i></b><br><br>A historical thriller by the Pulitzer and National Book Award-winning author that tells the riveting story of the Klan's rise to power in the 1920s, the cunning con man who drove that rise, and the woman who stopped them.</b><br><br>The Roaring Twenties--the Jazz Age--has been characterized as a time of Gatsby frivolity. But it was also the height of the uniquely American hate group, the Ku Klux Klan. Their domain was not the old Confederacy, but the Heartland and the West. They hated Blacks, Jews, Catholics and immigrants in equal measure, and took radical steps to keep these people from the American promise. And the man who set in motion their takeover of great swaths of America was a charismatic charlatan named D.C. Stephenson.<br><br>Stephenson was a magnetic presence whose life story changed with every telling. Within two years of his arrival in Indiana, he’d become the Grand Dragon of the state and the architect of the strategy that brought the group out of the shadows – their message endorsed from the pulpits of local churches, spread at family picnics and town celebrations. Judges, prosecutors, ministers, governors and senators across the country all proudly proclaimed their membership. But at the peak of his influence, it was a seemingly powerless woman – Madge Oberholtzer – who would reveal his secret cruelties, and whose deathbed testimony finally brought the Klan to their knees.<br><br>A FEVER IN THE HEARTLAND marries a propulsive drama to a powerful and page-turning reckoning with one of the darkest threads in American history.	
40	THE LAST HONEST MAN	031656513X	9780316565134	<b>"Gripping ... a spectacular piece of reporting that reads like a spy novel with the eloquence of great history." </b>--<b>Ken Burns</b> <p><b>Witnesses were mysteriously murdered. The FBI, NSA, CIA, and even the IRS were on the warpath. It was 1975, and a senator named Frank Church stood almost alone in the face of extraordinary abuses of power.</b> <p> For decades now, America's national security state has grown ever bigger, ever more secretive and powerful, and ever more abusive. Only once did someone manage to put a stop to any of it. <p> Senator Frank Church of Idaho was an unlikely hero. He led congressional opposition to the Vietnam War and had become a scathing, radical critic of what he saw as American imperialism around the world. But he was still politically ambitious, privately yearning for acceptance from the foreign policy establishment that he hated and eager to run for president. Despite his flaws, Church would show historic strength in his greatest moment, when in the wake of Watergate he was suddenly tasked with investigating abuses of power in the intelligence community. The dark truths that Church exposed--from assassination plots by the CIA, to links between the Kennedy dynasty and the mafia, to the surveillance of civil rights activists by the NSA and FBI--would shake the nation to its core, and forever change the way that Americans thought about not only their government but also their ability to hold it accountable. <p> Drawing upon hundreds of interviews, thousands of pages of recently declassified documents, and reams of unpublished letters, notes, and memoirs, some of which remain sensitive today, Pulitzer Prize-winning reporter James Risen tells the gripping, untold story of truth and integrity standing against unchecked power--and winning--in <i>The Last Honest Man</i>.	
41	WHEN THE HEAVENS WENT ON SALE	0062998870	9780062998873	<p>A momentous look at the private companies building a revolutionary new economy in space, from the New York Times bestselling author of Elon Musk</p> <p>In When the Heavens Went on Sale, Ashlee Vance illuminates our future and unveils the next big technology story of our time: welcome to the Wild West of aerospace engineering and its unprecedented impact on our lives.</p> <p>With the launch of SpaceX's Falcon 1 rocket in 2008, Silicon Valley began to realize that the universe itself was open for business. Now, Vance tells the remarkable, unfolding story of this frenzied intergalactic land grab by following four pioneering companies--Astra, Firefly, Planet Labs, and Rocket Lab--as they build new space systems and attempt to launch rockets and satellites into orbit by the thousands.</p> <p>With the public fixated on the space tourism being driven by the likes of Elon Musk, Jeff Bezos, and Richard Branson, these new, scrappy companies arrived with a different set of goals: to make rocket and satellite launches fast and cheap, thereby opening Earth's lower orbit for business. Vance has had a front-row seat and singular access to this peculiar and unprecedented moment in history, and he chronicles it all in full color: the top-secret launch locations, communes, gun-toting bodyguards, drugs, espionage investigations, and multimillionaires guzzling booze to dull the pain as their fortunes disappear.</p> <p>Through immersive and intimate reporting, When the Heavens Went on Sale reveals the spectacular chaos of the new business of space, and what happens when the idealistic, ambitious minds of Silicon Valley turn their unbridled vision toward the limitless expanse of the stars. This is the tale of technology's most pressing and controversial revolution, as told through fascinating characters chasing unimaginable stakes in the race to space.</p>	
42	THE SEVEN HUSBANDS OF EVELYN HUGO	1501161938	9781501161933	<b><i>NEW YORK TIMES</i></b><b> BESTSELLER</b><br> <br><b>“If you</b>’<b>re looking for a book to take on holiday this summer, <i>The Seven Husbands of Evelyn Hugo</i> has got all the glitz and glamour to make it a perfect beach read.” —<i>Bustle</i></b><br> <br><b>From the <i>New York Times</i> bestselling author of <i>Daisy Jones & the Six</i>—an entrancing and “wildly addictive journey of a reclusive Hollywood starlet” (<i>PopSugar</i>) as she reflects on her relentless rise to the top and the risks she took, the loves she lost, and the long-held secrets the public could never imagine.</b><br><br>Aging and reclusive Hollywood movie icon Evelyn Hugo is finally ready to tell the truth about her glamorous and scandalous life. But when she chooses unknown magazine reporter Monique Grant for the job, no one is more astounded than Monique herself. Why her? Why now?<br> <br>Monique is not exactly on top of the world. Her husband has left her, and her professional life is going nowhere. Regardless of why Evelyn has selected her to write her biography, Monique is determined to use this opportunity to jumpstart her career.<br> <br>Summoned to Evelyn’s luxurious apartment, Monique listens in fascination as the actress tells her story. From making her way to Los Angeles in the 1950s to her decision to leave show business in the ‘80s, and, of course, the seven husbands along the way, Evelyn unspools a tale of ruthless ambition, unexpected friendship, and a great forbidden love. Monique begins to feel a very real connection to the legendary star, but as Evelyn’s story near its conclusion, it becomes clear that her life intersects with Monique’s own in tragic and irreversible ways.<br> <br>“Heartbreaking, yet beautiful” (Jamie Blynn, <i>Us Weekly</i>), <i>The Seven Husbands of Evelyn Hugo </i>is “Tinseltown drama at its finest” (<i>Redbook</i>): a mesmerizing journey through the splendor of old Hollywood into the harsh realities of the present day as two women struggle with what it means—and what it costs—to face the truth.	
86	THE WONDERFUL THINGS YOU WILL BE	0385376715	9780385376716	<b>The<i> New York Times</i> bestseller that celebrates the dreams, acceptance, and love that parents have for their children . . . now and forever. This is the perfect heartfelt gift for kids of all ages, plus a great choice for baby showers, birthdays, graduations, and other new beginnings!<br></b> <br> From brave and bold to creative and clever, Emily Winfield Martin's rhythmic rhyme expresses all the loving things that parents think of when they look at their children. With beautiful, lush illustrations and a stunning gatefold that opens at the end, this is a book that families will love reading over and over. <br><br><i> The Wonderful Things You Will Be</i> has a loving and truthful message that will endure for lifetimes and makes a great gift to the ones you love for any occasion.	
87	THANK YOU, TEACHER FROM THE VERY HUNGRY CATERPILLAR	0593226186	9780593226186	<b>Show your teachers how much you appreciate them in this colorful book of thanks featuring The Very Hungry Caterpillar.</b><br><br>Perfect for National Teacher Day, Teacher Appreciation Week, the end of the school year, or just because! This heartwarming gift book is a perfect thank-you gift for teachers everywhere. Using bright and colorful Eric Carle imagery, plus The Very Hungry Caterpillar, this story provides all the reasons why the teachers in our lives are so special and why we're so thankful for them.	
47	THE HOUSEMAID	1538742578	9781538742570	<b>Don't miss the <i>USA Today</i> bestseller and addictive psychological thriller with a jaw-dropping twist that's burning up Instagram--Freida McFadden's <i>The Housemaid</i> is perfect for fans of Ruth Ware, Lisa Jewell, and</b> <i><b>Verity.</b></i><br> <br> <br> <br> <b>"Welcome to the family," Nina Winchester says as I shake her elegant, manicured hand. I smile politely, gazing around the marble hallway. Working here is my last chance to start fresh. I can pretend to be whoever I like. But I'll soon learn that the Winchesters' secrets are far more dangerous than my own...</b><br> <br> <br> <br> Every day I clean the Winchesters' beautiful house top to bottom. I collect their daughter from school. And I cook a delicious meal for the whole family before heading up to eat alone in my tiny room on the top floor.<br> <br> <br> <br> I try to ignore how Nina makes a mess just to watch me clean it up. How she tells strange lies about her own daughter. And how her husband Andrew seems more broken every day. But as I look into Andrew's handsome brown eyes, so full of pain, it's hard not to imagine what it would be like to live Nina's life. The walk-in closet, the fancy car, the perfect husband.<br> <br> <br> <br> I only try on one of Nina's pristine white dresses once. Just to see what it's like. But she soon finds out... and by the time I realize my attic bedroom door only locks from the outside, it's far too late.<br> <br> <br> <br> But I reassure myself: the Winchesters don't know who I really am.<br> <br> <br> <br> They don't know what I'm capable of...	
48	THE SILENT PATIENT	125030170X	9781250301703	<p><b>**THE INSTANT #1 <i>NEW YORK TIMES </i>BESTSELLER**</b><br><br>"An unforgettable—and Hollywood-bound—new thriller... A mix of Hitchcockian suspense, Agatha Christie plotting, and Greek tragedy."<br><b>—<i>Entertainment Weekly</i></b><br><br><b><i>The Silent Patient</i> is a shocking psychological thriller of a woman’s act of violence against her husband—and of the therapist obsessed with uncovering her motive.</b><br><br>Alicia Berenson’s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London’s most desirable areas. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word.<br><br>Alicia’s refusal to talk, or give any kind of explanation, turns a domestic tragedy into something far grander, a mystery that captures the public imagination and casts Alicia into notoriety. The price of her art skyrockets, and she, the silent patient, is hidden away from the tabloids and spotlight at the Grove, a secure forensic unit in North London.<br><br>Theo Faber is a criminal psychotherapist who has waited a long time for the opportunity to work with Alicia. His determination to get her to talk and unravel the mystery of why she shot her husband takes him down a twisting path into his own motivations—a search for the truth that threatens to consume him....</p>	
49	ICEBREAKER	1668026031	9781668026038	<b><i>NEW YORK TIMES </i>BESTSELLER</b><br> <br><b>A TikTok sensation! Sparks fly when a competitive figure skater and hockey team captain are forced to share a rink.</b><b> </b><br><br>Anastasia Allen has worked her entire life for a shot at Team USA. It looks like everything is going according to plan when she gets a full scholarship to the University of California, Maple Hills and lands a place on their competitive figure skating team.<br> <br>Nothing will stand in her way, not even the captain of the hockey team, Nate Hawkins.<br> <br>Nate’s focus as team captain is on keeping his team on the ice. Which is tricky when a facilities mishap means they are forced to share a rink with the figure skating team—including Anastasia, who clearly can’t stand him. <br> <br>But when Anastasia’s skating partner faces an uncertain future, she may have to look to Nate to take her shot. <br> <br>Sparks fly, but Anastasia isn’t worried…because she could never like a hockey player, right?	
50	DAISY JONES & THE SIX	1524798649	9781524798642	<b>#1 NATIONAL BESTSELLER • OVER ONE MILLION COPIES SOLD! A gripping novel about the whirlwind rise of an iconic 1970s rock group and their beautiful lead singer, revealing the mystery behind their infamous breakup—from the author of <i>The Seven Husbands of Evelyn Hugo, Malibu Rising, </i>and <i>Carrie Soto Is Back</i><br><br>REESE’S BOOK CLUB PICK • NOW AN ORIGINAL STREAMING SERIES EXECUTIVE PRODUCED BY REESE WITHERSPOON <br>  <br>“An explosive, dynamite, down-and-dirty look at a fictional rock band told in an interview style that gives it irresistible surface energy.”—Elin Hilderbrand<br><br>ONE OF THE BEST BOOKS OF THE YEAR: NPR, <i>The Washington Post, Esquire, Glamour, Real Simple, Good Housekeeping, Marie Claire, Parade, Paste, Shelf Awareness, BookRiot<br></i></b><br> <i>Everyone knows DAISY JONES & THE SIX, but nobody knows the reason behind their split at the absolute height of their popularity . . . until now.<br><br></i>Daisy is a girl coming of age in L.A. in the late sixties, sneaking into clubs on the Sunset Strip, sleeping with rock stars, and dreaming of singing at the Whisky a Go Go. The sex and drugs are thrilling, but it’s the rock ’n’ roll she loves most. By the time she’s twenty, her voice is getting noticed, and she has the kind of heedless beauty that makes people do crazy things.<br><br> Also getting noticed is The Six, a band led by the brooding Billy Dunne. On the eve of their first tour, his girlfriend Camila finds out she’s pregnant, and with the pressure of impending fatherhood and fame, Billy goes a little wild on the road.<br><br> Daisy and Billy cross paths when a producer realizes that the key to supercharged success is to put the two together. What happens next will become the stuff of legend.<br><br> The making of that legend is chronicled in this riveting and unforgettable novel, written as an oral history of one of the biggest bands of the seventies. Taylor Jenkins Reid is a talented writer who takes her work to a new level with <i>Daisy Jones & The Six, </i>brilliantly capturing a place and time in an utterly distinctive voice.	
51	THE MIDNIGHT LIBRARY	0525559493	9780525559498	<b><b><b><b>The #1 <i>New York Times </i>bestselling WORLDWIDE phenomenon </b><br> <br> <b>Winner of the Goodreads Choice Award for Fiction | A Good Morning America Book Club Pick | <i>Independent (</i>London) Ten Best Books of the Year</b><br> <br> <b>"A feel-good book guaranteed to lift your spirits."<i>—The Washington Post</i> <br><br> The dazzling reader-favorite about the choices that go into a life well lived, from the acclaimed author of <i>How To Stop Time </i>and<i> The Comfort Book.</i></b><br> <b> </b></b></b></b><br>Somewhere out beyond the edge of the universe there is a library that contains an infinite number of books, each one the story of another reality. One tells the story of your life as it is, along with another book for the other life you could have lived if you had made a different choice at any point in your life. While we all wonder how our lives might have been, what if you had the chance to go to the library and see for yourself? Would any of these other lives truly be better?<br><br>In <i>The Midnight Library</i>, Matt Haig's enchanting blockbuster novel, Nora Seed finds herself faced with this decision. Faced with the possibility of changing her life for a new one, following a different career, undoing old breakups, realizing her dreams of becoming a glaciologist; she must search within herself as she travels through the Midnight Library to decide what is truly fulfilling in life, and what makes it worth living in the first place.	
88	DRAGONS LOVE TACOS	0803736800	9780803736801	<b>A #1 <i>New York Times</i> bestselling phenomenon, this deliciously funny read-aloud is an unforgettable tale of new friends and the perfect snack that will make you laugh until spicy salsa comes out of your nose.</b><br><br> Dragons love tacos. They love chicken tacos, beef tacos, great big tacos, and teeny tiny tacos. So if you want to lure a bunch of dragons to your party, you should definitely serve tacos. Buckets and buckets of tacos. Unfortunately, where there are tacos, there is also salsa. And if a dragon accidentally eats spicy salsa . . . oh, boy. You're in red-hot trouble.<br><br>This makes the perfect gift for any special occasion, from award-winning team of Adam Rubin and Daniel Salmieri who created <i>Dragons Love Tacos 2: The Sequel</i>,<i> El Chupacabras</i>, <i>High Five</i>, <i>Robo-Sauce, and Secret Pizza Party.</i>	Illustrated by daniel salmieri
89	WOO HOO! YOU'RE DOING GREAT!	0316486795	9780316486798	<p><b>Bestselling, beloved author Sandra Boynton--and a very exuberant chicken!--have an important message to share in this inspiring and highly giftable all-ages picture book for every life milestone!</b><br> <br> Whether you are learning to skate, baking a cake, or even making a mistake, this hilarious and heartfelt rhyming book reminds us that trying our best is reason to celebrate. From children trying to master new skills to adults who had a hard week at work, we all get overwhelmed sometimes and need reassurance. And who better to offer it than a chicken exclaiming: "WOO HOO! YOU'RE DOING GREAT!"<br> <br> The ideal gift to cheer on kids and adults through life's milestones--both big and small--including moving up ceremonies and graduations, birthdays, testing out a hobby, starting out somewhere new, and so much more.</p>	
52	THE ESCAPE ARTIST	0063112361	9780063112360	<p>"A brilliant and heart-wrenching book, with universal and timely lessons about the power of information--and misinformation. Is it possible to stop mass murder by telling the truth?" -- Yuval Noah Harari, bestselling author of Sapiens: A Brief History of Humankind and Homo Deus: A Brief History of Tomorrow</p> <p>A complex hero. A forgotten story. The first witness to reveal the full truth of the Holocaust . . .</p> <p>Award-winning journalist and bestselling novelist Jonathan Freedland tells the astonishing true story of Rudolf Vrba, the man who broke out of Auschwitz to warn the world of a truth too few were willing to hear.</p> <p>In April 1944, Rudolf Vrba became one of the very first Jews to escape from Auschwitz and make his way to freedom--among only a tiny handful who ever pulled off that near-impossible feat. He did it to reveal the truth of the death camp to the world--and to warn the last Jews of Europe what fate awaited them. Against all odds, Vrba and his fellow escapee, Fred Wetzler, climbed mountains, crossed rivers, and narrowly missed German bullets until they had smuggled out the first full account of Auschwitz the world had ever seen--a forensically detailed report that eventually reached Franklin Roosevelt, Winston Churchill, and the Pope.</p> <p>And yet too few heeded the warning that Vrba had risked everything to deliver. Though Vrba helped save two hundred thousand Jewish lives, he never stopped believing it could have been so many more.</p> <p>This is the story of a brilliant yet troubled man--a gifted "escape artist" who, even as a teenager, understood that the difference between truth and lies can be the difference between life and death. Rudolf Vrba deserves to take his place alongside Anne Frank, Oskar Schindler, and Primo Levi as one of the handful of individuals whose stories define our understanding of the Holocaust.</p>	
53	FINDING ME	006303736X	9780063037366	<p>OPRAH'S BOOK CLUB PICK * A HARPERS BAZAAR BEST BOOK OF 2022 * A PARADE MOST ANTICIPATED BOOK * A MARIE CLAIRE MOST ANTICIPATED BOOK</p> <p>"It's clear from the first page that Davis is going to serve a more intimate, unpolished account than is typical of the average (often ghost-written) celebrity memoir; Finding Me reads like Davis is sitting you down for a one-on-one conversation about her life, warts and all."--USA Today</p> <p>"[A] fulfilling narrative of struggle and success....Her gorgeous storytelling will inspire anyone wishing to shed old labels."--Los Angeles Times</p> <br> <br> <p>In my book, you will meet a little girl named Viola who ran from her past until she made a life-changing decision to stop running forever.</p> <p>This is my story, from a crumbling apartment in Central Falls, Rhode Island, to the stage in New York City, and beyond. This is the path I took to finding my purpose but also my voice in a world that didn't always see me.</p> <p>As I wrote Finding Me, my eyes were open to the truth of how our stories are often not given close examination. We are forced to reinvent them to fit into a crazy, competitive, judgmental world. So I wrote this for anyone running through life untethered, desperate and clawing their way through murky memories, trying to get to some form of self-love. For anyone who needs reminding that a life worth living can only be born from radical honesty and the courage to shed facades and be . . . you.</p> <p>Finding Me is a deep reflection, a promise, and a love letter of sorts to self. My hope is that my story will inspire you to light up your own life with creative expression and rediscover who you were before the world put a label on you.</p>	
54	EMPIRE OF THE SUMMER MOON	1416591060	9781416591061	<b>Finalist for the Pulitzer Prize</b><br> This stunning historical account of the forty-year battle between Comanche Indians and white settlers for control of the American West was a major <i>New York Times</i> bestseller. <p>In the tradition of <i>Bury My Heart at Wounded Knee, </i>a stunningly vivid historical account of the forty-year battle between Comanche Indians and white settlers for control of the American West, centering on Quanah, the greatest Comanche chief of them all. <p> S. C. Gwynne's <i>Empire of the Summer Moon</i><b> </b>spans two astonishing stories. The first traces the rise and fall of the Comanches, the most powerful Indian tribe in American history. The second entails one of the most remarkable narratives ever to come out of the Old West: the epic saga of the pioneer woman Cynthia Ann Parker and her mixed-blood son Quanah, who became the last and greatest chief of the Comanches. <p> Although readers may be more familiar with the tribal names Apache and Sioux, it was in fact the legendary fighting ability of the Comanches that determined just how and when the American West opened up. Comanche boys became adept bareback riders by age six; full Comanche braves were considered the best horsemen who ever rode. They were so masterful at war and so skillful with their arrows and lances that they stopped the northern drive of colonial Spain from Mexico and halted the French expansion westward from Louisiana. White settlers arriving in Texas from the eastern United States were surprised to find the frontier being rolled <i>backward </i>by Comanches incensed by the invasion of their tribal lands. So effective were the Comanches that they forced the creation of the Texas Rangers and account for the advent of the new weapon specifically designed to fight them: the six-gun. <p> The war with the Comanches lasted four decades, in effect holding up the development of the new American nation. Gwynne's exhilarating account delivers a sweeping narrative that encompasses Spanish colonialism, the Civil War, the destruction of the buffalo herds, and the arrival of the railroads--a historical feast for anyone interested in how the United States came into being. <p> Against this backdrop Gwynne presents the compelling drama of Cynthia Ann Parker, a lovely nine-year-old girl with cornflower-blue eyes who was kidnapped by Comanches from the far Texas frontier in 1836. She grew to love her captors and became infamous as the "White Squaw" who refused to return until her tragic capture by Texas Rangers in 1860. More famous still was her son Quanah, a warrior who was never defeated and whose guerrilla wars in the Texas Panhandle made him a legend. <p> S. C. Gwynne's account of these events is meticulously researched, intellectually provocative, and, above all, thrillingly told. <i>Empire of the Summer Moon </i>announces him as a major new writer of American history.	
55	EDUCATED	0399590528	9780399590528	<b>#1 <i>NEW YORK TIMES, WALL STREET JOURNAL,</i> AND <i>BOSTON GLOBE</i> BESTSELLER • One of the most acclaimed books of our time: an unforgettable memoir about a young woman who, kept out of school, leaves her survivalist family and goes on to earn a PhD from Cambridge University</b><br> <br><b>“Extraordinary . . . an act of courage and self-invention.”—<i>The New York Times</i></b><br> <br><b>NAMED ONE OF THE TEN BEST BOOKS OF THE YEAR BY <i>THE NEW YORK TIMES BOOK REVIEW</i> • ONE OF PRESIDENT BARACK OBAMA’S FAVORITE BOOKS OF THE YEAR • BILL GATES’S HOLIDAY READING LIST • FINALIST: National Book Critics Circle’s Award In Autobiography and John Leonard Prize For Best First Book • PEN/Jean Stein Book Award • <i>Los Angeles Times</i> Book Prize</b><br> <br>Born to survivalists in the mountains of Idaho, Tara Westover was seventeen the first time she set foot in a classroom. Her family was so isolated from mainstream society that there was no one to ensure the children received an education, and no one to intervene when one of Tara’s older brothers became violent. When another brother got himself into college, Tara decided to try a new kind of life. Her quest for knowledge transformed her, taking her over oceans and across continents, to Harvard and to Cambridge University. Only then would she wonder if she’d traveled too far, if there was still a way home.<br> <br><b>“Beautiful and propulsive . . . Despite the singularity of [Westover’s] childhood, the questions her book poses are universal: How much of ourselves should we give to those we love? And how much must we betray them to grow up?”—<i>Vogue</i></b><br><b><br>ONE OF THE BEST BOOKS OF THE YEAR: <i>The Washington Post, O: The Oprah Magazine, Time,</i> NPR, <i>Good Morning America, San Francisco Chronicle, The Guardian, The Economist, Financial Times</i>,<i> Newsday, New York Post, theSkimm, Refinery29, Bloomberg, Self, Real Simple, Town & Country, Bustle, Paste, Publishers Weekly</i>,<i> Library Journal, LibraryReads, Book Riot,</i> Pamela Paul, KQED, New York Public Library</b>	
56	THINKING, FAST AND SLOW	0374533555	9780374533557	When we can and cannot trust our intuitions in making business and personal decisions.	
57	THE GLASS CASTLE	074324754X	9780743247542	<b>Now a major motion picture from Lionsgate starring Brie Larson, Woody Harrelson, and Naomi Watts.</b><br> <br> <b>MORE THAN SEVEN YEARS ON <i>THE NEW YORK TIMES</i> BESTSELLER LIST</b><br> The perennially bestselling, extraordinary, one-of-a-kind, “nothing short of spectacular” (<i>Entertainment Weekly</i>) memoir from one of the world’s most gifted storytellers.<br><br><i>The Glass Castle </i>is a remarkable memoir of resilience and redemption, and a revelatory look into a family at once deeply dysfunctional and uniquely vibrant. When sober, Jeannette’s brilliant and charismatic father captured his children’s imagination, teaching them physics, geology, and how to embrace life fearlessly. But when he drank, he was dishonest and destructive. Her mother was a free spirit who abhorred the idea of domesticity and didn’t want the responsibility of raising a family.<br> <br>The Walls children learned to take care of themselves. They fed, clothed, and protected one another, and eventually found their way to New York. Their parents followed them, choosing to be homeless even as their children prospered.<br> <br><i>The Glass Castle </i>is truly astonishing—a memoir permeated by the intense love of a peculiar but loyal family.	
58	GRIT	1501111116	9781501111112	<b>In this instant <i>New York Times </i>bestseller, Angela Duckworth shows anyone striving to succeed that the secret to outstanding achievement is not talent, but a special blend of passion and persistence she calls “grit.” “Inspiration for non-geniuses everywhere” (<i>People</i>).</b><br><br>The daughter of a scientist who frequently noted her lack of “genius,” Angela Duckworth is now a celebrated researcher and professor. It was her early eye-opening stints in teaching, business consulting, and neuroscience that led to her hypothesis about what really drives success: not genius, but a unique combination of passion and long-term perseverance.<br> <br> In <i>Grit</i>, she takes us into the field to visit cadets struggling through their first days at West Point, teachers working in some of the toughest schools, and young finalists in the National Spelling Bee. She also mines fascinating insights from history and shows what can be gleaned from modern experiments in peak performance. Finally, she shares what she’s learned from interviewing dozens of high achievers—from JP Morgan CEO Jamie Dimon to <i>New Yorker</i> cartoon editor Bob Mankoff to Seattle Seahawks Coach Pete Carroll.<br> <br> “Duckworth’s ideas about the cultivation of tenacity have clearly changed some lives for the better” (<i>The New York Times Book Review</i>). Among <i>Grit</i>’s most valuable insights: any effort you make ultimately counts <i>twice </i>toward your goal; grit can be <i>learned</i>, regardless of IQ or circumstances; when it comes to child-rearing, neither a warm embrace nor high standards will work by themselves; how to trigger lifelong interest; the magic of the Hard Thing Rule; and so much more. Winningly personal, insightful, and even life-changing, <i>Grit</i> is a book about what goes through your head when you fall down, and how<i> that</i>—not talent or luck—makes all the difference. This is “a fascinating tour of the psychological research on success” (<i>The Wall Street Journal)</i>.	
59	TALKING TO STRANGERS	0316299227	9780316299220	<b>Malcolm Gladwell, host of the podcast <i>Revisionist History</i> and author of the #1 <i>New York Times</i> bestseller <i>Outliers</i>, offers a powerful examination of our interactions with strangers</b><b>, </b><b>and why they often go wrong</b><b>--now with a new afterword by the author.</b><br> <br> <br> <br> <b>A Best Book of the Year: <i>The Financial Times, Bloomberg, Chicago Tribune,</i> and <i>Detroit Free Press</i></b><br> <br> <br> <br> How did Fidel Castro fool the CIA for a generation? Why did Neville Chamberlain think he could trust Adolf Hitler? Why are campus sexual assaults on the rise? Do television sitcoms teach us something about the way we relate to one another that isn't true?<br> <br> <br> <br> <i>Talking to Strangers</i> is a challenging and controversial excursion through history, psychology, and scandals taken straight from the news. In it, Malcolm Gladwell revisits the deceptions of Bernie Madoff, the suicide of Sylvia Plath, and the death of Sandra Bland--throwing our understanding of these and other stories into doubt.<br> <br> <br> <br> Something is very wrong, Gladwell argues, with the tools and strategies we use to make sense of people we don't know, and the resulting conflict and misunderstanding have a profound effect on our lives and our world. Now, with <i>Talking to Strangers</i>, Malcolm Gladwell brings us a gripping guidebook for troubled times.	
60	THE DAWN OF EVERYTHING	1250858801	9781250858801	<p><b>INSTANT </b><b><i>NEW YORK TIMES </i>BESTSELLER</b> <br><br><b>A dramatically new understanding of human history, challenging our most fundamental assumptions about social evolution—from the development of agriculture and cities to the origins of the state, democracy, and inequality—and revealing new possibilities for human emancipation.<br></b><br>For generations, our remote ancestors have been cast as primitive and childlike—either free and equal innocents, or thuggish and warlike. Civilization, we are told, could be achieved only by sacrificing those original freedoms or by taming our baser instincts. In their major <i>New York Times</i> bestseller, <i>The Dawn of Everything</i>, David Graeber and David Wengrow fundamentally challenge these assumptions and recast our understanding of human history. We will never again see the past in the same way.<br><br>Drawing on pathbreaking research in archaeology and anthropology, Graeber and Wengrow reveal how history becomes a far more interesting place once we learn to throw off our conceptual blinders and perceive what’s really there. If humans did not spend 95 percent of their evolutionary past in tiny bands of hunter-gatherers, what were they doing during all that time? If agriculture and cities did not mean a plunge into hierarchy and domination, then what kinds of social and economic organizations did they lead to? The answers are often unexpected, and suggest that the course of human history may be less set in stone, and more open to playful, hopeful possibilities, than we tend to assume.<br><br>Destined to be a classic, <i>The Dawn of Everything</i> signals a paradigm shift, profoundly transforming our understanding of the human past and making space to imagine new forms of freedom, new ways of organizing society. This is a monumental book of formidable intellectual and political range, animated by curiosity, moral vision, and hopefulness.</p>	
61	BEING MORTAL	1250076226	9781250076229	<p><b>Named a Best Book of the Year by <i>The Washington Post</i>, <i>The New York Times Book Review</i>, NPR, and <i>Chicago Tribune, </i>now in paperback with a new reading group guide</b><br><br>Medicine has triumphed in modern times, transforming the dangers of childbirth, injury, and disease from harrowing to manageable. But when it comes to the inescapable realities of aging and death, what medicine can do often runs counter to what it should.<br><br>Through eye-opening research and gripping stories of his own patients and family, Gawande reveals the suffering this dynamic has produced. Nursing homes, devoted above all to safety, battle with residents over the food they are allowed to eat and the choices they are allowed to make. Doctors, uncomfortable discussing patients' anxieties about death, fall back on false hopes and treatments that are actually shortening lives instead of improving them.<br><br>In his bestselling books, Atul Gawande, a practicing surgeon, has fearlessly revealed the struggles of his profession. Here he examines its ultimate limitations and failures—in his own practices as well as others'—as life draws to a close. Riveting, honest, and humane, <i>Being Mortal</i> shows how the ultimate goal is not a good death but a good life—all the way to the very end.</p>	
62	MAGNOLIA TABLE, VOL. 3	0062820176	9780062820174	<br> <br> <p>Joanna Gaines--cofounder of Magnolia, cook and host of Magnolia Table with Joanna Gaines, and New York Times bestselling author--brings us her third cookbook filled with timeless and nostalgic recipes--now reimagined--for today's home cook. </p> <p>Whether it's in the making, the gathering, or the tasting of something truly delicious, this collection of recipes from Magnolia Table, Volume 3 is an invitation to savor every moment. In Joanna's first cookbook, the #1 New York Times bestselling Magnolia Table, she introduced readers to her favorite passed-down family recipes. For her second cookbook, Magnolia Table, Volume 2, she pushed herself beyond her comfort zone to develop new recipes for her family. In this, her third cookbook, Joanna shares the recipes--old and new--that she's enjoyed the most over the years. The result is a cookbook filled with recipes that are timeless, creative, and delicious! Just as in her past books, within each recipe Joanna speaks to the reader, explaining why she likes a recipe, what inspired her to create it in the first place, and how she prefers to serve it. The book is beautifully photographed and filled with dishes you will want to bring into your own home, including:</p> <ul> <li>Honey Butter Layered Biscuit Bites </li> <li>Bananas Foster Pancakes </li> <li>Brussels Sprout Gruyére Gratin </li> <li>White Chicken Alfredo Lasagna </li> <li>Garlic Shrimp over Parmesan Risotto </li> <li>Peanut Butter Pie </li> <li>Brownie Cookies </li> </ul> <br> <br>	
96	THE SUMMER I TURNED PRETTY TRILOGY	1416968296	9781416968290	<b><b>Now an Original Series on Prime Video!</b><br> <br><b>Belly has an unforgettable summer in this stunning start to the Summer I Turned Pretty series from the <i>New York Times</i> bestselling author of <i>To All the Boys I’ve Loved Before</i> (now a major motion picture!), Jenny Han.</b></b><br><br><i>Some summers are just destined to be pretty.</i><br> <br>Belly measures her life in summers. Everything good, everything magical happens between the months of June and August. Winters are simply a time to count the weeks until the next summer, a place away from the beach house, away from Susannah, and most importantly, away from Jeremiah and Conrad. They are the boys that Belly has known since her very first summer—they have been her brother figures, her crushes, and everything in between. But one summer, one wonderful and terrible summer, the more everything changes, the more it all ends up just the way it should have been all along.	
63	ATOMIC HABITS	0735211299	9780735211292	<b>The #1<i> New York Times</i> bestseller. Over 10 million copies sold!<br><br><i>Tiny Changes, Remarkable Results</i></b><br><br>No matter your goals, <i>Atomic Habits</i> offers a proven framework for improving--every day. James Clear, one of the world's leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.<br><br>If you're having trouble changing your habits, the problem isn't you. The problem is your system. Bad habits repeat themselves again and again not because you don't want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you'll get a proven system that can take you to new heights.<br><br>Clear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field.<br><br>Learn how to:<br><ul><li>make time for new habits (even when life gets crazy);</li></ul><ul><li>overcome a lack of motivation and willpower;</li></ul><ul><li>design your environment to make success easier;</li></ul><ul><li>get back on track when you fall off course;</li></ul>...and much more.<br><br><i>Atomic Habits</i> will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.	
64	THERE ARE MOMS WAY WORSE THAN YOU	1523515643	9781523515646	<b>A hilarious and reassuring gift for every mom: because we’re all doing the best we can, and the natural world is filled with moms worse than you!</b><br><br><i>A mom giraffe is pretty nice until the fetus drops.</i><br><i>She’ll birth a newborn baby calf, then kick him ’til he walks.</i><br>  <br><i>Whenever you feel guilty that you haven’t cleaned the house:</i><br><i>Sexton beetles raise their kids in a decomposing mouse.</i><br>  <br> A koala mom will feed her kids her own poop. Yes, poop. Panda moms will abandon one twin because raising two is, well, just too much. And every now and then a cuddly little hamster mom will —yup— eat her newborn pups.<br> These and other true facts from the animal kingdom offer a hilarious reality check on what constitutes “good parenting.” So, human mother, time to stop worrying about the job you're doing —because you’re a <i>great</i> mom.<br>  	Illustrated by priscilla witte
65	THE CREATIVE ACT	0593652886	9780593652886	<b>The #1 <i>New York Times </i>bestseller.<br><br>"The ultimate graduation gift...It’s a book I wish I would have had on my shelf when I was 25. It’s a book I would give to people who are 25." — Steve Levitt, <i>People I (Mostly) Admire</i><br><br>"A gorgeous and inspiring work of art on creation, creativity, the work of the artist. It will gladden the hearts of writers and artists everywhere, and get them working again with a new sense of meaning and direction. A stunning accomplishment.” —Anne Lamott<br><br><b>From the legendary music producer, a master at helping people connect with the wellsprings of their creativity, comes a beautifully crafted book many years in the making that offers that same deep wisdom to all of us.</b></b><br><br>“<i>I set out to write a book about what to do to make a great work of art. Instead, it revealed itself to be a book on how to be.” —Rick Rubin</i><br><br>Many famed music producers are known for a particular sound that has its day. Rick Rubin is known for something else: creating a space where artists of all different genres and traditions can home in on who they really are and what they really offer. He has made a practice of helping people transcend their self-imposed expectations in order to reconnect with a state of innocence from which the surprising becomes inevitable. Over the years, as he has thought deeply about where creativity comes from and where it doesn’t, he has learned that being an artist isn’t about your specific output, it’s about your relationship to the world. Creativity has a place in everyone’s life, and everyone can make that place larger. In fact, there are few more important responsibilities.<br><br><i>The Creative Act</i> is a beautiful and generous course of study that illuminates the path of the artist as a road we all can follow. It distills the wisdom gleaned from a lifetime’s work into a luminous reading experience that puts the power to create moments—and lifetimes—of exhilaration and transcendence within closer reach for all of us.	
66	THE BOY, THE MOLE, THE FOX AND THE HORSE	0062976583	9780062976581	<p>Charlie Mackesy's beloved The Boy, the Mole, the Fox and the Horse has been adapted into an Academy Award(R) winning animated short film, now available to stream on Apple TV+</p><p>#1 NEW YORK TIMES BESTSELLER - WALL STREET JOURNAL BESTSELLER - USA TODAY BESTSELLER</p><p>"The Boy, the Mole, the Fox and the Horse is not only a thought-provoking, discussion-worthy story, the book itself is an object of art."- Elizabeth Egan, The New York Times</p><p>From British illustrator, artist, and author Charlie Mackesy comes a journey for all ages that explores life's universal lessons, featuring 100 color and black-and-white drawings.</p><p>"What do you want to be when you grow up?" asked the mole.</p><p>"Kind," said the boy.</p><p>Charlie Mackesy offers inspiration and hope in uncertain times in this beautiful book, following the tale of a curious boy, a greedy mole, a wary fox and a wise horse who find themselves together in sometimes difficult terrain, sharing their greatest fears and biggest discoveries about vulnerability, kindness, hope, friendship and love. The shared adventures and important conversations between the four friends are full of life lessons that have connected with readers of all ages. </p>	
67	DISRUPTIVE THINKING	1546004009	9781546004004	<p><b>Think differently and find the courage to challenge the status quo with this mindset-shifting guide to meaningful change.</b></p> For most of our lives, we are encouraged to trudge along the well-worn paths of those who have come before us. We learn the rules - in our families, in our schools, in our workplaces, in our churches - and most of the messages we receive tell us that following the rules will allow us to arrive at the lives we desire. <br> <br> <br> <br> But when change becomes not only desirable but also urgently necessary, this way of being no longer serves us. In fact, in every human endeavor, every major leap forward, has involved a cataclysmic challenge to existing ways of thinking and being. Breakthroughs, by definition, run against the grain and almost always encounter skepticism and opposition. <br> <br> <br> <br> In this book for leaders, thinkers, doers, and creators, Bishop T.D. Jakes illuminates the pathway to encouraging and unleashing disruptive thinking and provides the wisdom and practical skills we need to evolve our most original and potentially transformational ideas from vision to reality. Through his insight into how our minds and emotions work and through his experiences as a pastor, entrepreneur, and creator, Bishop Jakes leads us into a new way of relating to and transforming the world around us for good. <i>Disruptive Thinking</i> will show you the mindset and the tools you need to create groundbreaking and meaningful change in your own life and in the world around you.<br> <br>	
130	LORD OF THE FLEAS	1338741071	9781338741070	<b>The Supa Buddies convene to deal with some new villains in the fifth Dog Man book from worldwide bestselling author and artist Dav Pilkey.</b><br></br>When a fresh bunch of baddies bust up the town, Dog Man is called into action -- and this time he isn't alone. With a cute kitten and a remarkable robot by his side, our heroes must save the day by joining forces with an unlikely ally: Petey, the World's Most Evil Cat. But can the villainous Petey avoid vengeance and venture into virtue? <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of being true to one's self.	
68	THE GLUCOSE GODDESS METHOD	1668024527	9781668024522	<b>From the #1 internationally bestselling author of<i> Glucose Revolution</i>, a four-week, four-step program for living a healthier, happier life with balanced blood sugar including over 100 recipes, an interactive workbook, and the guidance to make the “new science of nutrition…practical for everyone” (Robert H. Lustig, MD, MSL, <i>New York Times </i>bestselling author of <i>Fat Chance</i>).</b><br><br>Do you suffer from cravings, chronic fatigue, or sugar addiction? Do you sometimes wake up in the morning feeling unable to face the day? Most of the population is stuck on a glucose roller coaster.<br> <br>In her first book, the instant #1 internationally bestselling <i>Glucose Revolution</i>, Jessie Inchauspé offered a revolutionary framework for healing through science-backed nutrition hacks. Now, in <i>The Glucose Goddess Method</i>, she shares the “best practical guide for managing glucose to maximize health and longevity” (David Sinclair, PhD, <i>New York Times </i>bestselling author of <i>Lifespan</i>) with this four-week program to incorporating the principles of how to avoid glucose spikes into your everyday life.<br> <br>Complete with 100 recipes and an interactive workbook, you are guided through four simple, science-proven ways to steady your blood sugar, gaining boundless energy, curbing your cravings, clearing your skin, slowing your ageing process, and sleeping better than you ever have before. You will create positive new habits for life. The best part? You won’t be counting calories and can still eat all the foods you love.	
69	I WILL TEACH YOU TO BE RICH, SECOND EDITION	1523505745	9781523505746	<b>The groundbreaking <i>NEW YORK TIMES</i> and <i>WALL STREET JOURNAL</i> BESTSELLER that taught a generation how to earn more, save more, and live a rich life—now in a revised 2nd edition.</b><br>  <br> Buy as many lattes as you want. Choose the right accounts and investments so your money grows for you—automatically. Best of all, spend guilt-free on the things you love.<br>  <br> Personal finance expert Ramit Sethi has been called a “wealth wizard” by <i>Forbes</i> and the “new guru on the block” by <i>Fortune</i>. Now he’s updated and expanded his modern money classic for a new age, delivering a simple, powerful, no-BS 6-week program that just works.<br>  <br><i>I Will Teach You to Be Rich</i> will show you:<br> • How to crush your debt and student loans faster than you thought possible<br> • How to set up no-fee, high-interest bank accounts that won’t gouge you for every penny<br> • How Ramit automates his finances so his money goes exactly where he wants it to—and how you can do it too<br> • How to talk your way out of late fees (with word-for-word scripts)<br> • How to save hundreds or even thousands per month (and still buy what you love)<br> • A set-it-and-forget-it investment strategy that’s dead simple and beats financial advisors at their own game<br> • How to handle buying a car or a house, paying for a wedding, having kids, and other big expenses—stress free<br> • The exact words to use to negotiate a big raise at work<br>  <br><b>Plus, this 10th anniversary edition features over 80 new pages, including:</b><br> • New tools<br> • New insights on money and psychology<br> • Amazing stories of how previous readers used the book to create their rich lives<br>  <br> Master your money—and then get on with your life.<br><br>  	
70	Y'ALL EAT YET?	0063087782	9780063087781	<p>From country music sensation Miranda Lambert, comes a gorgeous cookbook sharing a wide array of tasty favorite recipes, straight outta Texas and collected from all the fabulous women who helped make Miranda who she is today. </p> <p>If you're going to have a Bitchin Kitchen, you're going to need a few things--plenty of room, plenty of good food for sharing, high spirits (in both senses) and all the friends and family you can fit. For Miranda Lambert, a good time means sharing a great meal with the women who helped raise her back in Texas--her mom and a colorful bunch of best friends who could raise the roof, come through in a pinch, celebrate, cry, and really, really cook. Miranda Lambert invites readers into this special circle of sisterhood with collection of recipes and stories. Y'all Eat Yet? is full of recipes for meals that fill your belly, and your soul, food meant to be shared, meant to be eaten with your fingers off of paper plates, or on your fanciest antique China. Some were handed down to Miranda from her mom and grandma, some come from the circle of cherished friends who helped raise her, and all of them are meant to be easy to prepare and shared with those you love. True to Miranda's personality, Y'all Eat Yet? is sassy and inviting. Whether she's cooking up omelets in her tricked-out Airstream to serve with Mimosas or laying out the Whiskey cupcakes next to Nonny's Banana pudding, Y'all Eat Yet? delivers food you want to make alongside charming stories that show just why Miranda Lambert is one of the most beloved artists in country music today.</p>	
71	THE LOVE STORIES OF THE BIBLE SPEAK	0063226057	9780063226050	<p>Instant New York Times Bestseller! </p><p>The Bible is full of "love" stories. But the Biblical idea of love is so much bigger than we imagine. </p><p>Love is at the heart of the Bible. From the moment Adam declared Eve "flesh of my flesh"...to the sacrificial love of Joseph for Mary...to the deep friendship of David and Jonathan...to the abounding and never-changing love of God: The Bible is a love story. But it also redefines the way the world tells us we should think about love.</p><p>The Bible reveals not just butterflies and broken hearts. In Scripture, we see God's beautiful design for the partnership of marriage. We witness friendships that cross all boundaries. We watch as families navigate the many seasons of life. Our guiding example for them all is the deepest, most abiding, foundational love ever known: God's unconditional love for His people.</p><p>In The Love Stories of the Bible Speak, Shannon Bream draws lessons from the good, the bad, and the ugly of Biblical romances, friendships, and families. She shows how God's love is often very different from ours, turning upside down our assumptions about life, relationships, and each other.</p><p>The Love Stories of the Bible Speak reminds us that, no matter where we find ourselves, God's unwavering love will sustain and guide us. These insights into biblical relationships will uplift and encourage you, and reveal new dimensions to the most central Christian duty: to love God and your neighbor. </p>	
131	SPY CAMP	1534499377	9781534499379	<b>The second book in the <i>New York Times</i> bestselling Spy School series continues in graphic novel form as aspiring spy Ben Ripley must spend his summer in top-secret training—and is thrown back into danger.</b><br><br>Ben Ripley is a middle schooler whose school is not exactly average—he’s spent the last year training to be a top-level spy and dodging all sorts of associated danger. So now that summer’s finally here, Ben would like to have some fun and relax. But that’s not going to happen during required spy survival training at a rustic wilderness camp, where SPYDER, an enemy spy organization, has infiltrated the spies’ ranks. Can Ben root out the enemy before it takes him out—for good?	Illustrated by anjan sarkar
72	THE SUN AND THE STAR	1368081150	9781368081153	<b>Demigods Nico di Angelo and Will Solace must endure the terrors of Tartarus to rescue an old friend in this thrilling adventure co-written by <i>New York Times</i> #1 best-selling author Rick Riordan and award-winning author Mark Oshiro.</b><br><br>Percy Jackson fans, rejoice! Nico and Will have a book of their own!<br><br>As the son of Hades, Nico di Angelo has been through so much, from the premature deaths of his mother and sister, to being outed against his will, to losing his friend Jason during the trials of Apollo. But there <i>is </i>a ray of sunshine in his life—literally: his boyfriend, Will Solace, the son of Apollo. Together the two demigods can overcome any obstacle or foe. At least, that's been the case so far...<br><br>Now Nico is being plagued by a voice calling out to him from Tartarus, the lowest part of the Underworld. He thinks he knows who it is: a reformed Titan named Bob whom Percy and Annabeth had to leave behind when they escaped Hades's realm. Nico's dreams and Rachel Dare's latest prophecy leave little doubt in Nico's mind that Bob is in some kind of trouble. Nico has to go on this quest, whether Mr. D and Chiron like it or not. And of course Will insists on coming with. But can a being made of light survive in the darkest part of the world? and what does the prophecy mean that Nico will have to "leave something of equal value behind?" <br><br><b>Nico will have to face demons both internal and external as his relationship with Will is tested to the core in this standalone adventure featuring two of the most popular characters in the Percy Jackson saga.</b><br><br>Complete your Nico di Angelo collection with these series by Rick Riordan: Percy Jackson and the Olympians • The Heroes of Olympus • The Trials of Apollo	
73	THE EYES AND THE IMPOSSIBLE	1524764205	9781524764203	<b><i>NEW YORK TIMES </i>BESTSELLER • From the award-winning author of <i>The Every</i> and the illustrator behind the beloved picture book <i>Her Right Foot</i> comes an endearing and beautifully illustrated story of a dog who unwittingly becomes a hero to a park full of animals.</b><br><br>Johannes, a free dog, lives in an urban park by the sea. His job is to be the Eyes—to see everything that happens within the park and report back to the park’s elders, three ancient Bison. His friends—a seagull, a raccoon, a squirrel, and a pelican—work with him as the Assistant Eyes, observing the humans and other animals who share the park and making sure the Equilibrium is in balance. <br><br>But changes are afoot. More humans, including Trouble Travelers, arrive in the park. A new building, containing mysterious and hypnotic rectangles, goes up. And then there are the goats—an actual <i>boatload </i>of goats—who appear, along with a shocking revelation that changes Johannes’s view of the world.<br><br>A story about friendship, beauty, liberation, and running very, <i>very </i>fast, <i>The Eyes & the Impossible</i> will make readers of all ages see the world around them in a wholly new way.	
74	REFUGEE	0545880831	9780545880831	A tour de force from acclaimed author Alan Gratz (<i>Prisoner B-3087</i>), this timely -- and timeless -- novel tells the powerful story of three different children seeking refuge.<p></p><b>A <i>New York Times</i> bestseller!</b>JOSEF is a Jewish boy living in 1930s Nazi Germany. With the threat of concentration camps looming, he and his family board a ship bound for the other side of the world . . .ISABEL is a Cuban girl in 1994. With riots and unrest plaguing her country, she and her family set out on a raft, hoping to find safety in America . . .MAHMOUD is a Syrian boy in 2015. With his homeland torn apart by violence and destruction, he and his family begin a long trek toward Europe . . .All three kids go on harrowing journeys in search of refuge. All will face unimaginable dangers -- from drownings to bombings to betrayals. But there is always the hope of <i>tomorrow</i>. And although Josef, Isabel, and Mahmoud are separated by continents and decades, shocking connections will tie their stories together in the end.This action-packed novel tackles topics both timely and timeless: courage, survival, and the quest for home.	
75	WONDER	0375869026	9780375869020	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER •</b> <b>Millions of people have fallen in love with Auggie Pullman, an ordinary boy with an extraordinary face</b>—<b>who shows us that kindness brings us together no matter how far apart we are.</b> <b>Read the book that inspired the Choose Kind movement, a major motion picture, and the critically acclaimed graphic novel <i>White Bird.</i><br><br>And don't miss R.J. Palacio's highly anticipated new novel, <i>Pony, </i>available now!<br> </b><br><i>I won't describe what I look like. Whatever you're thinking, it's probably worse.</i> <br> <br>August Pullman was born with a facial difference that, up until now, has prevented him from going to a mainstream school. Starting 5th grade at Beecher Prep, he wants nothing more than to be treated as an ordinary kid—but his new classmates can’t get past Auggie’s extraordinary face. Beginning from Auggie’s point of view and expanding to include his classmates, his sister, her boyfriend, and others, the perspectives converge to form a portrait of one community’s struggle with empathy, compassion, and acceptance. In a world where bullying among young people is an epidemic, this is a refreshing new narrative full of heart and hope.<br> <br>R.J. Palacio has called her debut novel “a meditation on kindness” —indeed, every reader will come away with a greater appreciation for the simple courage of friendship. Auggie is a hero to root for, a diamond in the rough who proves that you can’t blend in when you were born to stand out. <i><br></i>	
76	SKANDAR AND THE PHANTOM RIDER	None	9781665942621	Skandar and his friends investigate how immortal unicorns are being slain.	
77	ODDER	1250147425	9781250147424	<p><b>Now a #1 <i>New York Times</i> bestseller! A touching and lyrical tale about a remarkable sea otter, from Newbery Medalist Katherine Applegate, author of <i>Wishtree</i>. <br></b><br>Meet Odder, the Queen of Play: <br><br><i>Nobody has her moves.</i><br><i>She doesn’t just swim to the bottom,</i><br><i>she dive-bombs.</i><br><i>She doesn’t just somersault,</i><br><i>she triple-doughnuts.</i><br><i>She doesn’t just ride the waves,</i><br><i>she makes them.</i><br><br>Odder spends her days off the coast of central California, practicing her underwater acrobatics and spinning the quirky stories for which she’s known. She’s a fearless daredevil, curious to a fault. But when Odder comes face-to-face with a hungry great white shark, her life takes a dramatic turn, one that will challenge everything she believes about herself—and about the humans who hope to save her.<br><br>Inspired by the true story of a Monterey Bay Aquarium program that pairs orphaned otter pups with surrogate mothers, this poignant and humorous tale told in free verse examines bravery and healing through the eyes of one of nature’s most beloved and charming animals.</p>	Illustrated by charles santoso
78	THE COMPLETE COOKBOOK FOR YOUNG CHEFS	1492670022	9781492670025	<p>The #1 New York Times Best Seller <br> IACP Award Winner</p><p>Want to bake the most-awesome-ever cupcakes? Or surprise your family with breakfast tacos on Sunday morning? Looking for a quick snack after school? Or maybe something special for a sleepover? It's all here. Learn to cook like a pro--it's easier than you think.</p><p>For the first time ever, America's Test Kitchen is bringing their scientific know-how, rigorous testing, and hands-on learning to KIDS in the kitchen </p><p>Using kid-tested and approved recipes, America's Test Kitchen has created THE cookbook every kid chef needs on their shelf. Whether you're cooking for yourself, your friends, or your family, The Complete Cookbook for Young Chefs has delicious recipes that will wow </p><ul><li> Recipes were thoroughly tested by more than 750 kids to get them just right for cooks of all skill levels--including recipes for breakfast, snacks and beverages, dinners, desserts, and more.</li><li> Step-by-step photos of tips and techniques will help young chefs feel like pros in their own kitchen</li><li> Testimonials (and even some product reviews ) from kid test cooks who worked alongside America's Test Kitchen will encourage young chefs that they truly are learning the best recipes from the best cooks.</li></ul><p>By empowering young chefs to make their own choices in the kitchen, America's Test Kitchen is building a new generation of confident cooks, engaged eaters, and curious experimenters.<br></p>	
79	FALL OF THE SCHOOL FOR GOOD AND EVIL	0063269538	9780063269538	<p>THE SCHOOL FOR GOOD AND EVIL is the #1 movie now streaming on Netflix--starring Academy Award winner Charlize Theron, Kerry Washington, Laurence Fishburne, Michelle Yeoh, Sofia Wylie, Sophie Anne Caruso, Jamie Flatters, Earl Cave, Kit Young, and many others! </p> <p>What rises . . . must fall.</p> <p>Two brothers</p> <p>One Good.</p> <p>One Evil.</p> <p>In exchange for power and immortality,</p> <p>they watch over the Endless Woods</p> <p>and rule the School for Good and Evil.</p> <p>Yet all School Masters must face a test.</p> <p>Theirs is loyalty.</p> <p>But what happens when loyalty is corrupted? When the bonds of blood are broken?</p> <p>Who will survive? Who will die? And what will become of the school and its students?</p> <p>The journey that started a hundred years ago throttles towards its end. This final chapter in the duology that began with the RISE OF THE SCHOOL FOR GOOD AND EVIL brings the tale of the twin School Masters to the brink of war and a shocking conclusion that will change the course of the school forever. </p>	Illustrated by raidesart
80	ONCE THERE WAS	1665928506	9781665928502	<b>A <i>New York Times </i>bestseller!</b><br> <br><b><i>Fantastic Beasts and Where to Find Them</i> meets Neil Gaiman in this thrilling novel about an Iranian American girl who discovers that her father was secretly a veterinarian to mythical creatures—and that she must take up his mantle, despite the many dangers.</b><br><br><i>Once was, once wasn’t.</i><br> <br>So began the stories Marjan’s father told her as a little girl—fables like the story of the girl who sprung a unicorn from a hunter’s snare, or the nomad boy who rescued a baby shirdal. Tales of extraordinary beasts that filled her with curiosity and wonder.<br> <br>But Marjan’s not a little girl anymore. In the wake of her father’s sudden death, she is trying to hold it all together: her schoolwork, friendships, and keeping her dad’s shoestring veterinary practice from going under. Then, one day, she receives a visitor who reveals something stunning: Marjan’s father was no ordinary veterinarian. The creatures out of the stories he told her were real—and he traveled the world to care for them. And now that he’s gone, she must take his place.<br> <br>Marjan steps into a secret world hidden in plain sight, where mythical creatures are bought and sold, treasured and trapped. She finds friends she never knew she needed—a charming British boy who grew up with a griffon, a runaway witch seeking magic and home—while trying to hide her double life from her old friends and classmates.<br> <br>The deeper Marjan gets into treating these animals, the closer she comes to finding who killed her father—and to a shocking truth that will reawaken her sense of wonder and put humans and beasts in the gravest of danger.	
81	BIG TREE	1338180630	9781338180633	<p><b>The fate of all life on Earth may depend on the bravery of two little seeds in this epic adventure from the #1 <i>New York Times</i> bestselling creator and Caldecott Medalist of <i>The Invention of Hugo Cabret</i>.</b></p><p></p><p>"The tale of the natural world is the greatest story we have to tell, and Brian delivers a brilliant chapter of that tale throughout the pages of <i>Big Tree</i>."<b> -- STEVEN SPIELBERG</b></p><p><b>* </b>"An enthralling and expansive meditation on what it means to be alive on this planet."<b></b>--<b><i><i>Booklist</i></i>, starred review</b></p><p><b>* </b>"A balanced and rich book. . . . Powerful."<b></b>-- <b><i>The Bulletin of the Center for Children's Books</i>, starred and recommended review</b></p><p><b>* </b>"In evocative prose and peppery dialogue . . . the cinematic story journeys across time and space, contemplating the power of life to heal."<b></b>-- <b><i>Publishers Weekly</i>, starred review</b></p><p><b>*</b> "A special, one-of-a-kind book for the whole family that readers won't soon forget." <b>-- <i>School Library Journal</i>, starred review</b></p><p>"Inspirational, important, and beautiful. A fable for our times."<b> -- Alan Gratz, bestselling author of <i>Refugee</i> and <i>Ground Zero</i></b></p><p><b><i>"Hello, stars. I thought I heard you calling me."</i></b></p><p>A mysterious voice has been speaking to Louise in her dreams. She and her brother Merwin are Sycamore seeds, who hope to one day set down roots and become big trees. But when a fire forces them to leave their mama tree prematurely, they find themselves catapulted into the unknown, far from home. Alone and unprepared, they must use their wits and imagination to navigate a dangerous world--filled with dinosaurs, meteors, and volcanoes!--and the fear of never finding a safe place to grow up. As the mysterious voice gets louder, Louise comes to realize their mission in life may be much bigger than either of them ever could have imagined!</p><p>Brimming with humor, wonder, mystery, and a profound sense of hope, <i>Big Tree</i> is a trailblazing adventure, illustrated with nearly 300 pages of breathtaking pictures. It is Selznick's most imaginative and far-reaching work to date and a singular reading experience for the whole family.</p><p>The audiobook edition of BIG TREE is brought magnificently to life by Meryl Streep and features music composed by Ernest Troost.</p>	
82	A DAY WITH NO WORDS	1736949799	9781736949795	<b><b>A must-read that belongs in every home and classroom, <i>A Day With No Words</i> invites readers into the life of an Autism Family who communicates just as the child does, without spoken language</b>.</b><br><br>The American Library Association Booklist starred review boasts, “The story is written from the boy's first-person perspective, however—a clever choice in that it gives readers a direct look into his mind and reinforces the book's crucial statement that nonverbal people have as many words and as much intelligence as anyone else. Cosgrove's art, throughout, does an amazing job of transporting readers into his perspective, employing various color tones, metaphoric imagery, and ‘camera’ angles to reflect the deep expressiveness contained in every page [...] through this book, neurotypicals' eyes will be opened, and everyone in Autistic Families will feel seen—and heard.”<br> <br><i>A Day With No Words</i> is a colorful and engaging picture book for young readers shares what life can look like for families who use nonverbal communication, utilizing tools to embrace their unique method of "speaking."<br> <br> The story highlights the bond between mother and child and follows them on a day where they use a tablet to communicate with others.<br> <br> Written by an autistic mother of two autistic sons and the creator behind the popular @Fidgets.and.Fries social media platform and illustrated by Kate Cosgrove (IG @k8cosgrove), <i>A Day With No Words</i> successfully normalizes communication methods outside of verbal speech and provides representation of neurodiversity and autism in a way that affirms and celebrates.<br> <br> <b>The experts are raving!</b><br> <br> "How lucky are we to finally get Tiffany's poignant words and message into children's hands through this impactful story. Children and families can now be touched by her brilliance and learn about the often-overlooked autistics who communicate differently. The importance of <i>A Day With No Words</i> cannot be overstated in its potential to expose readers, young and old alike, to the beauties and barriers of living the autistic experience." — Ali Cunningham Abbott, PhD, LMHC, author of <i>Counseling Adults with Autism: A Comprehensive Toolkit</i><br> <br> “Through <i>A Day with No Words</i>, Tiffany Hammond provides us a rare window to the non-speaking world of autism. She has done so with love, compassion, and, I believe, deep understanding. And Kate Cosgrove's illustrations make it a beautiful world indeed. Bravo and thank you to both Hammond and Cosgrove for this window!” — Samantha S. Supernaw, LCSW-S, Licensed Therapist & Clinical Supervisor<br> <br> “In my past 20 years as a developmental pediatrician, I have never read anything quite like <i>A Day With No Words</i>, a book that so eloquently, lyrically, and vividly captures the essence and beauty of an autistic mind. This book is a gift to all who read it.” — Wendy J. Ross, MD, Fellow of the American Academy of Pediatrics, Developmental Pediatrician, Associate Professor Jefferson University, Director Jefferson Health Center for Autism and Neurodiversity<br> <br> <b>About the Author:</b> Tiffany Hammond (she/her) is the voice behind the Fidgets and Fries platform. She is an Autistic mother, advocate, and storyteller who uses her personal experiences with Autism and parenting two Autistic boys to guide others on their journey.<br> <br> Tiffany has a Masters in Developmental Psychology and spends her time teaching, coaching, and mentoring others in Disability Justice issues.<br> <br> Her activism is rooted in challenging the current perception of Autism as a lifelong burden, cultivating a community that explores the concept of Intersectionality and inspiring thought leaders through storytelling, education, and critical discourse.	Illustrated by kate cosgrove
83	I LOVE MOM WITH THE VERY HUNGRY CATERPILLAR	0451533461	9780451533463	<b>Celebrate Mom's special day with The Very Hungry Caterpillar in this colorful book featuring Eric Carle's joyful illustrations.<br><br></b>Show Mom just how much she means with this colorful book from the World of Eric Carle. Join The Very Hungry Caterpillar as he honors Mother's Day and celebrates incredible parents everywhere. With joyful illustrations and colorful creatures, this charming keepsake is a great way to show parents, grandparents, soon-to-be mothers, aunts, friends, or whomever you call "Mom" just how much you care.	
84	WHY A SON NEEDS A MOM	1728235847	9781728235844	<p>Based on Gregory Lang's New York Times bestselling original series! The perfect Mother's Day gift of love or sweet keepsake to show why Mom is so special! </p><p>A touching picture book for kids ages 3-7 and beyond showcasing all the ways a mother will help her child grow, this is the gift for every mom and little boy to celebrate their special bond. Featuring charming animal illustrations and heartwarming rhymes about the loving moments mothers and sons share, Why a Son Needs a Mom is the perfect story to connect mother and son together.</p><p>From the moment that I saw your beautiful face, </p><p>Held you close to my heart in a mother's embrace, </p><p>I promised to help you grow with strength and grace.</p><p>My dear one, my sweet son, my boy.</p><p>For new moms, mothers-to-be, or for that perfect mother-son moment at birthdays and other special occasions all year, this sweet storybook celebrates how a mother helps her little boy grow with strength and love.	Illustrated by gail yerrill
85	BECAUSE I HAD A TEACHER	1943200084	9781943200085	We all remember our favorite teacher.<p>Where would we be without them - those special people who inspire us, support us, and encourage us? Whether they're an educator, a coach, or a mentor, this book is for them. To celebrate the worlds they open up for us and to thank them for the difference they make.<p>This heartwarming book is a thank you gift for great teachers everywhere. Perfect for National Teacher Day, Teacher Appreciation Week, the end of the school year, or just because.	Illustrated by natalie russell
90	THE DAY THE CRAYONS QUIT	0399255370	9780399255373	<b>The hilarious, colorful #1 <i>New York Times</i> bestselling phenomenon that every kid wants! Gift a copy to someone you love today.<br></b><br> Poor Duncan just wants to color. But when he opens his box of crayons, he finds only letters, all saying the same thing: His crayons have had enough! They quit! Blue crayon needs a break from coloring all those bodies of water. Black crayon wants to be used for more than just outlining.  And Orange and Yellow are no longer speaking—each believes he is the true color of the sun. What can Duncan possibly do to appease all of the crayons and get them back to doing what they do best?<br><br>With giggle-inducing text from Drew Daywalt and bold and bright illustrations from Oliver Jeffers, <i>The Day the Crayons Quit</i> is the perfect gift for new parents, baby showers, back-to-school, or any time of year! Perfect for fans of <i>Don't Let the Pigeon Drive the Bus </i>by Mo Willems and <i>The True Story of the Three Little Pigs </i>by Jon Sciezka and Lane Smith. <br><br><b>Praise for <i>The Day the Crayons Quit:</i></b><br><br><b>Amazon’s 2013 Best Picture Book of the Year</b><br><b>A Barnes & Noble Best Book of 2013</b><br><b>Goodreads’ 2013 Best Picture Book of the Year </b><br><b>Winner of the E.B. White Read-Aloud Award</b><br><br>* “Hilarious . . . Move over, <i>Click, Clack, Moo</i>; we’ve got a new contender for the most successful picture-book strike.” –<b><i>BCCB</i>, starred review </b><br><br>“Jeffers . . . elevates crayon drawing to remarkable heights.” –<b><i>Booklist</i></b><br><br>“Fresh and funny.” –<b><i>The Wall Street Journal</i></b><br><br>"This book will have children asking to have it read again and again.” –<b><i>Library Media Connection</i></b><br><br>* “This colorful title should make for an uproarious storytime.” –<b><i>School Library Journal</i>, starred review </b><br><br>* “These memorable personalities will leave readers glancing apprehensively at their own crayon boxes.” –<b><i>Publishers Weekly</i>, starred review </b><br><br>“Utterly original.” –<b><i>San Francisco Chronicle</i></b>	Illustrated by oliver jeffers
91	I WISH YOU MORE	1452126992	9781452126999	Some books are about a single wish. Some books are about three wishes. The infallible team of Amy Krouse Rosenthal and Tom Lichtenheld have combined their extraordinary talents to create this exuberant, inspirational book for kids of endless good wishes. Wishes for curiosity and wonder, for friendship and strength, laughter and peace. Whether celebrating life's joyous milestones, sharing words of encouragement, or observing the wonder of everyday moments, this sweet and uplifting book is perfect for wishers of every age.<br><br>Whether this is a preschool graduation gift, a present for elementary kids, or just a positive book for kids in your life, this book of wishes is sure to bring positivity to all who read it.	Illustrated by tom lichtenheld
92	THE HUNGER GAMES	1338635174	9781338635171	<b>Ambition will fuel him.</b><b>Competition will drive him.</b><b>But power has its price.</b><p></p>It is the morning of the reaping that will kick off the tenth annual Hunger Games. In the Capitol, eighteen-year-old Coriolanus Snow is preparing for his one shot at glory as a mentor in the Games. The once-mighty house of Snow has fallen on hard times, its fate hanging on the slender chance that Coriolanus will be able to outcharm, outwit, and outmaneuver his fellow students to mentor the winning tribute. The odds are against him. He's been given the humiliating assignment of mentoring the female tribute from District 12, the lowest of the low. Their fates are now completely intertwined -- every choice Coriolanus makes could lead to favor or failure, triumph or ruin. Inside the arena, it will be a fight to the death. Outside the arena, Coriolanus starts to feel for his doomed tribute... and must weigh his need to follow the rules against his desire to survive no matter what it takes.	
93	THE ONE AND ONLY	0063080087	9780063080089	<p>From beloved powerhouse author Katherine Applegate comes The One and Only Ruby, starring the adorable baby elephant from the Newbery Medal-winning modern classic The One and Only Ivan and its bestselling sequel, The One and Only Bob.</p> <p>Ruby's story picks up a few months after the events of The One and Only Bob. Now living in a wildlife sanctuary, Ruby's caretaker from the elephant orphanage in Africa where she grew up is visiting. Seeing him again brings back a flood of memories both happy and sad of her life before the circus, and she recounts the time she spent in the African savannah to Ivan and Bob.</p> <p>In the timeless way that only Katherine Applegate could craft, this highly anticipated novel in verse is the perfect mix of heartfelt and humorous, poignant and sweet. Artist Patricia Castelao returns to the world of Ivan and his friends with gorgeous black-and-white interior illustrations to complete the story.</p> <p>The One and Only Ruby features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p> <p>This middle grade novel is an excellent choice for tween readers in grades 5 to 8, for independent reading, homeschooling, and sharing in the classroom.</p> <p>Don't miss the film adaptation of The One and Only Ivan, now streaming on Disney+!</p>	
94	DIARY OF A WIMPY KID	141976294X	9781419762949	<b>In <i>Diper Överlöde</i>, book 17 of the Diary of a Wimpy Kid series from #1 international bestselling author Jeff Kinney, Greg Heffley is finding out that the road to fame and glory comes with some hard knocks.</b><br> <br> <br> <br> When he decides to tag along with his brother Rodrick's band, Löded Diper, Greg doesn't realize what he's getting into. But he soon learns that late nights, unpaid gigs, fighting between band members, and money troubles are all part of the rock 'n' roll lifestyle.<br> <br> <br> <br> Can Greg help Löded Diper become the legends they think they are? Or will too much time with Rodrick's band be a diper överlöde?	Written and illustrated by jeff kinney
95	A GOOD GIRL'S GUIDE TO MURDER	1984896393	9781984896391	<b>THE MUST-READ MULTIMILLION BESTSELLING MYSTERY SERIES • Everyone is talking about <i>A Good Girl's Guide to Murder</i>! With shades of Serial and Making a Murderer this is the story about an investigation turned obsession, full of twists and turns and with an ending you'll never expect.</b><br><br>Everyone in Fairview knows the story.<br><br>Pretty and popular high school senior Andie Bell was murdered by her boyfriend, Sal Singh, who then killed himself. It was all anyone could talk about. And five years later, Pip sees how the tragedy still haunts her town.<br><br>But she can't shake the feeling that there was more to what happened that day. She knew Sal when she was a child, and he was always so kind to her. How could he possibly have been a killer?<br><br>Now a senior herself, Pip decides to reexamine the closed case for her final project, at first just to cast doubt on the original investigation. But soon she discovers a trail of dark secrets that might actually prove Sal innocent . . . and the line between past and present begins to blur. Someone in Fairview doesn't want Pip digging around for answers, and now her own life might be in danger.<br><br><br><b>And don't miss the sequel, </b><i><b>Good Girl, Bad Blood!</b> </i><br><br><b>"The perfect nail-biting mystery." —Natasha Preston, #1 <i>New York Times </i>bestselling author</b>	
97	HARRY POTTER	054579143X	9780545791434	<b>The fifth book in the beloved, bestselling Harry Potter series, now illustrated in brilliant full color.</b><p></p><p>There is a door at the end of a silent corridor. And it's haunting Harry Potter's dreams. Why else would he be waking in the middle of the night, screaming in terror? It's not just the upcoming O.W.L. exams; a new teacher with a personality like poisoned honey; a venomous, disgruntled house-elf; or even the growing threat of He-Who-Must-Not-Be-Named. Now Harry Potter is faced with the unreliability of the very government of the magical world and the impotence of the authorities at Hogwarts. Despite this (or perhaps because of it), he finds depth and strength in his friends, beyond what even he knew; boundless loyalty; and unbearable sacrifice.</p><p></p><p>This stunning illustrated edition brings together the talents of award-winning artists Jim Kay and Neil Packer in a visual feast, featuring iconic scenes and much loved characters -- Tonks, Luna Lovegood, and many more -- as the Order of the Phoenix keeps watch over Harry Potter's fifth year at Hogwarts. With its oversized format, high-quality paper, ribbon bookmark, and color on nearly every page, this edition is the perfect gift for Harry Potter fans and book lovers of all ages.</p>	
98	CAPTAIN UNDERPANTS	1338865390	9781338865394	<b>Celebrate the 25th and a half anniversary of THE ADVENTURES OF CAPTAIN UNDERPANTS with a special edition featuring a BRAND NEW 32-page DOG MAN comic!</b><p></p><p>George and Harold are best friends who enjoy making their own comic books. Together they've created the greatest superhero in the history of their elementary school: Captain Underpants! His true identity is SO secret, even HE doesn't know who he is! Tra-la-laaaaa! It's can't-miss fun!</p><p>After the Captain Underpants adventure, join George and Harold as they share their never-before-seen bonus comics: <i>Captain Underpants Meets Dog Man</i> and <i>Dog Man and the League of Misfits</i>.</p><p><i>The Adventures of Captain Underpants</i> is the first book in the worldwide bestselling Captain Underpants series by Dav Pilkey. Dive into the newest graphic novel in the Dog Man series: <b>Dog Man: Twenty Thousand Fleas Under the Sea</b>. For even more adventures, creativity, and humor, join Flippy and Li'l Petey in the <b>Cat Kid Comic Club</b> series. Reading gives you superpowers!</p>	Written and illustrated by dav pilkey
99	WINGS OF FIRE	1338883194	9781338883190	<b>Discover where it all began! The #1 <i>New York Times </i>and <i>USA Today </i>bestselling series takes flight in this epic adventure of five dragons destined and determined to save their world.</b><p></p><p>Clay has lived his whole life under the mountain. The MudWing dragonet knows that war is raging between the dragon tribes in the world outside -- a war that he and four other dragonets are destined to end, according to the mysterious Prophecy they've been taught. The five "chosen" dragonets were stolen from their homes while they were still in their eggs and hidden away ever since -- all to fulfill the Prophecy.</p><p></p><p>But not every dragonet wants a destiny. And when danger threatens one of their own, Clay and his friends must choose freedom over fate . . . leave the mountain . . . and set the dragon world on a course that no one could have predicted.</p>	
100	THE INHERITANCE GAMES	0759555400	9780759555402	<b>2 MILLION COPIES SOLD OF THE #1 BESTSELLING SERIES!<br> <br> <br> <br> Don't miss this <i>New York Times</i> bestselling "impossible to put down" (Buzzfeed) novel with deadly stakes, thrilling twists, and juicy secrets -- perfect for fans of <i>One of Us is Lying</i> and <i>Knives Out</i>.</b><br> <br> <br> <br> Avery Grambs has a plan for a better future: survive high school, win a scholarship, and get out. But her fortunes change in an instant when billionaire Tobias Hawthorne dies and leaves Avery virtually his entire fortune. The catch? Avery has no idea why -- or even who Tobias Hawthorne is.<br> <br> <br> <br> To receive her inheritance, Avery must move into sprawling, secret passage-filled Hawthorne House, where every room bears the old man's touch -- and his love of puzzles, riddles, and codes. Unfortunately for Avery, Hawthorne House is also occupied by the family that Tobias Hawthorne just dispossessed. This includes the four Hawthorne grandsons: dangerous, magnetic, brilliant boys who grew up with every expectation that one day, they would inherit billions. Heir apparent Grayson Hawthorne is convinced that Avery must be a conwoman, and he's determined to take her down. His brother, Jameson, views her as their grandfather's last hurrah: a twisted riddle, a puzzle to be solved. Caught in a world of wealth and privilege with danger around every turn, Avery will have to play the game herself just to survive.<br> <br> <br> <br> **<i>Avery's story continues in</i> The Hawthorne Legacy <i>and</i> The Final Gambit	
101	WHO WAS/IS . . . ?	0448483203	9780448483207	This fascinating addition to the best-selling Who Was...? series does not settle questions of theology. Instead, it presents young readers with a biography that covers what is known historically about Jesus and places in his life in the context of his world when Jerusalem was part of the Roman Empire. In an even-handed and easy-to-read narrative, this title—illustrated with eighty black-and-white drawings—also explains the early origins of Christianity and how it became a major religion.	
102	SOLITAIRE	1338863428	9781338863420	<b>The amazing novel that introduced Nick and Charlie from HEARTSTOPPER -- and the unforgettable Tori Spring.</b><p></p><p>Tori Spring isn't sure how to be happy again. Then she meets Michael Holden, and they try to unmask the mysterious Solitaire (and survive high school) in Alice Oseman's stunning, unflinchinghonest debut novel, which first introduced her fan-favorite Heartstopper characters Nick and Charlie.</p>	
103	FIVE SURVIVE	0593374169	9780593374160	<b>Eight hours. Six friends. Five survive. A road trip turns deadly in this addictive YA thriller from the bestselling author of the worldwide phenomenon A GOOD GIRL'S GUIDE TO MURDER. </b><br><br>Red Kenny is on a road trip for spring break with five friends: Her best friend - the older brother - his perfect girlfriend - a secret crush - a classmate - and a killer. <br><br>When their RV breaks down in the middle of nowhere with no cell service, they soon realize this is no accident. They have been trapped by someone out there in the dark, someone who clearly wants one of them dead.<br><br>With eight hours until dawn, the six friends must escape, or figure out which of them is the target. But is there a liar among them? Buried secrets will be forced to light and tensions inside the RV will reach deadly levels. Not all of them will survive the night. . . .	
104	WARRIOR GIRL UNEARTHED	1250766583	9781250766588	<p><b>#1 New York Times bestselling author of Firekeeper's Daughter Angeline Boulley takes us back to Sugar Island in this high-stakes thriller about the power of discovering your stolen history.</b><br><br>Perry Firekeeper-Birch has always known who she is - the laidback twin, the troublemaker, the best fisher on Sugar Island. Her aspirations won't ever take her far from home, and she wouldn't have it any other way. But as the rising number of missing Indigenous women starts circling closer to home, as her family becomes embroiled in a high-profile murder investigation, and as greedy grave robbers seek to profit off of what belongs to her Anishinaabe tribe, Perry begins to question everything. <br><br>In order to reclaim this inheritance for her people, Perry has no choice but to take matters into her own hands. She can only count on her friends and allies, including her overachieving twin and a charming new boy in town with unwavering morals. Old rivalries, sister secrets, and botched heists cannot - will not - stop her from uncovering the mystery before the ancestors and missing women are lost forever.<br><br><b>Sometimes, the truth shouldn't stay buried.</b></p>	
105	IMOGEN, OBVIOUSLY	0063045877	9780063045873	<p>With humor and insight, #1 New York Times bestseller Becky Albertalli explores the nuances of sexuality, identity, and friendship in this timely new novel.</p> <p>Imogen Scott may be hopelessly heterosexual, but she's got the World's Greatest Ally title locked down.</p> <p>She's never missed a Pride Alliance meeting. She knows more about queer media discourse than her very queer little sister. She even has two queer best friends. There's Gretchen, a fellow high school senior, who helps keep Imogen's biases in check. And then there's Lili--newly out and newly thriving with a cool new squad of queer college friends.</p> <p>Imogen's thrilled for Lili. Any ally would be. And now that she's finally visiting Lili on campus, she's bringing her ally A game. Any support Lili needs, Imogen's all in.</p> <p>Even if that means bending the truth, just a little.</p> <p>Like when Lili drops a tiny queer bombshell: she's told all her college friends that Imogen and Lili used to date. And none of them know that Imogen is a raging hetero--not even Lili's best friend, Tessa.</p> <p>Of course, the more time Imogen spends with chaotic, freckle-faced Tessa, the more she starts to wonder if her truth was ever all that straight to begin with. . .</p>	
106	NICK AND CHARLIE	1338885103	9781338885101	<p>From the mega-bestselling creator of <i>Heartstopper</i>, a must-have novella in which <i>Heartstopper's</i> lead characters, Nick and Charlie, face one of their biggest challenges yet.</p><p></p><p><i>Absence makes the heart grow fonder... right? </i></p><p>Everyone knows that Nick and Charlie love their nearly inseparable life together. But soon Nick will be leaving for university, and Charlie, a year younger, will be left behind. Everyone's asking if they're staying together, which is a stupid question... or at least that's what Nick and Charlie assume at first.</p><p>As the time to say goodbye gets inevitably closer, both Nick and Charlie start to question whether their love is strong enough to survive being apart. Charlie is sure he's holding Nick back... and Nick can't tell what Charlie's thinking.</p><p>Things spiral from there.</p><p>Everyone knows that first loves rarely last forever. What will it take for Nick and Charlie to defy the odds?</p>	
107	SILVER IN THE BONE	0593481658	9780593481653	<b><b>INSTANT #1 <i>NEW YORK TIMES</i> BESTSELLER • From the critically acclaimed author of <i>Lore</i> comes a stunning new Arthurian fantasy—the tale of a teenage girl who seeks her destiny in the cursed ruins of Avalon, driven by love, revenge, and pure adrenaline!</b><br><br>"<b>Simmering with magic, peril, romance, and heartbreak</b>."<b> </b></b>—Leigh Bardugo, #1 <i>New York Times</i> bestselling author of <i>Shadow and Bone</i><br><br>Born without a trace of magic, Tamsin Lark is no match for the sorceresses and Hollowers who populate the magical underground of Boston. But when the only parent she’s ever known disappears without so much as a goodbye, she has no choice but to join in their cutthroat pursuit of enchanted relics to keep herself—and her brother, Cabell—alive.<br><br>Ten years later, rumors are swirling that her guardian found a powerful ring from Arthurian legend just before he vanished. A run-in with her rival Emrys ignites Tamsin’s hope that the ring could free Cabell from a curse that threatens both of them. But they aren’t the only ones who covet the ring.<br><br>As word spreads, greedy Hollowers start circling, and many would kill to have it for themselves. While Emrys is the last person Tamsin would choose to partner with, she needs all the help she can get to edge out her competitors in the race for the ring. Together, they dive headfirst into a vipers’ nest of dark magic, exposing a deadly secret with the power to awaken ghosts of the past and shatter her last hope of saving her brother. . . .<br><i><br></i>	
108	THE FIRST TO DIE AT THE END	0063240807	9780063240803	<p>In this prequel to the bestselling phenomenon They Both Die at the End, two new strangers spend a life-changing day together after Death-Cast first makes their fateful calls. #1 New York Times bestseller!</p> <p>It's the night before Death-Cast goes live, and there's one question on everyone's mind: Can Death-Cast actually predict when someone will die, or is it just an elaborate hoax?</p> <p>Orion Pagan has waited years for someone to tell him that he's going to die. He has a serious heart condition, and he signed up for Death-Cast so he could know what's coming.</p> <p>Valentino Prince is restarting his life in New York. He has a long and promising future ahead and he only registered for Death-Cast after his twin sister nearly died in a car accident.</p> <p>Orion and Valentino cross paths in Times Square and immediately feel a deep connection. But when the first round of End Day calls goes out, their lives are changed forever--one of them receives a call, and the other doesn't. Though neither boy is certain how the day will end, they know they want to spend it together...even if that means their goodbye will be heartbreaking.</p> <p>Told with acclaimed author Adam Silvera's signature bittersweet touch, this story celebrates the lasting impact that people have on each other and proves that life is always worth living to the fullest. </p> <p>* A Publishers Weekly Best Book of the Year *</p>	
132	THE RUSSIAN	1538703580	9781538703588	<b>When a serial killer crashes Detective Michael Bennett's wedding, he and his new partner uncover a gruesome string of cold-case homicides across the country.<br> <br> ​</b><br> <br> Weeks before NYPD Detective Michael Bennett is to marry his longtime love, Mary Catherine, an assassin announces his presence in the city with a string of grisly murders. Each victim is a young woman. And each has been killed in a manner as precise as it was gruesome.<br> <br> <br> <br> Tasked with working alongside the FBI, Bennett and his gung-ho new partner uncover multiple cold-case homicides across the country that fit the same distinctive pattern--proving the perpetrator they seek is as experienced at ending lives as he is at evading detection.<br> <br> <br> <br> Bennett promises Mary Catherine that the case won't affect their upcoming wedding. But as Bennett prepares to make a lifetime commitment, the killer has a lethal vow of his own to fulfill.	
109	THE LITTLE MERMAID: AGAINST THE TIDE	1368077226	9781368077224	<b>An original novel written by <i>New York Times</i> best-selling author J. Elle inspired by Disney upcoming live action reimagining of <i>The Little Mermaid</i>.</b><br> <br> After the death of Ariel's mother, the queen of the sea, the seven daughters of King Triton have grown estranged at best. It's been years since Ariel's older sisters have visited home. But this year's Coral Moon is fast approaching, and it's a special one for Ariel. Finally fifteen, she will be dubbed the Protector of her very own ocean territory as is tradition, and her sisters have agreed to visit for the celebration.<br> <br> But the ceremony is halted when Mala, one of the most renowned daughters of Triton, is abducted. The only clue to where she might have been taken is a hastily scribbled seaweed note, which says, "What could have saved Mother could save me, too." To rescue Mala, Ariel must work together with her siblings, traveling to various seas, outsmarting dangerous ocean creatures, and delving into forbidden waters to find the truth of what happened to their mother. But as Ariel and her sisters begin uncovering new secrets about their family and their kingdom, Ariel will have to face the loss of a mother she never had a chance to know and discover what it means to be both a good sister and a strong leader.<br> <br> And the clock is ticking, because on the day of the festival, when the moon turns a true shade of coral, her sister will be lost, like her mother, forever.	
110	LIGHTLARK	1419760866	9781419760860	<b>An instant #1 National Bestselle</b><b>r--so</b><b>on to be a major motion picture. #BookTok phenomenon and award-winning author Alex Aster delivers readers a masterfully written, utterly gripping YA fantasy novel </b> <p> Welcome to the Centennial. <p> Every 100 years, the island of Lightlark appears to host the Centennial, a deadly game that only the rulers of six realms are invited to play. The invitation is a summons--a call to embrace victory and ruin, baubles and blood. The Centennial offers the six rulers one final chance to break the curses that have plagued their realms for centuries. Each ruler has something to hide. Each realm's curse is uniquely wicked. To destroy the curses, one ruler must die. <p> Isla Crown is the young ruler of Wildling--a realm of temptresses cursed to kill anyone they fall in love with. They are feared and despised, and are counting on Isla to end their suffering by succeeding at the Centennial. <p> To survive, Isla must lie, cheat, and betray...even as love complicates everything. <p><b>Filled with secrets, deception, romance, and twists worthy of the darkest thrillers, <i>Lightlark </i>is a must-read for fans of legendary fantasy writers Marie Lu, Marissa Meyer, and Leigh Bardugo. </b>	
111	THE STOLEN HEIR	0316592706	9780316592703	<p><b>An Instant #1 <i>New York Times</i> Bestseller!<br> <br> <br> <br> An Instant #1 Indie Bestseller!<br> <br> <br> <br> Return to the opulent world of Elfhame, filled with intrigue, betrayal, and dangerous desires, with this first book of a captivating new duology from the #1 <i>New York Times</i> bestselling author Holly Black. </b><br> <br> <br> <br> <i>A runaway queen. A reluctant prince. And a quest that may destroy them both.</i><br> <br> <br> <br> Eight years have passed since the Battle of the Serpent. But in the icy north, Lady Nore of the Court of Teeth has reclaimed the Ice Needle Citadel. There, she is using an ancient relic to create monsters of stick and snow who will do her bidding and exact her revenge.<br> <br> <br> <br> Suren, child queen of the Court of Teeth, and the one person with power over her mother, fled to the human world. There, she lives feral in the woods. Lonely, and still haunted by the merciless torments she endured in the Court of Teeth, she bides her time by releasing mortals from foolish bargains. She believes herself forgotten until the storm hag, Bogdana chases her through the night streets. Suren is saved by none other than Prince Oak, heir to Elfhame, to whom she was once promised in marriage and who she has resented for years. <br> <br> <br> <br> Now seventeen, Oak is charming, beautiful, and manipulative. He's on a mission that will lead him into the north, and he wants Suren's help. But if she agrees, it will mean guarding her heart against the boy she once knew and a prince she cannot trust, as well as confronting all the horrors she thought she left behind.<br> <br> </p>	
112	THE WISDOM OF THE BULLFROG	1538707942	9781538707944	<b>THE INSTANT #1 <i>New York Times</i> BESTSELLER<br> <br> <br> <br> From the acclaimed, bestselling author of <i>Make Your Bed</i>--a short, inspirational book of advice and leadership lessons that Admiral McRaven collected over his four decades as a Navy SEAL.</b><br> <br> <br> <br> The title "Bullfrog" is given to the Navy SEAL who has served the longest on active duty. Admiral McRaven was honored to receive this honor in 2011 when he took charge of the United States Special Operations Command. When McRaven retired in 2014, he had 37 years as a Navy SEAL under his belt, leading men and women at every level of the special operations community. In the ensuing four years, he served as Chancellor to the entire University of Texas System, with its 230,000 students and 100,000 faculty and health care workers.<br> <br> <br> <br> During those four decades, Admiral McRaven dealt with every conceivable leadership challenge, from commanding combat operations--including the capture of Saddam Hussein, the rescue of Captain Phillips, and the raid for Osama bin Laden. <br> <br> <br> <br> THE WISDOM OF THE BULLFROG draws on these and countless other experiences from Admiral McRaven's incredible life, including crisis situations, management debates, organizational transitions, and ethical dilemmas, to provide readers with the most important leadership lessons he has learned over the course of his forty years of service. Each chapter provides a <i>Make Your Bed</i>-like parable, rich with insights like those featured in his bestselling memoir, <i>Sea Stories</i>, about the specific leadership traits required to be at the top of your game, including: <ul> <li>Who Dares, Wins</li> <li>Run to the Sound of the Guns</li> <li>No Plan Survives First Contact with the Enemy</li> </ul> THE WISDOM OF THE BULLFROG is Admiral McRaven's clear-eyed treatise on the leadership qualities that separate the good from the truly great.	
113	POVERTY, BY AMERICA	0593239911	9780593239919	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • The Pulitzer Prize–winning author of <i>Evicted</i> reimagines the debate on poverty, making a “provocative and compelling” (NPR) argument about why it persists in America: because the rest of us benefit from it.<br><br>“Urgent and accessible . . . Its moral force is a gut punch.”—<i>The New Yorker</i></b><br> <br><b>ONE OF THE MOST ANTICIPATED BOOKS OF 2023: <i>The Washington Post, Time, Esquire, Newsweek, Minneapolis Star Tribune, Elle, Salon, Lit Hub, Kirkus Reviews<br></i></b><br>The United States, the richest country on earth, has more poverty than any other advanced democracy. Why? Why does this land of plenty allow one in every eight of its children to go without basic necessities, permit scores of its citizens to live and die on the streets, and authorize its corporations to pay poverty wages? <br> <br>In this landmark book, acclaimed sociologist Matthew Desmond draws on history, research, and original reporting to show how affluent Americans knowingly and unknowingly keep poor people poor. Those of us who are financially secure exploit the poor, driving down their wages while forcing them to overpay for housing and access to cash and credit. We prioritize the subsidization of our wealth over the alleviation of poverty, designing a welfare state that gives the most to those who need the least. And we stockpile opportunity in exclusive communities, creating zones of concentrated riches alongside those of concentrated despair. Some lives are made small so that others may grow.<br> <br>Elegantly written and fiercely argued, this compassionate book gives us new ways of thinking about a morally urgent problem. It also helps us imagine solutions. Desmond builds a startlingly original and ambitious case for ending poverty. He calls on us all to become poverty abolitionists, engaged in a politics of collective belonging to usher in a new age of shared prosperity and, at last, true freedom.	
114	DARE TO LEAD	0399592520	9780399592522	<b>#1 <i>NEW YORK TIMES </i>BESTSELLER • Brené Brown has taught us what it means to dare greatly, rise strong, and brave the wilderness. Now, based on new research conducted with leaders, change makers, and culture shifters, she’s showing us how to put those ideas into practice so we can step up and lead.<br><br><b>Don’t miss the five-part HBO Max docuseries <i>Brené Brown: Atlas of the Heart</i>!</b><br><br>NAMED ONE OF THE BEST BOOKS OF THE YEAR BY </b><i><b>BLOOMBERG</b><br></i><br> Leadership is not about titles, status, and wielding power. A leader is anyone who takes responsibility for recognizing the potential in people and ideas, and has the courage to develop that potential.<br><br> When we dare to lead, we don’t pretend to have the right answers; we stay curious and ask the right questions. We don’t see power as finite and hoard it; we know that power becomes infinite when we share it with others. We don’t avoid difficult conversations and situations; we lean into vulnerability when it’s necessary to do good work.<br><br> But daring leadership in a culture defined by scarcity, fear, and uncertainty requires skill-building around traits that are deeply and uniquely human. The irony is that we’re choosing not to invest in developing the hearts and minds of leaders at the exact same time as we’re scrambling to figure out what we have to offer that machines and AI can’t do better and faster. What can <i>we</i> do better? Empathy, connection, and courage, to start.<br><br> Four-time #1 <i>New York Times</i> bestselling author Brené Brown has spent the past two decades studying the emotions and experiences that give meaning to our lives, and the past seven years working with transformative leaders and teams spanning the globe. She found that leaders in organizations ranging from small entrepreneurial startups and family-owned businesses to nonprofits, civic organizations, and Fortune 50 companies all ask the same question: <br><br> <b>How do you cultivate braver, more daring leaders, and how do you embed the value of courage in your culture? </b><br><br> In this new book, Brown uses research, stories, and examples to answer these questions in the no-BS<i> </i>style that millions of readers have come to expect and love.<br><br> Brown writes, “One of the most important findings of my career is that daring leadership is a collection of four skill sets that are 100 percent teachable, observable, and measurable. It’s learning and unlearning that requires brave work, tough conversations, and showing up with your whole heart. Easy? No. Because choosing courage over comfort is not always our default. Worth it? Always. We want to be brave with our lives and our work. It’s why we’re here.”<br><br>Whether you’ve read <i>Daring Greatly </i>and<i> Rising Strong</i> or you’re new to Brené Brown’s work, this book is for anyone who wants to step up and into brave leadership.	
139	TOM CLANCY: ZERO HOUR	0593422740	9780593422748	<b><b>Jack Ryan, Jr. is the one man who can prevent a second Korean War in the latest thrilling entry in the #1 <i>New York Times</i> bestselling series.</b></b><br><br>When the leader of North Korea is catastrophically injured, his incapacitation inadvertently triggers a “dead-man’s switch,” activating an army of sleeper agents in South Korea and precipitating a struggle for succession. <br> <br>Jack Ryan, Jr. is in Seoul to interview a potential addition to the Campus.  But his benign trip takes a deadly turn when a wave of violence perpetrated by North Korean operatives grips South Korea’s capital.  A mysterious voice from North Korea offers Jack a way to stop the peninsula’s rush to war, but her price may be more than he can afford to pay.	
115	EXTREME OWNERSHIP	1250183863	9781250183866	<p><b>From Jocko Wilnick, the <i>New York Times</i> best selling author of <i>Discipline Equals Freedom</i> and <i>Leadership Strategy and Tactics</i>, an updated edition of the blockbuster bestselling leadership book that took America and the world by storm, two U.S. Navy SEAL officers who led the most highly decorated special forces unit of the Iraq War demonstrate how to apply powerful leadership principles from the battlefield to business and life. Now with an excerpt from the authors' new book, THE DICHOTOMY OF LEADERSHIP. </b><br><br>Combat, the most intense and dynamic environment imaginable, teaches the toughest leadership lessons, with absolutely everything at stake. Jocko Willink and Leif Babin learned this reality first-hand on the most violent and dangerous battlefield in Iraq. As leaders of SEAL Team Three’s Task Unit Bruiser, their mission was one many thought impossible: help U.S. forces secure Ramadi, a violent, insurgent-held city deemed “all but lost.” In gripping, firsthand accounts of heroism, tragic loss, and hard-won victories, they learned that leadership—at every level—is the most important factor in whether a team succeeds or fails. <br><br>Willink and Babin returned home from deployment and instituted SEAL leadership training to pass on their harsh lessons of self-discipline, mental toughness and self-defense learned in combat to help forge the next generation of SEAL leaders. After leaving the SEAL Teams, they launched a company, Echelon Front, to teach those same leadership principles to leaders in businesses, companies, and organizations across the civilian sector. Since that time, they have trained countless leaders and worked with hundreds of companies in virtually every industry across the U.S. and internationally, teaching them how to develop their own high-performance teams and most effectively lead those teams to dominate their battlefields.<br><br>Since it’s release in October 2015, <i>Extreme Ownership</i> has revolutionized leadership development and set a new standard for literature on the subject. Required reading for many of the most successful organizations, it has become an integral part of the official leadership training programs for scores of business teams, military units, and first responders. Detailing the resilient mindset and total focus principles that enable SEAL units to accomplish the most difficult combat missions, Extreme Ownership demonstrates how to apply them to any team or organization, in any leadership environment. A compelling narrative with powerful instruction and direct application, <i>Extreme Ownership</i> challenges leaders everywhere to fulfill their ultimate purpose: lead and win.</p>	
116	PARIS	0063224623	9780063224629	<p>From the woman who is credited for launching what we know as the celebrity focused, "brand" driven, social media obsessed popular culture of today, comes an honest and surprising memoir that reckons with that truth, and shows that there is so much more to Paris Hilton than you might believe.</p> <p>I was born in New York City on February 17, 1981, three days after Valentine's Day. </p> <p>From the time I was a toddler, my brain skipped and flickered with the chemical imbalance of ADHD. Sometimes it was too much.</p> <p>I'm not bragging or complaining about it, just telling you: This is my brain. It has a lot to do with how this whole book thing is going to play out, because I love run-on sentences--and dashes. And sentence fragments. I'm probably going to jump around a lot while I tell the story.</p> <p>I came of age during the most turbulent pop culture period ever.</p> <p>The character I played--part Lucy, part Marilyn--was my steel-plated armor.</p> <p>People loved her. Or they loved to hate her, which was just as marketable. I leaned into that character, my ticket to financial freedom and a safe place to hide. I made sure I never had a quiet moment to figure out who I was without her. I was afraid of that moment because I didn't know what I'd find.</p> <p>I wrote this book in an effort to understand my place in a watershed moment: the technology renaissance, the age of influencers. I also wrote this book so that the world could know who I am today. I focused on key aspects of my life that led to what I am most proud of--how my power was taken away from me and how I took it back, how I built a thriving business, a marriage and a family.</p> <p>There are so many young women who need to hear this story. I don't want them to learn from my mistakes; I want them to stop hating themselves for their own mistakes. I want them to laugh and cry and embrace every aspect of who they are with fearlessness and pride. We all have our own brand of intelligence, and, girl, fuck fitting in.</p>	
117	TWENTY THOUSAND FLEAS UNDER THE SEA	1338801910	9781338801910	<b>DOG MAN IS BACK! The highly anticipated new graphic novel in the #1 worldwide bestselling series starring everyone's favorite canine superhero by award-winning author and illustrator Dav Pilkey!</b><p></p><p>Piggy has returned, and his newest plot is his most diabolical yet. WHAT other new villains are on the horizon? WHERE are they all coming from? And WHO will step forward to save the city when scoundrels sabotage our Supa Buddies?</p><p>With themes of friendship and doing good, <i>Dog Man: Twenty Thousand Fleas Under the Sea</i> is packed with action and hilarity. Featuring "Chomp-O-Rama," a brand-new song, a monstrous Mighty Mite -- and so much more than ever before! IT'S HEROIC, IT'S EPIC!</p><p>For more creative, heartfelt adventures, join Flippy and Li'l Petey in the <b>Cat Kid Comic Club</b> series. And don't forget the series that started it all: Captain Underpants! A new edition of <i>The Adventures of Captain Underpants</i> includes <b>a brand new Dog Man comic!</b> Look for <b>Dog Man with Love: The Official Coloring Book</b>, too!</p>	
118	COLLABORATIONS	1338846620	9781338846621	<b>The Cat Kid Comic Club learns to collaborate in this creative, funny, and insightful graphic novel by Dav Pilkey, the author and illustrator of Dog Man.</b><p></p><p>Excitement and imagination run wild as Naomi, Melvin, Poppy, Gilbert, Curly, and their siblings get back to making comics with originality and laughter. But wait -- have they cleaned their rooms yet?!</p><p>After their chores, the rambunctious group presents even more amazing mini-comics: a thrilling ride in "Chubbs McSpiderbutt," an action-packed romp in "Frogzilla," reflective haikus in "In the Autumn Pond," a candy-coated mystery in "Mallo Cop," and much, much more. By working together, the baby frogs discover that small things can have a huge impact.</p><p>In this innovative graphic novel series, award-winning author and illustrator Dav Pilkey employs a variety of techniques -- including origami, acrylic paints, colored pencils, photography, collage, gouache, watercolors, and more -- to capture the creative and joyful spirit of collaboration. The variety of art styles, paired with Pilkey's trademark storytelling and humor, inspires imagination and innovation for readers of all ages.</p>	
119	MOTHERING HEIGHTS	1338680455	9781338680454	Dog Man and Petey face their biggest challenges yet in the tenth Dog Man book from worldwide bestselling author and illustrator Dav Pilkey.<p></p><p>Dog Man is down on his luck, Petey confronts his not so purr-fect past, and Grampa is up to no good. The world is spinning out of control as new villains spill into town. Everything seems dark and full of despair. But hope is not lost. Can the incredible power of love save the day?</p><p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including love, empathy, kindness, persistence, and the importance of doing good.</p>	
120	MOON RISING	1338730894	9781338730890	<b>The graphic novel adaptations of the #1 New York Times bestselling Wings of Fire series continue to set the world on fire!</b><p></p><p>Peace has come to Pyrrhia... for now.</p><p></p><p>The war between the tribes is finally over, and now the dragonets of the prophecy have a plan for lasting peace: Jade Mountain Academy, a school that will gather dragonets from all the tribes and teach them to live together, perhaps even as friends.</p><p></p><p>Moonwatcher isn't sure how she feels about school, however. Hidden in the rainforest for most of her life, the young NightWing has an awful secret. She can read minds, and even see the future. Living in a cave with dozens of other dragons is noisy, exhausting--and dangerous.</p><p></p><p>In just a few days, Moon finds herself overwhelmed by her secret powers and bombarded by strange thoughts, including those of a mysterious dragon who might be a terrible enemy. And when someone starts attacking dragons within the academy, Moon has a choice to make: Stay hidden and safe? Or risk everything to save her new friends?</p><p></p><p></p><p>The #1 <i>New York Times</i> bestselling Wings of Fire series soars to new heights in the sixth graphic novel adaptation, with art by Mike Holmes.</p>	Illustrated by mike holmes
121	GRIME AND PUNISHMENT	1338535625	9781338535624	<b>The next great Dog Man adventure from the worldwide bestselling author and artist Dav Pilkey. You'll howl with laughter </b><br><br> The Supa Buddies bamboozled the baddies, but all's not right in the world. Dog Man has a new problem to pound, and he's going to need his entire pack to help him. Will he go barking up the wrong tree?<br><br> Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of doing good.	
122	SCHOOL TRIP	0062885537	9780062885531	<p>New York Times bestselling author Jerry Craft is back with the newest adventures of Jordan, Drew, Liam, and all the characters that fans first met in New Kid, winner of the Newbery Award and the Coretta Scott King Author Award! In this full-color contemporary graphic novel, the gang from Riverdale Academy Day is heading to Paris, for an international education like you've never seen before ...</p><p>Jordan, Drew, Liam, Maury, and their friends from Riverdale Academy Day School are heading out on a school trip to Paris. As an aspiring artist himself, Jordan can't wait to see all the amazing art in the famous City of Lights.</p><p>But when their trusted faculty guides are replaced at the last minute, the school trip takes an unexpected--and hilarious--turn. Especially when trying to find their way around a foreign city ends up being almost as tricky as navigating the same friendships, fears, and differences that they struggle with at home.</p><p>Will Jordan and his friends embrace being exposed to a new language, unfamiliar food, and a different culture? Or will they all end up feeling like the "new kid"?</p><p>Don't miss the two hilarious and powerful companion novels by Jerry Craft, New Kid and Class Act!</p>	
123	ONE PIECE, VOL. 102	1974736555	9781974736553	<b>Join Monkey D. Luffy and his swashbuckling crew in their search for the ultimate treasure, One Piece!</b><br><br>As a child, Monkey D. Luffy dreamed of becoming King of the Pirates. But his life changed when he accidentally gained the power to stretch like rubber...at the cost of never being able to swim again! Years later, Luffy sets off in search of the One Piece, said to be the greatest treasure in the world...<br><br>Luffy is back to face Kaido once again, but does he stand any more of a chance in this rematch against the strongest man alive? And on other parts of the island, Sanji and Zolo go up against Kaido’s strongest warriors. Both will need to raise their fighting skills in order to overcome these adversaries!	
124	KAIJU NO. 8, VOL. 6	1974736334	9781974736331	<b>Kafka wants to clean up kaiju, but not literally! Will a sudden metamorphosis stand in the way of his dream?</b><br><br>With the highest kaiju-emergence rates in the world, Japan is no stranger to attack by deadly monsters. Enter the Japan Defense Force, a military organization tasked with the neutralization of kaiju. Kafka Hibino, a kaiju-corpse cleanup man, has always dreamed of joining the force. But when he gets another shot at achieving his childhood dream, he undergoes an unexpected transformation. How can he fight kaiju now that he’s become one himself?!<br><br>Kafka has encountered Kaiju No. 9, but he finds himself unable to transform. Luckily, Kikoru comes to the rescue and goes head-to-head with it. Meanwhile, the Kaiju No. 9 that Captain Narumi encountered undergoes an evolution during battle! With the pressure on, Director General Shinomiya is left with no choice but to act!	
125	FOR WHOM THE BALL ROLLS	1338236598	9781338236590	The Supa Buddies have been working hard to help Dog Man overcome his bad habits. But when his obsessions turn to fears, Dog Man finds himself the target of an all-new supervillain! Meanwhile, Petey the Cat has been released from jail and starts a new life with Li'l Petey. But when Petey's own father arrives, Petey must face his past to understand the difference between being good and doing good. <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of being true to one's self.	
126	MARY ANNE'S BAD LUCK MYSTERY	1338616102	9781338616101	<b>A brand-new Baby-sitters Club graphic novel adapted by newcomer Cynthia Yuan Cheng!</b><p></p><p>Mary Anne should never have thrown away that chain letter she got in the mail. Ever since she did, bad things have been happening to everyone in The Baby-sitters Club. With Halloween coming up, Mary Anne's even more worried -- what kind of spooky thing will happen next?</p><p>Then Mary Anne finds a new note in her mailbox: <i>Wear this bad-luck charm</i>, it says. <i>OR ELSE.</i> Mary Anne has to follow the note's instructions. But who sent the charm? And why did they send it to Mary Anne?</p><p>The BSC might never see an end to their bad luck if they don't solve this mystery soon!</p>	Illustrated by cynthia yuan cheng
127	TEENAGE MUTANT NINJA TURTLES: THE LAST RONIN	1684058414	9781684058419	<b>A <i>New York Times</i> Bestseller!Who is the Last Ronin? In a future, battle-ravaged New York City, a lone surviving Turtle embarks on a seemingly hopeless mission seeking justice for the family he lost. From legendary TMNT co-creators Kevin Eastman and Peter Laird, get ready for the final story of the Teenage Mutant Ninja Turtles three decades in the making!</b><br><br>What terrible events destroyed his family and left New York a crumbling, post-apocalyptic nightmare? All will be revealed in this climactic Turtle tale that sees longtime friends becoming enemies and new allies emerging in the most unexpected places. Can the surviving Turtle triumph?<br><br>Eastman and Laird are joined by writer <b>Tom Waltz</b>, who penned the first 100 issues of IDW's ongoing TMNT series, and artists <b>Esau & Isaac Escorza</b> (<i>Heavy Metal</i>) and <b>Ben Bishop</b> (<i>The Far Side of the Moon</i>) with an Introduction by filmmaker <b>Robert Rodriguez</b>!<br><br>Collects the complete five-issue miniseries in a new graphic novel, an adventure as fulfilling for longtime Turtles fans as it is accessible for readers just discovering the heroes in a half shell.	
128	FETCH-22	1338323210	9781338323214	<b>Li'l Petey gets caught in some family drama in the eighth Dog Man book from worldwide bestselling author and artist Dav Pilkey.</b><br></br>Petey the Cat is out of jail, and he has a brand-new lease on life. While Petey's reevaluated what matters most, Li'l Petey is struggling to find the good in the world. Can Petey and Dog Man stop fighting like cats and dogs long enough to put their paws together and work as a team? They need each other now more than ever -- Li'l Petey (and the world) is counting on them! <p>Dav Pilkey's wildly popular Dog Man series appeals to readers of all ages and explores universally positive themes, including empathy, kindness, persistence, and the importance of doing good.	
129	SPY X FAMILY, VOL. 9	1974736288	9781974736287	<b>An action-packed comedy about a fake family that includes a spy, an assassin and a telepath!</b><br><br>Master spy Twilight is unparalleled when it comes to going undercover on dangerous missions for the betterment of the world. But when he receives the ultimate assignment—to get married and have a kid—he may finally be in over his head!<br><br>Yor’s on assignment and finds herself up against a gang of assassins on board a luxury cruiser. Meanwhile, Loid and Anya each discover that bombs have been planted throughout the ship! Will their best efforts be enough to save the vessel?	
133	SUSPECTS	1984821709	9781984821706	<b><b><i>NEW YORK TIMES </i>BESTSELLER • A dedicated CIA agent becomes an unexpected ally to a woman haunted by the kidnapping of her family, in this thrilling novel from #1 <i>New York Times</i> bestselling author Danielle Steel.</b></b><br><br>Theodora Morgan is fashion royalty. Founder of a wildly popular online shopping service, she is one of the most successful businesswomen in the world, although she prefers to keep a low profile, especially over the last months. It was a year ago when the unthinkable struck her family, and her husband, industry mogul Matthieu Pasquier, and their son were kidnapped and held for ransom—a nightmare that ended in tragedy.<br> <br>The case has gone cold, despite evidence linking the crime to Matthieu’s Russian competitors. Theo has reluctantly gone back to work running her company. On the flight to a launch party for one of her highly anticipated pop-up shops in New York City, she crosses paths with high-society networker Pierre de Vaumont. Theo politely invites him to her event—unaware that Pierre has been flagged by the CIA.<br> <br>Senior supervising CIA operative Mike Andrews investigates Pierre’s suspicious Russian contacts and clears him to enter the country, but when he realizes that Theodora Morgan is on the same flight, he becomes concerned for her safety. Posing as a lawyer, Mike begins a covert mission—starting with Theo’s opening party. When Mike and Theo meet, their connection is instant, but Theo is completely unaware of Mike’s true objective or identity… or that the life she is rebuilding is in grave danger.	
134	TWO ALONE	0778334449	9780778334446	The only way to stay alive is to stick together.<br> <br> When their plane crashes in the remote reaches of the Northwest Territories, confident businesswoman Rusty Carlson finds herself hurt and alone with a man she can't stand to be around. Vietnam vet Cooper Landry holds a deep-rooted grudge against beautiful women, but he's survived far worse and he'll be damned if he lets them both die in the wilderness.<br> <br> The ex-soldier's training has prepared him with the skills to defend against the predators in the dense woods--both animal and human--but that's not all that awaits the couple. What Rusty and Cooper couldn't have expected is their shared desire for more than just survival...<br> <br>	
135	LEGACY	1250775000	9781250775009	<p><b>#1 <i>New York Times</i> bestselling author Nora Roberts presents <i>Legacy</i>, a new novel of a mother and a daughter, of ambition and romance, and of a traumatic past reawakened by a terrifying threat...</b><br><br>Adrian Rizzo was seven when she met her father for the first time. That was the day he nearly killed her—before her mother, Lina, stepped in.<br><br>Soon after, Adrian was dropped off at her grandparents’ house in Maryland, where she spent a long summer drinking lemonade, playing with dogs, making a new best friend—and developing the stirrings of a crush on her friend’s ten-year-old brother. Lina, meanwhile, traveled the country promoting her fitness brand and turning it into a billion-dollar business. There was no point in dwelling on the past.<br><br>A decade later, Adrian has created her own line of yoga and workout videos, following in Lina’s footsteps but intent on maintaining creative control. And she’s just as cool-headed and ambitious as her mother. They aren’t close, but they’re cordial—as long as neither crosses the other.<br><br>But while Lina dismisses the death threats that Adrian starts getting as a routine part of her daughter’s growing celebrity, Adrian can’t help but find the vicious rhymes unsettling. Year after year, they keep arriving—the postmarks changing, but the menacing tone the same. They continue after she returns to Maryland and becomes reacquainted with Raylan, her childhood crush, all grown up and as gorgeously green-eyed as ever. Sometimes it even seems like the terrifying messages are indeed routine, like nothing will come of them. Until the murders start, and the escalation begins...</p>	
136	DEATH OF THE BLACK WIDOW	1538753081	9781538753088	<b>She destroys the men she loves--and escapes every time. The most dangerous killer James Patterson has ever created is also his most seductive.</b><br> <br> <br> <br> On his first night with Detroit PD, Officer Walter O'Brien is called to a murder scene. A terrified twenty-year-old has bludgeoned her kidnapper with skill that shocks even O'Brien's veteran partner. The young woman is also a brilliant escape artist. Her bold flight from police custody makes the case impossible to solve--and, for Walter, even more impossible to forget.<br> <br> <br> <br> By the time Walter's promoted to detective, his fascination with the missing, gray-eyed woman is approaching obsession. And when Walter discovers that he's not alone in his search, one truth is certain. This deadly string of secrets didn't begin in his home city--but he's going to make sure it ends there. <br> <br>	
137	MERCY	1538719711	9781538719718	<b>FBI Agent Atlee Pine's harrowing search for her long-lost sister Mercy reaches a boiling point in this breakneck thriller from #1 <i>New York Times</i> bestselling author David Baldacci. </b><br> <br> <br> <br> For her entire life, FBI agent Atlee Pine has been searching for her twin sister, Mercy, who was abducted at the age of six and never seen again. Mercy's disappearance left behind a damaged family that later shattered beyond repair when Atlee's parents inexplicably abandoned her.<br> <br> <br> <br> Now, after a perilous investigation that nearly proved fatal, Atlee has finally discovered not only the reason behind her parents' abandonment and Mercy's kidnapping, but also the most promising breakthrough yet: proof that Mercy survived her abduction and then escaped her captors many years ago. <br> <br> <br> <br> Though Atlee is tantalizingly close to her family at last, the final leg of her long road to Mercy will be the most treacherous yet. Mercy left at least one dead body behind before fleeing her captors years before. Atlee has no idea if her sister is still alive, and if so, how she has been surviving all this time. When the truth is finally revealed, Atlee Pine will face the greatest danger yet, and it may well cost her everything.	
138	THE JENSENS OF COLORADO	0786050136	9780786050130	<b>THE FIRST FAMILY OF THE AMERICAN FRONTIER<br> <br><i>The national bestselling novels of William W. and J.A. Johnstone bring the American West to crackling life. Now together in one omnibus for the first time, three epic sagas of the fearless—and ever-growing—Jensen clan—pioneers willing to fight for justice.</i></b><br><br><b>THOSE JENSEN BOYS</b><br>Ace and Chance are as reckless and wild as the frontier itself. Their father is Luke Jensen, thought killed in the Civil War. Their uncle Smoke is one of the fiercest gunfighters in the West. It’s no surprise the twins have a knack for taking risks—and blasting their way out of them.<br><br><b>THE JENSEN BRAND</b><br>Smoke is injured swapping bullets with cow thieves on the Sugarloaf Ranch and Sally puts out a call for help to the rest of the Jensen clan. Just back from studying in Europe, Denise Jensen can ride like a man, shoot like her daddy, and face down the deadliest outlaws like nobody’s business.<br><br><b>HEART OF THE MOUNTAIN MAN </b><br>Smoke has no choice but to come down off the mountain and go head-to-head with outlaw Big Jim Slaughter to save his friend Monte Carson. A fiery clash of courage, fury, and guns is on the docket, and only one man will be left standing after the dust settles.	
140	SAVE IT FOR SUNDAY	078604957X	9780786049578	<b><i>From the greatest western writers of the 21st century, the second adventure featuring circuit rider Taylor Callahan. a mysterious man in black who rides from town to town with a bible in hand and guns in his holsters, delivering the word of God and hard-fought justice…</i></b><br><br><b>From Confederate marauder to rebel gunfighter to repentant preacherman, circuit rider Taylor Callahan’s road to perdition has been a hellish ride. Sinners beware.</b><br><b> </b><br>After riding with Missouri bushwhackers, Taylor Callahan vowed to never take another life. He’s making good on it in Peaceful Valley. By day, swamping a saloon. By night, preaching the Good Book. But this little settlement is about to become anything but peaceable. When the marshal takes a bullet in a sheepman-cattleman skirmish he pins a badge on Taylor leaving the circuit rider open to whole new world of hell . . .<b> </b><br><b> </b><br>A railroad engineer building a line from Laramie to Denver is cutting across Arapaho land starting a war on Peace Treaty Peak. If that’s not enough to set the county on fire, Taylor’s trigger-happy past comes calling. The revenge-seeking Harris boys are hot on his tail. With the marshal down, Peaceful Valley is ripe for the taking—and blasting Taylor to kingdom come is part of the deal. If keeping the peace means breaking Taylor’s vow so be it. He’s looking forward to strapping on his Colt .45 again. That’s the gospel truth.	
141	THE LAST HOUSE GUEST	1668012790	9781668012796	<b>**A Reese Witherspoon x Hello Sunshine Book Club Pick and <i>New York Times </i>bestseller<i>**</i></b><br> <br><b>A year after a summer guest dies under suspicious circumstances, her best friend lives under a cloud of grief and suspicion in this “fast-paced and gripping” (<i>People</i>) thriller filled with “dizzying plot twists and multiple surprise endings” (<i>The New York Times Book Review).</i></b><br><br>Littleport, Maine, has always felt like two separate towns: an ideal vacation enclave for the wealthy, whose summer homes line the coastline; and a simple harbor community for the year-round residents whose livelihoods rely on service to the visitors.<br> <br>Typically, fierce friendships never develop between a local and a summer girl—but that’s just what happens with visitor Sadie Loman and Littleport resident Avery Greer. Each summer for almost a decade, the girls are inseparable—until Sadie is found dead. While the police rule the death a suicide, Avery can’t help but feel there are those in the community, including a local detective and Sadie’s brother, Parker, who blame her. Someone knows more than they’re saying, and Avery is intent on clearing her name, before the facts get twisted against her.<br> <br>“A riveting read…from master of suspense, Megan Miranda,” (Mary Kubica, <i>New York Times </i>bestselling author of <i>The Good Girl</i>) <i>The Last House Guest</i> is a clever, twisty mystery that brilliantly explores the elusive nature of memory and the complexities of female friendships.	
142	ONE NIGHT	006108185X	9780061081859	<p>From #1 <i>New York Times</i> bestselling author Debbie Macomber comes a remarkable story of dreams awakened and lives transformed in . . . One Night </p> <p>Carrie Jamison has the success part of "having it all" down pat—but "love/marriage/family" seem just out of reach. Still, she enjoys the admiration of everyone at KUTE radio . . . well, <i>almost</i> everyone. Serious, straightlaced newscaster Kyle Harris disapproves of Carrie, which leads to tension, confrontation . . . and then, inexplicably, to one extraordinary night! </p> <p>Now Kyle's determined to make an honest woman out of her! But though her dreams seem merely an "I do" away, Carrie needs to <i>really</i> know if love or guilt is inflaming Kyle's ardor. Because if it isn't true love, this happily-ever-after is never going to happen. </p>	
143	GETTING EVEN	1420155547	9781420155549	<b>Who doesn’t fantasize about a little payback? Revenge is a timeless, all-too-human desire, and it’s a common thread in <i>Yesterday’s Lies </i>and <i>Zachary’s Law – </i>two classic, fan-favorite novels by #1 <i>New York Times</i> bestselling author Lisa Jackson that are now available in one thrilling romantic suspense omnibus of revenge, obsession, and deception…</b><br><br><i>“Trask McFadden is back.”</i> Those are words that Tory has been waiting to hear, half in dread, half with longing. It’s been five years since Trask landed her father behind bars for horse swindling, using things she’d told him in confidence. Her father died there, but now Trask insists he has information that could help prove who was really responsible for the crime, not to mention his own brother’s death. Trask needs <i>her</i> help. But he won’t get it, not after destroying her family, her ranch, and the love they shared.<br><br>Lauren Regis’s ex-husband has kidnapped her children. There’s nothing she won’t do to get them back, including hiring Zachary Winters. The unconventional attorney has made a name for himself by locating people—especially those who don’t want to be found. But he’s got a darker reputation too, and there are rumors swirling about the fate of his ex-wife. How much is Lauren willing to trust him—or to lose?	
144	SOMEDAY WITH YOU	1335452796	9781335452795	Two classic stories about getting a second chance to embrace life and discover love!<br> <br> Cordina's Crown Jewel<br> <br> On the run from her palace, Her Royal Highness Camilla de Cordina wants to be just plain Camilla MacGee, even if it's only for a few weeks. Working in rural Vermont for the handsome yet grouchy archaeologist Delaney Caine is the perfect cover. But Camilla's irritation with the man soon turns into desire, and eventually the royal runaway knows she'll have to confess her secret...<br> <br> Unfinished Business<br> <br> Concert pianist Vanessa Sexton has finally returned to her small Maryland hometown after having her heart shattered by her high school sweetheart twelve years ago. Once a reckless boy, Brady Tucker has now become a solid, dependable man. Still, he stood her up on the most important night of her life--can she ever trust him again?	
145	READY FOR MARRIAGE	1335498419	9781335498410	BESTSELLING AUTHOR COLLECTION<br> Reader-favorite romances in collectible volumes from our bestselling authors.<br> <br> Ready for Marriage by #1 New York Times bestselling author Debbie Macomber Three years ago, Mary Jo Summerhill fell completely in love with Evan Dryden. But his family said she wasn't the "right kind of wife" for Evan. Mary Jo agreed--she didn't belong in his world. So she lied and broke his heart.<br> <br> But now Mary Jo's parents are facing legal trouble, and she needs Evan's professional advice. Meanwhile, Evan wants answers to all the questions he's had for the past three years. Do they have a second chance?<br> <br> FREE BONUS STORY INCLUDED IN THIS VOLUME!<br> <br> A Family for Easter by New York Times bestselling author Lee Tobin McClain<br> <br> When wealthy single mom Fiona Farmingham rents her carriage house to widowed Eduardo Delgado, it's purely in friendship. But with half a dozen little matchmakers involved, can they find the courage to reach for happiness once more?	
146	THE JUDGE'S LIST	0593157834	9780593157831	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • Investigator Lacy Stoltz follows the trail of a serial killer, and closes in on a shocking suspect—a sitting judge—in “one of the best crime reads of the year.… Bristling with high-tech detail and shivering with suspense…. Worth staying up all night to finish” (<i>Wall Street Journal</i>).</b><br><br>In <i>The Whistler</i>, Lacy Stoltz investigated a corrupt judge who was taking millions in bribes from a crime syndicate. She put the criminals away, but only after being attacked and nearly killed. Three years later, and approaching forty, she is tired of her work for the Florida Board on Judicial Conduct and ready for a change.<br><br>Then she meets a mysterious woman who is so frightened she uses a number of aliases. Jeri Crosby’s father was murdered twenty years earlier in a case that remains unsolved and that has grown stone cold. But Jeri has a suspect whom she has become obsessed with and has stalked for two decades. Along the way, she has discovered other victims.<br><br>Suspicions are easy enough, but proof seems impossible. The man is brilliant, patient, and always one step ahead of law enforcement. He is the most cunning of all serial killers. He knows forensics, police procedure, and most important: he knows the law.<br><br>He is a judge, in Florida—under Lacy’s jurisdiction.<br><br>He has a list, with the names of his victims and targets, all unsuspecting people unlucky enough to have crossed his path and wronged him in some way. How can Lacy pursue him, without becoming the next name on his list?<br><br>The Judge’s List is by any measure John Grisham’s most surprising, chilling novel yet.<br><b><i> </i></b><br><b><i>Don’t miss John Grisham’s new book, </i>THE EXCHANGE: AFTER<i> THE FIRM, coming soon!</i></b>	
147	THE ONE AND ONLY IVAN	0061992275	9780061992278	<p>Soon to be a major motion picture!</p><p>Winner of the Newbery Medal and a #1 New York Times bestseller</p><p>This unforgettable novel from renowned author Katherine Applegate celebrates the transformative power of unexpected friendship. Inspired by the true story of a captive gorilla known as Ivan, this illustrated book is told from the point of view of Ivan himself. </p><p>Having spent twenty-seven years behind the glass walls of his enclosure in a shopping mall, Ivan has grown accustomed to humans watching him. He hardly ever thinks about his life in the jungle. Instead, Ivan occupies himself with television, his friends Stella and Bob, and painting. But when he meets Ruby, a baby elephant taken from the wild, he is forced to see their home, and his art, through new eyes.</p><p>In the tradition of timeless stories like Charlotte's Web and Stuart Little, Katherine Applegate blends humor and poignancy to create an unforgettable story of friendship, art, and hope.</p><p>The One and Only Ivan features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p><p>Plus don't miss Katherine Applegate's Endling series!</p>	Illustrated by patricia castelao
148	THE WILD ROBOT	0316382000	9780316382007	<b><i>Wall-E</i> meets <i>Hatchet</i> in this <i>New York Times </i>bestselling illustrated middle grade novel from Caldecott Honor winner Peter Brown</b><i><b><br></b></i><i>Can a robot survive in the wilderness?</i><br> When robot Roz opens her eyes for the first time, she discovers that she is all alone on a remote, wild island. She has no idea how she got there or what her purpose is--but she knows she needs to survive. After battling a violent storm and escaping a vicious bear attack, she realizes that her only hope for survival is to adapt to her surroundings and learn from the island's unwelcoming animal inhabitants. <br>As Roz slowly befriends the animals, the island starts to feel like home--until, one day the robot's mysterious past comes back to haunt her.<br>From bestselling and award-winning author and illustrator Peter Brown comes a heartwarming and action-packed novel about what happens when nature and technology collide.<br>	
149	WISH	1250144051	9781250144058	<p><b>Don't miss Barbara O'Connor's other middle-grade work—like <i>Wonderland; How to Steal a Dog; Greetings from Nowhere; Fame and Glory in Freedom, Georgia; The Fantastic Secret of Owen Jester; </i>and more!</b><br><br><i>A touching, </i>New York Times<i>–bestselling story about a girl and her dog, perfect for young animal lovers.</i><br><br>Eleven-year-old Charlie Reese has been making the same secret wish every day since fourth grade. She even has a list of all the ways there are to make the wish, such as cutting off the pointed end of a slice of pie and wishing on it as she takes the last bite. But when she is sent to the Blue Ridge Mountains of North Carolina to live with family she barely knows, it seems unlikely that her wish will ever come true. That is until she meets <br>Wishbone, a skinny stray dog who captures her heart, and Howard, a neighbor boy who proves surprising in lots of ways. Suddenly Charlie is in serious danger of discovering that what she thought she wanted may not be what she needs at all. <br><br>From award-winning author Barbara O'Connor comes a middle-grade novel about a girl who, with the help of a true-blue friend, a big-hearted aunt and uncle, and the dog of her dreams, unexpectedly learns the true meaning of family in the least likely of places.<br><br>This title has Common Core connections.</p>	
150	A LONG WALK TO WATER	0547577311	9780547577319		
151	RESTART	1338053809	9781338053807	<b>#1 <i>New York Times</i> bestselling author Gordon Korman harkens back to his <i>No More Dead Dogs</i> days in this new stand-alone that takes a more serious tone than ever before.</b><br></br>Chase's memory just went out the window. <p>Chase doesn't remember falling off the roof. He doesn't remember hitting his head. He doesn't, in fact, remember <i>anything</i>. He wakes up in a hospital room and suddenly has to learn his whole life all over again . . . starting with his own name. <p>He knows he's Chase. But who <i>is</i> Chase? When he gets back to school, he sees that different kids have very different reactions to his return. <p>Some kids treat him like a hero. Some kids are clearly afraid of him. <p>One girl in particular is so angry with him that she pours her frozen yogurt on his head the first chance she gets. <p>Pretty soon, it's not only a question of who Chase is--it's a question of who he <i>was</i> . . . and who he's going to be. <p>From the #1 bestselling author of <i>Swindle</i> and <i>Slacker</i>, <i>Restart</i> is the spectacular story of a kid with a messy past who has to figure out what it means to get a clean start.	
152	THE ONE AND ONLY BOB	0062991329	9780062991324	<p>A #1 New York Times bestseller and a #1 Indie bestseller!</p> <p>"Good dog Bob. Great to have a best friend."--Danny DeVito</p> <p>Return to the unforgettable world of the Newbery Medal-winning and #1 New York Times bestselling novel The One and Only Ivan in this incredible sequel, starring Ivan's friend Bob! Catch up with these beloved friends before you see the star-studded film adaptation of The One and Only Ivan, now available on Disney+!</p> <p>Bob sets out on a dangerous journey in search of his long-lost sister with the help of his two best friends, Ivan and Ruby. As a hurricane approaches and time is running out, Bob finds courage he never knew he had and learns the true meaning of friendship and family.</p> <p>Bob, Ivan, and Ruby have touched the hearts of millions of readers, and their story isn't over yet. Catch up with these beloved friends before the star-studded film adaptation of The One and Only Ivan hits theaters in August 2020!</p> <p>One and Only Bob is an instant #1 New York Times bestseller, embraced by new and old fans of Katherine Applegate's beloved One and Only Ivan. Great for summer reading or anytime! A Today show pick for "25 children's books your kids and teens won't be able to put down this summer!"</p> <p>In the tradition of timeless stories like Charlotte's Web and Stuart Little, Katherine Applegate blends humor and poignancy to create an unforgettable story of friendship, family, and hope.</p> <p>The One and Only Bob features first-person narrative; author's use of literary devices (personification, imagery); and story elements (plot, character development, perspective).</p> <p>This acclaimed middle grade novel is an excellent choice for tween readers in grades 5 to 8, for independent reading, homeschooling, and sharing in the classroom.</p>	Illustrated by patricia castelao
153	FISH IN A TREE	0142426423	9780142426425	<b>"Fans of R.J. Palacio’s <i>Wonder</i> will appreciate this feel-good story of friendship and unconventional smarts.” —<i>Kirkus Reviews</i></b><br><br>Ally has been smart enough to fool a lot of smart people. Every time she lands in a new school, she is able to hide her inability to read by creating clever yet disruptive distractions.  She is afraid to ask for help; after all, how can you cure dumb? However, her newest teacher Mr. Daniels sees the bright, creative kid underneath the trouble maker. With his help, Ally learns not to be so hard on herself and that dyslexia is nothing to be ashamed of. As her confidence grows, Ally feels free to be herself and the world starts opening up with possibilities. She discovers that there’s a lot more to her—and to everyone—than a label, and that great minds don’t always think alike.<br><br>The author of the beloved <i>One for the Murphys</i> gives readers an emotionally-charged, uplifting novel that will speak to anyone who’s ever thought there was something wrong with them because they didn’t fit in. This paperback edition includes The Sketchbook of Impossible Things and discussion questions.<br><br><b>A <i>New York Times</i> Bestseller! </b><br><br>* “Unforgettable and uplifting.”<b>—<i>School Library Connection</i>, <b>starred review</b><br><br></b>* "Offering hope to those who struggle academically and demonstrating that a disability does not equal stupidity, this is as unique as its heroine.”<b>—<i>Booklist</i>, <b>starred review</b><br><br></b>* “Mullaly Hunt again paints a nuanced portrayal of a sensitive, smart girl struggling with circumstances beyond her control." <b>—<i>School Library Journal</i>, <b>starred review</b> </b>	
154	A WOLF CALLED WANDER	006289594X	9780062895943	<p>A New York Times bestseller! "Don't miss this dazzling tour de force."--Katherine Applegate, Newbery Medal winning author of The One and Only Ivan</p><p>This gripping novel about survival and family is based on the real story of one wolf's incredible journey to find a safe place to call home. Illustrated throughout, this irresistible tale by award-winning author Rosanne Parry is for fans of Sara Pennypacker's Pax and Katherine Applegate's The One and Only Ivan. </p><p>Swift, a young wolf cub, lives with his pack in the mountains learning to hunt, competing with his brothers and sisters for hierarchy, and watching over a new litter of cubs. Then a rival pack attacks, and Swift and his family scatter.</p><p>Alone and scared, Swift must flee and find a new home. His journey takes him a remarkable one thousand miles across the Pacific Northwest. The trip is full of peril, and Swift encounters forest fires, hunters, highways, and hunger before he finds his new home. </p><p>Inspired by the extraordinary true story of a wolf named OR-7 (or Journey), this irresistible tale of survival invites readers to experience and imagine what it would be like to be one of the most misunderstood animals on earth. This gripping and appealing novel about family, courage, loyalty, and the natural world is for fans of Fred Gipson's Old Yeller and Katherine Applegate's Endling. </p><p>Includes black-and-white illustrations throughout and a map as well as information about the real wolf who inspired the novel.</p><p>Plus don't miss Rosanne Parry's stand-alone companion novel, A Whale of the Wild.</p>	Illustrated by mónica armiño
155	OUT OF MY MIND	1416971718	9781416971719	<b>A <i>New York Times</i> bestseller for three years and counting!</b><br> <br><b>“A gutsy, candid, and compelling story. It speaks volumes.” —<i>School Library Journal </i>(starred review)</b><br> <b>“Unflinching and realistic.” —<i>Kirkus</i><i> </i><i>Reviews</i> (starred review)</b><br> <br><b>From award-winning author Sharon Draper comes a story that will forever change how we all look at anyone with a disability, perfect for fans of RJ Palacio’s <i>Wonder</i>.</b><br><br>Eleven-year-old Melody is not like most people. She can’t walk. She can’t talk. She can’t write. All because she has cerebral palsy. But she also has a photographic memory; she can remember every detail of everything she has ever experienced. She’s the smartest kid in her whole school, but NO ONE knows it. Most people—her teachers, her doctors, her classmates—dismiss her as mentally challenged because she can’t tell them otherwise. But Melody refuses to be defined by her disability. And she’s determined to let everyone know it…somehow.	
156	WHEN YOU TRAP A TIGER	1524715735	9781524715731	<b>WINNER OF THE NEWBERY MEDAL • WINNER OF THE ASIAN/PACIFIC AMERICAN AWARD FOR CHILDREN'S LITERATURE • #1 <i>NEW YORK TIMES</i> BESTSELLER<br><br>Would you make a deal with a magical tiger? This uplifting story brings Korean folklore to life as a girl goes on a quest to unlock the power of stories and save her grandmother.</b><br><br><i>Some stories refuse to stay bottled up...</i><br><br>When Lily and her family move in with her sick grandmother, a magical tiger straight out of her halmoni's Korean folktales arrives, prompting Lily to unravel a secret family history. Long, long ago, Halmoni stole something from the tigers. Now they want it back. And when one of the tigers approaches Lily with a deal--return what her grandmother stole in exchange for Halmoni's health--Lily is tempted to agree. But deals with tigers are never what they seem! With the help of her sister and her new friend Ricky, Lily must find her voice...and the courage to face a tiger.<br><br>Tae Keller, the award-winning author of <i>The Science of Breakable Things</i>, shares a sparkling tale about the power of stories and the magic of family. Think <i>Walk Two Moons </i>meets <i>Where the Mountain Meets the Moon</i>!<br><br>"If stories were written in the stars ... this wondrous tale would be one of the brightest." <i>--Booklist</i>, Starred Review	
157	IF HE HAD BEEN WITH ME	1728205484	9781728205489	<p>A New York Times Bestseller</p><p>*A BookTok Viral Sensation* </p><p>An achingly authentic and raw portrait of love, regret, and the life-altering impact of the relationships we hold closest to us, this YA romance bestseller is perfect for fans of Colleen Hoover, Jenny Han, and You've Reached Sam. </p><p>If he had been with me, everything would have been different...</p><p>Autumn and Finn used to be inseparable. But then something changed. Or they changed. Now, they do their best to ignore each other.</p><p>Autumn has her boyfriend Jamie, and her close-knit group of friends. And Finn has become that boy at school, the one everyone wants to be around.</p><p>That still doesn't stop the way Autumn feels every time she and Finn cross paths, and the growing, nagging thought that maybe things could have been different. Maybe they should be together.</p><p>But come August, things will change forever. And as time passes, Autumn will be forced to confront how else life might have been different if they had never parted ways...</p><p>Captivating and heartbreaking, If He Had Been with Me is perfect for readers looking for: </p><ul><li>Contemporary teen romance books</li><li>Unputdownable & bingeworthy novels</li><li>Complex emotional YA stories</li><li>TikTok Books</li><li>Jenny Han meets Dear Even Hanson</li><li>Colleen Hover fans</li></ul>	
158	GIRL IN PIECES	1101934743	9781101934746	<b><b>#1 <i>NEW YORK TIMES</i> BESTSELLER</b><br><br></b>"<b>A haunting, beautiful, and necessary book.</b>"<i>—</i>Nicola Yoon<i>, #1 <i>New York Times</i></i> bestselling author of <i><i>Everything, Everything<br></i></i> <br>Charlotte Davis is in pieces. At seventeen she’s already lost more than most people do in a lifetime. But she’s learned how to forget. The broken glass washes away the sorrow until there is nothing but calm. You don’t have to think about your father and the river. Your best friend, who is gone forever. Or your mother, who has nothing left to give you. <br><br>Every new scar hardens Charlie’s heart just a little more, yet it still hurts so much. It hurts enough to not care anymore, which is sometimes what has to happen before you can find your way back from the edge. <br><br>A deeply moving portrait of a girl in a world that owes her nothing, and has taken so much, and the journey she undergoes to put herself back together. Kathleen Glasgow's debut is heartbreakingly real and unflinchingly honest. It’s a story you won’t be able to look away from.<i><i><br></i></i> <br>And don’t miss Kathleen Glasgow's novels <b><i>You’d Be Home Now </i></b>and <b><i>How to Make Friends with the Dark</i></b>, both raw and powerful stories of life.	
159	BETTER THAN THE MOVIES	1534467637	9781534467637	<b>A <i>USA TODAY</i> and <i>New York Times</i> bestseller</b><br> <br><b>Perfect for fans of Kasie West and Jenn Bennett, this “sweet and funny” (Kerry Winfrey, author of <i>Waiting for Tom Hanks</i>) teen rom-com follows a hopelessly romantic teen girl and her cute yet obnoxious neighbor as they scheme to get her noticed by her untouchable crush.</b><br><br>Perpetual daydreamer Liz Buxbaum gave her heart to Michael a long time ago. But her cool, aloof forever crush never really saw her before he moved away. Now that he’s back in town, Liz will do whatever it takes to get on his radar—and maybe snag him as a prom date—even befriend Wes Bennet.<br> <br>The annoyingly attractive next-door neighbor might seem like a prime candidate for romantic comedy fantasies, but Wes has only been a pain in Liz’s butt since they were kids. Pranks involving frogs and decapitated lawn gnomes do not a potential boyfriend make. Yet, somehow, Wes and Michael are hitting it off, which means Wes is Liz’s in.<br> <br>But as Liz and Wes scheme to get Liz noticed by Michael so she can have her magical prom moment, she’s shocked to discover that she likes being around Wes. And as they continue to grow closer, she must reexamine everything she thought she knew about love—and rethink her own ideas of what Happily Ever After should look like.	
160	THE WAY I USED TO BE	1481449362	9781481449366	<b><i>New York Times </i>bestseller! In the tradition of <i>Speak, </i>Amber Smith's extraordinary debut novel “</b><b>is a heart-twisting, but ultimately hopeful, exploration of how pain can lead to strength” (<i>The Boston Globe</i>).</b><br><br>Eden was always good at being good. Starting high school didn’t change who she was. But the night her brother’s best friend rapes her, Eden’s world capsizes.<br> <br>What was once simple, is now complex. What Eden once loved—who she once loved—she now hates. What she thought she knew to be true, is now lies. Nothing makes sense anymore, and she knows she’s supposed to tell someone what happened but she can’t. So she buries it instead. And she buries the way she used to be.<br> <br>Told in four parts—freshman, sophomore, junior, and senior year—this provocative debut reveals the deep cuts of trauma. But it also demonstrates one young woman’s strength as she navigates the disappointment and unbearable pains of adolescence, of first love and first heartbreak, of friendships broken and rebuilt, all while learning to embrace the power of survival she never knew she had hidden within her heart.	
161	ONE OF US IS LYING	1524714755	9781524714758	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • NAMED ONE OF THE TEN BEST BOOKS OF THE YEAR BY <i>ENTERTAINMENT WEEKLY • BUZZFEED • POPCRUSH</i></b><br><b><br>“Pretty Little Liars meets The Breakfast Club” (<i>Entertainment Weekly</i>) in this addictive mystery about what happens when five strangers walk into detention and only four walk out alive. </b><br> <br>Pay close attention and you might solve this.<br>On Monday afternoon, five students at Bayview High walk into detention.<br><br>    Bronwyn, <b>the brain</b>, is Yale-bound and never breaks a rule.<br>    Addy,<b> the beauty</b>, is the picture-perfect homecoming princess.<br>    Nate, <b>the criminal</b>, is already on probation for dealing.<br>    Cooper, <b>the athlete</b>, is the all-star baseball pitcher.<br>    And Simon, <b>the outcast</b>, is the creator of Bayview High’s notorious gossip app.<br> <br>Only, Simon never makes it out of that classroom. Before the end of detention Simon's dead. And according to investigators, his death wasn’t an accident. On Monday, he died. But on Tuesday, he’d planned to post juicy reveals about all four of his high-profile classmates, which makes all four of them suspects in his murder. Or are they the perfect patsies for a killer who’s still on the loose?<br><br>Everyone has secrets, right? What really matters is how far you would go to protect them.<br><br><b><b>All the secrets of the Bayview Four will be revealed in the TV series now streaming on NBC's Peacock! <br><br><b>And don’t miss the #1 <i>New York Times </i>bestselling sequel, <i>One of Us is Next</i>!</b></b></b>	
162	THE ISLAND	0593481496	9780593481493	<b>INSTANT<i> NEW YORK TIMES</i> BESTSELLER • Hot on the heels of the <i>New York Times </i>bestseller<i>s The Twin </i>and<i> The Lake</i>, another pulse-pounding read from the undisputed queen of YA thrillers!<br><br>They said goodbye to their friends and family for the weekend. They weren’t counting on forever.</b><br><br>Jagged Island: a private amusement park for the very rich—or the very influential. Liam, James, Will, Ava, Harper, and Paisley—social media influencers with millions of followers—have been invited for an exclusive weekend before the park opens. They’ll make posts and videos for their channels and report every second of their VIP treatment. <br><br>When the teens arrive, they're stunned: the resort is even better than they’d imagined. Their hotel rooms are unreal, the park’s themed rides are incredible, and the island is hauntingly beautiful. They’re given a jam-packed itinerary for the weekend. <br><br>But soon they'll discover that something's missing from their schedule: getting off the island alive.	
163	THEY BOTH DIE AT THE END	0062457802	9780062457806	<p>Adam Silvera reminds us that there’s no life without death and no love without loss in this devastating yet uplifting story about two people whose lives change over the course of one unforgettable day.</p><p>New York Times bestseller * 4 starred reviews * A School Library Journal Best Book of the Year * A Kirkus Best Book of the Year * A Booklist Editors' Choice of 2017 * A Bustle Best YA Novel of 2017 * A Paste Magazine Best YA Book of 2017 * A Book Riot Best Queer Book of 2017 * A Buzzfeed Best YA Book of the Year * A BookPage Best YA Book of the Year </p><p>On September 5, a little after midnight, Death-Cast calls Mateo Torrez and Rufus Emeterio to give them some bad news: They’re going to die today.</p><p>Mateo and Rufus are total strangers, but, for different reasons, they’re both looking to make a new friend on their End Day. The good news: There’s an app for that. It’s called the Last Friend, and through it, Rufus and Mateo are about to meet up for one last great adventure—to live a lifetime in a single day.</p><p>In the tradition of Before I Fall and If I Stay, They Both Die at the End is a tour de force from acclaimed author Adam Silvera, whose debut, More Happy Than Not, the New York Times called “profound.”</p><p>Featuring a map of the novel’s characters and their connections, an exclusive essay by the author, and a behind-the-scenes look at the early outlines for this critically acclaimed bestseller. </p>	
164	SIX OF CROWS	125007696X	9781250076960	<p><b>See the Grishaverse com</b><b>e to life on screen with <i>Shadow and Bone</i>, now a Netflix original series. </b><br><br><b>Discover what comes next for heist trio Kaz, Inej, and Jesper -- and the star-crossed Nina and Matthias -- in the</b><b> #1 <i>New York Times</i> bestseller <i>Six of Crows, </i></b><b>Book One of the Six of Crows Duology</b><b>.</b><br><br>Ketterdam: a bustling hub of international trade where anything can be had for the right price—and no one knows that better than criminal prodigy Kaz Brekker. Kaz is offered a chance at a deadly heist that could make him rich beyond his wildest dreams. But he can't pull it off alone. . . .<br><br> <i>A convict with a thirst for revenge.<br><br> A sharpshooter who can't walk away from a wager.<br><br> A runaway with a privileged past.<br><br> A spy known as the Wraith.<br><br> A Heartrender using her magic to survive the slums. <br><br> A thief with a gift for unlikely escapes. </i><br><br> Six dangerous outcasts. One impossible heist. Kaz's crew is the only thing that might stand between the world and destruction—if they don't kill each other first.<br><br> <i>Six of Crows</i> by Leigh Bardugo returns to the breathtaking world of the Grishaverse in this unforgettable tale about the opportunity—and the adventure—of a lifetime.<br><br> <b>Praise for <i>Six of Crows</i>:</b><br><br>“<i>Six of Crows</i> is <b>a twisty and elegantly crafted masterpiece </b>that thrilled me from the beginning to end.” –<i>New York Times</i>-bestselling author Holly Black<br><br> “<i>Six of Crows</i> [is] one of those <b>all-too-rare, unputdownable </b>books that keeps your eyes glued to the page and your brain scrambling to figure out what’s going to happen next.” –Michael Dante DiMartino, co-creator of <i>Avatar: The Last Airbender</i> and <i>The Legend of Korra</i><br><br> “There's conflict between morality and amorality and an appetite for sometimes grimace-inducing violence that recalls the Game of Thrones series. But for every bloody exchange there are pages of <b>crackling dialogue and sumptuous description</b>. Bardugo dives deep into this world, with full color and sound. If you're not careful, <b>it'll steal all your time</b>.” —<i>The New York Times Book Review</i><br><br> Read all the books in the Grishaverse!<br><br><b>The Shadow and Bone Trilogy </b><br> (previously published as The Grisha Trilogy)<br> <i>Shadow and Bone</i><br> <i>Siege and Storm</i><br> <i>Ruin and Rising</i><br><br> <b>The Six of Crows Duology</b><br> <i>Six of Crows</i><br> <i>Crooked Kingdom</i><br><br><b>The King of Scars Duology</b><br><i>King of Scars</i><br><br> <i>The Language of Thorns: Midnight Tales and Dangerous Magic</i><br><i>The Severed Moon: A Year-Long Journal of Magic</i><br><br><b>Praise for the Grishaverse</b><br><br> “A master of fantasy.” —<i>The Huffington Post</i><br> “Utterly, extremely bewitching.” —<i>The Guardian</i><br> “This is what fantasy is for.” —<i>The New York Times Book Review</i><br> “[A] world that feels real enough to have its own passport stamp.” —NPR<br> “The darker it gets for the good guys, the better.” —<i>Entertainment Weekly</i><br> “Sultry, sweeping and picturesque. . . . Impossible to put down.” —<i>USA Today</i><br> “There’s a level of emotional and historical sophistication within Bardugo’s original epic fantasy that sets it apart.” —<i>Vanity Fair</i><br> “Unlike anything I’ve ever read.” —Veronica Roth, bestselling author of <i>Divergent</i><br> “Bardugo crafts a first-rate adventure, a poignant romance, and an intriguing mystery!” —Rick Riordan, bestselling author of the Percy Jackson series</p>	
165	THE BOOK THIEF	0375842209	9780375842207	<b>#1 <i>NEW YORK TIMES</i> BESTSELLER • ONE OF <i>TIME</i> MAGAZINE’S 100 BEST YA BOOKS OF ALL TIME<br><br>The extraordinary, beloved novel about the ability of books to feed the soul even in the darkest of times.</b><br><br><i>When Death has a story to tell, you listen.</i><br><br> It is 1939. Nazi Germany. The country is holding its breath. Death has never been busier, and will become busier still.<br><br> Liesel Meminger is a foster girl living outside of Munich, who scratches out a meager existence for herself by stealing when she encounters something she can’t resist–books. With the help of her accordion-playing foster father, she learns to read and shares her stolen books with her neighbors during bombing raids as well as with the Jewish man hidden in her basement. <br><br> In superbly crafted writing that burns with intensity, award-winning author Markus Zusak, author of <i>I Am the Messenger,</i> has given us one of the most enduring stories of our time.<br>  <br> “The kind of book that can be life-changing.” —<i>The New York Times</i><br>  <br> “Deserves a place on the same shelf with <i>The Diary of a Young Girl </i>by Anne Frank.” —<i>USA Today</i><br><br><b>DON’T MISS <i>BRIDGE OF CLAY</i>, MARKUS ZUSAK’S FIRST NOVEL SINCE <i>THE BOOK THIEF.</i></b>	
166	ONCE UPON A BROKEN HEART		9781250898326		
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_authors (book_author_id, book_id, author_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	7	8
9	8	9
10	8	10
11	9	11
12	10	12
13	11	13
14	12	14
15	13	15
16	14	16
17	15	17
18	16	18
19	17	19
20	18	20
21	19	21
22	20	22
23	21	23
24	22	24
25	23	25
26	24	26
27	25	27
28	26	28
29	27	29
30	28	30
31	29	31
32	30	32
33	31	33
34	32	34
35	33	35
36	34	36
37	35	37
38	35	38
39	35	39
40	36	40
41	37	41
42	38	42
43	39	43
44	40	44
45	41	45
46	42	46
47	43	47
48	44	48
49	44	49
50	45	50
51	45	51
52	46	52
53	47	53
54	48	54
55	49	55
56	50	56
57	51	57
58	52	58
59	53	59
60	54	60
61	55	61
62	56	62
63	57	63
64	58	64
65	59	65
66	60	66
67	60	67
68	61	68
69	62	69
70	63	70
71	64	71
72	65	72
73	66	73
74	67	74
75	68	75
76	69	76
77	70	77
78	71	78
79	72	79
80	72	80
81	73	81
82	74	82
83	75	83
84	76	84
85	77	85
86	78	86
87	79	87
88	80	88
89	81	89
90	82	90
91	83	91
92	84	92
93	84	93
94	85	94
95	86	95
96	87	96
97	88	97
98	89	98
99	90	99
100	91	100
101	92	101
102	93	102
103	94	103
104	95	104
105	96	105
106	97	106
107	98	107
108	99	108
109	100	109
110	101	110
111	101	111
112	102	112
113	103	113
114	104	114
115	105	115
116	106	116
117	107	117
118	108	118
119	109	119
120	110	120
121	111	121
122	112	122
123	113	123
124	114	124
125	115	125
126	115	126
127	116	127
128	117	128
129	118	129
130	119	130
131	120	131
132	121	132
133	122	133
134	123	134
135	124	135
136	125	136
137	126	137
138	127	138
139	127	139
140	127	140
141	128	141
142	129	142
143	130	143
144	131	144
145	132	145
146	132	146
147	133	147
148	134	148
149	135	149
150	136	150
151	136	151
152	137	152
153	138	153
154	138	154
155	139	155
156	140	156
157	140	157
158	141	158
159	142	159
160	143	160
161	144	161
162	145	162
163	145	163
164	146	164
165	147	165
166	148	166
167	149	167
168	150	168
169	151	169
170	152	170
171	153	171
172	154	172
173	155	173
174	156	174
175	157	175
176	158	176
177	159	177
178	160	178
179	161	179
180	162	180
181	163	181
182	164	182
183	165	183
184	166	184
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
6	2	6
7	2	2
8	2	3
9	2	4
10	2	5
11	3	7
12	3	8
13	3	9
14	3	10
15	3	3
16	4	11
17	4	12
18	4	13
19	4	3
20	4	14
21	5	15
22	5	10
23	5	16
24	5	3
25	6	6
26	6	2
27	6	3
28	6	4
29	6	5
30	7	17
31	7	18
32	7	19
33	7	3
34	7	20
35	7	21
36	8	8
37	8	1
38	8	22
39	8	2
40	8	3
41	8	4
42	9	23
43	9	24
44	9	3
45	9	10
46	10	2
47	10	3
48	10	4
49	10	5
50	11	25
51	11	10
52	11	3
53	11	26
54	12	25
55	12	19
56	12	2
57	12	3
58	12	20
59	13	27
60	13	19
61	13	3
62	13	20
63	13	14
64	14	28
65	14	19
66	14	3
67	14	4
68	14	20
69	14	5
70	15	10
71	15	25
72	15	29
73	15	2
74	15	3
75	16	30
76	16	31
77	16	32
78	16	33
79	16	34
80	16	35
81	16	36
82	17	37
83	17	30
84	17	38
85	17	33
86	17	39
87	17	40
88	17	41
89	17	35
90	17	36
91	18	42
92	18	31
93	18	43
94	18	44
95	18	45
96	18	36
97	19	31
98	19	32
99	19	2
100	19	46
101	19	47
102	19	36
103	20	48
104	20	49
105	20	50
106	20	51
107	20	52
108	20	53
109	20	54
110	20	55
111	20	26
112	20	56
113	20	36
114	21	57
115	21	58
116	21	59
117	21	46
118	21	60
119	21	61
120	21	62
121	21	36
122	22	63
123	22	31
124	22	32
125	22	43
126	22	44
127	22	36
128	23	31
129	23	64
130	23	44
131	23	65
132	23	66
133	23	67
134	23	68
135	23	36
136	24	69
137	24	31
138	24	70
139	24	32
140	24	71
141	24	44
142	24	72
143	24	36
144	25	31
145	25	32
146	25	71
147	25	72
148	25	45
149	25	36
150	26	37
151	26	73
152	26	74
153	26	75
154	26	39
155	26	30
156	26	36
157	27	31
158	27	76
159	27	46
160	27	77
161	27	78
162	27	47
163	27	45
164	27	36
165	28	79
166	28	80
167	28	36
168	29	81
169	29	82
170	29	83
171	29	84
172	29	44
173	29	85
174	29	36
175	30	31
176	30	86
177	30	87
178	30	88
179	30	80
180	30	89
181	30	36
182	31	10
183	31	25
184	31	29
185	31	2
186	31	3
187	32	25
188	32	2
189	32	3
190	32	4
191	32	5
192	33	3
193	33	10
194	33	90
195	33	91
196	34	7
197	34	8
198	34	10
199	34	75
200	34	2
201	34	3
202	35	25
203	35	2
204	35	3
205	35	4
206	35	5
207	36	25
208	36	10
209	36	92
210	36	3
211	36	93
212	37	94
213	37	82
214	37	95
215	37	96
216	37	97
217	37	98
218	37	99
219	37	36
220	38	31
221	38	70
222	38	32
223	38	100
224	38	44
225	38	36
226	39	101
227	39	73
228	39	102
229	39	75
230	39	30
231	39	36
232	40	36
233	41	103
234	41	31
235	41	104
236	41	105
237	41	106
238	41	107
239	41	108
240	41	36
241	42	109
242	42	2
243	42	3
244	42	110
245	42	4
246	42	5
247	43	6
248	43	2
249	43	3
250	43	4
251	43	5
252	44	23
253	44	6
254	44	19
255	44	3
256	44	4
257	44	20
258	45	111
259	45	112
260	45	12
261	45	3
262	45	4
263	46	6
264	46	2
265	46	3
266	46	4
267	46	5
268	47	113
269	47	28
270	47	19
271	47	3
272	47	20
273	48	20
274	48	3
275	48	19
276	48	28
277	49	1
278	49	3
279	49	114
280	49	4
281	49	5
282	50	2
283	50	3
284	50	10
285	50	115
286	51	111
287	51	112
288	51	10
289	51	2
290	51	3
291	52	101
292	52	116
293	52	117
294	52	75
295	52	118
296	52	30
297	52	36
298	53	31
299	53	32
300	53	119
301	53	2
302	53	46
303	53	47
304	53	36
305	54	31
306	54	120
307	54	73
308	54	74
309	54	121
310	54	122
311	54	65
312	54	123
313	54	30
314	54	36
315	55	2
316	55	124
317	55	31
318	55	32
319	55	36
320	56	36
321	57	2
322	57	10
323	57	31
324	57	32
325	57	36
326	58	125
327	58	46
328	58	51
329	58	126
330	58	47
331	58	36
332	59	127
333	59	128
334	59	129
335	59	130
336	59	51
337	59	36
338	60	57
339	60	101
340	60	131
341	60	132
342	60	133
343	60	84
344	60	62
345	60	134
346	60	30
347	60	36
348	61	84
349	61	135
350	61	136
351	61	26
352	61	137
353	61	36
354	62	31
355	62	138
356	62	139
357	62	140
358	62	67
359	62	141
360	63	142
361	63	46
362	63	128
363	63	108
364	63	51
365	63	47
366	63	141
367	64	94
368	64	70
369	64	44
370	64	79
371	64	143
372	64	144
373	64	92
374	64	97
375	64	141
376	65	145
377	65	76
378	65	46
379	65	78
380	65	146
381	65	141
382	66	9
383	66	147
384	66	10
385	66	46
386	66	148
387	66	149
388	66	47
389	66	141
390	67	141
391	68	150
392	68	151
393	68	152
394	68	61
395	68	153
396	68	67
397	68	154
398	68	141
399	69	155
400	69	108
401	69	141
402	70	145
403	70	82
404	70	67
405	70	156
406	70	157
407	70	158
408	70	159
409	70	160
410	70	161
411	70	141
412	71	141
413	72	162
414	72	163
415	72	164
416	72	165
417	72	166
418	72	167
419	72	168
420	73	169
421	73	170
422	73	165
423	73	91
424	73	92
425	73	14
426	73	167
427	73	168
428	74	8
429	74	171
430	74	169
431	74	172
432	74	173
433	74	165
434	74	14
435	74	3
436	74	167
437	74	168
438	75	174
439	75	175
440	75	176
441	75	165
442	75	177
443	75	167
444	75	168
445	76	167
446	76	168
447	77	178
448	77	169
449	77	165
450	77	91
451	77	92
452	77	179
453	77	167
454	77	168
455	78	180
456	78	181
457	78	182
458	78	183
459	78	177
460	78	167
461	78	168
462	79	184
463	79	169
464	79	185
465	79	165
466	79	91
467	79	166
468	79	167
469	79	168
470	80	184
471	80	165
472	80	92
473	80	14
474	80	186
475	80	167
476	80	168
477	81	165
478	81	167
479	81	168
480	82	187
481	82	169
482	82	176
483	82	165
484	82	188
485	82	167
486	83	81
487	83	189
488	83	165
489	83	92
490	83	167
491	84	190
492	84	169
493	84	191
494	84	189
495	84	192
496	84	165
497	84	193
498	84	167
499	85	194
500	85	187
501	85	175
502	85	165
503	85	169
504	85	195
505	85	196
506	85	92
507	85	167
508	86	197
509	86	189
510	86	198
511	86	196
512	86	165
513	86	167
514	87	175
515	87	190
516	87	169
517	87	165
518	87	193
519	87	167
520	88	184
521	88	165
522	88	92
523	88	199
524	88	186
525	88	167
526	89	187
527	89	200
528	89	165
529	89	201
530	89	169
531	89	202
532	89	92
533	89	199
534	89	193
535	89	167
536	90	169
537	90	195
538	90	165
539	90	203
540	90	199
541	90	193
542	90	167
543	91	204
544	91	195
545	91	165
546	91	167
547	92	205
548	92	206
549	92	171
550	92	169
551	92	14
552	92	207
553	92	167
554	93	167
555	94	199
556	94	9
557	94	165
558	94	167
559	95	208
560	95	206
561	95	209
562	95	169
563	95	210
564	95	167
565	96	206
566	96	4
567	96	211
568	96	169
569	96	212
570	96	189
571	96	165
572	96	91
573	96	213
574	96	5
575	96	167
576	97	169
577	97	165
578	97	91
579	97	166
580	97	14
581	97	167
582	98	169
583	98	199
584	98	165
585	98	91
586	98	214
587	98	167
588	99	165
589	99	92
590	99	166
591	99	14
592	99	186
593	99	167
594	100	5
595	100	206
596	100	215
597	100	169
598	100	189
599	100	216
600	100	4
601	100	213
602	100	14
603	100	167
604	101	8
605	101	217
606	101	31
607	101	182
608	101	124
609	101	218
610	101	167
611	102	187
612	102	206
613	102	217
614	102	169
615	102	193
616	102	35
617	102	219
618	103	208
619	103	206
620	103	209
621	103	169
622	103	210
623	103	219
624	104	208
625	104	206
626	104	217
627	104	169
628	104	122
629	104	188
630	104	213
631	104	219
632	105	206
633	105	1
634	105	91
635	105	169
636	105	4
637	105	5
638	105	219
639	106	23
640	106	206
641	106	217
642	106	169
643	106	164
644	106	193
645	106	4
646	106	35
647	106	219
648	107	162
649	107	206
650	107	220
651	107	12
652	107	4
653	107	221
654	107	219
655	108	206
656	108	64
657	108	222
658	108	169
659	108	164
660	108	193
661	108	91
662	108	219
663	109	223
664	109	206
665	109	184
666	109	185
667	109	92
668	109	179
669	109	219
670	110	206
671	110	220
672	110	12
673	110	4
674	110	219
675	111	187
676	111	206
677	111	220
678	111	165
679	111	12
680	111	169
681	111	4
682	111	5
683	111	219
684	112	46
685	112	125
686	112	107
687	113	224
688	113	84
689	113	225
690	113	226
691	113	99
692	113	227
693	113	107
694	114	228
695	114	46
696	114	128
697	114	108
698	114	51
699	114	47
700	114	107
701	115	229
702	115	230
703	115	31
704	115	228
705	115	77
706	115	108
707	115	47
708	115	107
709	116	231
710	116	76
711	116	145
712	116	43
713	116	31
714	116	78
715	116	107
716	117	9
717	117	15
718	117	165
719	117	214
720	117	199
721	117	14
722	117	232
723	118	9
724	118	15
725	118	214
726	118	165
727	118	199
728	118	232
729	119	9
730	119	15
731	119	214
732	119	165
733	119	14
734	119	232
735	120	9
736	120	165
737	120	92
738	120	14
739	120	186
740	120	232
741	121	9
742	121	15
743	121	214
744	121	165
745	121	14
746	121	232
747	122	233
748	122	9
749	122	217
750	122	73
751	122	15
752	122	165
753	122	175
754	122	200
755	122	222
756	122	169
757	122	35
758	122	232
759	123	9
760	123	12
761	123	234
762	123	14
763	123	235
764	123	232
765	124	9
766	124	112
767	124	15
768	124	14
769	124	235
770	124	232
771	125	9
772	125	15
773	125	165
774	125	214
775	125	199
776	125	14
777	125	232
778	126	9
779	126	211
780	126	169
781	126	165
782	126	91
783	126	232
784	127	207
785	127	9
786	127	112
787	127	234
788	127	232
789	128	9
790	128	15
791	128	214
792	128	165
793	128	14
794	128	232
795	129	236
796	129	9
797	129	15
798	129	14
799	129	235
800	129	232
801	130	9
802	130	15
803	130	214
804	130	165
805	130	14
806	130	232
807	131	17
808	131	9
809	131	15
810	131	165
811	131	216
812	131	14
813	131	232
814	132	17
815	132	27
816	132	19
817	132	3
818	132	20
819	132	21
820	133	19
821	133	2
822	133	3
823	133	4
824	133	20
825	133	5
826	134	20
827	134	3
828	134	19
829	134	4
830	135	2
831	135	3
832	135	19
833	135	4
834	136	17
835	136	28
836	136	237
837	136	19
838	136	3
839	136	20
840	136	238
841	137	239
842	137	17
843	137	19
844	137	3
845	137	20
846	137	14
847	138	8
848	138	3
849	138	240
850	138	14
851	139	229
852	139	19
853	139	241
854	139	3
855	139	20
856	140	8
857	140	3
858	140	240
859	140	14
860	141	24
861	141	19
862	141	2
863	141	3
864	141	20
865	142	3
866	142	4
867	143	113
868	143	28
869	143	19
870	143	3
871	143	20
872	144	34
873	144	2
874	144	3
875	144	4
876	144	5
877	145	24
878	145	3
879	145	242
880	145	4
881	145	5
882	146	20
883	146	3
884	146	243
885	146	19
886	147	244
887	147	245
888	147	169
889	147	165
890	147	91
891	147	92
892	147	168
893	148	194
894	148	171
895	148	165
896	148	246
897	148	92
898	148	14
899	148	247
900	148	168
901	149	169
902	149	189
903	149	170
904	149	165
905	149	91
906	149	92
907	149	168
908	150	168
909	151	175
910	151	169
911	151	165
912	151	91
913	151	248
914	151	168
915	152	169
916	152	29
917	152	189
918	152	170
919	152	165
920	152	91
921	152	92
922	152	168
923	153	175
924	153	169
925	153	176
926	153	165
927	153	91
928	153	168
929	154	171
930	154	249
931	154	189
932	154	165
933	154	92
934	154	14
935	154	168
936	155	250
937	155	182
938	155	169
939	155	189
940	155	176
941	155	165
942	155	177
943	155	168
944	156	162
945	156	251
946	156	64
947	156	252
948	156	169
949	156	189
950	156	165
951	156	168
952	157	23
953	157	206
954	157	219
955	158	205
956	158	206
957	158	169
958	158	213
959	158	193
960	158	219
961	159	206
962	159	1
963	159	91
964	159	169
965	159	165
966	159	4
967	159	193
968	159	219
969	160	187
970	160	206
971	160	169
972	160	253
973	160	254
974	160	213
975	160	193
976	160	219
977	161	208
978	161	206
979	161	169
980	161	216
981	161	91
982	161	219
983	162	255
984	162	208
985	162	206
986	162	14
987	162	219
988	163	206
989	163	64
990	163	169
991	163	164
992	163	91
993	163	219
994	164	14
995	164	206
996	164	12
997	164	219
998	165	206
999	165	8
1000	165	64
1001	165	117
1002	165	169
1003	165	256
1004	165	189
1005	165	219
1006	166	219
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
31	1	3
32	3	3
33	4	3
34	5	3
35	8	3
36	7	3
37	9	3
38	11	3
39	13	3
40	31	3
41	32	3
42	33	3
43	34	3
44	35	3
45	36	3
46	16	4
47	19	4
48	17	4
49	18	4
50	21	4
51	22	4
52	24	4
53	25	4
54	27	4
55	30	4
56	37	4
57	38	4
58	39	4
59	40	4
60	41	4
61	2	5
62	6	5
63	10	5
64	14	5
65	42	5
66	12	5
67	43	5
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
78	28	6
79	26	6
80	52	6
81	29	6
82	53	6
83	54	6
84	55	6
85	56	6
86	57	6
87	58	6
88	59	6
89	60	6
90	61	6
91	62	7
92	63	7
93	64	7
94	65	7
95	66	7
96	67	7
97	68	7
98	69	7
99	70	7
100	71	7
101	72	8
102	73	8
103	74	8
104	75	8
105	76	8
106	77	8
107	78	8
108	79	8
109	80	8
110	81	8
111	82	9
112	83	9
113	84	9
114	85	9
115	86	9
116	87	9
117	88	9
118	89	9
119	90	9
120	91	9
121	92	10
122	93	10
123	94	10
124	95	10
125	96	10
126	97	10
127	98	10
128	99	10
129	100	10
130	101	10
131	102	11
132	103	11
133	104	11
134	105	11
135	106	11
136	107	11
137	108	11
138	109	11
139	110	11
140	111	11
141	63	12
142	112	12
143	65	12
144	113	12
145	114	12
146	69	12
147	56	12
148	115	12
149	116	12
150	58	12
151	117	13
152	118	13
153	119	13
154	120	13
155	121	13
156	122	13
157	123	13
158	124	13
159	125	13
160	126	13
161	127	13
162	128	13
163	129	13
164	130	13
165	131	13
166	132	14
167	133	14
168	134	14
169	135	14
170	136	14
171	137	14
172	138	14
173	139	14
174	140	14
175	141	14
176	142	14
177	143	14
178	144	14
179	145	14
180	146	14
181	147	15
182	148	15
183	149	15
184	150	15
185	151	15
186	152	15
187	153	15
188	154	15
189	155	15
190	156	15
191	157	16
192	158	16
193	159	16
194	160	16
195	161	16
196	162	16
197	163	16
198	164	16
199	165	16
200	166	16
\.


--
-- Data for Name: books_shelves; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_shelves (book_shelf_id, book_id, shelf_id) FROM stdin;
151	99	5
162	5	5
124	3	6
161	88	5
155	80	5
164	38	6
125	3	6
165	27	6
171	38	5
172	5	6
174	154	6
39	3	6
176	38	4
177	88	6
46	89	36
48	8	35
49	8	36
50	55	34
51	6	34
52	102	35
175	3	5
55	53	35
57	53	36
58	53	36
59	2	34
179	165	4
178	154	5
61	130	35
64	107	8
65	107	9
66	79	8
67	79	9
68	75	8
69	75	9
181	154	4
71	44	41
72	44	42
73	44	42
74	92	11
75	92	12
76	99	11
77	99	12
78	80	11
79	80	12
80	96	11
81	96	12
82	92	35
83	92	36
53	140	35
182	90	34
183	130	36
184	130	34
185	79	34
84	9	35
143	80	6
144	99	6
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Romantic Comedy
2	Women
3	Fiction
4	Romance
5	Contemporary
6	New Adult
7	World War II
8	Historical
9	Comics & Graphic Novels
10	Literary
11	Epic
12	Fantasy
13	Dragons & Mythical Creatures
14	Action & Adventure
15	Humorous
16	Feminist
17	Mystery & Detective
18	Women Sleuths
19	Suspense
20	Thrillers
21	Police Procedural
22	Regency
23	Coming of Age
24	Small Town & Rural
25	Family Life
26	Medical
27	Crime
28	Psychological
29	Siblings
30	History
31	Biography & Autobiography
32	Personal Memoirs
33	Great Britain
34	Royalty
35	Europe
36	Nonfiction
37	True Crime
38	Georgian Era (1714-1837)
39	Murder
40	Mass Murder
41	Maritime History & Piracy
42	Alternative Family
43	Entertainment & Performing Arts
44	Family & Relationships
45	Rich & Famous
46	Self-Help
47	Personal Growth
48	Mental Illness
49	Mental Health
50	Schizophrenia
51	Psychology
52	Post-Traumatic Stress Disorder (PTSD)
53	Depression
54	Psychotherapy
55	Psychopathology
56	Psychiatry
57	Life Sciences
58	Aging
59	Human Anatomy & Physiology
60	Longevity
61	Health & Fitness
62	Science
63	Dysfunctional Families
64	Death, Grief, Bereavement
65	Cultural, Ethnic & Regional
66	Essays & Narratives
67	Cooking
68	Asian & Asian American
69	Fatherhood
70	Parenting
71	Essays & Travelogues
72	Travel
73	United States
74	Indigenous Peoples in the Americas
75	20th Century
76	Body, Mind & Spirit
77	Success
78	Inspiration & Personal Growth
79	Nature
80	Essays
81	Love & Romance
82	American
83	Ethnic Studies
84	Social Science
85	African American & Black Studies
86	Literary Collections
87	Education
88	Educators
89	Teacher & Student Mentoring
90	Cultural Heritage
91	Friendship
92	Animals
93	Human-animal relationships
94	Topic
95	Politics
96	Censorship
97	Humor
98	Literary Criticism
99	Political Science
100	Life Stages
101	Social History
102	North America
103	Inventions
104	Technology & Engineering
105	Entrepreneurship
106	Transportation
107	Business
108	Business & Economics
109	Bisexual
110	Lgbtq+
111	Time Travel
112	Science Fiction
113	Domestic
114	Sports
115	Sagas
116	Modern
117	Holocaust
118	Jewish
119	Self-Esteem
120	19th Century
121	State & Local
122	Indigenous
123	Southwest (AZ, NM, OK, TX)
124	Religious
125	Motivational & Inspirational
126	Cognitive Psychology & Cognition
127	Communication Studies
128	Social Psychology
129	Language Arts & Disciplines
130	Interpersonal Relations
131	Cultural & Social
132	Civilization
133	Evolution
134	Anthropology
135	Health Policy
136	Death & Dying
137	Terminal Care
138	Entertaining
139	Culinary
140	Seasonal
141	Advice & How-To
142	Organizational Behavior
143	Marriage & Family
144	Motherhood
145	Music
146	Creativity
147	Happiness
148	Ethics & Moral Philosophy
149	Philosophy
150	Diabetic & Sugar-Free
151	Weight Loss
152	Health & Healing
153	Diets
154	Diet & Nutrition
155	Personal Finance
156	Genres & Styles
157	Country & Bluegrass
158	Southern States
159	Sandwiches
160	Regional & Ethnic
161	Courses & Dishes
162	Legends, Myths, Fables
163	Greek & Roman
164	Lgbtq
165	Juvenile Fiction
166	Fantasy & Magic
167	Children's Books
168	Middle Grade Books
169	Social Themes
170	Dogs
171	Survival Stories
172	Military & Wars
173	Emigration & Immigration
174	Diseases, Illnesses & Injuries
175	School & Education
176	Disabilities
177	Health & Daily Living
178	Mammals
179	Marine Life
180	Crafts & Hobbies
181	Daily Activities
182	Juvenile Nonfiction
183	Cooking & Food
184	Fairy Tales & Folklore
185	Adaptations
186	Dragons, Unicorns & Mythical
187	Self-Esteem & Self-Reliance
188	Activism & Social Justice
189	Family
190	Holidays & Celebrations
191	Mother's Day
192	Parents
193	Emotions & Feelings
194	Bears
195	Concepts
196	Imagination & Play
197	New Baby
198	Bedtime & Dreams
199	Humorous Stories
200	New Experience
201	Stories in Verse
202	Farm Animals
203	Colors
204	Opposites
205	Physical & Emotional Abuse
206	Young Adult Fiction
207	Dystopian
208	Thrillers & Suspense
209	Law & Crime
210	Prejudice & Racism
211	Adolescence & Coming of Age
212	Dating & Sex
213	Girls & Women
214	Superheroes
215	Class Differences
216	Mysteries & Detective Stories
217	People & Places
218	Middle East
219	Young Adult Books
220	Dark Fantasy
221	Arthurian
222	Boys & Men
223	Mermaids & Mermen
224	Social Policy
225	Public Policy
226	Poverty & Homelessness
227	Social Classes & Economic Disparity
228	Leadership
229	Military
230	Self-help
231	Individual Composer & Musician
232	Graphic Books
233	African American & Black
234	Media Tie-In
235	Manga
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
248	Bullying
249	Wolves, Coyotes & Wild Dogs
250	Physical Impairments
251	Multigenerational
252	Asian
253	Sexual Abuse
254	Violence
255	Horror
256	Orphans & Foster Homes
\.


--
-- Data for Name: covers; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.covers (cover_id, book_id, cover_url, source) FROM stdin;
1	1	https://storage.googleapis.com/du-prd/books/images/9780593441275.jpg	NYT
2	2	https://storage.googleapis.com/du-prd/books/images/9781501110375.jpg	NYT
3	3	https://storage.googleapis.com/du-prd/books/images/9780525655596.jpg	NYT
4	4	https://storage.googleapis.com/du-prd/books/images/9781649374042.jpg	NYT
5	5	https://storage.googleapis.com/du-prd/books/images/9780385547345.jpg	NYT
6	6	https://storage.googleapis.com/du-prd/books/images/9781668001226.jpg	NYT
7	7	https://storage.googleapis.com/du-prd/books/images/9780316402781.jpg	NYT
8	8	https://storage.googleapis.com/du-prd/books/images/9780063305083.jpg	NYT
9	9	https://storage.googleapis.com/du-prd/books/images/9780063251922.jpg	NYT
10	10	https://storage.googleapis.com/du-prd/books/images/9780593438558.jpg	NYT
11	11	https://storage.googleapis.com/du-prd/books/images/9780802162175.jpg	NYT
12	12	https://storage.googleapis.com/du-prd/books/images/9781501171345.jpg	NYT
13	13	https://storage.googleapis.com/du-prd/books/images/9781538750636.jpg	NYT
14	14	https://storage.googleapis.com/du-prd/books/images/9781791392796.jpg	NYT
15	15	https://storage.googleapis.com/du-prd/books/images/9780593243732.jpg	NYT
16	16	https://storage.googleapis.com/du-prd/books/images/9780593593806.jpg	NYT
17	17	https://storage.googleapis.com/du-prd/books/images/9780385534260.jpg	NYT
18	18	https://storage.googleapis.com/du-prd/books/images/9781250890924.jpg	NYT
19	19	https://storage.googleapis.com/du-prd/books/images/9780593237465.jpg	NYT
20	20	https://storage.googleapis.com/du-prd/books/images/9780670785933.jpg	NYT
21	21	https://storage.googleapis.com/du-prd/books/images/9780593236598.jpg	NYT
22	22	https://storage.googleapis.com/du-prd/books/images/9781982185824.jpg	NYT
23	23	https://storage.googleapis.com/du-prd/books/images/9780525657743.jpg	NYT
24	24	https://storage.googleapis.com/du-prd/books/images/9780785291817.jpg	NYT
25	25	https://storage.googleapis.com/du-prd/books/images/9781538709207.jpg	NYT
26	26	https://storage.googleapis.com/du-prd/books/images/9780385534246.jpg	NYT
27	27	https://storage.googleapis.com/du-prd/books/images/9780593139134.jpg	NYT
28	28	https://storage.googleapis.com/du-prd/books/images/9781571313560.jpg	NYT
29	29	https://storage.googleapis.com/du-prd/books/images/9780060959470.jpg	NYT
30	30	https://storage.googleapis.com/du-prd/books/images/9781368095051.jpg	NYT
31	31	https://storage.googleapis.com/du-prd/books/images/9780593243732.jpg	NYT
32	32	https://storage.googleapis.com/du-prd/books/images/9781984821775.jpg	NYT
33	33	https://storage.googleapis.com/du-prd/books/images/9780593321201.jpg	NYT
34	34	https://storage.googleapis.com/du-prd/books/images/9781668011836.jpg	NYT
35	35	https://storage.googleapis.com/du-prd/books/images/9780316406208.jpg	NYT
36	36	https://storage.googleapis.com/du-prd/books/images/9780063204157.jpg	NYT
37	37	https://storage.googleapis.com/du-prd/books/images/9780063270428.jpg	NYT
38	38	https://storage.googleapis.com/du-prd/books/images/9781250859853.jpg	NYT
39	39	https://storage.googleapis.com/du-prd/books/images/9780735225268.jpg	NYT
40	40	https://storage.googleapis.com/du-prd/books/images/9780316565134.jpg	NYT
41	41	https://storage.googleapis.com/du-prd/books/images/9780062998873.jpg	NYT
42	42	https://storage.googleapis.com/du-prd/books/images/9781501161933.jpg	NYT
43	43	https://storage.googleapis.com/du-prd/books/images/9781476753195.jpg	NYT
44	44	https://storage.googleapis.com/du-prd/books/images/9781335004888.jpg	NYT
45	45	https://storage.googleapis.com/du-prd/books/images/9781534430990.jpg	NYT
46	46	https://storage.googleapis.com/du-prd/books/images/9781668021910.jpg	NYT
47	47	https://storage.googleapis.com/du-prd/books/images/9781538742570.jpg	NYT
48	48	https://storage.googleapis.com/du-prd/books/images/9781250301697.jpg	NYT
49	49	https://storage.googleapis.com/du-prd/books/images/9781668026038.jpg	NYT
50	50	https://storage.googleapis.com/du-prd/books/images/9781524798628.jpg	NYT
51	51	https://storage.googleapis.com/du-prd/books/images/9780525559474.jpg	NYT
52	52	https://storage.googleapis.com/du-prd/books/images/9780063112360.jpg	NYT
53	53	https://storage.googleapis.com/du-prd/books/images/9780063037328.jpg	NYT
54	54	https://storage.googleapis.com/du-prd/books/images/9781416591061.jpg	NYT
55	55	https://storage.googleapis.com/du-prd/books/images/9780399590504.jpg	NYT
56	56	https://storage.googleapis.com/du-prd/books/images/9781429969352.jpg	NYT
57	57	https://storage.googleapis.com/du-prd/books/images/9780743247542.jpg	NYT
58	58	https://storage.googleapis.com/du-prd/books/images/9781501111129.jpg	NYT
59	59	https://storage.googleapis.com/du-prd/books/images/9780316478526.jpg	NYT
60	60	https://storage.googleapis.com/du-prd/books/images/9780374157357.jpg	NYT
61	61	https://storage.googleapis.com/du-prd/books/images/9780805095159.jpg	NYT
62	62	https://storage.googleapis.com/du-prd/books/images/9780062820174.jpg	NYT
63	63	https://storage.googleapis.com/du-prd/books/images/9780735211292.jpg	NYT
64	64	https://storage.googleapis.com/du-prd/books/images/9781523515646.jpg	NYT
65	65	https://storage.googleapis.com/du-prd/books/images/9780593652886.jpg	NYT
66	66	https://storage.googleapis.com/du-prd/books/images/9780062976581.jpg	NYT
67	67	https://storage.googleapis.com/du-prd/books/images/9781546004004.jpg	NYT
68	68	https://storage.googleapis.com/du-prd/books/images/9781668024522.jpg	NYT
69	69	https://storage.googleapis.com/du-prd/books/images/9781523507870.jpg	NYT
70	70	https://storage.googleapis.com/du-prd/books/images/9780063087781.jpg	NYT
71	71	https://storage.googleapis.com/du-prd/books/images/9780063226050.jpg	NYT
72	72	https://storage.googleapis.com/du-prd/books/images/9781368081153.jpg	NYT
73	73	https://storage.googleapis.com/du-prd/books/images/9781524764203.jpg	NYT
74	74	https://storage.googleapis.com/du-prd/books/images/9780545880831.jpg	NYT
75	75	https://storage.googleapis.com/du-prd/books/images/9780375899881.jpg	NYT
76	76	https://storage.googleapis.com/du-prd/books/images/9781665912761.jpg	NYT
77	77	https://storage.googleapis.com/du-prd/books/images/9781250147424.jpg	NYT
78	78	https://storage.googleapis.com/du-prd/books/images/9781492670025.jpg	NYT
79	79	https://storage.googleapis.com/du-prd/books/images/9780063269538.jpg	NYT
80	80	https://storage.googleapis.com/du-prd/books/images/9781665928502.jpg	NYT
81	81	https://storage.googleapis.com/du-prd/books/images/9781338180633.jpg	NYT
82	82	https://storage.googleapis.com/du-prd/books/images/9781736949795.jpg	NYT
83	83	https://storage.googleapis.com/du-prd/books/images/9780451533463.jpg	NYT
84	84	https://storage.googleapis.com/du-prd/books/images/9781728235844.jpg	NYT
85	85	https://storage.googleapis.com/du-prd/books/images/9781943200085.jpg	NYT
86	86	https://storage.googleapis.com/du-prd/books/images/9780385376716.jpg	NYT
87	87	https://storage.googleapis.com/du-prd/books/images/9780593226186.jpg	NYT
88	88	https://storage.googleapis.com/du-prd/books/images/9780803736801.jpg	NYT
89	89	https://storage.googleapis.com/du-prd/books/images/9780316486798.jpg	NYT
90	90	https://storage.googleapis.com/du-prd/books/images/9780399255373.jpg	NYT
91	91	https://storage.googleapis.com/du-prd/books/images/9781452126999.jpg	NYT
92	92	https://storage.googleapis.com/du-prd/books/images/9780545663267.jpg	NYT
93	93	https://storage.googleapis.com/du-prd/books/images/9780063080089.jpg	NYT
94	94	https://storage.googleapis.com/du-prd/books/images/9781419711329.jpg	NYT
95	95	https://storage.googleapis.com/du-prd/books/images/9780593379851.jpg	NYT
96	96	https://storage.googleapis.com/du-prd/books/images/9781416995586.jpg	NYT
97	97	https://storage.googleapis.com/du-prd/books/images/9780590353427.jpg	NYT
98	98	https://storage.googleapis.com/du-prd/books/images/9780545175340.jpg	NYT
99	99	https://storage.googleapis.com/du-prd/books/images/9780545349215.jpg	NYT
100	100	https://storage.googleapis.com/du-prd/books/images/9780316370950.jpg	NYT
101	101	https://storage.googleapis.com/du-prd/books/images/9780448482996.jpg	NYT
102	102	https://storage.googleapis.com/du-prd/books/images/9781339016238.jpg	NYT
103	103	https://storage.googleapis.com/du-prd/books/images/9780593374160.jpg	NYT
104	104	https://storage.googleapis.com/du-prd/books/images/9781250766588.jpg	NYT
105	105	https://storage.googleapis.com/du-prd/books/images/9780063045873.jpg	NYT
106	106	https://storage.googleapis.com/du-prd/books/images/9781338885101.jpg	NYT
107	107	https://storage.googleapis.com/du-prd/books/images/9780593705834.jpg	NYT
108	108	https://storage.googleapis.com/du-prd/books/images/9780063240803.jpg	NYT
109	109	https://storage.googleapis.com/du-prd/books/images/9781368077224.jpg	NYT
110	110	https://storage.googleapis.com/du-prd/books/images/9781419760860.jpg	NYT
111	111	https://storage.googleapis.com/du-prd/books/images/9780316519045.jpg	NYT
112	112	https://storage.googleapis.com/du-prd/books/images/9781538707944.jpg	NYT
113	113	https://storage.googleapis.com/du-prd/books/images/9780593239919.jpg	NYT
114	114	https://storage.googleapis.com/du-prd/books/images/9780399592522.jpg	NYT
115	115	https://storage.googleapis.com/du-prd/books/images/9781466874961.jpg	NYT
116	116	https://storage.googleapis.com/du-prd/books/images/9780063224629.jpg	NYT
117	117	https://storage.googleapis.com/du-prd/books/images/9781338801910.jpg	NYT
118	118	https://storage.googleapis.com/du-prd/books/images/9781338846621.jpg	NYT
119	119	https://storage.googleapis.com/du-prd/books/images/9781338680454.jpg	NYT
120	120	https://storage.googleapis.com/du-prd/books/images/9781338730890.jpg	NYT
121	121	https://storage.googleapis.com/du-prd/books/images/9781338535624.jpg	NYT
122	122	https://storage.googleapis.com/du-prd/books/images/9780062885531.jpg	NYT
123	123	https://storage.googleapis.com/du-prd/books/images/9781974736553.jpg	NYT
124	124	https://storage.googleapis.com/du-prd/books/images/9781974736331.jpg	NYT
125	125	https://storage.googleapis.com/du-prd/books/images/9781338236590.jpg	NYT
126	126	https://storage.googleapis.com/du-prd/books/images/9781338616101.jpg	NYT
127	127	https://storage.googleapis.com/du-prd/books/images/9781684058419.jpg	NYT
128	128	https://storage.googleapis.com/du-prd/books/images/9781338323214.jpg	NYT
129	129	https://storage.googleapis.com/du-prd/books/images/9781974736287.jpg	NYT
130	130	https://storage.googleapis.com/du-prd/books/images/9780545935173.jpg	NYT
131	131	https://storage.googleapis.com/du-prd/books/images/9781534499379.jpg	NYT
132	132	https://storage.googleapis.com/du-prd/books/images/9780316420389.jpg	NYT
133	133	https://storage.googleapis.com/du-prd/books/images/9781984821676.jpg	NYT
134	134	https://storage.googleapis.com/du-prd/books/images/9780778334446.jpg	NYT
135	135	https://storage.googleapis.com/du-prd/books/images/9781250272935.jpg	NYT
136	136	https://storage.googleapis.com/du-prd/books/images/9781538753095.jpg	NYT
137	137	https://storage.googleapis.com/du-prd/books/images/9781538719725.jpg	NYT
138	138	https://storage.googleapis.com/du-prd/books/images/9780786050130.jpg	NYT
139	139	https://storage.googleapis.com/du-prd/books/images/9780593422724.jpg	NYT
140	140	https://storage.googleapis.com/du-prd/books/images/9780786049578.jpg	NYT
141	141	https://storage.googleapis.com/du-prd/books/images/9781501165375.jpg	NYT
142	142	https://storage.googleapis.com/du-prd/books/images/9780061081859.jpg	NYT
143	143	https://storage.googleapis.com/du-prd/books/images/9781420155549.jpg	NYT
144	144	https://storage.googleapis.com/du-prd/books/images/9781335147530.jpg	NYT
145	145	https://storage.googleapis.com/du-prd/books/images/9781335498410.jpg	NYT
146	146	https://storage.googleapis.com/du-prd/books/images/9780385546027.jpg	NYT
147	147	https://storage.googleapis.com/du-prd/books/images/9780061992278.jpg	NYT
148	148	https://storage.googleapis.com/du-prd/books/images/9780316381994.jpg	NYT
149	149	https://storage.googleapis.com/du-prd/books/images/9781250144058.jpg	NYT
150	150	https://storage.googleapis.com/du-prd/books/images/9780547577319.jpg	NYT
151	151	https://storage.googleapis.com/du-prd/books/images/9781338053807.jpg	NYT
152	152	https://storage.googleapis.com/du-prd/books/images/9780062991317.jpg	NYT
153	153	https://storage.googleapis.com/du-prd/books/images/9780399162596.jpg	NYT
154	154	https://storage.googleapis.com/du-prd/books/images/9780062895936.jpg	NYT
155	155	https://storage.googleapis.com/du-prd/books/images/9781416971719.jpg	NYT
156	156	https://storage.googleapis.com/du-prd/books/images/9781524715700.jpg	NYT
157	157	https://storage.googleapis.com/du-prd/books/images/9781402277832.jpg	NYT
158	158	https://storage.googleapis.com/du-prd/books/images/9781101934715.jpg	NYT
159	159	https://storage.googleapis.com/du-prd/books/images/9781534467637.jpg	NYT
160	160	https://storage.googleapis.com/du-prd/books/images/9781481449359.jpg	NYT
161	161	https://storage.googleapis.com/du-prd/books/images/9781524714680.jpg	NYT
162	162	https://storage.googleapis.com/du-prd/books/images/9780593481493.jpg	NYT
163	163	https://storage.googleapis.com/du-prd/books/images/9780062457790.jpg	NYT
164	164	https://storage.googleapis.com/du-prd/books/images/9781627792127.jpg	NYT
165	165	https://storage.googleapis.com/du-prd/books/images/9780375842207.jpg	NYT
166	166	https://storage.googleapis.com/du-prd/books/images/9781250268396.jpg	NYT
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
31	11	To Read
32	11	Already Read
33	11	Favorites
34	12	To Read
35	12	Already Read
36	12	Favorites
37	13	To Read
38	13	Already Read
39	13	Favorites
40	14	To Read
41	14	Already Read
42	14	Favorites
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.users (user_id, user_name, email, password) FROM stdin;
1	Test User 0	user0@test.com	testB00kUser0
2	Test User 1	user1@test.com	testB00kUser1
3	Test User 2	user2@test.com	testB00kUser2
4	Test User 3	user3@test.com	testB00kUser3
5	Test User 4	user4@test.com	testB00kUser4
6	Test User 5	user5@test.com	testB00kUser5
7	Test User 6	user6@test.com	testB00kUser6
8	Test User 7	user7@test.com	testB00kUser7
9	Test User 8	user8@test.com	testB00kUser8
10	Test User 9	user9@test.com	testB00kUser9
11	Elena	user@test.com	testtest
12	Lena	lena@mail.com	MyPassword
13	Elena	elena@gmail.com	ElenaPassword
14	Ray	ray@test.com	1234
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 184, true);


--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_authors_book_author_id_seq', 184, true);


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_book_id_seq', 166, true);


--
-- Name: books_categories_book_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_categories_book_category_id_seq', 1006, true);


--
-- Name: books_lists_book_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_lists_book_list_id_seq', 200, true);


--
-- Name: books_shelves_book_shelf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_shelves_book_shelf_id_seq', 185, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 256, true);


--
-- Name: covers_cover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.covers_cover_id_seq', 166, true);


--
-- Name: lists_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.lists_list_id_seq', 16, true);


--
-- Name: shelves_shelf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.shelves_shelf_id_seq', 42, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


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

