-- Notifications schema: user notifications

CREATE TABLE notifications.notifications (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID NOT NULL,
    type            VARCHAR(50) NOT NULL,
    title           VARCHAR(255) NOT NULL,
    message         TEXT NOT NULL,
    reference_id    UUID,
    reference_type  VARCHAR(50),
    read            BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMP NOT NULL DEFAULT now()
);

CREATE INDEX idx_notifications_user_id ON notifications.notifications(user_id);
CREATE INDEX idx_notifications_user_read ON notifications.notifications(user_id, read);
CREATE INDEX idx_notifications_created_at ON notifications.notifications(created_at DESC);
