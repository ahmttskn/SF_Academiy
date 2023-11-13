/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-17-2022
 * @last modified by  : Huseyin
**/

import getTopAccounts from '@salesforce/apex/AccountCtrl.getTopAccounts';
import { LightningElement, wire } from 'lwc';

const COLUMNS=[
    {label:"Account Name", fieldName:"Name", type:"text"},
    {label:"Account Type", fieldName:"Type", type:"text"},
    {label:"Account Industry", fieldName:"Industry", type:"text"},
    {label:"Annual Revenue", fieldName:"AnnualRevenue", type:"currency"}

];

export default class WiredApexMethodOne extends LightningElement {
    columns=COLUMNS;
    
    @wire(getTopAccounts)
    accounts;
}