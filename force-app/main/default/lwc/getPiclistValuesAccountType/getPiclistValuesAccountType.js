/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-14-2022
 * @last modified by  : Huseyin
**/
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import TYPE_FIELD from '@salesforce/schema/Account.Type';

export default class GetPiclistValuesAccountType extends LightningElement {

    accountRtId;
    typeOptions=[];
    selectedType;

    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    record;
    
    // accountInfoHandler({data,error}){
    //     if(data){
    //     console.log(data);
    //     this.accountRtId=data.defaultRecordTypeId;
    //     }
    // }
    
    @wire(getPicklistValues,{fieldApiName:TYPE_FIELD,recordTypeId:'$accountRtId'})
    piclistHandler({data,error}){
        if(data){
            console.log(record);
            // console.log(data);
            this.typeOptions=data.values;
        }
    }

    changeHandler(event){
        this.selectedType=event.target.value;
    }
}