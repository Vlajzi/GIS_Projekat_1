-- Index: highways_geom_idx

-- DROP INDEX IF EXISTS public.highways_geom_idx;

CREATE INDEX IF NOT EXISTS highways_geom_idx
    ON public.highways USING gist
    (geom)
    WITH (fillfactor=100)
    TABLESPACE pg_default;
