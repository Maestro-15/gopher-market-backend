-- Messaging schema: conversations, messages, and offers

CREATE TABLE messaging.conversations (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    buyer_id        UUID NOT NULL,
    seller_id       UUID NOT NULL,
    product_id      UUID NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at      TIMESTAMP NOT NULL DEFAULT now(),
    updated_at      TIMESTAMP NOT NULL DEFAULT now(),
    UNIQUE(buyer_id, seller_id, product_id)
);

CREATE TABLE messaging.messages (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID NOT NULL REFERENCES messaging.conversations(id) ON DELETE CASCADE,
    sender_id       UUID NOT NULL,
    content         TEXT NOT NULL,
    read            BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE messaging.offers (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID NOT NULL REFERENCES messaging.conversations(id) ON DELETE CASCADE,
    offerer_id      UUID NOT NULL,
    amount          DECIMAL(10,2) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    parent_offer_id UUID REFERENCES messaging.offers(id),
    created_at      TIMESTAMP NOT NULL DEFAULT now(),
    updated_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_conversations_buyer_id ON messaging.conversations(buyer_id);
CREATE INDEX idx_conversations_seller_id ON messaging.conversations(seller_id);
CREATE INDEX idx_conversations_product_id ON messaging.conversations(product_id);
CREATE INDEX idx_messages_conversation_id ON messaging.messages(conversation_id);
CREATE INDEX idx_messages_created_at ON messaging.messages(created_at);
CREATE INDEX idx_offers_conversation_id ON messaging.offers(conversation_id);
CREATE INDEX idx_offers_status ON messaging.offers(status);
