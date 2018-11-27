        String firstName = givenName.substringBefore(' ');
        String lastName = givenName.substringAfter(' ');
        System.debug('first: ' + firstName + ' last: ' + lastName);
        
        String s = 'FIND\'' + givenName + '*\'IN ALL FIELDS RETURNING Contact(Id)'; 
        List<List<sObject>> myOutput = search.query(s);
        //Get list of contacts as it's a List of Lists
        List<Contact> outputContacts = myOutput.get(0);
        //Get first Contact - for assumption, you'll search for only 1 result. 
        //In real life, you may need to account for 2 "John Smith's" but we'll not worry about that here
        
        //Get the first contactID of the Contact list as the List is only 1 element (again, no such thing as 2 John Smith's)
        Id ourContactId = outputContacts.get(0).Id; 
        
        System.debug(ourContactId);
        
        return ourContactId;
