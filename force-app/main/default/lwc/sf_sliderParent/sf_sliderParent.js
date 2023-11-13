import { LightningElement } from 'lwc';

export default class Sf_sliderParent extends LightningElement {

    value;
    handleChange(event) {
        this.value = event.detail.value;
    }
    handleClick(){
        this.template.querySelector('c-sf_slider-child').resetSlider();
    }

    get options() {
        return [
            { label: 'x-small', value: 'x-small' },
            { label: 'small', value: 'small' },
            { label: 'medium', value: 'medium' },
            { label: 'large', value: 'large' }
        ];
    }
}