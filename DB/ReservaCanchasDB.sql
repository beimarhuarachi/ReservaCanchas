PGDMP     )    9    
            s            ReservaCanchasDB    9.3.6    9.3.6 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    49491    ReservaCanchasDB    DATABASE     �   CREATE DATABASE "ReservaCanchasDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Bolivia.1252' LC_CTYPE = 'Spanish_Bolivia.1252';
 "   DROP DATABASE "ReservaCanchasDB";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6            �            3079    11750    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    182            �            1259    49492    seqidcampodeportivo    SEQUENCE     t   CREATE SEQUENCE seqidcampodeportivo
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.seqidcampodeportivo;
       public       postgres    false    6            �            1259    49494    CampoDeportivo    TABLE     7  CREATE TABLE "CampoDeportivo" (
    "IdCampoDeportivo" integer DEFAULT nextval('seqidcampodeportivo'::regclass) NOT NULL,
    "Nombre" character varying NOT NULL,
    "PrecioPorHora" smallint NOT NULL,
    "RutaFoto" character varying,
    "IdTipoCancha" integer NOT NULL,
    "IdTipoSuelo" integer NOT NULL
);
 $   DROP TABLE public."CampoDeportivo";
       public         postgres    false    170    6            �            1259    49501    seqidhorarioatencion    SEQUENCE     v   CREATE SEQUENCE seqidhorarioatencion
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.seqidhorarioatencion;
       public       postgres    false    6            �            1259    49503    HorarioAtencion    TABLE     s  CREATE TABLE "HorarioAtencion" (
    "IdHorario" integer DEFAULT nextval('seqidhorarioatencion'::regclass) NOT NULL,
    "HoraInicio" time without time zone NOT NULL,
    "HoraFin" time without time zone NOT NULL,
    "Dia" character varying(2) NOT NULL,
    "IdCampoDeportivo" integer NOT NULL
);
ALTER TABLE ONLY "HorarioAtencion" ALTER COLUMN "Dia" SET STORAGE PLAIN;
 %   DROP TABLE public."HorarioAtencion";
       public         postgres    false    172    6            �           0    0    COLUMN "HorarioAtencion"."Dia"    COMMENT     g   COMMENT ON COLUMN "HorarioAtencion"."Dia" IS 'Podría ser:
- LU
- MA
- MI
- JU
- VI
- SA
- DO';
            public       postgres    false    173            �            1259    49507    seqidreserva    SEQUENCE     n   CREATE SEQUENCE seqidreserva
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.seqidreserva;
       public       postgres    false    6            �            1259    49509    Reserva    TABLE     �  CREATE TABLE "Reserva" (
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
    DROP TABLE public."Reserva";
       public         postgres    false    174    6            �            1259    49516    seqidtipocancha    SEQUENCE     q   CREATE SEQUENCE seqidtipocancha
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.seqidtipocancha;
       public       postgres    false    6            �            1259    49518 
   TipoCancha    TABLE     �   CREATE TABLE "TipoCancha" (
    "IdTipoCancha" integer DEFAULT nextval('seqidtipocancha'::regclass) NOT NULL,
    "Nombre" character varying NOT NULL,
    "PrecioMinimo" smallint NOT NULL
);
     DROP TABLE public."TipoCancha";
       public         postgres    false    176    6            �            1259    49571    seqtipoevento    SEQUENCE     n   CREATE SEQUENCE seqtipoevento
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.seqtipoevento;
       public       postgres    false    6            �            1259    49573 
   TipoEvento    TABLE     �   CREATE TABLE "TipoEvento" (
    "IdEvento" integer DEFAULT nextval('seqtipoevento'::regclass) NOT NULL,
    "Nombre" character varying NOT NULL
);
     DROP TABLE public."TipoEvento";
       public         postgres    false    180    6            �            1259    49525    seqidtiposuelo    SEQUENCE     p   CREATE SEQUENCE seqidtiposuelo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.seqidtiposuelo;
       public       postgres    false    6            �            1259    49527 	   TipoSuelo    TABLE     �   CREATE TABLE "TipoSuelo" (
    "IdTipoSuelo" integer DEFAULT nextval('seqidtiposuelo'::regclass) NOT NULL,
    "Nombre" character varying NOT NULL
);
    DROP TABLE public."TipoSuelo";
       public         postgres    false    178    6            �          0    49494    CampoDeportivo 
   TABLE DATA                     public       postgres    false    171   �2       �          0    49503    HorarioAtencion 
   TABLE DATA                     public       postgres    false    173   �3       �          0    49509    Reserva 
   TABLE DATA                     public       postgres    false    175   N4       �          0    49518 
   TipoCancha 
   TABLE DATA                     public       postgres    false    177   h4       �          0    49573 
   TipoEvento 
   TABLE DATA                     public       postgres    false    181   5       �          0    49527 	   TipoSuelo 
   TABLE DATA                     public       postgres    false    179   �5       �           0    0    seqidcampodeportivo    SEQUENCE SET     :   SELECT pg_catalog.setval('seqidcampodeportivo', 2, true);
            public       postgres    false    170            �           0    0    seqidhorarioatencion    SEQUENCE SET     ;   SELECT pg_catalog.setval('seqidhorarioatencion', 2, true);
            public       postgres    false    172            �           0    0    seqidreserva    SEQUENCE SET     4   SELECT pg_catalog.setval('seqidreserva', 1, false);
            public       postgres    false    174            �           0    0    seqidtipocancha    SEQUENCE SET     6   SELECT pg_catalog.setval('seqidtipocancha', 4, true);
            public       postgres    false    176            �           0    0    seqidtiposuelo    SEQUENCE SET     5   SELECT pg_catalog.setval('seqidtiposuelo', 3, true);
            public       postgres    false    178            �           0    0    seqtipoevento    SEQUENCE SET     5   SELECT pg_catalog.setval('seqtipoevento', 1, false);
            public       postgres    false    180            J           2606    49535    IdCampoDeportivo 
   CONSTRAINT     j   ALTER TABLE ONLY "CampoDeportivo"
    ADD CONSTRAINT "IdCampoDeportivo" PRIMARY KEY ("IdCampoDeportivo");
 M   ALTER TABLE ONLY public."CampoDeportivo" DROP CONSTRAINT "IdCampoDeportivo";
       public         postgres    false    171    171            X           2606    49581    IdEvento 
   CONSTRAINT     V   ALTER TABLE ONLY "TipoEvento"
    ADD CONSTRAINT "IdEvento" PRIMARY KEY ("IdEvento");
 A   ALTER TABLE ONLY public."TipoEvento" DROP CONSTRAINT "IdEvento";
       public         postgres    false    181    181            Q           2606    49537 	   IdReserva 
   CONSTRAINT     U   ALTER TABLE ONLY "Reserva"
    ADD CONSTRAINT "IdReserva" PRIMARY KEY ("IdReserva");
 ?   ALTER TABLE ONLY public."Reserva" DROP CONSTRAINT "IdReserva";
       public         postgres    false    175    175            T           2606    49539    IdTipoCancha 
   CONSTRAINT     ^   ALTER TABLE ONLY "TipoCancha"
    ADD CONSTRAINT "IdTipoCancha" PRIMARY KEY ("IdTipoCancha");
 E   ALTER TABLE ONLY public."TipoCancha" DROP CONSTRAINT "IdTipoCancha";
       public         postgres    false    177    177            V           2606    49541    IdTipoSuelo 
   CONSTRAINT     [   ALTER TABLE ONLY "TipoSuelo"
    ADD CONSTRAINT "IdTipoSuelo" PRIMARY KEY ("IdTipoSuelo");
 C   ALTER TABLE ONLY public."TipoSuelo" DROP CONSTRAINT "IdTipoSuelo";
       public         postgres    false    179    179            O           2606    49543 	   idHorario 
   CONSTRAINT     ]   ALTER TABLE ONLY "HorarioAtencion"
    ADD CONSTRAINT "idHorario" PRIMARY KEY ("IdHorario");
 G   ALTER TABLE ONLY public."HorarioAtencion" DROP CONSTRAINT "idHorario";
       public         postgres    false    173    173            K           1259    49544    fki_IDTipoSuelo    INDEX     P   CREATE INDEX "fki_IDTipoSuelo" ON "CampoDeportivo" USING btree ("IdTipoSuelo");
 %   DROP INDEX public."fki_IDTipoSuelo";
       public         postgres    false    171            M           1259    49545    fki_IdCampoDeportivo    INDEX     [   CREATE INDEX "fki_IdCampoDeportivo" ON "HorarioAtencion" USING btree ("IdCampoDeportivo");
 *   DROP INDEX public."fki_IdCampoDeportivo";
       public         postgres    false    173            L           1259    49546    fki_IdTipoCancha    INDEX     R   CREATE INDEX "fki_IdTipoCancha" ON "CampoDeportivo" USING btree ("IdTipoCancha");
 &   DROP INDEX public."fki_IdTipoCancha";
       public         postgres    false    171            R           1259    49547    fki_Reserva_CampoDeportivo    INDEX     Y   CREATE INDEX "fki_Reserva_CampoDeportivo" ON "Reserva" USING btree ("IdCampoDeportivo");
 0   DROP INDEX public."fki_Reserva_CampoDeportivo";
       public         postgres    false    175            Y           2606    49548    CampoDeportivo-TipoCancha    FK CONSTRAINT     �   ALTER TABLE ONLY "CampoDeportivo"
    ADD CONSTRAINT "CampoDeportivo-TipoCancha" FOREIGN KEY ("IdTipoCancha") REFERENCES "TipoCancha"("IdTipoCancha") ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public."CampoDeportivo" DROP CONSTRAINT "CampoDeportivo-TipoCancha";
       public       postgres    false    1876    177    171            Z           2606    49553    CampoDeportivo-TipoSuelo    FK CONSTRAINT     �   ALTER TABLE ONLY "CampoDeportivo"
    ADD CONSTRAINT "CampoDeportivo-TipoSuelo" FOREIGN KEY ("IdTipoSuelo") REFERENCES "TipoSuelo"("IdTipoSuelo") ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public."CampoDeportivo" DROP CONSTRAINT "CampoDeportivo-TipoSuelo";
       public       postgres    false    1878    179    171            [           2606    49558    HorarioAtencion-CampoDeportivo    FK CONSTRAINT     �   ALTER TABLE ONLY "HorarioAtencion"
    ADD CONSTRAINT "HorarioAtencion-CampoDeportivo" FOREIGN KEY ("IdCampoDeportivo") REFERENCES "CampoDeportivo"("IdCampoDeportivo");
 \   ALTER TABLE ONLY public."HorarioAtencion" DROP CONSTRAINT "HorarioAtencion-CampoDeportivo";
       public       postgres    false    173    1866    171            \           2606    49563    Reserva-CampoDeportivo    FK CONSTRAINT     �   ALTER TABLE ONLY "Reserva"
    ADD CONSTRAINT "Reserva-CampoDeportivo" FOREIGN KEY ("IdCampoDeportivo") REFERENCES "CampoDeportivo"("IdCampoDeportivo");
 L   ALTER TABLE ONLY public."Reserva" DROP CONSTRAINT "Reserva-CampoDeportivo";
       public       postgres    false    171    1866    175            �   �   x�Ŏ��0Fw����V'#U� ��*b�۔��.} ��;9�aIA�XR�@|�	�JwO$`�|1H�C�ĺ2%�3T1*��|��������$�X������pݟ/� +p���2�QӁ���z|����nh�F���kW��",~`����p��1��� ǵ<�-��Cn��W#p�      �   ~   x���v
Q���WP��/J,��w,I�K���SR�P�L�
*�@�=�2�<��<�%3Dy�8'�令��d��+i*�9���+h�(�XX �:�m�`�ICMk.O:9ƈ�c����� ��N      �   
   x���          �   �   x���v
Q���WP
�,�wN�K�HTR�P�LA��((���&��XE�ə���y���J�
a�>���
�:
�!�y���:
���\�T4�h�[iIR~�BJ�BpbN~-�1�[4ݐڦ� MwJ,.,M-��� �q-      �   �   x���v
Q���WP
�,�w-K�+�WR�P�L��u���s��R�4�}B]�4u�}�JR�2s3A�RR��3�5��<�4�h,DZ��� 5931�㌁ƹ�e&��Sb�	И��"�\\ iZ      �   g   x���v
Q���WP
�,�.M��WR�P�LApu���s��R�4�}B]�4uԝS�RS�5��<�6�hN@bYfnj^I>eF��MLI-J��� h]@L     