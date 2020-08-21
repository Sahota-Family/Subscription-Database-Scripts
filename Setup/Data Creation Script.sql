-- Data Creation Script version 1.0.0
-- Populate data
INSERT INTO subscription.billingCycle (BillingCycleID, BillingCycleName)
OUTPUT inserted.BillingCycleID, inserted.BillingCycleName
VALUES (1, 'Daily'),
       (2, 'Weekly'),
       (3, 'Biweekly'),
       (4, 'Monthly'),
       (5, 'Yearly');

INSERT INTO subscription.person (FirstName, LastName, DateCreated, LastUpdated, LastUpdatedBy, EmailAddress)
OUTPUT inserted.PersonID, inserted.EmailAddress
VALUES ('Harman', 'Sahota', GETDATE(), GETDATE(), 'DataCreationScript', 'harman.sahota@test.com'),
       ('Amrit', 'Sahota', GETDATE(), GETDATE(), 'DataCreationScript', 'amrit.sahota@test.com')

INSERT INTO subscription.subscription (PersonID, SubscriptionName, BillingCycleCost, StartDate, EndDate, BillingCycleID)
OUTPUT inserted.SubscriptionID, inserted.SubscriptionName, inserted.BillingCycleCost
VALUES (1, 'Netflix', 13.77, '05/13/2019', null, 4),
       (1, 'CrunchyRoll', 63.54, '03/16/2020', null, 5),
       (1, 'Xbox GamePass Ultimate', 15.89, '08/20/2019', null, 4),
       (2, 'Hulu', 00.00, '01/01/2010', null, 4)