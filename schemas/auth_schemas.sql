-- 
-- REFERENCES:: 
-- 1. https://auth0.com/docs/authorization/which-oauth-2-0-flow-should-i-use
-- 2. https://github.com/spring-projects/spring-security-oauth/blob/main/spring-security-oauth2/src/test/resources/schema.sql
-- 3. https://bshaffer.github.io/oauth2-server-php-docs/cookbook/
-- 4. https://developers.wultra.com/docs/2019.11/powerauth-webflow/Database-Table-Structure
-- 5. https://docs.oracle.com/cd/E55956_01/doc.11123/oauth_guide/content/oauth_app_registration.html

-- Client details
CREATE TABLE IF NOT EXISTS oauth_client_details (
    client_id       VARCHAR(128) NOT NULL,
    -- 
    grant_types     VARCHAR(128) NOT NULL,      -- client_credentials or authorization_code 
    scope           VARCHAR(1024) NOT NULL,
    -- 
    client_secret   VARCHAR(128) NULL,
    redirect_uri    VARCHAR(1024) NULL,
    -- 
    PRIMARY KEY (client_id)
);

CREATE TABLE IF NOT EXISTS oauth_client_token (
    auth_id         VARCHAR(128) NOT NULL,
    -- 
    user_id         VARCHAR(128) NULL,
    token_id        VARCHAR(128) NULL,
    client_id       VARCHAR(128) NULL,
    token           BLOB NULL,
    -- 
    PRIMARY KEY (auth_id)
);

CREATE TABLE IF NOT EXISTS oauth_access_token (
    auth_id         VARCHAR(128) NOT NULL,
    -- 
    user_id         VARCHAR(128) NULL,
    token_id        VARCHAR(128) NULL,
    client_id       VARCHAR(128) NULL,
    token           BLOB NULL,
    auth            BLOB NULL,
    refresh_token   VARCHAR(256) NULL,
    -- 
    PRIMARY KEY (auth_id)
);

CREATE TABLE IF NOT EXISTS oauth_refresh_token (
  token_id          VARCHAR(128),
  -- 
  token             BLOB,
  authentication    BLOB
);

CREATE TABLE IF NOT EXISTS oauth_code (
  code              VARCHAR(256),
  authentication    BLOB
);

CREATE TABLE IF NOT EXISTS oauth_approvals (
    client_id       VARCHAR(128) NOT NULL,
    -- 
    user_id         VARCHAR(128) NOT NULL,
    scope           VARCHAR(1024) NOT NULL,
    status          VARCHAR(16) NOT NULL,
    expires_at      TIMESTAMP NOT NULL,
    -- 
    updated_at      TIMESTAMP NULL,
    -- 
    PRIMARY KEY (client_id)
);
