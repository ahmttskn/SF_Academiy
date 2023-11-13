/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-16-2022
 * @last modified by  : Huseyin
**/
import searchContacts from '@salesforce/apex/ContactCtrl.searchContacts';
import { LightningElement } from 'lwc';

const COLUMNS = [
    {label: "First Name", fieldName: "FirstName", type: "text"},
    {label: "Last Name", fieldName: "LastName", type: "text"},
    {label: "Title", fieldName: "Title", type: "text"},
    {label: "Department", fieldName: "Department", type: "text"}
];
export default class ImperativeApexOne extends LightningElement {
    columns = COLUMNS;
    searchWord;
    contacts;
    error;

    changeHandler(event){
        this.searchWord=event.target.value;


        if(this.searchWord.length>2){
            searchContacts({searchKey:this.searchWord})
            .then(result =>{
                console.log(result);
                this.contacts=result;
                if(this.contacts.length == 0) {
                    this.error = "There are no matching accounts for the selected type."
                } else {
                    this.error = undefined;
                }
            })
            .catch(error =>{
                console.error(error);
                this.error=error;
                this.contacts = undefined;
            })
        }


    }

}