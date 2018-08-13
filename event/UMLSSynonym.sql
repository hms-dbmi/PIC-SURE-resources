-- Set the UMLS Synonyms connection string parameters
set @connectionString = IF( IFNULL(@connectionString, '') = '', '{{connectionString}}', @connectionString)

-- Set the username parameter
set @username = IF( IFNULL(@username, '') = '', '{{username}}', @username)

-- Set the password parameter
set @password = IF( IFNULL(@password, '') = '', '{{password}}', @password)

set @umlsSynonymBeforeFindId = (select IF(max(id) is NULL,0, max(id)) from EventConverterImplementation) + 1;

insert into EventConverterImplementation(id, eventListener, name) values(@umlsSynonymBeforeFindId,'edu.harvard.hms.dbmi.bd2k.irct.findtools.event.find.UMLSSynonymBeforeFind','UMLS Synonym Before Find');

insert into event_parameters(id, name, value) values(@umlsSynonymBeforeFindId, 'jdbcDriverName', 'oracle.jdbc.driver.OracleDriver');
insert into event_parameters(id, name, value) values(@umlsSynonymBeforeFindId, 'connectionString', @connectionString);
insert into event_parameters(id, name, value) values(@umlsSynonymBeforeFindId, 'username', @username);
insert into event_parameters(id, name, value) values(@umlsSynonymBeforeFindId, 'password', @password);
insert into event_parameters(id, name, value) values(@umlsSynonymBeforeFindId, 'storedSynByPTProcedure', 'UMLS.QUERIES.GET_SYN_BY_PT(?, ?)');
insert into event_parameters(id, name, value) values(@umlsSynonymBeforeFindId, 'storedSynByPTSABProcedure', 'UMLS.QUERIES.GET_SYN_BY_PT_SAB(?, ?, ?)');
insert into event_parameters(id, name, value) values(@umlsSynonymBeforeFindId, 'newTermColumn', 'STR');
