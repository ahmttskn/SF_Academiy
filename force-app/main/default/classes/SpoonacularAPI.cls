public with sharing class SpoonacularAPI {


    
    private static final String API_KEY = 'Api Key';
    
    @AuraEnabled
    public static String getRandomRecipe() {
        //1. Get callout details
        Map<String,String> details = SpoonacularMetadataHandler.getSpoonacularDetails();
        String endpoint = details.get('Get Random Recipe'); //https://api.spoonacular.com/recipes/random
        String apiKey = details.get('API Key'); //f1f54551d76845b0889c2fc12f5c7322

        //2. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint + '?apiKey=' + apiKey); //https://api.spoonacular.com/recipes/random?apiKey=f1f54551d76845b0889c2fc12f5c7322
        request.setMethod('GET');

        //3. Prepare internet
        Http http = new Http();

        //4. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //5. Process the response
        if(response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }

    @AuraEnabled
    public static String getRecipeByIngredients(String ingrs) {
        //1. Get callout details
        Map<String,String> details = SpoonacularMetadataHandler.getSpoonacularDetails();
        String endpoint = details.get('Search By Ingredients'); //https://api.spoonacular.com/recipes/findByIngredients
        String apiKey = details.get('API Key'); //f1f54551d76845b0889c2fc12f5c7322

        //2. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint + '?apiKey=' + apiKey + '&ingredients=' + ingrs); //https://api.spoonacular.com/recipes/findByIngredients?apiKey=f1f54551d76845b0889c2fc12f5c7322&ingredients=Apple
        request.setMethod('GET');

        //3. Prepare internet
        Http http = new Http();

        //4. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //5. Process the response
        if(response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }

    @AuraEnabled
    public static RecipeWrapper.RecipeDetail getRecipe(String recipeId) {
        //1. Get callout details
        Map<String,String> details = SpoonacularMetadataHandler.getSpoonacularDetails();
        String endpoint = details.get('Get Recipe'); //https://api.spoonacular.com/recipes/{id}/information
        endpoint = endpoint.replace('{id}',recipeId);
        String apiKey = details.get('API Key'); //f1f54551d76845b0889c2fc12f5c7322

        //2. Prepare HttpRequest and wrap all the necessary information
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint + '?apiKey=' + apiKey); //https://api.spoonacular.com/recipes/{id}/information?apiKey=f1f54551d76845b0889c2fc12f5c7322
        request.setMethod('GET');

        //3. Prepare internet
        Http http = new Http();

        //4. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //5. Process the response
        if(response.getStatusCode() == 200) {
            //return response.getBody();
            String jsonString = response.getBody();
            RecipeWrapper.RecipeDetail recipe = (RecipeWrapper.RecipeDetail) System.JSON.deserialize(jsonString, RecipeWrapper.RecipeDetail.class);
            return recipe;
        }
        return null;
    }

    
    
    /*
    
    public static void doCalloutFromFuture() {
        // string endpoint = 'https://api.spoonacular.com/recipes/716429/information?';
        //        endpoint += 'apiKey=' + ' 2a593000bb174d12bb777252c89fb7df';
        //        endpoint += '&includeNutrition=true';

        //2a593000bb174d12bb777252c89fb7df

        String apiKey = '2a593000bb174d12bb777252c89fb7df';
        String query = 'pasta';
        // Integer maxFat = 25;
        // Integer num = 2;

        String endpoint = 'https://api.spoonacular.com/recipes/complexSearch?' +
            'apiKey=' + apiKey +
            '&query=' + query;
            // '&maxFat=' + String.valueOf(maxFat) +
            // '&number=' + String.valueOf(num);
              
        //string endpoint = 'https://api.spoonacular.com/recipes/complexSearch?' +'&apiKey=' + ' 2a593000bb174d12bb777252c89fb7df' + 'query=pasta&maxFat=25&number=2' ;

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        Http http = new Http();

        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            
            //recipeResponse result = (recipeResponse) JSON.deserialize(response.getBody(), recipeResponse.class);

            System.debug(response.getBody());
            // Sonuçları kullanma örneği
            // for (SpoonacularAPI.Recipe recipe : result.results) {
            //     System.debug('Recipe ID: ' + recipe.id);
            //     System.debug('Recipe Title: ' + recipe.title);
            //     System.debug('Recipe Image: ' + recipe.image);
            //     System.debug('Recipe Image Type: ' + recipe.imageType);
            // }
        } else {
            System.debug('HTTP Request Error: ' + response.getStatusCode() + ' ' + response.getStatus());
        }
    }



    public class recipe {
        public Integer id;
        public String title;
        public String image;
        public String imageType;
    }

    public class recipeResponse {
        public List<Recipe> results;
        public Integer totalResults;
    }
    
    */
    
}