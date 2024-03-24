public with sharing class Nargiz_Hoca_Google_API {
    
    // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LWC @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LWC @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
    public void Lead_Book_LWC() {

    
        /*
        import { api, LightningElement, wire, track } from 'lwc';
        import {
            getRecord,
            getFieldValue
        } from 'lightning/uiRecordApi';

        import getLeadAddressDetails from '@salesforce/apex/LeadAddressBookGeoValidateController.getLeadAddressDetails';
        import ADDRESSVERIFIED from '@salesforce/schema/Lead.Address_Verified__c';
        import LEADADDRESS from '@salesforce/schema/Lead.Address_Key__c';
        import { ShowToastEvent } from 'lightning/platformShowToastEvent';
        import verifyaddress from '@salesforce/apex/LeadAddressBookGeoValidateController.check';
        import updateVerifiedCheckBox from '@salesforce/apex/LeadAddressBookGeoValidateController.updateVerifiedCheckBox';
        import updateShippingAddress from '@salesforce/apex/LeadAddressBookGeoValidateController.updateAddress';
        import NoPartialMatchHeader from '@salesforce/label/c.No_Partial_Match_Header';
        import CurrentAddressHeader from '@salesforce/label/c.Current_Address_Header';
        import PartialMatchHeader from '@salesforce/label/c.Partial_Match_Header';
        import SuggestedAddressHeader from '@salesforce/label/c.Suggested_Address_Header';
        import AddressWeSuggestHeader from '@salesforce/label/c.Address_We_Suggest_Header';
        import revertWithOldValue from '@salesforce/apex/LeadAddressBookGeoValidateController.revertWithOldValue';
        import { refreshApex } from '@salesforce/apex';

        const fields = [ADDRESSVERIFIED, LEADADDRESS];
        export default class leadAddressVerificationComponent extends LightningElement {
            @track isLoading = false;
            @track isModalOpen;
            @api recordId;
            @track visible
            @track responseGoogle = []
            @track responseGoogleList = []
            @track street;
            @track country;
            @track state;
            @track city
            @track pincode
            @track leadId
            @track addressVerified
            @track quoteVerified
            @track address
            @track fullStreet
            @track IncompleteAddress
            @track currentAddress
            @track suggestedAddress
            @track SuggestAddressValid
            @track addressDetails = []
            @track relatedQuoteList = []
            @track relatedQuoteExist;
            @track LeadAddress


            label = {
                CurrentAddressHeader,
                NoPartialMatchHeader,
                PartialMatchHeader,
                SuggestedAddressHeader,
                AddressWeSuggestHeader

            };

            connectedCallback() {
                console.log('I am in leadAddressVerificationComponent');
                //this.isModalOpen = true;
            }
            @wire(getRecord, {
                recordId: '$recordId',
                fields: fields
            }) verfiedstatus({
                error,
                data
            }) {
                if (error) {
                    console.log('I am in leadAddressVerificationComponent wire error');
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error loading Account Address',
                            message: error.body.message,
                            variant: 'error',
                        })
                    );
                } else if (data) {
                    console.log('I am in leadAddressVerificationComponent wire data');
                    console.log('data.fields', JSON.stringify(data.fields));
                    this.addressVerified = data.fields.Address_Verified__c.value;
                    this.LeadAddress = data.fields.Address_Key__c.value;

                    if (this.LeadAddress != null && this.addressVerified != null && this.addressVerified.includes('No')) {
                        //c/accountAddressBookGeoCodeValidationrefreshApex();

                        getLeadAddressDetails({ recordId: this.recordId }) // burdan donen data ya bakmaklazım ????
                            .then(data => {
                                console.log('getLeadAddressDetails data', JSON.stringify(data));
                                this.addressDetails = data;
                                this.error = undefined;
                                console.log('addressDetails', this.addressDetails.City);
                                this.street = this.addressDetails.street;
                                this.state = this.addressDetails.state;
                                this.pincode = this.addressDetails.postalCode; 
                                this.city = this.addressDetails.City;
                                this.country = this.addressDetails.Country;
                                this.addressVerified = this.addressDetails.addressVerified; // kontrol et custom fıeld mı?

                                console.log(' this.street' + this.street);
                                // if address verified is no and 
                                //if Fields are Missing
                                console.log('addressVerified',this.addressVerified + '***');
                                if (this.addressVerified != null && this.addressVerified.includes('Yes')) {
                                    console.log(this.addressVerified + '***');
                                    if (this.street == null || this.city == null | this.state == null || this.pincode == null || this.country == null) { 
                                        // or ısaretı cıft olmalı cıty den sonra ??????????
                                        this.currentAddress = (this.street == undefined ? '' : this.street) + (this.city == undefined ? '' : ',' + this.city) + (this.state == undefined ? '' : ',' + this.state) + (this.pincode == undefined ? '' : ',' + this.pincode) + (this.country == undefined ? '' : ',' + this.country);
                                        console.log('I am blank' + this.street);
                                        this.IncompleteAddress = true; // 
                                        this.relatedQuoteExist = false;  // bu na ıhtıyac yok gıbı
                                        this.isModalOpen = true; // true????
                                    }
                                }


                                //If is not verified
                                if (this.addressVerified != null && this.addressVerified.includes('No')) {

                                    this.IncompleteAddress = false;
                                    this.relatedQuoteExist = false; // ıhtıyac yok gıbı
                                    this.SuggestAddressValid = false;
                                    this.suggestedAddress = null;
                                    console.log(this.street + 'Street');
                                    console.log(this.state);
                                    if (this.street != null) {

                                    }
                                    verifyaddress({
                                        street: this.street,
                                        city: this.city,
                                        state: this.state,
                                        pincode: this.pincode,
                                        country: this.country


                                    })
                                        .then(result => {
                                            console.log('verifyaddress result', result)
                                            this.responseGoogle = result;
                                            //current address
                                            console.log(this.street)
                                            this.currentAddress = (this.street == undefined ? '' : this.street) + (this.city == undefined ? '' : ',' + this.city) + (this.state == undefined ? '' : ',' + this.state) + (this.pincode == undefined ? '' : ',' + this.pincode) + (this.country == undefined ? '' : ',' + this.country);
                                            //console.log('Google', this.responseGoogle.partialMatch)
                                            console.log('Google', this.responseGoogle)
                                            console.log('this.currentAddress' + this.currentAddress)
                                            //Suggested Address
                                            if ((this.responseGoogle.streetNumber != undefined || this.responseGoogle.streetName != undefined) && this.responseGoogle.city != undefined && this.responseGoogle.state != undefined && this.responseGoogle.pincode != undefined && this.responseGoogle.country != undefined) {
                                                this.suggestedAddress = (this.responseGoogle.streetNumber == undefined ? '' : this.responseGoogle.streetNumber) + ' ' + (this.responseGoogle.streetName == undefined ? '' : this.responseGoogle.streetName) + ',' + this.responseGoogle.city + ',' + this.responseGoogle.state + ',' + this.responseGoogle.pincode + ',' + this.responseGoogle.country;
                                                console.log(this.suggestedAddress + 'this.suggestedAddress'); // yukarda vırgul bırıncıden sonra olmalı mıkontrol et?? __ bırde buyuk kucuk harfe dıkkat et
                                                this.SuggestAddressValid = true;
                                            }

                                            this.isModalOpen = true; 

                                        })
                                        .catch(error => {
                                            console.log('error', error)
                                        });

                                }




                            })

                            .catch(error => {
                                console.log('In getLeadAddressDetails error');
                                this.error = error;
                            });


                    }
                }
            }



            //update the verified field
            verified() {
                console.log('I am inside of verified method' + this.recordId)
                this.isModalOpen = false;
                this.handleIsLoading(true);
                updateVerifiedCheckBox({
                    recordId: this.recordId
                })
                    .then((result) => {
                        console.log('result', result)

                        if (JSON.stringify(result).includes('Sucessfully')) {
                            console.log('result9999', result)
                            this.showToast('Success', 'Address is Successfully Verified', 'success', 'dismissable')

                        }

                        console.log(this.addressVerified + '**')
                        this.updateRecordView();

                    })
                    .catch((error) => {
                        console.log('error', error)
                        this.showToast('Error', error, 'error', 'dismissable')

                    })
                    .finally(() => {
                        console.log('Inside This call')
                        this.handleIsLoading(false);
                    });

            }

            // update address with address provided by google
            updateAddress() {
                console.log('needs to update', this.responseGoogle.city);
                // console.log('  this.responseGoogle.streetNumber'+  this.responseGoogle.streetNumber)
                // console.log('  this.responseGoogle.streetName'+  this.responseGoogle.streetName)

                this.fullStreet = this.responseGoogle.streetNumber == undefined ? "" : this.responseGoogle.streetNumber;
                this.fullStreet += this.responseGoogle.streetName == undefined ? "" : ' ' + this.responseGoogle.streetName;
                console.log('  this.fullStreet' + this.fullStreet)
                // 
                this.isModalOpen = false; 
                this.handleIsLoading(true);

                updateShippingAddress({
                    recordId: this.recordId,
                    street: this.fullStreet,
                    city: this.responseGoogle.city,
                    state: this.responseGoogle.state,
                    pincode: this.responseGoogle.pincode,
                    country: this.responseGoogle.country
                }).then((result) => {
                    console.log('result', result)
                    console.log('success verify11')
                    if (JSON.stringify(result).includes('Sucessfully')) {
                        console.log('success verify88888')
                        this.showToast('Success', 'Address is Successfully Verified', 'success', 'dismissable')

                    }

                    this.updateRecordView();
                })
                    .catch((error) => {
                        console.log('Inside error')
                        this.showToast('Error', error, 'error', 'dismissable')

                        console.log('error', error)
                    })
                    .finally(() => {
                        console.log('Inside This call')
                        this.handleIsLoading(false);
                    });

            }

            // used to show tost
            showToast(title, message, variant, mode) {
                const event = new ShowToastEvent({
                    title: title,
                    message: message,
                    variant: variant,
                    mode: mode
                });
                this.dispatchEvent(event);
            }

            //update the accpo
            revertWithOldValue() {
                this.isLoading = true;
                revertWithOldValue({
                    leadId: this.recordId
                }).then((result) => {
                    console.log(result);
                    this.isModalOpen = false;
                    this.isLoading = false;
                    this.updateRecordView();
                    this.showToast('Success', 'Address is not update', 'success', 'dismissable')

                })
                    .catch((error) => {
                        console.log(error);
                        this.showToast('Error', error, 'error', 'dismissable')
                    });



            }

            // to close the modal
            closeModal() {

                this.isModalOpen = false;
            }
            //show/hide spinner
            handleIsLoading(isLoading) {
                this.isLoading = isLoading;
            }

            // to update the view of page 
            updateRecordView() {
                setTimeout(() => {
                    eval("$A.get('e.force:refreshView').fire();");
                }, 1000);
            }

        } */
    }

    // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LWC @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LWC @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    public void lead_Controler(){

        /*
        public with sharing class LeadAddressBookGeoValidateController {
            public static Boolean updateAddress=false;
            public static Boolean revertOldValue=false;
        
            //verify the address by google Api
            @auraEnabled(cacheable=true)
            public static GoogleApiResponseWrapper check(String street,String city,String state,String pincode,String country){
                GoogleApiResponseWrapper response=new GoogleApiResponseWrapper();
                system.debug('street'+street);
                if(street!=null){
                    HTTPResponse res =FC_GoogleMapsAPI.calloutToValidateAddressFromAPI(street, city, state, pincode, country);
                    //http.send(req);
                    if(res!=null){
                    system.debug('res'+res.getBody());
                    Map<String, Object> result = (   Map<String, Object>)JSON.deserializeUntyped(res.getBody()); 
                    system.debug(result);
                    for(String aa:result.keyset()){
                        system.debug('Key--->'+aa);
                        system.debug('value--->'+result.get(aa));
                    }
                    List<Map<String, Object>> data = new List<Map<String, Object>>();
                    map<String, Object> address=new map<String, Object>();
                    for (Object instance : (List<Object>)result.get('results')){
                        
                        if(instance.toString().contains('address_components')){
                            address=(map<String, Object>)instance;
                            system.debug('address***'+address);
                        }
                    }
                    
                    List<Object> addressComponentList=new List<Object>();
                    system.debug(result.get('results'));
                    system.debug(data);
                    
                    for(String addresskey:address.keyset()){
                        
                        
                        if(addresskey.contains('partial_match')){
                            response.partialMatch = true;
                        }
                        if(addresskey.contains('address_components')){
                            system.debug('inside address_components'+address.get('address_components'));
                            addressComponentList=(List<Object>)address.get('address_components');
                            
                            system.debug('ob***'+addressComponentList);
                            
                        }
                    
                        
                    }
                    system.debug('Size'+addressComponentList.size());
                    Map<String, Object>  addressComponentMap=new    Map<String, Object>();
                    List<object> types=new   List<object>();
                    for(Object component:addressComponentList){
                        addressComponentMap=( Map<String, Object>)component;
                        system.debug(addressComponentMap.get('types'));
                        types=(List<object>)addressComponentMap.get('types');
                        system.debug(types[0]);
                        if(types[0]=='street_number'){
                            response.streetNumber=(String)addressComponentMap.get('short_name');
                        }
                        else if(types[0]=='route'){
                            response.streetName=(String)addressComponentMap.get('short_name');
                        }
                        else if(types[0]=='locality'){
                            response.city=(String)addressComponentMap.get('short_name');
                        }
                    // else if(types[0]=='administrative_area_level_1' &&((String)addressComponentMap.get('short_name')).length() ==3){
                        else if(types[0]=='administrative_area_level_1'){
                                response.state=(String)addressComponentMap.get('short_name');
                            
                        }
                        //else if(types[0]=='administrative_area_level_2' && response.state==null){
                        //  response.state=(String)addressComponentMap.get('short_name');
                    //  }
                        
                        else if(types[0]=='country'){
                            response.country=(String)addressComponentMap.get('short_name');
                            if (response.country == 'CA') {
                                 //response.country = 'CAN';
                            }
                        }
                        else if(types[0]=='postal_code'){
                            response.pincode=(String)addressComponentMap.get('short_name');
                        }
                        
                    }
                    
                    
                    response.formattedAddress=address.get('formatted_address').toString();
                    system.debug(address.keyset());
                    
                    system.debug('response'+response);
                    return response;
                    
                    } 
                    else{
                        return null;
                    }
                }
            return null ;
            }
        
            @AuraEnabled
            public static LeadAddressBook getLeadAddressDetails(String recordId){
                system.debug('Im in!');
                system.debug('recordId'+recordId);
                LeadAddressBook leadAddress;
                try {
                    Lead leadRecord = [select id,Address, Address_Verified__c from Lead where id =:recordId];
                    leadAddress = setLeadAddressBook(leadRecord.Address.getCity(), leadRecord.Address.getCountry(),leadRecord.Address.getGeocodeAccuracy(),leadRecord.Address.getLatitude(),leadRecord.Address.getLongitude(),leadRecord.Address.getPostalCode(),leadRecord.Address.getState(),leadRecord.Address.getStreet(),leadRecord.Address.getStateCode(),leadRecord.Address.getCountryCode(), leadRecord.Address_Verified__c);
                    
                } catch (Exception e) {
                    system.debug('Error Message'+e.getMessage());
                    return null;
                    //throw new AuraHandledException(e.getMessage());
                }
                system.debug('leadAddress'+leadAddress);
                return leadAddress;
            }
            
            public static LeadAddressBook setLeadAddressBook(String City, String Country,String geocodeAccuracy,Double latitude,Double longitude,String postalCode,String state,String street,String stateCode,String countryCode, String addressVerified)    
            {
                
                LeadAddressBook leadAddressBook = new  LeadAddressBook();
                leadAddressBook.City = City;
                leadAddressBook.Country = Country;
                leadAddressBook.geocodeAccuracy = geocodeAccuracy;
                leadAddressBook.latitude = latitude;
                leadAddressBook.longitude = longitude;
                leadAddressBook.postalCode = postalCode;
                leadAddressBook.state = state;
                leadAddressBook.street = street;
                leadAddressBook.stateCode = stateCode;
                leadAddressBook.countryCode = countryCode;
                leadAddressBook.addressVerified = addressVerified;
                
                return LeadAddressBook;
            }
        
        
            @auraEnabled
            Public static String updateVerifiedCheckBox(String recordId){
                Lead leadRecord = new Lead();
                leadRecord.Address_Verified__c='Yes';
                leadRecord.Id=recordId;
                
                try{
                    update leadRecord;
                    system.debug('updateVerifiedCheckBox'+leadRecord);
                }catch(Exception ex){
                    System.debug(ex.getmessage());
                    return ex.getmessage();
                }
                return 'Sucessfully Verified';
            }
        
            @AuraEnabled
            Public static String updateAddress(String recordId,String street,String city,String state,String pincode,String country){
                updateAddress=true;
            
                system.debug(street+'street');
                system.debug(street+'state');
                system.debug(street+'country');
                
                Lead leadRecord = new Lead();
                leadRecord.Address_Verified__c='Yes';
                leadRecord.Id=recordId;
                leadRecord.street = street;
                leadRecord.City = city;
                leadRecord.State = state;
                leadRecord.PostalCode = pincode;
                leadRecord.Country = country;
                
                
                try{
                    update leadRecord;
                    system.debug('updateVerifiedCheckBox'+leadRecord);
                    
                }catch(Exception ex){
                    System.debug(ex.getmessage());
                    return ex.getmessage();
                }
                
                system.debug('updateAddress'+updateAddress);
                return 'Sucessfully Updated';
                
            }
        
            @AuraEnabled
            public static String revertWithOldValue( String leadId){
                Lead leadRecord = [select id, address from Lead where id=:leadId];
                Lead leadRecordInstance =new Lead();
                leadRecordInstance.city = leadRecord.address.getCity();
                leadRecordInstance.PostalCode = leadRecord.address.getPostalCode();
                leadRecordInstance.country = leadRecord.address.getCountry(); 
                leadRecordInstance.state = leadRecord.address.getState();
                leadRecordInstance.street = leadRecord.address.getStreet();
                leadRecordInstance.id = leadId;
                leadRecordInstance.Address_Verified__c='No';
                try{
                    system.debug('leadRecordInstance'+leadRecordInstance);
                    revertOldValue=true;
                    update leadRecordInstance;
                
                    return 'Successfully Updated';
                }
                catch(Exception ex){
                    return ex.getMessage();
                }
            }
        }
        */
    }

    // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LWC @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LWC @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    public void convert_for_LWC(){

        /*

        public class LeadAddressBook {
            @AuraEnabled public String City{get;set;}
            @AuraEnabled public String Country{get;set;}
            @AuraEnabled public String geocodeAccuracy{get;set;}
            @AuraEnabled public Double latitude{get;set;}
            @AuraEnabled public Double longitude{get;set;}
            @AuraEnabled public String postalCode{get;set;}
            @AuraEnabled public String state{get;set;}
            @AuraEnabled public String street{get;set;}
            @AuraEnabled public String stateCode{get;set;}
            @AuraEnabled public String countryCode{get;set;}
            @AuraEnabled public String addressVerified{get;set;}
        }
        */

    }

    public void lead_Geo_Controler(){

        /*

        
        // @Author : Rawinder Kaur
        // @Description: This class is Used to validate address
        // @createdate: 12-19-2022
        

    public with sharing class AddressBookGeoValidateController {
    
        public static Boolean updateAddress=false;
        public static Boolean verifiedQuote=false;
        public static Boolean revertOldValue=false;
        
        @AuraEnabled
        public static Account_Address_Book__c getAccountAddressDetails(String recordId){
            Account_Address_Book__c addressBookDetail;
            
            try {
                    addressBookDetail=[select id,Address_CountryCodes,AddressStreets,AddressCity_s,
                Address_PostalCodes,AddressStateCodes,Address_Verifiedc from account_address_book_c where id =:recordId];
            } catch (Exception e) {
                system.debug('Error Message'+e.getMessage());
                return null;
                //throw new AuraHandledException(e.getMessage());
            }
            return addressBookDetail;
        }
        
        @auraEnabled
        Public static String updateVerifiedCheckBox(String recordId){
            Account_Address_Book_c address=new Account_Address_Book_c();
            address.Address_Verified__c='Yes';
            address.Id=recordId;
            
            try{
                update address;
                system.debug('updateVerifiedCheckBox'+address);
            }catch(Exception ex){
                System.debug(ex.getmessage());
                return ex.getmessage();
            }
            
            
            return 'Sucessfully Verified';
            
        }
        @AuraEnabled
        public static String updateAddressForRelatedQuote(String accountAddressId){
            List<Order> orderNeedsToUpdate=new List<Order>();
            try {
            
                //Account Address Update
                Account_Address_Book_c quoteVerified=new Account_Address_Book_c();
                quoteVerified.id=accountAddressId;
                quoteVerified.Address_verified__c='No';
                quoteVerified.relatedQuoteVerified__c='Yes';
                update quoteVerified;
                system.debug('quoteVerified'+quoteVerified);
                
            } catch (Exception e) {
                return e.getMessage();
            }
            return 'Success';
        }
        
        @AuraEnabled
        Public static String updateAddress(String recordId,String street,String city,String state,String pincode,String country){
            updateAddress=true;
        
            system.debug(street+'street');
            
            Account_Address_Book_c address=new Account_Address_Book_c();
            address.Address_Verified__c='Yes';
            address.Id=recordId;
            address.Address_Street_s= street;
            address.Address_City_s=city;
            address.Address_StateCode_s=state;
            address.Address_PostalCode_s=pincode;
            address.Address_CountryCode_s=country;
            
            
            try{
                update address;
                system.debug('updateVerifiedCheckBox'+address);
                
            }catch(Exception ex){
                System.debug(ex.getmessage());
                return ex.getmessage();
            }
            
            system.debug('updateAddress'+updateAddress);
            return 'Sucessfully Updated';
            
        }
        //verify the address by google Api
        @auraEnabled(cacheable=true)
        public static GoogleApiResponseWrapper check(String street,String city,String state,String pincode,String country){
            GoogleApiResponseWrapper response=new GoogleApiResponseWrapper();
            system.debug('street'+street);
            if(street!=null){
                HTTPResponse res =FC_GoogleMapsAPI.calloutToValidateAddressFromAPI(street, city, state, pincode, country);
                //http.send(req);
                if(res!=null){
                system.debug('res'+res.getBody());
                Map<String, Object> result = (   Map<String, Object>)JSON.deserializeUntyped(res.getBody()); 
                system.debug(result);
                for(String aa:result.keyset()){
                    system.debug('Key--->'+aa);
                    system.debug('value--->'+result.get(aa));
                }
                List<Map<String, Object>> data = new List<Map<String, Object>>();
                map<String, Object> address=new map<String, Object>();
                for (Object instance : (List<Object>)result.get('results')){
                    
                    if(instance.toString().contains('address_components')){
                        address=(map<String, Object>)instance;
                        system.debug('address***'+address);
                    }
                }
                
                List<Object> addressComponentList=new List<Object>();
                system.debug(result.get('results'));
                system.debug(data);
                
                for(String addresskey:address.keyset()){
                    
                    
                    if(addresskey.contains('partial_match')){
                        response.partialMatch = true;
                    }
                    if(addresskey.contains('address_components')){
                        system.debug('inside address_components'+address.get('address_components'));
                        addressComponentList=(List<Object>)address.get('address_components');
                        
                        system.debug('ob***'+addressComponentList);
                        
                    }
                
                    
                }
                system.debug('Size'+addressComponentList.size());
                Map<String, Object>  addressComponentMap=new    Map<String, Object>();
                List<object> types=new   List<object>();
                for(Object component:addressComponentList){
                    addressComponentMap=( Map<String, Object>)component;
                    system.debug(addressComponentMap.get('types'));
                    types=(List<object>)addressComponentMap.get('types');
                    system.debug(types[0]);
                    if(types[0]=='street_number'){
                        response.streetNumber=(String)addressComponentMap.get('short_name');
                    }
                    else if(types[0]=='route'){
                        response.streetName=(String)addressComponentMap.get('short_name');
                    }
                    else if(types[0]=='locality'){
                        response.city=(String)addressComponentMap.get('short_name');
                    }
                // else if(types[0]=='administrative_area_level_1' &&((String)addressComponentMap.get('short_name')).length() ==3){
                    else if(types[0]=='administrative_area_level_1'){
                            response.state=(String)addressComponentMap.get('short_name');
                        
                    }
                    //else if(types[0]=='administrative_area_level_2' && response.state==null){
                    //  response.state=(String)addressComponentMap.get('short_name');
                //  }
                    
                    else if(types[0]=='country'){
                        response.country=(String)addressComponentMap.get('short_name');
                    }
                    else if(types[0]=='postal_code'){
                        response.pincode=(String)addressComponentMap.get('short_name');
                    }
                    
                }
                
                
                response.formattedAddress=address.get('formatted_address').toString();
                system.debug(address.keyset());
                
                system.debug('response'+response);
                return response;
                
                } 
                else{
                    return null;
                }
            }
        return null ;
        }
        
        //get related quote
        @AuraEnabled
        public static  List<String> checkRelatedQuotes(String accountId,String  accountaddressBookId,String LocationId ){
            Set<String> quoteNumberSet=new Set<String>();
            List<String> relatedQuoteList=new  List<String>();
            Map<String,Integer> relatedQuoteOrderCountMap=new  Map<String,Integer>();
            List<DealHub_DealHub_Quote_Answerc> dealhubQuoteAnswerList=[select Id, DealHubQuestion_Valuec, DealHubSystem_Namec,DealHubQuoter.Dealhub_Status_c ,dealhub__quote__r.Account.id,DealHub_Quoter.Quote_Numberc from DealHubDealHub_Quote_Answerc  where DealHubQuestion_IDc = 'Address_Information.Account_Address_BookcId' and DealHubQuoter.Dealhub_Status_c not in (null,'REJECTED','ARCHIVED') and dealhub__quote__r.Account.id =:accountId  ];
        for(DealHub_DealHub_Quote_Answer_c quoteAnswer :dealhubQuoteAnswerList){
            
            if(quoteAnswer.DealHub_Question_Value_c==accountaddressBookId){
                system.debug('** i am using'+quoteAnswer.DealHub_Quoter.Quote_Number_c);
                quoteNumberSet.add(String.valueOf(quoteAnswer.DealHub_Quoter.Quote_Number_c));
            
                
            }
            
        }
        system.debug('quoteNumberSet'+quoteNumberSet);
        if(quoteNumberSet.size()>0){
            AggregateResult[] groupedResults=[SELECT count(id),Quote.quote_number_c number from order where  Quote.quote_numberc in :quoteNumberSet and location_idC = :LocationId and status='Draft' group by Quote.quote_number_C];
            for (AggregateResult ar : groupedResults)  {
                System.debug('Quote.quote_number__c' + ar.get('number'));
                System.debug('Count' + ar.get('expr0'));
                relatedQuoteOrderCountMap.put(String.valueOf(ar.get('number')),Integer.valueOf(ar.get('expr0')));
            }
            system.debug('relatedQuoteOrderCountMap****'+relatedQuoteOrderCountMap);
            if(relatedQuoteOrderCountMap.size()>0){
                for(String quoteNumber:quoteNumberSet){
                    if(relatedQuoteOrderCountMap.keySet().contains(quoteNumber) && relatedQuoteOrderCountMap.get(quoteNumber)!=null){
                        relatedQuoteList.add(quoteNumber);
                    }
                }
            
            }
        
        }
        if (relatedQuoteList.size()==0){
            Account_Address_Book_c add=new Account_Address_Book_c();
            add.id=accountaddressBookId;
            add.Address_Verified__c='No';
            add.relatedQuoteVerified__c='YES';
            update add;
            return null;
        }
        return relatedQuoteList;
        }
        @AuraEnabled
        public static String revertWithOldValue( String accountAddressBookId){
            Account_Address_Book_c address=[select id, cityc,State_Province_Code_c,
            Country_Code_c,ZIP_Postal_Codec,streetc from Account_Address_Book_c where id=:accountAddressBookId];
            Account_Address_Book_c add=new Account_Address_Book_c();
            add.Address_citys=address.city_c;
            add.Address_PostalCodes=address.ZIP_Postal_Code_c;
            add.Address_CountryCodes=address.Country_Code_c;
            add.Address_StateCodes =address.State_Province_Code_c;
            add.Address_Streets=address.street_c;
            add.id=accountaddressBookId;
            add.Address_Verified__c='No';
            add.relatedQuoteVerified__c='YES';
            try{
                system.debug('address'+add);
                revertOldValue=true;
                update add;
            
                return 'Successfully Updated';
            }
            catch(Exception ex){
                return ex.getMessage();
            }
        
        
            
        }
        
        
        
        }
        */
    }

    public void HTML_Lead(){

        /*
        
        <template>
            <!-- loader -->
            <div if:true={isLoading}>
                <lightning-spinner alternative-text="Loading..." variant="brand" class="slds-is-fixed">
                </lightning-spinner>
            </div>


            <!-- /loader -->
            <template if:true={isModalOpen}>
                <!-- Modal/Popup Box LWC starts here -->
                <section role="dialog" tabindex="-1" aria-labelledby="modal-heading-01" aria-modal="true"
                    aria-describedby="modal-content-id-1" class="slds-modal slds-fade-in-open">
                    <div class="slds-modal__container">
                        <!-- Modal/Popup Box LWC header here -->
                        <header class="slds-modal__header">
                            <h2 id="modal-heading-01" class="slds-text-heading_medium slds-hyphenate">Address validation </h2>
                        </header>
                        <!-- Modal/Popup Box LWC body starts here -->
                        <div class="slds-modal__content slds-p-around_medium" id="modal-content-id-1">
                            <div class="slds-grid slds-wrap slds-m-around_medium">
                                <!--IF Address is Incomplete-->
                                <template if:true={IncompleteAddress}>
                                    <div class="slds-col slds-size_12-of-12 ">
                                        <b>{label.PartialMatchHeader} </b><br />
                                        <div class="slds-col slds-size_12-of-12  slds-m-top_large">
                                            <div>
                                                <b>{label.CurrentAddressHeader}</b><br /><br />
                                                {currentAddress}
                                            </div>
                                            <div class="slds-align_absolute-center slds-m-top_large">
                                                <lightning-button variant="brand" label="GO BACK TO EDIT" onclick={closeModal} title="Not Confirmed" class="slds-m-around_medium"> </lightning-button>
                                            </div>
                                        </div>
                                    </div>
                                </template>
                                <!--End Of incorrect address-->Lead 
                                                                                <!-- ????******************************************* -->
                                <!--if address is complete -->
                                <template if:false={IncompleteAddress}>
                                    <!--Display Content If Address is correct-->
                                    <template if:false={responseGoogle.partialMatch}>
                                        <b> {label.NoPartialMatchHeader}</b>
                                        <div class="slds-col slds-size_12-of-12  slds-m-top_large">
                                            <b>{label.CurrentAddressHeader}</b><br /><br />
                                                {currentAddress}
                                            <div class="slds-align_absolute-center slds-m-top_large">
                                                <lightning-button variant="brand" label="USE THIS ADDRESS" onclick={verified} title="Confirm the Address" class="slds-m-around_medium"></lightning-button>
                                                <lightning-button variant="brand" label="GO BACK TO EDIT" onclick={closeModal} title="Not Confirmed" class="slds-m-around_medium"></lightning-button>
                                            </div>
                                        </div>
                                    </template>
                                </template>
                                <!--End of Display Content If Address is correct-->
                                <!--Display Content If Address is partial match-->
                                <template if:true={responseGoogle.partialMatch}>
                                    <div class="slds-col slds-size_12-of-12 ">
                                        <template if:true={SuggestAddressValid}>
                                            <div class="slds-col slds-size_12-of-12  ">
                                                <b>{label.SuggestedAddressHeader}</b>
                                                <div class="slds-col slds-size_12-of-12 slds-m-top_large ">
                                                    <b> {label.AddressWeSuggestHeader}</b> <br /> <br />
                                                    {suggestedAddress}
                                                    <div class="slds-align_absolute-center slds-m-top_large">
                                                        <lightning-button variant="brand" label="ACCEPT SUGGESTION" onclick={updateAddress} class="slds-align_absolute-center slds-m-around_medium "> </lightning-button>
                                                    </div>
                                                </div>
                                            </div>
                                        </template>
                                        <div class="slds-m-top_large">
                                            <b>{label.PartialMatchHeader} </b><br />
                                            <div class="slds-col slds-size_12-of-12  slds-m-top_large">
                                                <b>{label.CurrentAddressHeader}</b><br /><br />
                                                {currentAddress}
                                                <div class="slds-align_absolute-center slds-m-top_large">
                                                    <lightning-button variant="brand" label="USE THIS ADDRESS" onclick={verified} title="Confirm the Address" class="slds-m-around_medium"></lightning-button>
                                                    <lightning-button variant="brand" label="GO BACK TO EDIT" onclick={closeModal} title="Not Confirmed" class="slds-m-around_medium"> </lightning-button>
                                                </div>
                                            </div>
                                                            <!-- <div> Bu satır fazla gıbı duruyor ???*******************************************-->
                                        </div>
                                    </div>
                                    <!-- </div>      bu satırda fazla gıbı ???*******************************************-->
                                </template>
                                    <!--Display end -of Content If Address is partial match -->
                            </div>
                        </div>
                    </div>
                </section>
                <div class="slds-backdrop slds-backdrop_open"></div>
            </template>
        </template>

        */
    }

    public void GOOGLE_API(){

        
        //  * Google places api integration
        //  * @author Bryan Wong,Rawinder kaur
        //  * @since December 13th, 2021
        //  * @group GoogleMapsAPI
        //  * @group-content /GoogleMapsAPI/FC_GoogleMapsAPI.html

        /*
        
        public without sharing class FC_GoogleMapsAPI
        {
            private class GoogleMapsAPIException extends Exception {}
            private static FC_Google_Maps_Selector googleMapsAPI; 

            
            //  * Get Google Maps API record
            //  * @return  List<FC_Google_Maps_API__mdt> List of gogole maps api records
            
            private static List<FC_Google_Maps_API__mdt> getAPIKey()
            {
                if (googleMapsAPI == null)
                {
                    googleMapsAPI = new FC_Google_Maps_Selector();
                }
                return googleMapsAPI.selectLatest();
            }

            
            //  * Generates a formatted address string
            //  * @param street  street of location
            //  * @param city  city of location
            //  * @param state  state or province of location
            //  * @param postalCode  postal code of location
            //  * @param country  country of location
            //  * @return  String  formatted address string
            
            private static String getFormattedAddress(String street, String city, String state, String postalCode, String country)
            {
                String address = '';
                address += street != null ? street + ',' : '';
                address += city != null ? city + ',' : '';
                address += state != null ? state + ',' : '';
                address += postalCode != null ? postalCode + ',' : '';
                address += country != null ? country : '';

                return address;
            }

            
            //  * Generates a formatted address string for only the state
            //  * @param city  city of location
            //  * @param state  state or province of location
            //  * @param postalCode  postal code of location
            //  * @param country  country of location
            //  * @return  String  formatted address string
            
            private static String getStateAddress(String city, String state, String postalCode, String country)
            {
                String address = '';
                address += city != null ? city + ',' : '';
                address += state != null ? state + ',' : '';
                address += postalCode != null ? postalCode + ',' : '';
                address += country != null ? country : '';

                return address;
            }

            
            //  * Makes a HTTP callout to google maps api and receives response
            //  * @param url              url to make the callout
            //  * @return  HTTPResponse http response
            
            private static HTTPResponse fetchResponse(String url){
                HttpRequest req = new HttpRequest();
                Http http = new Http();

                req.setMethod('GET');            
                req.setEndPoint(url.replace(' ', '%20'));
                req.setTimeout(5000);
                    system.debug('req'+req);
                HTTPResponse res = http.send(req);
                system.debug('res'+res);
                return res;
            }

            
            //  * Make a callout to the find place from text service to get place id
            //  * @param string  formatted address
            //  * @return  HttpResponse http response from callout
            
            @TestVisible
            private static HttpResponse calloutToFindPlaceFromTextAPI(String address)
            {
                try {
                    // Check if address is empty
                    if (address == '') { throw new GoogleMapsAPIException(FC_ConstantsClass.FC_GOOGLEMAPSAPI_PLACE_ERROR_THREE); }

                    // Get API key
                    String key = getAPIKey()[0].Key__c;

                    // Base url
                    String url = FC_ConstantsClass.FC_GOOGLEMAPSAPI_FIND_PLACE_FROM_TEXT_BASE_URL;
                    url += address + FC_ConstantsClass.FC_GOOGLEMAPSAPI_INPUT_TYPE_TEXT + FC_ConstantsClass.FC_GOOGLEMAPSAPI_API_KEY_START + key;

                    EncodingUtil.urlEncode(url, 'UTF-8');
                    HTTPResponse resFindPlaceFromtext = fetchResponse(url);

                    return resFindPlaceFromtext;
                } 
                catch (Exception e) 
                {
                    UTIL_Logging.ExceptionLog exLog = new UTIL_Logging.ExceptionLog(e, 'FC_GoogleMapsAPI', 'calloutToFindPlaceFromTextAPI', '', UTIL_Logging.DEBUG_LEVEL_ERROR);
                    UTIL_Logging.logException(exLog);
                    return null;
                }
            }
            
            
            //  * Make callout to get Address Response
            //  * @param placeId  id of place from callout
            //  * @return  HttpResponse http response from callout to place details
            
            public static HttpResponse calloutToValidateAddressFromAPI(String street, String city, String state, String postalCode, String country)
            {	
       
        
            String address=getFormattedAddress(street,  city,  state,  postalCode,  country);
        // 'https://maps.googleapis.com/maps/api/geocode/json?address='+street+','+pincode+','+ state+','+pincode+','+ country+'&inputtype=textquery&fields=geometry&key=AIzaSyBvn6KRW-4ldt5AI6F_S-B92XglehqpPkU';
            try {
                // Check if address is empty
                if (address == '') { throw new GoogleMapsAPIException(FC_ConstantsClass.FC_GOOGLEMAPSAPI_PLACE_ERROR_THREE); }

                // Get API key
                String key = getAPIKey()[0].Key__c;
                //hotfix 
                //  street = street.replace('\r\n', ' ');
                //  street = street.replace('\n', ' ');
                //  street = street.replace('\r', ' ');
            
                //using this string because sometime state is blank by goggle OOO functionality to get result as partial match
                String validateAddress=street+','+city+','+state+','+ postalCode+','+country;
                //hotfix
                validateAddress=EncodingUtil.urlEncode(validateAddress,'UTF-8');
                // Base url
                String url = FC_ConstantsClass.FC_GOOGLEMAPSAPI_ADDRESS_DETAILS_BASE_URL;
                url += validateAddress + FC_ConstantsClass.FC_GOOGLEMAPSAPI_INPUT_TYPE_TEXT +FC_ConstantsClass.FC_GOOGLEMAPSAPI_GEOMETRY_TYPE_TEXT+ FC_ConstantsClass.FC_GOOGLEMAPSAPI_API_KEY_START + key;

                EncodingUtil.urlEncode(url, 'UTF-8');
                HTTPResponse resFindPlaceFromtext = fetchResponse(url);

                return resFindPlaceFromtext;
            } 
            catch (Exception e) 
            {
                UTIL_Logging.ExceptionLog exLog = new UTIL_Logging.ExceptionLog(e, 'FC_GoogleMapsAPI', 'calloutToValidateAddressFromAPI', '', UTIL_Logging.DEBUG_LEVEL_ERROR);
                UTIL_Logging.logException(exLog);
                return null;
            }
        }

        
        //  * Make callout to get place details from place id
        //  * @param placeId  id of place from callout
        //  * @return  HttpResponse http response from callout to place details
        
        @TestVisible
        private static HttpResponse calloutToPlaceDetails(String placeId)
        {
            try 
            {
                // Check if place id is null
                if (placeId == null) { throw new GoogleMapsAPIException(FC_ConstantsClass.FC_GOOGLEMAPSAPI_PLACE_ERROR_FOUR); }

                // Get API key
                String key = getAPIKey()[0].Key__c;

                // base url
                String url = FC_ConstantsClass.FC_GOOGLEMAPSAPI_PLACE_DETAILS_BASE_URL;
                url += placeId + FC_ConstantsClass.FC_GOOGLEMAPSAPI_API_KEY_START + key;

                EncodingUtil.urlEncode(url, 'UTF-8');

                HTTPResponse res = fetchResponse(url);
                system.debug('res2'+res);
                return res;
            } 
            catch (Exception e) 
            {
                UTIL_Logging.ExceptionLog exLog = new UTIL_Logging.ExceptionLog(e, 'FC_GoogleMapsAPI', 'calloutToPlaceDetails', '', UTIL_Logging.DEBUG_LEVEL_ERROR);
                UTIL_Logging.logException(exLog);
                return null;
            }
        }

        
        //  * Get the location through API callouts to google places api
        //  * @param address  formatted address
        //  * @return  Map<String, Object> location map with longitude and latitude
        
                public static Map<String, Object> getGeocodes(String street, String city, String state, String postalCode, String country)
                {
                    try 
                    {
                        String address = getFormattedAddress(street, city, state, postalCode, country);
                        HTTPResponse resFindPlaceFromtext = calloutToFindPlaceFromTextAPI(address);
                        
                        Map<String, Object> jsonFindPlaceFromtext = (Map<String, Object>) JSON.deserializeUntyped(resFindPlaceFromtext.getBody());
                        system.debug('jsonFindPlaceFromtext'+jsonFindPlaceFromtext);
                        List<Object> candidates = (List<Object>) jsonFindPlaceFromtext.get('candidates');
                        system.debug('First candidate'+candidates);
                        // If no candidates found, revert to just state postal code and country and try again.
                        if (candidates.size() == 0) 
                        { 
                            address = getStateAddress(city, state, postalCode, country);
                            resFindPlaceFromtext = calloutToFindPlaceFromTextAPI(address);
                            jsonFindPlaceFromtext = (Map<String, Object>) JSON.deserializeUntyped(resFindPlaceFromtext.getBody());
                            system.debug('jsonFindPlaceFromtext'+jsonFindPlaceFromtext);
                            candidates = (List<Object>) jsonFindPlaceFromtext.get('candidates');
                        system.debug('second candidate'+candidates);
                        }

                        // Throw error after second attempt fails
                        if (candidates.size() == 0)
                        {
                            throw new GoogleMapsAPIException(FC_ConstantsClass.FC_GOOGLEMAPSAPI_PLACE_ERROR_ONE); 
                        }
                        
                        // Get the first candidate id since it's the best match
                        String placeId = (String) ((Map<String, Object>) candidates[0]).get('place_id');
                        HttpResponse resPlaceDetails = calloutToPlaceDetails(placeId);
                        if (resPlaceDetails == null) { throw new GoogleMapsAPIException(FC_ConstantsClass.FC_GOOGLEMAPSAPI_PLACE_ERROR_TWO); }
                        
                        Map<String, Object> jsonPlaceDetails = (Map<String, Object>) JSON.deserializeUntyped(resPlaceDetails.getBody());
                        Map<String, Object> detailsRes = (Map<String, Object>) jsonPlaceDetails.get('result');
                        Map<String, Object> location = (Map<String, Object>) ((Map<String, Object>) detailsRes.get('geometry')).get('location');

                        return location;
                    } 
                    catch (Exception e) 
                    {
                        UTIL_Logging.ExceptionLog exLog = new UTIL_Logging.ExceptionLog(e, 'FC_GoogleMapsAPI', 'getLocation', '', UTIL_Logging.DEBUG_LEVEL_ERROR);
                        UTIL_Logging.logException(exLog);
                        return null;
                    }
                }
            } 
            */
    }
    
}