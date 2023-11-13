import { LightningElement, api } from 'lwc';

const columns = [
    { label: 'Id', fieldName: 'Id'},
    { label: 'FirstName', fieldName: 'FirstName', type: 'text' },
    { label: 'LastName', fieldName: 'LastName', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Title', fieldName: 'Title', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
];

export default class Week4_displayContact extends LightningElement {

    @api contacdata;
    @api error;
    selectedId;
    columns = columns;

    getSelectedRows(event){

        const selectedRowDetails =  event.detail.selectedRows;
        //window.alert(JSON.stringify(selectedRowDetails));

        this.selectedId = event.detail.selectedRows[0].Id;

        //const ids = vent.detail.selectedRows.filter(item => item.Id);
        //const ids = vent.detail.selectedRows.map(item => item.Id);

        console.log("selected id at detail: " + JSON.stringify(event));
        console.log("this.selectedId : " + JSON.stringify(this.selectedId));

        if (this.selectedId) {
            const selectEvent = new CustomEvent('select', {detail: this.selectedId});
            this.dispatchEvent(selectEvent); 
        }
    }


    clickHandler(event) {
        console.log('event',event);
        this.selectedId = event.detail.selectedRows[0].Id;

        // const selectedRows = event.detail.selectedRows;
        // console.log("selected id at source: " + this.selectedId);
        //     for (let i = 0; i < selectedRows.length; i++) {
        //         alert('You selected: ' + selectedRows[i].Id);
        //     }

        /*
        const selectedRows = event.detail.selectedRows;
        const selectedRowIds = [];

        for (const row of selectedRows) {
            const selectedRowId = row.Id;
            selectedRowIds.push(selectedRowId);
        }
        console.error('selectedRows',JSON.stringify(selectedRowIds));
        */

        // const selectedRowDetails =  event.detail.selectedRows;
        // window.alert(JSON.stringify(selectedRowDetails))
        

        /*var el = this.template.querySelector('lightning-datatable');
        var selected = el.getSelectedRows();
        let selectedIdsArray = [];

        for (const element of selected) {
            //console.log('elementid', element.Id);
            this.selectedId = element.Id;
        }
        */

        /*
        const selectedRows = event.detail.selectedRows;
        // Display that fieldName of the selected rows
        for (let i = 0; i < selectedRows.length; i++){
            console.log("You selected: " + selectedRows[i].Id);
        }
        */


        console.log("selected id at detail: " + JSON.stringify(event));
        console.log("this.selectedId : " + JSON.stringify(this.selectedId));
        
        const selectEvent = new CustomEvent('select', {detail: this.selectedId});
        this.dispatchEvent(selectEvent); 
    }
    
}