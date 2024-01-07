SELECT row_number() over () AS _uid0_, * FROM (SELECT ST_CollectionExtract(ST_INTERSECTION(rv.geom, ro.geom),1) as intersection_point
FROM rivers as rv, highways  as ro 
WHERE st_intersects(rv.geom, ro.geom)
) AS _subq_0_
