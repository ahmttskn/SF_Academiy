/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-26-2022
 * @last modified by  : Huseyin
**/
import { api, LightningElement } from 'lwc';

export default class RecordDetailModal extends LightningElement {
    
    @api recordId;
    @api objectName;

    closeHandler(){
        const closeEvent=new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}