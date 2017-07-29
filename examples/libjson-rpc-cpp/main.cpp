#include <jsonrpccpp/client.h>
#include <jsonrpccpp/client/connectors/httpclient.h>
#include <iostream>

int main()
{
    jsonrpc::HttpClient http("http://localhost:8383");
    jsonrpc::Client client(http);

    Json::Value params;
    params["name"] = "Peter";

    try
    {
        std::cout << client.CallMethod("sayHello", params) << '\n';
    }
    catch (jsonrpc::JsonRpcException const& e)
    {
        std::cerr << e.what() << '\n';
    }

    return 0;
}
