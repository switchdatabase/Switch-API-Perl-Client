=begin comment

Switch Database REST API

Switch API is the primary endpoint of data sevices and Switch DB's platform. You can do adding, editing, deleting or listing data works to your database with query operations by using this low-level API based on HTTP.

OpenAPI spec version: 1.2.1

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end comment

=cut

#
# NOTE: This class is auto generated by the Swagger Codegen
# Please update the test cases below to test the model.
# Ref: https://github.com/swagger-api/swagger-codegen
#
use Test::More tests => 2;
use Test::Exception;

use lib 'lib';
use strict;
use warnings;


use_ok('WWW::SwaggerClient::Object::SetResponse');

my $instance = WWW::SwaggerClient::Object::SetResponse->new();

isa_ok($instance, 'WWW::SwaggerClient::Object::SetResponse');

