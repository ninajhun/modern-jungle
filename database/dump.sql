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
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
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

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 60, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 34, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 14, true);


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

