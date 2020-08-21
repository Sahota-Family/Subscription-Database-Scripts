-- Database Setup Script Version 1.0.0

-- Need to run this as admin
CREATE DATABASE subscriptions;

-- Creating schemas
CREATE SCHEMA subscription;

-- Creating tables
CREATE TABLE subscription.billingCycle
(
    BillingCycleID   INT UNIQUE,
    BillingCycleName VARCHAR(50) NOT NULL,
    PRIMARY KEY (BillingCycleID)
);

CREATE TABLE subscription.person
(
    PersonID      INT IDENTITY (1,1),
    FirstName     VARCHAR(50)  NOT NULL,
    LastName      VARCHAR(50)  NOT NULL,
    DateCreated   DATETIME     NOT NULL,
    LastUpdated   DATETIME     NOT NULL,
    LastUpdatedBy VARCHAR(50)  NOT NULL,
    EmailAddress  VARCHAR(255) NOT NULL,
    PRIMARY KEY (PersonID)
);

CREATE TABLE subscription.subscription
(
    SubscriptionID   INT IDENTITY (1,1),
    PersonID         INT          NOT NULL,
    SubscriptionName VARCHAR(255) NOT NULL,
    BillingCycleCost SMALLMONEY   NOT NULL,
    StartDate        DATE         NOT NULL,
    EndDate          DATE,
    BillingCycleID   INT          NOT NULL,
    PRIMARY KEY (SubscriptionID),
    FOREIGN KEY (PersonID) REFERENCES subscription.person (PersonID)
        ON DELETE CASCADE,
    FOREIGN KEY (BillingCycleID) REFERENCES subscription.BillingCycle (BillingCycleID)
);

-- Assigning Constraints
-- TODO if needed

-- Creating indexes
-- TODO make them