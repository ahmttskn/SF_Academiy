/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-18-2022
 * @last modified by  : Huseyin
**/

import getAllAccounts from '@salesforce/apex/AccountCtrl.getAllAccounts';
//import getCountContacts from '@salesforce/apex/AccountCtrl.getCountContacts';

import { LightningElement, wire } from 'lwc';

export default class ImperativeApexThree extends LightningElement {
    selectedAccount;
    accountOptions=[];
    contactsSize;
    accountsData;
    NumberofContact;

    @wire(getAllAccounts)
    accountHandler({data,error}){
        if(data){
            console.log(data);
            this.accountsData=data;
            this.accountOptions=this.piclistGenerator(data);
            console.log(this.accountOptions);
        }
        if(error){
            console.error(error);
        }
    }

    piclistGenerator(data){
        return data.map(item=>({
            label:item.Name,
            value:item.Id
        }))
    }

    changeHandler(event){
        this.selectedAccount = event.target.value;
        console.log(this.selectedAccount);
        console.log(this.accountsData);
        
        this.accountsData.forEach(element => {
            if(element.Id===this.selectedAccount){
            console.log(element);
            this.NumberofContact=element.Number_of_Contacts__c;

            }
        });



        //I can use getRecord instead of this( another approach )

        // getCountContacts({accId:this.selectedAccount})
        //     .then(result=>{
        //         console.log(result);
        //         this.contactsSize=result;
        //     })
        //     .catch(error =>{
        //         console.error(error);
        //     })
    }

    
}