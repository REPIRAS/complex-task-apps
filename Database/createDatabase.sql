PGDMP                         y         
   rentcarsdb    13.2    13.2 7               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394 
   rentcarsdb    DATABASE     g   CREATE DATABASE rentcarsdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE rentcarsdb;
                postgres    false            �            1259    40960    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false            �            1259    32798    bonussystem    TABLE     �   CREATE TABLE public.bonussystem (
    idbonussystem integer NOT NULL,
    description character varying(50) NOT NULL,
    discountpercent numeric NOT NULL
);
    DROP TABLE public.bonussystem;
       public         heap    postgres    false            �            1259    32796    bonussystem_idbonussystem_seq    SEQUENCE     �   ALTER TABLE public.bonussystem ALTER COLUMN idbonussystem ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bonussystem_idbonussystem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    24627    car    TABLE     �  CREATE TABLE public.car (
    idcar integer NOT NULL,
    vinnumber character varying(50) NOT NULL,
    brand character varying(50) NOT NULL,
    classcar character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    transmission character varying(10) NOT NULL,
    color character varying(30) NOT NULL,
    yearofmanufacture smallint NOT NULL,
    idlocationcar integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.car;
       public         heap    postgres    false            �            1259    24625    car_idcar_seq    SEQUENCE     �   ALTER TABLE public.car ALTER COLUMN idcar ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.car_idcar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            �            1259    24620    client    TABLE     �  CREATE TABLE public.client (
    idclient integer NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    familyname character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    passportdata integer NOT NULL,
    driverslicense integer NOT NULL,
    numberofphone character varying(20) NOT NULL,
    idbonussystem integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    24618    client_idclient_seq    SEQUENCE     �   ALTER TABLE public.client ALTER COLUMN idclient ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_idclient_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    201            �            1259    32770    fine    TABLE     
  CREATE TABLE public.fine (
    idfine integer NOT NULL,
    description character varying(70) NOT NULL,
    cost money NOT NULL,
    datefine timestamp without time zone NOT NULL,
    status character varying(10) NOT NULL,
    idclient integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.fine;
       public         heap    postgres    false            �            1259    32768    fine_idfine_seq    SEQUENCE     �   ALTER TABLE public.fine ALTER COLUMN idfine ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.fine_idfine_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    32783    locationcar    TABLE     �   CREATE TABLE public.locationcar (
    idlocationcar integer NOT NULL,
    address character varying(100) NOT NULL,
    terrain character varying(50) NOT NULL
);
    DROP TABLE public.locationcar;
       public         heap    postgres    false            �            1259    32781    locationcar_idlocationcar_seq    SEQUENCE     �   ALTER TABLE public.locationcar ALTER COLUMN idlocationcar ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.locationcar_idlocationcar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            �            1259    24634    rate    TABLE     �   CREATE TABLE public.rate (
    idrate integer NOT NULL,
    description character varying(50) NOT NULL,
    cost money NOT NULL,
    idcar integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.rate;
       public         heap    postgres    false            �            1259    24632    rate_idrate_seq    SEQUENCE     �   ALTER TABLE public.rate ALTER COLUMN idrate ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rate_idrate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            �            1259    24647    rentcar    TABLE     &  CREATE TABLE public.rentcar (
    idrentcar integer NOT NULL,
    countdaysrent timestamp without time zone NOT NULL,
    cost money NOT NULL,
    dateofissue date NOT NULL,
    idcar integer DEFAULT 1 NOT NULL,
    idclient integer DEFAULT 1 NOT NULL,
    idrate integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.rentcar;
       public         heap    postgres    false            �            1259    24645    rentcar_idrentcar_seq    SEQUENCE     �   ALTER TABLE public.rentcar ALTER COLUMN idrentcar ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rentcar_idrentcar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            �            1259    24672 	   returncar    TABLE     �   CREATE TABLE public.returncar (
    idreturncar integer NOT NULL,
    condition character varying(50) NOT NULL,
    returndate timestamp without time zone NOT NULL,
    idcar integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.returncar;
       public         heap    postgres    false            �            1259    24670    returncar_idreturncar_seq    SEQUENCE     �   ALTER TABLE public.returncar ALTER COLUMN idreturncar ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.returncar_idreturncar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209                      0    40960    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    216   C                 0    32798    bonussystem 
   TABLE DATA           R   COPY public.bonussystem (idbonussystem, description, discountpercent) FROM stdin;
    public          postgres    false    215   0C       �          0    24627    car 
   TABLE DATA           }   COPY public.car (idcar, vinnumber, brand, classcar, name, transmission, color, yearofmanufacture, idlocationcar) FROM stdin;
    public          postgres    false    203   MC       �          0    24620    client 
   TABLE DATA           �   COPY public.client (idclient, login, password, familyname, name, patronymic, passportdata, driverslicense, numberofphone, idbonussystem) FROM stdin;
    public          postgres    false    201   jC                  0    32770    fine 
   TABLE DATA           U   COPY public.fine (idfine, description, cost, datefine, status, idclient) FROM stdin;
    public          postgres    false    211   �C                 0    32783    locationcar 
   TABLE DATA           F   COPY public.locationcar (idlocationcar, address, terrain) FROM stdin;
    public          postgres    false    213   �C       �          0    24634    rate 
   TABLE DATA           @   COPY public.rate (idrate, description, cost, idcar) FROM stdin;
    public          postgres    false    205   �C       �          0    24647    rentcar 
   TABLE DATA           g   COPY public.rentcar (idrentcar, countdaysrent, cost, dateofissue, idcar, idclient, idrate) FROM stdin;
    public          postgres    false    207   �C       �          0    24672 	   returncar 
   TABLE DATA           N   COPY public.returncar (idreturncar, condition, returndate, idcar) FROM stdin;
    public          postgres    false    209   �C                  0    0    bonussystem_idbonussystem_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.bonussystem_idbonussystem_seq', 1, false);
          public          postgres    false    214                       0    0    car_idcar_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.car_idcar_seq', 1, false);
          public          postgres    false    202                       0    0    client_idclient_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_idclient_seq', 1, false);
          public          postgres    false    200                       0    0    fine_idfine_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.fine_idfine_seq', 1, false);
          public          postgres    false    210                       0    0    locationcar_idlocationcar_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.locationcar_idlocationcar_seq', 1, false);
          public          postgres    false    212                       0    0    rate_idrate_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.rate_idrate_seq', 1, false);
          public          postgres    false    204                       0    0    rentcar_idrentcar_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.rentcar_idrentcar_seq', 1, false);
          public          postgres    false    206                       0    0    returncar_idreturncar_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.returncar_idreturncar_seq', 1, false);
          public          postgres    false    208            j           2606    40964 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    216            h           2606    32805    bonussystem bonussystem_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.bonussystem
    ADD CONSTRAINT bonussystem_pkey PRIMARY KEY (idbonussystem);
 F   ALTER TABLE ONLY public.bonussystem DROP CONSTRAINT bonussystem_pkey;
       public            postgres    false    215            \           2606    24631    car car_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (idcar);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    203            Z           2606    24624    client client_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (idclient);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    201            d           2606    32775    fine fine_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_pkey PRIMARY KEY (idfine);
 8   ALTER TABLE ONLY public.fine DROP CONSTRAINT fine_pkey;
       public            postgres    false    211            f           2606    32787    locationcar locationcar_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.locationcar
    ADD CONSTRAINT locationcar_pkey PRIMARY KEY (idlocationcar);
 F   ALTER TABLE ONLY public.locationcar DROP CONSTRAINT locationcar_pkey;
       public            postgres    false    213            ^           2606    24639    rate rate_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.rate
    ADD CONSTRAINT rate_pkey PRIMARY KEY (idrate);
 8   ALTER TABLE ONLY public.rate DROP CONSTRAINT rate_pkey;
       public            postgres    false    205            `           2606    24654    rentcar rentcar_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.rentcar
    ADD CONSTRAINT rentcar_pkey PRIMARY KEY (idrentcar);
 >   ALTER TABLE ONLY public.rentcar DROP CONSTRAINT rentcar_pkey;
       public            postgres    false    207            b           2606    24677    returncar returncar_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.returncar
    ADD CONSTRAINT returncar_pkey PRIMARY KEY (idreturncar);
 B   ALTER TABLE ONLY public.returncar DROP CONSTRAINT returncar_pkey;
       public            postgres    false    209            k           2606    32807    client fk_idbonussystem_client    FK CONSTRAINT     �   ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_idbonussystem_client FOREIGN KEY (idbonussystem) REFERENCES public.bonussystem(idbonussystem);
 H   ALTER TABLE ONLY public.client DROP CONSTRAINT fk_idbonussystem_client;
       public          postgres    false    201    2920    215            m           2606    24640    rate fk_idcar_rate    FK CONSTRAINT     p   ALTER TABLE ONLY public.rate
    ADD CONSTRAINT fk_idcar_rate FOREIGN KEY (idcar) REFERENCES public.car(idcar);
 <   ALTER TABLE ONLY public.rate DROP CONSTRAINT fk_idcar_rate;
       public          postgres    false    205    203    2908            n           2606    24655    rentcar fk_idcar_rentcar    FK CONSTRAINT     v   ALTER TABLE ONLY public.rentcar
    ADD CONSTRAINT fk_idcar_rentcar FOREIGN KEY (idcar) REFERENCES public.car(idcar);
 B   ALTER TABLE ONLY public.rentcar DROP CONSTRAINT fk_idcar_rentcar;
       public          postgres    false    2908    203    207            q           2606    24678    returncar fk_idcar_returncar    FK CONSTRAINT     z   ALTER TABLE ONLY public.returncar
    ADD CONSTRAINT fk_idcar_returncar FOREIGN KEY (idcar) REFERENCES public.car(idcar);
 F   ALTER TABLE ONLY public.returncar DROP CONSTRAINT fk_idcar_returncar;
       public          postgres    false    203    2908    209            r           2606    32776    fine fk_idclient_fine    FK CONSTRAINT     |   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fk_idclient_fine FOREIGN KEY (idclient) REFERENCES public.client(idclient);
 ?   ALTER TABLE ONLY public.fine DROP CONSTRAINT fk_idclient_fine;
       public          postgres    false    201    2906    211            o           2606    24660    rentcar fk_idclinet_rentcar    FK CONSTRAINT     �   ALTER TABLE ONLY public.rentcar
    ADD CONSTRAINT fk_idclinet_rentcar FOREIGN KEY (idclient) REFERENCES public.client(idclient);
 E   ALTER TABLE ONLY public.rentcar DROP CONSTRAINT fk_idclinet_rentcar;
       public          postgres    false    2906    201    207            l           2606    32791    car fk_idlocationcar_car    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fk_idlocationcar_car FOREIGN KEY (idlocationcar) REFERENCES public.locationcar(idlocationcar);
 B   ALTER TABLE ONLY public.car DROP CONSTRAINT fk_idlocationcar_car;
       public          postgres    false    203    2918    213            p           2606    24665    rentcar fk_idrate_rentcar    FK CONSTRAINT     z   ALTER TABLE ONLY public.rentcar
    ADD CONSTRAINT fk_idrate_rentcar FOREIGN KEY (idrate) REFERENCES public.rate(idrate);
 C   ALTER TABLE ONLY public.rentcar DROP CONSTRAINT fk_idrate_rentcar;
       public          postgres    false    207    205    2910                  x������ � �            x������ � �      �      x������ � �      �      x������ � �             x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     