
# Data indicator
public type Indicator record {
    # Id of the indicator
    string id?;
    # Value represent by the indicator
    string value?;
};

# Represent a Country
public type Country record {
    # Country code
    string id?;
    # Country name
    string value?;
};

# Represent country population.
public type CountryPopulation record {
    # World bank indicator
    Indicator indicator?;
    # Country
    Country country?;
    # Date-range by year, month or quarter that scopes the result-set.
    string date?;
    # Country population
    int? value?;
};
