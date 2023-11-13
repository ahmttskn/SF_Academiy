public with sharing class StudentsTest_SF {
    public static void Students_SF_Method() {
        
        //@isTest
        //public with sharing class StudentsTest {
            
            //@isTest
            //public static void generateReportTest(){
                //Step 1 - Prepare the dummy or test data
                //Students_SF student1 = new Students_SF();
                Students_SF.firstName = 'Rachel';
                Students_SF.lastName = 'Green';
                Students_SF.year = 2;
                Students_SF.major = 'Fashion';
                //Step 2 - Call the respective Method
                String majorStudent1 = Students_SF.generateReport();
                //Step 3 - Validate the output (actual & expected)
                system.assertEquals('Fashion', majorStudent1);
            //}
        //}
        
    }
}