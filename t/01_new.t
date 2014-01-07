use strict;
use warnings;
use Test::More;
use Test::Exception;
use Geo::Coder::OSM;

new_ok('Geo::Coder::OSM' => []);
new_ok('Geo::Coder::OSM' => [debug => 1]);
new_ok('Geo::Coder::OSM' => [sources => 'osm']);
new_ok('Geo::Coder::OSM' => [sources => [qw(mapquest osm)]]);
new_ok('Geo::Coder::OSM' => [format => 'json']);
new_ok('Geo::Coder::OSM' => [format => 'xml']);
new_ok('Geo::Coder::OSM' => [format => 'xml']);
dies_ok { Geo::Coder::OSM->new( format => 'not_supported') } 'Dies because of invalid data format';
{
    local $Geo::Coder::OSM::SOURCES{private} = 'http://localhost/api';
    new_ok('Geo::Coder::OSM' => [sources => [qw(osm private)]]);
}

can_ok('Geo::Coder::OSM', qw(geocode reverse_geocode response ua));

done_testing;
