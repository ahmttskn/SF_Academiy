public with sharing class YouTubeRest {

    // 1- Create Project
    // 2- create credantial
    // 3- Youtube Analytics API - enabled

    // remote site setting 
    // metadata

    //public static String APIKEY = Youtube_Setting_Data__mdt.getInstance('APIKey').Value__c;
    //public static String endPoint = Youtube_Setting_Data__mdt.getInstance('EndPoint').Value__c;

    public static String APIKEY = 'https://youtube.googleapis.com/youtube/v3/videos?';
    public static String endPoint ='AIzaSyAydZxTkfgRRgNgihVrE5DaWhLOZzBBmP8';

    public static void createRecord(String videoName, String videoId) {

        HttpRequest request = new HttpRequest();

        //End Point : https://youtube.googleapis.com/youtube/v3/videos?part=statistics&id=8odBS8ExigE&key=[YOUR_API_KEY]
        
        endPoint += 'part=statistics';
        endPoint += '&id='+videoId;
        endPoint += '&key='+ APIKEY;

        request.setEndpoint(endPoint);
        request.setMethod('GET');

        Http hp = new Http();

        Httpresponse response = hp.send(request);
        System.debug('========' + response);
        String jsonStr = response.getBody();

        if(response.getStatusCode() == 200){
            // YouTubeWrapper ytObj = (YouTubeWrapper) JSON.deserialize(jsonStr, YouTubeWrapper.class);
            // System.debug(ytObj);
            /*

            Youtube_Video_Detail__c record = new Youtube_Video_Detail__c();

            record.Name = videoName;
            record.Video_Id__c = videoId;
            record.Number_of_Like__c = ytObj.items[0].statistics.likeCount;
            record.Number_of_View__c = ytObj.items[0].statistics.viewCount;

            insert record;
            */
        }
    }

    public class YouTubeWrapper{
        public String kind;
        public string etag;
        public List<ItemsWrapper> items;
        public  PageInfoWrapper pageInfo;
    }

    public class ItemsWrapper{
        public String kind;
        public String etag;
        public String id;
        public StatisticsWrapper statistics;
    }

    public class StatisticsWrapper{
        public String viewCount;
        public String likeCount;
        public String favoriteCount;
        public String commentCount;
    }

    public class PageInfoWrapper{
        public Integer totalResults;
        public Integer resultsPerPage;
    }
    /*

    {
        "kind": "youtube#videoListResponse",
        "etag": "VfHlmuqWknCbpU89EqYPl5h4wjI",
        "items": [
            {
                "kind": "youtube#video",
                "etag": "T0xpmxHtU-GrrkQwYLOz4C8EPMQ",
                "id": "8odBS8ExigE",
                "statistics": {
                    "viewCount": "102",
                    "likeCount": "2",
                    "favoriteCount": "0",
                    "commentCount": "0"
                }
            }
        ],
        "pageInfo": {
            "totalResults": 1,
            "resultsPerPage": 1
        }
    }
    */


    /*
        public with sharing class YoutubeGetCallout {
            @future(Callout=true)
            public static void YTCallout(String recordId, String videoId){
                //String videoId = 'smKGMgW5NdM';
                String key = 'ALalLALSALASDLLASLALSLASLALSLA';
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                String endpoint = 'https://www.googleapis.com/youtube/v3/videos?';
                endpoint += 'part=statistics';
                endpoint += '&id=' + videoId;
                endpoint += '&key=' + key;
                req.setEndpoint(endpoint);
                Http http = new Http();
                HttpResponse response = http.send(req);
                if(response.getStatusCode() == 200){
                    YouTubeWrapper youtube = (YouTubeWrapper) JSON.deserialize(response.getBody(), YouTubeWrapper.class);
                    Youtube_Video_Detail__c YTDetail = new Youtube_Video_Detail__c();
                    YTDetail.Id = recordId;
                    //YTDetail.Video_Id__c = videoId;
                    YTDetail.Number_of_View__c = youtube.items[0].statistics.viewCount;
                    YTDetail.Number_of_Like__c = youtube.items[0].statistics.likeCount;
                    update YTDetail;
                }
            }
            @InvocableMethod
            public static void getDetails(List<flowPrams> params){
                YTCallout(params[0].recordId, params[0].videoId);
            }
            public class flowPrams {
                @InvocableVariable public String recordId;
                @InvocableVariable public String videoId;
            }
            public class YouTubeWrapper{
                public String kind;
                public string etag;
                public List<ItemsWrapper> items;
                public PageInfoWrapper pageInfo;
            }
            public class ItemsWrapper{
                public String kind;
                public String etag;
                public String id;
                public StatisticsWrapper statistics;
            }
            public class StatisticsWrapper{
                public String viewCount;
                public String likeCount;
                public String favoriteCount;
                public String commentCount;
            }
            public class PageInfoWrapper{
                public Integer totalResults;
                public Integer resultsPerPage;
            }
        }
        */
        
}