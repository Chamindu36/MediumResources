import ballerina/http;

# A service representing a network-accessible API
# bound to port `8081`.
service /sample on new http:Listener(8081) {

    # A resource representing an invokable API method accessible at `/sample/getData/{id}`.
    # This resource is used with path parameters
    # + return - A string payload which eventually becomes 
    #            the payload of the response
    resource function get getData/[int id](http:Caller caller, http:Request req) returns error? {
        http:Response resp = new;
        string description = "Retrieve or search an existing data item using a path parameter";
        resp.setJsonPayload(description);
        check caller->respond(resp);
    }

    # A resource representing an invokable API method accessible at `/sample/addData`.
    #
    # + return - A string payload which eventually becomes 
    #            the payload of the response
    resource function post addData(http:Caller caller, http:Request req) returns error? {
        json payload = check req.getJsonPayload();
        http:Response resp = new;
        string description = "Add a sample data to the Mysql database";
        resp.setJsonPayload(description);
        check caller->respond(resp);

    }
}
