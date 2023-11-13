/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-20-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountCtrl.searchAccounts';

const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Industry", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
];

export default class SearchAccounts extends LightningElement {
    searchWord;
    accounts;
    error;
    columns = COLUMNS;

    changeHandler(event) {
        this.searchWord = event.target.value;
        if(this.searchWord.length > 2) {
            searchAccounts({searchKey: this.searchWord})
                .then(result => {
                    console.log(result);
                    this.accounts = result;
                    this.error = undefined;
                    if(this.accounts.length == 0) {
                        //this.accounts = undefined;
                        this.error = "No matching accounts found for the inputted search key!";
                    }
                })
                .catch(error => {
                    console.error(error);
                    this.error = error;
                    this.accounts = undefined;
                })
        }
    }
}