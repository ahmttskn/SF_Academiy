public with sharing class CovidCalloutUS {

    // remote side settings 

    public static HttpResponse getUSCovidInfo() {
        //prepare endpoint
        // create metada 
        String endpoint = 'https://api.covidtracking.com/v1/us/current.json';

        //prepare http request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        //prepare http
        Http http = new Http();

        //send request over the internet to receive response
        HttpResponse response = http.send(request);
        String jsonString = response.getBody();

        //play around response
        if(response.getStatusCode() == 200) {
            //List<CovidResponseWrapper> covid = (list<CovidResponseWrapper>) JSON.deserialize(jsonString, list<CovidResponseWrapper>.class);
            
            // System.debug('Positive Cases: ' + covid[0].positive);
            // System.debug('Negative Cases: ' + covid[0].negative);
        }
        
        /*
        if(response.getStatusCode() == 200){
            //System.debug(response.getBody());
            List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,Object> firstResult = (Map<String,Object>) results[0];
            Integer positive = (Integer) firstResult.get('positive');
            Integer negative = (Integer) firstResult.get('negative');
            System.debug('Positive cases: ' + positive);
            System.debug('Negative cases: ' + negative);
        }else{
            System.debug(response.getStatus());
        }
        */


        return response;
    }

    public class CovidResponseWrapper {
        public Integer positive;
        public Integer negative;  
    }
}