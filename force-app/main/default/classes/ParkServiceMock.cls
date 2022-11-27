@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        response_x.return_x = new List<String>();
        response_x.return_x.add('Yellowstone');
        response_x.return_x.add('Mackinac National Park');
        response_x.return_x.add('Yosemite');
        // end
        response.put('response_x', response_x); 
   }
}