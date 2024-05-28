/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-22-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class P2cActionAtPatentParent1 extends LightningElement {
    proggressValue=50;
    barSize="medium";

    get barOptions(){
        return[
            {label:"small",value:"small"},
            {label:"medium",value:"medium"},
            {label:"large",value:"large"}
        ]
    }

    changeHandler(event){
        if(event.target.name === "Bar Size"){
            this.barSize=event.target.value;
        }else{
            this.proggressValue=event.target.value;
        }
    }
}