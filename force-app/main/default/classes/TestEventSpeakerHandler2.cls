@isTest
public with sharing class TestEventSpeakerHandler2 {
   @isTest
   private static void testValidTrig() {
        EventOrganizer__c organizer = new EventOrganizer__c(Name = 'Organizer 1',
                                                            Email__c = 'testorganizer1@test.com',
                                                            Phone__c = '234567876543'
                                                           );
        insert organizer;

        Event__c event1 = new Event__c(EventOrganizer__c = organizer.Id,
                                       Name__c = 'Test Event 111',
                                       Status__c = 'In Progress',
                                       StartDateTime__c = Datetime.now().addDays(-14),
                                       EndDateTime__c = Datetime.now().addDays(14),
                                       MaxSeats__c = 10,
                                       EventType__c = 'Virtual',
                                       Live__c = true
                                      );
                                      insert event1;
         Speaker__c sp = new Speaker__c (Name='Test 11sp',Email__c='test@11mail.com',Phone__c='1188889');     
         insert sp;
         EventSpeaker__c es= new  EventSpeaker__c (Event__c =event1.id,Speaker__c=sp.id)   ;
             insert es;                  
   }
}