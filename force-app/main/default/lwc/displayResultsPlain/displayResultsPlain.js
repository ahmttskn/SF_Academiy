import { api, LightningElement } from 'lwc';

export default class DisplayResultsPlain extends LightningElement {
    @api contacts;
    selectedId;

    clickHandler(event) {
        console.log(event);
        this.selectedId = event.currentTarget.dataset.id;
        console.log("selected id at source: " + this.selectedId);
        const selectEvent = new CustomEvent('select', {detail: this.selectedId});
        this.dispatchEvent(selectEvent);
    }
}