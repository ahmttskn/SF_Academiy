/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-21-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class QuerySelectorsDemo extends LightningElement {

    fruits=["Banana","Orange","Apple","Mango"];

    clickHandler(){
        const elem=this.template.querySelector('h1');
        console.log(elem.innerText);
        console.log(elem);
        elem.style.backgroundColor="blue";
        elem.style.border="4px solid yellow";
        elem.style.color="white";

        //querySelector All
        const elems=this.template.querySelectorAll('div.child');
        elems.forEach(item=>{
            console.log(item.innerText);
            item.style.color="red";
            item.setAttribute("class","slds-align_absolute-center");
            item.style.border="4px solid gray";

        })


        const elembutton = this.template.querySelector('lightning-button');
        elembutton.setAttribute("variant", "destructive");
    }
}