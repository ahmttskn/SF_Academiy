import { LightningElement, wire, api } from 'lwc';

export default class CarTile extends LightningElement {

    @api car = {};

    clickHandler(){
        const event = new CustomEvent('carrecord', {
            detail: this.car.Id 
        });
        this.dispatchEvent(event);
    }
}