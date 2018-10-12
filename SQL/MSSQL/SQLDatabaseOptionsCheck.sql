DECLARE @optTemp TABLE (OptId INT, OptName VARCHAR(MAX), IsEnabled BIT);

-- https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/configure-the-user-options-server-configuration-option
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (1,     'DISABLE_DEF_CNST_CHK',    NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (2,     'IMPLICIT_TRANSACTIONS',   NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (4,     'CURSOR_CLOSE_ON_COMMIT',  NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (8,     'ANSI_WARNINGS',           NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (16,    'ANSI_PADDING',            NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (32,    'ANSI_NULLS',              NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (64,    'ARITHABORT',              NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (128,   'ARITHIGNORE',             NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (256,   'QUOTED_IDENTIFIER',       NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (512,   'NOCOUNT',                 NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (1024,  'ANSI_NULL_DFLT_ON',       NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (2048,  'ANSI_NULL_DFLT_OFF',      NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (4096,  'CONCAT_NULL_YIELDS_NULL', NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (8192,  'NUMERIC_ROUNDABORT',      NULL );
INSERT INTO @optTemp (OptId, OptName, IsEnabled) VALUES (16384, 'XACT_ABORT',              NULL );

DECLARE @options INT;
SELECT @options = @@OPTIONS;

DECLARE @optNum INT;
SET @optNum = 1;

WHILE @optNum <= 16384
BEGIN
	DECLARE @enabled BIT;
	SET @enabled = 'FALSE';
	IF ( (@optNum & @options) = @optNum )
		SET @enabled = 'TRUE';

	UPDATE @optTemp SET IsEnabled = @enabled WHERE @optNum = OptId;
	SET @optNum = @optNum*2;
END

SELECT OptId, OptName, IsEnabled FROM @optTemp;
