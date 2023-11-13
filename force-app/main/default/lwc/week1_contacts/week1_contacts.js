import { LightningElement } from 'lwc';

export default class Week1_contacts extends LightningElement {

    contacts = [
        {name : "Jeff Bezos", title : "Executive Chairman", company : "Amazon", stay : "United States"},
        {name : "Sundar Pichai", title : "Chief Executive Officer", company : "Google", stay : "United States"},
        {name : "Tim Cook", title : "Chief Executive Officer", company : "Apple", stay : "United States"},
        {name : "Mark Zuckerberg", title : "Chief Executive Officer", company : "Facebook", stay : "United States"},
    ];
    
    //console.log('OUTPUT : ',);

    // first(contacts) {
    //     for (var a in contacts) return a;
    // }

    // var first;
    // for (var i in obj) {
    // if (obj.hasOwnProperty(i) && typeof(i) !== 'function') {
    //     first = obj[i];
    //     break;
    // }


    // name= contacts[0].name[0];
    // title= contacts[0].title; 
    // company= contacts[0].company; 
    // stay= contacts[0].stay;

    // firstContact = {
    //         name: contacts[0].name, 
    //         title: contacts[0].title, 
    //         company: contacts[0].company, 
    //         stay: contacts[0].stay
    // };

    
    // // console.log('first contact ', firstContact);
    
    // firstContact = {
    //     name : "Jeff Bezos", 
    //     title : "Executive Chairman", 
    //     company : "Amazon", 
    //     stay : "United States"
    // }
}