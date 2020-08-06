--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
4	15	1	2999
5	16	1	2999
6	17	1	2999
7	18	1	2999
8	20	1	2999
9	20	1	2999
10	20	1	2999
11	21	5	9900
12	22	2	2595
13	22	2	2595
14	22	1	2999
15	22	1	2999
16	22	3	2900
17	22	2	2595
18	22	1	2999
19	22	1	2999
20	22	2	2595
21	22	1	2999
22	22	1	2999
23	22	1	2999
24	22	3	2900
25	22	3	2900
26	22	3	2900
27	22	1	2999
28	22	2	2595
29	22	3	2900
30	23	2	2595
31	23	4	999
32	23	6	830
33	23	1	2999
34	24	3	2900
35	24	4	999
36	24	2	2595
37	24	3	2900
38	25	2	2595
39	25	4	999
40	26	4	999
41	27	4	999
42	28	3	2900
43	28	2	2595
44	28	4	999
45	29	3	2900
46	29	2	2595
47	30	1	2999
48	31	3	2900
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2020-06-15 01:21:03.132845+00
2	2020-06-15 01:23:17.868869+00
8	2020-06-15 01:40:13.970261+00
9	2020-06-15 01:43:32.855597+00
10	2020-06-15 01:46:55.328658+00
11	2020-06-15 01:47:36.25667+00
12	2020-06-15 01:52:45.842319+00
13	2020-06-15 01:53:13.859861+00
14	2020-06-15 01:54:30.95578+00
15	2020-06-15 01:55:22.899282+00
16	2020-06-15 01:55:59.605278+00
17	2020-06-15 01:56:33.919385+00
18	2020-06-15 02:14:01.595708+00
19	2020-06-15 02:32:34.238512+00
20	2020-06-15 02:33:37.581142+00
21	2020-06-15 17:44:57.882302+00
22	2020-06-15 18:46:57.39159+00
23	2020-06-15 22:28:27.683038+00
24	2020-06-15 22:45:25.601914+00
25	2020-06-16 00:48:21.449402+00
26	2020-06-16 00:50:22.114004+00
27	2020-06-16 01:05:05.342719+00
28	2020-06-20 21:52:20.972458+00
29	2020-07-15 20:32:55.111224+00
30	2020-07-23 18:06:11.473013+00
31	2020-08-06 02:23:25.787153+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
1	21	Nina Jhun	123456789	123 LearningFuze	2020-06-16 00:37:58.64494+00
2	21	Nina Jhun	123456789	123 LearningFuze	2020-06-16 00:39:31.313964+00
3	21	Nina Jhun	123456789	123 LearningFuze	2020-06-16 00:47:21.527263+00
4	25	Nina Jhun	123456789	123 LearningFuze	2020-06-16 00:48:31.096415+00
5	26	Nina Jhun	123456789	123 LearningFuze	2020-06-16 00:50:24.190647+00
6	30	ninajhun	1234567890	123 Apple Ln	2020-07-23 18:06:38.590364+00
7	30	ninajhun	1234567890	123 Apple Ln	2020-07-23 18:06:46.715732+00
8	30	ninajhun	1234567890	123	2020-07-23 18:13:20.494629+00
9	30	ninajhun	1234567890	1vfcvkndck,a	2020-07-23 18:28:49.499183+00
10	30	ninajhun	1234567890	1234c	2020-07-23 18:29:37.152104+00
11	30	ninajhun	12ww1	efefe	2020-07-23 18:44:19.31971+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
11	English Ivy	2000	/images/english-ivy.jpg	This creeping vine will look great hanging from a shelf or a hook! They love part shade to full shade, so they can grow in most house environments!	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et eros augue. Curabitur fermentum hendrerit metus vitae lacinia. Maecenas pharetra lorem sem, non rutrum purus tempor eget. Donec fringilla a ante et pellentesque. Donec vulputate mauris tortor. Curabitur eget aliquam turpis, sed vestibulum justo. Vivamus a cursus turpis. Cras massa est, molestie eu risus et, maximus pharetra ante. Cras blandit vulputate est, a finibus dolor venenatis id.Sed viverra sapien enim, id fermentum urna tincidunt sit amet. Phasellus quis ornare elit, quis vehicula elit. Sed a nisl ultricies, fermentum nisl eget, vestibulum lectus. Maecenas non urna bibendum, blandit purus nec, dictum ipsum. Curabitur hendrerit maximus massa, eget fermentum risus porta id. Phasellus placerat massa in posuere sagittis. Aliquam euismod ultrices tincidunt.
14	Aloe Vera	1500	/images/aloevera.jpg	Treat yourself to a plant that is not only aesthetically pleasing, but also a lifesaver in a pinch when you get sunburned during those hot summer months!	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et eros augue. Curabitur fermentum hendrerit metus vitae lacinia. Maecenas pharetra lorem sem, non rutrum purus tempor eget. Donec fringilla a ante et pellentesque. Donec vulputate mauris tortor. Curabitur eget aliquam turpis, sed vestibulum justo. Vivamus a cursus turpis. Cras massa est, molestie eu risus et, maximus pharetra ante. Cras blandit vulputate est, a finibus dolor venenatis id.Sed viverra sapien enim, id fermentum urna tincidunt sit amet. Phasellus quis ornare elit, quis vehicula elit. Sed a nisl ultricies, fermentum nisl eget, vestibulum lectus. Maecenas non urna bibendum, blandit purus nec, dictum ipsum. Curabitur hendrerit maximus massa, eget fermentum risus porta id. Phasellus placerat massa in posuere sagittis. Aliquam euismod ultrices tincidunt.
19	Split Leaf Philodendron	3000	/images/split-leaf.jpg	The plant everyone seems to want these days: the Split Leaf Philodendron! If you want to make sure your plant grow those oh so gorgeous splits, make sure you give your plant lots of sun in the summer!	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et eros augue. Curabitur fermentum hendrerit metus vitae lacinia. Maecenas pharetra lorem sem, non rutrum purus tempor eget. Donec fringilla a ante et pellentesque. Donec vulputate mauris tortor. Curabitur eget aliquam turpis, sed vestibulum justo. Vivamus a cursus turpis. Cras massa est, molestie eu risus et, maximus pharetra ante. Cras blandit vulputate est, a finibus dolor venenatis id.Sed viverra sapien enim, id fermentum urna tincidunt sit amet. Phasellus quis ornare elit, quis vehicula elit. Sed a nisl ultricies, fermentum nisl eget, vestibulum lectus. Maecenas non urna bibendum, blandit purus nec, dictum ipsum. Curabitur hendrerit maximus massa, eget fermentum risus porta id. Phasellus placerat massa in posuere sagittis. Aliquam euismod ultrices tincidunt.
18	Areca Palm 	3500	/images/areca-palm.jpg	 Bring a little bit of your vacation back home with you and let this palm remind you of sunnier days relaxing by the beach.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et eros augue. Curabitur fermentum hendrerit metus vitae lacinia. Maecenas pharetra lorem sem, non rutrum purus tempor eget. Donec fringilla a ante et pellentesque. Donec vulputate mauris tortor. Curabitur eget aliquam turpis, sed vestibulum justo. Vivamus a cursus turpis. Cras massa est, molestie eu risus et, maximus pharetra ante. Cras blandit vulputate est, a finibus dolor venenatis id.Sed viverra sapien enim, id fermentum urna tincidunt sit amet. Phasellus quis ornare elit, quis vehicula elit. Sed a nisl ultricies, fermentum nisl eget, vestibulum lectus. Maecenas non urna bibendum, blandit purus nec, dictum ipsum. Curabitur hendrerit maximus massa, eget fermentum risus porta id. Phasellus placerat massa in posuere sagittis. Aliquam euismod ultrices tincidunt.
20	Snake Plant	2500	/images/snake-plant.jpg	No need to be afraid of this snake! Also called mother-in-law’s tongue, this plant is sure to slither into your heart.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et eros augue. Curabitur fermentum hendrerit metus vitae lacinia. Maecenas pharetra lorem sem, non rutrum purus tempor eget. Donec fringilla a ante et pellentesque. Donec vulputate mauris tortor. Curabitur eget aliquam turpis, sed vestibulum justo. Vivamus a cursus turpis. Cras massa est, molestie eu risus et, maximus pharetra ante. Cras blandit vulputate est, a finibus dolor venenatis id.Sed viverra sapien enim, id fermentum urna tincidunt sit amet. Phasellus quis ornare elit, quis vehicula elit. Sed a nisl ultricies, fermentum nisl eget, vestibulum lectus. Maecenas non urna bibendum, blandit purus nec, dictum ipsum. Curabitur hendrerit maximus massa, eget fermentum risus porta id. Phasellus placerat massa in posuere sagittis. Aliquam euismod ultrices tincidunt.
21	Golden Pothos	2000	/images/pothos.jpg	 Golden Pothos or Devil’s Ivy is another great plant to hang from a shelf or hook! They love to grow, grow, grow! So, make sure you’re ready to have this plant turn your house into the jungle of your dreams!	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et eros augue. Curabitur fermentum hendrerit metus vitae lacinia. Maecenas pharetra lorem sem, non rutrum purus tempor eget. Donec fringilla a ante et pellentesque. Donec vulputate mauris tortor. Curabitur eget aliquam turpis, sed vestibulum justo. Vivamus a cursus turpis. Cras massa est, molestie eu risus et, maximus pharetra ante. Cras blandit vulputate est, a finibus dolor venenatis id.Sed viverra sapien enim, id fermentum urna tincidunt sit amet. Phasellus quis ornare elit, quis vehicula elit. Sed a nisl ultricies, fermentum nisl eget, vestibulum lectus. Maecenas non urna bibendum, blandit purus nec, dictum ipsum. Curabitur hendrerit maximus massa, eget fermentum risus porta id. Phasellus placerat massa in posuere sagittis. Aliquam euismod ultrices tincidunt.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 48, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 31, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 11, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 21, true);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

