import { LightningElement, wire } from 'lwc';
import getRelatedAccounts from '@salesforce/apex/AccountCtrl.getRelatedAccounts';

export default class Sf_wireApexNoParam extends LightningElement {

    @wire(getRelatedAccounts)
    accounts;

}