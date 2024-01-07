select b.*
from benzinske_pumpe as b,
	boundaries as bnd
	where bnd.tags->>'admin_level' = '6'  
	AND  (bnd.tags->>'name' = 'Поморавски управни округ' OR bnd.tags->>'name' = 'Нишавски управни округ' 
	OR bnd.tags->>'name' = 'Шумадијски управни округ'	OR bnd.tags->>'name' = 'Град Београд')
	AND ST_ContainsProperly(bnd.geom,b.geom)