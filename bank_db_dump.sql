PGDMP  %                    |            bank_sys_db    14.15 (Homebrew)    16.0 g    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    123217    bank_sys_db    DATABASE     m   CREATE DATABASE bank_sys_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE bank_sys_db;
                minmaunghein    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                minmaunghein    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   minmaunghein    false    4            �            1255    123402    update_employee_timestamp()    FUNCTION     �   CREATE FUNCTION public.update_employee_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.updated_at = CURRENT_TIMESTAMP;
	RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.update_employee_timestamp();
       public          minmaunghein    false    4            �            1259    123310    accounts    TABLE     �  CREATE TABLE public.accounts (
    id integer NOT NULL,
    account_number character varying(100) NOT NULL,
    account_type integer NOT NULL,
    balance double precision NOT NULL,
    currency character varying(100) NOT NULL,
    status integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer,
    customer_id integer
);
    DROP TABLE public.accounts;
       public         heap    minmaunghein    false    4            �            1259    123309    accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.accounts_id_seq;
       public          minmaunghein    false    4    218            �           0    0    accounts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;
          public          minmaunghein    false    217            �            1259    123363    accounts_transaction    TABLE     �   CREATE TABLE public.accounts_transaction (
    id integer NOT NULL,
    type integer NOT NULL,
    amount double precision NOT NULL,
    created_at timestamp without time zone,
    description text,
    account_id integer
);
 (   DROP TABLE public.accounts_transaction;
       public         heap    minmaunghein    false    4            �            1259    123362    accounts_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.accounts_transaction_id_seq;
       public          minmaunghein    false    4    224            �           0    0    accounts_transaction_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.accounts_transaction_id_seq OWNED BY public.accounts_transaction.id;
          public          minmaunghein    false    223            �            1259    123219    branches    TABLE     �   CREATE TABLE public.branches (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address text,
    phone_number character varying(100) NOT NULL
);
    DROP TABLE public.branches;
       public         heap    minmaunghein    false    4            �            1259    123218    branches_id_seq    SEQUENCE     �   CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.branches_id_seq;
       public          minmaunghein    false    210    4            �           0    0    branches_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;
          public          minmaunghein    false    209            �            1259    123349    cards    TABLE     �   CREATE TABLE public.cards (
    id integer NOT NULL,
    number character varying(100) NOT NULL,
    card_type integer NOT NULL,
    expire_date date NOT NULL,
    security_code character varying(6) NOT NULL,
    account_id integer
);
    DROP TABLE public.cards;
       public         heap    minmaunghein    false    4            �            1259    123348    cards_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cards_id_seq;
       public          minmaunghein    false    222    4            �           0    0    cards_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;
          public          minmaunghein    false    221            �            1259    123377    cards_transaction    TABLE     �   CREATE TABLE public.cards_transaction (
    id integer NOT NULL,
    type integer NOT NULL,
    amount double precision NOT NULL,
    created_at timestamp without time zone,
    description text,
    account_id integer,
    card_id integer
);
 %   DROP TABLE public.cards_transaction;
       public         heap    minmaunghein    false    4            �            1259    123376    cards_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cards_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.cards_transaction_id_seq;
       public          minmaunghein    false    4    226            �           0    0    cards_transaction_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.cards_transaction_id_seq OWNED BY public.cards_transaction.id;
          public          minmaunghein    false    225            �            1259    123282 	   customers    TABLE     7  CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100),
    email character varying(100) NOT NULL,
    nrc character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    address text,
    date_of_birth date,
    confirmed_at timestamp without time zone DEFAULT now(),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer,
    status integer NOT NULL
);
    DROP TABLE public.customers;
       public         heap    minmaunghein    false    4            �            1259    123281    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          minmaunghein    false    216    4            �           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          minmaunghein    false    215            �            1259    123396    daily_exchange_rates    TABLE     �   CREATE TABLE public.daily_exchange_rates (
    id integer NOT NULL,
    exchange_rate double precision,
    currency character varying(10),
    created_at timestamp without time zone
);
 (   DROP TABLE public.daily_exchange_rates;
       public         heap    minmaunghein    false    4            �            1259    123395    daily_exchange_rates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.daily_exchange_rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.daily_exchange_rates_id_seq;
       public          minmaunghein    false    4    228            �           0    0    daily_exchange_rates_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.daily_exchange_rates_id_seq OWNED BY public.daily_exchange_rates.id;
          public          minmaunghein    false    227            �            1259    123243 	   employees    TABLE     �  CREATE TABLE public.employees (
    id integer NOT NULL,
    username character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    password character varying(255) NOT NULL,
    phone_number character varying(100) NOT NULL,
    status integer NOT NULL,
    "position" character varying(100) NOT NULL,
    department character varying(100),
    confirmed_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    users_role_id integer,
    branch_id integer,
    created_by integer,
    updated_by integer,
    login_token character varying
);
    DROP TABLE public.employees;
       public         heap    minmaunghein    false    4            �            1259    123242    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          minmaunghein    false    4    214            �           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          minmaunghein    false    213            �            1259    123331    loans    TABLE     .  CREATE TABLE public.loans (
    id integer NOT NULL,
    loan_type integer NOT NULL,
    loan_amount double precision NOT NULL,
    status integer NOT NULL,
    interest_rate double precision NOT NULL,
    loan_start_date date DEFAULT now(),
    loan_end_date date NOT NULL,
    customer_id integer
);
    DROP TABLE public.loans;
       public         heap    minmaunghein    false    4            �            1259    123330    loans_id_seq    SEQUENCE     �   CREATE SEQUENCE public.loans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.loans_id_seq;
       public          minmaunghein    false    4    220            �           0    0    loans_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.loans_id_seq OWNED BY public.loans.id;
          public          minmaunghein    false    219            �            1259    123232 
   users_role    TABLE     |   CREATE TABLE public.users_role (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);
    DROP TABLE public.users_role;
       public         heap    minmaunghein    false    4            �            1259    123231    users_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_role_id_seq;
       public          minmaunghein    false    212    4            �           0    0    users_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users_role.id;
          public          minmaunghein    false    211            �           2604    123313    accounts id    DEFAULT     j   ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);
 :   ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    218    217    218            �           2604    123366    accounts_transaction id    DEFAULT     �   ALTER TABLE ONLY public.accounts_transaction ALTER COLUMN id SET DEFAULT nextval('public.accounts_transaction_id_seq'::regclass);
 F   ALTER TABLE public.accounts_transaction ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    224    223    224            �           2604    123222    branches id    DEFAULT     j   ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);
 :   ALTER TABLE public.branches ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    209    210    210            �           2604    123352    cards id    DEFAULT     d   ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);
 7   ALTER TABLE public.cards ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    221    222    222            �           2604    123380    cards_transaction id    DEFAULT     |   ALTER TABLE ONLY public.cards_transaction ALTER COLUMN id SET DEFAULT nextval('public.cards_transaction_id_seq'::regclass);
 C   ALTER TABLE public.cards_transaction ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    226    225    226            �           2604    123285    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    216    215    216            �           2604    123399    daily_exchange_rates id    DEFAULT     �   ALTER TABLE ONLY public.daily_exchange_rates ALTER COLUMN id SET DEFAULT nextval('public.daily_exchange_rates_id_seq'::regclass);
 F   ALTER TABLE public.daily_exchange_rates ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    227    228    228            �           2604    123246    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    214    213    214            �           2604    123334    loans id    DEFAULT     d   ALTER TABLE ONLY public.loans ALTER COLUMN id SET DEFAULT nextval('public.loans_id_seq'::regclass);
 7   ALTER TABLE public.loans ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    219    220    220            �           2604    123235    users_role id    DEFAULT     n   ALTER TABLE ONLY public.users_role ALTER COLUMN id SET DEFAULT nextval('public.users_role_id_seq'::regclass);
 <   ALTER TABLE public.users_role ALTER COLUMN id DROP DEFAULT;
       public          minmaunghein    false    211    212    212            �          0    123310    accounts 
   TABLE DATA           �   COPY public.accounts (id, account_number, account_type, balance, currency, status, created_at, updated_at, created_by, updated_by, customer_id) FROM stdin;
    public          minmaunghein    false    218   ��       �          0    123363    accounts_transaction 
   TABLE DATA           e   COPY public.accounts_transaction (id, type, amount, created_at, description, account_id) FROM stdin;
    public          minmaunghein    false    224   ��       �          0    123219    branches 
   TABLE DATA           C   COPY public.branches (id, name, address, phone_number) FROM stdin;
    public          minmaunghein    false    210   ��       �          0    123349    cards 
   TABLE DATA           ^   COPY public.cards (id, number, card_type, expire_date, security_code, account_id) FROM stdin;
    public          minmaunghein    false    222   �       �          0    123377    cards_transaction 
   TABLE DATA           k   COPY public.cards_transaction (id, type, amount, created_at, description, account_id, card_id) FROM stdin;
    public          minmaunghein    false    226   ,�       �          0    123282 	   customers 
   TABLE DATA           �   COPY public.customers (id, first_name, last_name, email, nrc, phone, address, date_of_birth, confirmed_at, created_at, updated_at, created_by, updated_by, status) FROM stdin;
    public          minmaunghein    false    216   I�       �          0    123396    daily_exchange_rates 
   TABLE DATA           W   COPY public.daily_exchange_rates (id, exchange_rate, currency, created_at) FROM stdin;
    public          minmaunghein    false    228   f�       �          0    123243 	   employees 
   TABLE DATA           �   COPY public.employees (id, username, email, password, phone_number, status, "position", department, confirmed_at, created_at, updated_at, users_role_id, branch_id, created_by, updated_by, login_token) FROM stdin;
    public          minmaunghein    false    214   ��       �          0    123331    loans 
   TABLE DATA              COPY public.loans (id, loan_type, loan_amount, status, interest_rate, loan_start_date, loan_end_date, customer_id) FROM stdin;
    public          minmaunghein    false    220   �       �          0    123232 
   users_role 
   TABLE DATA           ;   COPY public.users_role (id, name, description) FROM stdin;
    public          minmaunghein    false    212   �       �           0    0    accounts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.accounts_id_seq', 1, false);
          public          minmaunghein    false    217            �           0    0    accounts_transaction_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.accounts_transaction_id_seq', 1, false);
          public          minmaunghein    false    223            �           0    0    branches_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.branches_id_seq', 1, false);
          public          minmaunghein    false    209            �           0    0    cards_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cards_id_seq', 1, false);
          public          minmaunghein    false    221            �           0    0    cards_transaction_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.cards_transaction_id_seq', 1, false);
          public          minmaunghein    false    225            �           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 1, false);
          public          minmaunghein    false    215            �           0    0    daily_exchange_rates_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.daily_exchange_rates_id_seq', 1, false);
          public          minmaunghein    false    227            �           0    0    employees_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.employees_id_seq', 22, true);
          public          minmaunghein    false    213            �           0    0    loans_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.loans_id_seq', 1, false);
          public          minmaunghein    false    219            �           0    0    users_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_role_id_seq', 1, false);
          public          minmaunghein    false    211                       2606    123319 $   accounts accounts_account_number_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_account_number_key UNIQUE (account_number);
 N   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_account_number_key;
       public            minmaunghein    false    218                       2606    123317    accounts accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            minmaunghein    false    218                       2606    123370 .   accounts_transaction accounts_transaction_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accounts_transaction
    ADD CONSTRAINT accounts_transaction_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.accounts_transaction DROP CONSTRAINT accounts_transaction_pkey;
       public            minmaunghein    false    224            �           2606    123228    branches branches_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_name_key;
       public            minmaunghein    false    210            �           2606    123230 "   branches branches_phone_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_phone_number_key UNIQUE (phone_number);
 L   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_phone_number_key;
       public            minmaunghein    false    210            �           2606    123226    branches branches_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_pkey;
       public            minmaunghein    false    210                       2606    123356    cards cards_number_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_number_key UNIQUE (number);
 @   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_number_key;
       public            minmaunghein    false    222                       2606    123354    cards cards_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_pkey;
       public            minmaunghein    false    222                       2606    123384 (   cards_transaction cards_transaction_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.cards_transaction
    ADD CONSTRAINT cards_transaction_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.cards_transaction DROP CONSTRAINT cards_transaction_pkey;
       public            minmaunghein    false    226            �           2606    123294    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            minmaunghein    false    216            �           2606    123296    customers customers_nrc_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_nrc_key UNIQUE (nrc);
 E   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_nrc_key;
       public            minmaunghein    false    216                       2606    123298    customers customers_phone_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_phone_key;
       public            minmaunghein    false    216                       2606    123292    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            minmaunghein    false    216                       2606    123401 .   daily_exchange_rates daily_exchange_rates_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.daily_exchange_rates
    ADD CONSTRAINT daily_exchange_rates_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.daily_exchange_rates DROP CONSTRAINT daily_exchange_rates_pkey;
       public            minmaunghein    false    228            �           2606    123256    employees employees_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_email_key;
       public            minmaunghein    false    214            �           2606    123260 $   employees employees_phone_number_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_phone_number_key UNIQUE (phone_number);
 N   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_phone_number_key;
       public            minmaunghein    false    214            �           2606    123252    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            minmaunghein    false    214            �           2606    123254     employees employees_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_username_key;
       public            minmaunghein    false    214            	           2606    123337    loans loans_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_pkey;
       public            minmaunghein    false    220            �           2606    123241    users_role users_role_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users_role
    ADD CONSTRAINT users_role_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.users_role DROP CONSTRAINT users_role_name_key;
       public            minmaunghein    false    212            �           2606    123239    users_role users_role_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.users_role
    ADD CONSTRAINT users_role_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.users_role DROP CONSTRAINT users_role_pkey;
       public            minmaunghein    false    212            "           2620    123403 #   employees listening_employee_update    TRIGGER     �   CREATE TRIGGER listening_employee_update BEFORE UPDATE ON public.employees FOR EACH ROW EXECUTE FUNCTION public.update_employee_timestamp();
 <   DROP TRIGGER listening_employee_update ON public.employees;
       public          minmaunghein    false    214    229                       2606    123320 !   accounts accounts_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.employees(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_created_by_fkey;
       public          minmaunghein    false    218    214    3577                       2606    123371 9   accounts_transaction accounts_transaction_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_transaction
    ADD CONSTRAINT accounts_transaction_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.accounts_transaction DROP CONSTRAINT accounts_transaction_account_id_fkey;
       public          minmaunghein    false    3591    224    218                       2606    123325 !   accounts accounts_updated_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.employees(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_updated_by_fkey;
       public          minmaunghein    false    214    218    3577                       2606    123357    cards cards_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_account_id_fkey;
       public          minmaunghein    false    3591    222    218                        2606    123385 3   cards_transaction cards_transaction_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cards_transaction
    ADD CONSTRAINT cards_transaction_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.cards_transaction DROP CONSTRAINT cards_transaction_account_id_fkey;
       public          minmaunghein    false    3591    226    218            !           2606    123390 0   cards_transaction cards_transaction_card_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cards_transaction
    ADD CONSTRAINT cards_transaction_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.cards_transaction DROP CONSTRAINT cards_transaction_card_id_fkey;
       public          minmaunghein    false    222    226    3597                       2606    123299 #   customers customers_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.employees(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_created_by_fkey;
       public          minmaunghein    false    214    3577    216                       2606    123304 #   customers customers_updated_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.employees(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_updated_by_fkey;
       public          minmaunghein    false    214    216    3577                       2606    123266 "   employees employees_branch_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_branch_id_fkey;
       public          minmaunghein    false    210    214    3567                       2606    123271 #   employees employees_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.employees(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_created_by_fkey;
       public          minmaunghein    false    214    214    3577                       2606    123276 #   employees employees_updated_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.employees(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_updated_by_fkey;
       public          minmaunghein    false    214    3577    214                       2606    123261 &   employees employees_users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_users_role_id_fkey FOREIGN KEY (users_role_id) REFERENCES public.users_role(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_users_role_id_fkey;
       public          minmaunghein    false    214    212    3571                       2606    123343    accounts fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.accounts DROP CONSTRAINT fk_customer;
       public          minmaunghein    false    218    3587    216                       2606    123338    loans loans_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_customer_id_fkey;
       public          minmaunghein    false    3587    220    216            �      x������ � �      �      x������ � �      �   >   x�3�L�K��S��I�MLI,�4�47��07\F��)����y���@	����W� ͉>      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   V  x����n�@�����=�������p$��Kp8�r����6�|Q�1��|�w��ҍ�^d�1��Va���Ɋ\O�/����Ն?&��P�dT�7�qݪC��d����Z.��.�n�g�+�M��~�#?z�Q&>�D�� �<��RY��R'Û�Q���MC���d���4�Ze��8}���M��9H�1H@k�r�����Ļ���<<�m��7�n�E'�֪�$�f��>�=O'�6��������3o�M�����9Tm�Cu��#kkx����>�L��L�T���4<x�$��G�$k����j�� y����#/��R�s]���%J�ȊyN".x	]-5����+F��6�1^���� dmwѫdw�Қ�De\��Ŵ6 ��dQ*/*;Az�4@Q�(�+������(!YQ*W� \͆���,��|햇x�E����X��� Q�Ҡ�� ������Ϋ������r�����g�)��a7��8ղ(�GU'�^�8�u�0.���Y�@���d�9]��X��OZ��C(�jeXA&�
��0���H)m�l}�XQ�qC������}.��d��0j�Ӷ���5�q������R�9d�c��w�� \yI��p� (chb,����0�P���8<w	������M �ϙUGv)Hp�2�sd�9=�>�����fٯ��f:I�o�A�?Y=���f��}�]T�B��z��<�f}V?[�QU�/�}?�_�d��i��_��`��vA�H�Jޅ���\+��t�;LԘR�)��^��n5ZoO��K&~=��ڦ���O��Y.�Ѳ�?'�~�R����      �      x������ � �      �   =   x�3�,�L-O-���˩T ���S����8SS2K��1gbJnfgZiNLM� %�     