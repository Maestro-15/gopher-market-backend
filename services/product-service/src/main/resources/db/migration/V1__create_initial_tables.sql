-- Products schema: marketplace listings for goods

CREATE TABLE products.products (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    seller_id       UUID NOT NULL,
    title           VARCHAR(255) NOT NULL,
    description     TEXT,
    price           DECIMAL(10,2) NOT NULL,
    category        VARCHAR(100) NOT NULL,
    condition       VARCHAR(50) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    image_urls      TEXT[],
    location        VARCHAR(255),
    view_count      INTEGER NOT NULL DEFAULT 0,
    created_at      TIMESTAMP NOT NULL DEFAULT now(),
    updated_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_products_seller_id ON products.products(seller_id);
CREATE INDEX idx_products_status ON products.products(status);
CREATE INDEX idx_products_category ON products.products(category);
CREATE INDEX idx_products_created_at ON products.products(created_at DESC);
CREATE INDEX idx_products_price ON products.products(price);
