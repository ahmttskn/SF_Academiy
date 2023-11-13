import { getObjectInfos } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJ from '@salesforce/schema/Account';
import CASE_OBJ from '@salesforce/schema/Case';
import OPP_OBJ from '@salesforce/schema/Opportunity';

export default class Sf_getObjectInfos extends LightningElement {

    accountRTId;
    caseRTId;
    opportunityRTId;
    
    @wire(getObjectInfos, {objectApiNames: [ACCOUNT_OBJ, CASE_OBJ, OPP_OBJ]})
    objectInfosHandler({data, error}){
        if (data) {
            console.log(data);
            this.accountRTId = data.results[0].result.defaultRecordTypeId;
            this.caseRTId = data.results[1].result.defaultRecordTypeId;
            this.opportunityRTId = data.results[2].result.defaultRecordTypeId;
        }
        if (error){
            console.log(error);
        }
    }
}