@isTest
global with sharing class YouTubeRestTestMock implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest request) {

        HttpResponse response = new HttpResponse();

        response.setHeader('Content-Type', 'application/json');

        response.setBody('{"kind": "youtube#videoListResponse", "etag": "VfHlmuqWknCbpU89EqYPl5h4wjI","items": [{"kind": "youtube#video", "etag": "T0xpmxHtU-GrrkQwYLOz4C8EPMQ", "id": "8odBS8ExigE", "statistics": {"viewCount": "102", "likeCount": "2","favoriteCount": "0", "commentCount": "0"} }], "pageInfo": {"totalResults": 1,"resultsPerPage": 1 }}');

        response.setStatusCode(200);
        return response;
        }
}