import { LightningElement } from 'lwc';
import searchContacts from '@salesforce/apex/ContactCtrl.searchContacts';

const COLUMNS = [
    {label: 'Contact Name', fieldName: 'Name', type: 'text'},
    {label: 'Title', fieldName: 'Title', type: 'text'},
    {label: 'Email', fieldName: 'Email', type: 'email'},
    {label: 'Phone', fieldName: 'Phone', type: 'phone'}

];

export default class Sf_p2cActionOnParent extends LightningElement {

    columns = COLUMNS;
    contacts;

    changeHandler(event){
        const key = event.target.value;
        searchContacts({searchKey: key})
            .then(result => {
                this.contacts = result;
            })
            .catch(error => {
                this.error = error;
            })
    }

}