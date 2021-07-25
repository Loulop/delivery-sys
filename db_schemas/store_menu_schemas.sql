-- 
-- REFERENCES::
-- 1. https://developer.uber.com/docs/eats/guides/menu-integration

CREATE TABLE IF NOT EXISTS item (
    item_id             VARCHAR(128) NOT NULL,
    -- 
    -- TODO
    item_type           VARCHAR(16) NULL DEFAULT 'PARENT',      -- parent, null
    -- 
    PRIMARY KEY (item_id)
);

-- Modifier Group @@ <-----> 1 Parent Item
-- Modifier Group @@ <-----> @@ Item
CREATE TABLE IF NOT EXISTS modifier_group (
    group_id            VARCHAR(128) NOT NULL,
    -- 
    parent_item_id      VARCHAR(128) NOT NULL,
    name                VARCHAR(256) NOT NULL,
    modifier_type       VARCHAR(16) NOT NULL DEFAULT "CHECKBOX",      -- checkbox, radio
    -- TODO
    -- 
    PRIMARY KEY (group_id)
);
CREATE TABLE IF NOT EXISTS modifier_group_items (
    group_id            VARCHAR(128) NOT NULL,
    item_id             VARCHAR(128) NOT NULL
);

-- Category @@ <-----> @@ Parent Item
CREATE TABLE IF NOT EXISTS category (
    category_id         VARCHAR(128) NOT NULL,
    -- 
    name                VARCHAR(256) NOT NULL,
    -- TODO
    -- 
    PRIMARY KEY (category_id)
);
CREATE TABLE IF NOT EXISTS category_items (
    category_id         VARCHAR(128) NOT NULL,
    item_id             VARCHAR(128) NOT NULL
);

-- Menu @@ <-----> @@ Category
CREATE TABLE IF NOT EXISTS menu (
    menu_id             VARCHAR(128) NOT NULL,
    -- 
    name                VARCHAR(256) NOT NULL,
    fulfillment_type    VARCHAR(16) NOT NULL DEFAULT "DELIVERY",      -- delivery, pick-up, all
    -- TODO
    -- 
    available_from      TIMESTAMP NULL,
    available_to        TIMESTAMP NULL,
    -- 
    PRIMARY KEY (menu_id)
);
CREATE TABLE IF NOT EXISTS menu_categories (
    menu_id             VARCHAR(128) NOT NULL,
    category_id         VARCHAR(128) NOT NULL
);
