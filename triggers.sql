CREATE FUNCTION trigger_purchase () RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE CUSTOMER SET purchase_cnt = purchase_cnt + 1 WHERE customer_id = NEW.customer_id;
        RETURN NEW;
    ELSEIF TG_OP = 'DELETE' THEN
        UPDATE CUSTOMER SET purchase_cnt = purchase_cnt - 1 WHERE customer_id = OLD.customer_id;
        RETURN NEW;
    ELSEIF TG_OP = 'UPDATE' THEN
        UPDATE CUSTOMER SET purchase_cnt = purchase_cnt - 1 WHERE customer_id = OLD.customer_id;
        UPDATE CUSTOMER SET purchase_cnt = purchase_cnt + 1 WHERE customer_id = NEW.customer_id;
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE  plpgsql;


CREATE FUNCTION check_canon () RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.first_nm, NEW.second_nm) != ('Howard', 'Lovecraft') THEN
        NEW.status_txt = 'Follower';
        RETURN NEW;
    ELSE
        NEW.status_txt = 'Founder';
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE  plpgsql;


CREATE TRIGGER change_nb_purchase
    AFTER INSERT OR DELETE OR UPDATE
    ON purchase
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_purchase();


CREATE TRIGGER check_status
    BEFORE INSERT OR UPDATE
    ON author
    FOR EACH ROW
    EXECUTE PROCEDURE check_canon();