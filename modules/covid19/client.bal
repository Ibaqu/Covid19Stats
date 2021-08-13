import ballerina/http;
public isolated client class Client {

    final http:Client clientEp;

    public isolated function init(http:ClientConfiguration clientConfig = {}, string serviceUrl = "https://disease.sh") 
    returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }

     remote isolated function getStatusByCountry(@display {label: "Country"} string country, @display {label: "Yesterday"} string? yesterday = (), @display {label: "Two Days Ago"} string? twoDaysAgo = (), @display {label: "Strict"} string strict = "true", @display {label: "Allow Null"} string? allowNull = ()) returns CovidCountry|error {
        string  path = string `/v3/covid-19/countries/${country}`;
        map<anydata> queryParam = {"yesterday": yesterday, "twoDaysAgo": twoDaysAgo, "strict": strict, "allowNull": allowNull};
        path = path + check getPathForQueryParam(queryParam);
        CovidCountry response = check self.clientEp-> get(path, targetType = CovidCountry);
        return response;
    }
}
