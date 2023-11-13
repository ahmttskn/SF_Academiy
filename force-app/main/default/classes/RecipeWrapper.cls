public with sharing class RecipeWrapper {
    
    public class RecipeDetail {
        public String title;
        public string summary;
        public Decimal pricePerServing;
        public Integer readyInMinutes;
        public String[] dishTypes;
        public String[] diets;
        public Integer aggregateLikes;
        public Integer healthScore;
    }
}