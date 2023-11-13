import { LightningElement/*, track, wire*/ } from 'lwc';
/*import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getStudents from '@salesforce/apex/StudentAttandenceController.getStudents';
import createAttendanceRecords from '@salesforce/apex/StudentAttandenceController.createAttendanceRecords';
import allClassRecords from '@salesforce/apex/StudentAttandenceController.allClassRecords';
import { NavigationMixin } from 'lightning/navigation';

import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import Student_OBJ from '@salesforce/schema/Student__c';
import hasAttendance_FIELD from '@salesforce/schema/Student__c.hasAttendance__c';

const columns = [
  { label: 'Student Name', fieldName: 'Name' },
  { label: 'Attendance', fieldName: 'hasAttendance__c', type: 'hasAttendancePicklist', editable : 'true', wrapText : 'true',
    typeAttributes: {
        options: { fieldName: 'picklistOptions' },
        value: { fieldName: 'hasAttendance__c' },
        recordId: { fieldName: 'Id' },
        placeholder: 'Choose hasAttendance'
      }
  },
  { label: 'Class', fieldName: 'Class__r' },
  { label: 'Teacher Name', fieldName: 'Teacher__r' }
  
 */

  // {
  //   label: 'Blacklist',
  //   fieldName: 'Blacklist__c',
  //   wrapText: true,
  //   type: 'blacklistPicklist',
  //   typeAttributes: {
  //       options: [
  //           { label: 'No', value: 'No' },
  //           { label: 'Si', value: 'Si' }
  //       ],
  //       value: {fieldName: 'Blacklist__c'},
  //       placeholder: 'blacklist',
  //       editable: true
  //   }


  // {
  //   label: 'Attendance',
  //   type: 'boolean',
  //   initialWidth: 100,
  //   typeAttributes: { iconName: 'utility:check', cellAttributes: { alignment: 'center' } },
  //   fieldName: 'hasAttendance',
  //   editable : 'true'
  // }
  // {
  //   label: 'Attendance',
  //   fieldName: 'hasAttendance',
  //   type: 'custom',
  //   editable: true,
  //   typeAttributes: {
  //       options: [
  //           { label: 'Geldi', value: 'OK' },
  //           { label: 'Gec Kaldi', value: 'Gec Kaldi' },
  //           { label: 'Yok', value: 'Yok' }
  //       ],
  //       value: { fieldName: 'hasAttendance' },
  //       context: {
  //           fieldName: 'hasAttendance'
  //       },
  //       handleEditChange: (event) => {
  //           this.handleEditChange(event);
  //       }
  //   }
  // }
//];

export default class DatatablePiclistShowing extends LightningElement {

    //@track data = []; // students
    //@track columns = columns;
    //rowOffset = 0;





/*
child component

import LightningDatatable from "lightning/datatable";
import customPicklist from "./customPicklist.html";
import { api } from "lwc";

export default class HasAttendancePicklist extends LightningDatatable {
    static customTypes = {
        hasAttendancePicklist: {
            template: customPicklist,
            standardCellLayout: true,
            typeAttributes: [ 'label', 'options', 'value', 'placeholder']
        }
    }

    @api recordId;
    @api value;

    handleValueChange(event) {
        // Kullanıcı tarafından değiştirilen değeri almak için bu metod kullanılır
        const selectedValue = event.target.value;
        // Değiştirilen değeri döndür
        this.dispatchEvent(new CustomEvent('valuechange', { detail: selectedValue }));
    }
}

classHandleChange(event){
    this.selectedClass = event.target.value;
    console.log('this.selectedClassCombo', this.selectedClass);
      getStudents({ className: this.selectedClass })
          .then(result => {

            let options = [];
            for(var key in this.hasAttendanceValues){
              options.push({label: this.hasAttendanceValues[key].label, value: this.hasAttendanceValues[key].value});
            }


              this.students = result;
              console.log('result', JSON.stringify(result));
            // ilk liste için
              this.data = result.map(row => {
                return {
                  ...row,
                  Class__r: row.Class__r.Name,
                  Teacher__r: row.Teacher__r.Name,
                  'picklistOptions': options
                  // Diğer sütunları buraya ekleyin
                };
              });
              
          })
          .catch(error => {
            console.error('error',error);
          })   
  }



getSelectedRow(event) {
  this.selectedRows = event.detail.selectedRows;
  // Display that fieldName of the selected rows
  console.error('selectedRows ', JSON.stringify(this.selectedRows));
}

*/
}