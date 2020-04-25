CREATE TABLE my_tree(
	   id   INT NOT NULL,
	   child_id INT NOT NULL,
	   PRIMARY KEY (id, child_id)
);
CREATE INDEX idx on my_tree(id);
CREATE INDEX idx2 on my_tree(child_id);
