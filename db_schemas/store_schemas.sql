-- main..
CREATE TABLE IF NOT EXISTS store (
    -- primary key
    store_id                        VARCHAR(128) NOT NULL,
    -- foreign keys
    user_id                         VARCHAR(128) NOT NULL,
    -- details
    name                            VARCHAR(128) NOT NULL,
    operational_status              BOOLEAN NOT NULL DEFAULT FALSE,
    image_url                       VARCHAR(1024) NOT NULL,
    price_bucket                    VARCHAR(7) NOT NULL DEFAULT "$",
    contact_emails                  VARCHAR(512) NOT NULL,
    -- 
    offline_reason                  VARCHAR(128) NULL, -- OUT_OF_MENU_HOURS, INVISIBLE, PAUSED_BY_US, PAUSED_BY_RESTAURANT
    -- 
    PRIMARY KEY (store_id)
);

-- location..
-- store 1 <------> 1 store_location
CREATE TABLE IF NOT EXISTS store_location (
    -- primary key
    store_id                        VARCHAR(128) NOT NULL,
    -- details
    -- TODO: fix nullibilty 
    address                         VARCHAR(128) NULL,
    address_2                       VARCHAR(128) NULL,
    city                            VARCHAR(32) NULL,
    state                           VARCHAR(32) NULL,
    postal_code                     VARCHAR(16) NULL,
    country                         VARCHAR(4) NULL,
    latitude                        DOUBLE NULL,
    longitude                       DOUBLE NULL,
    -- 
    PRIMARY KEY (store_id)
);

-- store_stats..
-- this table is better if it is managed by mongodb or etc.
CREATE TABLE IF NOT EXISTS store_stats (
    store_id                    VARCHAR(128) NOT NULL,
    -- 
    -- 
    average_prep_time           INT UNSIGNED NULL,
    -- 
    PRIMARY KEY (store_id)
);

-- Report types
-- PAYMENT_DETAILS_REPORT
-- ORDER_ERRORS_MENU_ITEM_REPORT
-- ORDER_ERRORS_TRANSACTION_REPORT
-- ORDER_HISTORY_REPORT
-- DOWNTIME_REPORT
-- CUSTOMER_AND_DELIVERY_FEEDBACK_REPORT
-- MENU_ITEM_FEEDBACK_REPORT

CREATE TABLE IF NOT EXISTS store_report (
    -- primary key
    report_id                       VARCHAR(128) NOT NULL,
    -- foreign key
    user_id                         VARCHAR(128) NOT NULL,
    store_id                        VARCHAR(128) NOT NULL,
    report_type                     VARCHAR(128) NOT NULL,
    -- 
    current_status                  VARCHAR(32) NOT NULL,   -- CREATED, ACCEPTED, DENIED, FINISHED, CANCELED
    start_date                      DATETIME NOT NULL,
    end_date                        DATETIME NOT NULL,
    placed_at                       DATETIME NOT NULL,
    -- 
    PRIMARY KEY (report_id)
);
