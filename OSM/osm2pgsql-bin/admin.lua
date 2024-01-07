tables.boundaries = osm2pgsql.define_area_table('boundaries', {
    { column = 'tags', type = 'jsonb' },
    { column = 'name', type = 'text' },
    { column = 'level', type = 'int2'},
    { column = 'geom', type = 'geometry', projection = 4326 },
})

function osm2pgsql.process_relation(object)
    if object.tags.boundary == 'administrative' then
        tables.boundaries:insert{
            tags = object.tags,
            name = object.tags.name,
            level = object.tags.admin_level,
            geom = object:as_multipolygon()
        }
    end
end