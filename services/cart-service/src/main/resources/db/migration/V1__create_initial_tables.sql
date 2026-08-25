-- Cart schema: shopping cart for goods

CREATE TABLE cart.carts (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL UNIQUE,
    created_at      TIMESTAMP NOT NULL DEFAULT now(),
    updated_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE cart.cart_items (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cart_id         UUID NOT NULL REFERENCES cart.carts(id) ON DELETE CASCADE,
    product_id      UUID NOT NULL,
    added_at        TIMESTAMP NOT NULL DEFAULT now(),
    UNIQUE(cart_id, product_id)
);

CREATE INDEX idx_carts_user_id ON cart.carts(user_id);
CREATE INDEX idx_cart_items_cart_id ON cart.cart_items(cart_id);
