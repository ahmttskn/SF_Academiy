import { LightningElement, wire } from 'lwc';
import getRelatedAccounts from '@salesforce/apex/AccountCtrl.getRelatedAccounts';

const COLUMNS = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' }
];

export default class Sf_nonPrimitiveParent extends LightningElement {

    columns = COLUMNS;

    @wire(getRelatedAccounts)
    accounts;

    // printFunction(accounts){
    //     console.log(accounts);
    // }

}