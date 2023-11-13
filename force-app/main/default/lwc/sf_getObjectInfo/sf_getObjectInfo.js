import { LightningElement, wire } from 'lwc';
import OPP_OBJ from '@salesforce/schema/Opportunity';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

export default class Sf_getObjectInfo extends LightningElement {

    oppStandardRtId;
    oppVendorsRtId;
    oppCustomurRtId;
    oppMasterRtId;
    @wire(getObjectInfo, {objectApiName: OPP_OBJ})
    oppInfoHandler({data, error}){
        if (data){
            console.log('Sf_getObjectInfo Data : ', data);
            console.log('Sf_getObjectInfo Data : ', 'Bir türlü record typelara ulaşamadım');
            const rtIds = data.recordTypeInfos;
            this.oppStandardRtId = Object.keys(rtIds).find(rtId => rtIds[rtId].name === 'standard');
            this.oppVendorsRtId = Object.keys(rtIds).find(rtId => rtIds[rtId].name === 'vendors');
            this.oppCustomurRtId = Object.keys(rtIds).find(rtId => rtIds[rtId].name === 'customer');
            this.oppMasterRtId = Object.keys(rtIds).find(rtId => rtIds[rtId].name === 'Master');
            //this.oppStandardRtId = data.recordTypeInfos['012Do000000TfEZIA0'].recordTypeId;
            // this.oppVendorsRtId = data.recordTypeInfos[1].recordTypeId;
            // this.oppCustomurRtId = data.recordTypeInfos[2].recordTypeId;
        }
        if (error){
            console.error('Sf_getObjectInfo Error : ', error);
        }
    }

}