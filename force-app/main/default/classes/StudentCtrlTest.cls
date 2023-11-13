@isTest
public with sharing class StudentCtrlTest {
    @TestSetup
    public static void testSetup() {
        List<Student__c> students = new List<Student__c>();
        for(Integer i=1; i<=3; i++) {
            Student__c std = new Student__c();
            std.Student_Name__c = 'Student ' + i;
            std.Class__c = i;
            std.Postal_Code__c = '50000' + i;
            students.add(std);
        }
        insert students;
    }

    @isTest
    private static void searchStudentsByPostalCodeTest() {
        Test.startTest();
        List<Student__c> students = StudentCtrl.searchStudentsByPostalCode('500001');
        System.assert(students.size() != 0);
        Test.stopTest();
    }
}