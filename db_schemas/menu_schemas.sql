-- main..
CREATE TABLE IF NOT EXISTS menu (
    -- primary key
    menu_id                         VARCHAR(128) NOT NULL,
    -- foreign key
    store_id                        VARCHAR(128) NOT NULL,
    -- details
    title                           VARCHAR(128) NOT NULL,
    subtitle                        VARCHAR(256) NOT NULL,
    -- 
    PRIMARY KEY (menu_id)
);

-- service_availability
-- Menu 1 <----------> @@ service_availability
CREATE TABLE IF NOT EXISTS service_availability (
    -- primary key
    service_availability_id         VARCHAR(128) NOT NULL,
    -- foreign key
    store_id                        VARCHAR(128) NOT NULL,
    menu_id                         VARCHAR(128) NOT NULL,
    -- details
    days_of_week                    VARCHAR(16) NOT NULL,
    time_periods                    VARCHAR(256) NOT NULL,
    -- 
    PRIMARY KEY (service_availability_id)
);

-- categories
-- Menu 1 <----------> @@ category
CREATE TABLE IF NOT EXISTS category (
    -- primary key
    category_id                     VARCHAR(128) NOT NULL,
    -- foreign key
    store_id                        VARCHAR(128) NOT NULL,
    menu_id                         VARCHAR(128) NOT NULL,
    -- details
    title                           VARCHAR(128) NOT NULL,
    -- 
    menu_entities                   VARCHAR(2048) NULL,
    -- 
    PRIMARY KEY (category_id)
);

-- menu_entites
-- category 1 <-----------> @@ menu_entity
-- modifier_group 1 <-----------> @@ menu_entity
CREATE TABLE IF NOT EXISTS menu_entity (
    -- primary key
    entity_id                       VARCHAR(128) NOT NULL,
    -- foreign key
    store_id                        VARCHAR(128) NOT NULL,
    -- details
    entity_type                     VARCHAR(16) NOT NULL,
    -- 
    PRIMARY KEY (entity_id)
);
