public with sharing class Homework_19 {

    // public static string EndpoinUrl = Zippo__mdt.getInstance(URL).Type__c;
    
    public static void adressVe(string param){
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://api.zippopotam.us/us/'+param);

        Http https = new Http();
        HttpResponse respons =  https.send(request);

        if(respons.getStatusCode() == 200){
            System.debug(respons);
            System.debug(respons.getBody());
        } else{
            System.debug('unValid zip code');
        }
    


    }
}