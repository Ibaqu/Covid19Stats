import ballerina/http;

type JsonArr json[];

type ErrorResponse record {
    ErrorMessage[] message;
};

type ErrorMessage record {
    string id;
    string 'key;
    string value;
};

public isolated client class Client {

    final http:Client clientEp;

    public isolated function init(http:ClientConfiguration clientConfig = {}, string serviceUrl = "http://api.worldbank.org/v2/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }

    remote isolated function getPopulationByCountry(@display {label: "Country Code"} string country_code, @display {label: "Date"} string? date = "2010", @display {label: "Page Number"} int? page = (), @display {label: "Per Page Record Count"} int? per_page = ()) returns CountryPopulation[]|error {
        string path = string `/country/${country_code}/indicator/SP.POP.TOTL`;
        map<anydata> queryParam = {date: date, format: "json", page: page, per_page: per_page};
        path = path + check getPathForQueryParam(queryParam);
        json[] payloadArr = check self.clientEp->get(path, targetType = JsonArr);
        if (payloadArr.length() > 1) {
            if (payloadArr[1] != ()) {
                return payloadArr[1].cloneWithType();
            } else {
                return [];
            }
        } else {
            ErrorResponse|error errorResponse = payloadArr[0].cloneWithType(ErrorResponse);
            if (errorResponse is ErrorResponse) {
                ErrorMessage[] errorMessage = errorResponse.message;
                return error(errorMessage[0].value, id = errorMessage[0].id, key = errorMessage[0].key);
            } else {
                return error("Invalid Request");
            }
        }
    }

}
