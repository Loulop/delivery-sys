-- 
-- REFERENCES::
-- 1. https://developer.uber.com/docs/eats/guides/menu-integration

-- Item @@ <-----> @@ Item Tag
CREATE TABLE IF NOT EXISTS item (
    item_id             VARCHAR(128) NOT NULL,
    -- 
    store_id            VARCHAR(128) NOT NULL,
    name                VARCHAR(256) NOT NULL,
    is_parent_item      BOOLEAN NOT NULL DEFAULT 1,       -- parent, null
    item_status         VARCHAR(16) NOT NULL DEFAULT 'IN_STOCK',     -- out_of_stock, in_stock, back_in_stock
    -- TODO
    image_url           VARCHAR(1024) NULL,
    ingreidents         VARCHAR(2048) NULL,
    available_from      TIME NULL,
    available_to        TIME NULL,
    -- 
    PRIMARY KEY (item_id)
    -- FOREIGN KEY (store_id)
);

CREATE TABLE IF NOT EXISTS item_tag (
    tagname             VARCHAR(128) NOT NULL,
    -- 
    PRIMARY KEY (tagname)
);

CREATE TABLE IF NOT EXISTS item_tags (
    tagname             VARCHAR(128) NOT NULL,
    parent_item_id      VARCHAR(128) NOT NULL
    -- 
    -- FOREIGN KEY (tagname),
    -- FOREIGN KEY (parent_item_id),
);

-- Modifier Group @@ <-----> 1 Parent Item
-- Modifier Group @@ <-----> @@ Item
CREATE TABLE IF NOT EXISTS modifier_group (
    modifier_group_id   VARCHAR(128) NOT NULL,
    -- 
    parent_item_id      VARCHAR(128) NOT NULL,
    store_id            VARCHAR(128) NOT NULL,
    name                VARCHAR(256) NOT NULL,
    modifier_type       BOOLEAN NOT NULL,      -- checkbox, radio
    -- TODO
    -- 
    PRIMARY KEY (group_id)
    -- FOREIGN KEY (parent_item_id),
    -- FOREIGN KEY (store_id)
);

CREATE TABLE IF NOT EXISTS modifier_group_items (
    modifier_group_id   VARCHAR(128) NOT NULL,
    child_item_id       VARCHAR(128) NOT NULL
    -- 
    -- FOREIGN KEY (modifier_group_id)
    -- FOREIGN KEY (item_id)
);

-- Category @@ <-----> @@ Parent Item
CREATE TABLE IF NOT EXISTS category (
    category_id         VARCHAR(128) NOT NULL,
    -- 
    store_id            VARCHAR(128) NOT NULL,
    name                VARCHAR(256) NOT NULL,
    -- TODO
    -- 
    PRIMARY KEY (category_id) 
    -- FOREIGN KEY (store_id)
);

CREATE TABLE IF NOT EXISTS category_items (
    category_id         VARCHAR(128) NOT NULL,
    parent_item_id      VARCHAR(128) NOT NULL,
    -- 
    -- FOREIGN KEY (category_id),
    -- FOREIGN KEY (parent_item_id),
    INDEX (category_id)
);

-- Menu @@ <-----> @@ Category
CREATE TABLE IF NOT EXISTS menu (
    menu_id             VARCHAR(128) NOT NULL,
    -- 
    store_id            VARCHAR(128) NOT NULL,
    name                VARCHAR(256) NOT NULL,
    menu_status         BOOLEAN NOT NULL,       -- visible, invisible
    fulfillment_type    VARCHAR(16) NOT NULL DEFAULT "DELIVERY",      -- delivery, pick-up, all
    -- TODO
    description         VARCHAR(128) NULL,
    -- 
    store_id            VARCHAR(128) NULL,
    -- 
    PRIMARY KEY (menu_id)
    -- FOREIGN KEY (store_id)
);

CREATE TABLE IF NOT EXISTS menu_categories (
    menu_id             VARCHAR(128) NOT NULL,
    category_id         VARCHAR(128) NOT NULL,
    -- 
    -- FOREIGN KEY (menu_id),
    -- FOREIGN KEY (category_id),
    INDEX (menu_id)
);

-- Service availability @@ <-----> @@ Menu
-- update this table from a cron object
-- a group of schedules by name is a cron object
CREATE TABLE IF NOT EXISTS service_availability (
    service_availability_id         VARCHAR(128) NOT NULL,
    -- 
    store_id                        VARCHAR(128) NOT NULL,
    name                            VARCHAR(128) NOT NULL,
    service_availability_status     BOOLEAN NOT NULL,
    service_date                    DATE NOT NULL,
    service_time_from               TIME NOT NULL,
    service_time_to                 TIME NOT NULL,
    -- 
    PRIMARY KEY (service_availability_id),
    -- FOREIGN KEY (store_id),
    INDEX (store_id, name)
);

CREATE TABLE IF NOT EXISTS menu_service_availability (
    menu_id                         VARCHAR(128) NOT NULL,
    service_availability_id         VARCHAR(128) NOT NULL,
    -- 
    INDEX (menu_id),
    INDEX (service_availability_id)
);
