-- market
-- Market @@ <-----> @@ Store
CREATE TABLE IF NOT EXISTS market (
    market_id                   VARCHAR(128) NOT NULL,
    -- 
    name                        VARCHAR(128) NOT NULL,
    -- TODO
    -- 
    PRIMARY KEY (market_id)
);

CREATE TABLE IF NOT EXISTS market_stores (
    market_id                   VARCHAR(128) NOT NULL,
    store_id                    VARCHAR(128) NOT NULL,
    -- 
    -- FOREIGN KEY (market_id)
    -- FOREIGN KEY (store_id)
    INDEX (market_id)
);
