/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-12-2022
 * @last modified by  : Huseyin
**/
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
export default class GetRecordTypeInfos extends LightningElement 
{   
    defaultRtId;
    supplierRtId;
    
    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    objectHandler({data,error}){
        if(data){
            console.log(data);
            this.defaultRtId = data.defaultRecordTypeId;
            const rtids = data.recordTypeInfos;
            this.supplierRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === "Standart Try");
            const masterIDS = data.recordTypeInfos;
            this.supplierRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === "Master");
        }
        if(error){
            console.log(error);
        }
    }
}