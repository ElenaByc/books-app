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
    author_ol_id character varying NOT NULL,
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
    overview text
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
-- Name: books_subjects; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.books_subjects (
    book_subject_id integer NOT NULL,
    book_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.books_subjects OWNER TO linuxuser;

--
-- Name: books_subjects_book_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.books_subjects_book_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_subjects_book_subject_id_seq OWNER TO linuxuser;

--
-- Name: books_subjects_book_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.books_subjects_book_subject_id_seq OWNED BY public.books_subjects.book_subject_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category character varying(100) NOT NULL,
    nyt_list_name_encoded character varying(100) NOT NULL
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
-- Name: subjects; Type: TABLE; Schema: public; Owner: linuxuser
--

CREATE TABLE public.subjects (
    subject_id integer NOT NULL,
    subject character varying(100) NOT NULL
);


ALTER TABLE public.subjects OWNER TO linuxuser;

--
-- Name: subjects_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: linuxuser
--

CREATE SEQUENCE public.subjects_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_subject_id_seq OWNER TO linuxuser;

--
-- Name: subjects_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: linuxuser
--

ALTER SEQUENCE public.subjects_subject_id_seq OWNED BY public.subjects.subject_id;


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
-- Name: books_shelves book_shelf_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_shelves ALTER COLUMN book_shelf_id SET DEFAULT nextval('public.books_shelves_book_shelf_id_seq'::regclass);


--
-- Name: books_subjects book_subject_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_subjects ALTER COLUMN book_subject_id SET DEFAULT nextval('public.books_subjects_book_subject_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: covers cover_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.covers ALTER COLUMN cover_id SET DEFAULT nextval('public.covers_cover_id_seq'::regclass);


--
-- Name: shelves shelf_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.shelves ALTER COLUMN shelf_id SET DEFAULT nextval('public.shelves_shelf_id_seq'::regclass);


--
-- Name: subjects subject_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.subjects ALTER COLUMN subject_id SET DEFAULT nextval('public.subjects_subject_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.authors (author_id, author_ol_id, name, picture_url, about) FROM stdin;
1	/authors/OL22258A	James Patterson	picture_url	James Brendan Patterson (born March 22, 1947) is an American author. Among his works are the Alex Cross, Michael Bennett, Women's Murder Club, Maximum Ride, Daniel X, NYPD Red, Witch & Wizard, Private and Middle School series, as well as many stand-alone thrillers, non-fiction, and romance novels. His books have sold more than 425 million copies, and he was the first person to sell 1 million e-books. In 2016, Patterson topped Forbes's list of highest-paid authors for the third consecutive year, with an income of $95 million. His total income over a decade is estimated at $700 million.\r\n\r\nIn November 2015, Patterson received the Literarian Award from the National Book Foundation. Patterson has donated millions of dollars in grants and scholarship to various universities, teachers' colleges, independent bookstores, school libraries, and college students to promote literacy. [source](https://en.wikipedia.org/wiki/James_Patterson)
2	/authors/OL765158A	Maxine Paetro	picture_url	
3	/authors/OL7410858A	Emily Henry	picture_url	
4	/authors/OL9812944A	Carley Fortune	picture_url	
5	/authors/OL9898032A	Abraham Verghese	picture_url	
6	/authors/OL7825177A	Rebecca Yarros	picture_url	
7	/authors/OL9960289A	Danielle Steel	picture_url	
8	/authors/OL7315784A	Colleen Hoover	picture_url	American author
9	/authors/OL9587269A	Bonnie Garmus	picture_url	
10	/authors/OL28165A	David Baldacci	picture_url	
11	/authors/OL9367883A	To Be Confirmed Atria	picture_url	
12	/authors/OL2660286A	Laura Dave	picture_url	
13	/authors/OL12321782A	Mo Xiang Mo Xiang Tong Xiu	picture_url	
14	/authors/OL10393308A	Marina Privalova	picture_url	
15	/authors/OL6966561A	Jin Fang	picture_url	
16	/authors/OL7290222A	Taylor Jenkins Reid	picture_url	American author
17	/authors/OL1515577A	Ann Napolitano	picture_url	
18	/authors/OL5124799A	David Grann	picture_url	American journalist
19	/authors/OL10393689A	Random House Group	picture_url	
20	/authors/OL7836424A	Luke Russert	picture_url	
21	/authors/OL10491069A	Peter Attia	picture_url	
22	/authors/OL2660447A	Bill Gifford	picture_url	
23	/authors/OL2873756A	Bessel A. Van Der Kolk	picture_url	**Bessel van der Kolk** is a Dutch psychiatrist, author and educator based in Boston, USA. Since the 1970s his research has been in the area of post-traumatic stress. Van der Kolk is professor of Psychiatry at Boston University School of Medicine and President of the Trauma Research Foundation in Brookline, Massachusetts. ([Wikipedia][1])\r\n\r\n\r\n  [1]: https://en.wikipedia.org/wiki/Bessel_van_der_Kolk
24	/authors/OL8593997A	Michelle Zauner	picture_url	
25	/authors/OL896815A	Deborah Roberts	picture_url	
26	/authors/OL7482027A	Jonathan Freedland	picture_url	
27	/authors/OL11355383A	Minka Kelly	picture_url	
28	/authors/OL3553076A	Isabel Wilkerson	picture_url	
29	/authors/OL9583580A	Katy Hessel	picture_url	
30	/authors/OL2754231A	Crown	picture_url	
31	/authors/OL1389449A	Patti Callahan Henry	picture_url	
32	/authors/OL1394023A	Gabrielle Zevin	picture_url	
33	/authors/OL10431991A	Jeannette Walls	picture_url	
34	/authors/OL896513A	Justin Cronin	picture_url	Born and raised in New England, Justin Cronin is a graduate of Harvard University and the Iowa Writers’ Workshop. Awards for his fiction include the Stephen Crane Prize, a Whiting Writers’ Award, and a Pew Fellowship in the Arts. He is a professor of English at Rice University and lives with his wife and children in Houston, Texas. \r\n\r\n*From the publisher*
35	/authors/OL8366752A	To Be To Be Confirmed Atria	picture_url	
36	/authors/OL7935386A	Sunny Hostin	picture_url	
37	/authors/OL9599807A	Shelby Van Pelt	picture_url	
38	/authors/OL3392352A	Matthew Desmond	picture_url	Matthew Desmond is Maurice P. During Professor of Sociology and Principal Investigator of The Eviction Lab. After receiving his Ph.D. in 2010 from the University of Wisconsin at Madison, he joined the Harvard Society of Fellows as a Junior Fellow. His primary teaching and research interests include urban sociology, poverty, race and ethnicity, organizations and work, social theory, and ethnography.  \r\n\r\nDesmond is the author of four books: On the Fireline: Living and Dying with WIldland Firefighters (2007), Race in America (with Mustafa Emirbayer, 2015), The Racial Order (with Mustafa Emirbayer, 2015), and Evicted: Poverty and Profit in the American City (2016).  He also is the editor of the inaugural issue of RSF: The Russell Sage Foundation Journal of the Social Sciences, Volumes 1 & 2: Severe Deprivation in America (2015). \r\n\r\nDesmond has written essays on educational inequality, dangerous work, political ideology, race and social theory, and the inner-city housing market.  Recently, he has published on the prevalence and consequences of eviction and the low-income rental market, network-based survival strategies among the urban poor, and the consequences of new crime control policies on inner-city women in the American Journal of Sociology, American Sociological Review, Social Forces, and Demography.\r\n\r\nIn 2015, Desmond was awarded a MacArthur “Genius” grant.\r\n\r\n([source][1])\r\n\r\n\r\n  [1]: https://scholar.princeton.edu/matthewdesmond/
39	/authors/OL8476753A	Jack Curry	picture_url	
40	/authors/OL10679196A	Kat Timpf	picture_url	
41	/authors/OL7539488A	Laura Dern	picture_url	
42	/authors/OL1432129A	Diane Ladd	picture_url	
43	/authors/OL2878427A	Reese Witherspoon	picture_url	
44	/authors/OL10015602A	Michio Kaku	picture_url	
45	/authors/OL10783565A	Tarryn Fisher	picture_url	
46	/authors/OL8384995A	Freida McFadden	picture_url	
47	/authors/OL7471384A	Alex Michaelides	picture_url	
48	/authors/OL2905258A	Sarah Adams	picture_url	
49	/authors/OL7922247A	Lucy Score	picture_url	
50	/authors/OL2631291A	bell hooks	picture_url	Gloria Jean Watkins, better known by her pen name bell hooks, is an American author, feminist, and social activist. The name "bell hooks" is derived from that of her maternal great-grandmother, Bell Blair Hooks. - Wikipedia
51	/authors/OL6723353A	Viola Davis	picture_url	
52	/authors/OL7421324A	Tara Westover	picture_url	
53	/authors/OL1070823A	S. C. Gwynne	picture_url	
103	/authors/OL7614645A	Alice Oseman	picture_url	
104	/authors/OL7404795A	Adam Silvera	picture_url	
105	/authors/OL6287190A	J. Elle	picture_url	
54	/authors/OL1395062A	David Graeber	picture_url	**David Rolfe Graeber** (/ˈɡreɪbər/; February 12, 1961 – September 2, 2020[1][2][3]) was an American anthropologist, anarchist activist and author known for his books *Debt: The First 5000 Years* (2011), *The Utopia of Rules* (2015) and *Bullshit Jobs: A Theory* (2018). He was a professor of anthropology at the London School of Economics.\r\n\r\nAs an assistant professor and associate professor of anthropology at Yale from 1998–2007 he specialised in theories of value and social theory. The university's decision not to rehire him when he would otherwise have become eligible for tenure sparked an academic controversy, and a petition with more than 4,500 signatures. He went on to become, from 2007–13, Reader in Social Anthropology at Goldsmiths, University of London. ([Source](https://en.wikipedia.org/wiki/David_Graeber))
55	/authors/OL2766925A	David Wengrow	picture_url	
56	/authors/OL7409051A	Angela Duckworth	picture_url	
57	/authors/OL34287A	Jeannette Walls	picture_url	Jeannette Walls is a writer and journalist. Born in Phoenix, Arizona, she graduated with honors from Barnard College, the women's college affiliated with Columbia University.
58	/authors/OL9175475A	Malcolm Gladwell	picture_url	
59	/authors/OL4271523A	John Green	picture_url	
60	/authors/OL12313246A	Anon9780062820174	picture_url	
61	/authors/OL9628950A	Jessie Inchauspe	picture_url	
62	/authors/OL8082183A	Rick Rubin	picture_url	
63	/authors/OL8033214A	Charlie Mackesy	picture_url	
64	/authors/OL3119395A	Ramit Sethi	picture_url	
65	/authors/OL8061115A	Miranda Lambert	picture_url	
66	/authors/OL7528969A	Kayleigh McEnany	picture_url	
67	/authors/OL9119340A	Admiral William H. McRaven	picture_url	
68	/authors/OL8117011A	Rainn Wilson	picture_url	
69	/authors/OL30765A	Rick Riordan	picture_url	
70	/authors/OL7503509A	Mark Oshiro	picture_url	Mark Oshiro (they/them) is the award-winning author of the young adult books ANGER IS A GIFT (2019 Schneider Family Book Award), EACH OF US A DESERT, and INTO THE LIGHT, as well as their middle grade books THE INSIDERS, YOU ONLY LIVE ONCE, DAVID BRAVO, and STAR WARS HUNTERS: BATTLE FOR THE ARENA. They are also the co-author (with Rick Riordan) of THE SUN AND THE STAR: A NICO DI ANGELO ADVENTURE. When not writing, they are trying to pet every dog in the world.\r\n\r\nMark is based in Atlanta, GA. [source](https://www.markoshiro.com/about)
71	/authors/OL6995566A	R. J. Palacio	picture_url	Raquel J. Palacio lives in Brooklyn, NY with her husband, two sons and two dogs (Bear and Beau). Her debut novel, Wonder, has been on the New York Times bestseller list since March, 2012, and has sold over 5 million copies worldwide. The book’s message of kindness has inspired the Choose Kind movement, and has been embraced by readers, young and old, around the world.\r\n\r\nSource: https://wonderthebook.com/about
72	/authors/OL9618285A	A. F. Steadman	picture_url	
73	/authors/OL1429019A	Alan Gratz	picture_url	Alan Gratz has wanted to be a writer ever since he was a kid. He went to the University of Tennessee to study creative writing, and ten years and more than sixty-five rejections later he was finally able to get his very first book published. Now Alan is the author of fifteen books for young readers, many of which have won state awards, appeared on the New York Times bestseller list, and been voted their favorite book of the year by students and librarians.\r\n([source][1])\r\n\r\nPhoto by Wes Stitt\r\n\r\n\r\n  [1]: https://www.alangratz.com/about/
74	/authors/OL11360198A	Zaila Avant-garde	picture_url	
75	/authors/OL7610521A	Marti Dumas	picture_url	
76	/authors/OL6940821A	America's Test Kitchen (Firm)	picture_url	
77	/authors/OL3945898A	Soman Chainani	picture_url	He has written "The School For Good And Evil" series. (READ THE SERIES ITS AMAZING)
78	/authors/OL26392A	Katherine Applegate	picture_url	Katherine Alice Applegate is an American writer, best known as the author of the Animorphs, Remnants, Everworld and other book series. She won the 2013 Newbery Medal for her children's novel The One and Only Ivan. Applegate's most popular books are science fiction, fantasy, and adventure novels. She won the Best New Children's Book Series Award in 1997 in Publishers Weekly. Her book Home of the Brave has won two awards. - [wikipedia](https://en.wikipedia.org/wiki/Katherine_Applegate)
79	/authors/OL7993509A	Claribel A. Ortega	picture_url	
80	/authors/OL10271790A	Brian Selznick	picture_url	
81	/authors/OL3070901A	Kobi Yamada	picture_url	
82	/authors/OL3119964A	Adam Rubin	picture_url	Adam Rubin is a #1 New York Times best selling author of children's books. Many of his stories feature animals or food and several contain interactive elements. His books have sold over one million copies.
83	/authors/OL34330A	Eric Carle	picture_url	American children's illustrator and writer\r\n\r\nEric Carle (June 25, 1929- 23 May, 2021) was a children's book author and illustrator, most famous for his book *The Very Hungry Caterpillar*, which has been translated into over 30 languages. Since *The Very Hungry Caterpillar* was published in 1969, Eric Carle has illustrated more than seventy books, many best sellers, most of which he also wrote, and more than 71 million copies of his books have sold around the world.
84	/authors/OL6838232A	Emily Winfield Martin	picture_url	
85	/authors/OL9107973A	Luvvie Ajayi Jones	picture_url	
86	/authors/OL8178874A	Joey Spiotto	picture_url	
87	/authors/OL7336767A	Gregory Lang	picture_url	
88	/authors/OL1435747A	Susanna Leonard Hill	picture_url	
89	/authors/OL7335038A	Gail Yerrill	picture_url	
90	/authors/OL9828060A	Jazmyn Simon	picture_url	
91	/authors/OL10793171A	Dulé Hill	picture_url	
92	/authors/OL9116374A	Shamar Knight-Justice	picture_url	
93	/authors/OL7468700A	Vashti Harrison	picture_url	
94	/authors/OL7897219A	Abrams Abrams Books	picture_url	
95	/authors/OL7722491A	Holly Jackson	picture_url	British writer
96	/authors/OL24815A	Dav Pilkey	picture_url	
97	/authors/OL7032054A	Leigh Bardugo	picture_url	Leigh was born in Jerusalem, grew up in Southern California, and graduated from Yale University. These days she lives and writes in Los Angeles. \r\n([source][1])\r\n\r\n\r\n  [1]: https://www.leighbardugo.com/about/
98	/authors/OL2678446A	Jennifer Lynn Barnes	picture_url	
99	/authors/OL7939196A	Angeline Boulley	picture_url	
100	/authors/OL7290350A	Becky Albertalli	picture_url	
101	/authors/OL7925750A	Jason Reynolds	picture_url	
102	/authors/OL2633520A	Random House	picture_url	
106	/authors/OL6713973A	Alexandra Bracken	picture_url	Alexandra Bracken (born 27 February 1987, Phoenix, Arizona) is an American writer, a #1 New York Times bestselling American author, known for The Darkest Minds series and Passenger series.
107	/authors/OL8195289A	Alex Aster	picture_url	
108	/authors/OL3121637A	Brené Brown	picture_url	Dr. Brené Brown is a research professor at the University of Houston Graduate College of Social Work. She has spent the past thirteen years studying vulnerability, courage, worthiness, and shame. \r\nBrené is the author of two #1 New York Times Bestsellers: Daring Greatly and The Gifts of Imperfection.\r\nBrené is also the Founder and CEO of The Daring Way – an organization that brings her work on vulnerability, courage, shame and worthiness to organizations, schools, communities, and families.\r\nBrené’s 2010 TEDx Houston talk, The Power of Vulnerability, is one of the top five most viewed TED talks in the world, with over 21 million viewers.\r\nBrené lives in Houston with her husband, Steve, and their two children, Ellen and Charlie.\r\n [(Source)][1]\r\n\r\n\r\n  [1]: http://brenebrown.com/about/
109	/authors/OL9593240A	Paris Hilton	picture_url	
110	/authors/OL10518747A	Dav Pilkey	picture_url	
111	/authors/OL10005830A	Tui T. Sutherland	picture_url	
112	/authors/OL10103742A	Jerry Craft	picture_url	
113	/authors/OL10033143A	Eiichiro Oda	picture_url	
114	/authors/OL10033186A	Naoya Matsumoto	picture_url	
115	/authors/OL9350833A	Ann M. Martin	picture_url	
116	/authors/OL10466583A	Cynthia Yuan Cheng	picture_url	
117	/authors/OL2757710A	Kevin Eastman	picture_url	
118	/authors/OL2686945A	Peter Laird	picture_url	
119	/authors/OL3105549A	Tom Waltz	picture_url	
120	/authors/OL7982657A	Tatsuya Endo	picture_url	
121	/authors/OL7483501A	Stuart Gibbs	picture_url	
122	/authors/OL7906293A	Anjan Sarkar	picture_url	
123	/authors/OL1434940A	James O. Born	picture_url	
124	/authors/OL7916945A	Sandra Brown	picture_url	Author of Introduction to the IBM and Prime computer guide
125	/authors/OL18977A	Nora Roberts	picture_url	Nora Roberts (born Eleanor Marie Robertson on October 10, 1950) is an American author of more than 225 romance novels. She writes as J. D. Robb for the in Death series and has also written under the pseudonyms Jill March and for publications in the U.K. as Sarah Hardesty.\r\n\r\nRoberts was the first author to be inducted into the Romance Writers of America Hall of Fame.
126	/authors/OL8102042A	J. D. Barker	picture_url	
127	/authors/OL9439584A	William W. Johnstone	picture_url	
128	/authors/OL2874452A	J. A. Johnstone	picture_url	
129	/authors/OL7895618A	Don Bentley	picture_url	
130	/authors/OL7062225A	Megan Miranda	picture_url	
131	/authors/OL1385386A	Lisa Jackson	picture_url	
132	/authors/OL228969A	Debbie Macomber	picture_url	
133	/authors/OL7469576A	Lee Tobin McClain	picture_url	
134	/authors/OL39329A	John Grisham	picture_url	Long before his name became synonymous with the modern legal thriller, he was working 60-70 hours a week at a small Southaven, Mississippi, law practice, squeezing in time before going to the office and during courtroom recesses to work on his hobby—writing his first novel.\r\n\r\nBorn on February 8, 1955 in Jonesboro, Arkansas, to a construction worker and a homemaker, John Grisham as a child dreamed of being a professional baseball player. Realizing he didn’t have the right stuff for a pro career, he shifted gears and majored in accounting at Mississippi State University. After graduating from law school at Ole Miss in 1981, he went on to practice law for nearly a decade in Southaven, specializing in criminal defense and personal injury litigation. In 1983, he was elected to the state House of Representatives and served until 1990.\r\n\r\nOne day at the DeSoto County courthouse, Grisham overheard the harrowing testimony of a twelve-year-old rape victim and was inspired to start a novel exploring what would have happened if the girl’s father had murdered her assailants. Getting up at 5 a.m. every day to get in several hours of writing time before heading off to work, Grisham spent three years on A Time to Kill and finished it in 1987. Initially rejected by many publishers, it was eventually bought by Wynwood Press, who gave it a modest 5,000 copy printing and published it in June 1988.\r\n\r\nThat might have put an end to Grisham’s hobby. However, he had already begun his next book, and it would quickly turn that hobby into a new full-time career—and spark one of publishing’s greatest success stories. The day after Grisham completed A Time to Kill, he began work on another novel, the story of a hotshot young attorney lured to an apparently perfect law firm that was not what it appeared. When he sold the film rights to The Firm to Paramount Pictures for $600,000, Grisham suddenly became a hot property among publishers, and book rights were bought by Doubleday. Spending 47 weeks on The New York Times bestseller list, The Firm became the bestselling novel of 1991.\r\n\r\nThe successes of The Pelican Brief, which hit number one on the New York Times bestseller list, and The Client, which debuted at number one, confirmed Grisham’s reputation as the master of the legal thriller. Grisham’s success even renewed interest in A Time to Kill, which was republished in hardcover by Doubleday and then in paperback by Dell. This time around, it was a bestseller.\r\n\r\nSince first publishing A Time to Kill in 1988, Grisham has written one novel a year (his other books are The Firm, The Pelican Brief, The Client, The Chamber, The Rainmaker, The Runaway Jury, The Partner, The Street Lawyer, The Testament, The Brethren, A Painted House, Skipping Christmas, The Summons, The King of Torts, Bleachers, The Last Juror, The Broker, Playing for Pizza, The Appeal, and The Associate) and all of them have become international bestsellers. There are currently over 250 million John Grisham books in print worldwide, which have been translated into 29 languages. Nine of his novels have been turned into films (The Firm, The Pelican Brief, The Client, A Time to Kill, The Rainmaker, The Chamber, A Painted House, The Runaway Jury, and Skipping Christmas), as was an original screenplay, The Gingerbread Man. The Innocent Man (October 2006) marked his first foray into non-fiction, and Ford County (November 2009) was his first short story collection.\r\n\r\nGrisham lives with his wife Renee and their two children Ty and Shea. The family splits their time between their Victorian home on a farm in Mississippi and a plantation near Charlottesville, VA.\r\n\r\nGrisham took time off from writing for several months in 1996 to return, after a five-year hiatus, to the courtroom. He was honoring a commitment made before he had retired from the law to become a full-time writer: representing the family of a railroad brakeman killed when he was pinned between two cars. Preparing his case with the same passion and dedication as his books’ protagonists, Grisham successfully argued his clients’ case, earning them a jury award of $683,500—the biggest verdict of his career.\r\n\r\nWhen he’s not writing, Grisham devotes time to charitable causes, including most recently his Rebuild The Coast Fund, which raised 8.8 million dollars for Gulf Coast relief in the wake of Hurricane Katrina. He also keeps up with his greatest passion: baseball. The man who dreamed of being a professional baseball player now serves as the local Little League commissioner. The six ballfields he built on his property have played host to over 350 kids on 26 Little League teams.
135	/authors/OL231034A	Barbara O'Connor	picture_url	Barbara O’Connor was born and raised in Greenville, South Carolina. She draws on her Southern roots to write award-winning books for children in grades 3 to 6. She currently lives in Asheville, NC.
136	/authors/OL29658A	Gordon Korman	picture_url	Gordon Korman was born in Montreal, Quebec. In 1970, he relocated with his parents to Thornhill, Ontario. In 7th grade, he wrote a work that went on to become his first novel in a school writing assignment. It was published under the title *This Can't Be Happening at Macdonald Hall* in 1978, when Korman was 14 years old. He wrote and published another four books while in high school.\r\n\r\nAfter high school, he moved to New York City where he studied film and film writing at New York University. In 1985 he received his B.A. in Dramatic and Visual Writing. He has written more than 75 books. He lives in Great Neck, New York, with his wife and three children.
137	/authors/OL7300629A	Patricia Castelao	picture_url	
138	/authors/OL5016544A	Rosanne Parry	picture_url	
139	/authors/OL8109513A	Mónica Armiño	picture_url	
140	/authors/OL22536A	Sharon M. Draper	picture_url	
141	/authors/OL7531673A	Tae Keller	picture_url	
142	/authors/OL7512907A	Laura Nowlin	picture_url	
143	/authors/OL3752315A	Lynn Painter	picture_url	
144	/authors/OL7399550A	Karen M. McManus	picture_url	
145	/authors/OL7360418A	Natasha Preston	picture_url	
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books (book_id, title, primary_isbn10, primary_isbn13, overview) FROM stdin;
1	THE 23RD MIDNIGHT	0316402982	9780316402989	The 23rd book in the Women’s Murder Club series. Lindsay Boxer tracks a copycat killer.
2	HAPPY PLACE	0593441273	9780593441275	A former couple pretend to be together for the sake of their friends during their annual getaway in Maine.
3	MEET ME AT THE LAKE	0593438558	9780593438558	A decade after a one-day adventure, Will appears again in Fern’s life at her mother’s lakeside resort.
4	THE COVENANT OF WATER	0802162177	9780802162175	Three generations of a family living on South India’s Malabar Coast suffer the loss of a family member by drowning.
5	FOURTH WING	1649374046	9781649374042	Violet Sorrengail is urged by the commanding general, who also is her mother, to become a candidate for the elite dragon riders.
6	THE WEDDING PLANNER	1984821776	9781984821775	An unmarried wedding planner contends with problems, secrets and scandals.
7	IT ENDS WITH US	1501110365	9781501110368	A battered wife raised in a violent home attempts to halt the cycle of abuse.
8	LESSONS IN CHEMISTRY	038554734X	9780385547345	A scientist and single mother living in California in the 1960s becomes a star on a TV cooking show.
9	SIMPLY LIES	1538750635	9781538750636	A former detective becomes the prime suspect in a murder case involving a man with mob ties who was in witness protection.
10	IT STARTS WITH US	1668001225	9781668001226	In the sequel to “It Ends With Us,” Lily deals with her jealous ex-husband as she reconnects with her first boyfriend.
11	THE LAST THING HE TOLD ME	1501171356	9781501171352	Hannah Hall discovers truths about her missing husband and bonds with his daughter from a previous relationship.
12	VERITY	1538724731	9781538724736	Lowen Ashleigh is hired by the husband of an injured writer to complete her popular series and uncovers a horrifying truth.
13	GRANDMASTER OF DEMONIC CULTIVATION: MO DAO ZU SHI, VOL. 5	1685798403	9781685798406	The future of the entire cultivation world comes down to a showdown at Guanyin Temple.
14	THE SEVEN HUSBANDS OF EVELYN HUGO	1501161938	9781501161933	A movie icon recounts stories of her loves and career to a struggling magazine writer.
15	HELLO BEAUTIFUL	0593243730	9780593243732	In a homage to Louisa May Alcott’s “Little Women,” a young man’s dark past resurfaces as he gets to know the family of his college sweetheart.
16	THE WAGER	0385534264	9780385534260	The survivors of a shipwrecked British vessel on a secret mission during an imperial war with Spain have different accounts of events.
17	THE LIGHT WE CARRY	0593237463	9780593237465	The former first lady shares personal stories and the tools she uses to deal with difficult situations.
18	LOOK FOR ME THERE	0785291814	9780785291817	The Emmy Award–winning journalist details how he grieved for his late father and sought to make his own way.
19	OUTLIVE	0593236599	9780593236598	A look at recent scientific research on aging and longevity.
20	THE BODY KEEPS THE SCORE	0143127748	9780143127741	How trauma affects the body and mind, and innovative treatments for recovery.
21	SPARE	0593593804	9780593593806	The Duke of Sussex details his struggles with the royal family, loss of his mother, service in the British Army and marriage to Meghan Markle.
22	I'M GLAD MY MOM DIED	1982185821	9781982185824	The actress and filmmaker describes her eating disorders and difficult relationship with her mother.
23	CRYING IN H MART	1984898957	9781984898951	The daughter of a Korean mother and Jewish American father, and leader of the indie rock project Japanese Breakfast, describes creating her own identity after losing her mother to cancer.
24	LESSONS LEARNED AND CHERISHED	1368095054	9781368095051	Essays by celebrities about the teachers who impacted their lives.
25	THE ESCAPE ARTIST	0063112361	9780063112360	Rudolf Vrba, who became one of the first Jews to escape from Auschwitz, warned others about the death camp.
26	KILLERS OF THE FLOWER MOON	0307742482	9780307742483	The story of a murder spree in 1920s Oklahoma that targeted Osage Indians, whose lands contained oil.
27	TELL ME EVERYTHING	1250852064	9781250852069	The actress and philanthropist shares stories of adversity on her way to career success.
28	CASTE	None	9780593230268	The Pulitzer Prize-winning journalist examines aspects of caste systems across civilizations and reveals a rigid hierarchy in America today.
29	THE STORY OF ART WITHOUT MEN	0393881865	9780393881868	An overview of more than 300 works of art from the Renaissance to the present day by women artists.
30	GREENLIGHTS	0593139135	9780593139134	The Academy Award-winning actor shares snippets from the diaries he kept over the last 35 years.
31	THE 23RD MIDNIGHT	0316402788	9780316402781	The 23rd book in the Women’s Murder Club series. Lindsay Boxer tracks a copycat killer.
32	THE SECRET BOOK OF FLORA LEA	1668011832	9781668011836	When an illustrated book offering potential clues arrives years after World War II, a woman in London delves into her past.
33	TOMORROW, AND TOMORROW, AND TOMORROW	0593321200	9780593321201	Two friends find their partnership challenged in the world of video game design.
34	HANG THE MOON	1501117297	9781501117299	Nine years after being cast out, a young woman returns to reclaim her place in her family and comes into her own as a bootlegger.
35	THE FERRYMAN	052561947X	9780525619475	A man who shepherds retirees to an island where their bodies are renewed and memories wiped clean questions everything he once believed.
36	IT ENDS WITH US	1668021048	9781668021040	A battered wife raised in a violent home attempts to halt the cycle of abuse.
37	SUMMER ON SAG HARBOR	0062994212	9780062994219	Olivia Jones delves into her family's past at a historically Black beachfront community on Long Island.
38	REMARKABLY BRIGHT CREATURES	0063204150	9780063204157	A widow working the night shift at the Sowell Bay Aquarium is aided in solving a mystery by a giant Pacific octopus living there.
39	POVERTY, BY AMERICA	0593239911	9780593239919	The Pulitzer Prize-winning author of “Evicted” examines the ways in which affluent Americans keep poor people poor.
40	THE 1998 YANKEES	1538722976	9781538722978	The sports journalist looks back 25 years at the successful New York Yankees team that played that season.
41	YOU CAN'T JOKE ABOUT THAT	0063270420	9780063270428	The co-host of “Gutfeld!” and Fox News contributor gives her take on free speech and comedy.
42	HONEY, BABY, MINE	153872037X	9781538720370	Conversations on personal subjects from a mother and daughter who are also award-winning actresses.
43	QUANTUM SUPREMACY	0385548362	9780385548366	The ways in which quantum computing might be a benefit to society.
44	NEVER NEVER	1335004882	9781335004888	Questions arise when a pair of lovers try to uncover why they suddenly became strangers.
45	THE HOUSEMAID	1538742578	9781538742570	Troubles surface when a woman looking to make a fresh start takes a job in the home of the Winchesters.
46	UGLY LOVE	1476753180	9781476753188	A casual sexual relationship between Tate and Miles becomes more complicated than they expected.
47	ICEBREAKER	1668026031	9781668026038	Anastasia might need the help of the captain of a college hockey team to get on the Olympic figure skating team.
48	HEART BONES	1668021919	9781668021910	After an unexpected death prevents her from going to Penn State and and forces her to move in with her absent father, Beyah Grim has a summer fling with the rich guy next door.
49	THE SILENT PATIENT	125030170X	9781250301703	Theo Faber looks into the mystery of a famous painter who stops speaking after shooting her husband.
50	PRACTICE MAKES PERFECT	0593500806	9780593500804	A bodyguard is tasked with helping a florist find the love of her life.
51	THINGS WE NEVER GOT OVER	194563183X	9781945631832	A runaway bride becomes the guardian of her evil twin's daughter and gets some help from a bad-boy barber.
52	BRAIDING SWEETGRASS	1571313567	9781571313560	A botanist and member of the Citizen Potawatomi Nation espouses having an understanding and appreciation of plants and animals.
53	ALL ABOUT LOVE	0060959479	9780060959470	The late feminist icon explores the causes of a polarized society and the meaning of love.
54	FINDING ME	006303736X	9780063037366	The multiple-award-winning actress describes the difficulties she encountered before claiming her sense of self and achieving professional success.
55	THINKING, FAST AND SLOW	0374533555	9780374533557	When we can and cannot trust our intuitions in making business and personal decisions.
56	EDUCATED	0399590528	9780399590528	The daughter of survivalists, who is kept out of school, educates herself enough to leave home for university.
57	EMPIRE OF THE SUMMER MOON	1416591060	9781416591061	The story of Quanah Parker, the last chief of the Comanches.
58	THE DAWN OF EVERYTHING	1250858801	9781250858801	A reinvestigation of social evolution and suggestions for new ways of organizing society.
59	GRIT	1501111116	9781501111112	The MacArthur Fellow argues that passion and perseverance are more important than innate talent in creating success.
60	THE GLASS CASTLE	074324754X	9780743247542	The author recalls how she and her siblings were constantly moved from one bleak place to another.
61	TALKING TO STRANGERS	0316299227	9780316299220	Famous examples of miscommunication serve as the backdrop to explain potential conflicts and misunderstandings.
62	THE ANTHROPOCENE REVIEWED	0525555242	9780525555247	A collection of personal essays that review different facets of the human-centered planet.
63	MAGNOLIA TABLE, VOL. 3	0062820176	9780062820174	
64	ATOMIC HABITS	0735211299	9780735211292	
65	THE GLUCOSE GODDESS METHOD	1668024527	9781668024522	
66	THE CREATIVE ACT	0593652886	9780593652886	
67	THE BOY, THE MOLE, THE FOX AND THE HORSE	0062976583	9780062976581	
68	I WILL TEACH YOU TO BE RICH, SECOND EDITION	1523505745	9781523505746	
69	Y'ALL EAT YET?	0063087782	9780063087781	
70	SERENITY IN THE STORM	1637587295	9781637587294	
71	THE WISDOM OF THE BULLFROG	1538707942	9781538707944	
72	SOUL BOOM	0306828278	9780306828270	
73	THE SUN AND THE STAR	1368081150	9781368081153	The demigods Will and Nico embark on a dangerous journey to the Underworld to rescue an old friend.
74	WONDER	0375869026	9780375869020	A boy with a facial deformity starts school.
75	SKANDAR AND THE PHANTOM RIDER	1665912766	9781665912761	Skandar and his friends investigate how immortal unicorns are being slain.
76	REFUGEE	0545880831	9780545880831	Three children in three different conflicts look for safe haven.
77	IT'S NOT BRAGGING IF IT'S TRUE	0593568990	9780593568996	The author gives advice to young readers on how to achieve their dreams.
78	THE COMPLETE COOKBOOK FOR YOUNG CHEFS	1492670022	9781492670025	Over 100 kid-tested recipes from America's Test Kitchen.
79	FALL OF THE SCHOOL FOR GOOD AND EVIL	0063269538	9780063269538	Tensions rise between the twins Rhian and Rafal as Peter Pan makes a bid to take over the school.
80	ODDER	1250147425	9781250147424	After a shark attack, Odder recuperates at the aquarium with the scientists who raised her.
81	THE GOLDEN FROG GAMES	1338745794	9781338745795	Seven, Valley and Thorn must once again make their mark by competing in the Golden Frog Games.
82	BIG TREE	1338180630	9781338180633	Two sycamore seeds seek solace in the Cretaceous Period after being forced from their mother tree.
83	BECAUSE I HAD A TEACHER	1943200084	9781943200085	An ode to teachers.
84	DRAGONS LOVE TACOS	0803736800	9780803736801	What to serve your dragon-guests.
85	THANK YOU, TEACHER FROM THE VERY HUNGRY CATERPILLAR	0593226186	9780593226186	The insatiable insect's pedagogue appreciation.
86	THE WONDERFUL THINGS YOU WILL BE	0385376715	9780385376716	A celebration of future possibilities.
87	LITTLE TROUBLEMAKER MAKES A MESS	0593526090	9780593526095	Little Luvvie attempts to make a surprise meal for mom, but instead makes a big mess.
88	WHY A SON NEEDS A MOM	1728235847	9781728235844	The special bond between mother and son.
89	REPEAT AFTER ME	0593426975	9780593426975	Affirmations for young children.
90	I LOVE MOM WITH THE VERY HUNGRY CATERPILLAR	0451533461	9780451533463	That ravenous insect is brimming with motherly love.
91	THE DAY THE CRAYONS QUIT	0399255370	9780399255373	Problems arise when Duncan’s crayons revolt.
92	BIG	0316353221	9780316353229	A young girl’s journey to self-acceptance.
93	THE ONE AND ONLY	0063080087	9780063080089	The stories of Ivan, Bob and Ruby.
94	THE HUNGER GAMES	1338635174	9781338635171	In a dystopia, a girl fights for survival on live TV.
95	DIARY OF A WIMPY KID	141976294X	9781419762949	The travails and challenges of adolescence.
96	A GOOD GIRL'S GUIDE TO MURDER	1984896393	9781984896391	Pippa Fitz-Amobi solves murderous crimes.
97	HARRY POTTER	059035342X	9780590353427	A wizard hones his conjuring skills in the service of fighting evil.
98	THE SUMMER I TURNED PRETTY TRILOGY	1416968296	9781416968290	A beach house, summer love and enduring friendships.
99	CAPTAIN UNDERPANTS	1338865390	9781338865394	Boys and their principal fight evil.
100	PERCY JACKSON & THE OLYMPIANS	0786838655	9780786838653	A boy battles mythological monsters.
101	SHADOW AND BONE TRILOGY	125019623X	9781250196231	The basis of the Netflix series; previously titled "The Grisha Trilogy."
102	THE INHERITANCE GAMES	0759555400	9780759555402	Avery Grambs tries to figure out why an inheritance from a stranger was bestowed upon her.
103	SOLITAIRE	None	9781339016238	Tori Spring is determined to find out who's behind the blog called Solitaire, which has caused serious pranks at her school.
104	WARRIOR GIRL UNEARTHED	1250766583	9781250766588	Perry and Pauline Firekeeper-Birch discover that a local university is holding on to deceased Anishinaabe remains.
105	IMOGEN, OBVIOUSLY	0063045877	9780063045873	Imogen Scott, who is straight, goes along with a tale told by her friend Lili that the two of them dated.
106	MILES MORALES SUSPENDED	1665918462	9781665918466	Miles Morales encounters a termite with a secret that may destroy the world's history – particularly Black and brown history.
107	FIVE SURVIVE	0593374169	9780593374160	Six friends on a spring break road trip in an R.V. are the target of a sniper.
108	NICK AND CHARLIE	1338885103	9781338885101	Nick and Charlie question whether their love is strong enough to survive being apart when Nick leaves for university.
109	THE FIRST TO DIE AT THE END	0063240807	9780063240803	In this prequel to "They Both Die at the End," Orion and Valentino attend the premiere of Death-Cast in Times Square.
110	THE LITTLE MERMAID: AGAINST THE TIDE	1368077226	9781368077224	Ariel and her siblings must find their abducted sister, Mala, before the Coral Moon approaches.
111	SILVER IN THE BONE	0593481658	9780593481653	Tamsin Lark is on a quest to retrieve a magic ring that may break a curse on her brother, Cabell.
112	LIGHTLARK	1419760866	9781419760860	Every 100 years the island of Lightlark appears and a deadly competition called the Centennial takes place.
113	DARE TO LEAD	0399592520	9780399592522	
114	EXTREME OWNERSHIP	1250183863	9781250183866	
115	PARIS	0063224623	9780063224629	
116	TWENTY THOUSAND FLEAS UNDER THE SEA	1338801910	9781338801910	The 11th book in the Dog Man series. Piggy returns and the Supa Buddies are sabotaged.
117	COLLABORATIONS	1338846620	9781338846621	The fourth book in the Cat Kid Comic Club series. After doing their chores, baby frogs work together to create more mini-comics.
118	MOTHERING HEIGHTS	1338680455	9781338680454	The 10th book in the Dog Man series. Can the power of love overcome the darkness and despair created by new villains?
119	MOON RISING	1338730894	9781338730890	The sixth book in the Wings of Fire graphic novel series; adapted by Barry Deutsch and Rachel Swirsky.
120	GRIME AND PUNISHMENT	1338535625	9781338535624	The ninth book in the Dog Man series. After turning in his badge, the canine cop is determined not to just roll over.
121	SCHOOL TRIP	0062885537	9780062885531	The gang from Riverdale Academy Day face the unexpected when their faculty guides on a trip to Paris are replaced at the last minute.
122	ONE PIECE, VOL. 102	1974736555	9781974736553	Monkey D. Luffy faces Kaido once again while searching for the greatest treasure in the world.
123	KAIJU NO. 8, VOL. 6	1974736334	9781974736331	Director General Shinomiya must take action while Kikoru comes to the rescue of Kafka.
124	FOR WHOM THE BALL ROLLS	1338236598	9781338236590	The seventh book in the Dog Man series. A new villain has a bone to pick with Dog Man while Petey the Cat starts a new life.
125	MARY ANNE'S BAD LUCK MYSTERY	1338616102	9781338616101	The 13th book in the Baby-sitters Club graphic novel series. Mary Anne receives a bad-luck charm in the mail with instructions to wear it.
126	TEENAGE MUTANT NINJA TURTLES: THE LAST RONIN	1684058414	9781684058419	A lone Turtle goes on a mission to get justice for his family in a post-apocalyptic New York. Illustrated by Esau Escorza, Isaac Escorza and Ben Bishop.
127	FETCH-22	1338323210	9781338323214	The eighth book in the Dog Man series. Petey the Cat feels better after getting out of jail but Li’l Petey struggles to find good in the world.
128	SPY X FAMILY, VOL. 9	1974736288	9781974736287	A gang of assassins and bombs planted throughout a luxury cruiser put Loid, Anya and Yor in harm’s way. 
129	LORD OF THE FLEAS	1338741071	9781338741070	The fifth book in the Dog Man series. The villainous cat Petey becomes an unlikely ally.
130	SPY CAMP	1534499377	9781534499379	The second book in the Spy School graphic novel series. Ben Ripley, a middle schooler and aspiring spy, encounters an enemy spy organization at a wilderness camp.
131	THE RUSSIAN	1538703580	9781538703588	The 13th book in the Michael Bennett series. An assassin killing a number of women might disrupt the detective’s wedding plans.
132	SUSPECTS	1984821709	9781984821706	A C.I.A. agent on a covert mission develops a relationship with a woman who is considered fashion royalty and has a tragic past.
133	TWO ALONE	0778334449	9780778334446	After a plane crash, a businesswoman and a Vietnam veteran must rely on each other in the wilderness.
134	LEGACY	1250775000	9781250775009	Threats put in rhymes and sent from shifting locations escalate as the daughter of a successful fitness celebrity’s own yoga business grows.
135	DEATH OF THE BLACK WIDOW	1538753081	9781538753088	Detective Walter O’Brien is obsessed with an escape artist who bludgeoned her kidnapper and avoided police custody.
136	MERCY	1538719711	9781538719718	The fourth book in the Atlee Pine series. Atlee discovers her twin sister survived an abduction at the age of 6.
137	THE JENSENS OF COLORADO	0786050136	9780786050130	Three western stories: “Those Jensen Boys,” “The Jensen Brand” and “Heart of the Mountain Man.”
138	TOM CLANCY: ZERO HOUR	0593422740	9780593422748	Jack Ryan Jr. appears to be the only person who can stop a second Korean war.
139	SAVE IT FOR SUNDAY	078604957X	9780786049578	The second book in the Taylor Callahan, Circuit Rider series. Taylor’s trigger-happy past returns.
140	THE LAST HOUSE GUEST	1668012790	9781668012796	Avery Greer must fight the clock to clear her name and uncover her friend’s real killer.
141	ONE NIGHT	006108185X	9780061081859	A tale of two rival workaholic radio broadcasters who discover there is more to life than just their jobs.
142	GETTING EVEN	1420155547	9781420155549	Two suspense stories: “Yesterday’s Lies” and “Zachary’s Law.”
143	SOMEDAY WITH YOU	1335452796	9781335452795	Two romance stories: “Cordina’s Crown Jewel” and “Unfinished Business.”
144	READY FOR MARRIAGE	1335498419	9781335498410	When Mary Jo’s parents face legal troubles, she must go to the man she loved but whose heart she broke three years ago.
145	THE JUDGE'S LIST	0593157834	9780593157831	The second book in the Whistler series. Investigator Lacy Stoltz goes after a serial killer and closes in on a sitting judge.
146	THE ONE AND ONLY IVAN	0061992275	9780061992278	
147	THE WILD ROBOT	0316382000	9780316382007	
148	WISH	1250144051	9781250144058	
149	A LONG WALK TO WATER	0547577311	9780547577319	
150	RESTART	1338053809	9781338053807	
151	THE ONE AND ONLY BOB	0062991329	9780062991324	
152	FISH IN A TREE	0142426423	9780142426425	
153	A WOLF CALLED WANDER	006289594X	9780062895943	
154	OUT OF MY MIND	1416971718	9781416971719	
155	WHEN YOU TRAP A TIGER	1524715735	9781524715731	
156	IF HE HAD BEEN WITH ME	1728205484	9781728205489	
157	GIRL IN PIECES	1101934743	9781101934746	
158	BETTER THAN THE MOVIES	1534467637	9781534467637	
159	THE WAY I USED TO BE	1481449362	9781481449366	
160	ONE OF US IS LYING	1524714755	9781524714758	
161	THE ISLAND	0593481496	9780593481493	
162	THEY BOTH DIE AT THE END	0062457802	9780062457806	
163	SIX OF CROWS	125007696X	9781250076960	
164	THE BOOK THIEF	0375842209	9780375842207	
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
13	12	8
14	13	13
15	13	14
16	13	15
17	14	16
18	15	17
19	16	18
20	17	19
21	18	20
22	19	21
23	19	22
24	20	23
25	21	19
26	23	24
27	24	25
28	25	26
29	26	18
30	27	27
31	28	28
32	29	29
33	30	30
34	31	1
35	31	2
36	32	31
37	33	32
38	34	33
39	35	34
40	36	35
41	37	36
42	38	37
43	39	38
44	40	39
45	41	40
46	42	41
47	42	42
48	42	43
49	43	44
50	44	8
51	44	45
52	45	46
53	47	35
54	48	8
55	49	47
56	50	48
57	51	49
58	53	50
59	54	51
60	56	52
61	57	53
62	58	54
63	58	55
64	59	56
65	60	57
66	61	58
67	62	59
68	63	60
69	65	61
70	66	62
71	67	63
72	68	64
73	69	65
74	70	66
75	71	67
76	72	68
77	73	69
78	73	70
79	74	71
80	75	72
81	76	73
82	77	74
83	77	75
84	78	76
85	79	77
86	80	78
87	81	79
88	82	80
89	83	81
90	84	82
91	85	83
92	86	84
93	87	85
94	87	86
95	88	87
96	88	88
97	88	89
98	89	90
99	89	91
100	89	92
101	90	83
102	92	93
103	93	78
104	95	94
105	96	95
106	99	96
107	101	97
108	102	98
109	104	99
110	105	100
111	106	101
112	107	102
113	108	103
114	109	104
115	110	105
116	111	106
117	112	107
118	113	108
119	115	109
120	116	110
121	117	96
122	119	111
123	120	96
124	121	112
125	122	113
126	123	114
127	125	115
128	125	116
129	126	117
130	126	118
131	126	119
132	128	120
133	129	96
134	130	121
135	130	122
136	131	1
137	131	123
138	132	7
139	133	124
140	134	125
141	135	1
142	135	126
143	136	10
144	137	127
145	137	128
146	138	129
147	139	127
148	139	128
149	140	130
150	142	131
151	143	125
152	144	132
153	144	133
154	145	134
155	146	78
156	148	135
157	150	136
158	151	78
159	151	137
160	153	138
161	153	139
162	154	140
163	155	141
164	156	142
165	158	143
166	160	144
167	161	145
168	162	104
169	163	97
\.


--
-- Data for Name: books_categories; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_categories (book_category_id, book_id, category_id) FROM stdin;
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
-- Data for Name: books_subjects; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.books_subjects (book_subject_id, book_id, subject_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.categories (category_id, category, nyt_list_name_encoded) FROM stdin;
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
-- Data for Name: shelves; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.shelves (shelf_id, user_id, shelf_type) FROM stdin;
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: linuxuser
--

COPY public.subjects (subject_id, subject) FROM stdin;
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

SELECT pg_catalog.setval('public.authors_author_id_seq', 145, true);


--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_authors_book_author_id_seq', 169, true);


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_book_id_seq', 165, true);


--
-- Name: books_categories_book_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_categories_book_category_id_seq', 200, true);


--
-- Name: books_shelves_book_shelf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_shelves_book_shelf_id_seq', 1, false);


--
-- Name: books_subjects_book_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.books_subjects_book_subject_id_seq', 1, false);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 16, true);


--
-- Name: covers_cover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.covers_cover_id_seq', 165, true);


--
-- Name: shelves_shelf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.shelves_shelf_id_seq', 1, false);


--
-- Name: subjects_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: linuxuser
--

SELECT pg_catalog.setval('public.subjects_subject_id_seq', 1, false);


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
-- Name: books_subjects books_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_subjects
    ADD CONSTRAINT books_subjects_pkey PRIMARY KEY (book_subject_id);


--
-- Name: categories categories_category_key; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_key UNIQUE (category);


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
-- Name: shelves shelves_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.shelves
    ADD CONSTRAINT shelves_pkey PRIMARY KEY (shelf_id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (subject_id);


--
-- Name: subjects subjects_subject_key; Type: CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_subject_key UNIQUE (subject);


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
-- Name: books_subjects books_subjects_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_subjects
    ADD CONSTRAINT books_subjects_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: books_subjects books_subjects_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: linuxuser
--

ALTER TABLE ONLY public.books_subjects
    ADD CONSTRAINT books_subjects_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(subject_id);


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

