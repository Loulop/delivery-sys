-- 
-- REFERENCES::
-- 1. https://developer.uber.com/docs/eats/guides/menu-integration

CREATE TABLE IF NOT EXISTS store (
    store_id                    VARCHAR(128) NOT NULL,
    --
    user_id                     VARCHAR(128) NOT NULL,
    name                        VARCHAR(256) NOT NULL,
    store_status                BOOLEAN NOT NULL,      -- offline, online
    -- 
    -- TODO
    location_lat                DOUBLE NULL,
    location_lng                DOUBLE NULL,
    -- 
    PRIMARY KEY (store_id)
    -- FOREIGN KEY (user_id)
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
    -- FOREIGN KEY (market_id),
    -- FOREIGN KEY (store_id),
    INDEX (market_id)
);
