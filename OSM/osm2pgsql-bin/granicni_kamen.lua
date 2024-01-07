local tables = {}


tables.granicni_kamen = osm2pgsql.define_node_table('granicni_kamen',{
    { column = 'type', type = 'text' },
    {column = 'name', type = 'text'},
    {column = 'tags', type = 'jsonb'},
    { column = 'geom', type = 'point', projection = 4326 },
}
)


function osm2pgsql.process_node(object)
    if object.tags.historic == 'boundary_stone' then
        tables.granicni_kamen:insert{
            type = object.tags.historic,
            tags = object.tags,
            name = object.tags.name,
            geom = object:as_point()
        }
    end
end