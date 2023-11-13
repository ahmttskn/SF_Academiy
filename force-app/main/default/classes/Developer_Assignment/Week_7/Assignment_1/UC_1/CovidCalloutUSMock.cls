@isTest
global class CovidCalloutUSMock implements HttpCalloutMock {

    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody('[{"date":20210307,"states":56,"positive":28756489,"negative":74582825,"pending":11808,"hospitalizedCurrently":40199,"hospitalizedCumulative":776361,"inIcuCurrently":8134,"inIcuCumulative":45475,"onVentilatorCurrently":2802,"onVentilatorCumulative":4281,"dateChecked":"2021-03-07T24:00:00Z","death":515151,"hospitalized":776361,"totalTestResults":363825123,"lastModified":"2021-03-07T24:00:00Z","recovered":null,"total":0,"posNeg":0,"deathIncrease":842,"hospitalizedIncrease":726,"negativeIncrease":131835,"positiveIncrease":41835,"totalTestResultsIncrease":1170059,"hash":"a80d0063822e251249fd9a44730c49cb23defd83"}]');
        response.setStatusCode(200);
        return response;
    }

    // Implement this interface method
    /*
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        //response.setHeader('Content-Type', 'application/json');
        response.setBody('{"quote":"Today is the best day ever and tomorrow is going to be even better"}');
        response.setStatusCode(200);
        return response; 
    }
    // not sure like this can we write a code ????
    
    global HTTPResponse respondFaild(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        //response.setHeader('Content-Type', 'application/json');
        response.setBody('{"quote":"Today is the best day ever and tomorrow is going to be even better"}');
        response.setStatusCode(400);
        return response; 
    }
    */  
}