set search_path = public;
set datestyle to 'mdy';

INSERT INTO GOD (god_nm, god_desc, is_canon_flg)
SELECT
  'Cthulhu', 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', TRUE
UNION
SELECT
  'Hastur', 'Integer ac leo. Pellentesque ultrices mattis odio.', TRUE
UNION
SELECT
  'Shub-Niggurath', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', TRUE
UNION
SELECT
  'Nyarlathotep', 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', TRUE
UNION
SELECT
  'Dagon', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', TRUE
UNION
SELECT
  'Yog-Sothoth', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', TRUE;


insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Tswana', 'Etiam faucibus cursus urna.', true);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Burmese', 'In sagittis dui vel nisl.', false);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Bosnian', 'Donec semper sapien a libero.', true);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Guaraní', 'Pellentesque at nulla. Suspendisse potenti.', true);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Fijian', 'Curabitur convallis.', true);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Hindi', 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', false);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Cthulhu Fhtagn', 'Morbi non quam nec dui luctus rutrum.', false);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Papiamento', 'Nam nulla.', false);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Arabic', 'Nulla suscipit ligula in lacus.', true);
insert into LANGUAGE (language_nm, language_desc, is_canon_flg) values ('Rlieh', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', true);


INSERT INTO RACE (race_nm, language_id, race_desc, is_canon_flg, god_id)
SELECT
  'Deep One', 1, 'Aenean auctor gravida sem.', TRUE, g.god_id
FROM
  GOD as g
WHERE
  g.god_nm = 'Dagon'
UNION
SELECT
  'Children of Cthulhu', 2, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', TRUE, g.god_id
FROM
  GOD as g
WHERE
  g.god_nm = 'Cthulhu'
UNION
SELECT
  'Mi-Go', 3, 'Aliquam erat volutpat. In congue. Etiam justo.', TRUE, g.god_id
FROM
  GOD as g
WHERE
  g.god_nm = 'Yog-Sothoth'
UNION
SELECT
  'Elder Thing', 4, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst.', TRUE, g.god_id
FROM
  GOD as g
WHERE
  g.god_nm = 'Hastur'
UNION
SELECT
  'Dark Young', 5, 'Etiam faucibus cursus urna. Ut tellus.', TRUE, g.god_id
FROM
  GOD as g
WHERE
  g.god_nm = 'Shub-Niggurath'
UNION
SELECT
  'Shoggoth', 6, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', TRUE, g.god_id
FROM
  GOD as g
WHERE
  g.god_nm = 'Nyarlathotep';


insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Aluin', 'Le feuvre', '6/12/1953', '12/21/2006');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Rodrigo', 'Beswetherick', '10/17/1944', '1/9/1987');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Kassie', 'Simononsky', '10/11/1903', '11/27/1980');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Barbara-anne', 'Yoakley', '4/5/1892', '11/19/1964');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Meryl', 'Wash', '6/21/1918', '2/6/1944');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Urbano', 'Beynke', '4/9/1946', '7/28/1985');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Amara', 'Tomicki', '8/21/1979', '1/13/2015');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Theressa', 'Makin', '7/1/1972', '7/23/1995');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Constancy', 'Cabera', '4/30/1962', '4/28/1990');
insert into AUTHOR (first_nm, second_nm, birth_dt, death_dt) values ('Georgeanne', 'McEwen', '1/20/1904', '12/4/1995');


insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (1, 'And Then Came Lola', '8/17/1978', '5/11/1979', 91.56);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (2, 'Tin Toy', '5/25/1984', '8/9/1991', 72.4);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (3, 'Honeymoon', '11/10/1954', '12/10/1954', 14.96);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (4, 'Farewell to Matyora', '5/24/1916', '2/14/1917', 10.67);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (5, 'Queen of the Damned', '1/4/1943', '4/15/1943', 48.55);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (6, 'I Knew It Was You: Rediscovering John Cazale', '3/6/1974', '5/4/1978', 44.09);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (7, 'Playing for Time', '12/24/2003', '12/28/2004', 52.63);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (8, '7 Plus Seven', '6/23/1995', '2/26/1997', 69.97);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (9, 'Prefontaine', '8/29/1989', '12/28/1993', 48.16);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (10, 'Gasoline (Benzina)', '2/11/1939', '10/18/1946', 46.7);
insert into COMPOSITION (author_id, composition_nm, writing_dt, publication_dt, price_amt) values (1, '21 and Over', '8/17/1991', '5/11/1993', 213);


insert into CUSTOMER (first_nm, second_nm) values ('Estée', 'Dericot');
insert into CUSTOMER (first_nm, second_nm) values ('Béatrice', 'Castard');
insert into CUSTOMER (first_nm, second_nm) values ('Agnès', 'Aveyard');
insert into CUSTOMER (first_nm, second_nm) values ('Cinéma', 'Bruster');
insert into CUSTOMER (first_nm, second_nm) values ('Renée', 'Mellsop');
insert into CUSTOMER (first_nm, second_nm) values ('Göran', 'Pocke');
insert into CUSTOMER (first_nm, second_nm) values ('Bénédicte', 'Dagg');
insert into CUSTOMER (first_nm, second_nm) values ('Laurène', 'Tisor');
insert into CUSTOMER (first_nm, second_nm) values ('Östen', 'Scrancher');
insert into CUSTOMER (first_nm, second_nm) values ('Maïwenn', 'Gillease');


insert into PURCHASE (purchase_dt, customer_id) values ('4/12/2019', 2);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 2;
insert into PURCHASE (purchase_dt, customer_id) values ('3/14/2019', 6);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 6;
insert into PURCHASE (purchase_dt, customer_id) values ('1/21/2019', 8);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 8;
insert into PURCHASE (purchase_dt, customer_id) values ('1/11/2019', 7);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 7;
insert into PURCHASE (purchase_dt, customer_id) values ('4/6/2019', 10);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 10;
insert into PURCHASE (purchase_dt, customer_id) values ('2/13/2019', 1);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 1;
insert into PURCHASE (purchase_dt, customer_id) values ('3/17/2019', 7);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 7;
insert into PURCHASE (purchase_dt, customer_id) values ('3/24/2019', 5);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 5;
insert into PURCHASE (purchase_dt, customer_id) values ('1/31/2019', 3);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 3;
insert into PURCHASE (purchase_dt, customer_id) values ('4/21/2019', 8);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 8;
insert into PURCHASE (purchase_dt, customer_id) values ('5/5/2019', 7);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 7;
insert into PURCHASE (purchase_dt, customer_id) values ('5/4/2019', 10);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 10;
insert into PURCHASE (purchase_dt, customer_id) values ('3/23/2019', 2);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 2;
insert into PURCHASE (purchase_dt, customer_id) values ('4/16/2019', 3);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 3;
insert into PURCHASE (purchase_dt, customer_id) values ('3/12/2019', 10);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 10;
insert into PURCHASE (purchase_dt, customer_id) values ('5/8/2019', 3);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 3;
insert into PURCHASE (purchase_dt, customer_id) values ('4/14/2019', 10);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 10;
insert into PURCHASE (purchase_dt, customer_id) values ('3/27/2019', 5);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 5;
insert into PURCHASE (purchase_dt, customer_id) values ('1/7/2019', 4);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 4;
insert into PURCHASE (purchase_dt, customer_id) values ('5/8/2019', 9);
update CUSTOMER set purchase_cnt = purchase_cnt + 1 where customer_id = 9;


insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (1, 9);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (2, 8);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (3, 9);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (4, 7);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (4, 10);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (4, 1);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (5, 4);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (6, 9);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (7, 3);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (8, 2);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (9, 1);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (10, 3);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (11, 1);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (12, 2);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (13, 10);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (13, 7);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (13, 3);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (14, 2);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (15, 5);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (16, 5);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (17, 4);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (18, 10);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (19, 3);
insert into PURCHASE_X_COMPOSITION (purchase_id, composition_id) values (20, 7);


insert into GOD_X_COMPOSITION (composition_id, god_id) values (1, 5);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (2, 3);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (3, 6);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (4, 5);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (5, 2);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (6, 4);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (7, 3);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (8, 6);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (9, 3);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (10, 1);
insert into GOD_X_COMPOSITION (composition_id, god_id) values (11, 3);


insert into RACE_X_COMPOSITION (composition_id, race_id) values (1, 6);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (2, 6);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (3, 3);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (4, 5);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (5, 3);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (6, 2);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (7, 4);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (8, 4);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (9, 6);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (10, 3);
insert into RACE_X_COMPOSITION (composition_id, race_id) values (11, 1);


insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (1, 4);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (2, 4);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (3, 5);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (4, 1);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (5, 4);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (6, 6);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (7, 2);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (8, 6);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (9, 2);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (10, 2);
insert into LANGUAGE_X_COMPOSITION (composition_id, language_id) values (11, 3);
