# NAME

WWW::SwaggerClient::Role - a Moose role for the Switch Database REST API

Switch API is the primary endpoint of data sevices and Switch DB's platform. You can do adding, editing, deleting or listing data works to your database with query operations by using this low-level API based on HTTP.

# VERSION

Automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.2.1
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.PerlClientCodegen

## A note on Moose

This role is the only component of the library that uses Moose. See
WWW::SwaggerClient::ApiFactory for non-Moosey usage.

# SYNOPSIS

The Perl Swagger Codegen project builds a library of Perl modules to interact with
a web service defined by a OpenAPI Specification. See below for how to build the
library.

This module provides an interface to the generated library. All the classes,
objects, and methods (well, not quite \*all\*, see below) are flattened into this
role.

        package MyApp;
        use Moose;
        with 'WWW::SwaggerClient::Role';

        package main;

        my $api = MyApp->new({ tokens => $tokens });

        my $pet = $api->get_pet_by_id(pet_id => $pet_id);


## Structure of the library

The library consists of a set of API classes, one for each endpoint. These APIs
implement the method calls available on each endpoint.

Additionally, there is a set of "object" classes, which represent the objects
returned by and sent to the methods on the endpoints.

An API factory class is provided, which builds instances of each endpoint API.

This Moose role flattens all the methods from the endpoint APIs onto the consuming
class. It also provides methods to retrieve the endpoint API objects, and the API
factory object, should you need it.

For documentation of all these methods, see AUTOMATIC DOCUMENTATION below.

## Configuring authentication

In the normal case, the OpenAPI Spec will describe what parameters are
required and where to put them. You just need to supply the tokens.

    my $tokens = {
        # basic
        username => $username,
        password => $password,

        # oauth
        access_token => $oauth_token,

        # keys
        $some_key => { token => $token,
                       prefix => $prefix,
                       in => $in,             # 'head||query',
                       },

        $another => { token => $token,
                      prefix => $prefix,
                      in => $in,              # 'head||query',
                      },
        ...,

        };

        my $api = MyApp->new({ tokens => $tokens });

Note these are all optional, as are `prefix` and `in`, and depend on the API
you are accessing. Usually `prefix` and `in` will be determined by the code generator from
the spec and you will not need to set them at run time. If not, `in` will
default to 'head' and `prefix` to the empty string.

The tokens will be placed in the `WWW::SwaggerClient::Configuration` namespace
as follows, but you don't need to know about this.

- `$WWW::SwaggerClient::Configuration::username`

    String. The username for basic auth.

- `$WWW::SwaggerClient::Configuration::password`

    String. The password for basic auth.

- `$WWW::SwaggerClient::Configuration::api_key`

    Hashref. Keyed on the name of each key (there can be multiple tokens).

            $WWW::SwaggerClient::Configuration::api_key = {
                    secretKey => 'aaaabbbbccccdddd',
                    anotherKey => '1111222233334444',
                    };

- `$WWW::SwaggerClient::Configuration::api_key_prefix`

    Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
    all api keys require a prefix.

            $WWW::SwaggerClient::Configuration::api_key_prefix = {
                    secretKey => 'string',
                    anotherKey => 'same or some other string',
                    };

- `$WWW::SwaggerClient::Configuration::access_token`

    String. The OAuth access token.

# METHODS

## `base_url`

The generated code has the `base_url` already set as a default value. This method
returns (and optionally sets, but only if the API client has not been
created yet) the current value of `base_url`.

## `api_factory`

Returns an API factory object. You probably won't need to call this directly.

        $self->api_factory('Pet'); # returns a WWW::SwaggerClient::PetApi instance

        $self->pet_api;            # the same

# MISSING METHODS

Most of the methods on the API are delegated to individual endpoint API objects
(e.g. Pet API, Store API, User API etc). Where different endpoint APIs use the
same method name (e.g. `new()`), these methods can't be delegated. So you need
to call `$api->pet_api->new()`.

In principle, every API is susceptible to the presence of a few, random, undelegatable
method names. In practice, because of the way method names are constructed, it's
unlikely in general that any methods will be undelegatable, except for:

        new()
        class_documentation()
        method_documentation()

To call these methods, you need to get a handle on the relevant object, either
by calling `$api->foo_api` or by retrieving an object, e.g.
`$api->get_pet_by_id(pet_id => $pet_id)`. They are class methods, so
you could also call them on class names.

# BUILDING YOUR LIBRARY

See the homepage `https://github.com/swagger-api/swagger-codegen` for full details.
But briefly, clone the git repository, build the codegen codebase, set up your build
config file, then run the API build script. You will need git, Java 7 or 8 and Apache
maven 3.0.3 or better already installed.

The config file should specify the project name for the generated library:

        {"moduleName":"WWW::MyProjectName"}

Your library files will be built under `WWW::MyProjectName`.

          $ git clone https://github.com/swagger-api/swagger-codegen.git
          $ cd swagger-codegen
          $ mvn package
          $ java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
    -i [URL or file path to JSON swagger API spec] \
    -l perl \
    -c /path/to/config/file.json \
    -o /path/to/output/folder

Bang, all done. Run the `autodoc` script in the `bin` directory to see the API
you just built.

# AUTOMATIC DOCUMENTATION

You can print out a summary of the generated API by running the included
`autodoc` script in the `bin` directory of your generated library. A few
output formats are supported:

          Usage: autodoc [OPTION]

    -w           wide format (default)
    -n           narrow format
    -p           POD format
    -H           HTML format
    -m           Markdown format
    -h           print this help message
    -c           your application class


The `-c` option allows you to load and inspect your own application. A dummy
namespace is used if you don't supply your own class.

# DOCUMENTATION FROM THE OpenAPI Spec

Additional documentation for each class and method may be provided by the Swagger
spec. If so, this is available via the `class_documentation()` and
`method_documentation()` methods on each generated object class, and the
`method_documentation()` method on the endpoint API classes:

        my $cmdoc = $api->pet_api->method_documentation->{$method_name};

        my $odoc = $api->get_pet_by_id->(pet_id => $pet_id)->class_documentation;
        my $omdoc = $api->get_pet_by_id->(pet_id => $pet_id)->method_documentation->{method_name};


Each of these calls returns a hashref with various useful pieces of information.

# LOAD THE MODULES

To load the API packages:
```perl
use WWW::SwaggerClient::AuthorizationApi;
use WWW::SwaggerClient::DBOperationsApi;

```

To load the models:
```perl
use WWW::SwaggerClient::Object::AddResponse;
use WWW::SwaggerClient::Object::Body;
use WWW::SwaggerClient::Object::Error;
use WWW::SwaggerClient::Object::ListOrder;
use WWW::SwaggerClient::Object::SetResponse;
use WWW::SwaggerClient::Object::WhereItem;

````

# GETTING STARTED
Put the Perl SDK under the 'lib' folder in your project directory, then run the following
```perl
#!/usr/bin/perl
use lib 'lib';
use strict;
use warnings;
# load the API package
use WWW::SwaggerClient::AuthorizationApi;
use WWW::SwaggerClient::DBOperationsApi;

# load the models
use WWW::SwaggerClient::Object::AddResponse;
use WWW::SwaggerClient::Object::Body;
use WWW::SwaggerClient::Object::Error;
use WWW::SwaggerClient::Object::ListOrder;
use WWW::SwaggerClient::Object::SetResponse;
use WWW::SwaggerClient::Object::WhereItem;

# for displaying the API response data
use Data::Dumper;
use WWW::SwaggerClient::Configuration;
use WWW::SwaggerClient::;

my $api_instance = WWW::SwaggerClient::AuthorizationApi->new();
my $api_key = 'api_key_example'; # string | Your Switch API Key.
my $signature = 'signature_example'; # string | Signature parameter is generated as md5(APISecret + ExpireTimestamp) format.
my $expire = 789; # int | Expire parameter, token's expire date and time information must be proper to ISO 8601 standarts and Unix Time format with msec information.

eval {
    my $result = $api_instance->token_get(api_key => $api_key, signature => $signature, expire => $expire);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling AuthorizationApi->token_get: $@\n";
}

```

# DOCUMENTATION FOR API ENDPOINTS

All URIs are relative to *http://tr02.switchapi.com/*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AuthorizationApi* | [**token_get**](docs/AuthorizationApi.md#token_get) | **GET** /Token | Generate Access Token
*DBOperationsApi* | [**add_post**](docs/DBOperationsApi.md#add_post) | **POST** /Add | Add is used for adding a data object to the list created at Switch DB.
*DBOperationsApi* | [**list_post**](docs/DBOperationsApi.md#list_post) | **POST** /List | It&#39;s used for listing a data added before.
*DBOperationsApi* | [**set_delete**](docs/DBOperationsApi.md#set_delete) | **DELETE** /Set | It&#39;s used for deleting a data added before at Switch DB.
*DBOperationsApi* | [**set_post**](docs/DBOperationsApi.md#set_post) | **POST** /Set | It&#39;s used for updating a data object that is already added to Switch DB.


# DOCUMENTATION FOR MODELS
 - [WWW::SwaggerClient::Object::AddResponse](docs/AddResponse.md)
 - [WWW::SwaggerClient::Object::Body](docs/Body.md)
 - [WWW::SwaggerClient::Object::Error](docs/Error.md)
 - [WWW::SwaggerClient::Object::ListOrder](docs/ListOrder.md)
 - [WWW::SwaggerClient::Object::SetResponse](docs/SetResponse.md)
 - [WWW::SwaggerClient::Object::WhereItem](docs/WhereItem.md)


# DOCUMENTATION FOR AUTHORIZATION
 All endpoints do not require authorization.

