=begin comment

Switch Database REST API

Switch API is the primary endpoint of data sevices and Switch DB's platform. You can do adding, editing, deleting or listing data works to your database with query operations by using this low-level API based on HTTP.

OpenAPI spec version: 1.2.1

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end comment

=cut

#
# NOTE: This class is auto generated by Swagger Codegen
# Please update the test cases below to test the API endpoints.
# Ref: https://github.com/swagger-api/swagger-codegen
#
use Test::More tests => 1; #TODO update number of test cases
use Test::Exception;

use lib 'lib';
use strict;
use warnings;

use_ok('WWW::SwaggerClient::AuthorizationApi');

my $api = WWW::SwaggerClient::AuthorizationApi->new();
isa_ok($api, 'WWW::SwaggerClient::AuthorizationApi');

#
# token_get test
#
{
    my $api_key = undef; # replace NULL with a proper value
    my $signature = undef; # replace NULL with a proper value
    my $expire = undef; # replace NULL with a proper value
    my $result = $api->token_get(api_key => $api_key, signature => $signature, expire => $expire);
}


1;