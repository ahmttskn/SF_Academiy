/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-12-2022
 * @last modified by  : Huseyin
**/
import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

export default class GetContactRecordLayoutTry extends LightningElement {
        recordId='0038c00002oBrU0AAK';
        name;
        title;
        accountName;
        phone;
        email;
        mobile;
        contactOwner;
@wire(getRecord,{recordId:'$recordId',layoutTypes:['Compact'],modes:['View']})
contactRecordHandler({data,error}){
               if(data){
                console.log(data);
                this.name = data.fields.Salutation.displayValue+ data.fields.FirstName.value+ ' ' + data.fields.LastName.value;
                this.title = data.fields.Title.value;
                this.accountName = data.fields.Account.displayValue;
                this.phone = data.fields.Phone.value;
                this.email = data.fields.Email.value;
                this.mobile = data.fields.MobilePhone.value;
                this.contactOwner = data.fields.Owner.displayValue;
            console.log(this.title);        
          }
         if(error){
            console.log(error);
        }
}
}