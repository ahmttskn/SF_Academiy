import { LightningElement, track } from 'lwc';
import askChatGPT from '@salesforce/apex/ChatGpt.askChatGPT';

export default class ChatGptLWC extends LightningElement {
    @track question = 'What is Salesforce?';
    @track response = '';

    handleQuestionChange(event) {
        this.question = event.target.value;
    }

    askToChatGPT() {
        askChatGPT({ 
            question: this.question//first iinput after
            //second iinput after (,)
         })
            .then(result => {
                this.response = result;
            })
            .catch(error => {
                console.error('Error fetching response from ChatGPT:', error);
                this.response = 'Error: Unable to fetch response from ChatGPT';
            });
    }
}