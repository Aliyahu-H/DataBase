INSERT INTO CUSTOMER (first_nm, second_nm) VALUES ('Minna', 'Smorthit');

SELECT
  *
FROM
  customer
WHERE
  first_nm = 'Minna' and second_nm = 'Smorthit';

UPDATE customer SET second_nm = 'Colliar' WHERE first_nm = 'Minna';

DELETE FROM customer WHERE first_nm = 'Minna' AND second_nm = 'Colliar';