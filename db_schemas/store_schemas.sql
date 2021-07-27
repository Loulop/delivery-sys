-- 
-- REFERENCES::
-- 1. https://developer.uber.com/docs/eats/guides/menu-integration

CREATE TABLE IF NOT EXISTS store (
    store_id                    VARCHAR(128) NOT NULL,
    --
    user_id                     VARCHAR(128) NOT NULL,
    name                        VARCHAR(256) NOT NULL,
    store_service_status        BOOLEAN NOT NULL,      -- offline, online
    city_id                     VARCHAR(128) NOT NULL,
    -- TODO
    location_lat                DOUBLE NULL,
    location_lng                DOUBLE NULL,
    address                     VARCHAR(256) NULL,
    address_2                   VARCHAR(256) NULL,
    postal_code                 VARCHAR(256) NULL,  
    contact_emails              VARCHAR(512) NULL,
    offline_reason              VARCHAR(128) NULL,      -- OUT_OF_MENU_HOURS, INVISIBLE, PAUSED_BY_OUR_APP, PAUSED_BY_STORE
    external_store_id           VARCHAR(128) NULL,
    -- 
    PRIMARY KEY (store_id)
    -- FOREIGN KEY (user_id)
    -- FOREIGN KEY (city_id)
);

-- Market @@ <-----> @@ Store
CREATE TABLE IF NOT EXISTS market (
    market_id           VARCHAR(128) NOT NULL,
    -- 
    name                VARCHAR(128) NOT NULL,
    -- TODO
    -- 
    PRIMARY KEY (market_id)
);

CREATE TABLE IF NOT EXISTS market_stores (
    market_id           VARCHAR(128) NOT NULL,
    store_id            VARCHAR(128) NOT NULL,
    -- 
    -- FOREIGN KEY (market_id)
    -- FOREIGN KEY (store_id)
    INDEX (market_id)
);

CREATE TABLE IF NOT EXISTS cites (
    city_id                     VARCHAR(128) NOT NULL,
    -- 
    name                        VARCHAR(218) NOT NULL,
    country_code                VARCHAR(3) NOT NULL,
    -- 
    PRIMARY KEY (city_id)
);

-- this table is better if it is managed by mongodb or etc.
CREATE TABLE IF NOT EXISTS store_stats (
    store_id                    VARCHAR(128) NOT NULL,
    -- 
    -- 
    average_prep_time           INT UNSIGNED NULL, 
    -- 
    PRIMARY KEY (store_id)
);