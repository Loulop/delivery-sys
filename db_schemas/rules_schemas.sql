-- price_rule
-- item 1 <-----------> 1 price_rule
CREATE TABLE IF NOT EXISTS price_rule (
    -- primary key
    rule_id                         VARCHAR(128) NOT NULL,
    -- details
    price                           INT UNSIGNED NULL DEFAULT 0,
    -- 
    overrides                       VARCHAR(1024) NULL,    -- [Menu, Item, Modifier_group]
    -- 
    PRIMARY KEY (rule_id)
);

-- quantity_rule
-- item 1 <-----------> 1 quantity_rule
CREATE TABLE IF NOT EXISTS quantity_rule (
    -- primary key
    rule_id                         VARCHAR(128) NOT NULL,
    -- details
    is_min_permitted_optional       BOOLEAN NULL DEFAULT FALSE,
    min_permitted                   INT UNSIGNED NULL,
    max_permitted                   INT UNSIGNED NULL,
    min_permitted_unique            INT UNSIGNED NULL,
    max_permitted_unique            INT UNSIGNED NULL,
    charge_above                    INT UNSIGNED NULL,
    refund_under                    INT UNSIGNED NULL,
    -- 
    overrides                       VARCHAR(1024) NULL,    -- [Menu, Item, Modifier_group]
    -- 
    PRIMARY KEY (rule_id)
);

-- suspension_rule
-- item 1 <-----------> 1 suspension_rule
CREATE TABLE IF NOT EXISTS suspension_rule (
    -- primary key
    rule_id                         VARCHAR(128) NOT NULL,
    -- details
    -- 
    suspend_until                   TIMESTAMP NULL,
    reason                          VARCHAR(128) NULL,
    -- 
    overrides                       VARCHAR(1024) NULL,    -- [Menu, Item, Modifier_group]
    -- 
    PRIMARY KEY (rule_id)
);

-- modifier_group_rule
-- item 1 <-----------> 1 suspension_rule
CREATE TABLE IF NOT EXISTS modifier_group_rule (
    -- primary key
    rule_id                         VARCHAR(128) NOT NULL,
    -- details
    -- 
    modifier_group_ids              VARCHAR(2048) NULL,
    -- 
    overrides                       VARCHAR(1024) NULL,    -- [Menu, Item, Modifier_group]
    -- 
    PRIMARY KEY (rule_id)
);
