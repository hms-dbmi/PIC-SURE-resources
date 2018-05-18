set @resourceName = IFNULL(@resourceName,'{{resourceName}}');
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM `PredicateType_dataTypes` WHERE PredicateType_id IN (SELECT supportedPredicates_id FROM `Resource_PredicateType` WHERE resource_id IN (SELECT id FROM `Resource` WHERE NAME = @resourceName));
DELETE FROM `PredicateType_Field` WHERE predicatetype_id IN (SELECT supportedPredicates_id FROM `Resource_PredicateType` WHERE resource_id IN (SELECT id FROM `Resource` WHERE name = @resourceName));
DELETE FROM `PredicateType_paths` WHERE predicatetype_id IN (SELECT supportedPredicates_id FROM `Resource_PredicateType` WHERE resource_id IN (SELECT id FROM `Resource` WHERE name = @resourceName));
DELETE FROM `PredicateType` WHERE id IN (SELECT supportedPredicates_id FROM `Resource_PredicateType` WHERE resource_id IN (SELECT id FROM `Resource` WHERE name = @resourceName));

DELETE FROM `Resource_PredicateType` WHERE resource_id IN (SELECT id FROM `Resource` WHERE  NAME = @resourceName);
DELETE FROM `Resource_Field` WHERE resource_id IN (SELECT id FROM `Resource` WHERE  NAME = @resourceName);
DELETE FROM `Resource_relationships` WHERE resource_id IN (SELECT id FROM `Resource` WHERE  NAME = @resourceName);
DELETE FROM `Resource_LogicalOperator` WHERE id IN (SELECT id FROM `Resource` WHERE  NAME = @resourceName);
DELETE FROM `Resource_dataTypes` WHERE resource_id IN (SELECT id FROM `Resource` WHERE  NAME = @resourceName);
DELETE FROM `resource_parameters` WHERE id IN (SELECT id FROM `Resource` WHERE  NAME = @resourceName);

DELETE FROM `Resource` WHERE name = @resourceName;

SET FOREIGN_KEY_CHECKS = 1;
commit;
