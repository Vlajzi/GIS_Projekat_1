local tables = {}


tables.most = osm2pgsql.define_way_table('mostovi_linije',{
    { column = 'type', type = 'text' },
    {column = 'name', type = 'text'},
    {column = 'tags', type = 'jsonb'},
    { column = 'geom', type = 'linestring', projection = 4326 },
}
)


function osm2pgsql.process_way(object)
    if object.tags then
        tables.most:insert{
            type = object.tags.bridge,
            tags = object.tags,
            name = object.tags.name,
            geom = object:as_linestring()
        }
    end
end