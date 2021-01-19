--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: accounts_buyerprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_buyerprofile (
    user_id uuid NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.accounts_buyerprofile OWNER TO postgres;

--
-- Name: accounts_sellerprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_sellerprofile (
    user_id uuid NOT NULL,
    location character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    food_category character varying(255) NOT NULL
);


ALTER TABLE public.accounts_sellerprofile OWNER TO postgres;

--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    id uuid NOT NULL,
    email character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    phone_no character varying(17) NOT NULL,
    user_type character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_groups (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_user_permissions (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


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
    user_id uuid NOT NULL,
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
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: miam_adbookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_adbookmark (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    bookmarked_by_id uuid NOT NULL
);


ALTER TABLE public.miam_adbookmark OWNER TO postgres;

--
-- Name: miam_adreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_adreview (
    id uuid NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    reviewed_by_id uuid NOT NULL
);


ALTER TABLE public.miam_adreview OWNER TO postgres;

--
-- Name: miam_advertisement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_advertisement (
    id uuid NOT NULL,
    title character varying(1024) NOT NULL,
    price integer NOT NULL,
    location character varying(255) NOT NULL,
    category character varying(256) NOT NULL,
    description text NOT NULL,
    photo character varying(100) NOT NULL,
    available_from timestamp with time zone NOT NULL,
    available_till timestamp with time zone NOT NULL,
    seller_id uuid NOT NULL
);


ALTER TABLE public.miam_advertisement OWNER TO postgres;

--
-- Name: miam_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_order (
    id uuid NOT NULL,
    quantity integer NOT NULL,
    total_price integer NOT NULL,
    is_delivered boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    buyer_id uuid NOT NULL
);


ALTER TABLE public.miam_order OWNER TO postgres;

--
-- Name: miam_promocode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_promocode (
    id uuid NOT NULL,
    name character varying(50) NOT NULL,
    percentage integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    seller_id uuid NOT NULL
);


ALTER TABLE public.miam_promocode OWNER TO postgres;

--
-- Name: miam_userreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_userreview (
    id uuid NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    review_of_id uuid NOT NULL,
    reviewed_by_id uuid NOT NULL
);


ALTER TABLE public.miam_userreview OWNER TO postgres;

--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


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
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	seller_1@gmail.com	f	t	329f3cac-f028-4304-bc6e-9c6abe75b378
2	buyer_1@gmail.com	f	t	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: accounts_buyerprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_buyerprofile (user_id, address) FROM stdin;
bd49f4b6-201c-433d-abf8-4ff64c849979	36/17, Warelesspara, Goalchamot
\.


--
-- Data for Name: accounts_sellerprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_sellerprofile (user_id, location, company_name, food_category) FROM stdin;
329f3cac-f028-4304-bc6e-9c6abe75b378	Khulna	Khana Khazana	Bengali
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (password, last_login, id, email, full_name, phone_no, user_type, created_at, is_staff, is_superuser, is_active) FROM stdin;
pbkdf2_sha256$216000$PxGQ76M2Yaec$jLAyaImcLEtg/htU9Kn0Lj0RoM1ypNMN/ejpZ0VWE08=	2021-01-19 12:45:41.50025+06	03614928-8dbd-4a52-8091-415b471260c6	amit@admin.com	Amit Biswas			2021-01-19 12:44:41.799709+06	t	t	t
pbkdf2_sha256$216000$trcuvedtK3A3$8+iE2/DdUMWyEv+FkVVuT4WffhpuTnC38e26iX9rXgs=	2021-01-19 12:52:23.303236+06	329f3cac-f028-4304-bc6e-9c6abe75b378	seller_1@gmail.com	Seller One	01790063096	seller	2021-01-19 12:47:42.340488+06	f	f	t
pbkdf2_sha256$216000$YB5FnfSZDcve$xlT6J4au6ew9S5WLeQtBaBG1cwOxBqLhQMymEM4M5Yg=	2021-01-19 12:52:42.757802+06	bd49f4b6-201c-433d-abf8-4ff64c849979	buyer_1@gmail.com	Buyer One	01790063096	buyer	2021-01-19 12:50:06.626135+06	f	f	t
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add User	9	add_user
34	Can change User	9	change_user
35	Can delete User	9	delete_user
36	Can view User	9	view_user
37	Can add Buyer Profile	10	add_buyerprofile
38	Can change Buyer Profile	10	change_buyerprofile
39	Can delete Buyer Profile	10	delete_buyerprofile
40	Can view Buyer Profile	10	view_buyerprofile
41	Can add Seller Profile	11	add_sellerprofile
42	Can change Seller Profile	11	change_sellerprofile
43	Can delete Seller Profile	11	delete_sellerprofile
44	Can view Seller Profile	11	view_sellerprofile
45	Can add Advertisement	12	add_advertisement
46	Can change Advertisement	12	change_advertisement
47	Can delete Advertisement	12	delete_advertisement
48	Can view Advertisement	12	view_advertisement
49	Can add User Review	13	add_userreview
50	Can change User Review	13	change_userreview
51	Can delete User Review	13	delete_userreview
52	Can view User Review	13	view_userreview
53	Can add Promo Code	14	add_promocode
54	Can change Promo Code	14	change_promocode
55	Can delete Promo Code	14	delete_promocode
56	Can view Promo Code	14	view_promocode
57	Can add Order	15	add_order
58	Can change Order	15	change_order
59	Can delete Order	15	delete_order
60	Can view Order	15	view_order
61	Can add Advertisement Review	16	add_adreview
62	Can change Advertisement Review	16	change_adreview
63	Can delete Advertisement Review	16	delete_adreview
64	Can view Advertisement Review	16	view_adreview
65	Can add Advertisement Bookmark	17	add_adbookmark
66	Can change Advertisement Bookmark	17	change_adbookmark
67	Can delete Advertisement Bookmark	17	delete_adbookmark
68	Can view Advertisement Bookmark	17	view_adbookmark
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	account	emailaddress
8	account	emailconfirmation
9	accounts	user
10	accounts	buyerprofile
11	accounts	sellerprofile
12	miam	advertisement
13	miam	userreview
14	miam	promocode
15	miam	order
16	miam	adreview
17	miam	adbookmark
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-19 12:43:40.323364+06
2	contenttypes	0002_remove_content_type_name	2021-01-19 12:43:40.366508+06
3	auth	0001_initial	2021-01-19 12:43:40.620434+06
4	auth	0002_alter_permission_name_max_length	2021-01-19 12:43:40.998075+06
5	auth	0003_alter_user_email_max_length	2021-01-19 12:43:41.017369+06
6	auth	0004_alter_user_username_opts	2021-01-19 12:43:41.036245+06
7	auth	0005_alter_user_last_login_null	2021-01-19 12:43:41.053193+06
8	auth	0006_require_contenttypes_0002	2021-01-19 12:43:41.063238+06
9	auth	0007_alter_validators_add_error_messages	2021-01-19 12:43:41.128511+06
10	auth	0008_alter_user_username_max_length	2021-01-19 12:43:41.154372+06
11	auth	0009_alter_user_last_name_max_length	2021-01-19 12:43:41.171088+06
12	auth	0010_alter_group_name_max_length	2021-01-19 12:43:41.190663+06
13	auth	0011_update_proxy_permissions	2021-01-19 12:43:41.227997+06
14	auth	0012_alter_user_first_name_max_length	2021-01-19 12:43:41.248163+06
15	accounts	0001_initial	2021-01-19 12:43:41.73152+06
16	account	0001_initial	2021-01-19 12:43:42.361453+06
17	account	0002_email_max_length	2021-01-19 12:43:42.599723+06
18	admin	0001_initial	2021-01-19 12:43:42.716294+06
19	admin	0002_logentry_remove_auto_add	2021-01-19 12:43:42.987793+06
20	admin	0003_logentry_add_action_flag_choices	2021-01-19 12:43:43.018716+06
21	miam	0001_initial	2021-01-19 12:43:43.557264+06
22	sessions	0001_initial	2021-01-19 12:43:44.488903+06
23	sites	0001_initial	2021-01-19 12:43:44.668481+06
24	sites	0002_alter_domain_unique	2021-01-19 12:43:44.787948+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
b210pihs9zlgw8ea4l6sq7jg5i2gqw90	.eJxVjLkOwjAQRP_FNbbW6_VFSc83RPauRTiUSDkqxL-TSClgutG8N2_VlXXpu3VuU3cXdVbggqWMSSepoql41Amy1WR9pWgxAAd1-tVq4WcbdlceZbiNhsdhme7V7Ig51tlcR2mvy8H-HfRl7jc7YEIfq0MvGdoWYt6aa95xRazYJAQWCoSJGVqNAFCyOIrRp-zV5wsvLz-5:1l1klp:iZ0j5mgtthGn_w8taGQg7blCPqpGMKxgR3XLiQFzW-4	2021-02-02 12:45:41.521922+06
y0mipu1qb72tu9r40b8g27t5bt1z82u2	.eJxVjEtugzAQQO_idUD-DGaGZfc5A_J4xoW2ggonUqIod0-RWDTr93mYMV0v03ituo2zmMGwABXg2HjrcgMhSJO4YAOlRMgIRD2Z0_-MU_7WZW_lKy2fa5vX5bLN3O5Ke9DanlfRn4_DfRtMqU5_NXiMAZCtQ_EQXFYQj5STRk8aSFVdz6wddw5ssV0vUQiRWDSjd_u0aq3zuox6-523uxmctxStfb4AAydJeg:1l1ksc:dJbLUyCwpr0w7EXB_uwRmH_Pue9x94hI0Nch97EAriQ	2021-02-02 12:52:42.771161+06
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: miam_adbookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_adbookmark (id, created_at, advertisement_id, bookmarked_by_id) FROM stdin;
9074d813-7a6a-4652-a5de-7835f50931fe	2021-01-19 12:50:14.707054+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_adreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_adreview (id, description, created_at, advertisement_id, reviewed_by_id) FROM stdin;
e52dd2ec-44f5-41b8-840b-d984bb9dd17e	Good Singara!	2021-01-19 12:50:28.204313+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
2235c874-b6cd-4386-a2c6-da86c543578b	One of the best in town!	2021-01-19 12:51:03.687756+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_advertisement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_advertisement (id, title, price, location, category, description, photo, available_from, available_till, seller_id) FROM stdin;
f3537f16-ca1a-4776-be5b-596a7a2f65c4	Bhaat Mangsho	200	Khulna	bengali_food	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla velit est, egestas id mi sit amet, tincidunt feugiat felis. Fusce laoreet nisl eu tellus ullamcorper, sit amet blandit nibh commodo. Integer vulputate eros purus, ac ultrices tortor euismod ac. Sed ac posuere justo. Aliquam sit amet tincidunt magna.	ads/bhaat_mangsho.JPG	2021-01-19 12:48:34.734195+06	2020-05-20 00:00:00+06	329f3cac-f028-4304-bc6e-9c6abe75b378
60611ffe-772f-4bd1-92af-613d0de61cc4	Singara	10	Khulna	street_food	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla velit est, egestas id mi sit amet, tincidunt feugiat felis. Fusce laoreet nisl eu tellus ullamcorper, sit amet blandit nibh commodo. Integer vulputate eros purus, ac ultrices tortor euismod ac. Sed ac posuere justo. Aliquam sit amet tincidunt magna.	ads/singara.jpg	2021-01-19 12:49:23.82177+06	2020-01-25 00:00:00+06	329f3cac-f028-4304-bc6e-9c6abe75b378
\.


--
-- Data for Name: miam_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_order (id, quantity, total_price, is_delivered, created_at, advertisement_id, buyer_id) FROM stdin;
3dc73f2f-2c3a-4e9c-ac4b-98c639182ab4	5	900	f	2021-01-19 12:50:48.531165+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	bd49f4b6-201c-433d-abf8-4ff64c849979
0b466594-1bbd-43ab-9f9a-a5d5b1345390	10	100	t	2021-01-19 12:52:11.763142+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_promocode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_promocode (id, name, percentage, created_at, advertisement_id, seller_id) FROM stdin;
01f025a2-5f6b-40f2-b949-8e84a74e4ceb	MANGSHO	10	2021-01-19 12:48:48.069426+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	329f3cac-f028-4304-bc6e-9c6abe75b378
\.


--
-- Data for Name: miam_userreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_userreview (id, description, created_at, review_of_id, reviewed_by_id) FROM stdin;
e8380455-e6f4-462e-86b3-5c8f3070e142	Very good food. Timely delivery. I would give 10/10 :)	2021-01-19 12:51:48.365087+06	329f3cac-f028-4304-bc6e-9c6abe75b378	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 2, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: accounts_buyerprofile accounts_buyerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_buyerprofile
    ADD CONSTRAINT accounts_buyerprofile_pkey PRIMARY KEY (user_id);


--
-- Name: accounts_sellerprofile accounts_sellerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_sellerprofile
    ADD CONSTRAINT accounts_sellerprofile_pkey PRIMARY KEY (user_id);


--
-- Name: accounts_user accounts_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


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
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: miam_adbookmark miam_adbookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_pkey PRIMARY KEY (id);


--
-- Name: miam_adreview miam_adreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_pkey PRIMARY KEY (id);


--
-- Name: miam_advertisement miam_advertisement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_advertisement
    ADD CONSTRAINT miam_advertisement_pkey PRIMARY KEY (id);


--
-- Name: miam_order miam_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_pkey PRIMARY KEY (id);


--
-- Name: miam_promocode miam_promocode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_pkey PRIMARY KEY (id);


--
-- Name: miam_userreview miam_userreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: accounts_user_email_b2644a56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


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
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: miam_adbookmark_advertisement_id_1a499907; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adbookmark_advertisement_id_1a499907 ON public.miam_adbookmark USING btree (advertisement_id);


--
-- Name: miam_adbookmark_bookmarked_by_id_486213a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adbookmark_bookmarked_by_id_486213a3 ON public.miam_adbookmark USING btree (bookmarked_by_id);


--
-- Name: miam_adreview_advertisement_id_e41ed615; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adreview_advertisement_id_e41ed615 ON public.miam_adreview USING btree (advertisement_id);


--
-- Name: miam_adreview_reviewed_by_id_335afc4d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adreview_reviewed_by_id_335afc4d ON public.miam_adreview USING btree (reviewed_by_id);


--
-- Name: miam_advertisement_seller_id_6be20bc2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_advertisement_seller_id_6be20bc2 ON public.miam_advertisement USING btree (seller_id);


--
-- Name: miam_order_advertisement_id_98f6be61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_order_advertisement_id_98f6be61 ON public.miam_order USING btree (advertisement_id);


--
-- Name: miam_order_buyer_id_76c355fa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_order_buyer_id_76c355fa ON public.miam_order USING btree (buyer_id);


--
-- Name: miam_promocode_advertisement_id_92b0236d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_promocode_advertisement_id_92b0236d ON public.miam_promocode USING btree (advertisement_id);


--
-- Name: miam_promocode_seller_id_caf075c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_promocode_seller_id_caf075c7 ON public.miam_promocode USING btree (seller_id);


--
-- Name: miam_userreview_review_of_id_270e633e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_userreview_review_of_id_270e633e ON public.miam_userreview USING btree (review_of_id);


--
-- Name: miam_userreview_reviewed_by_id_ffd92196; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_userreview_reviewed_by_id_ffd92196 ON public.miam_userreview USING btree (reviewed_by_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_buyerprofile accounts_buyerprofile_user_id_f767f5f1_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_buyerprofile
    ADD CONSTRAINT accounts_buyerprofile_user_id_f767f5f1_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_sellerprofile accounts_sellerprofile_user_id_8976d036_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_sellerprofile
    ADD CONSTRAINT accounts_sellerprofile_user_id_8976d036_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adbookmark miam_adbookmark_advertisement_id_1a499907_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_advertisement_id_1a499907_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adbookmark miam_adbookmark_bookmarked_by_id_486213a3_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_bookmarked_by_id_486213a3_fk_accounts_ FOREIGN KEY (bookmarked_by_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adreview miam_adreview_advertisement_id_e41ed615_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_advertisement_id_e41ed615_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adreview miam_adreview_reviewed_by_id_335afc4d_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_reviewed_by_id_335afc4d_fk_accounts_ FOREIGN KEY (reviewed_by_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_advertisement miam_advertisement_seller_id_6be20bc2_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_advertisement
    ADD CONSTRAINT miam_advertisement_seller_id_6be20bc2_fk_accounts_ FOREIGN KEY (seller_id) REFERENCES public.accounts_sellerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_order miam_order_advertisement_id_98f6be61_fk_miam_advertisement_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_advertisement_id_98f6be61_fk_miam_advertisement_id FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_order miam_order_buyer_id_76c355fa_fk_accounts_buyerprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_buyer_id_76c355fa_fk_accounts_buyerprofile_user_id FOREIGN KEY (buyer_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_promocode miam_promocode_advertisement_id_92b0236d_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_advertisement_id_92b0236d_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_promocode miam_promocode_seller_id_caf075c7_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_seller_id_caf075c7_fk_accounts_ FOREIGN KEY (seller_id) REFERENCES public.accounts_sellerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_userreview miam_userreview_review_of_id_270e633e_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_review_of_id_270e633e_fk_accounts_user_id FOREIGN KEY (review_of_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_userreview miam_userreview_reviewed_by_id_ffd92196_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_reviewed_by_id_ffd92196_fk_accounts_user_id FOREIGN KEY (reviewed_by_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: accounts_buyerprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_buyerprofile (
    user_id uuid NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.accounts_buyerprofile OWNER TO postgres;

--
-- Name: accounts_sellerprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_sellerprofile (
    user_id uuid NOT NULL,
    location character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    food_category character varying(255) NOT NULL
);


ALTER TABLE public.accounts_sellerprofile OWNER TO postgres;

--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    id uuid NOT NULL,
    email character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    phone_no character varying(17) NOT NULL,
    user_type character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_groups (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_user_permissions (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


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
    user_id uuid NOT NULL,
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
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: miam_adbookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_adbookmark (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    bookmarked_by_id uuid NOT NULL
);


ALTER TABLE public.miam_adbookmark OWNER TO postgres;

--
-- Name: miam_adreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_adreview (
    id uuid NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    reviewed_by_id uuid NOT NULL
);


ALTER TABLE public.miam_adreview OWNER TO postgres;

--
-- Name: miam_advertisement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_advertisement (
    id uuid NOT NULL,
    title character varying(1024) NOT NULL,
    price integer NOT NULL,
    location character varying(255) NOT NULL,
    category character varying(256) NOT NULL,
    description text NOT NULL,
    photo character varying(100) NOT NULL,
    available_from timestamp with time zone NOT NULL,
    available_till timestamp with time zone NOT NULL,
    seller_id uuid NOT NULL
);


ALTER TABLE public.miam_advertisement OWNER TO postgres;

--
-- Name: miam_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_order (
    id uuid NOT NULL,
    quantity integer NOT NULL,
    total_price integer NOT NULL,
    is_delivered boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    buyer_id uuid NOT NULL
);


ALTER TABLE public.miam_order OWNER TO postgres;

--
-- Name: miam_promocode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_promocode (
    id uuid NOT NULL,
    name character varying(50) NOT NULL,
    percentage integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    seller_id uuid NOT NULL
);


ALTER TABLE public.miam_promocode OWNER TO postgres;

--
-- Name: miam_userreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_userreview (
    id uuid NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    review_of_id uuid NOT NULL,
    reviewed_by_id uuid NOT NULL
);


ALTER TABLE public.miam_userreview OWNER TO postgres;

--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


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
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	seller_1@gmail.com	f	t	329f3cac-f028-4304-bc6e-9c6abe75b378
2	buyer_1@gmail.com	f	t	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: accounts_buyerprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_buyerprofile (user_id, address) FROM stdin;
bd49f4b6-201c-433d-abf8-4ff64c849979	36/17, Warelesspara, Goalchamot
\.


--
-- Data for Name: accounts_sellerprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_sellerprofile (user_id, location, company_name, food_category) FROM stdin;
329f3cac-f028-4304-bc6e-9c6abe75b378	Khulna	Khana Khazana	Bengali
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (password, last_login, id, email, full_name, phone_no, user_type, created_at, is_staff, is_superuser, is_active) FROM stdin;
pbkdf2_sha256$216000$PxGQ76M2Yaec$jLAyaImcLEtg/htU9Kn0Lj0RoM1ypNMN/ejpZ0VWE08=	2021-01-19 12:45:41.50025+06	03614928-8dbd-4a52-8091-415b471260c6	amit@admin.com	Amit Biswas			2021-01-19 12:44:41.799709+06	t	t	t
pbkdf2_sha256$216000$trcuvedtK3A3$8+iE2/DdUMWyEv+FkVVuT4WffhpuTnC38e26iX9rXgs=	2021-01-19 12:52:23.303236+06	329f3cac-f028-4304-bc6e-9c6abe75b378	seller_1@gmail.com	Seller One	01790063096	seller	2021-01-19 12:47:42.340488+06	f	f	t
pbkdf2_sha256$216000$YB5FnfSZDcve$xlT6J4au6ew9S5WLeQtBaBG1cwOxBqLhQMymEM4M5Yg=	2021-01-19 12:52:42.757802+06	bd49f4b6-201c-433d-abf8-4ff64c849979	buyer_1@gmail.com	Buyer One	01790063096	buyer	2021-01-19 12:50:06.626135+06	f	f	t
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add User	9	add_user
34	Can change User	9	change_user
35	Can delete User	9	delete_user
36	Can view User	9	view_user
37	Can add Buyer Profile	10	add_buyerprofile
38	Can change Buyer Profile	10	change_buyerprofile
39	Can delete Buyer Profile	10	delete_buyerprofile
40	Can view Buyer Profile	10	view_buyerprofile
41	Can add Seller Profile	11	add_sellerprofile
42	Can change Seller Profile	11	change_sellerprofile
43	Can delete Seller Profile	11	delete_sellerprofile
44	Can view Seller Profile	11	view_sellerprofile
45	Can add Advertisement	12	add_advertisement
46	Can change Advertisement	12	change_advertisement
47	Can delete Advertisement	12	delete_advertisement
48	Can view Advertisement	12	view_advertisement
49	Can add User Review	13	add_userreview
50	Can change User Review	13	change_userreview
51	Can delete User Review	13	delete_userreview
52	Can view User Review	13	view_userreview
53	Can add Promo Code	14	add_promocode
54	Can change Promo Code	14	change_promocode
55	Can delete Promo Code	14	delete_promocode
56	Can view Promo Code	14	view_promocode
57	Can add Order	15	add_order
58	Can change Order	15	change_order
59	Can delete Order	15	delete_order
60	Can view Order	15	view_order
61	Can add Advertisement Review	16	add_adreview
62	Can change Advertisement Review	16	change_adreview
63	Can delete Advertisement Review	16	delete_adreview
64	Can view Advertisement Review	16	view_adreview
65	Can add Advertisement Bookmark	17	add_adbookmark
66	Can change Advertisement Bookmark	17	change_adbookmark
67	Can delete Advertisement Bookmark	17	delete_adbookmark
68	Can view Advertisement Bookmark	17	view_adbookmark
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	account	emailaddress
8	account	emailconfirmation
9	accounts	user
10	accounts	buyerprofile
11	accounts	sellerprofile
12	miam	advertisement
13	miam	userreview
14	miam	promocode
15	miam	order
16	miam	adreview
17	miam	adbookmark
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-19 12:43:40.323364+06
2	contenttypes	0002_remove_content_type_name	2021-01-19 12:43:40.366508+06
3	auth	0001_initial	2021-01-19 12:43:40.620434+06
4	auth	0002_alter_permission_name_max_length	2021-01-19 12:43:40.998075+06
5	auth	0003_alter_user_email_max_length	2021-01-19 12:43:41.017369+06
6	auth	0004_alter_user_username_opts	2021-01-19 12:43:41.036245+06
7	auth	0005_alter_user_last_login_null	2021-01-19 12:43:41.053193+06
8	auth	0006_require_contenttypes_0002	2021-01-19 12:43:41.063238+06
9	auth	0007_alter_validators_add_error_messages	2021-01-19 12:43:41.128511+06
10	auth	0008_alter_user_username_max_length	2021-01-19 12:43:41.154372+06
11	auth	0009_alter_user_last_name_max_length	2021-01-19 12:43:41.171088+06
12	auth	0010_alter_group_name_max_length	2021-01-19 12:43:41.190663+06
13	auth	0011_update_proxy_permissions	2021-01-19 12:43:41.227997+06
14	auth	0012_alter_user_first_name_max_length	2021-01-19 12:43:41.248163+06
15	accounts	0001_initial	2021-01-19 12:43:41.73152+06
16	account	0001_initial	2021-01-19 12:43:42.361453+06
17	account	0002_email_max_length	2021-01-19 12:43:42.599723+06
18	admin	0001_initial	2021-01-19 12:43:42.716294+06
19	admin	0002_logentry_remove_auto_add	2021-01-19 12:43:42.987793+06
20	admin	0003_logentry_add_action_flag_choices	2021-01-19 12:43:43.018716+06
21	miam	0001_initial	2021-01-19 12:43:43.557264+06
22	sessions	0001_initial	2021-01-19 12:43:44.488903+06
23	sites	0001_initial	2021-01-19 12:43:44.668481+06
24	sites	0002_alter_domain_unique	2021-01-19 12:43:44.787948+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
b210pihs9zlgw8ea4l6sq7jg5i2gqw90	.eJxVjLkOwjAQRP_FNbbW6_VFSc83RPauRTiUSDkqxL-TSClgutG8N2_VlXXpu3VuU3cXdVbggqWMSSepoql41Amy1WR9pWgxAAd1-tVq4WcbdlceZbiNhsdhme7V7Ig51tlcR2mvy8H-HfRl7jc7YEIfq0MvGdoWYt6aa95xRazYJAQWCoSJGVqNAFCyOIrRp-zV5wsvLz-5:1l1klp:iZ0j5mgtthGn_w8taGQg7blCPqpGMKxgR3XLiQFzW-4	2021-02-02 12:45:41.521922+06
y0mipu1qb72tu9r40b8g27t5bt1z82u2	.eJxVjEtugzAQQO_idUD-DGaGZfc5A_J4xoW2ggonUqIod0-RWDTr93mYMV0v03ituo2zmMGwABXg2HjrcgMhSJO4YAOlRMgIRD2Z0_-MU_7WZW_lKy2fa5vX5bLN3O5Ke9DanlfRn4_DfRtMqU5_NXiMAZCtQ_EQXFYQj5STRk8aSFVdz6wddw5ssV0vUQiRWDSjd_u0aq3zuox6-523uxmctxStfb4AAydJeg:1l1ksc:dJbLUyCwpr0w7EXB_uwRmH_Pue9x94hI0Nch97EAriQ	2021-02-02 12:52:42.771161+06
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: miam_adbookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_adbookmark (id, created_at, advertisement_id, bookmarked_by_id) FROM stdin;
9074d813-7a6a-4652-a5de-7835f50931fe	2021-01-19 12:50:14.707054+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_adreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_adreview (id, description, created_at, advertisement_id, reviewed_by_id) FROM stdin;
e52dd2ec-44f5-41b8-840b-d984bb9dd17e	Good Singara!	2021-01-19 12:50:28.204313+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
2235c874-b6cd-4386-a2c6-da86c543578b	One of the best in town!	2021-01-19 12:51:03.687756+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_advertisement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_advertisement (id, title, price, location, category, description, photo, available_from, available_till, seller_id) FROM stdin;
f3537f16-ca1a-4776-be5b-596a7a2f65c4	Bhaat Mangsho	200	Khulna	bengali_food	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla velit est, egestas id mi sit amet, tincidunt feugiat felis. Fusce laoreet nisl eu tellus ullamcorper, sit amet blandit nibh commodo. Integer vulputate eros purus, ac ultrices tortor euismod ac. Sed ac posuere justo. Aliquam sit amet tincidunt magna.	ads/bhaat_mangsho.JPG	2021-01-19 12:48:34.734195+06	2020-05-20 00:00:00+06	329f3cac-f028-4304-bc6e-9c6abe75b378
60611ffe-772f-4bd1-92af-613d0de61cc4	Singara	10	Khulna	street_food	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla velit est, egestas id mi sit amet, tincidunt feugiat felis. Fusce laoreet nisl eu tellus ullamcorper, sit amet blandit nibh commodo. Integer vulputate eros purus, ac ultrices tortor euismod ac. Sed ac posuere justo. Aliquam sit amet tincidunt magna.	ads/singara.jpg	2021-01-19 12:49:23.82177+06	2020-01-25 00:00:00+06	329f3cac-f028-4304-bc6e-9c6abe75b378
\.


--
-- Data for Name: miam_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_order (id, quantity, total_price, is_delivered, created_at, advertisement_id, buyer_id) FROM stdin;
3dc73f2f-2c3a-4e9c-ac4b-98c639182ab4	5	900	f	2021-01-19 12:50:48.531165+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	bd49f4b6-201c-433d-abf8-4ff64c849979
0b466594-1bbd-43ab-9f9a-a5d5b1345390	10	100	t	2021-01-19 12:52:11.763142+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_promocode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_promocode (id, name, percentage, created_at, advertisement_id, seller_id) FROM stdin;
01f025a2-5f6b-40f2-b949-8e84a74e4ceb	MANGSHO	10	2021-01-19 12:48:48.069426+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	329f3cac-f028-4304-bc6e-9c6abe75b378
\.


--
-- Data for Name: miam_userreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_userreview (id, description, created_at, review_of_id, reviewed_by_id) FROM stdin;
e8380455-e6f4-462e-86b3-5c8f3070e142	Very good food. Timely delivery. I would give 10/10 :)	2021-01-19 12:51:48.365087+06	329f3cac-f028-4304-bc6e-9c6abe75b378	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 2, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: accounts_buyerprofile accounts_buyerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_buyerprofile
    ADD CONSTRAINT accounts_buyerprofile_pkey PRIMARY KEY (user_id);


--
-- Name: accounts_sellerprofile accounts_sellerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_sellerprofile
    ADD CONSTRAINT accounts_sellerprofile_pkey PRIMARY KEY (user_id);


--
-- Name: accounts_user accounts_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


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
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: miam_adbookmark miam_adbookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_pkey PRIMARY KEY (id);


--
-- Name: miam_adreview miam_adreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_pkey PRIMARY KEY (id);


--
-- Name: miam_advertisement miam_advertisement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_advertisement
    ADD CONSTRAINT miam_advertisement_pkey PRIMARY KEY (id);


--
-- Name: miam_order miam_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_pkey PRIMARY KEY (id);


--
-- Name: miam_promocode miam_promocode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_pkey PRIMARY KEY (id);


--
-- Name: miam_userreview miam_userreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: accounts_user_email_b2644a56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


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
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: miam_adbookmark_advertisement_id_1a499907; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adbookmark_advertisement_id_1a499907 ON public.miam_adbookmark USING btree (advertisement_id);


--
-- Name: miam_adbookmark_bookmarked_by_id_486213a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adbookmark_bookmarked_by_id_486213a3 ON public.miam_adbookmark USING btree (bookmarked_by_id);


--
-- Name: miam_adreview_advertisement_id_e41ed615; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adreview_advertisement_id_e41ed615 ON public.miam_adreview USING btree (advertisement_id);


--
-- Name: miam_adreview_reviewed_by_id_335afc4d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adreview_reviewed_by_id_335afc4d ON public.miam_adreview USING btree (reviewed_by_id);


--
-- Name: miam_advertisement_seller_id_6be20bc2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_advertisement_seller_id_6be20bc2 ON public.miam_advertisement USING btree (seller_id);


--
-- Name: miam_order_advertisement_id_98f6be61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_order_advertisement_id_98f6be61 ON public.miam_order USING btree (advertisement_id);


--
-- Name: miam_order_buyer_id_76c355fa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_order_buyer_id_76c355fa ON public.miam_order USING btree (buyer_id);


--
-- Name: miam_promocode_advertisement_id_92b0236d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_promocode_advertisement_id_92b0236d ON public.miam_promocode USING btree (advertisement_id);


--
-- Name: miam_promocode_seller_id_caf075c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_promocode_seller_id_caf075c7 ON public.miam_promocode USING btree (seller_id);


--
-- Name: miam_userreview_review_of_id_270e633e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_userreview_review_of_id_270e633e ON public.miam_userreview USING btree (review_of_id);


--
-- Name: miam_userreview_reviewed_by_id_ffd92196; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_userreview_reviewed_by_id_ffd92196 ON public.miam_userreview USING btree (reviewed_by_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_buyerprofile accounts_buyerprofile_user_id_f767f5f1_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_buyerprofile
    ADD CONSTRAINT accounts_buyerprofile_user_id_f767f5f1_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_sellerprofile accounts_sellerprofile_user_id_8976d036_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_sellerprofile
    ADD CONSTRAINT accounts_sellerprofile_user_id_8976d036_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adbookmark miam_adbookmark_advertisement_id_1a499907_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_advertisement_id_1a499907_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adbookmark miam_adbookmark_bookmarked_by_id_486213a3_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_bookmarked_by_id_486213a3_fk_accounts_ FOREIGN KEY (bookmarked_by_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adreview miam_adreview_advertisement_id_e41ed615_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_advertisement_id_e41ed615_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adreview miam_adreview_reviewed_by_id_335afc4d_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_reviewed_by_id_335afc4d_fk_accounts_ FOREIGN KEY (reviewed_by_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_advertisement miam_advertisement_seller_id_6be20bc2_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_advertisement
    ADD CONSTRAINT miam_advertisement_seller_id_6be20bc2_fk_accounts_ FOREIGN KEY (seller_id) REFERENCES public.accounts_sellerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_order miam_order_advertisement_id_98f6be61_fk_miam_advertisement_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_advertisement_id_98f6be61_fk_miam_advertisement_id FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_order miam_order_buyer_id_76c355fa_fk_accounts_buyerprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_buyer_id_76c355fa_fk_accounts_buyerprofile_user_id FOREIGN KEY (buyer_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_promocode miam_promocode_advertisement_id_92b0236d_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_advertisement_id_92b0236d_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_promocode miam_promocode_seller_id_caf075c7_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_seller_id_caf075c7_fk_accounts_ FOREIGN KEY (seller_id) REFERENCES public.accounts_sellerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_userreview miam_userreview_review_of_id_270e633e_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_review_of_id_270e633e_fk_accounts_user_id FOREIGN KEY (review_of_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_userreview miam_userreview_reviewed_by_id_ffd92196_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_reviewed_by_id_ffd92196_fk_accounts_user_id FOREIGN KEY (reviewed_by_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: accounts_buyerprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_buyerprofile (
    user_id uuid NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.accounts_buyerprofile OWNER TO postgres;

--
-- Name: accounts_sellerprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_sellerprofile (
    user_id uuid NOT NULL,
    location character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    food_category character varying(255) NOT NULL
);


ALTER TABLE public.accounts_sellerprofile OWNER TO postgres;

--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    id uuid NOT NULL,
    email character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    phone_no character varying(17) NOT NULL,
    user_type character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_groups (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_user_permissions (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


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
    user_id uuid NOT NULL,
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
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: miam_adbookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_adbookmark (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    bookmarked_by_id uuid NOT NULL
);


ALTER TABLE public.miam_adbookmark OWNER TO postgres;

--
-- Name: miam_adreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_adreview (
    id uuid NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    reviewed_by_id uuid NOT NULL
);


ALTER TABLE public.miam_adreview OWNER TO postgres;

--
-- Name: miam_advertisement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_advertisement (
    id uuid NOT NULL,
    title character varying(1024) NOT NULL,
    price integer NOT NULL,
    location character varying(255) NOT NULL,
    category character varying(256) NOT NULL,
    description text NOT NULL,
    photo character varying(100) NOT NULL,
    available_from timestamp with time zone NOT NULL,
    available_till timestamp with time zone NOT NULL,
    seller_id uuid NOT NULL
);


ALTER TABLE public.miam_advertisement OWNER TO postgres;

--
-- Name: miam_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_order (
    id uuid NOT NULL,
    quantity integer NOT NULL,
    total_price integer NOT NULL,
    is_delivered boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    buyer_id uuid NOT NULL
);


ALTER TABLE public.miam_order OWNER TO postgres;

--
-- Name: miam_promocode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_promocode (
    id uuid NOT NULL,
    name character varying(50) NOT NULL,
    percentage integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    advertisement_id uuid NOT NULL,
    seller_id uuid NOT NULL
);


ALTER TABLE public.miam_promocode OWNER TO postgres;

--
-- Name: miam_userreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miam_userreview (
    id uuid NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    review_of_id uuid NOT NULL,
    reviewed_by_id uuid NOT NULL
);


ALTER TABLE public.miam_userreview OWNER TO postgres;

--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


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
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	seller_1@gmail.com	f	t	329f3cac-f028-4304-bc6e-9c6abe75b378
2	buyer_1@gmail.com	f	t	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: accounts_buyerprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_buyerprofile (user_id, address) FROM stdin;
bd49f4b6-201c-433d-abf8-4ff64c849979	36/17, Warelesspara, Goalchamot
\.


--
-- Data for Name: accounts_sellerprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_sellerprofile (user_id, location, company_name, food_category) FROM stdin;
329f3cac-f028-4304-bc6e-9c6abe75b378	Khulna	Khana Khazana	Bengali
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (password, last_login, id, email, full_name, phone_no, user_type, created_at, is_staff, is_superuser, is_active) FROM stdin;
pbkdf2_sha256$216000$PxGQ76M2Yaec$jLAyaImcLEtg/htU9Kn0Lj0RoM1ypNMN/ejpZ0VWE08=	2021-01-19 12:45:41.50025+06	03614928-8dbd-4a52-8091-415b471260c6	amit@admin.com	Amit Biswas			2021-01-19 12:44:41.799709+06	t	t	t
pbkdf2_sha256$216000$trcuvedtK3A3$8+iE2/DdUMWyEv+FkVVuT4WffhpuTnC38e26iX9rXgs=	2021-01-19 12:52:23.303236+06	329f3cac-f028-4304-bc6e-9c6abe75b378	seller_1@gmail.com	Seller One	01790063096	seller	2021-01-19 12:47:42.340488+06	f	f	t
pbkdf2_sha256$216000$YB5FnfSZDcve$xlT6J4au6ew9S5WLeQtBaBG1cwOxBqLhQMymEM4M5Yg=	2021-01-19 12:52:42.757802+06	bd49f4b6-201c-433d-abf8-4ff64c849979	buyer_1@gmail.com	Buyer One	01790063096	buyer	2021-01-19 12:50:06.626135+06	f	f	t
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add User	9	add_user
34	Can change User	9	change_user
35	Can delete User	9	delete_user
36	Can view User	9	view_user
37	Can add Buyer Profile	10	add_buyerprofile
38	Can change Buyer Profile	10	change_buyerprofile
39	Can delete Buyer Profile	10	delete_buyerprofile
40	Can view Buyer Profile	10	view_buyerprofile
41	Can add Seller Profile	11	add_sellerprofile
42	Can change Seller Profile	11	change_sellerprofile
43	Can delete Seller Profile	11	delete_sellerprofile
44	Can view Seller Profile	11	view_sellerprofile
45	Can add Advertisement	12	add_advertisement
46	Can change Advertisement	12	change_advertisement
47	Can delete Advertisement	12	delete_advertisement
48	Can view Advertisement	12	view_advertisement
49	Can add User Review	13	add_userreview
50	Can change User Review	13	change_userreview
51	Can delete User Review	13	delete_userreview
52	Can view User Review	13	view_userreview
53	Can add Promo Code	14	add_promocode
54	Can change Promo Code	14	change_promocode
55	Can delete Promo Code	14	delete_promocode
56	Can view Promo Code	14	view_promocode
57	Can add Order	15	add_order
58	Can change Order	15	change_order
59	Can delete Order	15	delete_order
60	Can view Order	15	view_order
61	Can add Advertisement Review	16	add_adreview
62	Can change Advertisement Review	16	change_adreview
63	Can delete Advertisement Review	16	delete_adreview
64	Can view Advertisement Review	16	view_adreview
65	Can add Advertisement Bookmark	17	add_adbookmark
66	Can change Advertisement Bookmark	17	change_adbookmark
67	Can delete Advertisement Bookmark	17	delete_adbookmark
68	Can view Advertisement Bookmark	17	view_adbookmark
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	account	emailaddress
8	account	emailconfirmation
9	accounts	user
10	accounts	buyerprofile
11	accounts	sellerprofile
12	miam	advertisement
13	miam	userreview
14	miam	promocode
15	miam	order
16	miam	adreview
17	miam	adbookmark
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-19 12:43:40.323364+06
2	contenttypes	0002_remove_content_type_name	2021-01-19 12:43:40.366508+06
3	auth	0001_initial	2021-01-19 12:43:40.620434+06
4	auth	0002_alter_permission_name_max_length	2021-01-19 12:43:40.998075+06
5	auth	0003_alter_user_email_max_length	2021-01-19 12:43:41.017369+06
6	auth	0004_alter_user_username_opts	2021-01-19 12:43:41.036245+06
7	auth	0005_alter_user_last_login_null	2021-01-19 12:43:41.053193+06
8	auth	0006_require_contenttypes_0002	2021-01-19 12:43:41.063238+06
9	auth	0007_alter_validators_add_error_messages	2021-01-19 12:43:41.128511+06
10	auth	0008_alter_user_username_max_length	2021-01-19 12:43:41.154372+06
11	auth	0009_alter_user_last_name_max_length	2021-01-19 12:43:41.171088+06
12	auth	0010_alter_group_name_max_length	2021-01-19 12:43:41.190663+06
13	auth	0011_update_proxy_permissions	2021-01-19 12:43:41.227997+06
14	auth	0012_alter_user_first_name_max_length	2021-01-19 12:43:41.248163+06
15	accounts	0001_initial	2021-01-19 12:43:41.73152+06
16	account	0001_initial	2021-01-19 12:43:42.361453+06
17	account	0002_email_max_length	2021-01-19 12:43:42.599723+06
18	admin	0001_initial	2021-01-19 12:43:42.716294+06
19	admin	0002_logentry_remove_auto_add	2021-01-19 12:43:42.987793+06
20	admin	0003_logentry_add_action_flag_choices	2021-01-19 12:43:43.018716+06
21	miam	0001_initial	2021-01-19 12:43:43.557264+06
22	sessions	0001_initial	2021-01-19 12:43:44.488903+06
23	sites	0001_initial	2021-01-19 12:43:44.668481+06
24	sites	0002_alter_domain_unique	2021-01-19 12:43:44.787948+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
b210pihs9zlgw8ea4l6sq7jg5i2gqw90	.eJxVjLkOwjAQRP_FNbbW6_VFSc83RPauRTiUSDkqxL-TSClgutG8N2_VlXXpu3VuU3cXdVbggqWMSSepoql41Amy1WR9pWgxAAd1-tVq4WcbdlceZbiNhsdhme7V7Ig51tlcR2mvy8H-HfRl7jc7YEIfq0MvGdoWYt6aa95xRazYJAQWCoSJGVqNAFCyOIrRp-zV5wsvLz-5:1l1klp:iZ0j5mgtthGn_w8taGQg7blCPqpGMKxgR3XLiQFzW-4	2021-02-02 12:45:41.521922+06
y0mipu1qb72tu9r40b8g27t5bt1z82u2	.eJxVjEtugzAQQO_idUD-DGaGZfc5A_J4xoW2ggonUqIod0-RWDTr93mYMV0v03ituo2zmMGwABXg2HjrcgMhSJO4YAOlRMgIRD2Z0_-MU_7WZW_lKy2fa5vX5bLN3O5Ke9DanlfRn4_DfRtMqU5_NXiMAZCtQ_EQXFYQj5STRk8aSFVdz6wddw5ssV0vUQiRWDSjd_u0aq3zuox6-523uxmctxStfb4AAydJeg:1l1ksc:dJbLUyCwpr0w7EXB_uwRmH_Pue9x94hI0Nch97EAriQ	2021-02-02 12:52:42.771161+06
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: miam_adbookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_adbookmark (id, created_at, advertisement_id, bookmarked_by_id) FROM stdin;
9074d813-7a6a-4652-a5de-7835f50931fe	2021-01-19 12:50:14.707054+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_adreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_adreview (id, description, created_at, advertisement_id, reviewed_by_id) FROM stdin;
e52dd2ec-44f5-41b8-840b-d984bb9dd17e	Good Singara!	2021-01-19 12:50:28.204313+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
2235c874-b6cd-4386-a2c6-da86c543578b	One of the best in town!	2021-01-19 12:51:03.687756+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_advertisement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_advertisement (id, title, price, location, category, description, photo, available_from, available_till, seller_id) FROM stdin;
f3537f16-ca1a-4776-be5b-596a7a2f65c4	Bhaat Mangsho	200	Khulna	bengali_food	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla velit est, egestas id mi sit amet, tincidunt feugiat felis. Fusce laoreet nisl eu tellus ullamcorper, sit amet blandit nibh commodo. Integer vulputate eros purus, ac ultrices tortor euismod ac. Sed ac posuere justo. Aliquam sit amet tincidunt magna.	ads/bhaat_mangsho.JPG	2021-01-19 12:48:34.734195+06	2020-05-20 00:00:00+06	329f3cac-f028-4304-bc6e-9c6abe75b378
60611ffe-772f-4bd1-92af-613d0de61cc4	Singara	10	Khulna	street_food	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla velit est, egestas id mi sit amet, tincidunt feugiat felis. Fusce laoreet nisl eu tellus ullamcorper, sit amet blandit nibh commodo. Integer vulputate eros purus, ac ultrices tortor euismod ac. Sed ac posuere justo. Aliquam sit amet tincidunt magna.	ads/singara.jpg	2021-01-19 12:49:23.82177+06	2020-01-25 00:00:00+06	329f3cac-f028-4304-bc6e-9c6abe75b378
\.


--
-- Data for Name: miam_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_order (id, quantity, total_price, is_delivered, created_at, advertisement_id, buyer_id) FROM stdin;
3dc73f2f-2c3a-4e9c-ac4b-98c639182ab4	5	900	f	2021-01-19 12:50:48.531165+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	bd49f4b6-201c-433d-abf8-4ff64c849979
0b466594-1bbd-43ab-9f9a-a5d5b1345390	10	100	t	2021-01-19 12:52:11.763142+06	60611ffe-772f-4bd1-92af-613d0de61cc4	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Data for Name: miam_promocode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_promocode (id, name, percentage, created_at, advertisement_id, seller_id) FROM stdin;
01f025a2-5f6b-40f2-b949-8e84a74e4ceb	MANGSHO	10	2021-01-19 12:48:48.069426+06	f3537f16-ca1a-4776-be5b-596a7a2f65c4	329f3cac-f028-4304-bc6e-9c6abe75b378
\.


--
-- Data for Name: miam_userreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miam_userreview (id, description, created_at, review_of_id, reviewed_by_id) FROM stdin;
e8380455-e6f4-462e-86b3-5c8f3070e142	Very good food. Timely delivery. I would give 10/10 :)	2021-01-19 12:51:48.365087+06	329f3cac-f028-4304-bc6e-9c6abe75b378	bd49f4b6-201c-433d-abf8-4ff64c849979
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 2, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: accounts_buyerprofile accounts_buyerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_buyerprofile
    ADD CONSTRAINT accounts_buyerprofile_pkey PRIMARY KEY (user_id);


--
-- Name: accounts_sellerprofile accounts_sellerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_sellerprofile
    ADD CONSTRAINT accounts_sellerprofile_pkey PRIMARY KEY (user_id);


--
-- Name: accounts_user accounts_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


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
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: miam_adbookmark miam_adbookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_pkey PRIMARY KEY (id);


--
-- Name: miam_adreview miam_adreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_pkey PRIMARY KEY (id);


--
-- Name: miam_advertisement miam_advertisement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_advertisement
    ADD CONSTRAINT miam_advertisement_pkey PRIMARY KEY (id);


--
-- Name: miam_order miam_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_pkey PRIMARY KEY (id);


--
-- Name: miam_promocode miam_promocode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_pkey PRIMARY KEY (id);


--
-- Name: miam_userreview miam_userreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: accounts_user_email_b2644a56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


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
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: miam_adbookmark_advertisement_id_1a499907; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adbookmark_advertisement_id_1a499907 ON public.miam_adbookmark USING btree (advertisement_id);


--
-- Name: miam_adbookmark_bookmarked_by_id_486213a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adbookmark_bookmarked_by_id_486213a3 ON public.miam_adbookmark USING btree (bookmarked_by_id);


--
-- Name: miam_adreview_advertisement_id_e41ed615; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adreview_advertisement_id_e41ed615 ON public.miam_adreview USING btree (advertisement_id);


--
-- Name: miam_adreview_reviewed_by_id_335afc4d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_adreview_reviewed_by_id_335afc4d ON public.miam_adreview USING btree (reviewed_by_id);


--
-- Name: miam_advertisement_seller_id_6be20bc2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_advertisement_seller_id_6be20bc2 ON public.miam_advertisement USING btree (seller_id);


--
-- Name: miam_order_advertisement_id_98f6be61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_order_advertisement_id_98f6be61 ON public.miam_order USING btree (advertisement_id);


--
-- Name: miam_order_buyer_id_76c355fa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_order_buyer_id_76c355fa ON public.miam_order USING btree (buyer_id);


--
-- Name: miam_promocode_advertisement_id_92b0236d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_promocode_advertisement_id_92b0236d ON public.miam_promocode USING btree (advertisement_id);


--
-- Name: miam_promocode_seller_id_caf075c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_promocode_seller_id_caf075c7 ON public.miam_promocode USING btree (seller_id);


--
-- Name: miam_userreview_review_of_id_270e633e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_userreview_review_of_id_270e633e ON public.miam_userreview USING btree (review_of_id);


--
-- Name: miam_userreview_reviewed_by_id_ffd92196; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miam_userreview_reviewed_by_id_ffd92196 ON public.miam_userreview USING btree (reviewed_by_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_buyerprofile accounts_buyerprofile_user_id_f767f5f1_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_buyerprofile
    ADD CONSTRAINT accounts_buyerprofile_user_id_f767f5f1_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_sellerprofile accounts_sellerprofile_user_id_8976d036_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_sellerprofile
    ADD CONSTRAINT accounts_sellerprofile_user_id_8976d036_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adbookmark miam_adbookmark_advertisement_id_1a499907_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_advertisement_id_1a499907_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adbookmark miam_adbookmark_bookmarked_by_id_486213a3_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adbookmark
    ADD CONSTRAINT miam_adbookmark_bookmarked_by_id_486213a3_fk_accounts_ FOREIGN KEY (bookmarked_by_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adreview miam_adreview_advertisement_id_e41ed615_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_advertisement_id_e41ed615_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_adreview miam_adreview_reviewed_by_id_335afc4d_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_adreview
    ADD CONSTRAINT miam_adreview_reviewed_by_id_335afc4d_fk_accounts_ FOREIGN KEY (reviewed_by_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_advertisement miam_advertisement_seller_id_6be20bc2_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_advertisement
    ADD CONSTRAINT miam_advertisement_seller_id_6be20bc2_fk_accounts_ FOREIGN KEY (seller_id) REFERENCES public.accounts_sellerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_order miam_order_advertisement_id_98f6be61_fk_miam_advertisement_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_advertisement_id_98f6be61_fk_miam_advertisement_id FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_order miam_order_buyer_id_76c355fa_fk_accounts_buyerprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_order
    ADD CONSTRAINT miam_order_buyer_id_76c355fa_fk_accounts_buyerprofile_user_id FOREIGN KEY (buyer_id) REFERENCES public.accounts_buyerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_promocode miam_promocode_advertisement_id_92b0236d_fk_miam_adve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_advertisement_id_92b0236d_fk_miam_adve FOREIGN KEY (advertisement_id) REFERENCES public.miam_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_promocode miam_promocode_seller_id_caf075c7_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_promocode
    ADD CONSTRAINT miam_promocode_seller_id_caf075c7_fk_accounts_ FOREIGN KEY (seller_id) REFERENCES public.accounts_sellerprofile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_userreview miam_userreview_review_of_id_270e633e_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_review_of_id_270e633e_fk_accounts_user_id FOREIGN KEY (review_of_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miam_userreview miam_userreview_reviewed_by_id_ffd92196_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miam_userreview
    ADD CONSTRAINT miam_userreview_reviewed_by_id_ffd92196_fk_accounts_user_id FOREIGN KEY (reviewed_by_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

