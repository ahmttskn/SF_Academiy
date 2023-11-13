/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-16-2022
 * @last modified by  : Huseyin
**/
import { LightningElement, wire } from 'lwc';
import getAccountsByIndustry from '@salesforce/apex/AccountCtrl.getAccountsByIndustry';

const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Industry", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
];

export default class WiredApexMethodTwo extends LightningElement {
    selectedIndustry = 'Biotechnology';
    columns = COLUMNS;

    @wire(getAccountsByIndustry, {industry: '$selectedIndustry'})
    accounts;
}