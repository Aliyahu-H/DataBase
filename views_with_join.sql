CREATE VIEW v_published_after_death AS
    SELECT
      concat(a.first_nm, ' ', a.second_nm) as author
      , c.composition_nm as composition
      , c.price_amt as price
    FROM
      author a
    INNER JOIN
      composition c
      ON a.author_id = c.author_id
    WHERE
      c.publication_dt >= a.death_dt;


CREATE VIEW v_race_full_info AS
    SELECT
      concat(r.race_nm, ': ', r.race_desc) as race
      , concat(l.language_nm, ': ', l.language_desc) as language
      , concat(g.god_nm, ': ', g.god_desc) as god
    FROM
      race r
    INNER JOIN
      language l
      ON r.language_id = l.language_id
    LEFT JOIN
      god g
      ON r.god_id = g.god_id;

CREATE VIEW v_purchase_full_info AS
    WITH prices AS(
        SELECT
          p.purchase_id
          , sum(c.price_amt) as price
        FROM
          purchase p
        INNER JOIN
          purchase_x_composition pxc
          ON p.purchase_id = pxc.purchase_id
        INNER JOIN
          composition c
          ON pxc.composition_id = c.composition_id
        GROUP BY
          p.purchase_id
    )
    SELECT
      p.purchase_dt as date
      , c.composition_nm as composition
      , concat(a.first_nm, ' ', a.second_nm) as author
      , concat(ct.first_nm, ' ', ct.second_nm) as customer
      , (select price from prices where prices.purchase_id = p.purchase_id)
    FROM
      purchase p
    INNER JOIN
      purchase_x_composition pxc
      ON p.purchase_id = pxc.purchase_id
    INNER JOIN
      composition c
      ON pxc.composition_id = c.composition_id
    INNER JOIN
      author a
      ON c.author_id = a.author_id
    INNER JOIN
      customer ct
      ON p.customer_id = ct.customer_id
    ORDER BY
      p.purchase_dt;