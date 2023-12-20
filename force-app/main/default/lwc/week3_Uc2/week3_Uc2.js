import { LightningElement, wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountCtrl.getAllAccounts';
import calculateOppAmount from '@salesforce/apex/AccountCtrl.calculateOppAmount';

export default class Week3_Uc2 extends LightningElement {

    accountOptions = []; 
    selectedAccId; 
    error;
    total;
    tOpp;
    noOpp;

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
                //this.total = result;
                const num = 0;
                if (result > 0) {
                    this.total = result;
                    this.tOpp = undefined;
                    this.noOpp = undefined;
                }
                if (result === num) {
                    console.log(result);
                    this.tOpp = ' ';
                    this.noOpp = undefined;
                    this.total = undefined;
                }
                if (result < 0) {
                    this.noOpp = result;
                    this.total = undefined;
                    this.tOpp = undefined;  
                }  
            })
            .catch(error => {
                this.error = error;
            })
    }
}