public with sharing class dummyClass {

    public static string endPoint =  GET_ANIMAL__mdt.getInstance('url').URL__c;
    
    public static void getInfo(){
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(endPoint);
        

        Http http = new Http();
        HttpResponse res = http.send(req);

        //system.debug(res.getBody());
        if (res.getStatusCode() == 200) {
            Map<string,Object> resBody = (Map<string,Object>) json.deserializeUntyped(res.getBody());
            System.debug(resBody);

            for (string a : resBody.keySet()) {
                System.debug(resBody.get(a));
            }

            // AnimalDumyWrapper an = (AnimalDumyWrapper) JSON.deserialize(res.getBody(), AnimalDumyWrapper.class);
            // System.debug(an);
            // List<account> accList = new List<account>();
            // for (String a : an.animals) {
            //     System.debug(a);
            //     Account acc = new Account();
            //     acc.name = 'test';
            //     acc.Animal_Name__c = a;
            //     accList.add(acc);
            // }
            // upsert accLİst Animal_Name__c;

        } else {
            System.debug('something wrong');
        }

    }
    
}