-- Add the item_count column to the pharmacy table
ALTER TABLE pharmacy
ADD item_count INT DEFAULT 0;
-- Create a trigger to update item_count when an item is inserted
CREATE OR REPLACE FUNCTION update_item_count_insert() RETURNS TRIGGER AS $$ BEGIN
UPDATE pharmacy
SET item_count = item_count + 1
WHERE id = NEW.pharmacy_id;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
------------------------------------------------------------
CREATE TRIGGER item_insert_trigger
AFTER
INSERT ON item FOR EACH ROW EXECUTE FUNCTION update_item_count_insert();
-- Create a trigger to update item_count when an item is deleted
CREATE OR REPLACE FUNCTION update_item_count_delete() RETURNS TRIGGER AS $$ BEGIN
UPDATE pharmacy
SET item_count = item_count - 1
WHERE id = OLD.pharmacy_id;
RETURN OLD;
END;
$$ LANGUAGE plpgsql;
------------------------------------------------------------
CREATE TRIGGER item_delete_trigger
AFTER DELETE ON item FOR EACH ROW EXECUTE FUNCTION update_item_count_delete();