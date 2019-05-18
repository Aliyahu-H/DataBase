CREATE VIEW v_published_after_death AS
    SELECT
      concat(a.first_nm, ' ', a.second_nm) as author
      , c.composition_nm
      , c.price_amt
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