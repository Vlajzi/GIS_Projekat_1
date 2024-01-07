local tables = {}


tables.bariere = osm2pgsql.define_node_table('bariere',{
    { column = 'type', type = 'text' },
    {column = 'tags', type = 'jsonb'},
    { column = 'geom', type = 'point', projection = 4326 },
}
)


function osm2pgsql.process_node(object)
    if object.tags.barrier then
        tables.bariere:insert{
            type = object.tags.barrier,
            tags = object.tags,
            geom = object:as_point()
        }
    end
end