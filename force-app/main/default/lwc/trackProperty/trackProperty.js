/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-07-2022
 * @last modified by  : Huseyin
**/
import { LightningElement, track } from 'lwc';
//import track

export default class TrackProperty extends LightningElement {
    @track location={
        city:"Hounston",
        country:"United States"
    }

    
     
    changeHandler(event){
        // console.log("Event:"+ event);
        // console.log("Event.target:"+ event.target);
        console.log();
        this.location.city=event.target.value;
    }
}