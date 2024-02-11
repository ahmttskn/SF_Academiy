import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
    
export default class QuickbooksConnector extends NavigationMixin(LightningElement) {
    openVisualforcePage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: '/apex/QB_Salesforce_Integration'
            }
        });
    }
}
    