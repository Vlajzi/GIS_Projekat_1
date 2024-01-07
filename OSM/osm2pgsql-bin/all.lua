local tables = {}

tables.all = osm2pgsql.define_node_table('all',{
    {column = 'tags', type = 'jsonb'},
    { column = 'geom', type = 'point', projection = 4326 },
}
)

function osm2pgsql.process_node(object)
    if object.tags then
        tables.all:insert{
            tags = object.tags,
            geom = object:as_point()
        }
    end
end