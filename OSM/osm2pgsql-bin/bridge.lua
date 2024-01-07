local tables = {}


tables.most = osm2pgsql.define_node_table('mostovi',{
    { column = 'type', type = 'text' },
    {column = 'name', type = 'text'},
    {column = 'tags', type = 'jsonb'},
    { column = 'geom', type = 'point', projection = 4326 },
}
)


function osm2pgsql.process_node(object)
    if object.tags then
        tables.most:insert{
            type = object.tags.bridge,
            tags = object.tags,
            name = object.tags.name,
            geom = object:as_point()
        }
    end
end