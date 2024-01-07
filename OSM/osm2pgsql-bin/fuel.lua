local tables = {}


tables.benzinske_pumpe = osm2pgsql.define_node_table('benzinske_pumpe',{
    {column = 'name', type = 'text'},
    {column = 'tags', type = 'jsonb'},
    { column = 'geom', type = 'point', projection = 4326 },
}
)


function osm2pgsql.process_node(object)
    if object.tags then
        tables.benzinske_pumpe:insert{
            tags = object.tags,
            name = object.tags.name,
            geom = object:as_point()
        }
    end
end