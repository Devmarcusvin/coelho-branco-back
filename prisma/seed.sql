--
-- PostgreSQL database dump
--

\restrict rc3ksxTiOyuBmENWhywTChi8tGGISWOTs9QgDvVvwvNvP17Kxxgv7fKhKbrhJha

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: avaliacoes_loja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avaliacoes_loja (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    loja_id integer NOT NULL,
    nota integer NOT NULL,
    comentario text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.avaliacoes_loja OWNER TO postgres;

--
-- Name: avaliacoes_loja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avaliacoes_loja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avaliacoes_loja_id_seq OWNER TO postgres;

--
-- Name: avaliacoes_loja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avaliacoes_loja_id_seq OWNED BY public.avaliacoes_loja.id;


--
-- Name: avaliacoes_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avaliacoes_produto (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    produto_id integer NOT NULL,
    nota integer NOT NULL,
    comentario text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.avaliacoes_produto OWNER TO postgres;

--
-- Name: avaliacoes_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avaliacoes_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avaliacoes_produto_id_seq OWNER TO postgres;

--
-- Name: avaliacoes_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avaliacoes_produto_id_seq OWNED BY public.avaliacoes_produto.id;


--
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    categoria_pai_id integer
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_seq OWNER TO postgres;

--
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- Name: comentarios_avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentarios_avaliacao (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    avaliacao_loja_id integer,
    avaliacao_produto_id integer,
    conteudo text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.comentarios_avaliacao OWNER TO postgres;

--
-- Name: comentarios_avaliacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentarios_avaliacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comentarios_avaliacao_id_seq OWNER TO postgres;

--
-- Name: comentarios_avaliacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentarios_avaliacao_id_seq OWNED BY public.comentarios_avaliacao.id;


--
-- Name: imagens_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagens_produto (
    id integer NOT NULL,
    produto_id integer NOT NULL,
    url_imagem character varying(255) NOT NULL,
    ordem integer NOT NULL
);


ALTER TABLE public.imagens_produto OWNER TO postgres;

--
-- Name: imagens_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagens_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.imagens_produto_id_seq OWNER TO postgres;

--
-- Name: imagens_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagens_produto_id_seq OWNED BY public.imagens_produto.id;


--
-- Name: lojas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lojas (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao text,
    logo_url character varying(255),
    banner_url character varying(255),
    sticker_url character varying(255),
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.lojas OWNER TO postgres;

--
-- Name: lojas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lojas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lojas_id_seq OWNER TO postgres;

--
-- Name: lojas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lojas_id_seq OWNED BY public.lojas.id;


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    loja_id integer NOT NULL,
    categoria_id integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao text,
    preco numeric(10,2) NOT NULL,
    estoque integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    senha_hash character varying(255) NOT NULL,
    foto_perfil_url character varying(255),
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: avaliacoes_loja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes_loja ALTER COLUMN id SET DEFAULT nextval('public.avaliacoes_loja_id_seq'::regclass);


--
-- Name: avaliacoes_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes_produto ALTER COLUMN id SET DEFAULT nextval('public.avaliacoes_produto_id_seq'::regclass);


--
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- Name: comentarios_avaliacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios_avaliacao ALTER COLUMN id SET DEFAULT nextval('public.comentarios_avaliacao_id_seq'::regclass);


--
-- Name: imagens_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagens_produto ALTER COLUMN id SET DEFAULT nextval('public.imagens_produto_id_seq'::regclass);


--
-- Name: lojas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lojas ALTER COLUMN id SET DEFAULT nextval('public.lojas_id_seq'::regclass);


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
1d65872c-2da8-4d66-8bd3-b1d7a82fcecb	81907ff037971deda1e262339822e0cde253f44570bb70c09ea45d49a6995b00	2026-06-16 03:21:51.506881-03	20260602180000_init	\N	\N	2026-06-16 03:21:51.490255-03	1
\.


--
-- Data for Name: avaliacoes_loja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avaliacoes_loja (id, usuario_id, loja_id, nota, comentario, "createdAt", "updatedAt") FROM stdin;
1	2	1	5	Brownies incríveis, melhor loja do site!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
2	5	1	4	Gostei bastante, entrega rápida.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
3	12	1	3	Produto bom mas achei caro.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
4	3	2	5	Ótima variedade de produtos!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
5	7	2	4	Boa loja, recomendo.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
6	14	2	2	Demorou mais do que esperava.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
7	4	3	5	Frutas sempre frescas, adorei!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
8	9	3	4	Boa qualidade e preço justo.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
9	20	3	3	Ok, mas poderia ter mais variedade.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
10	2	4	5	Melhor seleção de bebidas que já vi!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
11	6	4	4	Ótimas cervejas artesanais.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
12	15	4	5	Adoro essa loja, sempre compro aqui.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
13	1	5	5	Meu gato amou os produtos!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
14	8	5	4	Boa loja para pets felinos.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
15	22	5	3	Produtos ok, mas esperava mais variedade.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
16	3	6	5	Meu cachorro ficou muito feliz!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
17	10	6	4	Boa qualidade nos produtos.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
18	17	6	5	Ração excelente, recomendo!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
19	2	9	5	Temperos incríveis, minha cozinha nunca foi tão saborosa!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
20	11	9	4	Ótima variedade de pimentas.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
21	19	9	3	Bom, mas o frete poderia ser menor.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
22	5	10	4	Móveis de boa qualidade.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
23	13	10	5	Adorei o sofá que comprei!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
24	25	10	3	Entrega demorou um pouco.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
25	6	11	5	Casa ficou linda com os produtos daqui!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
26	14	11	4	Boa loja de decoração.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
27	28	11	2	Produto veio diferente da foto.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
28	7	12	5	Maquiagem incrível, durou o dia todo!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
29	15	12	5	Amo essa marca, melhor base que já usei.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
30	20	12	4	Ótima qualidade, vale o preço.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
31	8	13	5	Pele transformada depois do sérum!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
32	12	13	4	Produtos muito bons.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
33	17	13	3	Gostei mas achei um pouco caro.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
34	9	14	5	Óleo de argan salvou meu cabelo!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
35	13	14	4	Produtos naturais de qualidade.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
36	21	14	5	Melhor loja de cosméticos capilares!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
37	10	15	5	Esmaltes lindos e duradouros!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
38	16	15	4	Ótima variedade de cores.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
39	22	15	3	Bom, mas esperava mais produtos.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
40	11	17	5	Roupas incríveis, estilo único!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
41	19	17	4	Boa qualidade nas peças.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
42	26	17	5	Jaqueta biker perfeita!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
43	12	18	5	Nike Dunk chegou perfeito!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
44	20	18	5	Melhor loja de tênis do site!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
45	27	18	4	Boa seleção, entrega ok.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
46	13	19	5	Peças exclusivas e de altíssima qualidade!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
47	17	19	4	Adorei o moletom polo.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
48	29	19	3	Bonito mas achei caro.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
49	14	20	5	Roupinhas lindas para minha filha!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
50	18	20	4	Boa qualidade para roupa infantil.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
51	30	20	5	Compro sempre aqui para minha sobrinha!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
52	15	21	5	iPhone recondicionado perfeito!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
53	23	21	4	Boa loja, produto chegou bem embalado.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
54	28	21	3	Ok, mas demorou para chegar.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
55	16	22	5	Setup dos sonhos montado com produtos daqui!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
56	24	22	5	RTX 5070 chegou perfeita!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
57	29	22	4	Ótima loja para montar PC gamer.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
58	18	24	5	Playstation 5 por um ótimo preço!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
59	22	24	4	Boa loja de games e eletrônicos.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
60	30	24	5	MacBook Pro chegou impecável!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
61	19	26	5	Farmácia muito completa!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
62	23	26	4	Medicamentos de qualidade e entrega rápida.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
63	27	26	3	Ok, mas o site poderia ser mais fácil.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
64	20	28	5	Meu filho adorou os brinquedos!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
65	24	28	4	Boa qualidade nos jogos.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
66	29	28	5	Ótima loja para presentes infantis!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
67	21	30	5	Melhor loja de jogos digitais!	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
68	25	30	4	Boa seleção de títulos.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
69	28	30	3	Gostei mas esperava mais jogos indie.	2026-06-18 23:18:50.803	2026-06-18 23:18:50.803
\.


--
-- Data for Name: avaliacoes_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avaliacoes_produto (id, usuario_id, produto_id, nota, comentario, "createdAt", "updatedAt") FROM stdin;
1	2	1	5	Brownie perfeito, ganache cremosa demais!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
2	5	1	4	Muito gostoso, recomendo!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
3	3	2	5	Brownie de cookies é o melhor!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
4	6	2	4	Saboroso e bem embalado.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
5	7	3	5	Doce de leite no ponto certo!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
6	9	4	4	M&Ms deixaram tudo mais gostoso.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
7	10	5	3	Brownie tradicional ok, prefiro os recheados.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
8	11	6	5	Red Bull Melancia é refrescante demais!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
9	12	7	4	Sabor de pomelo bem diferente, gostei.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
10	13	8	5	Zero açúcar e muito saboroso!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
11	14	9	4	Clássico que nunca decepciona.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
12	3	10	5	Arroz soltinho e de qualidade!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
13	5	10	4	Sempre compro esse arroz.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
14	4	11	5	Leite condensado Moça é incomparável!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
15	7	12	5	Chocolate Lacta é o melhor!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
16	9	13	4	Coca gelada é sempre boa.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
17	10	14	3	Leite ok, chegou no prazo.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
18	11	15	4	Manteiga de boa qualidade.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
19	13	16	5	Nozes frescas e crocantes!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
20	15	17	4	Farinha de trigo boa para receitas.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
21	4	18	5	Abacate orgânico fresquíssimo!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
22	6	19	4	Batata doce de boa qualidade.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
23	7	20	5	Mamão no ponto certo, delicioso!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
24	8	21	4	Melancia doce e refrescante.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
25	10	22	3	Mexerica ok, algumas vinham verdes.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
26	11	23	5	Ovos frescos e bem embalados!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
27	12	24	4	Uva verde bem doce, gostei.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
28	2	25	4	Água gelada chegou bem embalada.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
29	5	26	5	Água tônica perfeita para drinks!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
30	8	27	4	Boa seleção de refrigerantes.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
31	2	29	5	Meu gato ficou louco com os petiscos!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
32	7	30	5	Brinquedo catnip é um sucesso aqui em casa!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
33	9	31	4	Areia higiênica de boa qualidade.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
34	2	32	5	Peitoral confortável para meu dog!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
35	8	33	5	Scooby Snacks, meu cachorro ama!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
36	10	34	4	Ração de boa qualidade.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
37	2	43	5	Pimenta do reino muito aromática!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
38	4	44	4	Malagueta bem picante, adorei!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
39	6	45	5	Pimenta biquinho é a minha favorita!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
40	8	46	4	Lemon Pepper ótimo para frango.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
41	10	47	3	Tempero ok, nada extraordinário.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
42	2	48	4	Tapete lindo e bem feito.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
43	5	49	5	Estante chegou montada fácil!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
44	7	50	5	Sofá confortável e bonito!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
45	9	51	4	Geladeira ótima, entrega rápida.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
46	2	52	4	Capa de almofada linda!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
47	4	53	3	Escova ok, cumpre o papel.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
48	6	54	5	Pote hermético excelente!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
49	8	56	4	Saleiro charmoso para a cozinha.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
50	10	57	5	Cama infantil muito fofa!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
51	7	58	5	Base líquida perfeita, cobertura incrível!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
52	9	59	4	Pó bronzeador deixou minha pele linda.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
53	11	61	5	Mousse de hidratação salvou minha pele!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
54	13	62	4	Mini blush com cor linda.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
55	15	63	5	Bronzer perfeito para o verão!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
56	17	64	5	Iluminador incrível, uso todo dia!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
57	19	65	4	Máscara para olhos muito boa.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
58	21	68	5	Lip Oil hidrata e dá brilho!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
59	23	70	4	Corretivo iluminador ótimo.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
60	25	73	5	Gloss labial hidratante e lindo!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
61	8	74	5	Gel de limpeza deixou o rosto fresquinho!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
62	10	75	4	Tônico clareador funcionou bem.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
63	12	76	5	Ceramide é essencial na minha rotina!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
64	14	77	5	Sérum com resultado visível em dias!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
65	16	78	4	Protetor solar leve e não oleoso.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
66	18	79	3	Creme clareador demorou para fazer efeito.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
67	9	80	5	Óleo de argan transformou meu cabelo!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
68	11	81	5	Máscara de cabelo hidratação profunda!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
69	15	82	4	Blush iluminador com cor linda.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
70	17	83	5	Batom vinho é meu favorito!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
71	10	84	5	Esmalte Imensidão durou semanas!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
72	12	85	4	Carmim lindo, cor vibrante.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
73	14	86	5	Esmalte perolado perfeito para o verão!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
74	16	87	4	Glitter ficou incrível na festa.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
75	18	88	5	Elegante e sofisticado, amei!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
76	11	93	5	Blusa estampada com muito estilo!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
77	13	94	5	Bota de couro resistente e linda!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
78	15	95	4	Jaqueta biker perfeita para o inverno.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
79	18	96	4	Camisa xadrez confortável.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
80	20	97	3	Boné ok, mas esperava melhor qualidade.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
81	22	98	5	Jeans bootcut ficou incrível!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
82	12	99	5	Nike Dunk é um clássico que nunca erra!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
83	14	100	4	P-6000 muito confortável.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
84	16	101	5	Adidas Samba é o tênis da moda!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
85	19	102	5	Knu Skool chegou perfeito!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
86	21	103	4	2002R muito bonito e confortável.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
87	23	104	3	Future Slide ok para uso casual.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
88	13	105	5	Casaco de malha quentinho e elegante!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
89	15	106	4	Wide leg muito na moda, amei.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
90	17	107	5	Camisa Oxford impecável!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
91	20	108	4	Camisa fit confortável e estilosa.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
92	22	109	5	Jeans fit melhor que eu esperava!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
93	24	110	4	Moletom polo muito quentinho.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
94	14	111	5	Camisa malha macia para minha filha!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
95	16	112	4	Blusa gaivota muito fofa.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
96	18	113	5	Saia junina perfeita para a festa!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
97	21	114	4	Short confortável para o verão.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
98	23	115	5	Short hera lindo na minha sobrinha!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
99	15	116	5	iPhone 15 Pro recondicionado como novo!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
100	17	117	5	iPhone 17 chegou impecável!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
101	19	118	4	Galaxy S25 ótimo custo-benefício.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
102	22	119	3	Suporte de mesa ok, nada especial.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
103	24	120	4	Tripé estável e fácil de montar.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
104	16	121	5	Notebook gamer rodando tudo no ultra!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
105	18	122	5	RTX 5070 chegou perfeita e bem embalada!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
106	20	123	4	Kingston Fury Beast excelente memória.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
107	23	124	5	Monitor gamer com imagem incrível!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
108	25	125	4	Fonte MSI silenciosa e eficiente.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
109	18	130	5	LG UltraGear perfeito para jogos!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
110	20	131	4	Smart TV com imagem nítida.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
111	22	132	5	MacBook Pro voando de performance!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
112	25	133	4	Controle PS5 com ótimo feel.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
113	27	134	5	PS5 chegou perfeito, muito feliz!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
114	19	140	4	Produto chegou bem embalado.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
115	21	141	5	Curativo de boa qualidade!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
116	23	142	4	Compressa de gaze ideal para curativo.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
117	25	143	5	Nebacetin essencial no kit de primeiros socorros!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
118	27	144	5	Dipirona de qualidade, entrega rápida!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
119	29	145	4	Loratadina funcionou bem.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
120	2	146	5	Allegra muito eficiente para alergia!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
121	4	147	4	Kit lenço umedecido muito prático.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
122	19	149	5	Gol de futebol perfeito para brincar!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
123	21	150	4	Tabuleiros geométricos educativos.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
124	23	151	5	Kit de peças criativas, meu filho adorou!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
125	25	152	4	Buba Ball resistente e divertido.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
126	21	153	5	Coup é viciante demais!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
127	23	154	5	Monopoly clássico que nunca sai de moda!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
128	25	155	5	God of War é uma obra de arte!	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
129	27	156	4	Quebra-cabeça desafiador e divertido.	2026-06-18 23:18:50.812	2026-06-18 23:18:50.812
\.


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nome, categoria_pai_id) FROM stdin;
1	mercado	\N
2	frutas	1
3	frescos	1
4	bebidas	1
5	preparada	1
6	farmacia	\N
7	medicamentos	6
8	primeiros socorros	6
9	alergias	6
10	higiene	6
11	beleza	\N
12	maquiagem	11
13	cabelo	11
14	skincare	11
16	moda	\N
18	blusas	16
19	calçados	16
20	calças	16
21	eletronicos	\N
22	celulares	21
23	notebooks	21
24	TVs	21
25	Acessórios	21
26	jogos	\N
27	tabuleiro	26
28	cartas	26
29	video games	26
30	puzzles	26
31	brinquedos	\N
32	bebês	31
33	ar livre	31
34	educativos	31
35	montar	31
36	casa	\N
37	móveis	36
38	decoração	36
39	organização	36
40	cozinha	36
41	melhores avaliados	\N
42	animais	1
15	acessórios	11
17	saias	16
43	hardware	21
\.


--
-- Data for Name: comentarios_avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentarios_avaliacao (id, usuario_id, avaliacao_loja_id, avaliacao_produto_id, conteudo, "createdAt", "updatedAt") FROM stdin;
1	5	1	\N	Concordo! Os brownies são de outro nível.	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
2	1	2	\N	Obrigado pelo carinho! Entregamos com muito amor.	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
3	3	4	\N	Que ótimo! Fico feliz que tenha gostado.	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
4	8	5	\N	Exatamente, os felinos merecem o melhor!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
5	2	7	\N	Boa indicação! Também compro sempre.	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
6	11	8	\N	Nossa, vai ter que experimentar a malagueta então!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
7	5	10	\N	Adorei o feedback! Trabalhamos com muito cuidado.	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
8	6	13	\N	Base da Rare Beauty é perfeita mesmo!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
9	14	14	\N	Sérum é minha parte favorita da rotina!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
10	9	16	\N	Óleo de argan é um tesouro para os cabelos!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
11	10	19	\N	Os esmaltes são realmente duradouros!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
12	11	22	\N	Jaqueta biker é o item do ano!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
13	12	25	\N	Nike Dunk nunca decepciona!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
14	13	28	\N	Casaco de malha é um dos melhores da loja!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
15	14	31	\N	Roupas infantis merecem qualidade mesmo!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
16	15	34	\N	iPhone recondicionado é ótimo custo-benefício!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
17	16	37	\N	Setup gamer completo mesmo!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
18	18	40	\N	PS5 é um investimento que vale a pena!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
19	19	43	\N	Farmácia completa é essencial!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
20	20	46	\N	Brinquedos educativos são os melhores!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
21	21	49	\N	God of War é obra de arte mesmo!	2026-06-18 23:18:50.817	2026-06-18 23:18:50.817
22	5	\N	1	Concordo! O ganache é incrível.	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
23	1	\N	2	Fico feliz que tenha gostado!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
24	6	\N	5	Experimente os recheados, são incríveis!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
25	3	\N	11	Arroz Tio João é o melhor mesmo!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
26	7	\N	14	Red Bull pomelo é o meu favorito também!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
27	4	\N	18	Abacate orgânico é sempre superior!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
28	8	\N	22	Mexerica pode variar por ser fruta, mas é boa!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
29	2	\N	26	Água tônica é essencial para drinks!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
30	5	\N	29	Meu gato também ama petiscos!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
31	3	\N	32	Peitoral confortável é essencial para dogs!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
32	6	\N	36	Pimenta biquinho é demais!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
33	9	\N	39	Sofá confortável muda a vida!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
34	2	\N	44	Pote hermético é indispensável!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
35	7	\N	47	Base líquida Rare Beauty é revolucionária!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
36	12	\N	52	Ceramide é essencial na rotina!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
37	13	\N	57	Óleo de argan é milagroso para cabelos!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
38	14	\N	62	Esmalte imensidão é lindo!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
39	15	\N	67	Bota de couro é clássica!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
40	16	\N	72	Nike Dunk nunca sai de moda!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
41	17	\N	77	Casaco de malha é perfeito para o inverno!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
42	18	\N	82	iPhone recondicionado é custo-benefício incrível!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
43	19	\N	87	RTX 5070 roda tudo no máximo!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
44	20	\N	92	PS5 é o melhor console da geração!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
45	21	\N	97	Nebacetin no kit de primeiros socorros sempre!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
46	22	\N	101	Brinquedos educativos são os melhores!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
47	23	\N	105	God of War é imperdível!	2026-06-18 23:18:50.82	2026-06-18 23:18:50.82
\.


--
-- Data for Name: imagens_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagens_produto (id, produto_id, url_imagem, ordem) FROM stdin;
1	1	/produtos/cjr/brownie_meioAmargo[1].webp	1
2	1	/produtos/cjr/brownie_meioAmargo[2].webp	2
3	1	/produtos/cjr/brownie_meioAmargo[3].webp	3
4	1	/produtos/cjr/brownie_meioAmargo[4].webp	4
5	2	/produtos/cjr/brownie_cookie[1].webp	1
6	2	/produtos/cjr/brownie_cookie[2].webp	2
7	2	/produtos/cjr/brownie_cookie[3].webp	3
8	2	/produtos/cjr/brownie_cookie[4].webp	4
9	3	/produtos/cjr/brownie_doceLeite[1].webp	1
10	3	/produtos/cjr/brownie_doceLeite[2].webp	2
11	3	/produtos/cjr/brownie_doceLeite[3].webp	3
12	3	/produtos/cjr/brownie_doceLeite[4].webp	4
13	4	/produtos/cjr/brownie_mms[1].webp	1
14	4	/produtos/cjr/brownie_mms[2].webp	2
15	4	/produtos/cjr/brownie_mms[3].webp	3
16	4	/produtos/cjr/brownie_mms[4].webp	4
17	5	/produtos/cjr/brownie_tradicional[1].webp	1
18	5	/produtos/cjr/brownie_tradicional[2].webp	2
19	5	/produtos/cjr/brownie_tradicional[3].webp	3
20	5	/produtos/cjr/brownie_tradicional[4].webp	4
21	6	/produtos/cjr/redbull_melancia[1].jpg	1
22	6	/produtos/cjr/redbull_melancia[2].jpg	2
23	7	/produtos/cjr/redbull_pomela[1].jpg	1
24	7	/produtos/cjr/redbull_pomela[2].jpg	2
25	8	/produtos/cjr/redbull_zero[1].jpg	1
26	8	/produtos/cjr/redbull_zero[2].jpg	2
27	9	/produtos/cjr/redbull[1].jpg	1
28	9	/produtos/cjr/redbull[2].jpg	2
29	10	/produtos/D_Carts and Baskets/arroz[1].jpg	1
30	10	/produtos/D_Carts and Baskets/arroz[2].jpg	2
31	11	/produtos/D_Carts and Baskets/leite_condensado[1].jpg	1
32	11	/produtos/D_Carts and Baskets/leite_condensado[2].jpg	2
33	11	/produtos/D_Carts and Baskets/leite_condensado[3].jpg	3
34	12	/produtos/D_Carts and Baskets/chocolate[1].jpg	1
35	12	/produtos/D_Carts and Baskets/chocolate[2].jpg	2
36	12	/produtos/D_Carts and Baskets/chocolate[3].jpg	3
37	13	/produtos/D_Carts and Baskets/coca_cola[1].jpg	1
38	14	/produtos/D_Carts and Baskets/leite[1].jpg	1
39	14	/produtos/D_Carts and Baskets/leite[2].jpg	2
40	14	/produtos/D_Carts and Baskets/leite[3].jpg	3
41	15	/produtos/D_Carts and Baskets/manteiga_president[1].jpg	1
42	16	/produtos/D_Carts and Baskets/nozes[1].jpg	1
43	16	/produtos/D_Carts and Baskets/nozes[2].jpg	2
44	17	/produtos/D_Carts and Baskets/farinha_trigo[1].jpg	1
45	18	/produtos/maumar/abacate[1].webp	1
46	18	/produtos/maumar/abacate[2].webp	2
47	19	/produtos/maumar/batata_doce[1].webp	1
48	19	/produtos/maumar/batata_doce[2].webp	2
49	20	/produtos/maumar/mamao[1].webp	1
50	20	/produtos/maumar/mamao[2].png	2
51	21	/produtos/maumar/melancia_unidade[1].webp	1
52	22	/produtos/maumar/mexerica[1].webp	1
53	23	/produtos/maumar/ovos[1].webp	1
54	24	/produtos/maumar/uva_verde.webp	1
55	25	/produtos/The croc bew/agua_premium[1].png	1
56	26	/produtos/The croc bew/agua_tonica[1].jpg_v=638684990358430000	1
58	27	/produtos/The croc bew/refri_premium[2].webp	2
57	27	/produtos/The croc bew/refri_premium[1].jpg	1
59	29	/produtos/Whiskers/petiscos[1].webp	1
60	29	/produtos/Whiskers/petiscos[2].webp	2
61	29	/produtos/Whiskers/petiscos[3].webp	3
62	30	/produtos/Whiskers/binquedo[1].webp	1
63	30	/produtos/Whiskers/brinquedo[2].webp	2
64	30	/produtos/Whiskers/brinquedo[3].webp	3
65	31	/produtos/Whiskers/areia[1].webp	1
66	31	/produtos/Whiskers/areia[2].webp	2
75	34	/produtos/Dog Goods/ração[4].jpg	4
74	34	/produtos/Dog Goods/ração[3].jpg	3
73	34	/produtos/Dog Goods/ração[2].jpg	2
72	34	/produtos/Dog Goods/ração[1].jpg	1
71	33	/produtos/Dog Goods/scooby_snacks[2].jpg	2
70	33	/produtos/Dog Goods/scooby_snacks[1].jpg	1
69	32	/produtos/Dog Goods/peitoral[3].jpg	3
68	32	/produtos/Dog Goods/peitoral[2].jpg	2
67	32	/produtos/Dog Goods/peitoral[1].jpg	1
76	43	/produtos/spicy/pimenta_preta[1].png	1
77	44	/produtos/spicy/pimenta_malagueta[1].webp	1
78	45	/produtos/spicy/pimenta_biquinho[1].webp	1
79	46	/produtos/spicy/lemon_pepper[1].jpeg	1
80	46	/produtos/spicy/lemon_pepper[2].jpeg	2
81	47	/produtos/spicy/tempero_batata[1].webp	1
82	48	/produtos/Mini Reno/tapete_caramelo[1].webp	1
83	48	/produtos/Mini Reno/tapete_caramelo[2].webp	2
84	48	/produtos/Mini Reno/tapete_caramelo[3].webp	3
85	48	/produtos/Mini Reno/tapete_caramelo[4].webp	4
86	49	/produtos/Mini Reno/estante_madeira[1].webp	1
87	49	/produtos/Mini Reno/estante_madeira[2].webp	2
88	50	/produtos/Mini Reno/sofa[1].webp	1
89	50	/produtos/Mini Reno/sofa[2].webp	2
90	50	/produtos/Mini Reno/sofa[3].webp	3
91	51	/produtos/Mini Reno/geladeira[1].webp	1
92	51	/produtos/Mini Reno/geladeira[2].webp	2
93	51	/produtos/Mini Reno/geladeira[3].webp	3
94	51	/produtos/Mini Reno/geladeira[4].webp	4
95	52	/produtos/fluffy house/capa_almofada[1].avif	1
96	52	/produtos/fluffy house/capa_almofada[2].avif	2
97	53	/produtos/fluffy house/escova_banheiro[1].avif	1
98	53	/produtos/fluffy house/escova_banheiro[2].avif	2
99	54	/produtos/fluffy house/pote_hermetico[1].avif	1
100	54	/produtos/fluffy house/pote_hermetico[2].avif	2
101	55	/produtos/fluffy house/cadeira[1].png	1
102	55	/produtos/fluffy house/cadeira[2].png	2
104	56	/produtos/fluffy house/saleiro[1].avif	1
105	56	/produtos/fluffy house/saleiro[2].avif	2
106	56	/produtos/fluffy house/saleiro[3].avif	3
107	57	/produtos/fluffy house/cama_infantil[1].webp	1
108	57	/produtos/fluffy house/cama_infantil[2].webp	2
109	57	/produtos/fluffy house/cama_infantil[3].webp	3
110	58	/produtos/rare beauty/base[1].avif	1
111	58	/produtos/rare beauty/base[2].avif	2
112	58	/produtos/rare beauty/base[3].avif	3
113	58	/produtos/rare beauty/base[4].avif	4
114	59	/produtos/rare beauty/po_bronzeador[1].avif	1
115	59	/produtos/rare beauty/po_bronzeador[2].avif	2
116	59	/produtos/rare beauty/po_bronzeador[3].avif	3
121	61	/produtos/rare beauty/mousse_hidratacao[4].avif	4
120	61	/produtos/rare beauty/mousse_hidratacao[3].avif	3
119	61	/produtos/rare beauty/mousse_hidratacao[2].avif	2
118	61	/produtos/rare beauty/mousse_hidratacao[1].avif	1
122	62	/produtos/rare beauty/mini_blush[1].avif	1
123	62	/produtos/rare beauty/mini_blush[2].avif	2
124	63	/produtos/rare beauty/bronzer[1].avif	1
125	63	/produtos/rare beauty/bronzer[2].avif	2
126	63	/produtos/rare beauty/bronzer[3].avif	3
127	64	/produtos/rare beauty/iluminador[1].avif	1
128	64	/produtos/rare beauty/iluminador[2].avif	2
129	64	/produtos/rare beauty/iluminador[3].avif	3
130	65	/produtos/rare beauty/mascara_olhos[1].avif	1
131	65	/produtos/rare beauty/mascara_olhos[2].avif	2
132	66	/produtos/rare beauty/gel_esfoliante[1].avif	1
133	67	/produtos/rare beauty/pincel_iluminador[1].avif	1
134	67	/produtos/rare beauty/pincel_iluminador[2].avif	2
135	67	/produtos/rare beauty/pincel_iluminador[3].avif	3
136	68	/produtos/rare beauty/lip_oil[1].avif	1
137	68	/produtos/rare beauty/lip_oil[2].avif	2
138	68	/produtos/rare beauty/lip_oil[3].avif	3
139	69	/produtos/rare beauty/pincel_blush[1].avif	1
140	70	/produtos/rare beauty/corretivo_iluminador[1].avif	1
141	70	/produtos/rare beauty/corretivo_iluminador[2].avif	2
142	70	/produtos/rare beauty/corretivo_iluminador[3].avif	3
143	70	/produtos/rare beauty/corretivo_iluminador[4].avif	4
144	71	/produtos/rare beauty/primer[1].avif	1
145	71	/produtos/rare beauty/primer[2].avif	2
146	71	/produtos/rare beauty/primer[3].avif	3
147	72	/produtos/rare beauty/lapis_labial[1].avif	1
148	72	/produtos/rare beauty/lapis_labial[2].avif	2
149	72	/produtos/rare beauty/lapis_labial[3].avif	3
150	73	/produtos/rare beauty/gloss[1].avif	1
151	73	/produtos/rare beauty/gloss[2].avif	2
152	73	/produtos/rare beauty/gloss[3].avif	3
153	74	/produtos/creamy/gel[1].webp	1
154	74	/produtos/creamy/gel[2].png	2
155	74	/produtos/creamy/gel[3].png	3
156	75	/produtos/creamy/tonico[1].webp	1
157	75	/produtos/creamy/tonico[2].png	2
158	75	/produtos/creamy/tonico[3].png	3
159	75	/produtos/creamy/tonico[4].png	4
160	76	/produtos/creamy/ceramide[1].webp	1
161	76	/produtos/creamy/ceramide[2].webp	2
162	76	/produtos/creamy/ceramide[3].webp	3
163	77	/produtos/creamy/serum[1].webp	1
164	77	/produtos/creamy/serum[2.png	2
165	77	/produtos/creamy/serum[3].png	3
166	78	/produtos/creamy/protetor[1].webp	1
167	78	/produtos/creamy/protetor[3].png	2
168	78	/produtos/creamy/protetor[4].png	3
169	79	/produtos/creamy/creme[1].webp	1
170	79	/produtos/creamy/creme[2].png	2
171	79	/produtos/creamy/creme[3].png	3
172	79	/produtos/creamy/creme[4].png	4
173	80	/produtos/roots/oleo[1].webp	1
174	80	/produtos/roots/oleo[2].webp	2
175	81	/produtos/roots/máscara[1].webp	1
176	82	/produtos/roots/blush[1].webp	1
177	82	/produtos/roots/blush[2].webp	2
178	82	/produtos/roots/blush[3].webp	3
179	83	/produtos/roots/batom[1].webp	1
180	83	/produtos/roots/batom[2].webp	2
117	117	/produtos/bel/iPhone17[2].jpg	2
181	84	/produtos/nalu/esmalte_verde.webp	1
182	85	/produtos/nalu/esmalte_vermelho.webp	1
183	86	/produtos/nalu/esmalte_perola.webp	1
184	86	/produtos/nalu/esmalte_perola[2].webp	2
185	86	/produtos/nalu/esmalte_perola[3].webp	3
186	87	/produtos/nalu/esmalte_glitter[1].webp	1
187	87	/produtos/nalu/esmalte_glitter[2].webp	2
188	87	/produtos/nalu/esmalte_glitter[3].webp	3
189	88	/produtos/nalu/esmalte_elegante[1].webp	1
190	88	/produtos/nalu/esmalte_elegante[2].webp	2
191	93	/produtos/Amoca/blusa_onca[1].webp	1
192	93	/produtos/Amoca/blusa_onca[2].jpg	2
193	93	/produtos/Amoca/blusa_onca[3].jpg	3
194	94	/produtos/Amoca/bota[1].webp	1
195	94	/produtos/Amoca/bota[2].webp	2
196	94	/produtos/Amoca/bota[3].webp	3
197	95	/produtos/Amoca/jaqueta[1].jpg	1
198	95	/produtos/Amoca/jaqueta[2].jpg	2
199	95	/produtos/Amoca/jaqueta[3].jpg	3
200	95	/produtos/Amoca/jaqueta[4].jpg	4
201	96	/produtos/Amoca/xadrez[1].jpg	1
202	96	/produtos/Amoca/xadrez[2].jpg	2
203	97	/produtos/Amoca/bone[1].webp	1
204	97	/produtos/Amoca/bone[2].webp	2
205	97	/produtos/Amoca/bone[3].jpg	3
206	98	/produtos/Amoca/calca[1].jpg	1
207	98	/produtos/Amoca/calca[2].jpg	2
208	99	/produtos/FootShop/dunk[1].webp	1
209	99	/produtos/FootShop/dunk[2].webp	2
210	99	/produtos/FootShop/dunk[3].webp	3
211	99	/produtos/FootShop/dunk[4].webp	4
212	100	/produtos/FootShop/p-6000[1].webp	1
213	100	/produtos/FootShop/p-6000[2].webp	2
214	100	/produtos/FootShop/p-6000[3].webp	3
215	100	/produtos/FootShop/p-6000[4].webp	4
216	101	/produtos/FootShop/samba[1].webp	1
217	101	/produtos/FootShop/samba[2].webp	2
218	101	/produtos/FootShop/samba[3].webp	3
219	102	/produtos/FootShop/knu[1].webp	1
220	102	/produtos/FootShop/knu[2].webp	2
221	102	/produtos/FootShop/knu[3].webp	3
222	102	/produtos/FootShop/knu[4].webp	4
223	103	/produtos/FootShop/new_balance[1].webp	1
224	103	/produtos/FootShop/new_balance[2].webp	2
225	103	/produtos/FootShop/new_balance[3].webp	3
226	103	/produtos/FootShop/new_balance[4].webp	4
227	104	/produtos/FootShop/slide[1].webp	1
228	104	/produtos/FootShop/slide[2].webp	2
229	104	/produtos/FootShop/slide[3].webp	3
230	105	/produtos/melina couture/casaco[1].jpg	1
231	105	/produtos/melina couture/casaco[2].jpg	2
232	105	/produtos/melina couture/casaco[3].jpg	3
233	106	/produtos/melina couture/wideleg[1].jpg	1
234	106	/produtos/melina couture/wideleg[2].jpg	2
235	107	/produtos/melina couture/camisa_oxford[1].jpg	1
236	107	/produtos/melina couture/camisa_oxford[2].jpg	2
237	107	/produtos/melina couture/camisa_oxford[3].jpg	3
238	108	/produtos/melina couture/camisa_fit[1].jpg	1
239	108	/produtos/melina couture/camisa_fit[2].jpg	2
240	108	/produtos/melina couture/camisa_fit[3].jpg	3
241	108	/produtos/melina couture/camisa_fit[4].jpg	4
242	109	/produtos/melina couture/jeans_fit[1].jpg	1
243	109	/produtos/melina couture/jeans_fit[2].jpg	2
244	109	/produtos/melina couture/jeans_fit[3].jpg	3
245	110	/produtos/melina couture/moletom_polo[1].jpg	1
246	110	/produtos/melina couture/moletom_polo[2].jpg	2
247	110	/produtos/melina couture/moletom_polo[3].jpg	3
248	111	/produtos/bel/camiseta_malha[1].webp	1
249	111	/produtos/bel/camiseta_malha[2].webp	2
250	111	/produtos/bel/camiseta_malha[3].webp	3
251	112	/produtos/bel/camiseta_gaivota[1].webp	1
252	112	/produtos/bel/camiseta_gaivota[2].webp	2
253	112	/produtos/bel/camiseta_gaivota[3].webp	3
254	113	/produtos/bel/saia_junina[1].webp	1
255	113	/produtos/bel/saia_junina[2].webp	2
256	113	/produtos/bel/saia_junina[3].webp	3
257	114	/produtos/bel/short_gaivota[1].webp	1
258	114	/produtos/bel/short_gaivota[2].webp	2
259	114	/produtos/bel/short_gaivota[3].webp	3
260	115	/produtos/bel/short[1].webp	1
261	115	/produtos/bel/short[2].webp	2
262	115	/produtos/bel/short[3].webp	3
274	118	/produtos/repiit/s25[4].jpg	4
273	118	/produtos/repiit/s25[3].jpg	3
272	118	/produtos/repiit/s25[2].jpg	2
271	118	/produtos/repiit/s25[1].jpg	1
270	117	/produtos/repiit/iPhone17[4].jpg	4
269	117	/produtos/repiit/iPhone17[3].jpg	3
268	117	/produtos/repiit/iPhone17[2].jpg	2
267	117	/produtos/repiit/iPhone17[1].jpg	1
266	116	/produtos/repiit/iPhone15[4].jpg	4
265	116	/produtos/repiit/iPhone15[3].jpg	3
264	116	/produtos/repiit/iPhone15[2].jpg	2
263	116	/produtos/repiit/iPhone15[1].jpg	1
275	119	/produtos/repiit/suporte[1].jpg	1
276	119	/produtos/repiit/suporte[2].jpg	2
277	120	/produtos/repiit/tripe[1].webp	1
278	120	/produtos/repiit/tripe[2].webp	2
279	120	/produtos/repiit/tripe[3].webp	3
280	121	/produtos/electree/notebook_gamer[1].webp	1
281	121	/produtos/electree/notebook_gamer[2].webp	2
282	121	/produtos/electree/notebook_gamer[3].webp	3
283	121	/produtos/electree/notebook_gamer[4].webp	4
284	122	/produtos/electree/placa_video[1].webp	1
285	122	/produtos/electree/placa_video[2].webp	2
286	122	/produtos/electree/placa_video[3].webp	3
287	122	/produtos/electree/placa_video[4].webp	4
288	123	/produtos/electree/memoria[1].webp	1
289	123	/produtos/electree/memoria[2].webp	2
290	123	/produtos/electree/memoria[3].webp	3
291	123	/produtos/electree/memoria[4].webp	4
292	124	/produtos/electree/monitor[1].webp	1
293	124	/produtos/electree/monitor[2].webp	2
294	124	/produtos/electree/monitor[3].webp	3
295	125	/produtos/electree/fonte[1].webp	1
296	125	/produtos/electree/fonte[2].webp	2
297	125	/produtos/electree/fonte[3].webp	3
298	130	/produtos/Level Up/monitor[1].webp	1
299	130	/produtos/Level Up/monitor[2].webp	2
300	130	/produtos/Level Up/monitor[3].webp	3
301	131	/produtos/Level Up/smat_tv[1].webp	1
302	131	/produtos/Level Up/smat_tv[2].webp	2
303	131	/produtos/Level Up/smat_tv[3].webp	3
304	132	/produtos/Level Up/mcbook[1].webp	1
305	132	/produtos/Level Up/macbook[2].webp	2
306	132	/produtos/Level Up/macbook[3].webp	3
307	132	/produtos/Level Up/macbook[4].webp	4
308	133	/produtos/Level Up/controle[1].webp	1
309	133	/produtos/Level Up/controle[2].webp	2
310	133	/produtos/Level Up/controle[3].webp	3
311	134	/produtos/Level Up/ps5[1].webp	1
312	134	/produtos/Level Up/ps5[2].webp	2
313	140	/produtos/beWell/ozempic[1].webp	1
314	141	/produtos/beWell/bandaid[1].webp	1
315	141	/produtos/beWell/bandaid[2].webp	2
316	142	/produtos/beWell/compressa[1].webp	1
317	142	/produtos/beWell/compressa[2].webp	2
318	143	/produtos/beWell/nebacetin[1].webp	1
319	143	/produtos/beWell/nebacetin[2].webp	2
320	144	/produtos/beWell/dipirona.webp	1
321	145	/produtos/beWell/loratadina.webp	1
322	146	/produtos/beWell/allegra[1].webp	1
323	146	/produtos/beWell/allegra[2].webp	2
324	142	/produtos/beWell/compressa[3].webp	3
325	142	/produtos/beWell/compressa[4].webp	4
326	147	/produtos/beWell/lencos[1].webp	1
327	147	/produtos/beWell/lencos[2].webp	2
328	147	/produtos/beWell/lencos[3].webp	3
329	148	/produtos/beWell/kit_viagem[1].webp	1
330	148	/produtos/beWell/kit_viagem[2].webp	2
331	148	/produtos/beWell/kit_viagem[3].webp	3
332	149	/produtos/beWell/gol[1].jpg	1
333	149	/produtos/beWell/gol[2].jpg	2
334	150	/produtos/beWell/kit_educativo[1].jpg	1
335	150	/produtos/beWell/kit_educativo[2].jpg	2
336	150	/produtos/beWell/kit_educativo[3].jpg	3
337	151	/produtos/beWell/montar[1].jpg	1
338	151	/produtos/beWell/montar[2].jpg	2
339	152	/produtos/beWell/buba[1].jpg	1
340	152	/produtos/beWell/buba[2].jpg	2
341	152	/produtos/beWell/buba[3].jpg	3
342	153	/produtos/beWell/coup[1].jpg	1
343	153	/produtos/beWell/coup[2].jpg	2
344	153	/produtos/beWell/coup[3].jpg	3
345	154	/produtos/beWell/monopoly[1].jpg	1
346	154	/produtos/beWell/monopoly[2].jpg	2
347	154	/produtos/beWell/monopoly[3].jpg	3
348	155	/produtos/beWell/gow[1].jpg	1
349	155	/produtos/beWell/gow[2].jpg	2
350	156	/produtos/beWell/quebra_cabeca[1].jpg	1
351	156	/produtos/beWell/quebra_cabeca[2].jpg	2
\.


--
-- Data for Name: lojas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lojas (id, usuario_id, nome, descricao, logo_url, banner_url, sticker_url, "createdAt", "updatedAt") FROM stdin;
1	1	CJR	A CJR é a Empresa Júnior de Computação da Universidade de Brasília (UnB), fundada em 1999. Simplesmente é a mais mais.	/lojas/lojas_perfil/cjr_logo.png	/lojas/lojas_banner/cjr_banner.webp	/lojas/lojas_perfil/cjr_logo.png	2026-06-16 06:49:41.591	2026-06-16 06:49:41.591
2	2	D'Carts and Baskets	O D'Carts and Baskets Shopping Mart é um mercado local, de propriedade familiar que vende alimentos locais, itens básicos de despensa, artigos para o lar e outros produtos essenciais do dia a dia.	/lojas/lojas_perfil/d'cartsBaskets_logo.png	/lojas/lojas_banner/d_cartsBaskets_banner.png	/lojas/lojas_perfil/d'cartsBaskets_logo.png	2026-06-16 06:56:34.993	2026-06-16 06:56:34.993
3	3	Maumar	O mercado que tem tudo o que você precisa! De alimentos frescos a produtos de limpeza, com preços justos e atendimento acolhedor.	/lojas/lojas_perfil/maumar_logo.png	/lojas/lojas_banner/maumar_banner.png	/lojas/lojas_perfil/maumar_logo.png	2026-06-16 07:09:32.079	2026-06-16 07:09:32.079
4	4	The Croc Brew	A loja do crocodilo mais estiloso! Cervejas artesanais, vinhos selecionados, refrigerantes premium e drinks prontos para qualquer ocasião.	/lojas/lojas_perfil/crocBrew_logo.png	/lojas/lojas_banner/crocBrew_banner.png	/lojas/lojas_perfil/crocBrew_logo.png	2026-06-16 07:10:29.041	2026-06-16 07:10:29.041
5	5	Whiskers	Um cantinho feito com amor para os felinos! Aqui você encontra ração premium, brinquedos, arranhadores e tudo que seu gato merece.	/lojas/lojas_perfil/whiskers_logo.png	/lojas/lojas_banner/whiskers_banner.png	/lojas/lojas_perfil/whiskers_logo.png	2026-06-16 07:12:27.793	2026-06-16 07:12:27.793
6	6	Dog Goods	Ração, biscoitos caninos, brinquedos e acessórios para deixar seu melhor amigo ainda mais feliz.	/lojas/lojas_perfil/dogGoods_logo.png	/lojas/lojas_banner/dogGoods_banner.png	/lojas/lojas_perfil/dogGoods_logo.png	2026-06-16 07:13:50.83	2026-06-16 07:13:50.83
9	9	Spicy	Temperos, especiarias e ingredientes exóticos para dar mais sabor à sua vida. O paraíso dos amantes da boa comida!	/lojas/lojas_perfil/spicy_logo.png	/lojas/lojas_banner/spicy_banner.png	/lojas/lojas_perfil/spicy_logo.png	2026-06-16 07:18:09.015	2026-06-16 07:18:09.015
10	10	Mini Reno	Transforme sua casa em um lar acolhedor. Móveis, objetos decorativos e itens de utilidade com estilo e funcionalidade.	/lojas/lojas_perfil/miniReno_logo.png	/lojas/lojas_banner/miniReno_banner.png	/lojas/lojas_perfil/miniReno_logo.png	2026-06-16 07:19:08.921	2026-06-16 07:19:08.921
11	11	Fluffly House	Conforto e aconchego para todos os cantos da sua casa. Almofadas, mantas, tapetes e muito mais para tornar seu espaço mais fofo.	/lojas/lojas_perfil/fluffyHouse_logo.png	/lojas/lojas_banner/fluffyHouse_banner.avif	/lojas/lojas_perfil/fluffyHouse_logo.png	2026-06-16 07:20:12.888	2026-06-16 07:20:12.888
12	12	Rare Beauty	Rare Beauty chega para desconstruir os padrões irreais de perfeição. Queremos empoderar nossa comunidade para desafiar normas de beleza, moldando conversas positivas sobre autoaceitação e saúde mental.	/lojas/lojas_perfil/rareBeauty_logo.png	/lojas/lojas_banner/rareBeauty_banner.png	/lojas/lojas_perfil/rareBeauty_logo.png	2026-06-16 07:22:52.617	2026-06-16 07:22:52.617
13	13	Creamy Skincare	Cuidados com a pele que fazem a diferença. Cremes, séruns e loções hidratantes para uma rotina de skincare perfeita.	/lojas/lojas_perfil/creamy_logo.png	/lojas/lojas_banner/creamy_banner.webp	/lojas/lojas_perfil/creamy_logo.png	2026-06-16 07:23:55.182	2026-06-16 07:23:55.182
14	14	Roots	Beleza natural e sustentável. Produtos feitos com ingredientes da natureza para realçar o que você tem de melhor.	/lojas/lojas_perfil/roots_logo.png	/lojas/lojas_banner/roots_banner.png	/lojas/lojas_perfil/roots_logo.png	2026-06-16 07:24:50.813	2026-06-16 07:24:50.813
15	15	Nalu	A combinação perfeita de beleza e nail art. Encontre esmaltes, produtos de manicure e tratamentos especiais para suas unhas.	/lojas/lojas_perfil/nalu_logo.png	/lojas/lojas_banner/nalu_banner.png	/lojas/lojas_perfil/nalu_logo.png	2026-06-16 07:26:52.329	2026-06-16 07:26:52.329
17	17	Amoca	Moda feminina com estilo e personalidade. Peças únicas que combinam tendência, conforto e o classico.	/lojas/lojas_perfil/amoca_logo.png	/lojas/lojas_banner/amoca_banner.png	/lojas/lojas_perfil/amoca_logo.png	2026-06-16 07:28:41.3	2026-06-16 07:28:41.3
18	18	FootShop	Moda feminina com estilo e personalidade. Peças únicas que combinam tendência, conforto e o classico.	/lojas/lojas_perfil/footshop_logo.png	/lojas/lojas_banner/footshop_banner.jpg	/lojas/lojas_perfil/footshop_logo.png	2026-06-16 07:29:51.841	2026-06-16 07:29:51.841
19	19	Melina Couture	Alta costura acessível com peças exclusivas para mulheres que amam se vestir bem.	/lojas/lojas_perfil/melina_logo.png	/lojas/lojas_banner/melina_banner.png	/lojas/lojas_perfil/melina_logo.png	2026-06-16 07:35:14.979	2026-06-16 07:35:14.979
20	20	Bel	Moda para os pequenos com muito charme. Roupas confortáveis, coloridas e super estilosas para bebês e crianças.	/lojas/lojas_perfil/bel_logo.png	/lojas/lojas_banner/bel_banner.png	/lojas/lojas_perfil/bel_logo.png	2026-06-16 07:36:17.625	2026-06-16 07:36:17.625
21	21	Repiit	Tecnologia para conectar você ao mundo. Smartphones, acessórios e gadgets de ponta com as melhores condições.	/lojas/lojas_perfil/repitt_logo.png	/lojas/lojas_banner/repitt_banner.png	/lojas/lojas_perfil/repitt_logo.png	2026-06-16 07:37:09.697	2026-06-16 07:37:09.697
24	24	Level-Up	Hardware, periféricos e software para gamers e profissionais que exigem o melhor desempenho.	/lojas/lojas_perfil/levelUp_logo.png	/lojas/lojas_banner/levelUp_banner.png	/lojas/lojas_perfil/levelUp_logo.png	2026-06-16 07:49:38.193	2026-06-16 07:49:38.193
26	26	Be Well	Saúde e bem-estar em primeiro lugar. Medicamentos, cuidados pessoais e dicas para você viver mais e melhor.	/lojas/lojas_perfil/beWell_logo.png	/lojas/lojas_banner/beWell_banner.png	/lojas/lojas_perfil/beWell_logo.png	2026-06-16 07:52:36.034	2026-06-16 07:52:36.034
22	22	Electree	Tudo em tecnologia para montar o seu setup ideal! PCs Gamer, workstations e peças de alta performance	/lojas/lojas_perfil/electree_logo.png	/lojas/lojas_banner/electree_banner.png	/lojas/lojas_perfil/electree_logo.png	2026-06-16 07:48:24.087	2026-06-17 06:24:39.941
28	28	Kuby	Brinquedos que encantam e desenvolvem. Peças interativas, jogos e colecionáveis para toda a família.	/lojas/lojas_perfil/kuby_logo.png	/lojas/lojas_banner/kuby_banner.png	/lojas/lojas_perfil/kuby_logo.png	2026-06-16 07:54:50.09	2026-06-16 07:54:50.09
30	30	Magic Chicken	A Magic Chicken é especializada em entretenimento digital. Oferecemos um catálogo variado de jogos para as plataformas.	/lojas/lojas_perfil/magicChicken_logo.png	/lojas/lojas_banner/magicChicken_banner.png	/lojas/lojas_perfil/magicChicken_logo.png	2026-06-16 08:08:06.764	2026-06-16 08:08:06.764
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, loja_id, categoria_id, nome, descricao, preco, estoque, "createdAt", "updatedAt") FROM stdin;
1	1	5	Brownie Meio Amargo	BROWNIE MEIO AMARGO 80g Recheado com uma ganache de chocolate meio amargo bem cremosa, esse brownie conquistou o coração de muita gente! Ingredientes: Achocolatado em pó, farinha de trigo enriquecida com ferro e ácido fólico, chocolate meio amargo, açúcar cristal, manteiga, água ,creme de leite, ovo em pó, glucose em pó, emulsificante: lecitina de soja, conservantes: sorbato de potássio, propionato de cálcio e conservante para doces (sal refinado sem iodo, açúcar refinado, conservantes INS 202 e INS 211 e acidulante INS 330) e antioxidante: sal não iodado, amido de milho, antioxidantes INS 321 e INS 319. CONTÉM GLÚTEN. CONTÉM LACTOSE. ALÉRGICOS: CONTÉM OVO E DERIVADOS DE LEITE, TRIGO E SOJA.	4.70	3	2026-06-17 00:29:08.261	2026-06-17 00:29:08.261
2	1	5	Brownie de Cookies	BROWNIE DE COOKIES 80g Feito com chocolate nobre da melhor qualidade, esse recheio com chocolate branco e biscoito é um sucesso! Ingredientes: Achocolatado em pó, farinha de trigo enriquecida com ferro e ácido fólico, chocolate branco, açúcar cristal, manteiga, água, creme de leite, ovo em pó, glucose em pó, biscoito moído em pó (farinha de trigo enriquecida com ferro e ácido fólico, açúcar, cacau, óleo vegetal de soja, amido, sal, farinha de aveia, farinha de centeio, corante caramelo IV fermentos químicos (bicarbonato de amônio, bicarbonato de sódio e fosfato monocálcico) e emulsificante lecitina de soja) emulsificante: lecitina de soja e conservantes: sorbato de potássio, propionato de cálcio e conservante para doces (sal refinado sem iodo, açúcar refinado, conservantes INS 202 e INS 211 e acidulante INS 330). CONTÉM GLÚTEN. CONTÉM LACTOSE. ALÉRGICOS: CONTÉM OVO E DERIVADOS DE LEITE, TRIGO, CENTEIO, AVEIA E SOJA.	4.70	0	2026-06-17 00:31:12.383	2026-06-17 00:31:12.383
3	1	5	Brownie de Doce de Leite	BROWNIE DE DOCE DE LEITE 80g Recheado com doce de leite da melhor qualidade, esse brownie é um dos queridinhos da galera! Ingredientes: Achocolatado em pó, farinha de trigo enriquecida com ferro e ácido fólico, doce de leite (leite integral e/ou leite em pó integral reconstituído, açúcar, cloreto de sódio, lactose e conservante sorbato de potássio), açúcar cristal, manteiga, água, ovo pasteurizado desidratato, emulsFicante: lecitina de soja, conservantes: propionato de cálcio e sorbato de potássio e antioxidantes: ins 321 e ins 319. CONTÉM GLÚTEN. CONTÉM LACTOSE. ALÉRGICOS: CONTÉM OVO E DERIVADOS DE LEITE, TRIGO E SOJA.	4.70	7	2026-06-17 00:32:07.346	2026-06-17 00:32:07.346
4	1	5	Brownie de M&M's	BROWNIE DE M&M's 875g Esse brownie é mais uma das nossas criações. Produzido  com M&M's e ganache meio amargo não tinha como dar errado! Ingredientes: Achocolatado em pó, farinha de trigo enriquecida com ferro e ácido fólico, chocolate M&M - confeitos de chocolate ao leite colorido artificialmente (açúcar, massa de cacau, leite em pó, gordura vegetal, xarope de glucose, manteiga de cacau, amido de milho, dextrina, sal, espessante (goma arábica), corante inorgânico dióxido de titânio, emulsificantes (lecitina de soja e poliglicerol polirricinoleato), corantes artificiais (amarelo crepúsculo, tartrazina, vermelho 40 e azul brilhante), corante natural cúrcuma e aromatizantes), açúcar cristal, manteiga, água, chocolate meio amargo, creme de leite, ovo em pó, glucose em pó, emulsificante: lecitina de soja, conservantes: sorbato de potássio, propionato de cálcio e conservante para doces (sal refinado sem iodo, açúcar refinado, conservantes INS 202 e INS 211 e acidulante INS 330) e antioxidante : sal não iodado, amido de milho, antioxidantes INS 321 e INS 319. CONTÉM GLÚTEN. CONTÉM LACTOSE. ALÉRGICOS: CONTÉM OVO E DERIVADOS DE LEITE, TRIGO E SOJA. PODE CONTER AMENDOIM, CENTEIO, CEVADA E AVEIA.	4.70	2	2026-06-17 00:33:23.087	2026-06-17 00:33:23.087
5	1	5	Brownie Tradicional	BROWNIE TRADICIONAL DE 65g Essa é a nossa massa e é com ela que fabricamos todos os outros sabores. Utilizamos os melhores ingredientes e o resultado não poderia ser diferente: uma massa chocolatuda que derrete na boca! Ingredientes: Achocolatado em pó, farinha de trigo enriquecida com ferro e ácido fólico, açúcar cristal, manteiga, ovo pasteurizado desidratato, emulsificante: lecitina de soja e conservantes: sorbato de potássio e propionato de cálcio. CONTÉM GLÚTEN. CONTÉM LACTOSE. ALÉRGICOS: CONTÉM OVO E DERIVADOS DE LEITE, TRIGO E SOJA.	3.80	0	2026-06-17 00:34:31.402	2026-06-17 00:34:31.402
17	2	5	Farinha Trigo	Farinha de Trigo Tradicional Dona Benta 1Kg. A Farinha de Trigo Tradicional Dona Benta é a escolha ideal para garantir o sucesso de suas receitas diárias. Com excelente pureza e textura fina, ela proporciona leveza e maciez incomparáveis ao preparar pães, bolos, tortas e salgados. É o ingrediente indispensável para obter consistência perfeita em pratos doces e salgados na sua cozinha. ALÉRGICOS: CONTÉM DERIVADOS DE TRIGO. PODE CONTER CENTEIO, CEVADA, AVEIA E SOJA.	7.69	11	2026-06-17 01:13:31.156	2026-06-17 01:13:31.156
18	3	2	Abacate	Abacate Orgânico Unidade. O Abacate Orgânico é uma fruta rica em gorduras saudáveis, fibras, vitaminas e minerais, essencial para uma alimentação equilibrada. Fonte natural de ácido oleico, ajuda a reduzir o colesterol ruim e promove a saúde cardiovascular. Além disso, contém vitaminas A, C, E, K e do complexo B, que auxiliam no fortalecimento do sistema imunológico, saúde da pele e digestão. Seu consumo contribui para a sensação de saciedade, sendo ideal para controle de peso. Cultivado sem pesticidas, é uma escolha saudável e sustentável. Aproveite o sabor e benefícios do Abacate Orgânico. Compre agora! Alérgicos: Produto natural, sem glúten e sem alergênicos declarados.	6.74	21	2026-06-17 01:14:50.42	2026-06-17 01:14:50.42
19	3	2	Batata Doce	Batata Doce Unidade. A Batata Doce Unidade é uma excelente fonte de carboidratos complexos, que fornecem energia de forma gradual, contribuindo para a sensação de saciedade e controle da glicemia. Rica em fibras, vitaminas B e C, betacaroteno (precursor da vitamina A) e minerais como potássio, auxilia na saúde dos olhos, do intestino e do sistema imunológico. Versátil, pode ser consumida assada, cozida ou em purês, combinando sabor adocicado com benefícios para o corpo. Ideal para quem busca uma alimentação nutritiva e equilibrada no dia a dia. Alergênicos: Produto natural, não contém glúten nem alergênicos comuns.	1.74	30	2026-06-17 01:16:42.952	2026-06-17 01:16:42.952
20	3	2	Mamão	Mamão Papaia Unidade. O Mamão Papaia Unidade é uma fruta tropical nutritiva e saborosa, conhecida por sua polpa macia, doce e suculenta. Rico em fibras, vitaminas A, C e antioxidantes, ajuda na digestão, no fortalecimento do sistema imunológico e no combate aos radicais livres. Ideal para consumo in natura, sucos, saladas de frutas e sobremesas, é um alimento leve e refrescante para o dia a dia. Conservá-lo em local fresco e consumir preferencialmente maduro garante melhor sabor e textura.	5.14	10	2026-06-17 01:18:15.938	2026-06-17 01:18:46.283
6	1	4	Redbull Melancia	RED BULL TE DÁ ASAS. QUANDO BEBER O Red Bull Energy Drink é apreciado em todo o mundo por atletas de elite, profissionais dinâmicos, estudantes ativos e motoristas em viagens longas. O QUE EXISTE DENTRO DA LATA Cafeína: A cafeína já era conhecida por seus efeitos estimulantes pelas civilizações antigas, que a consumiam a partir de fontes naturais como o chá, café grãos de cacau e noz de cola. Taurina: Taurina é um aminoácido natural do corpo humano, que está presente na dieta diária das pessoas e está envolvida numa vasta gama de processos biológicos. Vitaminas do grupo B: As vitaminas são micronutrientes essenciais necessários para manter as funções normais do organismo. Açúcares: Red Bull Energy Drink é feito com açúcar proveniente da beterraba. Água das fontes Alpinas: Naturalmente, a água é um ingrediente crucial da Red Bull. Ingredientes: Agúa gaseificada, glucose, sacarose, taurina (1000mg/250ml),cafeína (80mg/250ml), vitaminas (B3,B5,B6e B12),acidulante ácido cítrico, regulador de acidez:citrato de sódio,aromatizantes, corante natural antocianinas (de frutas e hortaliças) e corante artificial azul brilhante FCF.	5.41	0	2026-06-17 00:37:11.488	2026-06-17 00:38:29.898
7	1	4	Redbull Pomelo	Chegou o novo sabor do energético Red Bull que vai te dar a energia que você precisa, sem açúcar! O Red Bull Pomelo traz uma combinação única e refrescante do sabor cítrico da fruta pomelo com a energia potente que só a Red Bull oferece. Perfeito para quem busca manter o foco, a disposição e o ânimo durante o dia, seja no trabalho, nos estudos ou nos treinos. Lata de 250ml: Ideal para te acompanhar onde quer que você vá. Sem Açúcar: Para quem quer energia sem comprometer a dieta. Novo sabor exclusivo: Uma explosão de frescor e sabor cítrico. Aumento de energia e concentração: Ideal para quem precisa de um boost durante o dia.	5.41	4	2026-06-17 00:40:28.141	2026-06-17 00:40:28.141
8	1	4	Redbull Zero	Energetico Red Bull Zero 250ml O energético Red Bull Zero 250ml é uma opção sem açúcar desenvolvida para quem busca energia e foco sem abrir mão de um consumo mais equilibrado. Sua fórmula contém ingredientes como cafeína, taurina, vitaminas do complexo B e adoçantes que substituem o açúcar, garantindo o sabor característico da marca. Ideal para momentos de estudo, trabalho ou atividades que exigem maior concentração e disposição. A embalagem de 250ml é prática e pode ser transportada facilmente no dia a dia. Principais Ingredientes: Cafeína, taurina, vitaminas do complexo B, adoçantes Indicação de Uso: Consumo moderado para suporte de energia e foco	5.41	1	2026-06-17 00:41:42.275	2026-06-17 00:41:42.275
9	1	4	Redbull	Energético Red Bull Tradicional 355ml. A fórmula especial do Red Bull Energy Drink contém ingredientes da mais alta qualidade: Cafeína, Taurina, Vitaminas do grupo B, Açúcares, água das fontes Alpinas. Uma lata de 250 ml de Red Bull Energy Drink contém 80 mg de cafeína, aproximadamente a mesma quantidade de uma xícara de café. A quantidade de açúcar no Red Bull é equivalente a quantidade de açúcar de 100ml de suco de maçã ou laranja. As latas do Red Bull são feitas de alumínio 100% reciclável. Vitaliza mente e corpo.	5.41	11	2026-06-17 00:42:48.671	2026-06-17 00:42:48.671
10	2	3	Arroz Branco	Arroz Branco Tio João Grãos Nobres 5Kg. A qualidade do Arroz Tio João 100% Grãos Nobres nasce já na lavoura, com o mais rigoroso cuidado na plantação e colheita. Depois os grãos passam por processos de seleção e beneficiamento de alta tecnologia, onde são escolhidas somente as variedades mais nobres, tudo para garantir um arroz perfeito e de excelente rendimento. Sempre soltinho e branquinho, o produto une sabor, qualidade e inovação com a excelência que os brasileiros merecem - é a marca premium da Josapar.	33.99	20	2026-06-17 00:46:35.899	2026-06-17 00:46:35.899
11	2	5	Leite Condensado	Leite Condensado MOÇA Integral Lata 395g. Descubra o sabor único e original de Moça que faz tudo dar certo desde 1921. Leite Moça é perfeito para consumo direto, mas também é a estrela das receitas mais deliciosas, como pudins, bolos, brigadeiros e muito mais. Com Moça, você experimenta +sabor, +rendimento e +consistência, tornando-se a escolha ideal para você. Deixe Moça transformar suas criações culinárias em verdadeiras obras-primas.	8.49	4	2026-06-17 00:48:50.343	2026-06-17 00:48:50.343
12	2	5	Chocolate	Chocolate ao Leite Lacta 145g. O chocolate ao leite Lacta é conhecido por seu sabor suave e marcante, e agora em uma barra de 145g, garantindo um suprimento generoso desse sabor único. O verdadeiro sabor do chocolate ao leite tamanho família Lacta 145g, uma deliciosa barra de chocolate que traz a doçura e a cremosidade que você tanto ama! Com a qualidade incomparável da marca Lacta, essa barra de chocolate ao leite é perfeita para quem deseja uma experiência gastronômica inigualável. Chocolate ao Leite Lacta 145g, perfeito para compartilhar momentos especiais com família e amigos. Com a cremosidade certa para que o chocolate derreta lentamente na boca, o chocolate ao leite Lacta oferece uma experiência saborosa e marcante. A cremosidade de Lacta ao leite agora em tamanho para compartilhar. Ingredientes: Açúcar, leite em pó integral, massa de cacau, manteiga de cacau, soro de leite em pó, gordura vegetal, gordura de manteiga desidratada, emulsificantes: lecitina de soja e poliglicerol polirricinoleato e aromatizante.	9.99	8	2026-06-17 00:50:37.251	2026-06-17 00:50:37.251
13	2	4	Coca-Cola	Refrigerante Coca-Cola Lata 350ml. Com sabor inconfundível e único, a Coca-Cola Original é o refrigerante mais tradicional e consumido no mundo inteiro! Toda Coca-Cola Original é produzida especialmente para manter sempre a qualidade do melhor sabor de refrigerante! Uma Lata de Coca-Cola Original 350ml é perfeita para matar sua sede a qualquer hora do dia!	3.50	46	2026-06-17 00:52:37.156	2026-06-17 00:52:37.156
14	2	4	Leite	Leite Integral ITALAC 1 Litro. Ingredientes: Leite integral, vitaminas A e D, estabilizante citrado de sódio e/ou trifosfato de sódio, monofosfato monossódio e difosfato dissódio.	5.99	16	2026-06-17 00:54:01.55	2026-06-17 00:54:01.55
15	2	3	Manteiga	A Manteiga em Tablete com Sal Président 200g oferece sabor autêntico e textura cremosa, ideal para acompanhar pães, torradas e receitas do dia a dia. Produzida com ingredientes selecionados, realça o sabor dos alimentos e é perfeita para quem busca praticidade e qualidade na cozinha. Embalada em tablete, facilita o uso e o armazenamento, preservando o frescor. Experimente em preparos culinários ou no café da manhã. Produto tradicional, reconhecido por seu sabor marcante e consistência. Alérgicos: Contém leite e derivados. Pode conter traços de soja e derivados	14.99	26	2026-06-17 00:56:21.563	2026-06-17 00:56:21.563
16	2	2	Nozes	Brasil Frutt Nozes Mariposa pacote 160g. Nozes sem casca tipo Mariposa Extra Light .E que ajudam na redução do colesterol e na perda de peso; além disso, as nozes previnem insônia, depressão e ansiedade e evitam a desidratação do corpo, deixando a pele e os cabelos mais saudáveis. Ingredientes: Nozes Alérgico: contém nozes e pode conter amendoim, soja, amêndoa, avelãs, castanha de caju, castanha do pará, macadâmias, pecãs e pistaches.	21.89	13	2026-06-17 00:58:29.364	2026-06-17 00:58:29.364
145	26	9	Loratadina	O que é e para que serve o Loratadina 10Mg 12 Comprimidos Cimed Genérico? Loratadina é um medicamento indicado para o alívio dos sintomas de rinite alérgica, como coceira nasal, coriza, espirros, ardor e coceira nos olhos. Também é utilizado para tratar os sinais e sintomas de urticária e outras alergias da pele.	8.99	33	2026-06-17 07:18:19.755	2026-06-17 07:18:19.755
21	3	2	Melancia	Melancia Pedaço. A Melancia Pedaço é uma fruta refrescante e nutritiva, composta por mais de 90% de água, ideal para hidratar o corpo e oferecer saciedade com poucas calorias. Rica em licopeno, um antioxidante que ajuda a reduzir o colesterol e proteger contra o envelhecimento celular, além de conter vitaminas A e C que fortalecem o sistema imunológico e melhoram a saúde da pele. Perfeita para consumo in natura, sucos, saladas e sobremesas. Aproveite seu sabor doce e suculento em qualquer momento do dia. Alergênicos: não contém alergênicos conhecidos.	14.97	15	2026-06-17 01:21:59.471	2026-06-17 01:21:59.471
22	3	2	Mexerica	Mexerica Orgânica Bandeja. A Mexerica Orgânica Bandeja é a escolha ideal para quem busca o verdadeiro sabor da fruta colhida no tempo certo e cultivada de forma sustentável. Totalmente livre de agrotóxicos e adubos químicos, ela preserva seus nutrientes vitais, minerais e alto teor de vitamina C. Apresentada em embalagem prática que protege o produto, é perfeita para o consumo in natura, lanches rápidos dos valores diários ou para compor sucos naturais com muita praticidade e frescor. alérgicos: produto natural. Leve mais saúde para a sua rotina e compre já!	7.99	4	2026-06-17 01:22:42.546	2026-06-17 01:22:42.546
23	3	3	Ovos	Ovos Orgânicos Caipira Grandes Fazenda da Toca com 10 unidades. Os Ovos Orgânicos Caipira Grandes Fazenda da Toca com 10 unidades combinam sustentabilidade, frescor e alta qualidade nutricional. Produzidos por galinhas criadas livres de gaiolas e alimentadas com ração 100% orgânica, livre de transgênicos e componentes químicos, apresentam gemas de coloração intensa e sabor autêntico. São ideais para receitas refinadas ou para enriquecer suas refeições diárias de forma natural. Alérgicos: Contém ovos. Para informações detalhadas sobre o lote, consulte o rótulo do produto. Adicione ao carrinho e garanta os seus!	16.99	12	2026-06-17 01:23:26.12	2026-06-17 01:23:26.12
24	3	2	Uva Verde	Uva Verde sem Semente Natural da Terra 500g. Uva Verde sem Semente Natural da Terra 500g é uma fruta fresca e saborosa, ideal para quem busca praticidade e nutrição no dia a dia. Livre de sementes, proporciona uma experiência agradável ao paladar, perfeita para lanches, saladas e receitas variadas. Rica em antioxidantes, vitaminas e fibras, ajuda na hidratação e no fortalecimento do sistema imunológico. Cultivada naturalmente, garante qualidade e frescor direto do produtor para sua mesa. Produto perfeito para uma alimentação saudável e equilibrada. Atenção: pode conter traços naturais de alergênicos comuns do ambiente agrícola.	15.99	2	2026-06-17 01:24:21.31	2026-06-17 01:24:21.31
25	4	4	Água	Água Mineral Lindoia Premium Lata Sem Gás 355ml. O engarrafamento ocorre em um local privilegiado, cercado por mata nativa preservada, sendo que dois terços da propriedade são classificados como Área de Proteção Ambiental, assegurando total cuidado com o meio ambiente. A água é extraída de um poço artesiano com 150 metros de profundidade, captada diretamente do lençol artesiano, com vazão natural, o que garante pureza e proteção contra infiltrações superficiais e efeitos da sazonalidade. Para assegurar a excelência em todas as etapas, a Lindóia Premium conta com laboratórios próprios, onde são realizadas análises microbiológicas diárias, garantindo segurança, pureza e qualidade constantes.	2.99	20	2026-06-17 02:22:45.273	2026-06-17 02:22:45.273
26	4	4	Água Tônica	Água Tonica Pink Limonade St. Pierre - 270ml. A Água Tônica Pink Lemonade St. Pierre combina a refrescância da tônica com o toque adocicado e cítrico da pink lemonade. Ingredientes: Água gasefiacada, açúcar, suco de limão, aroma natural de limão siciliano, aroma sintético idêntico ao natural de pink rasberry, acidulante INS 330 E INS 334, conservadores INS 211 E IN 202 regulador de acidez INS 311iii, sequestrante INS 385 e corante INS 129. Não contém glúten.	4.90	24	2026-06-17 02:24:03.717	2026-06-17 02:24:03.717
27	4	4	Refrigerante	Refrigerante St. Pierre Paloma Lata. Experimente o sabor refrescante e sofisticado do Refrigerante Grapefruit Paloma St. Pierre. Combinando o amargor delicado do grapefruit e o frescor vibrante da lima, essa bebida com 0,5% de suco de fruta é a escolha perfeita para quem busca uma opção cítrica, leve e deliciosa para qualquer ocasião. Bebida não Alcoólica. Contém 270ml. Refrigerante Fabricado no Brasil.	4.99	29	2026-06-17 02:25:24.776	2026-06-17 02:25:24.776
29	5	42	Petiscos	Petisco sabor leite para gatos. O chefe agora é chef! A Cozinha CDSG chegou e os petiscos são só o começo. Eles vão virar os favoritos do seu gato, eu garanto! Disponíveis em 5 sabores irresistíveis: frango, carne, salmão, leite e requeijão. Indicado para gatos adultos. Cada pacote contém 40g.	5.59	7	2026-06-17 02:32:59.715	2026-06-17 02:32:59.715
30	5	42	Brinquedo catnip	Brinquedo de catnip Presas. Todo gato é um predador por natureza e qualquer objeto pode ser uma presa em potencial. Por isso eu criei uma coleção delas: são 10 brinquedos colecionáveis em formato de animais e comidas, todos recheados com 2g do melhor catnip para deixar seu gato ainda mais animado com a brincadeira. As Presas fazem aquele barulho de krek-krek, igual ao som de embalagem de plástico que os gatos adoram morder, apertar e perseguir. 	34.99	3	2026-06-17 02:35:42.896	2026-06-17 02:35:42.896
31	5	42	Areia higiênica	Areia higiênica biodegradável para gatos 4kg grãos finos. A minha areia higiênica oferece o melhor para os gatos e para os humanos! Torrão firme: ela forma torrões firmes rapidamente, o que facilita a limpeza. Controle de odor: tem ótimo controle de odor e não deixa a casa com mal cheiro. 100% natural e biodegradável: é feita de milho e mandioca, sem aditivos químicos. Melhor rendimento: ela rende mais e tem ótimo custo-benefício.	66.99	6	2026-06-17 02:37:17.082	2026-06-17 02:37:27.899
32	6	42	Peitoral	Peitoral para cães grande macio e confortável. Feito de tecido macio e durável e equipado com um design brilhante e divertido Scooby Doo, este arnês Scooby-Doo fará seu animal de estimação uivar, 'Scooby Dooby Doo!' Deslize facilmente este peitoral para cães no corpo do seu cão e leve-o para passeios divertidos e aventureiros pela cidade! Ótimos para brincar ou caminhadas diárias, os arreios para cães são uma ótima maneira de manter seu animal de estimação com uma ótima aparência e permanecer seguro.	88.69	10	2026-06-17 02:45:40.732	2026-06-17 02:45:40.732
33	6	42	Scooby Snacks	Coragem em formato de biscoito!Não deixe que os fantasmas, monstros ou corredores assustadores tirem a paz do seu melhor amigo. O Scooby Snacks é o petisco de recompensa definitivo, clinicamente comprovado por Dogue Alemães para fornecer um aumento instantâneo de 110% na coragem e motivar qualquer cão a investigar portas trancadas e armários escuros. Ofereça 1 ou 2 Scooby Snacks sempre que o seu cão se deparar com uma situação assustadora ou precisar resolver um mistério.Aviso: Pode causar um leve aumento na velocidade de corrida ao fugir de vilões mascarados.	25.90	1	2026-06-17 02:49:17.856	2026-06-17 02:49:17.856
34	6	42	Ração	A Ração Seca Fórmula Natural Fresh Meat Cães Adultos Raças Mini e Pequena tem como grande diferencial a utilização de diferentes cortes de carne, uma variedade de frutas e vegetais e sem a utilização de grãos - “grain free”. Além disso, sua receita fornece nutrientes que atendem as necessidades de forma equilibrada, dos cães adultos de porte miniatura e pequeno. A embalagem I'm Green, foi desenvolvida em polietileno verde, com o sistema VELCRO® nas versões de 1 Kg e 2,5 Kg. O sistema de fechamento PRESS-LOK® facilita o abrir e fechar do manuseio diário. A linha Fórmula Natural Fresh Meat foi desenvolvida por médicos veterinários utilizando os conceitos mais avançados de nutrição para sua elaboração.	45.90	0	2026-06-17 02:51:50.627	2026-06-17 02:51:50.627
43	9	3	Pimenta do Reino	A Pimenta do Reino Preta com Moedor Natural da Terra 50g oferece praticidade e frescor para a finalização de seus pratos. O mecanismo de moagem ajustável permite que os grãos sejam moídos no momento do consumo, preservando a intensidade do aroma e as propriedades sensoriais da especiaria. Ideal para temperar carnes, caldos e saladas, este produto é um item essencial para uma culinária refinada e eficiente. Eleve o padrão de suas receitas com este tempero selecionado. Compre agora.	27.60	2	2026-06-17 03:13:28.562	2026-06-17 03:13:28.562
44	9	3	Pimenta Malagueta	A Pimenta Malagueta é um dos maiores clássicos da gastronomia brasileira. Conhecida por seu sabor vibrante e ardência imediata, é o segredo para transformar moquecas, acarajés, feijões e molhos caseiros em verdadeiras experiências culinárias. É rica em vitamina C e capsaicina, substância que acelera o metabolismo e possui propriedades antioxidantes. Nível de Ardência: Alta. Entre 50.000 e 100.000 SHU na Escala Scoville.Sabor: Picante, com notas levemente frutadas e ácidas.	15.00	0	2026-06-17 03:14:46.526	2026-06-17 03:14:46.526
45	9	3	Pimenta Biquinho	A Pimenta Biquinho é a escolha perfeita para quem deseja todo o aroma e o sabor característico das pimentas brasileiras, mas sem a ardência. Com formato clássico de gota e uma coloração vibrante, ela adiciona um toque gourmet a qualquer prato. Ardência Zero: Classificação na Escala Scoville de 0 a 500 SHU. Pode ser consumida até in natura por toda a família.Sabor: Suave e levemente adocicado.Versatilidade na Cozinha: Ideal para compor saladas, geleias, pratos com carnes e peixes, além de ser o aperitivo perfeito para tábuas de frios.	0.50	12	2026-06-17 03:15:57.191	2026-06-17 03:15:57.191
46	9	3	Lemon Pepper	Transforme qualquer refeição simples em uma experiência gastronômica!O nosso Tempero Lemon Pepper é a combinação perfeita entre o frescor cítrico do limão e a leve picância da pimenta-do-reino. É o toque final que faltava para realçar o sabor natural dos seus pratos de forma prática e aromática. Ingredientes: Sal, pimenta-do-reino, cebola granulada, cúrcuma, óleo vegetal, realçador de sabor glutamato monossódico, acidulante ácido cítrico e aroma idêntico ao natural de limão.	27.50	1	2026-06-17 03:16:59.368	2026-06-17 03:16:59.368
47	9	5	Tempero Heinz	O Tempero para Batata Frita Frasco Heinz 70g foi criado para deixar suas batatas ainda mais saborosas e crocantes. Com uma combinação equilibrada de especiarias e ervas selecionadas, realça o sabor natural das batatas e transforma qualquer lanche em uma experiência cheia de sabor. Ideal para usar em batatas fritas, assadas ou rústicas, basta salpicar sobre o preparo pronto e aproveitar. Prático e fácil de usar, é perfeito para quem gosta de temperar na medida certa. Dê um toque extra de sabor Heinz nas suas receitas. Alérgicos: contém derivados de soja. Pode conter trigo e mostarda.	19.89	6	2026-06-17 03:18:14.668	2026-06-17 03:18:14.668
48	10	38	Tapete Caramelo	Dê um toque de charme e conforto à sua casa com este elegante tapete! Pensado para transformar qualquer ambiente com modernidade, sua paleta em tons caramelos combinados à base crua resulta em uma peça versátil e cheia de estilo. Com medidas de 1,40 x 2,00 metros e produzido com 70% algodão e 30% poliéster, é perfeito para salas de estar, salas de jantar, quartos ou escritórios, uma peça valorizada pelo acabamento bem trabalhado e pela agradável sensação de conforto que proporciona. Na parte inferior, conta com uma base antiderrapante, oferecendo uma maior aderência a pisos frios de cerâmica. Prático e funcional, pode ser lavado à máquina em água fria, no modo delicado, assim preservando suas cores e mantendo a durabilidade do tecido por mais tempo.	78.49	23	2026-06-17 03:21:50.367	2026-06-17 03:21:50.367
49	10	39	Estante de Livros	Com design contemporâneo, a Estante de Livros 61cmx183cm é ideal para compor a decoração de diversos cômodos, levando funcionalidade e praticidade para a organização do ambiente. Possui prateleiras móveis, que permitem regular o espaço e acomodar objetos maiores. O produto possui sistema anti-tombamento, que garante segurança e evita riscos de acidentes.	249.98	27	2026-06-17 03:24:20.889	2026-06-17 03:24:20.889
50	10	37	Sofá	Descubra a elegância e conforto do Sofá 3 Lugares Beny, uma harmonia elegante de estilo e qualidade. A estrutura possui madeira pinus, que além de resistente, é proveniente de reflorestamento e, portanto, ecologicamente correta. O revestimento em tecido linho adiciona um toque requintado, seja na sala de estar ou escritório, esta poltrona é a escolha perfeita para unir design refinado e conforto excepcional. Especificações: Estrutura em madeira de reflorestamento. Revestimento em Tecido Linho. Espuma de Assento D-28. Dimensões: Altura: 82 cm. Largura: 180 cm. Profundidade: 80 cm	799.00	11	2026-06-17 03:25:55.279	2026-06-17 03:25:55.279
51	10	40	Geladeira	A Geladeira Electrolux Frost Free Inverter 480L Efficient AutoSense 3 Portas Inox Look (IM7S) é a geladeira ideal para a sua cozinha. Possui 3 portas, design inovador e compacto com apenas 70 cm de largura e as tecnologias mais avançadas do mercado. Você pode desfrutar de alimentos mais frescos e deliciosos, enquanto contribui para um consumo mais consciente e sustentável. A Gaveta HortiNatura possui uma vedação especial que preserva o frescor de frutas e vegetais por até 2x mais tempo, garantindo a umidade ideal para manter o frescor desses alimentos. A Tecnologia Inverter garante as condições ideais para preservar seus alimentos, mantendo a temperatura mais estável e evitando picos de energia. Além disso, oferece uma economia de até 30% de energia com classificação energética C. Todas essas tecnologias estão presentes na geladeira IM7S que tem um design inovador Fit the home com 3 portas e apenas 70cm de largura. Ideal para você que tem um espaço mais compacto, mas não abre mão de uma cozinha premium.	5555.26	0	2026-06-17 03:30:42.865	2026-06-17 03:30:42.865
52	11	38	Capa Almofada	A capa para almofada Discover é ideal para transmitir identidade ao ambiente. Com detalhes em textura que enriquecem o ambiente, a peça assume o papel de protagonista na decoração. Seu design, marcado por formas orgânicas e contrastes de cor, cria uma composição visual equilibrada e cheia de personalidade. Uma proposta prática e cheia de estilo para renovar o décor com leveza e autenticidade.	179.90	4	2026-06-17 03:35:57.543	2026-06-17 03:35:57.543
53	11	38	Escova para Banheiro	A Linha Forge é a escolha ideal para quem busca uma estética e utilidade na hora de decorar o banheiro ou lavabo. Confeccionada em concreto com acabamento em pintura, cada peça, que são vendidas separadamente, traz a robustez e a textura característica deste material, conferindo uma personalidade especial ao décor. Com design regional e acabamento impecável, os itens da linha Forge unem durabilidade e sofisticação em uma paleta de cores sóbria. A coleção foi pensada para otimizar o espaço com um toque de vanguarda, transformando a bancada em um ambiente de estilo marcante e funcional.	129.90	26	2026-06-17 03:37:16.447	2026-06-17 03:37:16.447
54	11	39	Pote Hermético	A linha Acácia é literalmente bela por natureza. Ela traz práticos acessórios para servir à mesa, preparar alimentos e, de quebra, decorar a sua casa. Todos os itens da linha são desenvolvidos com design atemporal e valorizados por fortes veios naturais. Os potes Acácia são confeccionados em vidro borossilicato, que permite ver o que está armazenado sem precisar abrir o recipiente, além de auxiliar ainda mais na durabilidade das propriedades dos alimentos.	39.90	0	2026-06-17 03:38:18.69	2026-06-17 03:38:18.69
56	11	40	Saleiro	Um clássico revisitado. O saleiro Areial é confeccionado em cerâmica com tampa em bambu; materiais de boa qualidade e durabilidade. Ideal para trazer um toque mais delicado à sua bancada, esta peça possui cor neutra que pode ser facilmente combinada com outros itens.	79.00	9	2026-06-17 03:41:16.649	2026-06-17 03:41:16.649
57	11	37	Cama Infantil	O seu quartinho ficará ainda mais charmoso com a nossa Cama Montessoriana Casinha. O conceito Montessori traz o melhor do estilo para o quarto de bebê ou infantil. Um conceito lúdico paraestimular a autonomia e aperfeiçoar o potencial criativo das crianças desde a primeira infância. Com grades laterais deproteção móveis e que permitem serem movimentadas ou trocadas de posição, garantindo praticidade e segurança.Telhadinho com cantos arredondados, propiciando também maior segurança. Opcional em 3 combinações de cores,confira! O produto é entregue desmontado. Colchão indicado: Solteiro 188 x 78cm.	819.98	37	2026-06-17 03:43:03.356	2026-06-17 03:43:03.356
58	12	12	Base Liquida	True to Myself é a mais nova base Rare Beauty com acabamento matte e cobertura média a alta. Garantindo pele suave e redução da aparência dos poros por até 12 horas, é resistente ao suor, umidade e transferência. Enriquecida com True Comfort Complex™ (blend de hialuronato de sódio, raiz de gengibre e extrato de algas), ajuda a reforçar a barreira cutânea e hidratar a pele por até 8 horas. Construível, confortável, não comedogênica, sem parabenos e ideal para peles normais, oleosas e mistas. Disponível em 48 tons.	289.00	0	2026-06-17 03:47:41.669	2026-06-17 03:47:41.669
59	12	12	Pó Bronzeador	Um pó bronzeador ultrassuave e de longa duração, com acabamento matte difuso que proporciona à pele um efeito naturalmente aquecido pelo sol durante todo o ano. Ingredientes em destaque: Óleo de Semente de Tomate: acalma a pele, reduz a vermelhidão visível e ajuda a proteger contra agressões ambientais. Destaques da fórmula: Livre de parabenos, formaldeídos, agentes liberadores de formaldeído, ftalatos, óleo mineral, palmitato de retinila, oxibenzona, alcatrão de carvão, hidroquinona, sulfatos SLS e SLES, triclocarban e triclosan. Contém menos de 1% de fragrância sintética. Além disso, é vegano, sem glúten e cruelty-free.	239.00	32	2026-06-17 03:50:43.722	2026-06-17 03:50:43.722
61	12	14	Mousse de Hidratação	Uma mousse leve e aerada que se transforma em um óleo ultraleve, absorvendo em segundos e secando rapidamente — sem escorrer, sem bagunça, sem sensação oleosa (e sem deixar resíduos em roupas ou lençóis).Sua fórmula profundamente hidratante repõe a hidratação da pele desidratada e ajuda a reter a umidade, proporcionando uma sensação suave e macia, além de um brilho radiante que deixa a pele com aparência mais tonificada e definida. Enriquecida com folha de amora rica em antioxidantes, niacinamida e extratos de frutas, que ajudam a firmar visivelmente a pele, restaurar a hidratação e melhorar sua elasticidade. Infundida com nossa nova fragrância Feel Seen, com notas de melão honeydew maduro, lírio-do-vale orvalhado e musgo marinho refrescante, evocando a sensação de um dia perfeito à beira-mar.	279.00	17	2026-06-17 03:53:19.114	2026-06-17 03:53:19.114
62	12	12	Mini Blush	Transforme sua maquiagem com o Mini Blush Líquido Rare Beauty Soft Pinch! Com sua fórmula leve e de longa duração, este blush proporciona uma cor natural e radiante que se mistura perfeitamente à pele. Ideal para todos os tipos de pele, ele vem em um tamanho compacto, perfeito para levar na bolsa e retocar ao longo do dia. A textura líquida garante uma aplicação fácil e uniforme, enquanto a pigmentação intensa permite construir a intensidade desejada. Experimente a beleza suave e duradoura com Rare Beauty!	119.00	0	2026-06-17 03:55:28.314	2026-06-17 03:55:28.314
63	12	12	Bronzer	O Bronzer em Bastão Rare Beauty Warm Wishes Effortless combina praticidade e sofisticação para realçar sua beleza natural com um toque de sol. Sua textura cremosa desliza suavemente sobre a pele, proporcionando um acabamento radiante e naturalmente iluminado. Ideal para criar contornos suaves e brilho sutil, este bronzer é perfeito para qualquer ocasião, adicionando calor e luminosidade com um simples gesto.	239.00	29	2026-06-17 03:56:24.562	2026-06-17 03:56:24.562
64	12	12	Iluminador	O Iluminador Líquido Rare Beauty Positive Light é um produto inovador que traz luminosidade e brilho à sua pele de forma natural e duradoura. Com uma fórmula leve e fácil de aplicar, ele se mistura perfeitamente com a pele, proporcionando um acabamento radiante e uniforme. Disponível em várias tonalidades, este iluminador de Rare Beauty é perfeito para destacar os pontos altos do rosto, como maçãs do rosto, nariz e arco do cupido. Além disso, sua embalagem prática e moderna facilita a aplicação, tornando-o um item indispensável na sua rotina de maquiagem.	229.00	2	2026-06-17 03:57:18.629	2026-06-17 03:57:18.629
55	11	37	Cadeira	Com um design moderno, a cadeira de escritório Mindset é uma excelente escolha para ambientes corporativos e home offices urbanos.Indicada para quem busca realizar as tarefas com praticidade, seu desenho se encaixa ao corpo proporcionando conforto e boa postura ao sentar-se. Além disso, dispõe de diversos recursos ergonômicos fundamentais para o dia a dia. Veja mais diferenciais deste produto: - Regulagem de altura a gás com pistão classe 3 - Base giratória - Rodízios em nylon - Apoio para os braços com regulagem de altura - Apoio para cabeça ajustável e com regulagem de altura - Assento estofado com espuma - Encosto em tela sintética mesh com apoio para lombar que propicia conforto e permite a ventilação da região- Função relax no assento e encosto com trava e regulagem da intensidade.A Tok Stok apresenta uma seleção completa de cadeiras que unem design, ergonomia e funcionalidade. Com variedade de modelos, materiais, acabamentos e recursos, nossas opções são pensadas para atender diferentes necessidades e transformar seu espaço de estudo ou trabalho em um ambiente mais confortável, prático e inspirador.	1999.00	10	2026-06-17 03:39:20.084	2026-06-20 04:56:38.531
65	12	14	Máscara para Olhos	Estes patches de hidrogel de Rare Beauty são refrescantes e deixam a área dos olhos com um visual renovado após apenas uma única aplicação. A pele parece mais firme e descansada, enquanto reduz a aparência de linhas finas. Em tons de malva com a monograma Rare Beauty, cada par antideslizante permanece no lugar e é fácil de remover após o uso, sem deixar resíduos pegajosos. Uma caixa contêm 8 pares em sachês separados.	199.00	1	2026-06-17 03:59:29.701	2026-06-17 03:59:29.701
66	12	14	Gel Esfoliante	Descubra o conforto de uma pele hidratada e nutrida com o Esfoliante Rare Beauty Find Comfort. A fórmula inovadora em gel se transforma em uma textura leve, usando gel de konjac derivado de plantas para esfoliar e limpar suavemente sem retirar a hidratação natural da pele. Além disso, a fragrância fresca e calmante eleva seu humor de dentro para fora. Feito com geleia konjac derivada de plantas, um esfoliante suave que limpa e limpa sem remover a umidade natural da pele, tornando-o perfeito para uso diário. Enriquecido com extratos botânicos nutritivos como flor de pêssego, ashwaganda (um desestressante natural) e abacate, ele suaviza, acalma e renova a pele, ao mesmo tempo que melhora a textura geral.	199.00	0	2026-06-17 04:00:08.211	2026-06-17 04:00:08.211
67	12	15	Pincel de Iluminador	Fino e firme para uma precisão perfeita, este pincel para iluminador é vegano e livre de crueldade animal, atinge todos os pontos altos do rosto facilidade. As cerdas sintéticas super macias se moldam perfeitamente em um formato arredondado para aplicar o produto com total controle. Esse pincel foi projetado para aplicar o iluminador Positive Light Silky Touch com máxima facilidade, mas que também funciona muito bem com fórmulas em pó e líquidas!	199.00	30	2026-06-17 04:04:14.315	2026-06-17 04:04:14.315
68	12	12	Lip Oil	O Lip Oil Rare Beauty Soft Pinch é um produto inovador que combina o cuidado de um óleo labial com a cor vibrante de um gloss. Os lábios ficam macios, hidratados e nutridos o dia todo, ao mesmo tempo em que parecem mais cheios e saudáveis. Nunca pegajoso, pode ser aplicado em camadas – passe uma vez para um toque rápido de cor, ou passe mais camadas para um destaque ousado. Feito com óleo de semente de jojoba, que hidrata e cria uma barreira protetora sobre os lábios para reter a hidratação, e óleo de semente de girassol, que é rico em antioxidantes e suaviza e protege de fatores externos.	189.00	25	2026-06-17 04:05:01.913	2026-06-17 04:05:18.007
69	12	14	Pincel de Blush	Aplique fórmulas ultra pigmentadas com delicadeza, espalhando as cores para uma aparência suave e esfumada. O formato angular exclusivo acompanha todas as curvas e imita a ponta dos dedos dando mais controle na aplicação. Use-o com Soft Pinch Liquid Blush, ou qualquer fórmula líquida ou cremosa.	209.00	0	2026-06-17 04:06:30.486	2026-06-17 04:06:30.486
70	12	12	Corretivo Iluminador	O corretivo iluminador Rare Beauty é um produto superleve que ilumina, hidrata e uniformiza imediatamente as olheiras, além de contar com uma cobertura leve ajustável com efeito natural que proporciona um visual fresco e radiante.Sua textura ultrafluida faz com que a aplicação e a sobreposição de camadas sejam rápidas, fáceis e impecáveis. Sua fórmula é enriquecida com peônia branca e vitamina E para manter a pele hidratada o dia todo, enquanto o aplicador personalizado com ponta fria de metal proporciona uma sensação refrescante ao entrar em contato a pele.	209.00	10	2026-06-17 04:07:07.131	2026-06-17 04:07:07.131
71	12	12	Primer	Descubra os encantos do Primer Rare Beauty, com textura em gel hidratante que disfarça a aparência dos poros e das linhas finas. Aumenta a durabilidade da maquiagem e diminui o brilho da pele. Sua fórmula avançada, cuidadosamente elaborada, age como um mágico disfarce de poros, proporcionando uma base suave e uniforme para a sua maquiagem. Este primer é uma verdadeira inovação para a sua rotina de beleza, pois não apenas prepara a pele para a aplicação de produtos, mas também minimiza a aparência dos poros, deixando-os praticamente invisíveis.	139.00	13	2026-06-17 04:08:50.027	2026-06-17 04:08:50.027
72	12	12	Lápis Labial	Descubra o poder do lápis labial Rare Beauty e mantenha seus lábios contornados e em destaque na sua maquiagem. Desenvolvido com uma fórmula cremosa e à prova d'água, este produto desliza facilmente e define os lábios. Disponível em 10 tons, é a combinação perfeita para usar com o Kind Words Matte Lipstick. O lápis labial de Rare Beauty define e contorna os lábios com um acabamento matte, que desliza facilmente sobre a pele.	139.00	9	2026-06-17 04:12:03.055	2026-06-17 04:12:03.055
73	12	12	Gloss Labial	Eleve sua rotina de beleza com o Gloss Rare Beauty Stay Vulnerable, um bálsamo brilhante que combina cor e cuidado em um só produto. Este gloss oferece um brilho irresistível e um toque de cor suave, proporcionando lábios hidratados e radiantes ao longo do dia. O Gloss Labial Stay Vulnerable é formulado com uma mistura de ingredientes nutritivos, mistura botânica de lótus, gardênia e nenúfar-branco, que são propriedades relaxantes e nutritivas. Sua textura leve e não pegajosa desliza suavemente sobre os lábios, proporcionando um acabamento brilhante e confortável. Além disso, é enriquecido com antioxidantes que ajudam a proteger os lábios dos danos ambientais.	179.00	0	2026-06-17 04:13:08.126	2026-06-17 04:13:08.126
74	13	14	Gel de Limpeza	O Gel limpador facial desenvolvido para peles normais e oleosas, inclusive as mais sensíveis. Sua fórmula sem sulfatos promove uma eficiente limpeza através de surfactantes suaves e ingredientes hidratantes. O resultado é uma pele limpa, não oleosa e suavemente hidratada. Possui ingredientes que minimizam o desconforto causado pelo ressecamento e pelo excesso de oleosidade da pele. Sua textura rica e encorpada promove uma higienização suave, evitando o atrito das mãos com a pele, deixando uma sensação de limpeza e hidratação após o enxágue.	59.99	23	2026-06-17 04:18:35.523	2026-06-17 04:18:35.523
75	13	14	Tônico Clareador	O tônico clareador da Creamy é uma solução versátil que pode ser usada sozinha ou em combinação com outros tratamentos. Traz uma combinação exclusiva de 4 ingredientes clareadores que atuam em vias diferentes e complementares para atenuar a aparência de manchas de sol, idade, acne e melasma. Sua textura líquida permite que seja aplicado logo após a limpeza da pele, antes de outros produtos, proporcionando assim um aumento da permeação de outros ativos de tratamento. Deixa a pele macia, luminosa e com a tonalidade uniforme.	89.99	2	2026-06-17 04:18:59.717	2026-06-17 04:18:59.717
76	13	14	Ceramide	O Ceramide Skin Repair com tecnologia CicaRecover é o seu novo balm multirreparador de alta performance. Pensado para peles que precisam de reparação intensa, sua fórmula inteligente atua como um cicatrizante antibacteriano de uso cosmético. Ao formar uma película protetora com efeito curativo, o balm protege a pele enquanto acelera o processo natural de recuperação.	59.99	0	2026-06-17 04:19:22.602	2026-06-17 04:19:22.602
77	13	14	Sérum	A Vitamina C Gold da Creamy traz a tecnologia da vitamina C pura estabilizada com moléculas de ouro. Um sérum antioxidante e clareador que combina ingredientes exclusivos: duas formas de Vitamina C (pura e lipossolúvel) além de ingredientes clareadores exclusivos, sendo o sérum ideal para proteção da pele contra os radicais livres e efeito uniformizador do tom, amenizando manchas e atenuando marcas escurecidas. Esse sérum combina a alta estabilidade da vitamina C pura associada ao ouro com a Vitamina C Lipossolúvel - a forma de vitamina C que é mais compatível com a pele que garante uma ação mais eficiente devido a uma melhor absorção e mais profunda. O exclusivo complexo clareador composto pelos ativos Hexylresorcinol e Illuminyl 388 potencializam a ação clareadora do produto, atenuando áreas escurecidas e uniformizando o tom da pele. Possui textura sérum de rápida absorção, pode ser usado diariamente antes do protetor solar por todos os tipos de pele.	119.99	16	2026-06-17 04:20:03.072	2026-06-17 04:20:03.072
78	13	14	Protetor Solar	O Creamy Watery Lotion é um filtro solar aquoso de toque seco e rápida absorção, ideal para todos os tipos de pele, especialmente as oleosas. Oferece alta proteção (FPS 60) com Fator de Proteção UVA (PPD) 25, proteção contra a luz azul e a luz visível, efeito matte e controle de oleosidade e brilho excessivo, além de promover a uniformização da pele. Contém o exclusivo HYPSKIN®, ativo multifuncional que tem função calmante e antioxidante, que contribui para a integridade da barreira cutânea, tornando o produto confortável até mesmo para as peles mais sensíveis. Possui alta resistência a água e suor, recomendado para uso diário e prática de atividades físicas. Não arde os olhos e não tem cheiro, oferecendo conforto e segurança. Não contém ingredientes que agridem a biodiversidade marinha.	59.99	30	2026-06-17 04:20:37.847	2026-06-17 04:20:37.847
79	13	14	Creme Clareador	O Eye Cream oferece um tratamento completo para a área dos olhos, pois atua em todos os pontos de cuidado para a região: hidrata profundamente, estimula a síntese de colágeno e ácido hialurônico para maior firmeza da pele (diminuindo rugas e linhas finas), ameniza a hiperpigmentação causada pelo excesso de melanina e estimula a microcirculação da região, diminuindo bolsas e olheiras. Traz a moderna cafeína vetorizada por silício, que potencializa os efeitos da cafeína em melhorar bolsas e olheiras enquanto repõe o silício da pele, um nutriente fundamental para a produção de colágeno e ácido hialurônico.	129.99	28	2026-06-17 04:21:05.475	2026-06-17 04:21:05.475
80	14	13	Óleo de Argan	Óleo finalizador de Argan 50ml com fórmula super leve e toque seco, que controla o frizz e reduz a eletricidade estática, proporciona brilho intenso, proteção térmica e finalização perfeita sem pesar os fios. Controla o frizz, reduz a eletricidade estática, brilho intenso, proteção térmica, finalização leve sem pesar os fios, aumenta a durabilidade da escova, cabelos sedosos.	24.90	1	2026-06-17 04:24:22.048	2026-06-17 04:24:22.048
82	14	12	Blush Iluminador	Ideal para todos os tipos de pele, o DUO Mauve & Stardust é uma dupla coringa que não pode faltar no nécessaire. A dupla é composta por um rosa chá com subtom frio e  acabamento matte (mauve) junto com um rosé suave e brilho perolado (stardust). Enriquecido com 96% de ativos de cuidados com a pele que tratam a pele enquanto colorem, o DUO proporciona uma alta pigmentação e durabilidade para sua make. Contém ácido hialurônico vegetal que ajuda a aumentar a hidratação, volume e sustentação da pele. 	155.00	19	2026-06-17 04:26:43.194	2026-06-17 04:26:43.194
83	14	12	Batom Vinho	Fácil de aplicar, o Batom High Clean desliza com suavidade e conta com alta cobertura, com cor que aparece já na primeira camada. Seu efeito soft matte é o equilíbrio perfeito entre o glow e o matte que, na tendência dos marrons, apresenta um tom quente e marcante. Rico em ingredientes biotecnológicos e com todo o conforto e segurança de um produto 100% livre de toxinas. 	159.00	5	2026-06-17 04:27:21.407	2026-06-17 04:27:21.407
84	15	15	Esmalte Imensidão	O Esmalte Impala Cremoso Imensidão 7,5ml faz parte da coleção A Cor da Sua Moda. Ele apresenta um tom de profundo e intenso, ideal para quem procura uma cor marcante e moderna que foge dos tons tradicionais. Este esmalte destaca-se pela sua pigmentação vibrante e pela excelente cobertura, sendo uma escolha popular para quem gosta de unhas coloridas com sofisticação.	4.35	6	2026-06-17 04:31:39.511	2026-06-17 04:31:39.511
85	15	15	Esmalte Carmim	OO esmalte Risqué Carmim é um queridinho por um motivo simples: entrega intensidade e sofisticação em cada aplicação. Parte da linha de cremosos da Risqué, ele traz um vermelho escuro clássico que valoriza qualquer look. Sua textura desliza facilmente, garantindo cobertura uniforme já nas primeiras camadas. O resultado? Unhas sem manchas, com cor intensa e brilho elegante.	4.35	0	2026-06-17 04:32:16.142	2026-06-17 04:32:16.142
86	15	15	Esmalte Perolado	Esmalte Impala Perolado Polar 8ml trás uma tonalidade lilás com brilho perolado e acabamento sofisticado. Fórmula de secagem rápida, pincel aplicador para cobertura uniforme e alta resistência ao descascamento para unhas bonitas por mais tempo.	4.35	20	2026-06-17 04:32:57.092	2026-06-17 04:32:57.092
87	15	15	Esmalte Glitter	O esmalte Risqué As Mil Purpurinas é um queridinho por um motivo simples: entrega brilho intenso e efeito glamouroso em cada aplicação. Parte da linha de efeitos glitter da Risqué, ele transforma qualquer esmaltação com um toque luminoso e moderno. Sua textura traz partículas de brilho que se espalham facilmente, criando um efeito iluminado e cheio de destaque. O resultado? Unhas com brilho intenso, elegantes e cheias de personalidade.	4.35	17	2026-06-17 04:33:28.964	2026-06-17 04:33:28.964
88	15	15	Esmalte Elegante	O esmalte Impala Elegante é um queridinho por um motivo simples: entrega intensidade e sofisticação em cada aplicação. Parte da linha A Cor da Sua Moda, ele traz um vermelho poderoso que nunca sai de moda. Sua textura desliza facilmente, garantindo alta cobertura já nas primeiras camadas. O resultado? Unhas sem manchas, com cor intensa e brilho elegante.	4.35	7	2026-06-17 04:33:56.442	2026-06-17 04:33:56.442
81	14	13	Máscara de Cabelo	A Máscara Tratamento Intensivo Magic Butter é um cuidado profundo que revitaliza os cabelos, proporcionando reposição de nutrientes, aminoácidos e lipídios essenciais para recuperar a saúde dos fios. Ela combate o ressecamento, fortalece contra a quebra e reduz as pontas duplas, deixando o cabelo macio, hidratado e com brilho natural. Após lavar os cabelos, aplique a máscara distribuindo por todo o comprimento até as pontas, massageando para garantir que o produto envolva bem os fios. Deixe agir por 5 minutos para que os ativos penetrem profundamente, depois enxágue bem. Use uma vez por semana para manter os cabelos sempre nutridos e protegidos.	55.11	0	2026-06-17 04:25:28.727	2026-06-20 05:20:57.831
93	17	18	Blusa Estampada	Blusa estampada feminina combina conforto e atitude em uma modelagem ampla que valoriza o visual despojado e contemporâneo. Confeccionada em malha macia com acabamento estonado, a peça possui caimento solto no corpo, mangas mais largas e ombros deslocados. A estampa frontal de onça em estilo artístico reforça a identidade fashion da peça e adiciona personalidade ao look.	79.70	14	2026-06-17 05:17:06.99	2026-06-17 05:17:06.99
94	17	19	Bota de Couro	Bota vintage com um visual liso e versátil. Com salto de 6 cm e fechamento interno em zíper, o modelo é a pedida certa para quem quer ousar no dia a dia com praticidade e comodidade. Composta por couro, possui forro interno em material têxtil e palmilha em EVA anatômico, a bota proporciona conforto e qualidade. Completa Looks modernos e atemporais. Aposte em uma calça jeans para looks mais casuais ou com vestido para criar um estilo super moderno.	183.74	33	2026-06-17 05:18:10.266	2026-06-17 05:18:10.266
97	17	16	Boné	O boné unissex bordado é mais do que um acessório, é um elemento de identidade. Feito em algodão leve e respirável, conta com furos de ventilação e ajuste posterior por fivela regulável . O resultado é um acessório funcional, estiloso e fácil de combinar com qualquer produção. Destaque para o bordado frontal, que adiciona um ar descontraído, alegre e autêntico ao visual.	105.90	10	2026-06-17 05:21:25.062	2026-06-17 05:21:25.062
95	17	18	Jaqueta Biker	Jaqueta de gola com lapela e manga ampla com acabamento em zíper. Bolsos frontais com fecho de zíper. Barra com cinto. Fecho frontal transpassado com zíper.	359.74	0	2026-06-17 05:19:15.414	2026-06-17 05:22:45.475
96	17	18	Camisa Xadrez	Camisa xadrez vichy masculina é a escolha ideal para quem busca um visual moderno, versátil e atemporal. Sua tradicional padronagem de pequenos quadrados adiciona personalidade e autenticidade às produções, equilibrando perfeitamente elegância e descontração. O padrão xadrez vichy traz um toque sofisticado ao visual, tornando a camisa uma opção prática e estilosa para compor produções alinhadas e contemporâneas.	255.98	20	2026-06-17 05:20:04.172	2026-06-17 05:23:09.308
98	17	20	Jeans Bootcut	Calça jeans feminina bootcut cropped une a elegância da modelagem bootcut com a modernidade do comprimento cropped. Com caimento ajustado do quadril até os joelhos e barra levemente ampliada, valoriza as curvas e alonga a silhueta, enquanto o comprimento na altura dos tornozelos traz leveza e um toque contemporâneo ao visual.	199.90	0	2026-06-17 05:24:50.831	2026-06-17 05:24:50.831
99	18	19	Nike Dunk	O Tênis Nike Dunk Low Panda é um dos modelos mais desejados do streetwear moderno, conhecido por seu visual minimalista em preto e branco e sua versatilidade única. Inspirado na herança esportiva da Nike, esse sneaker se tornou um verdadeiro ícone da moda urbana, perfeito para quem busca estilo, autenticidade e facilidade na combinação de looks. Com design atemporal, o Dunk Low Panda se adapta a diferentes ocasiões, desde produções casuais até composições mais fashionistas. Seu conforto e durabilidade fazem dele uma escolha ideal para o uso diário.	819.90	0	2026-06-17 05:37:53.402	2026-06-17 05:38:15.99
100	18	19	P-6000	O Tênis Nike P-6000 Masculino combina o visual marcante dos clássicos tênis de corrida da Nike com o conforto exigido pela rotina atual. Inspirado nos modelos Pegasus 25 e Air Pegasus 2006, o P-6000 resgata a essência da era Y2K através de linhas esportivas, sobreposições detalhadas e um design que se tornou referência dentro da moda urbana contemporânea. Seu cabedal em mesh respirável com sobreposições estruturadas proporciona um visual autêntico e dinâmico, enquanto a entressola de espuma oferece amortecimento leve para o uso diário. A combinação entre inspiração retrô e conforto moderno transformou o P-6000 em um dos modelos mais desejados por quem acompanha as tendências de streetwear, sneakers e da estética running que domina a moda atual.	899.99	0	2026-06-17 05:39:21.582	2026-06-17 05:39:21.582
101	18	19	Adidas Samba	O Tênis Adidas Samba OG Cream White é um verdadeiro ícone que une herança esportiva e estilo urbano moderno. Criado originalmente para os gramados, o Samba conquistou as ruas e se tornou referência no streetwear mundial, sendo a escolha ideal para quem busca autenticidade, conforto e versatilidade no dia a dia.Com visual clean e tom bege sofisticado, o modelo se adapta facilmente a diferentes estilos e ocasiões, mantendo o design clássico que atravessa gerações sem perder relevância.	799.99	1	2026-06-17 05:39:58.019	2026-06-17 05:39:58.019
102	18	19	Knu Skool	O tênis Vans Knu Skool Black True White é a escolha perfeita para quem busca um visual autêntico e moderno. Com design inspirado no estilo retrô dos anos 90, esse tênis Vans original combina perfeitamente com looks casuais e urbanos. Seu acabamento em preto com a clássica listra branca garante versatilidade e presença em qualquer ocasião. Desenvolvido para oferecer máximo conforto, o Vans Knu Skool possui acolchoamento extra e estrutura robusta. Seu cabedal resistente proporciona durabilidade, enquanto o solado emborrachado garante excelente aderência. Ideal para quem procura um tênis casual confortável para o dia a dia.	479.99	2	2026-06-17 05:40:36.947	2026-06-17 05:40:36.947
103	18	19	2002R	O Tênis New Balance 2002R Protection Pack Cortado combina herança running com uma proposta moderna e ousada. Conhecido pelo visual desconstruído, o modelo apresenta sobreposições com acabamento “cortado”, criando um efeito irregular que reforça a estética urbana e contemporânea da linha Protection Pack. Seu cabedal em suede e mesh garante equilíbrio entre respirabilidade e sofisticação, enquanto a entressola com tecnologia de amortecimento oferece conforto superior para o uso diário. A construção robusta proporciona estabilidade, e o solado de borracha assegura tração e durabilidade.	799.99	3	2026-06-17 05:41:18.111	2026-06-17 05:41:18.111
104	18	19	Future SLide	O Chinelo Future Slide Kings Preto Unissex combina leveza, conforto e design contemporâneo. Ideal para momentos de lazer, possui acabamento de qualidade e visual sofisticado que se adapta a diferentes estilos. O chinelo apresenta design anatômico que garante melhor ajuste aos pés, solado emborrachado para maior segurança ao caminhar e material resistente que proporciona durabilidade. Seu acabamento em preto traz um toque moderno e elegante, ideal para quem busca praticidade sem abrir mão do estilo.	109.99	8	2026-06-17 05:41:56.303	2026-06-17 05:41:56.303
105	19	18	Casaco de Malha	Casaco de gola redonda e manga ampla. Acabamentos em nervuras. Fecho frontal com botões	249.01	2	2026-06-17 05:46:36.329	2026-06-17 05:46:36.329
106	19	20	Wide Leg	Jeans de cintura alta com passantes. Cinco bolsos. Fecho frontal com zíper e botão.	279.00	14	2026-06-17 05:47:17.673	2026-06-17 05:47:17.673
107	19	18	Camisa Oxford	Camisa básica confecionada em fio de algodão. Colarinho com lapela e decote V. Manga ampla com acabamento em punho com botões. Fecho frontal com botões.	199.00	0	2026-06-17 05:47:52.276	2026-06-17 05:47:52.276
108	19	18	Camisa Fit	Camiseta relax fit. Gola redonda e manga curta com detalhe de faixas combinadas em contraste. Bainha com aberturas laterais.	179.00	28	2026-06-17 05:51:24.753	2026-06-17 05:51:24.753
109	19	20	Jeans Fit	Mais estreito na perna do que nosso modelo calça reta Básico. Perna reta do quadril ao tornozelo, com um ajuste que não aperta nem alarga. cintura média. Tecido rígido. Jeans regular fit confeccionados em denim de algodão. Cinco bolsos. Efeito lavado. Fecho frontal com botões.	179.00	8	2026-06-17 05:52:00.595	2026-06-17 05:52:00.595
110	19	18	Moletom Polo	Moletom polo regular fit. Gola com lapela e fecho frontal de botões ocultos por aba. Manga ampla. Acabamentos em nervuras.	279.00	0	2026-06-17 05:52:32.942	2026-06-17 05:52:32.942
111	20	18	Camisa Malha	Camiseta infantil desenvolvida em malha de algodão com mangas curtas, decote redondo e os desenhos coloridos da estampa Partida.	105.39	1	2026-06-17 06:03:23.135	2026-06-17 06:03:23.135
112	20	18	Blusa Gaivota	essa peça faz parte do inverno 26, para crianças de 0 a 10 anos: EU<3 RIO — um inverno carioca de cor, carinho e imaginação, feito para acompanhar brincadeiras e descobertas. afinal, o rio de janeiro tem vocação para felicidade. nós também.	104.39	11	2026-06-17 06:04:12.263	2026-06-17 06:04:12.263
113	20	17	Saia Junina	Saia de Festa Junina para crianças, desenvolvida em tecido 100% algodão com estampa Xadrez. A roupa vem com barra rodada sobreposta com babado enviesado, pala no quadril, elástico na cintura, pespontos em cor vibrante, e detalhe especial de Coração bordado na lateral.	136.99	6	2026-06-17 06:04:50.633	2026-06-17 06:04:50.633
114	20	20	Short Gaivota	Essa peça faz parte do inverno 26, para crianças de 0 a 10 anos: EU<3 RIO — um inverno carioca de cor, carinho e imaginação, feito para acompanhar brincadeiras e descobertas. afinal, o rio de janeiro tem vocação para felicidade. nós também.	125.39	21	2026-06-17 06:05:45.27	2026-06-17 06:05:45.27
115	20	20	Short Hera	FARM Futura Crescer é descobrir novas formas de se expressar — FARM FUTURA é a nossa linha pensada para meninas de 8 a 14 anos. Com modelagens que acompanham essa fase de transformações e uma mistura de estampas exclusivas e estampas icônicas da FARM Rio, a linha traduz um momento de descobertas, personalidade e novos jeitos de estar no mundo.	205.39	19	2026-06-17 06:06:19.843	2026-06-17 06:06:19.843
116	21	22	iPhone 15 Pro	O iPhone 15 traz recursos premium para a linha de entrada da Apple. Destaca-se pelo processador A16 Bionic, tela Super Retina XDR de 6,1 polegadas com a interativa Dynamic Island, e uma poderosa câmera principal de 48 MP com zoom de 2x. Conta ainda com a moderna entrada USB-C.	4499.61	30	2026-06-17 06:14:03.303	2026-06-17 06:14:03.303
117	21	22	iPhone 17	O iPhone 17 Lavanda de 256 GB une design elegante a um desempenho topo de linha. Ele traz a tecnologia de inteligência artificial da Apple, bateria para o dia todo e um sistema de câmeras avançado, perfeito para registrar fotos e vídeos em alta resolução.	5998.31	0	2026-06-17 06:15:43.515	2026-06-17 06:15:43.515
118	21	22	Galaxy S25	O Samsung Galaxy S25 é o novo smartphone premium com foco em Galaxy AI avançada. Equipado com o processador Snapdragon 8 Elite, oferece câmeras aprimoradas para vídeos noturnos e design altamente durável em alumínio ou titânio. Aproveite essa versão com 256GB, 12GB RAM, Câmera tripla de 50+12+10 e Tela Grande de 6.2'	4239.00	5	2026-06-17 06:17:47.547	2026-06-17 06:17:47.547
119	21	25	Suporte de Mesa	Além de moderno e muito elegante esse suporte articulável oferece muita praticidade para quem precisa usar o celular ou tablet sem o incômodo de ter que segurar o aparelho por longo tempo enquanto assiste um filme, participa de uma vídeo chamada, reuniões, etc.Por ser totalmente retrátil é possível levá-lo com facilidade para qualquer lugar sem nenhum incômodo podendo ser carregado até mesmo no bolso.Possui a extremidade revestida em silicone evitando assim que o aparelho seja riscado ao ser colocado no suporte.	9.50	27	2026-06-17 06:19:36.652	2026-06-17 06:19:36.652
120	21	25	Tripé	3 em 1: Bastão de Selfie + Tripé + Controle Bluetooth. Este acessório portátil multifuncional, combinando bastão de selfie, tripé de mesa e controle remoto Bluetooth. Ele possui haste extensível, iluminação de LED integrada para melhorar seus vídeos e fotos, e suporte ajustável com rotação de 360° para enquadramentos precisos em qualquer celular.	147.87	17	2026-06-17 06:21:09.309	2026-06-17 06:21:09.309
121	22	23	Notebook Gamer	O Lenovo LOQ 15IRX9 foi projetado para quem não aceita menos que a máxima potência em suas tarefas. Equipado com o processador Intel Core i5-13450HX, que conta com 10 núcleos e 16 threads, este notebook entrega uma capacidade de processamento formidável para lidar com multitarefas intensas e jogos pesados. Com um cache de 24MB e frequências que atingem até 4.9GHz, você terá a fluidez necessária para editar vídeos, programar ou competir nos títulos mais exigentes do mercado. Somado a isso, a placa de vídeo NVIDIA GeForce RTX 4050 com 6GB de memória dedicada GDDR6 eleva o realismo visual através do Ray Tracing e da tecnologia DLSS 3. Com um TGP robusto de 105W e boost clock de 2370MHz, esta GPU garante taxas de quadros estáveis e detalhes impressionantes. Vale destacar que o recurso Advanced Optimus gerencia a alternância entre os gráficos integrados e dedicados, otimizando tanto o desempenho quanto a vida útil da bateria.	5899.00	0	2026-06-17 06:29:16.922	2026-06-17 06:29:16.922
122	22	43	MSI RTX 5070	Você pode embalar alto desempenho em um espaço menor com esta Placa de Vídeo MSI GeForce RTX 5070 12G VENTUS 2X OC. Procure gabinetes que sejam compatíveis com as placas SFF-Ready Enthusiast GeForce para obter um ajuste seguro e otimizar a montagem do seu PC. As tecnologias NVIDIA Reflex otimizam o pipeline gráfico para proporcionar o máximo em capacidade de resposta em jogos competitivos, oferecendo aquisição de alvo mais rápida, tempos de reação aprimorados e precisão de mira aperfeiçoada. Com o Reflex 2 e seu inovador Frame Warp, a latência é ainda mais reduzida, levando em consideração os dados de entrada do mouse mais recentes do jogo. Domine a velocidade Warp e alcance o topo do ranking!	5899.00	9	2026-06-17 06:33:00.804	2026-06-17 06:33:00.804
123	22	43	Kingston Fury Beast	Prepare-se para uma experiência de jogo e multitarefas incomparável com a Memória RAM Fury Beast 16GB. Projetada para oferecer velocidade e confiabilidade, esta memória DDR4 de alta performance eleva o desempenho do seu sistema a um novo patamar. O módulo Fury Beast KF432C16BB1/16 oferece incríveis 16GB de capacidade e velocidade de 3200MHz, garantindo tempos de resposta ultrarrápidos e execução fluida de aplicativos e jogos exigentes. Com latência CL16, você experimentará um desempenho ágil e sem travamentos, mesmo nas situações mais intensas.	899.99	2	2026-06-17 06:33:47.556	2026-06-17 06:33:47.556
124	22	24	Monitor Gamer	O Monitor Gamer TUF Gaming VG27AQ5A foi meticulosamente projetado para gamers profissionais e para aqueles que buscam a jogabilidade mais imersiva e competitiva. Este monitor Fast IPS de 27 polegadas eleva o patamar de desempenho, entregando visuais nítidos e uma fluidez que elimina qualquer desvantagem no jogo. A Taxa de Atualização de 210Hz (OC) — Overclocked — é a chave para a vantagem competitiva, eliminando o atraso e o desfoque de movimento, essenciais em jogos de tiro em primeira pessoa, corridas, estratégia em tempo real e títulos esportivos. Esta taxa ultrarrápida permite que você jogue com as mais altas configurações visuais e reaja instantaneamente ao que está na tela. Complementando essa agilidade, a tecnologia ASUS Fast IPS proporciona um Tempo de Resposta de 0,3ms (GTG) (mínimo). Esse tempo de resposta extremamente baixo garante visuais nítidos e sem ghosting mesmo em jogos com as mais altas taxas de quadros.	1299.99	0	2026-06-17 06:35:11.688	2026-06-17 06:35:11.688
125	22	43	Fonte MSI	A fonte MSI MAG A650BN é a escolha perfeita para gamers que buscam desempenho e confiabilidade. Com 650W de potência real e certificação 80 PLUS Bronze, ela garante energia estável e eficiente para alimentar seus componentes de alta performance. O PFC Ativo melhora a qualidade da energia, enquanto o design de circuito DC para DC proporciona maior estabilidade. Desfrute de uma experiência de jogo suave e sem interrupções com a MSI MAG A650BN.	289.99	12	2026-06-17 06:37:07.316	2026-06-17 06:37:07.316
130	24	24	LG UltraGear	Para quem busca o ápice da imersão visual e vantagem tática nos jogos de última geração, investir em um monitor 34 ultrawide é a escolha definitiva. O modelo LG UltraGear 34GP63A-B foi projetado para envelopar o campo de visão do jogador com sua tela curva, entregando uma proporção de 21:9 que substitui facilmente o uso de duas telas. Combinando uma resolução incrivelmente nítida, fluidez extrema e tecnologias de imagem exclusivas da LG, este display é a ferramenta perfeita tanto para explorar mundos abertos vastos quanto para garantir o topo do placar em arenas competitivas.	1649.90	1	2026-06-17 06:46:13.609	2026-06-17 06:46:13.609
140	26	7	Ozemppic	Ozempic 1mg Solução Injetável 3ml + 4 agulhas. Ozempic® é usado, em conjunto com dieta e exercícios, para tratar pacientes adultos com diabetes tipo 2 não satisfatoriamente controlada.	999.99	0	2026-06-17 07:06:44.433	2026-06-17 07:06:44.433
132	24	23	MacBook Pro	Você terá em mãos o ápice da performance computacional com o chip M5 Max. O MacBook Pro Apple 16' - Chip M5 Max, GPU 40 Cores, 48GB, 2TB SSD - foi projetado com uma CPU de 18 núcleos, dividida entre 6 supernúcleos e 12 núcleos de desempenho, garantindo que fluxos de trabalho pesados sejam executados com fluidez absoluta. Somado a isso, a GPU de 40 núcleos trabalha em conjunto com o traçado de raios acelerado por hardware, permitindo que profissionais de 3D e edição de vídeo alcancem resultados antes impossíveis em um notebook.A arquitetura de memória unificada de 48GB oferece uma largura de banda de 614 GB/s, eliminando gargalos de dados entre os componentes. Além disso, o Neural Engine de 16 núcleos e os Neural Accelerators potencializam tarefas de inteligência artificial, enquanto o mecanismo de mídia dedicado acelera formatos como ProRes RAW, H.264 e HEVC, tornando a exportação de arquivos uma tarefa instantânea.	39999.00	20	2026-06-17 06:51:14.649	2026-06-17 06:51:14.649
131	24	24	Smart TV	O processador exclusivo da TV Samsung Smart TV faz a otimização de seu conteúdo para até 4K de resolução, conforme a cena.Assista ao seu conteúdo favorito com imagens realistas em 4K.O HDR aumenta o alcance dos níveis de luz na sua TV, proporcionando mais brilho, contraste e detalhes com uma tecnologia que analisa as regiões da tela e ajusta automaticamente o contrasteAcesse seus conteúdos e apps de streaming na melhor plataforma de TV, com a garantia de atualizações durante 7 anos graças ao One UI Tizen e tenha uma TV sempre com o que há de mais novo.Acesse milhares de jogos nas plataformas Xbox Cloud Gaming e Nvidia GeForce Now, sem necessidade de downloads ou de consoles. E, com o Samsung TV Plus e apps parceiros*, desfrute de canais de filmes, notícias, infantil, esportes, novelas e músicas, tudo grátis e sem assinatura.	1264.90	25	2026-06-17 06:47:49.051	2026-06-17 06:51:40.858
133	24	25	Controle PS5	Assuma o controle com o elegante e potente Controle DualSense PS5 Preto (Midnight Black). Combinando um design clássico com a tecnologia revolucionária de imersão da próxima geração, este controle sem fio é essencial para a sua experiência no PS5. Sinta fisicamente o feedback responsivo em suas ações do jogo com atuadores duplos, que substituem os barulhentos motores tradicionais. Em suas mãos, essas vibrações dinâmicas podem simular a sensação de tudo, desde ambientes complexos ao recuo de diferentes armas.	399.00	7	2026-06-17 06:52:55.303	2026-06-17 06:52:55.303
134	24	26	Playstation 5	Console PlayStation 5 Edição Digital, 825GB, com jogos ASTRO BOT e Gran Turismo 7. Experimente dois exclusivos PlayStation muito celebrados com este pacote PS5 Edição Digital de ótimo custo-benefício. O pacote inclui um console PS5, o vencedor do prêmio de Jogo do Ano de 2024, ASTRO BOT, e o aclamado simulador de direção, Gran Turismo 7 — tudo por um preço incrível.	3998.07	0	2026-06-17 06:54:26.278	2026-06-17 06:54:26.278
141	26	8	Curativo Topz	Curativo Topz Patrulha Canina 25 Unidades. O Curativo Topz Patrulha Canina é um produto com bordas protetoras e formatos variados, desenvolvido para auxiliar no tratamento de ferimentos. Serve para proteger e facilitar o processo de cicatrização de lesões e pequenos cortes, impedindo a entrada de bactérias e permitindo que a pele respire, com bordas confortáveis e flexíveis que facilitam sua remoção.	15.69	40	2026-06-17 07:08:28.362	2026-06-17 07:08:28.362
142	26	8	Compressa de Gaze	Compressa de Gaze Estéril 3M Nexcare com 10 unidades. A Gaze Estéril Nexcare é um produto de uso único e deve ser descartada após o uso. Deve ser conservada em local seco, limpo, arejado e protegido da luz solar. Para que serve: É ideal para limpeza de ferimentos e confecção de curativos. Com cinco dobras, oito camadas e 11 fios, ela é hidrófila, macia e feita 100% de algodão.	4.65	55	2026-06-17 07:09:31.665	2026-06-17 07:09:31.665
143	26	9	Nebacetin	Nebacetin 250UI/g + 5mg/g Pomada 15g é um medicamento indicado para o tratamento de infecções da pele e/ou de mucosas, causadas por diferentes bactérias, como por exemplo: nas “dobras” da pele, ao redor dos pelos, na parte de fora da orelha, nos furúnculos, nas lesões com pus, na acne infectada, nas feridas abertas (como úlceras na pele) e nas queimaduras de pele. NEBACETIN também é indicado para prevenir infecções de pele e/ou de mucosas após ferimentos, cortes (inclusive de cirurgias) e queimaduras pequenas.	27.09	39	2026-06-17 07:13:07.93	2026-06-17 07:13:07.93
144	26	7	Dipirona	Dipirona Monoidratada 1g 10 comprimidos Cimed Genérico. Este medicamento é indicado como analgésico (para dor) e antitérmico (para febre).Como usar: Você deve tomar os comprimidos com líquido (aproximadamente ½ a 1 copo), por via oral. O comprimido de 1 g pode ser partido. A parte não utilizada do comprimido deve ser guardada na embalagem original e administrada no prazo máximo de 6 horas.	9.99	63	2026-06-17 07:16:19.092	2026-06-17 07:16:19.092
146	26	9	Allegra	Antialérgico Allegra Cloridrato de Fexofenadina 120mg 10 comprimidos. Allegra (cloridrato de fexofenadina) é um anti-histamínico que não dá sono, indicado para o tratamento dos principais sintomas da rinite alérgica e urticária, como espirros, nariz entupido, coriza e coceiras. Recomendado para uso adulto e pediátrico a partir dos 12 anos, o antialérgico Allegra age por 12 horas¹ e proporciona alívio rápido¹ dos sintomas de alergia.	59.99	53	2026-06-17 07:19:03.517	2026-06-17 07:19:03.517
147	26	10	Kit Lenço Umedecido	Kit Lenço Umedecido Huggies Higiene Superior Hipoalergênico Sem Álcool 48 unidades 4 pacotesHuggies Higiene Superior são lenços umedecidos descartáveis que limpam até 2x mais, ideal para remover até mesmo as sujeiras invisíveis sem prejudicar a pele do nenêm. Sua fórmula limpa suavemente enquanto mantém a pele hidratada e saudável. Ainda ajuda a prevenir assaduras, irritações ou alergias. Livre de agentes agressivos como álcco, parabenos e fragrâncias, além de ser dermatologicamente testado e hipoalergênico.	45.89	47	2026-06-17 07:20:21.632	2026-06-17 07:20:21.632
149	28	33	Gol de Futebol	Transforme qualquer espaço em um mini campo de futebol com a Trave de Futebol Infantil. Fácil de montar e leve para transportar, o kit estimula a atividade física, a coordenação motora e o espírito esportivo das crianças.	110.30	19	2026-06-18 18:30:31.358	2026-06-18 18:30:31.358
151	28	35	Kit de Peças	Os blocos de montar com 140 peças oferece uma ampla variedade de opções para estimular a criatividade e a imaginação das crianças durante suas horas de brincadeira. Os blocos de montar são educativos, proporcionando oportunidades valiosas para o desenvolvimento de habilidades motoras finas e cognitivas, enquanto as crianças se divertem e aprendem.	42.99	9	2026-06-18 18:33:53.842	2026-06-18 18:33:53.842
152	28	31	Buba Ball	O Fruit Ball é superflexivel, uma delícia para o bebê interagir com cores, formas e até mesmo massagear a gengiva. Possui som de chocalho, além de design leve e divertido, com tamanho ideal para as mãozinhas pequenas agarrarem com facilidade.	38.42	2	2026-06-18 18:35:41.108	2026-06-18 18:35:41.108
153	30	28	Coup	Você é o chefe de uma família em uma cidade-estado italiana administrada por uma corte fraca, corrupta e repleta de intrigas. Você está tentando controlar a cidade através de manipulação, blefe e suborno para chegar ao poder. Seu objetivo é destruir a influência de todas as outras famílias, forçando-as ao exílio. Apenas uma família sobreviverá.	99.90	16	2026-06-18 18:38:25.299	2026-06-18 18:38:25.299
154	30	27	Monopoly	O JOGO DE TABULEIRO FAVORITO DE TODO MUNDO COM ATUALIZAÇÕES: É tudo ou nada! Este jogo de Monopoly é o jogo básico da Noite de Jogos em Família que os fãs adoram, com as melhorias que todos pediram - além de um visual novo e modernoTOMA LÁ. DÁ CÁ. LEVAR TODOS À FALÊNCIA: Comprar bairros, vender propriedades, cobrar aluguel e criar um império! Para vencer a concorrência, o jogador deve ser o último com dinheiro quando todos os outros estiverem falidos.	95.99	11	2026-06-18 18:39:51.057	2026-06-18 18:40:19.419
155	30	29	God of War	Embarque em uma jornada épica e comovente onde Kratos e Atreus lutam entre o desejo de manterem-se unidos ou separar-se.Aqueles que desafiam o destino Atreus anseia por conhecimento para ajudá-lo a entender a profecia de “Loki” e o papel que ele desempenhará no Ragnarök. Kratos deve decidir se será acorrentado pelo medo de repetir seus erros ou se libertar de seu passado para ser o pai que Atreus precisa.	143.00	30	2026-06-18 18:43:08.986	2026-06-18 18:43:08.986
156	30	30	Quebra-Cabeça	Pais & Flhos, Quebra-Cabeça, 500 Peças Colorido e Divertido de Montar. Montar um Quebra-Cabeça é mais do que separar peças e tentar encaixá-las, formando imagens, é um desafio estimulante e prazeroso.	30.56	46	2026-06-18 18:44:31.396	2026-06-18 18:44:31.396
148	26	10	Kit Viagem	Kit Viagem Needs para Higiene Bucal. O Kit Viagem Needs Oral Care é um conjunto de itens essenciais para higiene bucal, desenvolvido para trazer conforto e praticidade durante viagens. Feito com material resistente e transparente, o kit é compacto e fácil de transportar.	31.89	28	2026-06-17 07:21:04.698	2026-06-20 06:04:59.138
150	28	34	Kit Educativo	Kit completo com letras números e formas geométricas para aprendizado divertido e educativo. Estimula coordenação motora raciocínio lógico memória e reconhecimento visual infantil. Método Montessori que incentiva autonomia concentração e desenvolvimento cognitivo.	22.99	38	2026-06-18 18:31:53.229	2026-06-20 06:08:37.546
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, username, nome, email, senha_hash, foto_perfil_url, "createdAt", "updatedAt") FROM stdin;
1	CJR	CJR	cjr@email.com	$2b$10$Rvf9nABoOVMZS8wSjR0hYeaPRM9zhiYIsf3NyTnaKXbC0wP3113l.	/lojas_perfil/logo/logoCJR.png	2026-06-16 06:22:07.581	2026-06-16 06:23:36.526
2	d'carts & baskets	d'carts & baskets	dcb@email.com	$2b$10$oMv6z6anOanJgKR0XW/76.QVljOeN.KKF3rJsoSkK7bsgK44BtXxm	/lojas_perfil/logo/d_cartsBaskets_logo.png	2026-06-16 06:23:59.702	2026-06-16 06:23:59.702
3	maumar	Maumar	maumar@email.com	$2b$10$3KuTN/LX9y3MmkOosZUuNuF3uDEABRj08bHK/Y7o.BuWDrnfbZvma	/lojas_perfil/logo/maumar_logo.png	2026-06-16 06:24:17.842	2026-06-16 06:24:17.842
4	croc brew	The Croc Brew	croc.brew@email.com	$2b$10$pdJh37n8BQX7hsiLEsQefOZKoU7zai7uyY.9cIqJanvRZGX5cn1fq	/lojas_perfil/logo/crocBrew_logo.png	2026-06-16 06:24:34.806	2026-06-16 06:24:34.806
5	pedroFreitas32	Pedro Freitas	pedro.freitas@email.com	$2b$10$4dvJl725ahWB1VYhalpfLuPJsHejZV.t0fJMaIDKsJN6ToGZiCEia	/users_perfil/Pedro.jpg	2026-06-16 06:24:53.8	2026-06-16 06:24:53.8
6	scoobydoo	Scoobert Doo	scooby.doo@email.com	$2b$10$KOnDpYU4kcVWGzz2Zis3tu0nULic.0TnxZmCj43e2xEFKs1UpOZxi	/users_perfil/Scooby.jpeg	2026-06-16 06:25:00.895	2026-06-16 06:25:00.895
7	katyperry	Katheryn Elizabeth	katy.perry@email.com	$2b$10$JiOjXeA0/Xe7lUutdj.63OV/YjHEZqtSLiypDFgh81795gtO8Klri	/users_perfil/katy_perry.jpeg	2026-06-16 06:25:06.164	2026-06-16 06:25:06.164
8	joao_silva	João Silva	silva@email.com	$2b$10$PtsZftaZTTHDpDO2l9gPourCt7B9v7MgpEuEhphmnSEj5oiHPfS3O	/users_perfil/joao_silva.jpeg	2026-06-16 06:25:13.676	2026-06-16 06:25:13.676
9	alealejandro	Alejandro Dias	ale.diass@email.com	$2b$10$Aaa4SAqw2wGaK0P.7Z1nnO7FkHOz6ck37vP6XnLKS4hL2av7CXa.u	/users_perfil/alejandro.jpeg	2026-06-16 06:25:21.437	2026-06-16 06:25:21.437
10	paulinho	Paulo Otaviano	p.octaviano@email.com	$2b$10$B/GICJWm19yJvEernWyeTumlh3/0VFd/h7LMB/JHQlwZrSrJXElc2	/users_perfil/paulo_otaviano.jpeg	2026-06-16 06:25:30.715	2026-06-16 06:25:30.715
11	ferfer	Fernanda Ferreira	fer.fer@email.com	$2b$10$2/sDrY1JEEgmtjZRF7ifPOCr0K3mEGNOq16cMxPAirTM3duE6M6JC	/users_perfil/fernanda_ferreira.png	2026-06-16 06:25:42.1	2026-06-16 06:25:42.1
12	selenagomez	Selena Gomez	selenamariegomez@email.com	$2b$10$uDbruOg3lRpSJN6DWwuTN.q1VDFCNmG/uXMpfv39m8OnF7CeEpXd.	/users_perfil/Selena Gomez.png	2026-06-16 06:25:48.493	2026-06-16 06:25:48.493
13	sofii_	Sofia Figueiredo	sofi.figui@email.com	$2b$10$XYmCFDUbzDRIQSN3d2g0MO1tf.oK9xq/de9gMsaBtr21o/hRcfPzC	/users_perfil/sofia_figueiredo.jpg	2026-06-16 06:25:55.236	2026-06-16 06:25:55.236
14	rob_erto	Roberto Leão	roberto.10leao@email.com	$2b$10$VfbpYYOTlsTRASb.rbLR0.PtjLK29fo32gSS0ELKWBK04sTp5rTca	/users_perfil/roberto_leao.jpeg	2026-06-16 06:26:02.432	2026-06-16 06:26:02.432
15	ladygaga	Stefani Joanne	ladygaga@email.com	$2b$10$h1E4uhrhlqErDtWL95/kq.LY/1.gNCe2QHPo/.eM3YoFv5CEc6fFG	/users_perfil/stefani_joanne.jpeg	2026-06-16 06:26:07.647	2026-06-16 06:26:07.647
16	rose	Roseanne Park	rose@email.com	$2b$10$aEARHCBLwQtdoQuTQtgX4umBTVlMMPPRJ.gsoMAs1RVe50tJ3Uq1W	/users_perfil/Rose.jpeg	2026-06-16 06:26:16.054	2026-06-16 06:26:16.054
17	natylu	Natalia Lurdes	naty.lu@email.com	$2b$10$MUpQdctbQmV8TfewLAzHb.TJV3nc90WTSwTL84EuAmUN/6GcusqRm	/users_perfil/natalia_lurdes.jpeg	2026-06-16 06:26:34.68	2026-06-16 06:26:34.68
18	matAmor	Mateus Amorim	mateus.amo@email.com	$2b$10$fkSWJNKLOHkIWfEm9mxJfuWXJND0gBY.qqDMbgtlgnKJY/j8xLegS	/users_perfil/mateus_amorim.jpeg	2026-06-16 06:26:48.001	2026-06-16 06:26:48.001
19	mell	Melina Castro	melinacast.40@email.com	$2b$10$8/u7p.H.yHA2VtrcUZ1dseipdzNbhjX.JDIPbPtDmwdvt9I3uUHQa	/users_perfil/melina_castro.jpg	2026-06-16 06:26:57.394	2026-06-16 06:26:57.394
20	belinha	Isabel Pereira	bel.pereira@email.com	$2b$10$E77rIhko06I60UrxPU9emOSEA7w6kPAiTOcsmTXnmSKk8TYQnKhdG	/users_perfil/isabel_pereira.jpg	2026-06-16 06:27:02.06	2026-06-16 06:27:02.06
21	zucker	Mark Zucker.	mark00zuckerberg@email.com	$2b$10$7kkgjc4.mpnD2BTOqm4.6Ok45ep8dq2wV0F7I4MZeKjTfP.0ML.sa	/users_perfil/mark_zucker.jpeg	2026-06-16 06:27:36.318	2026-06-16 06:27:36.318
22	muskinha	Elon Musk	elon.reevemusk@email.com	$2b$10$hWuuVY5DCsmlU3h/rs6Y.ehlxDDUOtkCk33tNYaZQXSRWhjibkesO	/users_perfil/elon_musk.jpeg	2026-06-16 06:27:44.116	2026-06-16 06:27:44.116
23	nicole_otto	Nicole Otto	nic.ootto@email.com	$2b$10$HyHuN2YI5kLawLKLOpZ8y.VKrimv.7CAiwv71MCq4KxuIscXrCSZ.	/users_perfil/nicole_otto.jpeg	2026-06-16 06:27:50.74	2026-06-16 06:27:50.74
24	eduGusto	Eduardo Gustavo	eduardo.gus49@email.com	$2b$10$qNmFgnptw0kbXi8dENxA.u0Dhssa82jQN82y3o.DKz.aqjPFpqjT.	/users_perfil/eduardo_gustavo.jpeg	2026-06-16 06:28:02.57	2026-06-16 06:28:02.57
25	thiagodii_	Thiago Diniz	thiago.di4@email.com	$2b$10$OJb9n9qCQSIScbdYyq3H4.A1WfQKXGzCLauK0YrBp6qBhqHz1aUHW	/users_perfil/thiago_diniz.jpeg	2026-06-16 06:28:08.763	2026-06-16 06:28:08.763
26	skiniestJunior	Michel Junior	michel.juniorhee@email.com	$2b$10$cXE2vb2jC5Sb1btjBY3vNORndYc3jtFNP.tzrRa0WTBRp1x92e0I.	/users_perfil/michel_jr.jpeg	2026-06-16 06:29:12.154	2026-06-16 06:29:12.154
27	paulinha	Paula Brandão	paula.brand@email.com	$2b$10$20ehCU2dD/ZaDF994r0KuOXuAT9LSxF.d5YzvdjzdKyjbrMFB4lrS	/users_perfil/paula_brandao.jpeg	2026-06-16 06:29:26.743	2026-06-16 06:29:26.743
28	antoniE	Antonio Eliote	antonioElio123@email.com	$2b$10$EnHMAQmth3TRxjDU6doZku7nN/4V.Y.1I0sKSdpn8rpcGlhmega.e	/users_perfil/antonio_eliote.jpeg	2026-06-16 06:29:36.213	2026-06-16 06:29:36.213
29	miranda_priestly	Miranda Priestly	miranda@email.com	$2b$10$cc2FiIVJRqVAfrE8cxrsr.INVShKhwvJmfkXfGYCLCMFo18Kav4e2	/users_perfil/miranda_priestly.jpeg	2026-06-16 06:29:43.869	2026-06-16 06:29:43.869
30	sammy	Samanta Nogueira	samantaa3289.nog@email.com	$2b$10$GeORyCs0GnprI7bNwN2/DeVTVQJpqO2akNBGYwJqIOgaXxaOMG//i	/users_perfil/samanta_nogueira.jpeg	2026-06-16 08:05:49.521	2026-06-16 08:05:49.521
\.


--
-- Name: avaliacoes_loja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avaliacoes_loja_id_seq', 69, true);


--
-- Name: avaliacoes_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avaliacoes_produto_id_seq', 129, true);


--
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 43, true);


--
-- Name: comentarios_avaliacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentarios_avaliacao_id_seq', 47, true);


--
-- Name: imagens_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagens_produto_id_seq', 351, true);


--
-- Name: lojas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lojas_id_seq', 30, true);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 156, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 30, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: avaliacoes_loja avaliacoes_loja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes_loja
    ADD CONSTRAINT avaliacoes_loja_pkey PRIMARY KEY (id);


--
-- Name: avaliacoes_produto avaliacoes_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes_produto
    ADD CONSTRAINT avaliacoes_produto_pkey PRIMARY KEY (id);


--
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- Name: comentarios_avaliacao comentarios_avaliacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios_avaliacao
    ADD CONSTRAINT comentarios_avaliacao_pkey PRIMARY KEY (id);


--
-- Name: imagens_produto imagens_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagens_produto
    ADD CONSTRAINT imagens_produto_pkey PRIMARY KEY (id);


--
-- Name: lojas lojas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lojas
    ADD CONSTRAINT lojas_pkey PRIMARY KEY (id);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuarios_email_key ON public.usuarios USING btree (email);


--
-- Name: avaliacoes_loja avaliacoes_loja_loja_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes_loja
    ADD CONSTRAINT avaliacoes_loja_loja_id_fkey FOREIGN KEY (loja_id) REFERENCES public.lojas(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: avaliacoes_loja avaliacoes_loja_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes_loja
    ADD CONSTRAINT avaliacoes_loja_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: avaliacoes_produto avaliacoes_produto_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes_produto
    ADD CONSTRAINT avaliacoes_produto_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: avaliacoes_produto avaliacoes_produto_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacoes_produto
    ADD CONSTRAINT avaliacoes_produto_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: categorias categorias_categoria_pai_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_categoria_pai_id_fkey FOREIGN KEY (categoria_pai_id) REFERENCES public.categorias(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: comentarios_avaliacao comentarios_avaliacao_avaliacao_loja_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios_avaliacao
    ADD CONSTRAINT comentarios_avaliacao_avaliacao_loja_id_fkey FOREIGN KEY (avaliacao_loja_id) REFERENCES public.avaliacoes_loja(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: comentarios_avaliacao comentarios_avaliacao_avaliacao_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios_avaliacao
    ADD CONSTRAINT comentarios_avaliacao_avaliacao_produto_id_fkey FOREIGN KEY (avaliacao_produto_id) REFERENCES public.avaliacoes_produto(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: comentarios_avaliacao comentarios_avaliacao_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios_avaliacao
    ADD CONSTRAINT comentarios_avaliacao_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: imagens_produto imagens_produto_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagens_produto
    ADD CONSTRAINT imagens_produto_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: lojas lojas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lojas
    ADD CONSTRAINT lojas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: produtos produtos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: produtos produtos_loja_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_loja_id_fkey FOREIGN KEY (loja_id) REFERENCES public.lojas(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict rc3ksxTiOyuBmENWhywTChi8tGGISWOTs9QgDvVvwvNvP17Kxxgv7fKhKbrhJha

