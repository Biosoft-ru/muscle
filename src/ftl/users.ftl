DELETE FROM users WHERE user_name = 'Administrator';
DELETE FROM user_roles WHERE user_name = 'Administrator';

INSERT INTO users( user_name, user_pass ) VALUES( 'Administrator', '12345' );
INSERT INTO user_roles VALUES( 'Administrator', 'Administrator' );
INSERT INTO user_roles VALUES( 'Administrator', 'SystemDeveloper' );
INSERT INTO user_roles VALUES( 'Administrator', 'Annotator' );

DELETE FROM users WHERE user_name = 'Annotator';
DELETE FROM user_roles WHERE user_name = 'Annotator';

INSERT INTO users( user_name, user_pass ) VALUES( 'Annotator', '12345' );
INSERT INTO user_roles VALUES( 'Annotator', 'Annotator' );
