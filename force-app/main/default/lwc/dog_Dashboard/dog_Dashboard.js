import { LightningElement, track, wire } from 'lwc';
import dogsInfos from '@salesforce/apex/DogCtrl.dogsInfos';

export default class Dog_Dashboard extends LightningElement {

    @track pets;

    @wire(dogsInfos)
    dogObjInfos({data, error}){
        if (data) {
            this.pets = data;
        }
        if (error) {
            this.pets = error.body.message;
        }
    }

}