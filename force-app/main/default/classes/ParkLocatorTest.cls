@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        List<String> response = ParkLocator.country('United States');
        // Verify that a fake result is returned
        List<String> cntryResponse = new List<String>();
        cntryResponse.add('Yellowstone');
        cntryResponse.add('Mackinac National Park');
        cntryResponse.add('Yosemite');
        System.assertEquals(cntryResponse, response); 
    }
}