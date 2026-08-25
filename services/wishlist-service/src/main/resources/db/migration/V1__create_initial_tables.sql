-- Wishlist schema: saved items for users

CREATE TABLE wishlist.wishlists (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL UNIQUE,
    created_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE wishlist.wishlist_items (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wishlist_id     UUID NOT NULL REFERENCES wishlist.wishlists(id) ON DELETE CASCADE,
    product_id      UUID NOT NULL,
    added_at        TIMESTAMP NOT NULL DEFAULT now(),
    UNIQUE(wishlist_id, product_id)
);

CREATE INDEX idx_wishlists_user_id ON wishlist.wishlists(user_id);
CREATE INDEX idx_wishlist_items_wishlist_id ON wishlist.wishlist_items(wishlist_id);
