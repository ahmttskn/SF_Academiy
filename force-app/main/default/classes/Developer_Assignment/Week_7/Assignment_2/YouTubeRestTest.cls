@isTest
public with sharing class YouTubeRestTest {
    @isTest
    static void testYoutube() {
        Test.setMock(HttpCalloutMock.Class, new YouTubeRestTestMock());

        YouTubeRest.createRecord('Video1', '8odBS8ExigE');
        
        List<Youtube_Video_Detail__c> listVideo = [SELECT id,Number_of_Like__c,Number_of_View__c, Name FROM Youtube_Video_Detail__c];
        
        System.assertEquals(1, listVideo.size());
        System.assertEquals(2, Integer.valueOf(listVideo.get(0).Number_of_Like__c));
        System.assertEquals(102, Integer.valueOf(listVideo.get(0).Number_of_View__c));
    }
}