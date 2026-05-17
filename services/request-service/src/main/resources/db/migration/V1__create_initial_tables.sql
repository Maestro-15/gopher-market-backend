-- Requests and Transactions schemas

CREATE TABLE requests.requests (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    buyer_id        UUID NOT NULL,
    seller_id       UUID NOT NULL,
    product_id      UUID NOT NULL,
    offer_id        UUID,
    agreed_price    DECIMAL(10,2) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    message         TEXT,
    created_at      TIMESTAMP NOT NULL DEFAULT now(),
    updated_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE transactions.transactions (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    request_id      UUID NOT NULL,
    buyer_id        UUID NOT NULL,
    seller_id       UUID NOT NULL,
    product_id      UUID NOT NULL,
    amount          DECIMAL(10,2) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    completed_at    TIMESTAMP,
    cancelled_at    TIMESTAMP,
    created_at      TIMESTAMP NOT NULL DEFAULT now(),
    updated_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_requests_buyer_id ON requests.requests(buyer_id);
CREATE INDEX idx_requests_seller_id ON requests.requests(seller_id);
CREATE INDEX idx_requests_product_id ON requests.requests(product_id);
CREATE INDEX idx_requests_status ON requests.requests(status);
CREATE INDEX idx_transactions_buyer_id ON transactions.transactions(buyer_id);
CREATE INDEX idx_transactions_seller_id ON transactions.transactions(seller_id);
CREATE INDEX idx_transactions_product_id ON transactions.transactions(product_id);
CREATE INDEX idx_transactions_status ON transactions.transactions(status);
