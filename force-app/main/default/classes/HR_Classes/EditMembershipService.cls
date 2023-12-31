public with sharing class EditMembershipService {
    
    @AuraEnabled
    public static List<MemberWrapper> findPositions(String candidateId, String selection){
        List<MemberWrapper> memberInfo = new List<MemberWrapper>();

        List<Position__c> positions = [SELECT Id, Location_HR__c, Location_HR__r.Name, HR_Manager__c,
                                    HR_Manager__r.Name, Position_Name__c, Start_Date_Time__c,
                                  (SELECT Id, Name FROM Position_Candidate__r WHERE Candidate__c =: candidateId)
                                  FROM Position__c  /*
                                  WHERE Live__c = true  */
                                  WITH SECURITY_ENFORCED
                                ];

        for(Position__c pos : positions){
            MemberWrapper wrapper = new MemberWrapper();
            wrapper.isMember = pos.Position_Candidate__r.size() > 0;
            wrapper.position = pos;
            wrapper.positionId = pos.Id;
            wrapper.positionCandidate = wrapper.isMember ? pos.Position_Candidate__r[0] : null;

            if(selection.equalsIgnoreCase('delete') && wrapper.isMember){
                memberInfo.add(wrapper);
            }
            else if(selection.equalsIgnoreCase('create') && !wrapper.isMember){
                memberInfo.add(wrapper);
            }
        }
        
        return memberInfo;
    }

    @AuraEnabled
    public static Boolean manageMembership(String candidateId, List<String> positionIds, String selection){
        System.debug('candidateId:' + candidateId);
        System.debug('positionIds:' + positionIds);
        System.debug('selection:' + selection);

        try {
            if(selection.equalsIgnoreCase('delete')){
                delete [SELECT Id FROM Position_Candidate__c WHERE Position__c IN: positionIds AND Candidate__c =: candidateId];
            }
            else if(selection.equalsIgnoreCase('create')){
                List<Position_Candidate__c> newPositionsCandidate = new List<Position_Candidate__c>();
                for(String pId : positionIds){
                    newPositionsCandidate.add(new Position_Candidate__c(Position__c = pId, Candidate__c = candidateId));
                }
    
                insert newPositionsCandidate;
            }
    
            return true;
        }catch(Exception exc){
            throw new AuraHandledException(exc.getMessage());
        }
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