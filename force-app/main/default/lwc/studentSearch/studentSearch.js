/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-27-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';
import searchStudentsByPostalCode from '@salesforce/apex/StudentCtrl.searchStudentsByPostalCode';

const COLUMNS = [
    {label: "Student Name", fieldName: "Student_Name__c", type: "text"},
    {label: "Class", fieldName: "Class__c", type: "number"},
    {label: "Mobile", fieldName: "Mobile__c", type: "tel"},
    {label: "Email", fieldName: "Email__c", type: "email"},
    {label: "Postal Code", fieldName: "Postal_Code__c", type: "text"}
];

export default class StudentSearch extends LightningElement {
    searchWord;
    students;
    columns = COLUMNS;
    error = "Enter a postal code to see stundets belong there!";

    changeHandler(event) {
        this.searchWord = event.target.value;
        searchStudentsByPostalCode({code: this.searchWord})
            .then(result => {
                this.students = result;
                if(this.students.length == 0) {
                    this.students = undefined;
                    this.error = "No students belong to the entered postal code. Try another!";
                } else {
                    this.error = undefined;
                }
            })
            .catch(error => {
                this.error = error;
                this.students = undefined;
            })
    }
}