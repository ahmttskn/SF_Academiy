/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-24-2022
 * @last modified by  : Huseyin
**/
import { api, LightningElement } from 'lwc';

export default class P2cActionAtParentChild1 extends LightningElement {
    @api value;
    @api type; //the data which coming  from parent override this default data
    
}