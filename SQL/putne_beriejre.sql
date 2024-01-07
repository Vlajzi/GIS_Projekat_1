SELECT bb.*
FROM bariere as bb, highways as h
WHERE ST_Intersects(bb.geom,h.geom)
