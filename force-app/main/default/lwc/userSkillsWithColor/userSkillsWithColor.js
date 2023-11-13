// userSkills.js

import { LightningElement, wire, api, track } from 'lwc';
import getSkillCompletion from '@salesforce/apex/PTSProgressBar.getSkillCompletion';

export default class UserSkills extends LightningElement {
    @api recordId='a07Hs00000zn3ZKIAY'; // Capture the developerId from the record page
    @track skills = []; // Initialize an empty array for skills data
    skillSet;
    @track isCompleted = '';

    @wire(getSkillCompletion, { developerId: '$recordId' })
    wiredSkills({ error, data }) {
        if (data) {
            console.log('data ', data);
            this.skillSet =JSON.stringify(data);

            // data.forEach(item => ({
            //     this.skills.push({ name: item.key, percentage: item.value });
            // }));
            
            Object.keys(data).forEach((key) => {
                this.skills.push({ name: key, percentage: data[key], isCompleted: (data[key])===100? 'skill-complete' : 'skill-incomplete'});
                // let myListElement = this.querySelector('.skills-list li[key="' + key + '"]');
                // console.log('myListElement',myListElement);
                // if (data[key] === 100) {
                //     myListElement.classList.add('skill-complete');
                // }else {
                //     myListElement.classList.add('skill-incomplete');
                // }
            });

            // connectedCallback() {
            //     let myListElement = this.template.querySelector('skills-list li');
            //     console.log('myListElement',myListElement);
            //     if (data[key] === 100) {
            //         myListElement.classList.add('skill-complete');
            //     }else {
            //         myListElement.classList.add('skill-incomplete');
            //     }
            // }

            // const elems=this.template.querySelectorAll('div.child');
            // elems.forEach(item=>{

            //     console.log(item.innerText);
            //     item.style.color="red";
            //     item.setAttribute("class","slds-align_absolute-center");
            //     item.style.border="4px solid gray";
            // })

            // Object.keys(data).forEach((key) => {
            //     // this.skills = [...this.skills, { name: key, percentage: data[key] } ];
            //     console.log(key, data[key]);
            //     this.skills.push(1);
            // });

            // this.skills = Object.keys(data).map(key => ({
            //     ...key,  name: key, percentage: data[key] }));
    
                // const myNewData = [];
                // let keys = Object.keys(data);

                // this.skills = keys.map( (key) => {
                // myNewData.push({name: key, percentage: data[key]});
                // console.log('myNewData', myNewData);
                // return myNewData;
                // });

            // this.skills = Object.keys(data).map(skill => ({
            //     ...skill,
            //     name: skill,
            //     percentage: data[skill]
            // })); 

            console.log('skills', this.skills);
        } else if (error) {
            // Handle error appropriately
            console.error('Error:', error);
        }
    }
   /* getNameAndPercentage(skills) {
        return skills.map(skill => ({
            name: skill.Name,
            percentage: skill.Percentage
        }));
    }
    
    getSkillClass(percentage) {
        return percentage === 100 ? 'skill-complete' : 'skill-incomplete';
    }
    */
}