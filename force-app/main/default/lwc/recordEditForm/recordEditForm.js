import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class RecordEditForm extends LightningElement {

    objectName = ACCOUNT_OBJECT;
    recordId = "001Do000003N3kJIAS"

    fields = {
        name: NAME_FIELD,
        type: TYPE_FIELD,
        Industry: INDUSTRY_FIELD,
        phone: PHONE_FIELD,
        revenue: REVENUE_FIELD
    }

    handleClick(){
        const event = new ShowToastEvent({
            title: 'Success!',
            message: 'Record created! See it Click !',
            variant: "success"
            
        });
        this.dispatchEvent(event);
    }

    handleButtonClick() {
        const event = new ShowToastEvent({
            title: 'Success!',
            message: 'Record {0} created! See it Click {1}!',
            messageData: [
                'Salesforce',
                {
                    url: 'https://bayarea-dev-ed.develop.lightning.force.com/lightning/r/Account/001Do000003N3k9IAC/view',
                    label: 'here',
                },
            ],
        });
        this.dispatchEvent(event);
    };


    /*
    handleRecordClick() {
        this[NavigationMixin.GenerateUrl]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '001Do000003N3kJIAS',
                actionName: 'view',
            },
        }).then((url) => {
            const event = new ShowToastEvent({
                title: 'Success!',
                message: 'Record {0} created! See it {1}!',
                messageData: [
                    'Salesforce',
                    {
                        url,
                        label: 'here',
                    },
                ],
            });
            this.dispatchEvent(event);
        });
    }
    */

}