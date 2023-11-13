import { LightningElement, track } from 'lwc';
import getRandomRecipe from '@salesforce/apex/SpoonacularAPI.getRandomRecipe';
import getRecipeByIngredients from '@salesforce/apex/SpoonacularAPI.getRecipeByIngredients';

export default class Spoonacular_RecipeSearch extends LightningElement {
    
    @track recipes = [];
    searchWord;

    //Grab the ingredient entered in the search bar
    changeHandler(event){
        this.searchWord = event.target.value;
    }

    //Search for receipe
    searchHandler(){
        getRecipeByIngredients({ingrs: this.searchWord})
            .then(result => {
                console.log(result);
                this.recipes = JSON.parse(result);
            })
            .catch( error => {
                console.error(error);
            });
    }

    enterHandler(event){
        if(event.keyCode === 13){
            this.searchHandler();
        }
    }

    //Get random receipe
    randomReceipeHandler(){
        getRandomRecipe()
            .then( result => {
                console.log(result);
                this.recipes = JSON.parse(result).recipes;
            })
            .catch( error => {
                console.error(error);
            })
    }
}