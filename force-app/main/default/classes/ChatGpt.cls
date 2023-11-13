public with sharing class ChatGpt {
    //private static final String CHATGPT_ENDPOINT = 'https://api.openai.com/v2/engines/davinci/completions'; // Adjust as needed
    private static final String CHATGPT_ENDPOINT = 'https://api.openai.com/v1/chat/completions'; // Adjust as needed
    // benim private static final String API_KEY = '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'; // Store this securely. Preferably in Named Credentials or Custom Settings
    private static final String API_KEY = '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'; // Store this securely. Preferably in Named Credentials or Custom Settings
   
    
    @AuraEnabled(cacheable=true)
   public static String askChatGPT(String question) {
       HttpRequest req = new HttpRequest();
       req.setEndpoint(CHATGPT_ENDPOINT);
       req.setMethod('POST');
       req.setHeader('Authorization', 'Bearer ' + API_KEY);
       req.setHeader('Content-Type', 'application/json');
       /*Map<String, Object> requestBody = new Map<String, Object> {
            'model' => 'gpt-3.5-turbo',
            'prompt' => question,
            'max_tokens' => 150  // This limits the response length, adjust as necessary
       };*/
        Map<String, Object> requestBody = new Map<String, Object>{
            'messages' => new List<Map<String, Object>>{
                new Map<String, Object>{
                    'role' => 'system',
                    'content' => question
                }
            },
            'model' => 'gpt-3.5-turbo',
            'max_tokens' => 40 
        };

       req.setBody(System.JSON.serialize(requestBody));
       Http http = new Http();
       HttpResponse res = http.send(req);
       if(res.getStatusCode() == 200) {
           Map<String, Object> responseBody = (Map<String, Object>) System.JSON.deserializeUntyped(res.getBody());
           List<Object> choicesList = (List<Object>) responseBody.get('choices');
           Map<String, Object> firstChoice = (Map<String, Object>) choicesList[0];
           return String.valueOf(firstChoice.get('text'));
       } else {
           // Handle the error or throw an exception
           throw new ChatGPTException('Failed to retrieve answer from ChatGPT. Status: ' + res.getStatusCode() + '. Response: ' + res.getBody());
       }
   }
   public class ChatGPTException extends Exception {}
}