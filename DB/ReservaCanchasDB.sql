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

--
-- Name: seqidcampodeportivo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seqidcampodeportivo
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seqidcampodeportivo OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: CampoDeportivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "CampoDeportivo" (
    "IdCampoDeportivo" integer DEFAULT nextval('seqidcampodeportivo'::regclass) NOT NULL,
    "Nombre" character varying NOT NULL,
    "PrecioPorHora" smallint NOT NULL,
    "RutaFoto" character varying,
    "IdTipoCancha" integer NOT NULL,
    "IdTipoSuelo" integer NOT NULL
);


ALTER TABLE public."CampoDeportivo" OWNER TO postgres;

--
-- Name: seqidhorarioatencion; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seqidhorarioatencion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seqidhorarioatencion OWNER TO postgres;

--
-- Name: HorarioAtencion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "HorarioAtencion" (
    "IdHorario" integer DEFAULT nextval('seqidhorarioatencion'::regclass) NOT NULL,
    "HoraInicio" time without time zone NOT NULL,
    "HoraFin" time without time zone NOT NULL,
    "Dia" character varying(2) NOT NULL,
    "IdCampoDeportivo" integer NOT NULL
);
ALTER TABLE ONLY "HorarioAtencion" ALTER COLUMN "Dia" SET STORAGE PLAIN;


ALTER TABLE public."HorarioAtencion" OWNER TO postgres;

--
-- Name: COLUMN "HorarioAtencion"."Dia"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "HorarioAtencion"."Dia" IS 'Podría ser:
- LU
- MA
- MI
- JU
- VI
- SA
- DO';


--
-- Name: seqidreserva; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seqidreserva
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seqidreserva OWNER TO postgres;

--
-- Name: Reserva; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Reserva" (
    "IdReserva" integer DEFAULT nextval('seqidreserva'::regclass) NOT NULL,
    "Fecha" date NOT NULL,
    "IdCampoDeportivo" integer NOT NULL,
    "HoraInicio" time without time zone NOT NULL,
    "HoraFin" time without time zone NOT NULL,
    "Precio" integer NOT NULL,
    "NombreCliente" character varying NOT NULL,
    "TelefonoReferencia" integer NOT NULL,
    "ReservaEspecial" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Reserva" OWNER TO postgres;

--
-- Name: seqidtipocancha; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seqidtipocancha
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seqidtipocancha OWNER TO postgres;

--
-- Name: TipoCancha; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "TipoCancha" (
    "IdTipoCancha" integer DEFAULT nextval('seqidtipocancha'::regclass) NOT NULL,
    "Nombre" character varying NOT NULL,
    "PrecioMinimo" smallint NOT NULL
);


ALTER TABLE public."TipoCancha" OWNER TO postgres;

--
-- Name: seqidtipoevento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seqidtipoevento
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seqidtipoevento OWNER TO postgres;

--
-- Name: TipoEvento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "TipoEvento" (
    "IdEvento" integer DEFAULT nextval('seqidtipoevento'::regclass) NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."TipoEvento" OWNER TO postgres;

--
-- Name: seqidtiposuelo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seqidtiposuelo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seqidtiposuelo OWNER TO postgres;

--
-- Name: TipoSuelo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "TipoSuelo" (
    "IdTipoSuelo" integer DEFAULT nextval('seqidtiposuelo'::regclass) NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."TipoSuelo" OWNER TO postgres;

--
-- Data for Name: CampoDeportivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "CampoDeportivo" ("IdCampoDeportivo", "Nombre", "PrecioPorHora", "RutaFoto", "IdTipoCancha", "IdTipoSuelo") FROM stdin;
\.


--
-- Data for Name: HorarioAtencion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "HorarioAtencion" ("IdHorario", "HoraInicio", "HoraFin", "Dia", "IdCampoDeportivo") FROM stdin;
\.


--
-- Data for Name: Reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Reserva" ("IdReserva", "Fecha", "IdCampoDeportivo", "HoraInicio", "HoraFin", "Precio", "NombreCliente", "TelefonoReferencia", "ReservaEspecial") FROM stdin;
\.


--
-- Data for Name: TipoCancha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "TipoCancha" ("IdTipoCancha", "Nombre", "PrecioMinimo") FROM stdin;
1	Tenis	50
2	Futbol de Salon	50
3	Futbol	10
4	Basquet	10
\.


--
-- Data for Name: TipoEvento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "TipoEvento" ("IdEvento", "Nombre") FROM stdin;
1	Mantenimiento de Cancha
2	Evento Especial
3	Feriado
4	Paro
\.


--
-- Data for Name: TipoSuelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "TipoSuelo" ("IdTipoSuelo", "Nombre") FROM stdin;
1	Cesped
2	Pavimento
3	Madera
\.


--
-- Name: seqidcampodeportivo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seqidcampodeportivo', 2, true);


--
-- Name: seqidhorarioatencion; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seqidhorarioatencion', 2, true);


--
-- Name: seqidreserva; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seqidreserva', 1, false);


--
-- Name: seqidtipocancha; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seqidtipocancha', 4, true);


--
-- Name: seqidtipoevento; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seqidtipoevento', 1, false);


--
-- Name: seqidtiposuelo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seqidtiposuelo', 3, true);


--
-- Name: IdCampoDeportivo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CampoDeportivo"
    ADD CONSTRAINT "IdCampoDeportivo" PRIMARY KEY ("IdCampoDeportivo");


--
-- Name: IdEvento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "TipoEvento"
    ADD CONSTRAINT "IdEvento" PRIMARY KEY ("IdEvento");


--
-- Name: IdReserva; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Reserva"
    ADD CONSTRAINT "IdReserva" PRIMARY KEY ("IdReserva");


--
-- Name: IdTipoCancha; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "TipoCancha"
    ADD CONSTRAINT "IdTipoCancha" PRIMARY KEY ("IdTipoCancha");


--
-- Name: IdTipoSuelo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "TipoSuelo"
    ADD CONSTRAINT "IdTipoSuelo" PRIMARY KEY ("IdTipoSuelo");


--
-- Name: idHorario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "HorarioAtencion"
    ADD CONSTRAINT "idHorario" PRIMARY KEY ("IdHorario");


--
-- Name: fki_IDTipoSuelo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_IDTipoSuelo" ON "CampoDeportivo" USING btree ("IdTipoSuelo");


--
-- Name: fki_IdCampoDeportivo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_IdCampoDeportivo" ON "HorarioAtencion" USING btree ("IdCampoDeportivo");


--
-- Name: fki_IdTipoCancha; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_IdTipoCancha" ON "CampoDeportivo" USING btree ("IdTipoCancha");


--
-- Name: fki_Reserva_CampoDeportivo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_Reserva_CampoDeportivo" ON "Reserva" USING btree ("IdCampoDeportivo");


--
-- Name: CampoDeportivo-TipoCancha; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "CampoDeportivo"
    ADD CONSTRAINT "CampoDeportivo-TipoCancha" FOREIGN KEY ("IdTipoCancha") REFERENCES "TipoCancha"("IdTipoCancha") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: CampoDeportivo-TipoSuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "CampoDeportivo"
    ADD CONSTRAINT "CampoDeportivo-TipoSuelo" FOREIGN KEY ("IdTipoSuelo") REFERENCES "TipoSuelo"("IdTipoSuelo") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: HorarioAtencion-CampoDeportivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "HorarioAtencion"
    ADD CONSTRAINT "HorarioAtencion-CampoDeportivo" FOREIGN KEY ("IdCampoDeportivo") REFERENCES "CampoDeportivo"("IdCampoDeportivo");


--
-- Name: Reserva-CampoDeportivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Reserva"
    ADD CONSTRAINT "Reserva-CampoDeportivo" FOREIGN KEY ("IdCampoDeportivo") REFERENCES "CampoDeportivo"("IdCampoDeportivo");


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

