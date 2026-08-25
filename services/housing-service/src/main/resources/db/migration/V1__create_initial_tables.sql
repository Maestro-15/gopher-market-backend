-- Housing schema: subletting and roommate listings

CREATE TABLE housing.housing_listings (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    poster_id       UUID NOT NULL,
    title           VARCHAR(255) NOT NULL,
    description     TEXT,
    listing_type    VARCHAR(20) NOT NULL,
    monthly_rent    DECIMAL(10,2) NOT NULL,
    address         VARCHAR(500),
    bedrooms        INTEGER,
    bathrooms       DECIMAL(3,1),
    available_from  DATE,
    available_to    DATE,
    amenities       TEXT[],
    image_urls      TEXT[],
    status          VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    view_count      INTEGER NOT NULL DEFAULT 0,
    created_at      TIMESTAMP NOT NULL DEFAULT now(),
    updated_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_housing_listings_poster_id ON housing.housing_listings(poster_id);
CREATE INDEX idx_housing_listings_status ON housing.housing_listings(status);
CREATE INDEX idx_housing_listings_type ON housing.housing_listings(listing_type);
CREATE INDEX idx_housing_listings_rent ON housing.housing_listings(monthly_rent);
CREATE INDEX idx_housing_listings_available_from ON housing.housing_listings(available_from);
