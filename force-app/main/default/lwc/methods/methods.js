import { LightningElement } from 'lwc';

export default class Methods extends LightningElement {

    /*
    const hasAttendance = this.students.filter(item => ["Gec Kaldi", "Yok"].includes(item.Attendance)).length > 0;
    if (!hasAttendance) {
      this.showToast('Error', 'Please select students for attendance.', 'error');
      return;
    } 

      let studentsData = this.students;
      Object.keys(studentsData).forEach((key) => {
          console.log('this.students[key] ', JSON.stringify(studentsData[key].Attendance));
          if (!studentsData[key].Attendance === "Gec Kaldi" || !studentsData[key].Attendance === "Yok" || studentsData.Attendance === undefined ) {
            //this.showToast('Error', 'Please select students for attendance.', 'error');
            return;
          }
      });

      if (this.selectedRows.length > 0) {
        const hasAttendanceValues = this.selectedRows.map(row => row.hasAttendance__c);
        console.log('hasAttendance__c values:', hasAttendanceValues);
      }


      */
}