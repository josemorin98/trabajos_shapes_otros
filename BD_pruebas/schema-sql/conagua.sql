--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Debian 10.3-1.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-0ubuntu0.19.04.1)

-- Started on 2020-01-13 16:03:58 CST

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
-- TOC entry 219 (class 1255 OID 41010)
-- Name: replace_all_nulls(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.replace_all_nulls() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	 IF NEW.humedad = 'Null' THEN
	 NEW.humedad := Null;
	 END IF;
	 IF NEW.precipitacion = 'Null' THEN
	 NEW.precipitacion := Null;
	 END IF;
	 IF NEW.radiacion_solar = 'Null' THEN
	 NEW.radiacion_solar := Null;
	 END IF;
	 IF NEW.presion_barometrica = 'Null' THEN
	 NEW.presion_barometrica := Null;
	 END IF;
	 RETURN NEW;
 
   RETURN NEW;
END;
$$;


ALTER FUNCTION public.replace_all_nulls() OWNER TO postgres;

--
-- TOC entry 211 (class 1255 OID 32824)
-- Name: replace_null(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.replace_null() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
	 IF NEW.temperatura = 'Null' THEN
	 NEW.temperatura := Null;
	 END IF;
	 RETURN NEW;
  END;$$;


ALTER FUNCTION public.replace_null() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 32816)
-- Name: antenas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.antenas (
    longitud double precision,
    latitud double precision,
    id_antena integer NOT NULL,
    estado character varying(100),
    codigo character varying(10),
    antena character varying(100)
);


ALTER TABLE public.antenas OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 32814)
-- Name: antenas_id_antena_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.antenas_id_antena_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.antenas_id_antena_seq OWNER TO postgres;

--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 205
-- Name: antenas_id_antena_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.antenas_id_antena_seq OWNED BY public.antenas.id_antena;


--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: data_10m; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_10m (
    id_10m integer NOT NULL,
    estado character varying(10) NOT NULL,
    estacion character varying(100) NOT NULL,
    antena character varying(100) NOT NULL,
    latitud double precision NOT NULL,
    longitud double precision NOT NULL,
    altitud character varying(20),
    fecha character varying(20) NOT NULL,
    dir_rafaga character varying(20),
    dir_viento character varying(20),
    vel_rafaga character varying(20),
    vel_viento character varying(20),
    temperatura character varying(20),
    humedad character varying(20) NOT NULL,
    presion_barometrica character varying(20),
    precipitacion character varying(20),
    radiacion_solar character varying(20),
    hora character varying,
    codigo character varying(10)
);


ALTER TABLE public.data_10m OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16391)
-- Name: data_10m_id_24h_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_10m_id_24h_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_10m_id_24h_seq OWNER TO postgres;

--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 197
-- Name: data_10m_id_24h_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_10m_id_24h_seq OWNED BY public.data_10m.id_10m;


--
-- TOC entry 198 (class 1259 OID 16393)
-- Name: data_24h; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_24h (
    id_24h integer NOT NULL,
    estado character varying(10) NOT NULL,
    estacion character varying(100) NOT NULL,
    antena character varying(100) NOT NULL,
    latitud double precision NOT NULL,
    longitud double precision NOT NULL,
    altitud character varying(20),
    fecha character varying(20) NOT NULL,
    dir_rafaga character varying(20),
    dir_viento character varying(20),
    vel_rafaga character varying(20),
    vel_viento character varying(20),
    temperatura character varying(20),
    humedad character varying(20) NOT NULL,
    presion_barometrica character varying(20),
    precipitacion character varying(20),
    radiacion_solar character varying(20),
    codigo character varying(10)
);


ALTER TABLE public.data_24h OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16396)
-- Name: data_24h_id_24h_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_24h_id_24h_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_24h_id_24h_seq OWNER TO postgres;

--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 199
-- Name: data_24h_id_24h_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_24h_id_24h_seq OWNED BY public.data_24h.id_24h;


--
-- TOC entry 200 (class 1259 OID 16398)
-- Name: data_60m; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_60m (
    id_60m integer NOT NULL,
    estado character varying(10) NOT NULL,
    estacion character varying(100) NOT NULL,
    antena character varying(100) NOT NULL,
    latitud double precision NOT NULL,
    longitud double precision NOT NULL,
    altitud character varying(20),
    fecha character varying(20) NOT NULL,
    hora character varying(10) NOT NULL,
    dir_rafaga character varying(20),
    dir_viento character varying(20),
    vel_rafaga character varying(20),
    vel_viento character varying(20),
    temperatura character varying(20),
    humedad character varying(20),
    presion_barometrica character varying(20),
    precipitacion character varying(20),
    radiacion_solar character varying(20),
    codigo character varying(10)
);


ALTER TABLE public.data_60m OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16401)
-- Name: data_60m_id_24h_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_60m_id_24h_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_60m_id_24h_seq OWNER TO postgres;

--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 201
-- Name: data_60m_id_24h_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_60m_id_24h_seq OWNED BY public.data_60m.id_60m;


--
-- TOC entry 202 (class 1259 OID 16403)
-- Name: fecha_actualizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fecha_actualizacion (
    id_fecha integer NOT NULL,
    fecha_m character varying(15) NOT NULL,
    fecha_h character varying(15) NOT NULL
);


ALTER TABLE public.fecha_actualizacion OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 49212)
-- Name: merra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merra_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 49208)
-- Name: merra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merra (
    id_merra integer DEFAULT nextval('public.merra_id_seq'::regclass) NOT NULL,
    station_code character varying(10) NOT NULL,
    fecha character varying(20) NOT NULL,
    latitud double precision NOT NULL,
    longitud double precision NOT NULL,
    hnorain double precision NOT NULL,
    temp_max double precision NOT NULL,
    temp_min double precision NOT NULL,
    temp_mean double precision NOT NULL,
    prec_max double precision NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.merra OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32807)
-- Name: merra_historico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merra_historico (
    id_merra integer NOT NULL,
    station_code character varying(10) NOT NULL,
    fecha character varying(20) NOT NULL,
    latitud double precision NOT NULL,
    longitud double precision NOT NULL,
    hnorain double precision NOT NULL,
    temp_max double precision NOT NULL,
    temp_min double precision NOT NULL,
    temp_mean double precision NOT NULL,
    prec_max double precision NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.merra_historico OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 32805)
-- Name: merra_id_merra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merra_id_merra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merra_id_merra_seq OWNER TO postgres;

--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 203
-- Name: merra_id_merra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merra_id_merra_seq OWNED BY public.merra_historico.id_merra;


--
-- TOC entry 208 (class 1259 OID 49199)
-- Name: merra_year_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merra_year_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merra_year_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 49193)
-- Name: merra_year; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merra_year (
    id_merra_year integer DEFAULT nextval('public.merra_year_id_seq'::regclass) NOT NULL,
    "año" integer NOT NULL,
    station_code character varying(10) NOT NULL,
    latitud double precision NOT NULL,
    longitud double precision NOT NULL,
    temp_max double precision NOT NULL,
    temp_min double precision NOT NULL,
    temp_mean double precision NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.merra_year OWNER TO postgres;

--
-- TOC entry 2773 (class 2604 OID 32819)
-- Name: antenas id_antena; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.antenas ALTER COLUMN id_antena SET DEFAULT nextval('public.antenas_id_antena_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 16406)
-- Name: data_10m id_10m; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_10m ALTER COLUMN id_10m SET DEFAULT nextval('public.data_10m_id_24h_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 16407)
-- Name: data_24h id_24h; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_24h ALTER COLUMN id_24h SET DEFAULT nextval('public.data_24h_id_24h_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 16408)
-- Name: data_60m id_60m; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_60m ALTER COLUMN id_60m SET DEFAULT nextval('public.data_60m_id_24h_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 32810)
-- Name: merra_historico id_merra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merra_historico ALTER COLUMN id_merra SET DEFAULT nextval('public.merra_id_merra_seq'::regclass);


--
-- TOC entry 2789 (class 2606 OID 32821)
-- Name: antenas antenas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.antenas
    ADD CONSTRAINT antenas_pkey PRIMARY KEY (id_antena);


--
-- TOC entry 2779 (class 2606 OID 16410)
-- Name: data_10m data_10m_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_10m
    ADD CONSTRAINT data_10m_pk PRIMARY KEY (id_10m);


--
-- TOC entry 2781 (class 2606 OID 16412)
-- Name: data_24h data_24h_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_24h
    ADD CONSTRAINT data_24h_pk PRIMARY KEY (id_24h);


--
-- TOC entry 2783 (class 2606 OID 16414)
-- Name: data_60m data_60m_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_60m
    ADD CONSTRAINT data_60m_pk PRIMARY KEY (id_60m);


--
-- TOC entry 2785 (class 2606 OID 16416)
-- Name: fecha_actualizacion fecha_actualizacion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fecha_actualizacion
    ADD CONSTRAINT fecha_actualizacion_pk PRIMARY KEY (id_fecha);


--
-- TOC entry 2787 (class 2606 OID 32813)
-- Name: merra_historico merra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merra_historico
    ADD CONSTRAINT merra_pkey PRIMARY KEY (id_merra);


--
-- TOC entry 2791 (class 2606 OID 49198)
-- Name: merra_year merra_year_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merra_year
    ADD CONSTRAINT merra_year_pkey PRIMARY KEY (id_merra_year);


--
-- TOC entry 2792 (class 2620 OID 41011)
-- Name: data_60m cleaning_nulls_60m; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER cleaning_nulls_60m BEFORE INSERT ON public.data_60m FOR EACH ROW EXECUTE PROCEDURE public.replace_all_nulls();


--
-- TOC entry 2793 (class 2620 OID 32825)
-- Name: data_60m quitar_nulos_temp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER quitar_nulos_temp BEFORE INSERT ON public.data_60m FOR EACH ROW EXECUTE PROCEDURE public.replace_null();


-- Completed on 2020-01-13 16:03:59 CST

--
-- PostgreSQL database dump complete
--

