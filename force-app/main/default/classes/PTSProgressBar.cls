public with sharing class PTSProgressBar {

    @AuraEnabled (Cacheable=true)
    public static Map<string,Integer> getSkillCompletion(Id developerId) {
        System.debug('RecorId: ' + developerId);
        Map<String, Integer> mapName = new Map<String, Integer>{
            'Administrator'=>99,
            'Apex Advance'=>0,
            'JavaScript'=>90,
            'Flow Builder'=>98,
            'Vehicle Manager'=>100,
            'Apex Beginner'=>100,
            'Apex Intermediate'=>98,
            'Formulas'=>100,
            'Apex Codes CheatSheet'=>34,
            'Integration'=>100,
            'HTML'=>100
        };
        return mapName;
    }


    /*
    @AuraEnabled(cacheable=true)
    public static Map<String, Integer> getSkillCompletion(String developerId) {
        //Map<CourseName,Percentage>
        Map<String, Integer> completionPercentages = new Map<String, Integer>();
       // String label =  [SELECT Id, Name FROM EntityParticle WHERE EntityDefinitionId='Developer' AND Label=:developerId].Id;
        Developer__c developer = [SELECT Name, Email__c, Skills__c FROM Developer__c WHERE Id = :developerId LIMIT 1];
     // Check if the developer record exists
    if (developer == null) {
        // Handle the case where the developer record is not found
       return completionPercentages;
    }
         // Split the Skills__c field into an array
    String[] courseSkills = developer.Skills__c != null ? developer.Skills__c.split(';') : new String[0];
        System.debug(courseSkills);
        // Fetch the matching Contact based on Name and Email
        Contact contact = [SELECT Id, Administrator__c, Formulas__c, Apex_Beginner__c, Apex_Intermediate__c, Apex_Advance__c,  Flow_Builder__c,
                           Vehicle_Manager__c, Apex_Codes_CheatSheet__c, Integration__c, JavaScript__c, HTML__c, LWC__c, Visual_Force__c,
                           IQ__c
                           FROM Contact
                           WHERE Name = :developer.Name AND Email = :developer.Email__c LIMIT 1];
        List<Course__c> courses = [SELECT Id, Name, Number_of_Quizzes__c
                                   FROM Course__c
                                   WHERE Name IN :courseSkills];
       if(courses.size()==0){
           return completionPercentages;
         }
        for (Course__c course : courses) {
            String courseFieldName = course.Name.replace(' ', '_') + '__c';
            // Check if the course field exists in the Contact object
            if (contact.getSObjectType().getDescribe().fields.getMap().containsKey(courseFieldName)) {
                Integer completedQuizzes = Integer.valueOf(contact.get(courseFieldName));
                Integer totalQuizzes = Integer.valueOf(course.Number_of_Quizzes__c);
                // Ensure that totalQuizzes is not zero to avoid division by zero
                if (totalQuizzes > 0) {
                    Integer percentage = (completedQuizzes * 100) / totalQuizzes;
                    completionPercentages.put(course.Name, percentage);
                } else {
                    // Handle the case where totalQuizzes is zero
                    completionPercentages.put(course.Name, 0);
                }
            }
        }
        system.debug('Return Percentages= '+completionPercentages.values());
        system.debug('Return Courses= '+completionPercentages.keySet());
        system.debug('Return Map= '+completionPercentages);
        return completionPercentages;
    }
    */
}