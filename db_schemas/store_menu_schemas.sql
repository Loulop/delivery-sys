-- 
-- REFERENCES::
-- 1. https://developer.uber.com/docs/eats/guides/menu-integration

-- Item @@ <-----> @@ Item Tag
CREATE TABLE IF NOT EXISTS item (
    item_id             VARCHAR(128) NOT NULL,
    -- 
    item_type           VARCHAR(16) NULL DEFAULT 'PARENT',      -- parent, null
    item_status         VARCHAR(16) NOT NULL DEFAULT 'IN_STOCK'     -- out_of_stock, in_stock, back_in_stock
    -- TODO
    available_from      TIME NULL,
    available_to        TIME NULL,
    -- 
    PRIMARY KEY (item_id)
);
CREATE TABLE IF NOT EXISTS item_tag (
    tagname             VARCHAR(128) NOT NULL,
    -- 
    PRIMARY KEY (tagname)
);
CREATE TABLE IF NOT EXISTS item_tags (
    tagname             VARCHAR(128) NOT NULL,
    item_id             VARCHAR(128) NOT NULL,
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
    available_from      TIME NULL,
    available_to        TIME NULL,
    -- 
    PRIMARY KEY (menu_id)
);
CREATE TABLE IF NOT EXISTS menu_categories (
    menu_id             VARCHAR(128) NOT NULL,
    category_id         VARCHAR(128) NOT NULL
);
