/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-14-2022
 * @last modified by  : Huseyin
**/
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetAccountObjectInfo extends LightningElement {
    rtId;
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    objectInfoHandler({data, error}) {
        if(data) {
            console.log(ACCOUNT_OBJECT);
            console.log(data);
            
            this.rtId = data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }
}