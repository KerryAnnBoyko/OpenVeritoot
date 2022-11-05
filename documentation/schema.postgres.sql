-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE user (
  id int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  login varchar(128) NOT NULL ,
  display_name varchar(128) NOT NULL ,
  profile varchar(512) ,
  location varchar(255) ,
  link varchar(512) ,
  account_created timestamp(3) ,
  last_accessed timestamp(3) ,
  icon varchar(512) ,
  masthead varchar(512) ,
  active varchar(16) ,
  suspended_until timestamp(3) ,
  contact_email varchar(512) ,
  contact_phone_text varchar(512) , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE post (
  id int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  content varchar(512) NOT NULL ,
  first_posted timestamp(3) NOT NULL ,
  last_edited timestamp(3) NOT NULL ,
  client_type smallint ,
  id_user_author int ,
  id_post_is_reply_to int ,
  id_post_quotes int ,
  id_post_reposts int , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE follows (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  id_user_follower int ,
  id_user_followee int , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE verification (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  id_authority_verifying_authority int ,
  verification_name varchar(52) ,
  comments text ,
  verification_description text , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE conduct_report (
  id int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  reason_for_report varchar(255) ,
  additional_material text ,
  comments text ,
  resolution text ,
  id_tweets_suspect_tweet int NOT NULL ,
  id_user_reporter int , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE conversations (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  conversation_mongo_id varchar(128) ,
  id_user_party_one int ,
  id_user_party_two int , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE blocks (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  id_user_blocker int ,
  id_user_blockee int , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE authority (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  organization_name varchar(512) ,
  organization_description text ,
  authorized_on timestamp(3) ,
  authorized_active_until timestamp(3) ,
  authorization_suspended varchar(16) , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE user_authority (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  id_authorities int ,
  id_user int , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE user_verification (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  id_verification int ,
  id_user int , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE post_tags (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  id_tags char(36) ,
  id_post int NOT NULL , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE tags (
  id char(36) GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  tag varchar(512) ,
  first_coined timestamp(3) NOT NULL , 
 PRIMARY KEY (id)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE post_mention (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1  INCREMENT BY 1) ,
  id_posts int NOT NULL ,
  id_user_mentioned int , 
 PRIMARY KEY (id)
);

ALTER TABLE post ADD FOREIGN KEY (id_user_author) REFERENCES user (id);
				
ALTER TABLE post ADD FOREIGN KEY (id_post_is_reply_to) REFERENCES post (id);
				
ALTER TABLE post ADD FOREIGN KEY (id_post_quotes) REFERENCES post (id);
				
ALTER TABLE post ADD FOREIGN KEY (id_post_reposts) REFERENCES post (id);
				
ALTER TABLE follows ADD FOREIGN KEY (id_user_follower) REFERENCES user (id);
				
ALTER TABLE follows ADD FOREIGN KEY (id_user_followee) REFERENCES user (id);
				
ALTER TABLE verification ADD FOREIGN KEY (id_authority_verifying_authority) REFERENCES authority (id);
				
ALTER TABLE conduct_report ADD FOREIGN KEY (id_tweets_suspect_tweet) REFERENCES post (id);
				
ALTER TABLE conduct_report ADD FOREIGN KEY (id_user_reporter) REFERENCES user (id);
				
ALTER TABLE conversations ADD FOREIGN KEY (id_user_party_one) REFERENCES user (id);
				
ALTER TABLE conversations ADD FOREIGN KEY (id_user_party_two) REFERENCES user (id);
				
ALTER TABLE blocks ADD FOREIGN KEY (id_user_blocker) REFERENCES user (id);
				
ALTER TABLE blocks ADD FOREIGN KEY (id_user_blockee) REFERENCES user (id);
				
ALTER TABLE user_authority ADD FOREIGN KEY (id_authorities) REFERENCES authority (id);
				
ALTER TABLE user_authority ADD FOREIGN KEY (id_user) REFERENCES user (id);
				
ALTER TABLE user_verification ADD FOREIGN KEY (id_verification) REFERENCES verification (id);
				
ALTER TABLE user_verification ADD FOREIGN KEY (id_user) REFERENCES user (id);
				
ALTER TABLE post_tags ADD FOREIGN KEY (id_tags) REFERENCES tags (id);
				
ALTER TABLE post_tags ADD FOREIGN KEY (id_post) REFERENCES post (id);
				
ALTER TABLE post_mention ADD FOREIGN KEY (id_posts) REFERENCES post (id);
				
ALTER TABLE post_mention ADD FOREIGN KEY (id_user_mentioned) REFERENCES user (id);