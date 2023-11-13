import { LightningElement, wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountCtrl.getAllAccounts';
import calculateOppAmount from '@salesforce/apex/AccountCtrl.calculateOppAmount';

export default class Week3_Uc2 extends LightningElement {

    accountOptions = []; 
    selectedAccId; 
    error;
    total;

    @wire(getAllAccounts)
    accountHandler({data, error}) {
        if(data) {
            this.accountOptions = this.picklistGenerator(data);
        }
        if(error) {
            this.error = error;
        }
    }

    picklistGenerator(data) {
        return data.map(item => ({
            label: item.Name,
            value: item.Id
        }));
    }

    changeHandler(event) {
        this.selectedAccId = event.target.value;
        calculateOppAmount({accId: this.selectedAccId})
            .then(result => {
                this.total = result;
            })
            .catch(error => {
                this.error = error;
            })
    }
}