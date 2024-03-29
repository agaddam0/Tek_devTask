public with sharing class OpportunityController {
@AuraEnabled
public static List<Opportunity> getOpportunities() {
List<Opportunity> opportunities =
[SELECT Id, Name, CloseDate FROM Opportunity];
return opportunities;
}
@AuraEnabled
public static Opportunity getOpportunity(Id id) {
Opportunity opportunity = [
SELECT Id, Account.Name, Name, CloseDate,
Owner.Name, Amount, Description, StageName
FROM Opportunity
WHERE Id = :id
];
// Perform isAccessible() check here
return opportunity;
}
}