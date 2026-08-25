-- Users schema: user profiles and preferences

CREATE TABLE users.user_profiles (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    auth_user_id    UUID NOT NULL UNIQUE,
    email           VARCHAR(255) NOT NULL UNIQUE,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    display_name    VARCHAR(100),
    avatar_url      VARCHAR(512),
    phone           VARCHAR(20),
    bio             TEXT,
    graduation_year INTEGER,
    items_sold      INTEGER NOT NULL DEFAULT 0,
    items_purchased INTEGER NOT NULL DEFAULT 0,
    rating          DECIMAL(3,2) DEFAULT 0.00,
    created_at      TIMESTAMP NOT NULL DEFAULT now(),
    updated_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_user_profiles_auth_user_id ON users.user_profiles(auth_user_id);
CREATE INDEX idx_user_profiles_email ON users.user_profiles(email);
