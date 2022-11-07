-- accounts assigned to do the authorizing. 
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
 notes text,
 metadata jsonb
);

ALTER TABLE authority ADD CONSTRAINT authority_pkey PRIMARY KEY (id);

-- a verification is a credential an authority can bestow on a social user. For example: "Climate Scientist", "Celebrity", "Politician"
CREATE TABLE verification (
 id BIGSERIAL,
 id_authority int,
 verification_name varchar(512),
 verification_description text,
 comments text,
 metadata jsonb
);

ALTER TABLE verification ADD CONSTRAINT verification_pkey PRIMARY KEY (id);

-- a social user is a social network account that the authority has verified as A) yes, it is that person B) that person has the credential
CREATE TABLE social_user (
 id BIGSERIAL,
 social_login nvarchar(512) NOT NULL DEFAULT 'NULL',
 metadata jsonb,
 name nvarchar(512),
 bio text,
 network varchar(512),
 subnetwork varchar(512)
);

ALTER TABLE social_user ADD CONSTRAINT social_user_pkey PRIMARY KEY (id);

-- social users can have many verifications, and verifications can have many social users, thus: 
CREATE TABLE verification_social_user (
 id BIGSERIAL,
 id_verification int,
 id_social_user tinyint
);

ALTER TABLE verification_social_user ADD CONSTRAINT verification_social_user_pkey PRIMARY KEY (id);

ALTER TABLE verification ADD CONSTRAINT verification_id_authority_fkey FOREIGN KEY (id_authority) REFERENCES authority(id);
ALTER TABLE verification_social_user ADD CONSTRAINT verification_social_user_id_verification_fkey FOREIGN KEY (id_verification) REFERENCES verification(id);
ALTER TABLE verification_social_user ADD CONSTRAINT verification_social_user_id_social_user_fkey FOREIGN KEY (id_social_user) REFERENCES social_user(id);