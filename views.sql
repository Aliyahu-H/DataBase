CREATE VIEW v_author AS
    SELECT
      first_nm
      , second_nm
      , birth_dt
      , death_dt
      , status_txt
    FROM
      author;


CREATE VIEW v_composition AS
    SELECT
      composition_nm
      , writing_dt
      , publication_dt
      , price_amt
    FROM
      composition;


CREATE VIEW v_customer AS
    SELECT
      first_nm
      , second_nm
      , purchase_cnt
    FROM
      customer;


CREATE VIEW v_god AS
    SELECT
      god_nm
      , god_desc
      , is_canon_flg
    FROM
      god;


CREATE VIEW v_language AS
    SELECT
      language_nm
      , language_desc
      , is_canon_flg
    FROM
      language;


CREATE VIEW v_purchase AS
    SELECT
      purchase_dt
    FROM
      purchase;


CREATE VIEW v_race AS
    SELECT
      race_nm
      , race_desc
      , is_canon_flg
    FROM
      race;