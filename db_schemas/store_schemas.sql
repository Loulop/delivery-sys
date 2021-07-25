-- 
-- REFERENCES::
-- 1. https://developer.uber.com/docs/eats/guides/menu-integration

CREATE TABLE IF NOT EXISTS store (
    store_id                    VARCHAR(128) NOT NULL,
    -- 
    store_status                VARCHAR(16) NOT NULL DEFAULT 'OFFLINE'      -- offline, online
    service_hours_from          TIME NOT NULL,
    service_hours_to            TIME NOT NULL,
    -- 
    holiday_service_hours_from  TIME NULL,
    holiday_service_hours_to    TIME NULL,
    -- TODO
    loc_lat                     DOUBLE NULL,
    loc_lng                     DOUBLE NULL,
    -- 
    PRIMARY KEY (item_id)
);

-- Market @@ <-----> @@ Store
CREATE TABLE IF NOT EXISTS market (
    market_id           VARCHAR(128) NOT NULL,
    -- 
    -- TODO
    -- 
    PRIMARY KEY (market_id)
);

CREATE TABLE IF NOT EXISTS market_stores (
    market_id           VARCHAR(128) NOT NULL,
    store_id            VARCHAR(128) NOT NULL
);