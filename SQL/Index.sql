CREATE INDEX rivers_index ON rivers USING GIST (geom);

CREATE INDEX highways_index ON highways USING GIST (geom);