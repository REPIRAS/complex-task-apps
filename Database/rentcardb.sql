PGDMP                         y         
   rentcarsdb    13.2    13.2 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394 
   rentcarsdb    DATABASE     g   CREATE DATABASE rentcarsdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE rentcarsdb;
                postgres    false            �            1259    32798    bonussystem    TABLE     �   CREATE TABLE public.bonussystem (
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
            public          postgres    false    213            �            1259    24627    car    TABLE     �  CREATE TABLE public.car (
    idcar integer NOT NULL,
    vinnumber character varying(50) NOT NULL,
    brand character varying(50) NOT NULL,
    classcar character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    transmission character varying(20) NOT NULL,
    color character varying(30) NOT NULL,
    yearofmanufacture smallint NOT NULL,
    idlocationcar integer DEFAULT 1 NOT NULL,
    rented boolean NOT NULL,
    deleted boolean NOT NULL,
    idrate integer
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
            public          postgres    false    201            �            1259    73730    client    TABLE     �  CREATE TABLE public.client (
    idclient integer NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    familyname character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    passportdata character varying(25) NOT NULL,
    driverslicense character varying(25) NOT NULL,
    numberofphone character varying(25) NOT NULL,
    idbonussystem integer NOT NULL,
    blocked boolean NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    73728    client_idclient_seq    SEQUENCE     �   ALTER TABLE public.client ALTER COLUMN idclient ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_idclient_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    32770    fine    TABLE       CREATE TABLE public.fine (
    idfine integer NOT NULL,
    description character varying(70) NOT NULL,
    datefine timestamp without time zone NOT NULL,
    status character varying(10) NOT NULL,
    idclient integer NOT NULL,
    cost integer NOT NULL
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
            public          postgres    false    209            �            1259    32783    locationcar    TABLE     �   CREATE TABLE public.locationcar (
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
            public          postgres    false    211            �            1259    24634    rate    TABLE     �   CREATE TABLE public.rate (
    idrate integer NOT NULL,
    description character varying(50) NOT NULL,
    cost integer NOT NULL
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
            public          postgres    false    203            �            1259    24647    rentcar    TABLE       CREATE TABLE public.rentcar (
    idrentcar integer NOT NULL,
    dateofissue timestamp with time zone NOT NULL,
    idcar integer DEFAULT 1 NOT NULL,
    idclient integer NOT NULL,
    countdaysrent integer NOT NULL,
    deleted boolean NOT NULL,
    cost character varying NOT NULL
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
            public          postgres    false    205            �            1259    24672 	   returncar    TABLE     �   CREATE TABLE public.returncar (
    idreturncar integer NOT NULL,
    condition character varying(50) NOT NULL,
    idcar integer DEFAULT 1 NOT NULL,
    returndate timestamp with time zone NOT NULL
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
            public          postgres    false    207            �          0    32798    bonussystem 
   TABLE DATA           R   COPY public.bonussystem (idbonussystem, description, discountpercent) FROM stdin;
    public          postgres    false    213   b8       �          0    24627    car 
   TABLE DATA           �   COPY public.car (idcar, vinnumber, brand, classcar, name, transmission, color, yearofmanufacture, idlocationcar, rented, deleted, idrate) FROM stdin;
    public          postgres    false    201   �8       �          0    73730    client 
   TABLE DATA           �   COPY public.client (idclient, login, password, familyname, name, patronymic, passportdata, driverslicense, numberofphone, idbonussystem, blocked) FROM stdin;
    public          postgres    false    215   �9       �          0    32770    fine 
   TABLE DATA           U   COPY public.fine (idfine, description, datefine, status, idclient, cost) FROM stdin;
    public          postgres    false    209   �:       �          0    32783    locationcar 
   TABLE DATA           F   COPY public.locationcar (idlocationcar, address, terrain) FROM stdin;
    public          postgres    false    211   �:       �          0    24634    rate 
   TABLE DATA           9   COPY public.rate (idrate, description, cost) FROM stdin;
    public          postgres    false    203   3;       �          0    24647    rentcar 
   TABLE DATA           h   COPY public.rentcar (idrentcar, dateofissue, idcar, idclient, countdaysrent, deleted, cost) FROM stdin;
    public          postgres    false    205   �;       �          0    24672 	   returncar 
   TABLE DATA           N   COPY public.returncar (idreturncar, condition, idcar, returndate) FROM stdin;
    public          postgres    false    207   <       �           0    0    bonussystem_idbonussystem_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.bonussystem_idbonussystem_seq', 58, true);
          public          postgres    false    212            �           0    0    car_idcar_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.car_idcar_seq', 10, true);
          public          postgres    false    200            �           0    0    client_idclient_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_idclient_seq', 38, true);
          public          postgres    false    214                        0    0    fine_idfine_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.fine_idfine_seq', 1, false);
          public          postgres    false    208                       0    0    locationcar_idlocationcar_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.locationcar_idlocationcar_seq', 1, true);
          public          postgres    false    210                       0    0    rate_idrate_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.rate_idrate_seq', 5, true);
          public          postgres    false    202                       0    0    rentcar_idrentcar_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.rentcar_idrentcar_seq', 13, true);
          public          postgres    false    204                       0    0    returncar_idreturncar_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.returncar_idreturncar_seq', 1, false);
          public          postgres    false    206            _           2606    32805    bonussystem bonussystem_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.bonussystem
    ADD CONSTRAINT bonussystem_pkey PRIMARY KEY (idbonussystem);
 F   ALTER TABLE ONLY public.bonussystem DROP CONSTRAINT bonussystem_pkey;
       public            postgres    false    213            S           2606    24631    car car_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (idcar);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    201            a           2606    73734    client client_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (idclient);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    215            [           2606    32775    fine fine_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_pkey PRIMARY KEY (idfine);
 8   ALTER TABLE ONLY public.fine DROP CONSTRAINT fine_pkey;
       public            postgres    false    209            ]           2606    32787    locationcar locationcar_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.locationcar
    ADD CONSTRAINT locationcar_pkey PRIMARY KEY (idlocationcar);
 F   ALTER TABLE ONLY public.locationcar DROP CONSTRAINT locationcar_pkey;
       public            postgres    false    211            U           2606    24639    rate rate_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.rate
    ADD CONSTRAINT rate_pkey PRIMARY KEY (idrate);
 8   ALTER TABLE ONLY public.rate DROP CONSTRAINT rate_pkey;
       public            postgres    false    203            W           2606    24654    rentcar rentcar_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.rentcar
    ADD CONSTRAINT rentcar_pkey PRIMARY KEY (idrentcar);
 >   ALTER TABLE ONLY public.rentcar DROP CONSTRAINT rentcar_pkey;
       public            postgres    false    205            Y           2606    24677    returncar returncar_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.returncar
    ADD CONSTRAINT returncar_pkey PRIMARY KEY (idreturncar);
 B   ALTER TABLE ONLY public.returncar DROP CONSTRAINT returncar_pkey;
       public            postgres    false    207            c           2606    24655    rentcar fk_idcar_rentcar    FK CONSTRAINT     v   ALTER TABLE ONLY public.rentcar
    ADD CONSTRAINT fk_idcar_rentcar FOREIGN KEY (idcar) REFERENCES public.car(idcar);
 B   ALTER TABLE ONLY public.rentcar DROP CONSTRAINT fk_idcar_rentcar;
       public          postgres    false    2899    201    205            d           2606    24678    returncar fk_idcar_returncar    FK CONSTRAINT     z   ALTER TABLE ONLY public.returncar
    ADD CONSTRAINT fk_idcar_returncar FOREIGN KEY (idcar) REFERENCES public.car(idcar);
 F   ALTER TABLE ONLY public.returncar DROP CONSTRAINT fk_idcar_returncar;
       public          postgres    false    207    2899    201            b           2606    32791    car fk_idlocationcar_car    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fk_idlocationcar_car FOREIGN KEY (idlocationcar) REFERENCES public.locationcar(idlocationcar);
 B   ALTER TABLE ONLY public.car DROP CONSTRAINT fk_idlocationcar_car;
       public          postgres    false    201    2909    211            �   J   x�3�0��S��/l����_�wa����1�1D�� ��9�	T+YC.#��!6��\�F0�X䍸b���� "L�      �     x����J�@F�w�"O �L~�M��$CHm"��f�Ն���v�RA\������7rR���r绛�w��Z<�b��&Y�0�mNK��=5Ey'�+�&_�N񩹑�ͥ|V�-�bU�J���gj��H('&��3K�)����Nm�h�b����W�k���?�~-&U봕s�����]�#�Y��Uյ5Sq>�����y�>���QVp�[u�z]Ђ��O��ں�J\�b�K�b�Q��D��3�l9���C�r��s?�n�� ��1u��      �   �   x�e�=
�@���a�ݙ%�]ll��\ b#��X� XX��@4�3����Du�-潝���J���DN�I���8��+�&�Q��zr�~I�F�CƲ�e��X;�(K����4/��.�m,��P��y�����%j�'4*����e+����q.{�%\u`�I������*6>�s�EKة:�[}�~C{�BE���}Vu,=s<
���.�9      �      x������ � �      �   @   x�3�0���]��yaх�6\lr7\�}���^ �_����/��	�r��+F��� �"�      �   l   x�U̽�@����.�KB�a��D�DDH�����ȕ�~l�{F�L\<�T�R�Zf�x���Yu�F���^M�+qr�ս3nj�����[�|�&�>�z?PT<�      �   E   x�34�4202�50�5�T00�#mcNCNcNC�4 ��@�b������qi �Vn��<F��� I      �      x������ � �     