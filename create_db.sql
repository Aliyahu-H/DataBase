CREATE TABLE public.GOD(
  god_id SERIAL PRIMARY KEY
  , god_nm VARCHAR(20) NOT NULL UNIQUE
  , god_desc VARCHAR(255)
  , is_canon_flg BOOLEAN DEFAULT TRUE
);

CREATE TABLE public.LANGUAGE(
  language_id SERIAL PRIMARY KEY
  , language_nm VARCHAR(20) NOT NULL UNIQUE
  , language_desc VARCHAR(255)
  , is_canon_flg BOOLEAN DEFAULT TRUE
);

CREATE TABLE public.RACE(
  race_id SERIAL PRIMARY KEY
  , god_id SERIAL
  , language_id SERIAL
  , race_nm VARCHAR(20) NOT NULL UNIQUE
  , race_desc VARCHAR(255)
  , is_canon_flg BOOLEAN DEFAULT TRUE
  , FOREIGN KEY(god_id) REFERENCES public.GOD (god_id)
  , FOREIGN KEY(language_id) REFERENCES public.LANGUAGE (language_id)
);

CREATE TABLE public.AUTHOR(
  author_id SERIAL PRIMARY KEY
  , first_nm VARCHAR(20) NOT NULL
  , second_nm VARCHAR(20) NOT NULL
  , birth_dt DATE
  , death_dt DATE
  , status_txt VARCHAR(20) NOT NULL DEFAULT 'Follower'
);

CREATE TABLE public.COMPOSITION(
  composition_id SERIAL PRIMARY KEY
  , author_id SERIAL
  , composition_nm VARCHAR(75) NOT NULL UNIQUE
  , writing_dt DATE
  , publication_dt DATE CHECK (publication_dt - writing_dt > 0)
  , price_amt REAL NOT NULL CHECK (price_amt > 0)
  , FOREIGN KEY(author_id) REFERENCES public.AUTHOR (author_id)
);

CREATE TABLE public.CUSTOMER(
  customer_id SERIAL PRIMARY KEY
  , first_nm VARCHAR(20)
  , second_nm VARCHAR(20)
  , purchase_cnt INTEGER DEFAULT 0 CHECK (purchase_cnt>=0)
);

CREATE TABLE public.PURCHASE(
  purchase_id SERIAL PRIMARY KEY
  , purchase_dt DATE NOT NULL
  , customer_id SERIAL
  , FOREIGN KEY(customer_id) REFERENCES public.CUSTOMER (customer_id)
);

CREATE TABLE GOD_X_COMPOSITION(
  god_id SERIAL
  , composition_id SERIAL
  , PRIMARY KEY (god_id, composition_id)
  , FOREIGN KEY(god_id) REFERENCES public.GOD (god_id)
  , FOREIGN KEY(composition_id) REFERENCES public.COMPOSITION (composition_id)
);

CREATE TABLE RACE_X_COMPOSITION(
  race_id SERIAL
  , composition_id SERIAL
  , PRIMARY KEY (race_id, composition_id)
  , FOREIGN KEY(race_id) REFERENCES public.RACE (race_id)
  , FOREIGN KEY(composition_id) REFERENCES public.COMPOSITION (composition_id)
);

CREATE TABLE LANGUAGE_X_COMPOSITION(
  language_id SERIAL
  , composition_id SERIAL
  , PRIMARY KEY (language_id, composition_id)
  , FOREIGN KEY(language_id) REFERENCES public.LANGUAGE (language_id)
  , FOREIGN KEY(composition_id) REFERENCES public.COMPOSITION (composition_id)
);

CREATE TABLE PURCHASE_X_COMPOSITION(
  purchase_id SERIAL
  , composition_id SERIAL
  , PRIMARY KEY (purchase_id, composition_id)
  , FOREIGN KEY(purchase_id) REFERENCES public.PURCHASE (purchase_id)
  , FOREIGN KEY(composition_id) REFERENCES public.COMPOSITION (composition_id)
);