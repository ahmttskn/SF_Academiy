/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-16-2022
 * @last modified by  : Huseyin
**/
import getOppsByStage from '@salesforce/apex/OpportunityCtrl.getOppsByStage';
import { LightningElement, wire } from 'lwc';

const COLUMNS = [
    {label: "Name", fieldName: "Name", type: "text"},
    {label: "Type", fieldName: "Type", type: "text"},
    {label: "Stage Name", fieldName: "StageName", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"}
];
export default class WiredApexMedhodFour extends LightningElement {
    selectedStage='Closed Won';
    columns=COLUMNS;
    @wire(getOppsByStage,{stage:'$selectedStage'})
    opps;
}