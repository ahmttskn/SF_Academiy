import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import getAccountsType from '@salesforce/apex/AccountCtrl.getAccountsType';

const COLUMS = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' }
];

export default class Sf_wireApexWithParam extends LightningElement {

    accounts;
    errorAcc;
    errorType;
    error;
    columns = COLUMS;
    rtId;
    selectedType;
    typeOpptions;

    @wire(getAccountsType, {type: '$selectedType'})
    accountHandler({data, error}){
        if(data){
            this.accounts = data;
        }
        if(error){
            this.error = error;
        }
    }

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountInfo({data, error}){
        if(data){
            this.rtId = data.defaultRecordTypeId;
        }
        if(error){
            this.errorAcc = error;
        }
    };

    @wire(getPicklistValues, {fieldApiName: TYPE_FIELD, recordTypeId: '$rtId'})
    typeHandler({data, error}){
        if(data){
            this.typeOpptions = this.piclistGenerator(data.values);
        }
        if(error){
            this.errorType = error;
        }
    }

    piclistGenerator(values){
        return values.map(item => ({
            label: item.label,
            value: item.value
        }));
    }

    handleChange(event){
        this.selectedType = event.target.value;
    }

}