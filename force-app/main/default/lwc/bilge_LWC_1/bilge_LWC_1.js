import { LightningElement, track } from 'lwc';

const roleOptions = [
    { label: 'New', value: 'new' },
    { label: 'In Progress', value: 'inProgress' },
    { label: 'Finished', value: 'finished' },
];

export default class Bilge_LWC_1 extends LightningElement {

    @track name = '';
    @track role;
    @track role2;

    options2 = roleOptions;

    changeHandler(event){
        if (event.target.name === 'input') {
            this.name = event.target.value;
        } else if (event.target.name === 'picklist') {
            this.role = event.target.value;
        }else {
            this.role2 = event.target.value;
        }
        
    }

    get options() {
        return [
            { label: 'Salesforce Admin', value: 'Admin' },
            { label: 'Salesforce Developer', value: 'Developer' },
            { label: 'Finished', value: 'finished' },
        ];
    }


}