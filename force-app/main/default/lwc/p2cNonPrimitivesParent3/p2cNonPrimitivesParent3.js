/**
 * @description       : 
 * @author            : Huseyin
 * @group             : 
 * @last modified on  : 08-21-2022
 * @last modified by  : Huseyin
**/
import { LightningElement } from 'lwc';

export default class P2cNonPrimitiesParent3 extends LightningElement {
    carouselData = [
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-01.jpg",
            header: "First Card",
            description: "First card description.",
            alternativeText: "First card accessible description.",
            href: "https://www.softinnovas.com"
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-02.jpg",
            header: "Second Card",
            description: "Second card description.",
            alternativeText: "Second card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-03.jpg",
            header: "Third Card",
            description: "Third card description.",
            alternativeText: "Third card accessible description.",
            href: "javascript:void(0);"
        }
    ];
}