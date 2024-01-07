local tables = {}

tables.railway = osm2pgsql.define_way_table('railway', {
    { column = 'type', type = 'text' },
    { column = 'geom', type = 'linestring', projection = 4326 },
})

function osm2pgsql.process_way(object)
    if object.tags.railway then
        tables.railway:insert{
            type = object.tags.railway,
            geom = object:as_linestring()
        }
    end
end
