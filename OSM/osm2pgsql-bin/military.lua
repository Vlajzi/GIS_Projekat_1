local tables = {}

tables.military = osm2pgsql.define_way_table('military', {
    { column = 'type', type = 'text' },
    { column = 'geom', type = 'polygon', projection = 4326 },
})

function osm2pgsql.process_way(object)
    if object.tags.military then
        tables.military:insert{
            type = object.tags.military,
            geom = object:as_polygon()
        }
    end
end