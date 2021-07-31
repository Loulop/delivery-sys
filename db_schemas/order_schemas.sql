-- order
CREATE TABLE IF NOT EXISTS `order` (
    -- primary key
    order_id                            VARCHAR(128) NOT NULL,
    -- foreign key
    store_id                            VARCHAR(128) NOT NULL,
    -- 
    display_name                        VARCHAR(4) NOT NULL UNIQUE,
    order_type                          VARCHAR(32) NOT NULL,       -- PICK_UP, DINE_IN, DELIVERY_BY_UBER, DELIVERY_BY_RESTAURANT
    current_status                      VARCHAR(32) NOT NULL,       -- CREATED, ACCEPTED, DENIED, FINISHED, CANCELED
    placed_at                           DATETIME NOT NULL,
    estimated_ready_for_pick_up         DATETIME NOT NULL,
    -- 
    PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS eater_info (
    -- primary key
    order_id                            VARCHAR(128) NOT NULL,
    -- foreign key
    user_id                             VARCHAR(128) NOT NULL,
    -- 
    full_name                           VARCHAR(64) NOT NULL,
    phone_no                            VARCHAR(16) NOT NULL,
    -- (delivery) location details
    location_type                       VARCHAR(16) NOT NULL,
    location_street_address             VARCHAR(128) NULL,
    location_latitude                   DOUBLE NULL,
    location_longitude                  DOUBLE NULL,
    location_google_place_id            VARCHAR(128) NULL,
    -- 
    PRIMARY KEY (order_id)
);

-- order_cart
-- order cart contains:
-- 1. list of items
        -- 1.1 list of modifier_groups
-- 2. fulfillment issues list
-- 3. payment
-- 4. order ordered time
-- 5. estimated pickup time
-- 6. order type ---
CREATE TABLE IF NOT EXISTS order_cart (
    -- primary key
    order_id                            VARCHAR(128) NOT NULL,
    -- 
    PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS order_payment (
    -- primary key
    order_id                            VARCHAR(128) NOT NULL,
    -- 
    PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS order_packaging (
    -- primary key
    order_id                            VARCHAR(128) NOT NULL,
    -- 
    PRIMARY KEY (order_id)
);