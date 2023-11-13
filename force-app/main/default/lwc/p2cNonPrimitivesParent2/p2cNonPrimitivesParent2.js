/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-19-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class P2cNonPrimitivesParent2 extends LightningElement {
    contacts = [
        {
            FirstName : "Jeff",
            LastName: "Bezos", 
            Title : "Executive Chairman", 
            Department: "Sales"
        },
        {
            FirstName : "Sundar",
            LastName: "Pichai", 
            Title : "Chief Executive Officer", 
            Department: "Chrome"
        },
        {
            FirstName : "Tim",
            LastName: "Cook", 
            Title : "Chief Executive Officer", 
            Department: "Marketing"
        }
    ];
}