/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-20-2022
 * @last modified by  : Huseyin
**/
import { LightningElement, wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountCtrl.getAllAccounts';
//import getOppTotal from '@salesforce/apex/AccountCtrl.getOppTotal';

export default class OppsDetails extends LightningElement {
    selectedAccount;
    accountOptions = [];
    total;

    @wire(getAllAccounts)
    accountsHandler({data, error}) {
        if(data) {
            this.accountOptions = this.picklistGenerator(data);
            console.log(data);
        }
        if(error) {
            console.error(error);
        }
    }

    picklistGenerator(data) {
        return data.map(i => ({
            label: i.Name,
            value: i.Id // value kısmında ne tutmalyız
        }));
    }

    changeHandler(event) {
        this.selectedAccount = event.target.value;
        getOppTotal({accId: this.selectedAccount})
            .then(result => {
                console.log("result ", result);
                this.total = result;
            })
            .catch(error => {
                console.error(error);
            })
    }
}