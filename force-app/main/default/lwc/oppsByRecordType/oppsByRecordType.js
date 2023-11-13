import { LightningElement, wire, track } from 'lwc';

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import { getObjectInfo, getPicklistValues, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import OPPNAME_FIELD from '@salesforce/schema/Opportunity.Name';


export default class OppsByRecordType extends LightningElement {
    selectedStage;
    selectedType;
    @track vendorsRtId;
    @track customerRtId;
    stageOptions=[];
    typeOptions=[];
    isFlag = false;
    recordId = '006Do0000033qWeIAI';
    oppName = OPPNAME_FIELD;
    oppObject = OPP_OBJECT;
    @track selectedrecordType;
    @track recordTypeOptions=[
        // {label:'Vendors', value:'$vendorsRtId'}, 
        // {label:'Customer', value:'$customerRtId'}
    ];

    // recordTypeOptionsJson = JSON.stringify(recordTypeOptions);
    // this.items = JSON.parse(JSON.stringify(this.items));


    @wire (getObjectInfo, {objectApiName:OPP_OBJECT})
    objectInfoHandler({data, error}){
        if (data) {
            console.log('objectInfoHandler' ,data);
            const rtIds = data.recordTypeInfos;
            // console.error('rtIds ',rtIds);
            // this.vendorsRtId =  Object.keys(rtIds).find(rtId => rtIds[rtId].name=== 'vendors');
            // this.customerRtId =  Object.keys(rtIds).find(rtId => rtIds[rtId].name=== 'customer');

            // let testData = JSON.parse(JSON.stringify(rtIds));
            // console.error('testData ', testData);

            this.recordTypeOptions = Object.keys(rtIds).map(key => {
                return {
                  label: rtIds[key].name,
                  value: key
                };
              });

            const allowedRecordTypeNames = ['vendors', 'customer']; // Add the names of the record types you want to display
            //  this.recordTypeOptions = Object.values(data.recordTypeInfos)
            //     .filter(item => allowedRecordTypeNames.includes(item.name))
            //     .map(item => {
            //         return {
            //             label: item.name,
            //             value: item.recordTypeId
            //         };
            //     });


            // let mappedItems = [];    
            // for (let i = 0; i < rtIds.length; i++) {
            //     const Id = Object.keys(rtIds[i]);
            //     this.mappedItems.push({label: Object.keys(Id).name, value: Object.keys(Id).recordTypeId});
            // }
            // console.error('mappedItems ', mappedItems);

            // JSON.parse(data.recordTypeInfos).forEach(Id => {
            //     if (Id.name === 'vendors' || Id.name === 'customer') {
            //         this.mappedItems.push({label: Id.name, value: Id.recordTypeId});
            //     }
            // })
            // data.recordTypeInfos.forEach(Id => {
            //     console.error(Id);

            //         // this.mappedItems.push({label: Id.name, value: Id.recordTypeId});
                    
            // })
            //this.recordTypeOptions = this.mappedItems;
            // console.error(this.mappedItems);
            // console.error(this.recordTypeOptions);
            // let recordTypArray = [];
            //     this.recordTypeOptions.push({label:'Vendors', value: this.vendorsRtId /*'$crudeOilRtId'*/});
            //     this.recordTypeOptions.push({label:'Customer', value: this.customerRtId /*'$refinedPetrRtId'*/}) ; 
            //     console.log('fonksiyon içinde ', this.recordTypeOptions);
        } if (error) {
            console.error(error);
        }
    }


    @wire(getPicklistValuesByRecordType, {objectApiName: OPP_OBJECT, recordTypeId:'$selectedrecordType'})
    pickListHandler({data, error}){
        if(data) {
            console.log(data);
            this.stageOptions = this.generatePicklistOptions(data.picklistFieldValues.StageName); 
            // this.optionsT=data.picklistFieldValues.Type.values.map(item => ({
            //     label: item.name,
            //     value: item.value
            // }));
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName: OPP_OBJECT, recordTypeId:'$selectedrecordType'})
    pickListHandler2({data, error}){
        if(data)
        {console.log("TYPE", data);
        this.typeOptions = this.generatePicklistOptions(data.picklistFieldValues.Type) ; }
    }
    generatePicklistOptions(data){
        return data.values.map(item => ({
            label: item.label,
            value:item.value
            }));
    }


//     @wire(getPicklistValues, {fieldApiName: TYPE_FIELD, recordTypeId:'$refinedPetrRtId'})
//     pickListHandler2({data, error}){
//         console.log("GET PICKLIST VALUE WORKS?", data);
//        //this.typeOptions = data.values;
// }


    handleChange(event){
        const name = event.target.name;
        if(name==='Crude Oil'){
            this.selectedStage = event.target.value;
        }else if (name==='Refined Petroleum'){
            this.selectedType = event.target.value;
        } else if(name==='Record Type') {
            this.selectedrecordType = event.target.value;
        }
    }
}