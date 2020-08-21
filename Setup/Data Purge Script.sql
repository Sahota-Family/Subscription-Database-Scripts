-- DB Purge Script version 1.0.0
-- Remove constraints/tables
-- Generate alter statements to delete constraints
SELECT OBJECT_SCHEMA_NAME(parent_object_id),
       'ALTER TABLE [' + OBJECT_SCHEMA_NAME(parent_object_id) +
       '].[' + OBJECT_NAME(parent_object_id) +
       '] DROP CONSTRAINT [' + name + ']'
FROM sys.foreign_keys
WHERE referenced_object_id in
      (object_id('subscription.person'), object_id('subscription.email'), object_id('subscription.subscription'),
       object_id('subscription.billingCycle'));

-- SELECT *
-- FROM sys.foreign_keys
-- where referenced_object_id in
--       (object_id('subscription.person'), object_id('subscription.email'), object_id('subscription.subscription'),
--        object_id('subscription.billingCycle'));

DROP TABLE IF EXISTS subscription.person;
DROP TABLE IF EXISTS subscription.email;
DROP TABLE IF EXISTS subscription.billingCycle;
DROP TABLE IF EXISTS subscription.subscription;