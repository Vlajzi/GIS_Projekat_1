-- Index: rivers_geom_idx

-- DROP INDEX IF EXISTS public.rivers_geom_idx;

CREATE INDEX IF NOT EXISTS rivers_geom_idx
    ON public.rivers USING gist
    (geom)
    WITH (fillfactor=100)
    TABLESPACE pg_default;
