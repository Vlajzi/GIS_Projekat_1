CREATE INDEX bariere_index ON bariere USING GIST (geom);

CREATE INDEX highways_index ON highways USING GIST (geom);