/**
 * @File Name          : CustomSearchController.cls
 * @Description        : 
 * @Author             : Logkalithiyaa
 * @Group              : 
 * @Last Modified By   : Logkalithiyaa
 * @Last Modified On   : 
 * @Modification Log   : 
**/
public with sharing class CustomSearchController {
    
    @AuraEnabled
    public static String searchRecords(String objName, String fieldName, String searchKey){
        String searchKeyword = searchKey + '*';
        String returningQuery = objName+' ( Id, '+fieldName+')';
        String query = 'FIND :searchKeyword IN ALL FIELDS RETURNING '+returningQuery+' LIMIT 2000';
        List<List<sObject>> sobjectList = Search.query(Query);
        return JSON.serialize(sobjectList);
    }
}