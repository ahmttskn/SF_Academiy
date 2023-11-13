/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-16-2022
 * @last modified by  : Huseyin
**/
/**
 * Get all the opportunities whose stage is closed won and display 
 * them in a lightning data table. I would like to see the lightning 
 * data table with data by the time page is loaded
Name, Type, StageName & Amount 
 */
import getTopOpportunities from '@salesforce/apex/OpportunityCtrl.getTopOpportunities';
import { LightningElement,wire } from 'lwc';

const COLUMNS = [
    {label: "Name", fieldName: "Name", type: "text"},
    {label: "Type", fieldName: "Type", type: "picklist"},
    {label: "Stage Name", fieldName: "StageName", type: "picklist"},
    {label: "Amount", fieldName: "Amount", type: "currency"}
];
export default class WiredApexMethodOpportunity extends LightningElement {
    columns = COLUMNS;
    @wire(getTopOpportunities)
    opportunities;
}