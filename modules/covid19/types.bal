
# COVID-19 status of the given country
public type CovidCountry record {
    # Last updated timestamp
    decimal updated?;
    # Country name
    string country?;
    # Total cases
    decimal cases?;
    # Today cases
    decimal todayCases?;
    # Total deaths
    decimal deaths?;
    # Today deaths
    decimal todayDeaths?;
    # Total recovered
    decimal recovered?;
    # Today recovered
    decimal todayRecovered?;
    # Active cases
    decimal active?;
    # Critical cases
    decimal critical?;
    # Cases per one million
    decimal casesPerOneMillion?;
    # Deaths per one million
    decimal deathsPerOneMillion?;
    # Total number of COVID-19 tests administered
    decimal tests?;
    # COVID-19 tests for one million
    decimal testsPerOneMillion?;
    # Total population
    decimal population?;
    # Continent name
    string continent?;
    # One case per people
    decimal oneCasePerPeople?;
    # One death per people
    decimal oneDeathPerPeople?;
    # One test per people
    decimal oneTestPerPeople?;
    # Active cases per one million
    decimal activePerOneMillion?;
    # Recovered cases per one million
    decimal recoveredPerOneMillion?;
    # Critical cases per one million
    decimal criticalPerOneMillion?;
};
