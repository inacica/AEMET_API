function karateConfig() {
    karate.log("########## LOGS ##########")

    //Default Global configuration
    karate.configure("connectTimeout", 75000);
    karate.configure("readTimeout", 160000);
    karate.configure("abortedStepsShouldPass", true);
    karate.configure("retry", { count: 20, interval: 6000 });
    karate.configure("logPrettyResponse", true);
    karate.configure("logPrettyRequest", true);
    karate.configure("continueOnStepFailure", true);

    //Global variables
    var config = {
        maxResponseTime: 100000,
        baseUrl: {},
    };

    var localConfig = karate.read('classpath:localConfig.json');

    //Environments and its settings
    var env = karate.env || localConfig.env;
    if (!env) {
        env = "test"; // Specify the environment here when running locally
    }
    switch (env.toLowerCase()) {
        
        case "test":
            karate.log("########## Test Environment ##########");
            config.baseUrl.aemet = "https://opendata.aemet.es/opendata/";
            break;
        default:
            karate.log("!!!!!!!!!! Environment " + env + " is not valid !!!!!!!!!!");
            karate.fail("!!!!!!!!!! Environment " + env + " is not valid !!!!!!!!!!")
            break;
    }

    // load common libraries
    //config.randomUtil = karate.callSingle("classpath:KarateUtilities/randomUtil.feature");
    //config.dateUtil = karate.callSingle("classpath:KarateUtilities/dateUtil.feature");

    return config;
    
}