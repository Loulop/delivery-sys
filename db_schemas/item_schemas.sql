-- item
CREATE TABLE IF NOT EXISTS item (
    -- primary key
    item_id                         VARCHAR(128) NOT NULL,
    -- foreign key
    store_id                        VARCHAR(128) NOT NULL,
    -- details
    title                           VARCHAR(128) NOT NULL,
    description                     VARCHAR(256) NOT NULL,
    image_url                       VARCHAR(1024) NOT NULL,
    -- 
    PRIMARY KEY (item_id)
);

-- item_info
-- item 1 <------> 1 item_info
CREATE TABLE IF NOT EXISTS item_info (
    -- primary key
    item_id                         VARCHAR(128) NOT NULL,
    -- 
    -- Nutritional info
    nutritional_calories            VARCHAR(1024) NULL,
    nutritional_kilojoules          VARCHAR(1024) NULL,
    -- Dish info
    dish_can_serve_alone            BOOLEAN NULL,
    dish_dietary_labels             VARCHAR(1024) NULL, -- VEGAN, VEGETARIAN, GLUTEN_FREE
    -- visibilty info
    visibility_start_date           DATE NULL,
    visibility_end_date             DATE NULL,
    visibility_hours_of_week        VARCHAR(1024) NOT NULL,
    -- rules
    price_rule_id                   VARCHAR(128) NULL,
    quantity_rule_id                VARCHAR(128) NULL,
    suspension_rule_id              VARCHAR(128) NULL,
    modifier_group_rule_id          VARCHAR(128) NULL,
    -- 
    PRIMARY KEY (item_id)
);

-- modifier_group
-- modifier_group @@ <-----------> 1 item
CREATE TABLE IF NOT EXISTS modifier_group (
    -- primary key
    modifier_group_id               VARCHAR(128) NOT NULL,
    -- foreign key
    store_id                        VARCHAR(128) NOT NULL,
    -- details
    title                           VARCHAR(128) NOT NULL,
    collapsed                       BOOLEAN NOT NULL DEFAULT TRUE,
    -- 
    menu_entities                   VARCHAR(2048) NULL,
    -- rules
    quantity_rule_id                VARCHAR(128) NULL,
    -- 
    PRIMARY KEY (item_id)
);
