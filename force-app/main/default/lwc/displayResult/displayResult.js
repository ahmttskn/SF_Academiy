/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-22-2022
 * @last modified by  : Huseyin
**/
import { api, LightningElement } from 'lwc';

export default class DisplayResult extends LightningElement {
    @api records;
    @api columns;
    @api error;
}