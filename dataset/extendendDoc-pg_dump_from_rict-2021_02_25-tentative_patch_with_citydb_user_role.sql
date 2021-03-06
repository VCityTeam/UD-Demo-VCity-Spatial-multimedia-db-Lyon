--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Roles
--

CREATE ROLE citydb_user;
ALTER ROLE citydb_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5413fdc577afa81da881b3d3f9989718d';

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
-- Name: extended_doc_guided_tour; Type: TABLE; Schema: public; Owner: citydb_user; Tablespace: 
--

CREATE TABLE public.extended_doc_guided_tour (
    id integer NOT NULL,
    tour_id integer,
    doc_id integer,
    doc_position integer,
    text1 character varying,
    text2 character varying,
    title character varying
);


ALTER TABLE public.extended_doc_guided_tour OWNER TO citydb_user;

--
-- Name: extended_doc_guided_tour_id_seq; Type: SEQUENCE; Schema: public; Owner: citydb_user
--

CREATE SEQUENCE public.extended_doc_guided_tour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extended_doc_guided_tour_id_seq OWNER TO citydb_user;

--
-- Name: extended_doc_guided_tour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: citydb_user
--

ALTER SEQUENCE public.extended_doc_guided_tour_id_seq OWNED BY public.extended_doc_guided_tour.id;


--
-- Name: extended_document; Type: TABLE; Schema: public; Owner: citydb_user; Tablespace: 
--

CREATE TABLE public.extended_document (
    id integer NOT NULL
);


ALTER TABLE public.extended_document OWNER TO citydb_user;

--
-- Name: extended_document_id_seq; Type: SEQUENCE; Schema: public; Owner: citydb_user
--

CREATE SEQUENCE public.extended_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extended_document_id_seq OWNER TO citydb_user;

--
-- Name: extended_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: citydb_user
--

ALTER SEQUENCE public.extended_document_id_seq OWNED BY public.extended_document.id;


--
-- Name: guided_tour; Type: TABLE; Schema: public; Owner: citydb_user; Tablespace: 
--

CREATE TABLE public.guided_tour (
    id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE public.guided_tour OWNER TO citydb_user;

--
-- Name: guided_tour_id_seq; Type: SEQUENCE; Schema: public; Owner: citydb_user
--

CREATE SEQUENCE public.guided_tour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guided_tour_id_seq OWNER TO citydb_user;

--
-- Name: guided_tour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: citydb_user
--

ALTER SEQUENCE public.guided_tour_id_seq OWNED BY public.guided_tour.id;


--
-- Name: metadata; Type: TABLE; Schema: public; Owner: citydb_user; Tablespace: 
--

CREATE TABLE public.metadata (
    id integer NOT NULL,
    title character varying NOT NULL,
    subject character varying NOT NULL,
    description character varying NOT NULL,
    "refDate" character varying,
    "publicationDate" character varying,
    type character varying,
    link character varying,
    "originalName" character varying
);


ALTER TABLE public.metadata OWNER TO citydb_user;

--
-- Name: visualisation; Type: TABLE; Schema: public; Owner: citydb_user; Tablespace: 
--

CREATE TABLE public.visualisation (
    id integer NOT NULL,
    "quaternionX" double precision,
    "quaternionY" double precision,
    "quaternionZ" double precision,
    "quaternionW" double precision,
    "positionX" double precision,
    "positionY" double precision,
    "positionZ" double precision
);


ALTER TABLE public.visualisation OWNER TO citydb_user;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: citydb_user
--

ALTER TABLE ONLY public.extended_doc_guided_tour ALTER COLUMN id SET DEFAULT nextval('public.extended_doc_guided_tour_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: citydb_user
--

ALTER TABLE ONLY public.extended_document ALTER COLUMN id SET DEFAULT nextval('public.extended_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: citydb_user
--

ALTER TABLE ONLY public.guided_tour ALTER COLUMN id SET DEFAULT nextval('public.guided_tour_id_seq'::regclass);


--
-- Data for Name: extended_doc_guided_tour; Type: TABLE DATA; Schema: public; Owner: citydb_user
--

COPY public.extended_doc_guided_tour (id, tour_id, doc_id, doc_position, text1, text2, title) FROM stdin;
1	1	1	1	En 1725 l???ancien ????domaine rural de la Part-Dieu???? est donn?? ?? l???H??tel-Dieu, principal h??pital de Lyon, par une riche h??riti??re, Catherine Servient. C???est la coutume lyonnaise d???aide aux pauvres dans le contexte d???une soci??t?? majoritairement catholique.</p><p> En f??vrier 1812, le Rh??ne inonde la ville avec de gros d??g??ts sur sa rive gauche. Apr??s la d??crue, un lac reste, donnant lieu ?? la d??nomination de ????Grand Pr?? du Lac ??.</p><p> L???exploitation du lieu par des cultivateurs est totalement rurale jusqu???en 1839 o?? les Hospices civils, form??s par la r??union de l???H??tel Dieu et des autres h??pitaux lyonnais, louent le terrain avec une nouvelle destination??: ????promenades, jeux de boules et autres amusements publics????, car la ville se rapproche.	Plan des terrains de la rive gauche du Rh??ne vers 1760. L'??tat ancien est superpos?? au trac?? r??cent du Rh??ne et des art??res principales de Lyon. 	1/ Du rural aux loisirs??: l?????volution de la terre du lac avant la cr??ation de l?????lot (1725-1851)
2	1	2	2	<p>En 1725 l???ancien ????domaine rural de la Part-Dieu???? est donn?? ?? l???H??tel-Dieu, principal h??pital de Lyon, par une riche h??riti??re, Catherine Servient. C???est la coutume lyonnaise d???aide aux pauvres dans le contexte d???une soci??t?? majoritairement catholique.</p><p> En f??vrier 1812, le Rh??ne inonde la ville avec de gros d??g??ts sur sa rive gauche. Apr??s la d??crue, un lac reste, donnant lieu ?? la d??nomination de ????Grand Pr?? du Lac ??.</p><p> L???exploitation du lieu par des cultivateurs est totalement rurale jusqu???en 1839 o?? les Hospices civils, form??s par la r??union de l???H??tel Dieu et des autres h??pitaux lyonnais, louent le terrain avec une nouvelle destination??: ????promenades, jeux de boules et autres amusements publics????, car la ville se rapproche.</p>	Sur ce plan de 1824, le lac apparu en 1812 est pr??sent. Les limites de l?????lot ne sont pas encore dessin??es, mais l???extension du plan en damier de Morand, au nord, se rapproche et va bient??t structurer cette zone.	1/ Du rural aux loisirs??: l?????volution de la terre du lac avant la cr??ation de l?????lot (1725-1851)
3	1	3	3	<p>En 1851, en vue de l???expiration prochaine du bail de l???ensemble de la Terre du lac, les Hospices ??laborent un plan de division de ce secteur en une douzaine de ????masses???? destin??es ?? ??tre lou??es directement. Les voies sont dessin??es et c???est sans doute ?? cette ??tape que la masse 166 est num??rot??e par les Hospices.</p><p>En 1853, ceux-ci signent le premier bail direct de l?????lot pour 12 ans avec une femme, Mme Anne-Marie Amand, marchande de vin. Au XIXe si??cle, les femmes sont absentes des professions politiques et techniques, mais elles sont nombreuses pour l???achat et la location des terrains.	En 1853, il existe d??j?? des constructions, dispos??es majoritairement au nord et ?? l???ouest de l?????lot. C???est le 1e stade de la densification. Il est clair que les b??timents en biais ont ??t?? implant??s selon cette orientation pour faire face ?? la berge du lac.	2/ Le dessin de l?????lot du lac, le 1e bail direct de l?????lot et les 1e constructions (1851-1860)
4	1	4	4	<p>En 1851, en vue de l???expiration prochaine du bail de l???ensemble de la Terre du lac, les Hospices ??laborent un plan de division de ce secteur en une douzaine de ????masses???? destin??es ?? ??tre lou??es directement. Les voies sont dessin??es et c???est sans doute ?? cette ??tape que la masse 166 est num??rot??e par les Hospices.</p><p>En 1853, ceux-ci signent le premier bail direct de l?????lot pour 12 ans avec une femme, Mme Anne-Marie Amand, marchande de vin. Au XIXe si??cle, les femmes sont absentes des professions politiques et techniques, mais elles sont nombreuses pour l???achat et la location des terrains.	Cette photo prise ?? la suite de la grande inondation de 1856 permet de conna??tre la typologie du b??ti ?? cette ??poque??: petites maisons populaires ?? 2 niveaux, souvent construites en pis?? de terre crue.	2/ Le dessin de l?????lot du lac, le 1e bail direct de l?????lot et les 1e constructions (1851-1860)
6	1	6	6	<p>Plus les terrains prennent de la valeur, et plus le propri??taire foncier a int??r??t ?? louer des surfaces de plus en plus petites, passant ainsi de l?????chelle du domaine ?? celui de l?????lot, puis de la parcelle.</p> <p>Les Hospices arr??tent la location g??n??rale de l?????lot en 1880, lors du renouvellent des deux baux, et traitent directement avec les sous-locataires, ce qui fait presque doubler leur revenu annuel.</p><p>Les locataires directes pratiquent ?? leur tour la sous-location ?? plusieurs niveaux. Ce syst??me d???embo??tement de type ????poup??es russes???? est tr??s r??pandu sur le domaine des Hospices.</p>	Cette page du registre des locations montre bien l?????volution entre les 2 locations par portions de masse en 1863/1865 et les 23 locations par parcelles en 1880. Les baux ont tous la m??me dur??e, 15 ans. 	4/ Le passage de la location g??n??rale de l?????lot ?? la location par parcelles (1880-1895)
7	1	7	7	<p>Plus les terrains prennent de la valeur, et plus le propri??taire foncier a int??r??t ?? louer des surfaces de plus en plus petites, passant ainsi de l?????chelle du domaine ?? celui de l?????lot, puis de la parcelle.</p> <p>Les Hospices arr??tent la location g??n??rale de l?????lot en 1880, lors du renouvellent des deux baux, et traitent directement avec les sous-locataires, ce qui fait presque doubler leur revenu annuel.</p><p>Les locataires directes pratiquent ?? leur tour la sous-location ?? plusieurs niveaux. Ce syst??me d???embo??tement de type ????poup??es russes???? est tr??s r??pandu sur le domaine des Hospices.</p>	On atteint ici la densification maximale, le 3e et dernier stade. Ensuite, l?????lot va se renouveler par de continuelles reconfigurations des limites parcellaires, r??gularis??es par les Hospices (en1880, il y a 10 lots de moins que les 33 lots figurants sur le plan de 1865), autour d???un b??ti sans doute plus stable.	4/ Le passage de la location g??n??rale de l?????lot ?? la location par parcelles (1880-1895)
8	1	8	8	<p>La rue Barrier est cr????e en 1895 et divise l?????lot en deux parties ?? peu pr??s ??gales (l?????lot 166, ?? l???ouest, et le 166bis, ?? l???est), changeant profond??ment sa configuration initiale.</p><p>Entre 1910 et les ann??es 1970 environ, des ??largissements successifs de voies entament les deux ??lots. Les rues Bugeaud et Garibaldi (de presque 10 m pour cette derni??re) sont ??largies, tandis que quatre pans coup??s sont c??d??s ?? la Ville de Lyon aux coins de la masse 166 ouest, selon une mode r??pandue au milieu du XX??me si??cle.<p></p> Le b??ti continue ?? ??voluer par des d??molitions et des adjonctions de nouvelles constructions, sur??l??vations, ou transformations. </p>	Sur ce plan de 1949, la s??paration de l?????lot en deux est claire. Dans la partie situ??e ?? l???est subsiste toujours des b??timents plac??s en diagonale, influenc??s par le lac disparu pourtant depuis longtemps.	5/ La cr??ation de la rue Barrier et la division de l?????lot en deux (1895-1968)
9	1	9	9	<p>En 1968, l?????lot 166 bis (est) est vendu et le parcellaire comme le b??ti anciens totalement d??truits. L?????Office municipal des HLM de Lyon???? y fait construire par les architectes Ren?? Gages et Michel Marin deux immeubles d???habitation entre 1969 et 1971.</p><p> R. Gages est alors un des leaders du Mouvement moderne ?? Lyon et r??alise ici une construction caract??ristique de cette tendance??: barres pos??es sur des galettes, grande hauteur (13 ??tages), forte densit??, fa??ades tr??s perc??es, b??ton brut.</p><p>L?????lot 166 (ouest), dont on n???a pas retrouv?? les archives, est sans doute vendu, d??truit et reconstruit ?? la m??me p??riode car sa facture architecturale est tr??s proche de celle de son voisin.</p>	Cette photo a??rienne de 1957 est exceptionnelle par sa qualit??, mais aussi car elle montre l?????tat des deux ??lots juste avant leur d??molition. 	6/ La d??molition-reconstruction des 2 ??lots (1968-1971)
10	1	10	10	<p>En 1968, l?????lot 166 bis (est) est vendu et le parcellaire comme le b??ti anciens totalement d??truits. L?????Office municipal des HLM de Lyon???? y fait construire par les architectes Ren?? Gages et Michel Marin deux immeubles d???habitation entre 1969 et 1971.</p><p> R. Gages est alors un des leaders du Mouvement moderne ?? Lyon et r??alise ici une construction caract??ristique de cette tendance??: barres pos??es sur des galettes, grande hauteur (13 ??tages), forte densit??, fa??ades tr??s perc??es, b??ton brut.</p><p>L?????lot 166 (ouest), dont on n???a pas retrouv?? les archives, est sans doute vendu, d??truit et reconstruit ?? la m??me p??riode car sa facture architecturale est tr??s proche de celle de son voisin.</p>	Projet d?????l??vation d???un immeuble de l?????lot 166 (est) dessin?? par R. Gages et M. Marin le 10 janvier 1969. Fa??ade sur rue du b??timent B.	6/ La d??molition-reconstruction des 2 ??lots (1968-1971)
11	1	11	11	<p>En 1968, l?????lot 166 bis (est) est vendu et le parcellaire comme le b??ti anciens totalement d??truits. L?????Office municipal des HLM de Lyon???? y fait construire par les architectes Ren?? Gages et Michel Marin deux immeubles d???habitation entre 1969 et 1971.</p><p> R. Gages est alors un des leaders du Mouvement moderne ?? Lyon et r??alise ici une construction caract??ristique de cette tendance??: barres pos??es sur des galettes, grande hauteur (13 ??tages), forte densit??, fa??ades tr??s perc??es, b??ton brut.</p><p>L?????lot 166 (ouest), dont on n???a pas retrouv?? les archives, est sans doute vendu, d??truit et reconstruit ?? la m??me p??riode car sa facture architecturale est tr??s proche de celle de son voisin.</p>	A part les photos de Bellat de 1957 en noir et blanc, il n???existe aucune repr??sentation des 2 ??lots avant leur d??molition. Cette photo de 1981 d???un autre ??lot situ?? dans le m??me quartier sugg??re en couleur, et par comparaison, le type de b??ti qui existait sur les deux ??lots.	6/ La d??molition-reconstruction des 2 ??lots (1968-1971)
12	1	12	12	<p>A partir des ann??es 1970, l???ancienne caserne proche des ??lots 166 et 166 bis est remplac??e par le ????Centre r??gional de d??cision???? de la Part-Dieu, le 2??me centre de Lyon.</p><p> Cette mutation cr??e une forte plus value dans le quartier, qui explique les transformations des deux ??lots.</p><p> Ceux-ci n???ont ensuite quasiment pas subis de modifications jusqu????? aujourd???hui.</p>	Plan de 1981 ou figurent les 2 ??lots reconstruits 10 ans plus t??t.	7/ Les deux ??lots sans changement jusqu????? aujourd???hui (1971-2017)
13	1	13	13	<p>A partir des ann??es 1970, l???ancienne caserne proche des ??lots 166 et 166 bis est remplac??e par le ????Centre r??gional de d??cision???? de la Part-Dieu, le 2??me centre de Lyon.</p><p> Cette mutation cr??e une forte plus value dans le quartier, qui explique les transformations des deux ??lots.</p><p> Ceux-ci n???ont ensuite quasiment pas subis de modifications jusqu????? aujourd???hui.</p>	Les ??lots 166 (est) au 1e plan et 166 (ouest) en 2009.	7/ Les deux ??lots sans changement jusqu????? aujourd???hui (1971-2017)
\.


--
-- Name: extended_doc_guided_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: citydb_user
--

SELECT pg_catalog.setval('public.extended_doc_guided_tour_id_seq', 10, true);


--
-- Data for Name: extended_document; Type: TABLE DATA; Schema: public; Owner: citydb_user
--

COPY public.extended_document (id) FROM stdin;
1
2
3
4
6
7
8
9
10
11
12
13
70
\.


--
-- Name: extended_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: citydb_user
--

SELECT pg_catalog.setval('public.extended_document_id_seq', 85, true);


--
-- Data for Name: guided_tour; Type: TABLE DATA; Schema: public; Owner: citydb_user
--

COPY public.guided_tour (id, name, description) FROM stdin;
1	Les processus incr??mentaux : l???exemple de l?????lot du lac (1725 ?? aujourd???hui)	L???histoire de l?????lot du lac pendant 300 ans est un parfait exemple de l?????volution spontan??e d???un ??lot urbain. Elle montre comment il nait, se d??veloppe, puis est ras?? et reconstruit. Elle permet surtout de comprendre le m??canisme de la lente densification progressive, sans volont?? planificatrice de quiconque, propri??taire foncier ou pouvoirs publiques. C???est ce que l???on appelle un ?? processus incr??mental ??: personne n???a d??cid?? au d??part que l?????lot devrait ??voluer de cette fa??on, pourtant, des si??cles plus tard, le r??sultat est bien l??, logique et coh??rent.
2	Premi??re visite guid??e	*Test* premi??re visite. On ajoutera une description ici, et on cr??era une seconde visite guid??e lorsque l???on aura les documents / informations n??cessaires.
\.


--
-- Name: guided_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: citydb_user
--

SELECT pg_catalog.setval('public.guided_tour_id_seq', 4, true);


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: public; Owner: citydb_user
--

COPY public.metadata (id, title, subject, description, "refDate", "publicationDate", type, link, "originalName") FROM stdin;
9	Vue depuis la rue Garibaldi vers l???est, entre la rue de S??ze (?? gauche) et la rue Vauban (?? droite).	Tourism	Photo : A. Bellat, 1957, HCL. D.	1957-01-01	1957-01-00	none	9.jpg	1957PhotoABellatHCL_HD.jpg
13	Vue actuelle de l?????lot	Tourism	Vue 3D reconstitu??e ?? partir d???image satellite, ??Google 2017	2017-01-01		none	13.jpg	2017IDLActuelGoogleMaps_HD.jpg
8	Plan des ??lots 166 bis (est ) et 166 (ouest) en 1949, d??tail d???un plan g??n??ral de Lyon	Tourism	(en ligne sur le site des AML??: ????AML - carte et plans, 12-3 Plan de secteur au 1/2000 (s??rie 5s) - Plan g??n??ral de Lyon 1949 vue 1????)UPDATE	1949-01-01		none	8.jpg	1949PlanGalLyon_HD.jpg
2	Plan cadastral partiel de la Guilloti??re lev?? par Terra en 1824	Urbanism	AML, 1969, ????Carton 376 W 003????, permis de construire de l???ensemble de l?????lot166 (est) 	1969-01-01	2018-09-05	none	2.jpg	1824marsPlanCadastralTerra_HD.jpg
7	Liste des locataires de la masse 166, page du registre des locations en 1880	Tourism	AML, 1880, fonds HCL, 2 NP 55??: registre ????Location des terrains urbains, 1871-1880???? 	1880-01-01		none	7.jpg	1880TxtLoc_HD.jpg
6	Plan de la masse 166 vers 1880	Tourism	C. Rivi??re, 15 avril 1880, HCL. D., plans minutes	1880-01-01	1880-04-15	none	6.jpg	1880PlanRiviereHCL_M166_HD.jpg
11	Permis de construire de l???ensemble de l?????lot166 (est)	Urbanism	AML, 1969, ????Carton 376 W 003????, permis de construire de l???ensemble de l?????lot166 (est) 	1969-01-01	2018-09-05	none	11.jpg	1969ProjetArchiIlotEGagesMarin_HD.jpg
4	Vue du cours Lafayette en direction du sud-est pendant les inondations.	Urbanism	Photo??: L. Froissard, 1856, AML, 3 PH 599 	1856-01-01		none	4.jpg	1856PhotoAMLa_3PH_599_HD.jpg
3	Plan de la masse 166 en 1853	Urbanism	Inspecteur des domaines, 31 mars 1880, HCL. D., plans minutes	1853-01-01	1880-03-31	none	3.jpg	1853PlanIlotInspHCL_HD.jpg
1	Plan du domaine des Hospices Civils de Lyon de 1760	Tourism	HCL, 1760. Service des domaines des Hospices, juin 1938, ??chelle??:??2/7??500, HCL. D.	1760-01-01	2018-09-05	none	1.jpg	1760versPlanHCL_HD.jpg
12	D??tail d???un plan g??n??ral de Lyon	Tourism	D??tail d???un plan g??n??ral de Lyon, 1981 [AML s??rie 5 S]	1981-01-01		none	12.jpg	1981PlanGalLyonAML_HD.jpg
10	Int??rieur de l'??lot 143 vu depuis l'angle des rues Vend??me et Barr??me.	Tourism	AML, 1880, fonds HCL, 2 NP 55??: registre ????Location des terrains urbains, 1871-1880???? 	1880-01-01	2018-09-25	none	10.jpg	1981PhotoASCIlot143_HD.jpg
70	Plan de l'od??on de Fourvi??re	Architecture	Illustration de Jo??l Thibault - Od??on de Fourvi??re, Lyon	1941-01-01	2016-03-14	\N	70.jpg	\N
\.


--
-- Data for Name: visualisation; Type: TABLE DATA; Schema: public; Owner: citydb_user
--

COPY public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") FROM stdin;
1	0.0050000000000000001	-0.00400000000000000008	-0.679980000000000029	0.731500000000000039	1843582	5176414	12651
2	0.00899999999999999932	-0.00779999999999999964	-0.654800000000000049	0.755700000000000038	1843387	5175816	6988
3	0	0	0.077118000000000006	1	1844023	5175781	887
4	-0.42599999999999999	0.510000000000000009	0.572999999999999954	-0.478999999999999981	1843489	5175421	228
6	0	0	0.0782000000000000056	1	1844026	5175777	569
7	0.325799999999999979	-0.0200000000000000004	-0.0580000000000000029	0.942999999999999949	1844021	5175534	483
8	0	0	0.0635000000000000009	1	1844031	5175773	626
9	0.433499999999999996	-0.35199999999999998	-0.52300000000000002	0.643000000000000016	1843388	5175671	496
10	0.117999999999999994	0.486999999999999988	0.839999999999999969	0.203800000000000009	1844149	5176070	359
11	0.287999999999999978	-0.362999999999999989	-0.693799999999999972	0.551000000000000045	1843693	5175853	383
12	0	0	0.0769439999999999985	1	1844018	5175765	771
13	0.231000000000000011	0.113000000000000003	0.422999999999999987	0.867999999999999994	1844227	5175626	588
70	0.000712568143791715959	0.00065136742202096887	0.674699230660693039	0.738092146085426726	1841556.85275246203	5174800.03405741788	504.807718222592257
\.


--
-- Name: extended_doc_guided_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: citydb_user; Tablespace: 
--

ALTER TABLE ONLY public.extended_doc_guided_tour
    ADD CONSTRAINT extended_doc_guided_tour_pkey PRIMARY KEY (id);


--
-- Name: extended_document_pkey; Type: CONSTRAINT; Schema: public; Owner: citydb_user; Tablespace: 
--

ALTER TABLE ONLY public.extended_document
    ADD CONSTRAINT extended_document_pkey PRIMARY KEY (id);


--
-- Name: guided_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: citydb_user; Tablespace: 
--

ALTER TABLE ONLY public.guided_tour
    ADD CONSTRAINT guided_tour_pkey PRIMARY KEY (id);


--
-- Name: metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: citydb_user; Tablespace: 
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);


--
-- Name: visualisation_pkey; Type: CONSTRAINT; Schema: public; Owner: citydb_user; Tablespace: 
--

ALTER TABLE ONLY public.visualisation
    ADD CONSTRAINT visualisation_pkey PRIMARY KEY (id);


--
-- Name: extended_doc_guided_tour_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: citydb_user
--

ALTER TABLE ONLY public.extended_doc_guided_tour
    ADD CONSTRAINT extended_doc_guided_tour_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.extended_document(id) ON DELETE CASCADE;


--
-- Name: extended_doc_guided_tour_tour_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: citydb_user
--

ALTER TABLE ONLY public.extended_doc_guided_tour
    ADD CONSTRAINT extended_doc_guided_tour_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.guided_tour(id);


--
-- Name: metadata_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: citydb_user
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_id_fkey FOREIGN KEY (id) REFERENCES public.extended_document(id);


--
-- Name: visualisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: citydb_user
--

ALTER TABLE ONLY public.visualisation
    ADD CONSTRAINT visualisation_id_fkey FOREIGN KEY (id) REFERENCES public.extended_document(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

