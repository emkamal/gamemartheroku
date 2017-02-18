--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO gamemartdbadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO gamemartdbadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO gamemartdbadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO gamemartdbadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO gamemartdbadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO gamemartdbadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO gamemartdbadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO gamemartdbadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO gamemartdbadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO gamemartdbadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO gamemartdbadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO gamemartdbadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO gamemartdbadmin;

--
-- Name: game_taxonomy; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE game_taxonomy (
    game_id integer,
    id integer,
    taxonomy_id integer
);


ALTER TABLE public.game_taxonomy OWNER TO gamemartdbadmin;

--
-- Name: gameapp_asset; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_asset (
    id integer NOT NULL,
    asset_type character varying(50) NOT NULL,
    url character varying(200) NOT NULL,
    game_id integer
);


ALTER TABLE public.gameapp_asset OWNER TO gamemartdbadmin;

--
-- Name: gameapp_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_asset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_asset_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_asset_id_seq OWNED BY gameapp_asset.id;


--
-- Name: gameapp_game; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_game (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    "desc" text NOT NULL,
    instruction text NOT NULL,
    url character varying(200) NOT NULL,
    price double precision NOT NULL,
    owner_id integer NOT NULL,
    added_date timestamp with time zone NOT NULL,
    is_featured boolean NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.gameapp_game OWNER TO gamemartdbadmin;

--
-- Name: gameapp_game_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_game_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_game_id_seq OWNED BY gameapp_game.id;


--
-- Name: gameapp_game_taxonomies; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_game_taxonomies (
    id integer NOT NULL,
    game_id integer NOT NULL,
    taxonomy_id integer NOT NULL
);


ALTER TABLE public.gameapp_game_taxonomies OWNER TO gamemartdbadmin;

--
-- Name: gameapp_game_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_game_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_game_taxonomies_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_game_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_game_taxonomies_id_seq OWNED BY gameapp_game_taxonomies.id;


--
-- Name: gameapp_gameplay; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_gameplay (
    id integer NOT NULL,
    score double precision,
    state text,
    "timestamp" timestamp with time zone NOT NULL,
    game_id integer NOT NULL,
    player_id integer NOT NULL
);


ALTER TABLE public.gameapp_gameplay OWNER TO gamemartdbadmin;

--
-- Name: gameapp_gameplay_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_gameplay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_gameplay_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_gameplay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_gameplay_id_seq OWNED BY gameapp_gameplay.id;


--
-- Name: gameapp_purchase; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_purchase (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    amount double precision NOT NULL,
    buyer_id integer NOT NULL,
    game_id integer NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.gameapp_purchase OWNER TO gamemartdbadmin;

--
-- Name: gameapp_purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_purchase_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_purchase_id_seq OWNED BY gameapp_purchase.id;


--
-- Name: gameapp_review; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_review (
    id integer NOT NULL,
    rating integer NOT NULL,
    review text NOT NULL,
    game_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.gameapp_review OWNER TO gamemartdbadmin;

--
-- Name: gameapp_review_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_review_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_review_id_seq OWNED BY gameapp_review.id;


--
-- Name: gameapp_taxonomy; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_taxonomy (
    id integer NOT NULL,
    taxonomy_type character varying(20) NOT NULL,
    label character varying(50) NOT NULL,
    parent_id integer,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.gameapp_taxonomy OWNER TO gamemartdbadmin;

--
-- Name: gameapp_taxonomy_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_taxonomy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_taxonomy_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_taxonomy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_taxonomy_id_seq OWNED BY gameapp_taxonomy.id;


--
-- Name: gameapp_user; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    bio text,
    register_date timestamp with time zone,
    user_type character varying(10) NOT NULL,
    is_validated boolean NOT NULL,
    pic_id integer,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.gameapp_user OWNER TO gamemartdbadmin;

--
-- Name: gameapp_user_groups; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.gameapp_user_groups OWNER TO gamemartdbadmin;

--
-- Name: gameapp_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_user_groups_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_user_groups_id_seq OWNED BY gameapp_user_groups.id;


--
-- Name: gameapp_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_user_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_user_id_seq OWNED BY gameapp_user.id;


--
-- Name: gameapp_user_user_permissions; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE gameapp_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.gameapp_user_user_permissions OWNER TO gamemartdbadmin;

--
-- Name: gameapp_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE gameapp_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gameapp_user_user_permissions_id_seq OWNER TO gamemartdbadmin;

--
-- Name: gameapp_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE gameapp_user_user_permissions_id_seq OWNED BY gameapp_user_user_permissions.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO gamemartdbadmin;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO gamemartdbadmin;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE social_auth_association_id_seq OWNED BY social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO gamemartdbadmin;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO gamemartdbadmin;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE social_auth_code_id_seq OWNED BY social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO gamemartdbadmin;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO gamemartdbadmin;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE social_auth_nonce_id_seq OWNED BY social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO gamemartdbadmin;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO gamemartdbadmin;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE social_auth_partial_id_seq OWNED BY social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE TABLE social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO gamemartdbadmin;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: gamemartdbadmin
--

CREATE SEQUENCE social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO gamemartdbadmin;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gamemartdbadmin
--

ALTER SEQUENCE social_auth_usersocialauth_id_seq OWNED BY social_auth_usersocialauth.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_asset ALTER COLUMN id SET DEFAULT nextval('gameapp_asset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_game ALTER COLUMN id SET DEFAULT nextval('gameapp_game_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_game_taxonomies ALTER COLUMN id SET DEFAULT nextval('gameapp_game_taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_gameplay ALTER COLUMN id SET DEFAULT nextval('gameapp_gameplay_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_purchase ALTER COLUMN id SET DEFAULT nextval('gameapp_purchase_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_review ALTER COLUMN id SET DEFAULT nextval('gameapp_review_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_taxonomy ALTER COLUMN id SET DEFAULT nextval('gameapp_taxonomy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_user ALTER COLUMN id SET DEFAULT nextval('gameapp_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_user_groups ALTER COLUMN id SET DEFAULT nextval('gameapp_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('gameapp_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY social_auth_association ALTER COLUMN id SET DEFAULT nextval('social_auth_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY social_auth_code ALTER COLUMN id SET DEFAULT nextval('social_auth_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('social_auth_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY social_auth_partial ALTER COLUMN id SET DEFAULT nextval('social_auth_partial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY auth_group (id, name) FROM stdin;
1	developer
2	player
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	25
2	1	26
3	1	27
4	1	13
5	1	14
6	1	15
7	2	10
8	2	11
9	2	12
10	2	22
11	2	23
12	2	28
13	2	29
14	2	30
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add group	1	add_group
2	Can change group	1	change_group
3	Can delete group	1	delete_group
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add content type	3	add_contenttype
8	Can change content type	3	change_contenttype
9	Can delete content type	3	delete_contenttype
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add game	5	add_game
14	Can change game	5	change_game
15	Can delete game	5	delete_game
16	Can add gameplay	6	add_gameplay
17	Can change gameplay	6	change_gameplay
18	Can delete gameplay	6	delete_gameplay
22	Can add purchase	8	add_purchase
23	Can change purchase	8	change_purchase
24	Can delete purchase	8	delete_purchase
25	Can add asset	9	add_asset
26	Can change asset	9	change_asset
27	Can delete asset	9	delete_asset
28	Can add review	10	add_review
29	Can change review	10	change_review
30	Can delete review	10	delete_review
31	Can add taxonomy	11	add_taxonomy
32	Can change taxonomy	11	change_taxonomy
33	Can delete taxonomy	11	delete_taxonomy
34	Can add log entry	12	add_logentry
35	Can change log entry	12	change_logentry
36	Can delete log entry	12	delete_logentry
37	Can add session	13	add_session
38	Can change session	13	change_session
39	Can delete session	13	delete_session
40	Can add nonce	14	add_nonce
41	Can change nonce	14	change_nonce
42	Can delete nonce	14	delete_nonce
43	Can add code	15	add_code
44	Can change code	15	change_code
45	Can delete code	15	delete_code
46	Can add user social auth	16	add_usersocialauth
47	Can change user social auth	16	change_usersocialauth
48	Can delete user social auth	16	delete_usersocialauth
49	Can add association	17	add_association
50	Can change association	17	change_association
51	Can delete association	17	delete_association
52	Can add partial	18	add_partial
53	Can change partial	18	change_partial
54	Can delete partial	18	delete_partial
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-02-05 10:20:21.884146+00	1	Taxonomy object	1	[{"added": {}}]	11	4
2	2017-02-05 10:20:30.168937+00	1	Taxonomy object	2	[{"changed": {"fields": ["taxonomy_type", "label"]}}]	11	4
3	2017-02-05 10:20:36.139259+00	2	Taxonomy object	1	[{"added": {}}]	11	4
4	2017-02-05 10:20:40.925012+00	2	Taxonomy object	3		11	4
5	2017-02-05 10:20:40.926738+00	1	Taxonomy object	3		11	4
6	2017-02-05 10:20:49.328925+00	3	Taxonomy object	1	[{"added": {}}]	11	4
7	2017-02-05 10:20:55.16969+00	4	Taxonomy object	1	[{"added": {}}]	11	4
8	2017-02-05 10:47:11.935191+00	1	developer	1	[{"added": {}}]	1	4
9	2017-02-05 10:48:48.415706+00	2	player	1	[{"added": {}}]	1	4
10	2017-02-05 10:53:24.293883+00	5	d1	1	[{"added": {}}]	4	4
11	2017-02-05 10:54:43.358276+00	6	d2	1	[{"added": {}}]	4	4
12	2017-02-05 10:56:11.563582+00	7	d3	1	[{"added": {}}]	4	4
13	2017-02-05 10:57:14.343967+00	2	ejackson1	3		4	4
14	2017-02-05 10:57:14.345778+00	1	rcruz0	3		4	4
15	2017-02-05 10:57:51.285624+00	8	p1	1	[{"added": {}}]	4	4
16	2017-02-05 10:58:28.098549+00	9	p2	1	[{"added": {}}]	4	4
17	2017-02-05 10:59:16.596679+00	10	p3	1	[{"added": {}}]	4	4
18	2017-02-05 11:02:12.000415+00	1	Game object	1	[{"added": {}}]	5	4
19	2017-02-05 11:03:02.604721+00	2	Game object	1	[{"added": {}}]	5	4
20	2017-02-05 11:03:50.04135+00	3	Game object	1	[{"added": {}}]	5	4
21	2017-02-05 11:10:29.133188+00	4	Game object	1	[{"added": {}}]	5	4
22	2017-02-05 11:12:04.069732+00	5	Game object	1	[{"added": {}}]	5	4
23	2017-02-05 11:12:36.32102+00	6	Game object	1	[{"added": {}}]	5	4
24	2017-02-05 11:13:29.70089+00	7	Game object	1	[{"added": {}}]	5	4
25	2017-02-05 11:14:32.549545+00	8	Game object	1	[{"added": {}}]	5	4
26	2017-02-05 11:15:43.972584+00	9	Game object	1	[{"added": {}}]	5	4
27	2017-02-05 11:16:48.76658+00	5	Taxonomy object	1	[{"added": {}}]	11	4
28	2017-02-05 11:16:56.645551+00	4	Taxonomy object	3		11	4
29	2017-02-05 11:16:56.647374+00	3	Taxonomy object	3		11	4
30	2017-02-05 11:17:06.573262+00	6	Taxonomy object	1	[{"added": {}}]	11	4
31	2017-02-05 11:17:16.142304+00	7	Taxonomy object	1	[{"added": {}}]	11	4
32	2017-02-05 11:17:20.906935+00	8	Taxonomy object	1	[{"added": {}}]	11	4
33	2017-02-05 11:17:36.687975+00	9	Taxonomy object	1	[{"added": {}}]	11	4
34	2017-02-05 11:17:41.90319+00	10	Taxonomy object	1	[{"added": {}}]	11	4
35	2017-02-05 11:17:59.437029+00	11	Taxonomy object	1	[{"added": {}}]	11	4
36	2017-02-05 11:19:06.290204+00	12	Taxonomy object	1	[{"added": {}}]	11	4
37	2017-02-05 11:19:25.423686+00	13	Taxonomy object	1	[{"added": {}}]	11	4
38	2017-02-05 11:19:33.168834+00	14	Taxonomy object	1	[{"added": {}}]	11	4
39	2017-02-05 11:19:49.835559+00	15	Taxonomy object	1	[{"added": {}}]	11	4
40	2017-02-05 11:19:54.77074+00	16	Taxonomy object	1	[{"added": {}}]	11	4
41	2017-02-05 11:20:00.969691+00	17	Taxonomy object	1	[{"added": {}}]	11	4
42	2017-02-05 11:20:10.849255+00	18	Taxonomy object	1	[{"added": {}}]	11	4
43	2017-02-05 11:20:15.661907+00	19	Taxonomy object	1	[{"added": {}}]	11	4
65	2017-02-05 14:10:01.078891+00	1	Asset object	2	[{"changed": {"fields": ["asset_type", "url"]}}]	9	4
66	2017-02-05 14:11:14.755582+00	2	Asset object	1	[{"added": {}}]	9	4
67	2017-02-05 14:11:46.226088+00	3	Asset object	1	[{"added": {}}]	9	4
68	2017-02-05 14:12:21.205404+00	4	Asset object	1	[{"added": {}}]	9	4
69	2017-02-05 14:12:41.722051+00	5	Asset object	1	[{"added": {}}]	9	4
70	2017-02-05 15:19:09.249159+00	1	Review object	1	[{"added": {}}]	10	4
71	2017-02-05 15:19:27.230026+00	2	Review object	1	[{"added": {}}]	10	4
72	2017-02-05 15:19:44.770114+00	3	Review object	1	[{"added": {}}]	10	4
73	2017-02-05 15:20:03.673993+00	4	Review object	1	[{"added": {}}]	10	4
74	2017-02-05 15:20:17.236573+00	5	Review object	1	[{"added": {}}]	10	4
75	2017-02-05 15:20:33.187397+00	6	Review object	1	[{"added": {}}]	10	4
76	2017-02-05 19:13:08.532933+00	4	Asset object	3		9	4
77	2017-02-06 08:42:04.225019+00	9	Overwatch	2	[{"changed": {"fields": ["is_featured"]}}]	5	4
78	2017-02-06 08:42:23.48658+00	2	Line of Sight	2	[{"changed": {"fields": ["is_featured"]}}]	5	4
79	2017-02-06 15:22:34.523927+00	11	Multiplayer	2	[{"changed": {"fields": ["label"]}}]	11	4
80	2017-02-09 17:06:43.261693+00	7	Tetris	2	[{"changed": {"fields": ["url"]}}]	5	4
81	2017-02-09 18:30:32.820449+00	1	Purchase object	1	[{"added": {}}]	8	4
82	2017-02-13 14:12:08.04019+00	45	haha	1	[{"added": {}}]	11	4
44	2017-02-05 11:29:20.481882+00	1	Game_Taxonomy object	1	[{"added": {}}]	\N	4
45	2017-02-05 11:29:23.915099+00	2	Game_Taxonomy object	1	[{"added": {}}]	\N	4
46	2017-02-05 11:29:28.928316+00	3	Game_Taxonomy object	1	[{"added": {}}]	\N	4
47	2017-02-05 11:29:32.628118+00	4	Game_Taxonomy object	1	[{"added": {}}]	\N	4
48	2017-02-05 11:29:36.959282+00	5	Game_Taxonomy object	1	[{"added": {}}]	\N	4
49	2017-02-05 11:29:41.107006+00	6	Game_Taxonomy object	1	[{"added": {}}]	\N	4
50	2017-02-05 11:29:45.383115+00	7	Game_Taxonomy object	1	[{"added": {}}]	\N	4
51	2017-02-05 11:29:50.016536+00	8	Game_Taxonomy object	1	[{"added": {}}]	\N	4
52	2017-02-05 11:29:53.801366+00	9	Game_Taxonomy object	1	[{"added": {}}]	\N	4
53	2017-02-05 11:29:57.838138+00	10	Game_Taxonomy object	1	[{"added": {}}]	\N	4
54	2017-02-05 11:30:02.096925+00	11	Game_Taxonomy object	1	[{"added": {}}]	\N	4
55	2017-02-05 11:30:06.998229+00	12	Game_Taxonomy object	1	[{"added": {}}]	\N	4
56	2017-02-05 11:30:13.540113+00	13	Game_Taxonomy object	1	[{"added": {}}]	\N	4
57	2017-02-05 11:30:21.088202+00	14	Game_Taxonomy object	1	[{"added": {}}]	\N	4
58	2017-02-05 11:30:25.488043+00	15	Game_Taxonomy object	1	[{"added": {}}]	\N	4
59	2017-02-05 11:30:35.529031+00	16	Game_Taxonomy object	1	[{"added": {}}]	\N	4
60	2017-02-05 11:30:39.902702+00	17	Game_Taxonomy object	1	[{"added": {}}]	\N	4
61	2017-02-05 11:30:43.610261+00	18	Game_Taxonomy object	1	[{"added": {}}]	\N	4
62	2017-02-05 11:30:47.188158+00	19	Game_Taxonomy object	1	[{"added": {}}]	\N	4
63	2017-02-05 11:30:50.46559+00	20	Game_Taxonomy object	1	[{"added": {}}]	\N	4
64	2017-02-05 11:30:54.637008+00	21	Game_Taxonomy object	1	[{"added": {}}]	\N	4
83	2017-02-16 11:00:29.690614+00	47	rara	3		5	4
84	2017-02-16 11:00:51.387364+00	46	Metal Gear Solid	3		5	4
85	2017-02-16 11:00:51.397343+00	45	age of mythology	3		5	4
86	2017-02-16 11:00:51.405727+00	44	Plant vs Zombies	3		5	4
87	2017-02-16 11:00:51.415032+00	43	sonic hedgehog	3		5	4
88	2017-02-16 11:00:51.425917+00	42	age of empire	3		5	4
89	2017-02-16 11:00:51.433854+00	41	age of empire	3		5	4
90	2017-02-16 11:00:51.442354+00	40	age of empire	3		5	4
91	2017-02-16 11:00:51.450175+00	39	final fantasy	3		5	4
92	2017-02-16 11:00:51.457765+00	38	q5	3		5	4
93	2017-02-16 11:00:51.464535+00	37	q5	3		5	4
94	2017-02-16 11:00:51.473853+00	36	q1	3		5	4
95	2017-02-16 11:00:51.480598+00	35	q1	3		5	4
96	2017-02-16 11:00:51.486689+00	34	q1	3		5	4
97	2017-02-16 11:00:51.494122+00	33	q1	3		5	4
98	2017-02-16 11:00:51.500447+00	32	q1	3		5	4
99	2017-02-16 11:00:51.508486+00	31	q1	3		5	4
100	2017-02-16 11:00:51.513628+00	30	q1	3		5	4
101	2017-02-16 11:00:51.520664+00	29	q1	3		5	4
102	2017-02-16 11:00:51.527607+00	28	q1	3		5	4
103	2017-02-16 11:00:51.535863+00	27	q1	3		5	4
104	2017-02-16 11:00:51.574066+00	26	vv	3		5	4
105	2017-02-16 11:00:51.582664+00	25	r1	3		5	4
106	2017-02-16 11:00:51.591441+00	24	e1	3		5	4
107	2017-02-16 11:00:51.600871+00	23	e1	3		5	4
108	2017-02-16 11:00:51.609081+00	22	w2	3		5	4
109	2017-02-16 11:00:51.615182+00	21	w1	3		5	4
110	2017-02-16 11:00:51.620561+00	20	new2	3		5	4
111	2017-02-16 11:00:51.628935+00	19	New	3		5	4
112	2017-02-16 11:40:55.503186+00	53	Roller Coaster Tycoon	3		5	4
113	2017-02-16 11:40:55.513735+00	52	Roller Coaster Tycoon	3		5	4
114	2017-02-16 11:40:55.522285+00	51	qeqe	3		5	4
115	2017-02-16 11:40:55.528434+00	50	qeqe	3		5	4
116	2017-02-16 11:40:55.53345+00	49	qeqe	3		5	4
117	2017-02-16 11:40:55.571486+00	48	qeqe	3		5	4
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 117, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	group
2	auth	permission
3	contenttypes	contenttype
4	gameapp	user
5	gameapp	game
6	gameapp	gameplay
8	gameapp	purchase
9	gameapp	asset
10	gameapp	review
11	gameapp	taxonomy
12	admin	logentry
13	sessions	session
14	social_django	nonce
15	social_django	code
16	social_django	usersocialauth
17	social_django	association
18	social_django	partial
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-01-31 16:16:54.796174+00
2	contenttypes	0002_remove_content_type_name	2017-01-31 16:16:54.814101+00
3	auth	0001_initial	2017-01-31 16:16:54.860676+00
4	auth	0002_alter_permission_name_max_length	2017-01-31 16:16:54.871004+00
5	auth	0003_alter_user_email_max_length	2017-01-31 16:16:54.879828+00
6	auth	0004_alter_user_username_opts	2017-01-31 16:16:54.887686+00
7	auth	0005_alter_user_last_login_null	2017-01-31 16:16:54.897672+00
8	auth	0006_require_contenttypes_0002	2017-01-31 16:16:54.905208+00
9	auth	0007_alter_validators_add_error_messages	2017-01-31 16:16:54.918822+00
10	auth	0008_alter_user_username_max_length	2017-01-31 16:16:54.927096+00
11	gameapp	0001_initial	2017-01-31 16:16:55.155813+00
12	gameapp	0002_auto_20170203_2053	2017-02-03 20:54:05.215836+00
13	gameapp	0003_auto_20170204_0326	2017-02-04 03:26:54.35715+00
14	admin	0001_initial	2017-02-05 09:37:48.629883+00
15	admin	0002_logentry_remove_auto_add	2017-02-05 09:37:48.669699+00
16	gameapp	0004_auto_20170205_0937	2017-02-05 09:39:33.729536+00
17	sessions	0001_initial	2017-02-05 09:39:33.740314+00
18	gameapp	0005_auto_20170205_0944	2017-02-05 09:45:04.174091+00
19	gameapp	0006_auto_20170205_0947	2017-02-05 09:47:17.261696+00
20	gameapp	0007_auto_20170205_1020	2017-02-05 10:20:12.029769+00
21	gameapp	0008_auto_20170206_1403	2017-02-06 14:04:01.645183+00
22	gameapp	0009_taxonomy_games	2017-02-06 17:13:35.052581+00
23	gameapp	0010_remove_taxonomy_games	2017-02-09 19:38:01.01694+00
24	gameapp	0011_purchase_state	2017-02-09 19:38:01.05199+00
25	gameapp	0012_auto_20170210_1748	2017-02-10 17:49:00.410473+00
26	gameapp	0013_auto_20170210_1802	2017-02-10 18:02:22.288094+00
27	gameapp	0014_taxonomy_games	2017-02-11 17:43:11.811832+00
28	gameapp	0015_auto_20170212_1428	2017-02-12 14:28:13.047984+00
29	default	0001_initial	2017-02-13 21:53:20.590565+00
30	social_auth	0001_initial	2017-02-13 21:53:20.607559+00
31	default	0002_add_related_name	2017-02-13 21:53:20.77223+00
32	social_auth	0002_add_related_name	2017-02-13 21:53:20.777084+00
33	default	0003_alter_email_max_length	2017-02-13 21:53:20.813173+00
34	social_auth	0003_alter_email_max_length	2017-02-13 21:53:20.823178+00
35	default	0004_auto_20160423_0400	2017-02-13 21:53:20.896415+00
36	social_auth	0004_auto_20160423_0400	2017-02-13 21:53:20.903856+00
37	social_auth	0005_auto_20160727_2333	2017-02-13 21:53:20.925256+00
38	social_django	0006_partial	2017-02-13 21:53:21.0088+00
39	social_django	0001_initial	2017-02-13 21:53:21.024773+00
40	social_django	0005_auto_20160727_2333	2017-02-13 21:53:21.031292+00
41	social_django	0002_add_related_name	2017-02-13 21:53:21.036803+00
42	social_django	0003_alter_email_max_length	2017-02-13 21:53:21.053419+00
43	social_django	0004_auto_20160423_0400	2017-02-13 21:53:21.065384+00
44	gameapp	0016_auto_20170215_1810	2017-02-15 18:16:27.436912+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('django_migrations_id_seq', 44, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
mkoomhx537j6wq96cp0obcxtwb96en6k	NDUxYjFkODMzNTllOGE5MDU1MzgyOTIxNDU4MTkwNzE5YjIxYjQ3YTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiODM3M2E2NWM3Mjg5MDE2YjM4MmQ1NDQwZGQzN2ViMzFkNTFkNzljMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-02-25 17:43:51.878733+00
mr5dtpabb7p78sa0wbdfqf2vqcv4yssa	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-25 18:02:31.89274+00
kdmorovi6247l683v8xhuxmjf0ygzggg	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-25 18:03:00.989227+00
w6of1wj3zuq20np271u2gxsqk4qcaq0y	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-26 10:21:40.000155+00
96jnk6zrjg9id1uij2dss74o5z0kc2zs	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-26 10:23:28.669715+00
npw7op7rgw67gs03blneycox089w6cbv	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-26 10:25:05.141155+00
yqd8qjupmqjasmaefg26w58lcooy4wwl	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-26 10:27:13.513493+00
qvws0lyemfffi1h71xdkkepkmtpwn2pq	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-26 10:29:36.068654+00
dbnuagugjd0ajaagcuxg7d5o5n8ds2qe	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-26 10:47:02.026959+00
qcf7h26y3bk4qos1776tpzf9520g2eit	MWZlMWYxYjEwZTkwYTE2YmRlNDUwZDdkZmE4NzQ5NzY3MzJjMjAwMTp7fQ==	2017-02-26 10:47:20.536635+00
8noa7ilxo6waue49sz56lhezon2odzgp	OTc2N2IzODA1MGM0Nzk5YzUwMjc3ZmFlODNjMTZmZmIxYzNhNGMzOTp7ImdpdGh1Yl9zdGF0ZSI6IlNudXBuaUhRd1BDcURITWFVa1NhaFgxTXRoeXA5UGdwIn0=	2017-02-27 15:47:59.723177+00
ly5mlg1b4g4yejj7cao9zk1atybahz0g	NzgyZmE3NTk0ODBjMzE3OWFiZWZmMmZlMTZhNTAyYzQ1Nzg4ZWE5ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdkNWIyMDJmNTY1NzExYmYxOTU3YmU5YzRiMGU4MGExZGIzZDRiYjgiLCJfYXV0aF91c2VyX2lkIjoiMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-02-27 18:57:27.039851+00
c9npfmevv04t7l4eyxxqmi7fj0dspw4q	NTMwNDJlZDNjMzVkYmZjMTdiMjA4YWI3YjNhODdjOTEwZTc3ZDJlOTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImVmZDU4N2E4YWYzMjkzZTlkNDEzZmYyMzgzY2QwNDVlNTVmMDZkY2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-03-02 16:34:00.514962+00
\.


--
-- Data for Name: game_taxonomy; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY game_taxonomy (game_id, id, taxonomy_id) FROM stdin;
\.


--
-- Data for Name: gameapp_asset; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_asset (id, asset_type, url, game_id) FROM stdin;
3	game-banner-400x250	http://gamemart.herokuapp.com/media/games/tetris/tetris-banner-400x250.jpg	7
1	game-banner-400x250	http://gamemart.herokuapp.com/media/games/tera/tera-banner-400x250.jpg	1
5	game-banner-400x250	http://gamemart.herokuapp.com/media/games/dota-2/dota-2-banner-400x250.jpg	4
2	game-banner-400x250	http://gamemart.herokuapp.com/media/games/counter-strike/counter-strike-banner-400x250.jpg	8
6	game-banner-750x400	http://gamemart.herokuapp.com/media/games/tetris/tetris-banner-750x400.jpg	7
7	game-banner-400x250	http://gamemart.herokuapp.com/media/games/clumsy-bird/clumsy-bird-banner-400x250.jpg	18
8	game-banner-750x400	http://gamemart.herokuapp.com/media/games/clumsy-bird/clumsy-bird-banner-750x400.jpg	18
15	game-banner-128x128	/media/games/alien-invasion/alien-invasion-banner-128x128.jpg	54
16	game-banner-400x250	/media/games/alien-invasion/alien-invasion-banner-400x250.jpg	54
17	game-banner-750x400	/media/games/alien-invasion/alien-invasion-banner-750x400.jpg	54
30	game-banner-400x250	/media/games/tobe-edited/tobe-edited-banner-400x250.jpeg	59
31	game-banner-750x400	/media/games/tobe-edited/tobe-edited-banner-750x400.jpeg	59
32	game-banner-128x128	/media/games/tobe-edited/tobe-edited-banner-128x128.jpeg	59
36	game-banner-128x128	/media/games/diganti/diganti-banner-128x128.jpg	59
37	game-banner-400x250	/media/games/diganti/diganti-banner-400x250.jpg	59
38	game-banner-750x400	/media/games/diganti/diganti-banner-750x400.jpg	59
39	game-banner-128x128	/media/games/diganti-lagi/diganti-lagi-banner-128x128.jpg	59
40	game-banner-400x250	/media/games/diganti-lagi/diganti-lagi-banner-400x250.jpg	59
41	game-banner-750x400	/media/games/diganti-lagi/diganti-lagi-banner-750x400.jpg	59
\.


--
-- Name: gameapp_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_asset_id_seq', 41, true);


--
-- Data for Name: gameapp_game; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_game (id, title, "desc", instruction, url, price, owner_id, added_date, is_featured, slug) FROM stdin;
8	Counter Strike	Donec rutrum congue leo eget malesuada. Pellentesque in ipsum id orci porta dapibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur aliquet quam id dui posuere blandit. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.	s	http://blog.counter-strike.net/	7	10	2017-02-05 11:14:32.548839+00	t	counter-strike
6	Simcity	Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla porttitor accumsan tincidunt. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit.		http://store.steampowered.com/genre/Free%20to%20Play/?tab=MostPlayed	4	8	2017-02-05 11:12:36.320149+00	f	simcity
1	Tera	Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Pellentesque in ipsum id orci porta dapibus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla quis lorem ut libero malesuada feugiat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Nulla porttitor accumsan tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur aliquet quam id dui posuere blandit. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.	Nulla porttitor accumsan tincidunt. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vivamus suscipit tortor eget felis porttitor volutpat. Donec rutrum congue leo eget malesuada.	http://store.steampowered.com/app/331360/?snr=1_200_200_1420_1421	2	5	2017-02-05 11:02:11.989566+00	f	tera
3	Super Mario Bros	Vivamus suscipit tortor eget felis porttitor volutpat. Pellentesque in ipsum id orci porta dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Nulla quis lorem ut libero malesuada feugiat.\r\n\r\nPraesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Nulla quis lorem ut libero malesuada feugiat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Sed porttitor lectus nibh. Sed porttitor lectus nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Nulla quis lorem ut libero malesuada feugiat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta. Proin eget tortor risus. Sed porttitor lectus nibh. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.\r\n\r\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.\r\n\r\nPellentesque in ipsum id orci porta dapibus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Nulla quis lorem ut libero malesuada feugiat. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Donec sollicitudin molestie malesuada. Proin eget tortor risus. Cras ultricies ligula sed magna dictum porta. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.		http://store.steampowered.com/app/560260/?snr=1_200_200_1420_1421	2	10	2017-02-05 11:03:50.040523+00	f	super-mario-bros
4	Dota 2	Cras ultricies ligula sed magna dictum porta. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.		http://store.steampowered.com/app/570/?snr=1_200_200_1420_1422	5	8	2017-02-05 11:10:29.131404+00	t	dota-2
5	Team Fortress	Nulla quis lorem ut libero malesuada feugiat. Nulla porttitor accumsan tincidunt. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada feugiat. Proin eget tortor risus. Curabitur aliquet quam id dui posuere blandit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Sed porttitor lectus nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.		http://store.steampowered.com/app/440/?snr=1_200_200_1420_1422	4	8	2017-02-05 11:12:04.069077+00	f	team-fortress
9	Overwatch	Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Nulla quis lorem ut libero malesuada feugiat. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Cras ultricies ligula sed magna dictum porta. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Sed porttitor lectus nibh.		https://playoverwatch.com/en-us/	7	10	2017-02-06 08:42:04.187211+00	f	overwatch
2	Line of Sight	Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Cras ultricies ligula sed magna dictum porta. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Nulla porttitor accumsan tincidunt. Sed porttitor lectus nibh. Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.		http://store.steampowered.com/app/436520/?snr=1_200_200_1420_1421	3	9	2017-02-06 08:42:23.46771+00	f	line-of-sight
11	2048	2048 is a single-player sliding block puzzle game by Italian web developer Gabriele Cirulli. 2048 was originally written in JavaScript and CSS during a weekend, and released on March 9, 2014, as free and open-source software subject to the MIT license. Clones written in C++ and Vala are available.[2][3] There is also a version for the Linux terminal.[4]\nThe game's objective is to slide numbered tiles on a grid to combine them to create a tile with the number 2048. [5]\n2048 has been described to be very similar to the Threes app released a month earlier.[6][7] Cirulli himself described 2048 as a clone of Veewo Studios' app 1024, who has actually said in the description of the app to be a clone of Threes.	HOW TO PLAY: Use your arrow keys to move the tiles. When two tiles with the same number touch, they merge into one!	http://gamemart.herokuapp.com/static/games/2048/	3	5	2017-02-12 20:42:04.187211+00	t	2048
59	diganti lagi	kgf gjhdfvjjh gdkgkdg ff	435	http://google.com	1	11	2017-02-17 08:04:47.029748+00	f	diganti-lagi
18	Clumsy Bird	Flappy Bird is a 2013 mobile game developed by Vietnamese artist and programmer Dong Nguyen, under his game development company dotGEARS.[1] The game is a side-scroller where the player controls a bird, attempting to fly between rows of green pipes without hitting them. The developer created the game over several days, using a bird protagonist which he had designed for a cancelled game in 2012.	dskhf gdsih gihds	http://gamemart.herokuapp.com/static/games/clumsy-bird/	5	11	2017-02-15 17:21:34.221329+00	f	clumsy-bird
10	Backbag	djhfgdhf	asda	http://gamemart.herokuapp.com/static/games/backbag/	1	11	2017-02-12 08:42:04.187211+00	t	backbag
7	Tetris	Donec sollicitudin molestie malesuada. Pellentesque in ipsum id orci porta dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta. Proin eget tortor risus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.	Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Nulla quis lorem ut libero malesuada feugiat. Pellentesque in ipsum id orci porta dapibus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Pellentesque in ipsum id orci porta dapibus.\r\n\r\nCurabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Pellentesque in ipsum id orci porta dapibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. Cras ultricies ligula sed magna dictum porta. Nulla porttitor accumsan tincidunt. Proin eget tortor risus.\r\n\r\nMauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Nulla quis lorem ut libero malesuada feugiat. Sed porttitor lectus nibh. Curabitur aliquet quam id dui posuere blandit. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Vivamus suscipit tortor eget felis porttitor volutpat. Cras ultricies ligula sed magna dictum porta. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Nulla quis lorem ut libero malesuada feugiat. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi.\r\n\r\nProin eget tortor risus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt. Sed porttitor lectus nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in ipsum id orci porta dapibus.\r\n\r\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur aliquet quam id dui posuere blandit. Donec rutrum congue leo eget malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus suscipit tortor eget felis porttitor volutpat. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Sed porttitor lectus nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit.	http://gamemart.herokuapp.com/static/games/tetris/	1	11	2017-02-09 17:06:43.246419+00	t	tetris
54	Alien Invasion	The alien invasion is a usual part of science fiction stories and film, in which extraterrestrials invade Earth either to exterminate and supplant human life, enslave it under a colonial system, to harvest humans for food, steal the planet's resources, or destroy the planet altogether.\r\nThe invasion scenario has been used as an allegory for a protest against military hegemony and the societal ills of the time. H.G. Wells' novel The War of the Worlds extended the invasion literature that was already common when science fiction was first emerging as a genre.		http://gamemart.herokuapp.com/static/games/alien-invasion	3	11	2017-02-16 11:54:18.30231+00	f	alien-invasion
\.


--
-- Name: gameapp_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_game_id_seq', 60, true);


--
-- Data for Name: gameapp_game_taxonomies; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_game_taxonomies (id, game_id, taxonomy_id) FROM stdin;
44	54	22
49	59	21
51	59	20
52	59	22
\.


--
-- Name: gameapp_game_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_game_taxonomies_id_seq', 52, true);


--
-- Data for Name: gameapp_gameplay; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_gameplay (id, score, state, "timestamp", game_id, player_id) FROM stdin;
3	0	\N	2017-02-10 17:53:14.900803+00	7	11
4	400	gameOver	2017-02-10 17:55:15.3123+00	7	11
5	5400	gameOver	2017-02-10 18:08:35.077852+00	7	11
6	13400	gameOver	2017-02-11 17:33:36.923064+00	7	11
7	0	gameOver	2017-02-12 11:09:03.68438+00	7	11
8	0	gameOver	2017-02-12 11:09:32.283487+00	7	11
9	0	gameOver	2017-02-12 11:11:14.085919+00	7	11
10	0	gameOver	2017-02-12 11:19:00.313139+00	7	11
11	0	gameOver	2017-02-12 11:33:04.046712+00	7	11
14	20	\N	2017-02-12 13:16:52.611038+00	10	11
15	20	\N	2017-02-12 13:17:17.219816+00	10	11
16	30	\N	2017-02-12 13:18:02.58387+00	10	11
17	50	\N	2017-02-12 13:21:02.154944+00	10	11
18	30	\N	2017-02-12 13:22:58.59548+00	10	11
19	20	\N	2017-02-12 13:23:29.447682+00	10	11
20	80	\N	2017-02-12 13:25:22.601499+00	10	11
21	110	\N	2017-02-12 13:30:38.00917+00	10	11
22	0	\N	2017-02-12 13:33:31.045291+00	10	11
27	170	{"playerItems":["A rock","A rock"],"score":170}	2017-02-12 15:21:39.916977+00	10	11
24	0	{"playerItems":["A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock"],"score":0}	2017-02-12 15:12:17.6254+00	10	11
23	0	"{\\"playerItems\\":[\\"A rock\\",\\"A rock\\",\\"A rock\\",\\"A rock\\",\\"A rock\\"],\\"score\\":0}"	2017-02-12 14:28:27.412836+00	10	11
25	0	{"playerItems":["A rock","A rock"],"score":0}	2017-02-12 15:15:16.139244+00	10	11
26	180	{"playerItems":["A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock","A rock"],"score":180}	2017-02-12 15:16:21.778523+00	10	11
28	350	{"playerItems":["A rock","A rock","A rock","A rock"],"score":350}	2017-02-12 15:21:55.895556+00	10	11
13	0	\N	2017-02-12 12:14:24.518544+00	10	11
12	0	\N	2017-02-12 12:12:10.42424+00	10	11
29	18400	\N	2017-02-13 18:56:41.956922+00	7	11
30	400	\N	2017-02-13 18:58:08.451831+00	7	12
31	80	\N	2017-02-13 19:20:33.807368+00	10	12
32	80	\N	2017-02-13 19:20:36.406491+00	10	12
33	\N	{"playerItems":["A rock","A rock","A rock","A rock","A rock"],"score":80}	2017-02-13 19:20:37.612489+00	10	12
34	\N	{"playerItems":["A rock","A rock"],"score":40}	2017-02-13 20:57:51.77433+00	10	12
35	390	{"playerItems":["A rock","A rock"],"score":390}	2017-02-13 21:01:09.437947+00	10	12
36	1800	\N	2017-02-14 21:55:14.272049+00	7	13
37	0	\N	2017-02-15 11:03:02.642283+00	7	11
38	23000	\N	2017-02-15 11:23:59.986275+00	7	11
39	400	\N	2017-02-15 12:38:22.325347+00	7	13
40	0	\N	2017-02-15 16:58:50.682228+00	7	11
\.


--
-- Name: gameapp_gameplay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_gameplay_id_seq', 40, true);


--
-- Data for Name: gameapp_purchase; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_purchase (id, date, amount, buyer_id, game_id, status) FROM stdin;
2	2017-02-09 19:40:21.18356+00	1	11	7	success
4	2017-02-10 18:03:35.259667+00	7	11	8	success
5	2017-02-12 12:00:46.716783+00	1	11	10	canceled
6	2017-02-12 12:02:13.928342+00	1	11	10	success
7	2017-02-12 18:08:42.13842+00	3	11	11	success
12	2017-02-13 18:57:32.132779+00	1	12	7	success
13	2017-02-13 19:11:34.192339+00	1	12	10	canceled
14	2017-02-13 19:14:58.913227+00	1	12	10	canceled
15	2017-02-13 19:16:50.461416+00	1	12	10	canceled
16	2017-02-13 19:19:08.799329+00	1	12	10	canceled
17	2017-02-13 19:19:51.847305+00	1	12	10	canceled
18	2017-02-13 19:20:20.87394+00	1	12	10	success
19	2017-02-14 21:53:38.367804+00	1	13	7	success
20	2017-02-14 23:07:00.567034+00	3	13	11	success
21	2017-02-15 16:01:34.54842+00	5	11	4	success
22	2017-02-15 17:27:03.86163+00	5	11	18	success
23	2017-02-16 11:55:22.719542+00	3	11	54	success
\.


--
-- Name: gameapp_purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_purchase_id_seq', 23, true);


--
-- Data for Name: gameapp_review; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_review (id, rating, review, game_id, person_id) FROM stdin;
1	4	Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada feugiat. Proin eget tortor risus. Curabitur aliquet quam id dui posuere blandit. Sed porttitor lectus nibh. Curabitur aliquet quam id dui posuere blandit.	7	8
2	3	Vivamus suscipit tortor eget felis porttitor volutpat. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Nulla quis lorem ut libero malesuada feugiat. Sed porttitor lectus nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Pellentesque in ipsum id orci porta dapibus. Nulla quis lorem ut libero malesuada feugiat. Nulla quis lorem ut libero malesuada feugiat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Nulla porttitor accumsan tincidunt. Curabitur aliquet quam id dui posuere blandit. Nulla quis lorem ut libero malesuada feugiat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt. Donec sollicitudin molestie malesuada.	6	8
3	3	Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porttitor lectus nibh. Sed porttitor lectus nibh.	3	8
4	1	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.\r\n\r\nSed porttitor lectus nibh.\r\n\r\nVivamus magna justo, lacinia eget consectetur sed, convallis at tellus.	1	8
5	5	Quisque velit nisi, pretium ut lacinia in, elementum id enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vivamus suscipit tortor eget felis porttitor volutpat. Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus suscipit tortor eget felis porttitor volutpat.	8	10
6	4	Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus.	9	10
\.


--
-- Name: gameapp_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_review_id_seq', 6, true);


--
-- Data for Name: gameapp_taxonomy; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_taxonomy (id, taxonomy_type, label, parent_id, slug) FROM stdin;
20	game_category	Action	\N	action
21	game_category	Adventure	\N	adventure
22	game_category	Arcade	\N	arcade
23	game_category	Card	\N	card
24	game_category	Fantasy	\N	fantasy
25	game_category	Fighting	\N	fighting
26	game_category	Puzzle	\N	puzzle
27	game_category	Racing	\N	racing
28	game_category	Simulation	\N	simulation
29	game_category	Sports	\N	sports
30	game_tag	2 Player	\N	2-player
31	game_tag	3D	\N	3d
32	game_tag	Awesome	\N	awesome
33	game_tag	Dress Up	\N	dress-up
34	game_tag	Flying	\N	flying
35	game_tag	Holidays	\N	holidays
36	game_tag	Kids	\N	kids
37	game_tag	Monster	\N	monster
38	game_tag	Multiplayer	\N	multiplayer
39	game_tag	Pool	\N	pool
40	game_tag	Robot	\N	robot
41	game_tag	WebGL	\N	webgl
42	game_tag	Word	\N	word
43	game_tag	Strategy	\N	strategy
\.


--
-- Name: gameapp_taxonomy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_taxonomy_id_seq', 45, true);


--
-- Data for Name: gameapp_user; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, bio, register_date, user_type, is_validated, pic_id, slug) FROM stdin;
12	pbkdf2_sha256$30000$pwMorPrqFNmD$knGdsxn6gzpyfU39O+b+YXjOx1t/+LT6Fp/tdR2vwUQ=	2017-02-13 18:57:27.029293+00	f	jaka	jaka	widada	ja@ka.com	f	t	2017-02-13 18:57:15.321291+00	\N	2017-02-13 18:57:15.499997+00	player	f	\N	jaka-widada
5	lkjhgfdsa	2017-02-05 10:45:51+00	f	d1	Studio	Wildcard	a@a.com	f	t	2017-02-05 10:51:27+00		2017-02-05 10:52:27+00	developer	t	1	d1
6	123	2017-02-05 10:45:51+00	f	d2	Mouldy Toof	Studios	a@a.com	f	t	2017-02-05 10:51:27+00		2017-02-05 10:54:28+00	developer	t	1	d2
7	lkjhgfdsa	2017-02-05 10:45:51+00	f	d3	Studio	Wildcard	a@a.com	f	t	2017-02-05 10:51:27+00		2017-02-05 10:52:27+00	developer	t	1	d3
8	123	2017-02-05 10:45:51+00	f	p1	Mustafa	Kamal	a@a.com	f	t	2017-02-05 10:51:27+00		2017-02-05 10:52:27+00	player	t	1	p1
9	lkjhgfdsa	2017-02-05 10:45:51+00	f	p2	Studio	Wildcard	a@a.com	f	t	2017-02-05 10:51:27+00		2017-02-05 10:52:27+00	developer	t	1	p2
10	123	2017-02-05 10:45:51+00	f	p3	Oppi	Opeskola	a@a.com	f	t	2017-02-05 10:51:27+00		2017-02-05 10:52:27+00	player	t	1	p3
13	!ezaveEU19A1M8eK700u1yBbuNupbFrgf1AmuWV63	2017-02-15 12:37:58.483075+00	f	emkamal	Mustafa	Kamal	mustafa.kamal@ymail.com	f	t	2017-02-13 21:53:55.747683+00	\N	2017-02-15 12:44:45.663431+00	player	f	\N	emkamal-1
4	pbkdf2_sha256$30000$GrDVPpPtE2mB$ztuxJbSc9omSAxLKgyFJ84YoS1iaBxwcH5t0kW4sOeM=	2017-02-15 17:29:41.436298+00	t	admin	Admin		admin@gamemart.com	t	t	2017-02-05 09:47:34.627652+00	\N	\N	player	f	\N	admin
14	pbkdf2_sha256$30000$sb15v1iSXlad$/N+FSx58KPgS2Cpet18WIGMzh1rQR6kvBKN7FR75uZI=	2017-02-16 16:32:14.915022+00	f	obama	Barack	Obama	a@a.com	f	t	2017-02-16 16:31:44.528802+00	\N	2017-02-16 16:31:44.737265+00	developer	f	\N	barack-obama
11	pbkdf2_sha256$30000$pfiKvJHsEHRt$fa28eBDjbZ6eyYwFbdDHo4l6rGbOwa29RN7wdPd9fOc=	2017-02-16 16:34:00.505315+00	f	joko	Joko	Widodo	joko@wi.com	f	t	2017-02-08 20:20:19.949342+00	\N	2017-02-08 20:20:20.122722+00	player	f	\N	jani-jani
\.


--
-- Data for Name: gameapp_user_groups; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_user_groups (id, user_id, group_id) FROM stdin;
1	5	1
2	6	1
3	7	1
4	8	2
5	9	2
6	10	2
\.


--
-- Name: gameapp_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_user_groups_id_seq', 6, true);


--
-- Name: gameapp_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_user_id_seq', 14, true);


--
-- Data for Name: gameapp_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY gameapp_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	5	13
2	5	14
3	5	15
\.


--
-- Name: gameapp_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('gameapp_user_user_permissions_id_seq', 3, true);


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('social_auth_association_id_seq', 1, false);


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY social_auth_code (id, email, code, verified) FROM stdin;
\.


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('social_auth_code_id_seq', 1, false);


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('social_auth_nonce_id_seq', 1, false);


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY social_auth_partial (id, token, next_step, backend, data) FROM stdin;
\.


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('social_auth_partial_id_seq', 1, false);


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: gamemartdbadmin
--

COPY social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
1	github	1351815	{"expires": null, "auth_time": 1487162685, "access_token": "2410e401ad02a7142c0c44463ae3f02955918554", "token_type": "bearer", "id": 1351815, "login": "emkamal"}	13
\.


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gamemartdbadmin
--

SELECT pg_catalog.setval('social_auth_usersocialauth_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: gameapp_asset_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_asset
    ADD CONSTRAINT gameapp_asset_pkey PRIMARY KEY (id);


--
-- Name: gameapp_game_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_game
    ADD CONSTRAINT gameapp_game_pkey PRIMARY KEY (id);


--
-- Name: gameapp_game_slug_384acf57_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_game
    ADD CONSTRAINT gameapp_game_slug_384acf57_uniq UNIQUE (slug);


--
-- Name: gameapp_game_taxonomies_game_id_831b2dde_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_game_taxonomies
    ADD CONSTRAINT gameapp_game_taxonomies_game_id_831b2dde_uniq UNIQUE (game_id, taxonomy_id);


--
-- Name: gameapp_game_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_game_taxonomies
    ADD CONSTRAINT gameapp_game_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: gameapp_gameplay_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_gameplay
    ADD CONSTRAINT gameapp_gameplay_pkey PRIMARY KEY (id);


--
-- Name: gameapp_purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_purchase
    ADD CONSTRAINT gameapp_purchase_pkey PRIMARY KEY (id);


--
-- Name: gameapp_review_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_review
    ADD CONSTRAINT gameapp_review_pkey PRIMARY KEY (id);


--
-- Name: gameapp_taxonomy_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_taxonomy
    ADD CONSTRAINT gameapp_taxonomy_pkey PRIMARY KEY (id);


--
-- Name: gameapp_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_user_groups
    ADD CONSTRAINT gameapp_user_groups_pkey PRIMARY KEY (id);


--
-- Name: gameapp_user_groups_user_id_f0cb1f71_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_user_groups
    ADD CONSTRAINT gameapp_user_groups_user_id_f0cb1f71_uniq UNIQUE (user_id, group_id);


--
-- Name: gameapp_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_user
    ADD CONSTRAINT gameapp_user_pkey PRIMARY KEY (id);


--
-- Name: gameapp_user_slug_3df2623d_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_user
    ADD CONSTRAINT gameapp_user_slug_3df2623d_uniq UNIQUE (slug);


--
-- Name: gameapp_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_user_user_permissions
    ADD CONSTRAINT gameapp_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: gameapp_user_user_permissions_user_id_832bc3ca_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_user_user_permissions
    ADD CONSTRAINT gameapp_user_user_permissions_user_id_832bc3ca_uniq UNIQUE (user_id, permission_id);


--
-- Name: gameapp_user_username_key; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY gameapp_user
    ADD CONSTRAINT gameapp_user_username_key UNIQUE (username);


--
-- Name: social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_server_url_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code_email_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_email_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_server_url_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_provider_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: gameapp_asset_6072f8b3; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_asset_6072f8b3 ON gameapp_asset USING btree (game_id);


--
-- Name: gameapp_game_279564bf; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_game_279564bf ON gameapp_game USING btree (owner_id);


--
-- Name: gameapp_game_slug_384acf57_like; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_game_slug_384acf57_like ON gameapp_game USING btree (slug varchar_pattern_ops);


--
-- Name: gameapp_game_taxonomies_6072f8b3; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_game_taxonomies_6072f8b3 ON gameapp_game_taxonomies USING btree (game_id);


--
-- Name: gameapp_game_taxonomies_e7be5c2c; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_game_taxonomies_e7be5c2c ON gameapp_game_taxonomies USING btree (taxonomy_id);


--
-- Name: gameapp_gameplay_251ea98c; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_gameplay_251ea98c ON gameapp_gameplay USING btree (player_id);


--
-- Name: gameapp_gameplay_e2c008e6; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_gameplay_e2c008e6 ON gameapp_gameplay USING btree (game_id);


--
-- Name: gameapp_purchase_7df0df9d; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_purchase_7df0df9d ON gameapp_purchase USING btree (buyer_id);


--
-- Name: gameapp_purchase_e2c008e6; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_purchase_e2c008e6 ON gameapp_purchase USING btree (game_id);


--
-- Name: gameapp_review_45b2392b; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_review_45b2392b ON gameapp_review USING btree (person_id);


--
-- Name: gameapp_review_e2c008e6; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_review_e2c008e6 ON gameapp_review USING btree (game_id);


--
-- Name: gameapp_taxonomy_2dbcba41; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_taxonomy_2dbcba41 ON gameapp_taxonomy USING btree (slug);


--
-- Name: gameapp_taxonomy_ba7d1c56; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_taxonomy_ba7d1c56 ON gameapp_taxonomy USING btree (parent_id);


--
-- Name: gameapp_taxonomy_slug_3a709c00_like; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_taxonomy_slug_3a709c00_like ON gameapp_taxonomy USING btree (slug varchar_pattern_ops);


--
-- Name: gameapp_user_510956d1; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_user_510956d1 ON gameapp_user USING btree (pic_id);


--
-- Name: gameapp_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_user_groups_0e939a4f ON gameapp_user_groups USING btree (group_id);


--
-- Name: gameapp_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_user_groups_e8701ad4 ON gameapp_user_groups USING btree (user_id);


--
-- Name: gameapp_user_slug_3df2623d_like; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_user_slug_3df2623d_like ON gameapp_user USING btree (slug varchar_pattern_ops);


--
-- Name: gameapp_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_user_user_permissions_8373b171 ON gameapp_user_user_permissions USING btree (permission_id);


--
-- Name: gameapp_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_user_user_permissions_e8701ad4 ON gameapp_user_user_permissions USING btree (user_id);


--
-- Name: gameapp_user_username_2eb8a785_like; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX gameapp_user_username_2eb8a785_like ON gameapp_user USING btree (username varchar_pattern_ops);


--
-- Name: social_auth_code_c1336794; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX social_auth_code_c1336794 ON social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX social_auth_code_code_a2393167_like ON social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_partial_94a08da1; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX social_auth_partial_94a08da1 ON social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_e8701ad4; Type: INDEX; Schema: public; Owner: gamemartdbadmin; Tablespace:
--

CREATE INDEX social_auth_usersocialauth_e8701ad4 ON social_auth_usersocialauth USING btree (user_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_gameapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_gameapp_user_id FOREIGN KEY (user_id) REFERENCES gameapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_asset_game_id_22384c5d_fk_gameapp_game_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_asset
    ADD CONSTRAINT gameapp_asset_game_id_22384c5d_fk_gameapp_game_id FOREIGN KEY (game_id) REFERENCES gameapp_game(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_game_owner_id_073a2e3a_fk_gameapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_game
    ADD CONSTRAINT gameapp_game_owner_id_073a2e3a_fk_gameapp_user_id FOREIGN KEY (owner_id) REFERENCES gameapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_game_taxono_taxonomy_id_fda980b7_fk_gameapp_taxonomy_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_game_taxonomies
    ADD CONSTRAINT gameapp_game_taxono_taxonomy_id_fda980b7_fk_gameapp_taxonomy_id FOREIGN KEY (taxonomy_id) REFERENCES gameapp_taxonomy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_game_taxonomies_game_id_c138b4ee_fk_gameapp_game_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_game_taxonomies
    ADD CONSTRAINT gameapp_game_taxonomies_game_id_c138b4ee_fk_gameapp_game_id FOREIGN KEY (game_id) REFERENCES gameapp_game(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_gameplay_game_id_77d54cff_fk_gameapp_game_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_gameplay
    ADD CONSTRAINT gameapp_gameplay_game_id_77d54cff_fk_gameapp_game_id FOREIGN KEY (game_id) REFERENCES gameapp_game(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_gameplay_player_id_5a3412d1_fk_gameapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_gameplay
    ADD CONSTRAINT gameapp_gameplay_player_id_5a3412d1_fk_gameapp_user_id FOREIGN KEY (player_id) REFERENCES gameapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_purchase_buyer_id_1f80ee4a_fk_gameapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_purchase
    ADD CONSTRAINT gameapp_purchase_buyer_id_1f80ee4a_fk_gameapp_user_id FOREIGN KEY (buyer_id) REFERENCES gameapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_purchase_game_id_1546f167_fk_gameapp_game_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_purchase
    ADD CONSTRAINT gameapp_purchase_game_id_1546f167_fk_gameapp_game_id FOREIGN KEY (game_id) REFERENCES gameapp_game(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_review_game_id_17443ffe_fk_gameapp_game_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_review
    ADD CONSTRAINT gameapp_review_game_id_17443ffe_fk_gameapp_game_id FOREIGN KEY (game_id) REFERENCES gameapp_game(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_review_person_id_657cef7b_fk_gameapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_review
    ADD CONSTRAINT gameapp_review_person_id_657cef7b_fk_gameapp_user_id FOREIGN KEY (person_id) REFERENCES gameapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_taxonomy_parent_id_a7eb6c4d_fk_gameapp_taxonomy_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_taxonomy
    ADD CONSTRAINT gameapp_taxonomy_parent_id_a7eb6c4d_fk_gameapp_taxonomy_id FOREIGN KEY (parent_id) REFERENCES gameapp_taxonomy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_user_groups_group_id_2f291bee_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_user_groups
    ADD CONSTRAINT gameapp_user_groups_group_id_2f291bee_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_user_groups_user_id_db8a03e5_fk_gameapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_user_groups
    ADD CONSTRAINT gameapp_user_groups_user_id_db8a03e5_fk_gameapp_user_id FOREIGN KEY (user_id) REFERENCES gameapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_user_pic_id_ba8e1132_fk_gameapp_asset_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_user
    ADD CONSTRAINT gameapp_user_pic_id_ba8e1132_fk_gameapp_asset_id FOREIGN KEY (pic_id) REFERENCES gameapp_asset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_user_user__permission_id_844700e9_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_user_user_permissions
    ADD CONSTRAINT gameapp_user_user__permission_id_844700e9_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gameapp_user_user_permissio_user_id_a6dd78d9_fk_gameapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY gameapp_user_user_permissions
    ADD CONSTRAINT gameapp_user_user_permissio_user_id_a6dd78d9_fk_gameapp_user_id FOREIGN KEY (user_id) REFERENCES gameapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth_user_id_17d28448_fk_gameapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gamemartdbadmin
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_gameapp_user_id FOREIGN KEY (user_id) REFERENCES gameapp_user(id) DEFERRABLE INITIALLY DEFERRED;


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
