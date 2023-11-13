import { LightningElement, api } from 'lwc';
import getRandomRecipe from '@salesforce/apex/SpoonacularAPI.getRecipe';

export default class Spoonacular_Recipe extends LightningElement {

    @api recipeId;
    @api recipeImage;
    @api recipeTitle;
    @api recipeSummary;
    @api pricePerServing;
    @api readyInMinutes;
    @api dishTypes;
    @api diets;

    get showDetails(){
        return this.recipeSummary ? true : false;
    }

    fetchRecipe(){
        getRandomRecipe({recipeId: this.recipeId})
            .then(result => {
                const recipe = JSON.parse(result);
                this.recipeSummary = recipe.summary;
                this.pricePerServing = recipe.pricePerServing;
                this.readyInMinutes - recipe.readyInMinutes;
                this.dishTypes = recipe.dishTypes;
                this.diets = recipe.diets;
            })
            .catch( error => {
                console.error(error);
            })
    }
}