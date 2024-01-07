local tables = {}


tables.test = osm2pgsql.define_way_table('test',{
    { column = 'type', type = 'text' },
    {column = 'tes', type = 'jsonb'},
    {column = 'name', type = 'text'},
    { column = 'geom', type = 'linestring', projection = 4326 },
}
)


function osm2pgsql.process_way(object)
    if object.tags.waterway then
        tables.test:insert{
            type = object.tags.waterway,
            tes = object.tags,
            name = object.tags.name,
            geom = object:as_linestring()
        }
    end
end