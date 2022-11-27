public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer animalId) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals/' + animalId);
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        HttpResponse res = http.send(req);
        system.debug(res.getBody());
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');
        //system.debug('animal: ' + animal.get('name'));
        return (String)animal.get('name');
    }
}