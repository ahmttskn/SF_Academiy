@isTest
public class CovidCalloutUSTest {

    @isTest 
    public static  void testgetUSCovidInfo() {
        // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('COVIDJson');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        //************************************* */
        Test.setMock(HttpCalloutMock.class, mock);
        // Call method to test
        HttpResponse result = CovidCalloutUS.getUSCovidInfo();
        String jsonString = result.getBody();
        // List<CovidResponse> cases = (List<CovidResponse>) JSON.deserialize(jsonString, List<CovidResponse>.class);
        // System.assertEquals(28756489, cases[0].positive);
        // System.assertEquals(74582825, cases[0].negative);
    }



    @isTest
    public static void testCovidInfo(){
        /*
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('testCovid');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        */

        // HttpCalloutMock mock = new HttpCalloutMock();
        // Test.setMock(HTTPCallOutMock.class, mock);
        // HTTPResponse response = CovidCalloutUS.getUSCovidInfo();
        // String jsonString = response.getBody();
        // List<CovidResponseWrapper> covidResult=(List<CovidResponseWrapper>)json.deserialize(jsonString, List< CovidResponseWrapper>.class);
        // System.assertEquals(28756489, covidResult[0].positive);
        // System.assertEquals(74582825, covidResult[0].negative);

    }
    public class CovidResponseWrapper{
        public Integer positive;
        public Integer negative;
    }  
}