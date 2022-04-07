--
-- PostgreSQL database dump
--

-- Dumped from database version 10.20 (Debian 10.20-1.pgdg90+1)
-- Dumped by pg_dump version 14.1

-- Started on 2022-04-07 11:50:04

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
-- TOC entry 524 (class 1247 OID 16386)
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status AS ENUM (
    'Validated',
    'InValidation'
);


ALTER TYPE public.status OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 196 (class 1259 OID 16391)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    user_id integer,
    doc_id integer,
    description character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16397)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 197
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 198 (class 1259 OID 16399)
-- Name: document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document (
    id integer NOT NULL,
    title character varying NOT NULL,
    source character varying NOT NULL,
    description character varying NOT NULL,
    "refDate" timestamp with time zone,
    "publicationDate" timestamp with time zone,
    "rightsHolder" character varying,
    file character varying
);


ALTER TABLE public.document OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16405)
-- Name: document_guided_tour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document_guided_tour (
    id integer NOT NULL,
    tour_id integer,
    doc_id integer,
    doc_position integer,
    text1 character varying,
    text2 character varying,
    title character varying
);


ALTER TABLE public.document_guided_tour OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16411)
-- Name: document_guided_tour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.document_guided_tour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_guided_tour_id_seq OWNER TO postgres;

--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 200
-- Name: document_guided_tour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.document_guided_tour_id_seq OWNED BY public.document_guided_tour.id;


--
-- TOC entry 201 (class 1259 OID 16413)
-- Name: document_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_id_seq OWNER TO postgres;

--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 201
-- Name: document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.document_id_seq OWNED BY public.document.id;


--
-- TOC entry 202 (class 1259 OID 16415)
-- Name: document_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document_user (
    id integer NOT NULL,
    doc_id integer,
    user_id integer
);


ALTER TABLE public.document_user OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16418)
-- Name: document_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.document_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_user_id_seq OWNER TO postgres;

--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 203
-- Name: document_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.document_user_id_seq OWNED BY public.document_user.id;


--
-- TOC entry 204 (class 1259 OID 16420)
-- Name: guided_tour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guided_tour (
    id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE public.guided_tour OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16426)
-- Name: guided_tour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guided_tour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guided_tour_id_seq OWNER TO postgres;

--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 205
-- Name: guided_tour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guided_tour_id_seq OWNED BY public.guided_tour.id;


--
-- TOC entry 206 (class 1259 OID 16428)
-- Name: link_city_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_city_object (
    id integer NOT NULL,
    source_id integer NOT NULL,
    target_id character varying NOT NULL,
    centroid_x double precision,
    centroid_y double precision,
    centroid_z double precision
);


ALTER TABLE public.link_city_object OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16434)
-- Name: link_city_object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.link_city_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_city_object_id_seq OWNER TO postgres;

--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 207
-- Name: link_city_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.link_city_object_id_seq OWNED BY public.link_city_object.id;


--
-- TOC entry 208 (class 1259 OID 16436)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    email character varying NOT NULL,
    role_id integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16442)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 210 (class 1259 OID 16444)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    id integer NOT NULL,
    label character varying
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16450)
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_id_seq OWNER TO postgres;

--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 211
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.id;


--
-- TOC entry 212 (class 1259 OID 16452)
-- Name: validation_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.validation_status (
    doc_id integer NOT NULL,
    status public.status NOT NULL
);


ALTER TABLE public.validation_status OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16455)
-- Name: versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    doc_id integer,
    user_id integer NOT NULL,
    title character varying NOT NULL,
    source character varying NOT NULL,
    description character varying NOT NULL,
    "refDate" timestamp with time zone,
    "publicationDate" timestamp with time zone,
    "rightsHolder" character varying,
    file character varying,
    "quaternionX" double precision,
    "quaternionY" double precision,
    "quaternionZ" double precision,
    "quaternionW" double precision,
    "positionX" double precision,
    "positionY" double precision,
    "positionZ" double precision,
    version integer NOT NULL
);


ALTER TABLE public.versions OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16461)
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO postgres;

--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 214
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- TOC entry 215 (class 1259 OID 16463)
-- Name: visualisation; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.visualisation OWNER TO postgres;

--
-- TOC entry 2792 (class 2604 OID 16466)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 2793 (class 2604 OID 16467)
-- Name: document id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document ALTER COLUMN id SET DEFAULT nextval('public.document_id_seq'::regclass);


--
-- TOC entry 2794 (class 2604 OID 16468)
-- Name: document_guided_tour id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_guided_tour ALTER COLUMN id SET DEFAULT nextval('public.document_guided_tour_id_seq'::regclass);


--
-- TOC entry 2795 (class 2604 OID 16469)
-- Name: document_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_user ALTER COLUMN id SET DEFAULT nextval('public.document_user_id_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 16470)
-- Name: guided_tour id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guided_tour ALTER COLUMN id SET DEFAULT nextval('public.guided_tour_id_seq'::regclass);


--
-- TOC entry 2797 (class 2604 OID 16471)
-- Name: link_city_object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_city_object ALTER COLUMN id SET DEFAULT nextval('public.link_city_object_id_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 16472)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 16473)
-- Name: user_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role ALTER COLUMN id SET DEFAULT nextval('public.user_role_id_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 16474)
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- TOC entry 2959 (class 0 OID 16391)
-- Dependencies: 196
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2961 (class 0 OID 16399)
-- Dependencies: 198
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (2, 'Vue actuelle de l’îlot', '©Google 2017', 'Tourism	Vue 3D reconstituée à partir d’image satellite', '2017-01-01 00:00:00+00', '2017-01-01 00:00:00+00', '©Google 2017', '82d4ae7b-f194-4f15-9198-afc8127648a6.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (3, 'Rue Garibaldi', 'Tourism	Photo : A. Bellat, 1957, HCL. D.', 'Vue depuis la rue Garibaldi vers l’est, entre la rue de Sèze (à gauche) et la rue Vauban (à droite).', '1957-01-01 00:00:00+00', '1957-01-01 00:00:00+00', 'Tourism	Photo : A. Bellat, 1957, HCL. D.', 'd9319c0d-ce3f-46e8-a0da-0e053b4d7a42.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (4, 'Plan des îlots 166 bis (est ) et 166 (ouest) en 1949, détail d’un plan général de Lyon', 'site des AML :', 'Tourism	(en ligne sur le site des AML : « AML - carte et plans, 12-3 Plan de secteur au 1/2000 (série 5s) - Plan général de Lyon 1949 vue 1 »)UPDATE', '1949-01-01 00:00:00+00', '1949-01-01 00:00:00+00', 'site des AML :', '88260de4-3ace-4dc0-b257-201ca915ae1a.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (5, 'Plan cadastral partiel de la Guillotière levé par Terra en 1824	Urbanism', 'site des AML :', 'AML, 1969, « Carton 376 W 003 », permis de construire de l’ensemble de l’îlot166 (est)', '1969-01-01 00:00:00+00', '2018-05-09 00:00:00+00', 'site des AML :', '2938ca4b-395d-4ce5-a4ca-6689ccb8f500.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (6, 'Liste des locataires de la masse 166, page du registre des locations en 1880', '1880TxtLoc_HD.jpg', 'Tourism	AML, 1880, fonds HCL, 2 NP 55 : registre « Location des terrains urbains, 1871-1880 »', '1880-01-01 00:00:00+00', '2022-04-07 00:00:00+00', 'site des AML :', '6b4e4005-c70f-4211-a3d2-7fada6179286.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (7, 'Plan de la masse 166 vers 1880', '1880TxtLoc_HD.jpg', 'Tourism	C. Rivière, 15 avril 1880, HCL. D., plans minutes', '1880-01-01 00:00:00+00', '1880-04-15 00:00:00+00', 'site des AML', '2e2da624-bb9e-4afc-bf4f-dbb465716fcc.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (8, 'Permis de construire de l’ensemble de l’îlot166 (est)', 'Site des AML', 'Urbanism	AML, 1969, « Carton 376 W 003 », permis de construire de l’ensemble de l’îlot166 (est)', '1969-01-01 00:00:00+00', '2018-09-05 00:00:00+00', 'site des AML', '63f00396-0052-4188-a3e7-26c4dd4b01cc.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (9, 'Urbanism', 'Photo : L. Froissard, 1856, AML, 3 PH 599 ', 'Vue du cours Lafayette en direction du sud-est pendant les inondations.', '1856-01-01 00:00:00+00', '2022-04-07 00:00:00+00', 'Photo : L. Froissard, 1856, AML, 3 PH 599 ', '1af01f58-4dda-4894-95c3-7fc6d24f384b.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (10, 'Urbanisme', 'Inspecteur des domaines, 31 mars 1880, HCL. D., plans minutes', 'Plan de la masse 166 en 1853', '1853-01-01 00:00:00+00', '1880-03-31 00:00:00+00', 'Photo : L. FroisInspecteur des domaines, 31 mars 1880, HCL. D., plans minutessard, 1856, AML, 3 PH 599 ', '84c04390-8064-4d56-b08b-d645836bbe1c.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (11, 'Tourism', 'HCL, 1760. Service des domaines des Hospices, juin 1938, échelle : 2/7 500, HCL. D.', 'Plan du domaine des Hospices Civils de Lyon de 1760', '1760-01-01 00:00:00+00', '2018-09-05 00:00:00+00', 'HCL, 1760. Service des domaines des Hospices, juin 1938, échelle : 2/7 500, HCL. D.', '6e2c50a6-1ad1-4358-8329-0b0ca265d884.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (12, 'Détail d’un plan général de Lyon', '[AML série 5 S]', 'Tourism	Détail d’un plan général de Lyon, 1981', '1981-01-01 00:00:00+00', '2022-04-07 00:00:00+00', '[AML série 5 S]', 'ab6e9393-52be-48c7-b9c6-57d19ddb7cd2.jpg');
INSERT INTO public.document (id, title, source, description, "refDate", "publicationDate", "rightsHolder", file) VALUES (13, 'Tourism	AML, 1880', 'Tourism	AML, 1880, fonds HCL, 2 NP 55 : registre « Location des terrains urbains, 1871-1880 »', 'Intérieur de l''îlot 143 vu depuis l''angle des rues Vendôme et Barrême.', '1880-01-01 00:00:00+00', '2018-09-25 00:00:00+00', '	Tourism	AML, 1880, fonds HCL, 2 NP 55 : registre « Location des terrains urbains, 1871-1880 »', '37bf028b-7925-407b-9f79-d7cc8a850a5f.jpg');


--
-- TOC entry 2962 (class 0 OID 16405)
-- Dependencies: 199
-- Data for Name: document_guided_tour; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2965 (class 0 OID 16415)
-- Dependencies: 202
-- Data for Name: document_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.document_user (id, doc_id, user_id) VALUES (2, 2, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (3, 3, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (4, 4, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (5, 5, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (6, 6, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (7, 7, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (8, 8, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (9, 9, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (10, 10, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (11, 11, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (12, 12, 1);
INSERT INTO public.document_user (id, doc_id, user_id) VALUES (13, 13, 1);


--
-- TOC entry 2967 (class 0 OID 16420)
-- Dependencies: 204
-- Data for Name: guided_tour; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2969 (class 0 OID 16428)
-- Dependencies: 206
-- Data for Name: link_city_object; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2971 (class 0 OID 16436)
-- Dependencies: 208
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" (id, username, password, "firstName", "lastName", email, role_id) VALUES (1, 'admin', '$pbkdf2-sha256$29000$651zjlGKce7d25vz/p9zrg$GI.MiUfexKV40tS7gL0CMl1DDk/5i3nIFYf0ldRXlek', 'admin', 'UDViz', 'admin@udv.fr', 1);


--
-- TOC entry 2973 (class 0 OID 16444)
-- Dependencies: 210
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_role (id, label) VALUES (1, 'admin');
INSERT INTO public.user_role (id, label) VALUES (2, 'moderator');
INSERT INTO public.user_role (id, label) VALUES (3, 'softModerator');
INSERT INTO public.user_role (id, label) VALUES (4, 'contributor');


--
-- TOC entry 2975 (class 0 OID 16452)
-- Dependencies: 212
-- Data for Name: validation_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.validation_status (doc_id, status) VALUES (2, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (3, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (4, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (5, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (6, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (7, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (8, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (9, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (10, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (11, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (12, 'Validated');
INSERT INTO public.validation_status (doc_id, status) VALUES (13, 'Validated');


--
-- TOC entry 2976 (class 0 OID 16455)
-- Dependencies: 213
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.versions (id, doc_id, user_id, title, source, description, "refDate", "publicationDate", "rightsHolder", file, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ", version) VALUES (1, 1, 1, 'Vue depuis la rue Garibaldi vers l’est, entre la rue de Sèze (à gauche) et la rue Vauban (à droite).', 'Tourism	Photo : A. Bellat, 1957, HCL. D.', 'Tourism	Photo : A. Bellat, 1957, HCL. D.', '1957-01-01 00:00:00+00', '1957-01-01 00:00:00+00', 'Tourism	Photo : A. Bellat, 1957, HCL. D.', '76819e99-7145-4f30-9fa4-22f54ee791ff.jpg', 0.433759411479152979, -0.352210640924248974, -0.523312969327790034, 0.643384778733783969, 1843388, 5175671, 496, 1);


--
-- TOC entry 2978 (class 0 OID 16463)
-- Dependencies: 215
-- Data for Name: visualisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (2, 0.231175413101505162, 0.11308580814056314, 0.423321211004054898, 0.868659128017777005, 1844227, 5175626, 588);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (3, 0.433759411479152923, -0.352210640924248752, -0.523312969327790034, 0.643384778733783969, 1843388, 5175671, 496);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (4, 0, 0, 0.0633723619344985223, 0.997989951724386204, 1844031, 5175773, 626);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (5, 0.0090000568355383722, -0.00780004925746659045, -0.654804135101169749, 0.755704772290705429, 1843387, 5175816, 6988);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (6, 0.325937144090734321, -0.020008418912875036, -0.0580244148473376062, 0.943396951742057954, 1844021, 5175534, 483);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (7, 0, 0, 0.0779619851996129487, 0.9969563324758689, 1844026, 5175777, 569);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (8, 0.288047180231083777, -0.363059466749595217, -0.693913658487242846, 0.551090264955997222, 1843693, 5175853, 383);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (9, -0.426139370364890968, 0.51016685184529198, 0.573187462955592753, -0.479156709870382058, 1843489, 5175421, 228);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (10, 0, 0, 0.0768897002605282709, 0.997039605027727149, 1844023, 5175781, 887);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (11, 0.00500624656038638118, -0.00400499724830910564, -0.680829507226306418, 0.732413871784527659, 1843582, 5176414, 12651);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (12, 0, 0, 0.0767172375682581287, 0.997052890001275394, 1844018, 5175765, 771);
INSERT INTO public.visualisation (id, "quaternionX", "quaternionY", "quaternionZ", "quaternionW", "positionX", "positionY", "positionZ") VALUES (13, 0.118104720277814226, 0.487432193010979065, 0.840745466384440254, 0.203980864344224938, 1844149, 5176070, 359);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 197
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 200
-- Name: document_guided_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.document_guided_tour_id_seq', 1, false);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 201
-- Name: document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.document_id_seq', 13, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 203
-- Name: document_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.document_user_id_seq', 13, true);


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 205
-- Name: guided_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guided_tour_id_seq', 1, false);


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 207
-- Name: link_city_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.link_city_object_id_seq', 1, false);


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 211
-- Name: user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_role_id_seq', 4, true);


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 214
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.versions_id_seq', 1, true);


--
-- TOC entry 2802 (class 2606 OID 16476)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 16478)
-- Name: document_guided_tour document_guided_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_guided_tour
    ADD CONSTRAINT document_guided_tour_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 16480)
-- Name: document document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 16482)
-- Name: document_user document_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_user
    ADD CONSTRAINT document_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 16484)
-- Name: guided_tour guided_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guided_tour
    ADD CONSTRAINT guided_tour_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 16486)
-- Name: link_city_object link_city_object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_city_object
    ADD CONSTRAINT link_city_object_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 16488)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 2816 (class 2606 OID 16490)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 16492)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 16494)
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- TOC entry 2822 (class 2606 OID 16496)
-- Name: validation_status validation_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validation_status
    ADD CONSTRAINT validation_status_pkey PRIMARY KEY (doc_id);


--
-- TOC entry 2824 (class 2606 OID 16498)
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 16500)
-- Name: visualisation visualisation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visualisation
    ADD CONSTRAINT visualisation_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 16501)
-- Name: comments comments_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.document(id);


--
-- TOC entry 2828 (class 2606 OID 16506)
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 2829 (class 2606 OID 16511)
-- Name: document_guided_tour document_guided_tour_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_guided_tour
    ADD CONSTRAINT document_guided_tour_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.document(id) ON DELETE CASCADE;


--
-- TOC entry 2830 (class 2606 OID 16516)
-- Name: document_guided_tour document_guided_tour_tour_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_guided_tour
    ADD CONSTRAINT document_guided_tour_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.guided_tour(id);


--
-- TOC entry 2831 (class 2606 OID 16521)
-- Name: document_user document_user_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_user
    ADD CONSTRAINT document_user_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.document(id);


--
-- TOC entry 2832 (class 2606 OID 16526)
-- Name: document_user document_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_user
    ADD CONSTRAINT document_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 2833 (class 2606 OID 16531)
-- Name: link_city_object link_city_object_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_city_object
    ADD CONSTRAINT link_city_object_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.document(id);


--
-- TOC entry 2834 (class 2606 OID 16536)
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.user_role(id);


--
-- TOC entry 2835 (class 2606 OID 16541)
-- Name: validation_status validation_status_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validation_status
    ADD CONSTRAINT validation_status_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.document(id);


--
-- TOC entry 2836 (class 2606 OID 16546)
-- Name: versions versions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 2837 (class 2606 OID 16551)
-- Name: visualisation visualisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visualisation
    ADD CONSTRAINT visualisation_id_fkey FOREIGN KEY (id) REFERENCES public.document(id);


-- Completed on 2022-04-07 11:50:05

--
-- PostgreSQL database dump complete
--

