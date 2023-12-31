public with sharing class CandidatePositionsService {
   
    @AuraEnabled(cacheable=true)
    public static List<MemberWrapper> upcomingPositions(String candidateId) {
        List<Position__c> positions = [SELECT Id, Location_HR__c, Location_HR__r.Name, HR_Manager__c,
                                        HR_Manager__r.Name, Position_Name__c, Start_Date_Time__c,
                                  (SELECT Id, Name FROM Position_Candidate__r WHERE Candidate__c =: candidateId)
                                 FROM Position__c /*
                                 WHERE EmaProject__StartDateTime__c >= TODAY
                                 AND EmaProject__Live__c = true */
                                 WITH SECURITY_ENFORCED
                                ];
        system.debug('positions ' + positions);

        List<MemberWrapper> memberInfo = new List<MemberWrapper>();
        for(Position__c pos : positions){
            MemberWrapper wrapper = new MemberWrapper();
            wrapper.isMember = pos.Position_Candidate__r.size() > 0;
            wrapper.position = pos;
            wrapper.positionId = pos.Id;
            wrapper.positionCandidate = wrapper.isMember ? pos.Position_Candidate__r[0] : null;

            memberInfo.add(wrapper);
        }

        return memberInfo;
    }
  
    @AuraEnabled(cacheable=true)
    public static List<Position_Candidate__c> pastPositions(String candidateId) {
        List<Position_Candidate__c> pastpositionCandidate = new List<Position_Candidate__c>();
        pastpositionCandidate = [SELECT Id, Name, Position__c, Position__r.Location_HR__c, Position__r.Location_HR__r.Name,
                       Position__r.HR_Manager__c, Position__r.HR_Manager__r.Name,
                       Position__r.Position_Name__c, Position__r.Start_Date_Time__c
                FROM Position_Candidate__c
                WHERE Candidate__c = :candidateId /*
                AND Position__r.Start_Date_Time__c < TODAY */
                WITH SECURITY_ENFORCED
               ];
        system.debug('pastEventAttendee ' + pastpositionCandidate);
        return pastpositionCandidate;
    }

    public class MemberWrapper {

        @AuraEnabled
        public Boolean isMember;

        @AuraEnabled
        public String positionId;

        @AuraEnabled
        public Position_Candidate__c positionCandidate;

        @AuraEnabled
        public Position__c position;
    }

}