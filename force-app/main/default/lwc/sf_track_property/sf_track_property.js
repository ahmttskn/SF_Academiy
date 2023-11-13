import { LightningElement, track } from 'lwc';

export default class Sf_track_property extends LightningElement {

    @track location={
        city:"Los Angales", country:"USA", postalCode:"AZ98382"
    }

    changeHandler(event){
        if (event.target.label == "City") {
            this.location.city = event.target.value;
        } else if (event.target.label == "Country") {
            this.location.country = event.target.value;
        } else if (event.target.label == "PostalCode") {
            this.location.postalCode = event.target.value;
        }
    }
}