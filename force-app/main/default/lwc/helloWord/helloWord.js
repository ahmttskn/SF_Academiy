import { LightningElement } from 'lwc';

export default class HelloWord extends LightningElement {

    name = 'Rodrigez';
    lastName =  'Conzales';

    fullName = this.name + ' '+this.lastName;

    location = {
        city: 'Dallas',
        country: 'US',
        postalCode: '94070'
    };
    

    fruits = ['banana', 'apple', 'chery', 'grapes', 'orenga'];

    contacts = [
        {id:"a", firstName:"Ahmet Ahmet Ahmet", lastName:"Test"},
        {id:"d", firstName:"Mehmet", lastName:"Deneme"},
        {id:"c", firstName:"Ayşe", lastName:"Dene"},
        {id:"b", firstName:"Ali", lastName:"test test test test"},
        {id:"g", firstName:"Leyla Leyla Leyla Leyla Leyla", lastName:"Test"},
        {id:"e", firstName:"Zehra", lastName:"Dene"},
        {id:"f", firstName:"Veli", lastName:"Deneme"}
    ]




}