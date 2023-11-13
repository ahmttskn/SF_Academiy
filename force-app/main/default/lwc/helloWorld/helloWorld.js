/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-03-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    
    name; // undefined
    fullName="Salesforce Developer"; // String type
    age=30; // Number type
    location={
        city:"New York",
        country:"United States",
        postalCode:"345354"
    }; //Object Type
    fruits=["Orange","Banana","Apple","Grape"];
    num1=30;
    num2=20;
   
    //
    sum(num1,num2){
        return num1+num2;
    }

    /**
     * input => Usain
     * Output => USAIN
     */
    convertToUpperCase(fullName){
        return fullName.toUpperCase();
    }
}