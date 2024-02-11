public with sharing class QuickbooksConnector {

    public String authToken { get; set; }
    public String QBPageURL { get; set; }
    private static QuickBookIntuit__c serviceObject;

    private static QuickBookIntuit__c getServiceSettings() {
        // Servis ayarlarını almak için gerekli kodu buraya ekleyin
        // Örnek bir şekilde QuickBookIntuit__c türünden bir nesne döndürün
        QuickBookIntuit__c QBSettings = [SELECT Access_Token_URL__c,	
                                                Application_Token__c,		
                                                Authorization_URL__c,	
                                                CompanyId__c,		
                                                Consumer_Key__c,		
                                                Consumer_Secret__c,			
                                                Expense_Account_Id__c,
                                                Expire_In_Seconds__c,
                                                Expires_In_Time__c,
                                                Http_Request_Type__c,
                                                Income_Account_Id__c,
                                                OAuth_Token__c,
                                                OAuth_Token_Secret__c,
                                                Name,
                                                QBBaseURI__c,
                                                Refresh_Token_Expires_In__c,
                                                Request_Token_URL__c,
                                                StateID__c,
                                                Temporary_Token_Secret__c,
                                                Test_URL__c  
                                         FROM QuickBookIntuit__c LIMIT 1];
        return QBSettings;
    }
    

    // public pagereference GetAuthorization() {
    //     serviceObject = getServiceSettings();

    //     String timestamp = string.valueof(dateTime.now().getTime() / 1000);



    //     Map<String, String> parameters = new Map<String, String>();
    //     parameters.put('client_id', serviceObject.Consumer_Key__c);
    //     parameters.put('scope', 'com.intuit.quickbooks.accounting');
    //     parameters.put('redirect_uri',EncodingUtil.urlEncode(URL.getOrgDomainUrl().toExternalForm() +
    //         '/apex/QuickbooksConnectorPage',
    //         '/apex/QB_Salesforce_Integration',
    //         'UTF-8'
    //         )
    //     );
    //     parameters.put('response_type', 'code');
    //     parameters.put('state', timestamp);

    //     String url =
    //         serviceObject.Authorization_URL__c +
    //         '?client_id=' +
    //         serviceObject.Consumer_Key__c +
    //         '&scope=com.intuit.quickbooks.accounting&redirect_uri=' +
    //         EncodingUtil.urlEncode(
    //         URL.getOrgDomainUrl().toExternalForm() +
    //         '/apex/QuickbooksConnectorPage',
    //         'UTF-8'
    //         ) +
    //         '&response_type=code&state=' +
    //         timestamp;

    //     HttpRequest req = new HttpRequest();
    //     HttpResponse res;
    //     req.setEndpoint(url);
    //     req.setMethod(serviceObject.Http_Request_Type__c);
    //     req.setHeader('Content-Length', '146');

    //     QBPageURL =
    //         'https://c71.qbo.intuit.com/Connect/Begin?oauth_token=' + authToken;

    //     pagereference redirect = new PageReference(url);
    //     return redirect.setRedirect(true);
    // }

    /* =============================================================================
    //
    //    Function: Get Authorization Code With Accounting Online Scope
    //
    =============================================================================*/

    public pagereference GetAuthorization() {
    serviceObject = getServiceSettings();

    String timestamp = string.valueof(dateTime.now().getTime() / 1000);

    Map<String, String> parameters = new Map<String, String>();
    parameters.put('client_id', serviceObject.Consumer_Key__c);
    parameters.put('scope', 'com.intuit.quickbooks.accounting');
    parameters.put(
        'redirect_uri',
        EncodingUtil.urlEncode(
        URL.getOrgDomainUrl().toExternalForm() +
        // '/apex/QuickbooksConnector',
        '/apex/QB_Salesforce_Integration',
        'UTF-8'
        )
    );
    parameters.put('response_type', 'code');
    parameters.put('state', timestamp);

    String url =
        serviceObject.Authorization_URL__c +
        '?client_id=' +
        serviceObject.Consumer_Key__c +
        '&scope=com.intuit.quickbooks.accounting&redirect_uri=' +
        EncodingUtil.urlEncode(
        URL.getOrgDomainUrl().toExternalForm() +
         // '/apex/QuickbooksConnector',
         '/apex/QB_Salesforce_Integration',
        'UTF-8'
        ) +
        '&response_type=code&state=' +
        timestamp;
        

    HttpRequest req = new HttpRequest();
    HttpResponse res;
    req.setEndpoint(url);
    req.setMethod(serviceObject.Http_Request_Type__c);
    req.setHeader('Content-Length', '146');

    QBPageURL =
        'https://c71.qbo.intuit.com/Connect/Begin?oauth_token=' + authToken;

    pagereference redirect = new PageReference(url);
    return redirect.setRedirect(true);
    }

    public void getAccessToken() {
    serviceObject = getServiceSettings();
    if (!ApexPages.currentPage().getParameters().containskey('code'))
        return;

    String encodedString = EncodingUtil.base64Encode(
        Blob.valueOf(
        serviceObject.Consumer_Key__c + ':' + serviceObject.Consumer_Secret__C
        )
    );
    String endPoint = 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer';
    String redirectUrl = EncodingUtil.urlEncode(
        URL.getOrgDomainUrl().toExternalForm() +
        // '/apex/QuickbooksConnector',
        '/apex/QB_Salesforce_Integration',
        'UTF-8'
    );
    String oAuthCode = ApexPages.currentPage().getParameters().get('code');
    String companyId = ApexPages.currentPage().getParameters().get('realmId');
    String stateID = ApexPages.currentPage().getParameters().get('state');
    String requestBody =
        'grant_type=authorization_code&code=' +
        oAuthCode +
        '&redirect_uri=' +
        redirectUrl;
    String errorMessage = '';

    HttpRequest httpReq = new HttpRequest();
    HttpResponse httpRes = new HttpResponse();
    Http http = new Http();
    httpReq.setMethod(serviceObject.Http_Request_Type__c);
    httpReq.setEndPoint(endPoint);
    httpReq.setHeader('Authorization', 'Basic ' + encodedString);
    httpReq.setHeader('Content-Type', 'application/x-www-form-urlencoded');
    httpReq.setBody(requestBody);

    try {
        httpRes = http.send(httpReq);

        if (httpRes.getStatusCode() == 200) {
        Map<String, Object> response_Map = (Map<String, Object>) JSON.deserializeUntyped(
            httpRes.getBody()
        );
        serviceObject.StateID__c = stateID;
        serviceObject.CompanyId__c = companyId;
        serviceObject.OAuth_Token_Secret__c = oAuthCode;
        serviceObject.OAuth_Token__c = string.valueof(
            response_Map.get('access_token')
        );
        serviceObject.Temporary_Token_Secret__c = string.valueof(
            response_Map.get('refresh_token')
        );
        serviceObject.Expire_In_Seconds__c = (Decimal) response_Map.get(
            'expires_in'
        );
        serviceObject.Refresh_Token_Expires_In__c = (Decimal) response_Map.get(
            'x_refresh_token_expires_in'
        );
        serviceObject.Expires_In_Time__c = System.Now()
            .addSeconds(
            Integer.valueOf((Decimal) response_Map.get('expires_in'))
            );

        ApexPages.addmessage(
            new ApexPages.message(
            ApexPages.severity.Confirm,
            +' ' + 'Successfully Authenticated with Quickbooks System!!!'
            )
        );
        update serviceObject;
        } else {
        ApexPages.addmessage(
            new ApexPages.message(
            ApexPages.severity.ERROR,
            +' ' +
                'Unexpected Error while communicating with Quickbooks API' +
                'Status ' +
                httpRes.getStatus() +
                ' and Status Code ' +
                httpRes.getStatuscode()
            )
        );
        }
    } catch (System.Exception e) {
        if (String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')) {
        errorMessage =
            'Unauthorize endpoint: An Administrator must go to Setup -> Administer -> Security Control ->' +
            ' Remote Site Setting and add ' +
            ' ' +
            endPoint +
            ' Endpoint';
        ApexPages.addmessage(
            new ApexPages.message(ApexPages.severity.ERROR, errorMessage)
        );
        } else {
        errorMessage =
            'Unexpected Error while communicating with Quickbooks API. ' +
            'Status ' +
            httpRes.getStatus() +
            ' and Status Code ' +
            httpRes.getStatuscode();
        ApexPages.addmessage(
            new ApexPages.message(ApexPages.severity.ERROR, errorMessage)
        );
        }
    }
}
public void doRefreshAccessToken() {
    serviceObject = getServiceSettings();
    String encodedString = EncodingUtil.base64Encode(
      Blob.valueOf(
        serviceObject.Consumer_Key__c + ':' + serviceObject.Consumer_Secret__c
      )
    );
    String endPoint = 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer';
    String requestBody = 'grant_type=refresh_token&refresh_token=';
    if (serviceObject.Temporary_Token_Secret__c != null) {
      requestBody += serviceObject.Temporary_Token_Secret__c;
    } else {
    }
    String errorMessage = '';
    HttpRequest httpReq = new HttpRequest();
    HttpResponse httpRes = new HttpResponse();
    Http http = new Http();
    httpReq.setMethod('POST');
    httpReq.setEndPoint(endPoint);
    httpReq.setHeader('Authorization', 'Basic ' + encodedString);
    httpReq.setHeader('Content-Type', 'application/x-www-form-urlencoded');
    httpReq.setBody(requestBody);
    try {
      httpRes = http.send(httpReq);
      if (httpRes.getStatusCode() == 200) {
        Map<String, Object> response_Map = (Map<String, Object>) JSON.deserializeUntyped(
          httpRes.getBody()
        );
        serviceObject.OAuth_Token__c = string.valueof(
          response_Map.get('access_token')
        );
        serviceObject.Temporary_Token_Secret__c = string.valueof(
          response_Map.get('refresh_token')
        );
        serviceObject.Expire_In_Seconds__c = (Decimal) response_Map.get(
          'expires_in'
        );
        serviceObject.Refresh_Token_Expires_In__c = (Decimal) response_Map.get(
          'x_refresh_token_expires_in'
        );
        serviceObject.Expires_In_Time__c = System.Now()
          .addSeconds(
            Integer.valueOf((Decimal) response_Map.get('expires_in'))
          );
        update serviceObject;
      }
    } catch (System.Exception e) {
      if (String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')) {
        errorMessage =
          'Unauthorize endpoint: An Administrator must go to Setup -> Administer -> Security Control ->' +
          ' Remote Site Setting and add ' +
          ' ' +
          endPoint +
          ' Endpoint';
      } else {
        errorMessage =
          'Unexpected Error while communicating with Quickbooks API. ' +
          'Status ' +
          httpRes.getStatus() +
          ' and Status Code ' +
          httpRes.getStatuscode();
      }
    }
  }
}
