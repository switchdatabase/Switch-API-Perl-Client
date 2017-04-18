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

use_ok('WWW::SwaggerClient::DBOperationsApi');

my $api = WWW::SwaggerClient::DBOperationsApi->new();
isa_ok($api, 'WWW::SwaggerClient::DBOperationsApi');

#
# add_post test
#
{
    my $api_key = undef; # replace NULL with a proper value
    my $access_token = undef; # replace NULL with a proper value
    my $list = undef; # replace NULL with a proper value
    my $body = undef; # replace NULL with a proper value
    my $result = $api->add_post(api_key => $api_key, access_token => $access_token, list => $list, body => $body);
}

#
# list_post test
#
{
    my $api_key = undef; # replace NULL with a proper value
    my $access_token = undef; # replace NULL with a proper value
    my $list = undef; # replace NULL with a proper value
    my $body = undef; # replace NULL with a proper value
    my $result = $api->list_post(api_key => $api_key, access_token => $access_token, list => $list, body => $body);
}

#
# set_delete test
#
{
    my $api_key = undef; # replace NULL with a proper value
    my $access_token = undef; # replace NULL with a proper value
    my $list = undef; # replace NULL with a proper value
    my $list_item_id = undef; # replace NULL with a proper value
    my $result = $api->set_delete(api_key => $api_key, access_token => $access_token, list => $list, list_item_id => $list_item_id);
}

#
# set_post test
#
{
    my $api_key = undef; # replace NULL with a proper value
    my $access_token = undef; # replace NULL with a proper value
    my $list = undef; # replace NULL with a proper value
    my $list_item_id = undef; # replace NULL with a proper value
    my $body = undef; # replace NULL with a proper value
    my $result = $api->set_post(api_key => $api_key, access_token => $access_token, list => $list, list_item_id => $list_item_id, body => $body);
}


1;