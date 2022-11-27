public with sharing class ParkLocator {
    public static String[] country(String country) {
        ParkService.ParksImplPort pk = new ParkService.ParksImplPort();
        //system.debug('pk.byCountry(country) : ' + pk.byCountry(country));
        return pk.byCountry(country);
    }
}