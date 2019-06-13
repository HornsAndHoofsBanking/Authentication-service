USE banking;

INSERT INTO oauth_client_details (client_id, client_secret, web_server_redirect_uri, scope, access_token_validity, refresh_token_validity, resource_ids, authorized_grant_types, additional_information) VALUES
 ('payment', '{bcrypt}$2a$10$125ZjRauXNt8SKvMc7nSuOrtl87wwBLTEct.BJwk2rnRuZfqomcSW', 'http://localhost:8080/code', 'TRANSFER,PAYMENT', '900', '10000', 'transfer,payment', 'authorization_code,password,refresh_token,implicit', '{}');

 INSERT INTO permission (name) VALUES
 ('create_profile'),
 ('read_profile'),
 ('update_profile'),
 ('delete_profile');

INSERT INTO role (name) VALUES
		('ROLE_admin'),('ROLE_operator');

INSERT INTO permission_role (permission_id, role_id) VALUES
     (1,1),
     (2,1),
     (3,1),
     (4,1),
     (2,2),
     (3,2);

INSERT INTO user (id, username, password, email, enabled, account_non_expired, credentials_non_expired, account_non_locked) VALUES
('1', 'john','{bcrypt}$2a$10$BulRsLcYJNU/kyifIL5Kc.039oRjkYGB7ODZ3Q4KlqvckBQlO6bP6', 'john@mail.com', '1', '1', '1', '1'),
('2', 'susan', '{bcrypt}$2a$10$BulRsLcYJNU/kyifIL5Kc.039oRjkYGB7ODZ3Q4KlqvckBQlO6bP6','susan@mail.com', '1', '1', '1', '1');

INSERT INTO role_user (role_id, user_id) VALUES
    (1, 1),
    (2, 2);