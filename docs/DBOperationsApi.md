# WWW::SwaggerClient::DBOperationsApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::DBOperationsApi;
```

All URIs are relative to *http://tr02.switchapi.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_post**](DBOperationsApi.md#add_post) | **POST** /Add | Add is used for adding a data object to the list created at Switch DB.
[**list_post**](DBOperationsApi.md#list_post) | **POST** /List | It&#39;s used for listing a data added before.
[**set_delete**](DBOperationsApi.md#set_delete) | **DELETE** /Set | It&#39;s used for deleting a data added before at Switch DB.
[**set_post**](DBOperationsApi.md#set_post) | **POST** /Set | It&#39;s used for updating a data object that is already added to Switch DB.


# **add_post**
> AddResponse add_post(api_key => $api_key, access_token => $access_token, list => $list, body => $body)

Add is used for adding a data object to the list created at Switch DB.

You can choose the list that will be added tha data set to with List parameter that will be sent to Header. It's equal to INSERT query at the relational databases model. The data set that will be added to the database is transmited at request body. For versions upper than v1.2.1, if the data sent is an array, all items in the array are added one by one, so they are added as a whole. 

### Example 
```perl
use Data::Dumper;
use WWW::SwaggerClient::Configuration;
use WWW::SwaggerClient::DBOperationsApi;

my $api_instance = WWW::SwaggerClient::DBOperationsApi->new();
my $api_key = 'api_key_example'; # string | Your Switch API Key.
my $access_token = 'access_token_example'; # string | Your Access Token.
my $list = 'list_example'; # string | Your data list name.
my $body = WWW::SwaggerClient::Object::string->new(); # string | Your new value JSON.

eval { 
    my $result = $api_instance->add_post(api_key => $api_key, access_token => $access_token, list => $list, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DBOperationsApi->add_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **api_key** | **string**| Your Switch API Key. | 
 **access_token** | **string**| Your Access Token. | 
 **list** | **string**| Your data list name. | 
 **body** | **string**| Your new value JSON. | 

### Return type

[**AddResponse**](AddResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_post**
> list_post(api_key => $api_key, access_token => $access_token, list => $list, body => $body)

It's used for listing a data added before.

List parameter sent remarks the list that will be do listing work on at Header. It's equal to SELECT query at relational databases. 

### Example 
```perl
use Data::Dumper;
use WWW::SwaggerClient::Configuration;
use WWW::SwaggerClient::DBOperationsApi;

my $api_instance = WWW::SwaggerClient::DBOperationsApi->new();
my $api_key = 'api_key_example'; # string | Your Switch API Key.
my $access_token = 'access_token_example'; # string | Your Access Token.
my $list = 'list_example'; # string | Your data list name.
my $body = WWW::SwaggerClient::Object::Body->new(); # Body | Your Switch DB Query.

eval { 
    $api_instance->list_post(api_key => $api_key, access_token => $access_token, list => $list, body => $body);
};
if ($@) {
    warn "Exception when calling DBOperationsApi->list_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **api_key** | **string**| Your Switch API Key. | 
 **access_token** | **string**| Your Access Token. | 
 **list** | **string**| Your data list name. | 
 **body** | [**Body**](Body.md)| Your Switch DB Query. | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **set_delete**
> SetResponse set_delete(api_key => $api_key, access_token => $access_token, list => $list, list_item_id => $list_item_id)

It's used for deleting a data added before at Switch DB.

List parameter sent remarks the list that will be deleted data from at Header and ListItemId parameter remarks the ID consisted by Switch DB for the data that will be deleted. It's equal to DELETE query at relational databases. 

### Example 
```perl
use Data::Dumper;
use WWW::SwaggerClient::Configuration;
use WWW::SwaggerClient::DBOperationsApi;

my $api_instance = WWW::SwaggerClient::DBOperationsApi->new();
my $api_key = 'api_key_example'; # string | Your Switch API Key.
my $access_token = 'access_token_example'; # string | Your Access Token.
my $list = 'list_example'; # string | Your data list name.
my $list_item_id = 'list_item_id_example'; # string | Your list item id.

eval { 
    my $result = $api_instance->set_delete(api_key => $api_key, access_token => $access_token, list => $list, list_item_id => $list_item_id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DBOperationsApi->set_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **api_key** | **string**| Your Switch API Key. | 
 **access_token** | **string**| Your Access Token. | 
 **list** | **string**| Your data list name. | 
 **list_item_id** | **string**| Your list item id. | 

### Return type

[**SetResponse**](SetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **set_post**
> SetResponse set_post(api_key => $api_key, access_token => $access_token, list => $list, list_item_id => $list_item_id, body => $body)

It's used for updating a data object that is already added to Switch DB.

In order to UPDATE a object, Listname and ListItemId parameters should be sent in the Header of the REQUEST as \"List\", \"ListItemId\", respectively, as shown in the example below. It's equal to UPDATE query at relational databases. The data set that will be edited is transmited to the database at request body. 

### Example 
```perl
use Data::Dumper;
use WWW::SwaggerClient::Configuration;
use WWW::SwaggerClient::DBOperationsApi;

my $api_instance = WWW::SwaggerClient::DBOperationsApi->new();
my $api_key = 'api_key_example'; # string | Your Switch API Key.
my $access_token = 'access_token_example'; # string | Your Access Token.
my $list = 'list_example'; # string | Your data list name.
my $list_item_id = 'list_item_id_example'; # string | Your list item id.
my $body = WWW::SwaggerClient::Object::string->new(); # string | Your new value JSON.

eval { 
    my $result = $api_instance->set_post(api_key => $api_key, access_token => $access_token, list => $list, list_item_id => $list_item_id, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DBOperationsApi->set_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **api_key** | **string**| Your Switch API Key. | 
 **access_token** | **string**| Your Access Token. | 
 **list** | **string**| Your data list name. | 
 **list_item_id** | **string**| Your list item id. | 
 **body** | **string**| Your new value JSON. | 

### Return type

[**SetResponse**](SetResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

