CREATE TABLE verification (
 id BIGSERIAL,
 id_authority int,
 verification_name varchar(512),
 verification_description text,
 comments text
);


ALTER TABLE verification ADD CONSTRAINT verification_pkey PRIMARY KEY (id);

CREATE TABLE authority (
 id BIGSERIAL,
 login varchar(256),
 organization_name varchar(512),
 organization_description text,
 authorized_on datetime,
 authorized_active_until datetime,
 authorization_suspended varchar(16) DEFAULT 'false',
 contact_name varchar(256),
 contact_email varchar(256),
 contact_phone varchar(64),
 contact_text varchar(64),
 address text,
 notes text
);


ALTER TABLE authority ADD CONSTRAINT authority_pkey PRIMARY KEY (id);

CREATE TABLE user_verification (
 id BIGSERIAL,
 id_verification int,
 id_socialnetwork smallint,
 social_login varchar(256)
);


ALTER TABLE user_verification ADD CONSTRAINT user_verification_pkey PRIMARY KEY (id);

CREATE TABLE socialnetwork (
 id BIGSERIAL,
 name varchar(256)
);


ALTER TABLE socialnetwork ADD CONSTRAINT socialnetwork_pkey PRIMARY KEY (id);

CREATE TABLE social_logins (
 id BIGSERIAL,
 id_authority int,
 id_socialnetwork smallint,
 social_login varchar(256)
);


ALTER TABLE social_logins ADD CONSTRAINT social_logins_pkey PRIMARY KEY (id);

ALTER TABLE verification ADD CONSTRAINT verification_id_authority_fkey FOREIGN KEY (id_authority) REFERENCES authority(id);
ALTER TABLE user_verification ADD CONSTRAINT user_verification_id_verification_fkey FOREIGN KEY (id_verification) REFERENCES verification(id);
ALTER TABLE user_verification ADD CONSTRAINT user_verification_id_socialnetwork_fkey FOREIGN KEY (id_socialnetwork) REFERENCES socialnetwork(id);
ALTER TABLE social_logins ADD CONSTRAINT social_logins_id_authority_fkey FOREIGN KEY (id_authority) REFERENCES authority(id);
ALTER TABLE social_logins ADD CONSTRAINT social_logins_id_socialnetwork_fkey FOREIGN KEY (id_socialnetwork) REFERENCES socialnetwork(id);