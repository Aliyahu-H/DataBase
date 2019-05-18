--Найдем книгу, за которую было получено больше всего денег
WITH sum_turnover AS (
  SELECT
    c.composition_nm as composition
    , sum(c.price_amt) as turnover
  FROM
    purchase p
  INNER JOIN
    purchase_x_composition p_c
    ON p_c.purchase_id = p.purchase_id
  INNER JOIN
    composition c
    ON p_c.composition_id = c.composition_id
  GROUP BY
    c.composition_nm
)
, max_turnover AS (
  SELECT
    max(turnover) as max
  FROM
    sum_turnover
)
SELECT
  st.composition
  , st.turnover
FROM
  sum_turnover st
  , max_turnover mt
WHERE
  st.turnover = mt.max;


--Найдем оброт по неделям
WITH sum_turnover AS (
  SELECT
    date_part('week', p.purchase_dt) as week
    , sum(c.price_amt) as turnover
  FROM
    purchase p
  INNER JOIN
    purchase_x_composition p_c
    ON p_c.purchase_id = p.purchase_id
  INNER JOIN
    composition c
    ON p_c.composition_id = c.composition_id
  GROUP BY
    week
  ORDER BY
    week
)
SELECT
  st.week
  , st.turnover
FROM
  sum_turnover st;


--Найдем самую продаваемую книгу
WITH sales_nb AS (
  SELECT
    c.composition_nm as composition
    , count(p.purchase_dt) as amount
  FROM
    purchase p
  INNER JOIN
    purchase_x_composition p_c
    ON p_c.purchase_id = p.purchase_id
  INNER JOIN
    composition c
    ON p_c.composition_id = c.composition_id
  GROUP BY
    c.composition_nm
)
, max_sale AS (
  SELECT
    max(amount) as max
  FROM
    sales_nb
)
SELECT
  sn.composition
  , sn.amount
FROM
  sales_nb sn
  , max_sale ms
WHERE
  sn.amount = ms.max;


--Клиент, потративший больше всего денег
WITH spent_money AS (
  SELECT
    ct.first_nm
    , ct.second_nm
    , sum(c.price_amt) as amount
  FROM
    purchase p
  INNER JOIN
    purchase_x_composition p_c
    ON p_c.purchase_id = p.purchase_id
  INNER JOIN
    composition c
    ON p_c.composition_id = c.composition_id
  INNER JOIN
    customer ct
  ON p.customer_id = ct.customer_id
  GROUP BY
    ct.first_nm
    , ct.second_nm
)
, max_spent AS (
  SELECT
    max(amount) as max
  FROM
    spent_money
)
SELECT
    sm.first_nm
    , sm.second_nm
    , sm.amount
FROM
  spent_money sm
  , max_spent ms
WHERE
  sm.amount = ms.max;


--Найдем книги, в которых содержится вся информация, связанная с расой (раса, её язык и божество)
WITH races AS (
  SELECT
    c.composition_nm
    , r.race_nm
  FROM
    race r
  INNER JOIN
    race_x_composition rxc
    ON r.race_id = rxc.race_id
  INNER JOIN
    composition c
    ON rxc.composition_id = c.composition_id)
, languages AS (
  SELECT
    c.composition_nm
    , l.language_nm
  FROM
    language l
  INNER JOIN
    language_x_composition lxc
    ON l.language_id = lxc.language_id
  INNER JOIN
    composition c
    ON lxc.composition_id = c.composition_id)
, gods AS (
  SELECT
    c.composition_nm
    , g.god_nm
  FROM
    god g
  INNER JOIN
    god_x_composition gxc
    ON g.god_id = gxc.god_id
  INNER JOIN
    composition c
    ON gxc.composition_id = c.composition_id)
, joined AS (
  SELECT
    r.race_nm
    , l.language_nm
    , g.god_nm
    , r.composition_nm
  FROM
    races r
  INNER JOIN
    languages l
    ON l.composition_nm = r.composition_nm
  INNER JOIN
    gods g
    ON g.composition_nm = l.composition_nm
)
SELECT
  j.composition_nm
FROM
  joined j
WHERE
  (j.race_nm, j.language_nm, j.god_nm) IN (
    SELECT
      r.race_nm
      , l.language_nm
      , g.god_nm
    FROM
      race r
    INNER JOIN
      language l
      ON r.language_id = l.language_id
    INNER JOIN
      god g
      ON r.god_id = g.god_id
);
