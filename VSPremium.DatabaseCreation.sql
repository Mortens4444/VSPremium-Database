USE [master]
GO
/****** Object:  Database [VSPremium]    Script Date: 11/16/2011 08:14:29 ******/
CREATE DATABASE [VSPremium] ON  PRIMARY 
( NAME = N'VSPremium', FILENAME = N'D:\SQL\VSPremium.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VSPremium_log', FILENAME = N'D:\SQL\VSPremium_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VSPremium] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VSPremium].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VSPremium] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [VSPremium] SET ANSI_NULLS OFF
GO
ALTER DATABASE [VSPremium] SET ANSI_PADDING OFF
GO
ALTER DATABASE [VSPremium] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [VSPremium] SET ARITHABORT OFF
GO
ALTER DATABASE [VSPremium] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [VSPremium] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [VSPremium] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [VSPremium] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [VSPremium] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [VSPremium] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [VSPremium] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [VSPremium] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [VSPremium] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [VSPremium] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [VSPremium] SET  DISABLE_BROKER
GO
ALTER DATABASE [VSPremium] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [VSPremium] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [VSPremium] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [VSPremium] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [VSPremium] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [VSPremium] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [VSPremium] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [VSPremium] SET  READ_WRITE
GO
ALTER DATABASE [VSPremium] SET RECOVERY SIMPLE
GO
ALTER DATABASE [VSPremium] SET  MULTI_USER
GO
ALTER DATABASE [VSPremium] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [VSPremium] SET DB_CHAINING OFF
GO
USE [VSPremium]
GO
/****** Object:  StoredProcedure [dbo].[SetDatabaseToMultiuser]    Script Date: 11/16/2011 08:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetDatabaseToMultiuser]
AS
BEGIN
	SET NOCOUNT ON;

	IF (SELECT user_access_desc FROM SYS.DATABASES WHERE name = 'VSPremium') = 'SINGLE_USER'
	BEGIN
		ALTER DATABASE VSPremium SET MULTI_USER WITH ROLLBACK IMMEDIATE
	END
END
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ip_or_hostname] [nvarchar](50) NULL,
	[mac_address] [nvarchar](12) NULL,
	[rvs_user_name] [nvarchar](50) NULL,
	[rvs_password] [nvarchar](200) NULL,
	[displayed_name] [nvarchar](50) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Servers_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](200) NULL,
	[full_name] [nvarchar](100) NULL,
	[barcode] [nvarchar](50) NULL,
	[other_information] [nvarchar](max) NULL,
	[logon_priority_level] [int] NULL,
	[needed_logon_priority_level] [int] NULL,
	[active] [bit] NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[name] [nvarchar](50) NOT NULL,
	[type_id] [tinyint] NOT NULL,
	[value] [nvarchar](50) NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[operation] [nvarchar](50) NULL,
	[language_element_id] [bigint] NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[RestoreDatabaseBackup]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RestoreDatabaseBackup]
	@path NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;

	ALTER DATABASE VSPremium SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE VSPremium
	
	RESTORE FILELISTONLY
	FROM DISK = @path
END
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[parent_group_id] [bigint] NOT NULL,
	[group_name] [nvarchar](50) NULL,
	[other_information] [nvarchar](max) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[event_code] [nvarchar](50) NOT NULL,
	[language_element_id] [bigint] NOT NULL,
	[event_description] [nvarchar](max) NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_EventTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CreateDatabaseBackup]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateDatabaseBackup]
	@path NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	
	BACKUP DATABASE VSPremium
	TO DISK = @path
		WITH FORMAT,
			MEDIANAME = 'VSPremium',
			NAME = 'Full backup of VSPremium database';
END
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[is_default] [bit] NULL,
	[address] [nvarchar](200) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddLocalhost]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLocalhost]
	@ip_or_hostname NVARCHAR(50),
	@mac_address NVARCHAR(12),
	@displayed_name NVARCHAR(50),
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
		IF EXISTS (SELECT ID FROM [Servers] WHERE ID = 1)
		BEGIN
			UPDATE [Servers] SET ip_or_hostname = @ip_or_hostname, mac_address = @mac_address, displayed_name = @displayed_name, chk = @chk WHERE ID = 1;
		END
	ELSE BEGIN
		SET IDENTITY_INSERT [Servers] ON;
		INSERT INTO [Servers] (ID, ip_or_hostname, mac_address, displayed_name, chk) VALUES (1, @ip_or_hostname, @mac_address, @displayed_name, @chk)
		SET IDENTITY_INSERT [Servers] OFF;
	END
	COMMIT;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUserExistance]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckUserExistance]
	@username NVARCHAR(50),
	@password NVARCHAR(200) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @password IS NOT NULL
		SELECT * FROM [Users] WHERE Users.username = @username AND Users.password = @password
	ELSE
		SELECT * FROM [Users] WHERE Users.username = @username
END
GO
/****** Object:  Table [dbo].[Cameras]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cameras](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [bigint] NULL,
	[recorder_index] [bigint] NULL,
	[camera_name] [nvarchar](50) NULL,
	[camera_guid] [nvarchar](50) NULL,
	[rvs_user_name] [nvarchar](50) NULL,
	[rvs_password] [nvarchar](200) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[width] [int] NULL,
	[height] [int] NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Cameras] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailAddresses]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailAddresses](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[is_default] [bit] NULL,
	[e_mail] [nvarchar](50) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetEventTypes]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEventTypes]
	@status_code NVARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	if (@status_code IS NULL)
		SELECT * FROM [EventTypes]
	ELSE
		SELECT * FROM [EventTypes] WHERE event_code = @status_code
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupWithGroupID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupWithGroupID]
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Groups] WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupsOrderByGroupNameWithParentGroupID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupsOrderByGroupNameWithParentGroupID]
	@parent_group_id BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Groups] WHERE parent_group_id = @parent_group_id ORDER BY group_name
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupsOrderByGroupName]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mortens
-- Create date: 2011.09.05
-- Description:	Get groups from Groups table order by group names
-- =============================================
CREATE PROCEDURE [dbo].[GetGroupsOrderByGroupName]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Groups] ORDER BY group_name
END
GO
/****** Object:  StoredProcedure [dbo].[GetOptions]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOptions]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Options] ORDER BY name
END
GO
/****** Object:  StoredProcedure [dbo].[GetOperationWithOperationID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOperationWithOperationID]
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Operations] WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetOperations]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOperations]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Operations] ORDER BY operation
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserCount]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserCount]
	@count BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	SET @count = (SELECT COUNT_BIG(ID) FROM [Users])
END
GO
/****** Object:  StoredProcedure [dbo].[GetServerWithIDFromServers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetServerWithIDFromServers]
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Servers] WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetServersOrderByDisplayedName]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mortens
-- Create date: 2011.07.01
-- Description:	Get servers from Servers table order by displayed names
-- =============================================
CREATE PROCEDURE [dbo].[GetServersOrderByDisplayedName]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Servers] ORDER BY displayed_name
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserWithUserID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserWithUserID]
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Users] WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersOrderByUserName]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsersOrderByUserName]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Users] ORDER BY username
END
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[is_default] [bit] NULL,
	[label] [nvarchar](50) NULL,
	[picture] [image] NULL,
	[size_mode] [int] NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertGroupToGroups]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertGroupToGroups]
	@parent_group_id BIGINT,
	@group_name NVARCHAR(50) = NULL,
	@other_information NVARCHAR(MAX) = NULL,
	@chk BIGINT,
	@result BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Groups] (parent_group_id, group_name, other_information, chk) VALUES (@parent_group_id, @group_name, @other_information, @chk)
	SET @result = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEventTypesToEventTypes]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEventTypesToEventTypes]
AS
BEGIN
	SET NOCOUNT ON;
	SET IDENTITY_INSERT [EventTypes] ON;

	--IF OBJECT_ID('EventTypes') IS NOT NULL
	--	DELETE FROM [EventTypes];

	DECLARE @event_code NVARCHAR(50);
	DECLARE @language_element_id BIGINT;
	DECLARE @event_description NVARCHAR(MAX);
	DECLARE @chk BIGINT;

	DECLARE @ID BIGINT;
	SET @ID = 1;
	WHILE @ID < 62 BEGIN
		IF (@ID = 1) BEGIN
			SET @event_code = 'C1000';
			SET @language_element_id = 101;
			SET @event_description = 'Everything is Ok, with video server';
			SET @chk = 120259084344;
		END
		ELSE IF (@ID = 2) BEGIN
			SET @event_code = 'C1001';
			SET @language_element_id = 102;
			SET @event_description = 'Number of cameras changed';
			SET @chk = 498216206390;
		END
		ELSE IF (@ID = 3) BEGIN
			SET @event_code = 'W1500';
			SET @language_element_id = 103;
			SET @event_description = 'CPU usage is over 50%';
			SET @chk = 365072220178;
		END
		ELSE IF (@ID = 4) BEGIN
			SET @event_code = 'W1750';
			SET @language_element_id = 104;
			SET @event_description = 'CPU usage is over 75%';
			SET @chk = 365072220178;
		END
		ELSE IF (@ID = 5) BEGIN
			SET @event_code = 'W1501';
			SET @language_element_id = 105;
			SET @event_description = 'CPU usage is over 50%, with time syncronization error';
			SET @chk = 47244640276;
		END
		ELSE IF (@ID = 6) BEGIN
			SET @event_code = 'W1751';
			SET @language_element_id = 106;
			SET @event_description = 'CPU usage is over 75%, with time syncronization error';
			SET @chk = 47244640276;
		END
		ELSE IF (@ID = 7) BEGIN
			SET @event_code = 'W2000';
			SET @language_element_id = 107;
			SET @event_description = 'No recording';
			SET @chk = 519691042883;
		END
		ELSE IF (@ID = 8) BEGIN
			SET @event_code = 'RVSS3001';
			SET @language_element_id = 108;
			SET @event_description = 'Wrong camera name';
			SET @chk = 287762808859;
		END
		ELSE IF (@ID = 9) BEGIN
			SET @event_code = 'RVSS3002';
			SET @language_element_id = 109;
			SET @event_description = 'No output file for camera';
			SET @chk = 382252089349;
		END
		ELSE IF (@ID = 10) BEGIN
			SET @event_code = 'RVSS3003';
			SET @language_element_id = 110;
			SET @event_description = 'Virtual memory is too low';
			SET @chk = 257698037841;
		END
		ELSE IF (@ID = 11) BEGIN
			SET @event_code = 'RVSS3004';
			SET @language_element_id = 111;
			SET @event_description = 'Connection has been lost';
			SET @chk = 244813135981;
		END
		ELSE IF (@ID = 12) BEGIN
			SET @event_code = 'RVSS3012';
			SET @language_element_id = 112;
			SET @event_description = 'Wrong username or password';
			SET @chk = 94489280598;
		END
		ELSE IF (@ID = 13) BEGIN
			SET @event_code = 'RVSS3018';
			SET @language_element_id = 113;
			SET @event_description = 'Network (RPC) error';
			SET @chk = 85899345999;
		END
		ELSE IF (@ID = 14) BEGIN
			SET @event_code = 'RVSS3019';
			SET @language_element_id = 114;
			SET @event_description = 'Connection failed';
			SET @chk = 481036337241;
		END
		ELSE IF (@ID = 15) BEGIN
			SET @event_code = 'RVSS3022';
			SET @language_element_id = 115;
			SET @event_description = 'Camera check is not allowed';
			SET @chk = 90194313321;
		END
		ELSE IF (@ID = 16) BEGIN
			SET @event_code = 'RVSS3026';
			SET @language_element_id = 116;
			SET @event_description = 'Security permission error / Invalid version';
			SET @chk = 47244640346;
		END
		ELSE IF (@ID = 17) BEGIN
			SET @event_code = 'RVSS4000';
			SET @language_element_id = 117;
			SET @event_description = 'Connection timed out';
			SET @chk = 519691042915;
		END
		ELSE IF (@ID = 18) BEGIN
			SET @event_code = 'RS3003';
			SET @language_element_id = 118;
			SET @event_description = 'Video Recorder is not available';
			SET @chk = 21474836554;
		END
		ELSE IF (@ID = 19) BEGIN
			SET @event_code = 'RS-1';
			SET @language_element_id = 119;
			SET @event_description = 'Video Recorder is outdated';
			SET @chk = 506806140951;
		END
		ELSE IF (@ID = 20) BEGIN
			SET @event_code = 'RVSS-29765';
			SET @language_element_id = 120;
			SET @event_description = 'Unknown state (TimeTraveller)';
			SET @chk = 377957122101;
		END
		ELSE IF (@ID = 21) BEGIN
			SET @event_code = 'RVSS-14';
			SET @language_element_id = 121;
			SET @event_description = 'Unknown state (DuplicatedCamera)';
			SET @chk = 270582939668;
		END
		ELSE IF (@ID = 22) BEGIN
			SET @event_code = 'RVSS-12';
			SET @language_element_id = 122;
			SET @event_description = 'Unknown state';
			SET @chk = 128849018904;
		END
		ELSE IF (@ID = 23) BEGIN
			SET @event_code = 'RVSS-6';
			SET @language_element_id = 123;
			SET @event_description = 'RPC not connected';
			SET @chk = 463856467979;
		END
		ELSE IF (@ID = 24) BEGIN
			SET @event_code = 'RVSS-5';
			SET @language_element_id = 124;
			SET @event_description = 'RPC conection error';
			SET @chk = 64424509537;
		END
		ELSE IF (@ID = 25) BEGIN
			SET @event_code = 'RVSS-4';
			SET @language_element_id = 125;
			SET @event_description = 'Wrong RPC parameters';
			SET @chk = 468151435355;
		END
		ELSE IF (@ID = 26) BEGIN
			SET @event_code = 'RVSS-3';
			SET @language_element_id = 126;
			SET @event_description = 'Invalid RPC connection';
			SET @chk = 8589934637;
		END
		ELSE IF (@ID = 27) BEGIN
			SET @event_code = 'RVSS-2';
			SET @language_element_id = 127;
			SET @event_description = 'RPC exception occured';
			SET @chk = 502511173634;
		END
		ELSE IF (@ID = 28) BEGIN
			SET @event_code = 'RVSS-1';
			SET @language_element_id = 128;
			SET @event_description = 'Unsuccessful RCP';
			SET @chk = 395136991281;
		END
		ELSE IF (@ID = 29) BEGIN
			SET @event_code = 'RVSS3005';
			SET @language_element_id = 129;
			SET @event_description = 'Invalid funcion call';
			SET @chk = 420906795126;
		END
		ELSE IF (@ID = 30) BEGIN
			SET @event_code = 'RVSS3006';
			SET @language_element_id = 130;
			SET @event_description = 'File open error';
			SET @chk = 287762808891;
		END
		ELSE IF (@ID = 31) BEGIN
			SET @event_code = 'RVSS3007';
			SET @language_element_id = 131;
			SET @event_description = 'Invalid file pointer';
			SET @chk = 188978561075;
		END
		ELSE IF (@ID = 32) BEGIN
			SET @event_code = 'RVSS3008';
			SET @language_element_id = 132;
			SET @event_description = 'End of file';
			SET @chk = 377957122084;
		END
		ELSE IF (@ID = 33) BEGIN
			SET @event_code = 'RVSS3009';
			SET @language_element_id = 133;
			SET @event_description = 'Hardware error';
			SET @chk = 133143986244;
		END
		ELSE IF (@ID = 34) BEGIN
			SET @event_code = 'RVSS3010';
			SET @language_element_id = 134;
			SET @event_description = 'Invalid connection';
			SET @chk = 403726925836;
		END
		ELSE IF (@ID = 35) BEGIN
			SET @event_code = 'RVSS3011';
			SET @language_element_id = 135;
			SET @event_description = 'Invalid camera index';
			SET @chk = 180388626472;
		END
		ELSE IF (@ID = 36) BEGIN
			SET @event_code = 'RVSS3013';
			SET @language_element_id = 136;
			SET @event_description = 'Not implemented';
			SET @chk = 373662154874;
		END
		ELSE IF (@ID = 37) BEGIN
			SET @event_code = 'RVSS3014';
			SET @language_element_id = 137;
			SET @event_description = 'End of frame';
			SET @chk = 223338299454;
		END
		ELSE IF (@ID = 38) BEGIN
			SET @event_code = 'RVSS3015';
			SET @language_element_id = 138;
			SET @event_description = 'End of timeline';
			SET @chk = 283467841583;
		END
		ELSE IF (@ID = 39) BEGIN
			SET @event_code = 'RVSS3016';
			SET @language_element_id = 139;
			SET @event_description = 'Invalid allocation';
			SET @chk = 356482285569;
		END
		ELSE IF (@ID = 40) BEGIN
			SET @event_code = 'RVSS3017';
			SET @language_element_id = 140;
			SET @event_description = 'User interrupt';
			SET @chk = 73014444117;
		END
		ELSE IF (@ID = 41) BEGIN
			SET @event_code = 'RVSS3020';
			SET @language_element_id = 141;
			SET @event_description = 'Invalid server protocol version';
			SET @chk = 124554051635;
		END
		ELSE IF (@ID = 42) BEGIN
			SET @event_code = 'RVSS3021';
			SET @language_element_id = 142;
			SET @event_description = 'Not implemented';
			SET @chk = 373662154875;
		END
		ELSE IF (@ID = 43) BEGIN
			SET @event_code = 'RVSS3023';
			SET @language_element_id = 143;
			SET @event_description = 'Invalid track';
			SET @chk = 176093659138;
		END
		ELSE IF (@ID = 44) BEGIN
			SET @event_code = 'RVSS3024';
			SET @language_element_id = 144;
			SET @event_description = 'Invalid call';
			SET @chk = 214748364915;
		END
		ELSE IF (@ID = 45) BEGIN
			SET @event_code = 'RVSS3025';
			SET @language_element_id = 145;
			SET @event_description = 'Unsuccessful call';
			SET @chk = 506806140992;
		END
		ELSE IF (@ID = 46) BEGIN
			SET @event_code = 'W1001';
			SET @language_element_id = 146;
			SET @event_description = 'Time syncronization error';
			SET @chk = 103079215147;
		END
		ELSE IF (@ID = 47) BEGIN
			SET @event_code = 'TC001';
			SET @language_element_id = 147;
			SET @event_description = 'Time changed on local machine';
			SET @chk = 309237645315;
		END
		ELSE IF (@ID = 48) BEGIN
			SET @event_code = 'TC002';
			SET @language_element_id = 148;
			SET @event_description = 'Time changed on machine';
			SET @chk = 171798691885;
		END
		ELSE IF (@ID = 49) BEGIN
			SET @event_code = 'TC003';
			SET @language_element_id = 149;
			SET @event_description = 'Daylight saving changed on local machine';
			SET @chk = 459561500689;
		END
		ELSE IF (@ID = 50) BEGIN
			SET @event_code = 'TC004';
			SET @language_element_id = 150;
			SET @event_description = 'Daylight saving changed on machine';
			SET @chk = 283467841650;
		END
		ELSE IF (@ID = 51) BEGIN
			SET @event_code = 'U0001';
			SET @language_element_id = 151;
			SET @event_description = 'Unknown event occured';
			SET @chk = 330712481895;
		END
		ELSE IF (@ID = 52) BEGIN
			SET @event_code = 'RVSSCOK';
			SET @language_element_id = 152;
			SET @event_description = 'Camera is OK';
			SET @chk = 4294967382;
		END
		ELSE IF (@ID = 53) BEGIN
			SET @event_code = 'RVSSCA1';
			SET @language_element_id = 153;
			SET @event_description = 'Camera is in alarm state';
			SET @chk = 287762808935;
		END
		ELSE IF (@ID = 54) BEGIN
			SET @event_code = 'RVSSCE1';
			SET @language_element_id = 154;
			SET @event_description = 'Camera is in error state';
			SET @chk = 274877907051;
		END
		ELSE IF (@ID = 55) BEGIN
			SET @event_code = 'RVSSCSL';
			SET @language_element_id = 155;
			SET @event_description = 'Camera signal lost';
			SET @chk = 335007449094;
		END
		ELSE IF (@ID = 56) BEGIN
			SET @event_code = 'RVSSCNC';
			SET @language_element_id = 156;
			SET @event_description = 'Camera name changed';
			SET @chk = 206158430229;
		END
		ELSE IF (@ID = 57) BEGIN
			SET @event_code = 'RVSSCGC';
			SET @language_element_id = 157;
			SET @event_description = 'Camera GUID changed';
			SET @chk = 158913789969;
		END
		ELSE IF (@ID = 58) BEGIN
			SET @event_code = 'RVSSCCA';
			SET @language_element_id = 158;
			SET @event_description = 'Camera added to video server';
			SET @chk = 412316860448;
		END
		ELSE IF (@ID = 59) BEGIN
			SET @event_code = 'RVSSCNR';
			SET @language_element_id = 159;
			SET @event_description = 'No recording';
			SET @chk = 231928234034;
		END
		ELSE IF (@ID = 60) BEGIN
			SET @event_code = 'RVSSCNA';
			SET @language_element_id = 160;
			SET @event_description = 'Camera not reachable';
			SET @chk = 493921239091;
		END
		ELSE IF (@ID = 61) BEGIN
			SET @event_code = 'NE001';
			SET @language_element_id = 161;
			SET @event_description = 'Network error';
			SET @chk = 395136991315;
		END
		/*ELSE IF (@ID = 6) BEGIN
			SET @event_code = '';
			SET @language_element_id = 16;
			SET @event_description = '';
			SET @chk = ;
		END*/
		BEGIN TRANSACTION;
		IF EXISTS (SELECT ID FROM [EventTypes] WHERE ID = @ID) BEGIN
			UPDATE [EventTypes] SET event_code = @event_code, language_element_id = @language_element_id, event_description = @event_description, chk = @chk WHERE ID = @ID;
		END
		ELSE BEGIN
			INSERT INTO [EventTypes] (ID, event_code, language_element_id, event_description, chk) VALUES (@ID, @event_code, @language_element_id, @event_description, @chk);
		END
		COMMIT;

		SET @ID = @ID + 1;
	END
END
GO
/****** Object:  Table [dbo].[LicensePlateNumbers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicensePlateNumbers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[license_plate_number] [nvarchar](50) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_LicensePlateNumbers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertUserToUsers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserToUsers]
	@username NVARCHAR(50) = NULL,
	@password NVARCHAR(200) = NULL,
	@full_name NVARCHAR(100) = NULL,
	@barcode NVARCHAR(50) = NULL,
	@other_information NVARCHAR(MAX) = NULL,
	@logon_priority_level INT = NULL,
	@needed_logon_priority_level INT = NULL,
	@active BIT = NULL,
	@chk BIGINT,
	@result BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Users] (username, password, full_name, barcode, other_information, logon_priority_level, needed_logon_priority_level, active, chk) VALUES (@username, @password, @full_name, @barcode, @other_information, @logon_priority_level, @needed_logon_priority_level, @active, @chk)
	SET @result = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserWithUserIDInUsers_2]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserWithUserIDInUsers_2]
	@full_name NVARCHAR(100),
	@password NVARCHAR(200),
	@barcode NVARCHAR(50),
	@logon_priority_level INT,
	@needed_logon_priority_level INT,
	@active BIT,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Users] SET full_name = @full_name, barcode = @barcode, password = @password, logon_priority_level = @logon_priority_level, needed_logon_priority_level = @needed_logon_priority_level, active = @active, chk = @chk WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserWithUserIDInUsers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserWithUserIDInUsers]
	@full_name NVARCHAR(100) = NULL,
	@other_information NVARCHAR(MAX) = NULL,
	@password NVARCHAR(200) = NULL,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Users] SET full_name = @full_name, other_information = @other_information, password  = @password, chk = @chk WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateServerWithIDInServers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateServerWithIDInServers]
	@ip_or_hostname NVARCHAR(50) = NULL,
	@mac_address NVARCHAR(12) = NULL,
	@rvs_user_name NVARCHAR(50) = NULL,
	@rvs_password NVARCHAR(200) = NULL,
	@displayed_name NVARCHAR(50) = NULL,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Servers] SET ip_or_hostname = @ip_or_hostname, mac_address = @mac_address, rvs_user_name = @rvs_user_name, rvs_password = @rvs_password, displayed_name = @displayed_name, chk = @chk WHERE ID = @ID;
END
GO
/****** Object:  Table [dbo].[TelephoneNumbers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelephoneNumbers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[is_default] [bit] NULL,
	[tel] [nvarchar](50) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_TelephoneNumbers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertServerToServersFull]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertServerToServersFull]
	@ID BIGINT = NULL,
	@ip_or_hostname NVARCHAR(50) = NULL,
	@mac_address NVARCHAR(12) = NULL,
	@rvs_user_name NVARCHAR(50) = NULL,
	@rvs_password NVARCHAR(200) = NULL,
	@displayed_name NVARCHAR(50) = NULL,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	IF @ID IS NULL 
		INSERT INTO [Servers] (ip_or_hostname, mac_address, rvs_user_name, rvs_password, displayed_name, chk) VALUES (@ip_or_hostname, @mac_address, @rvs_user_name, @rvs_password, @displayed_name, @chk)
	ELSE
		INSERT INTO [Servers] (ID, ip_or_hostname, mac_address, rvs_user_name, rvs_password, displayed_name, chk) VALUES (@ID, @ip_or_hostname, @mac_address, @rvs_user_name, @rvs_password, @displayed_name, @chk)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertServerToServers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertServerToServers]
	@ip_or_hostname NVARCHAR(50) = NULL,
	@mac_address NVARCHAR(12) = NULL,
	@rvs_user_name NVARCHAR(50) = NULL,
	@rvs_password NVARCHAR(200) = NULL,
	@displayed_name NVARCHAR(50) = NULL,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Servers] (ip_or_hostname, mac_address, rvs_user_name, rvs_password, displayed_name, chk) VALUES (@ip_or_hostname, @mac_address, @rvs_user_name, @rvs_password, @displayed_name, @chk)
END
GO
/****** Object:  Table [dbo].[UsersInGroups]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInGroups](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_UsersInGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[UpdateOptionWithNameInOptions]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOptionWithNameInOptions]
	@value NVARCHAR(50),
	@type_id TINYINT,
	@chk BIGINT,
	@name NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Options] SET value = @value, type_id = @type_id, chk = @chk WHERE name = @name
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateGroupWithIDInGroups]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGroupWithIDInGroups]
	@parent_group_id BIGINT,
	@group_name NVARCHAR(50) = NULL,
	@other_information NVARCHAR(MAX) = NULL,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Groups] SET parent_group_id = @parent_group_id, group_name = @group_name, other_information = @other_information, chk = @chk WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOptionsToOptions]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--@chk = PublicMembers.SqlCreateCheckSum("Options", @name, @type_id, @value);

/*
	@type_id values - PublicMembers.GetValue(string value, int type_id)
	
	0: bool
	1: int
	2: long
	3: string
	4: timespan
	5: datetime	
*/

CREATE PROCEDURE [dbo].[InsertOptionsToOptions]
AS
BEGIN
	SET NOCOUNT ON;

	IF OBJECT_ID('Options') IS NOT NULL
		DELETE FROM [Options];

	DECLARE @name NVARCHAR(50);
	DECLARE @type_id TINYINT;
	DECLARE @value NVARCHAR(50);
	DECLARE @chk BIGINT;
	DECLARE @ID INT;
	
	SET @ID = 1;
	WHILE @ID < 36 BEGIN
		IF (@ID = 1) BEGIN
			SET @name = 'UVNC_DSMPlugin';
			SET @type_id = 1;
			SET @value = '0';
			SET @chk = 472446402585;
		END
		ELSE IF (@ID = 2) BEGIN
			SET @name = 'UVNC_ColorDepth';
			SET @type_id = 1;
			SET @value = '0';
			SET @chk = 339302416475;
		END
		ELSE IF (@ID = 3) BEGIN
			SET @name = 'UVNC_ask_for_settings';
			SET @type_id = 0;
			SET @value = 'False';
			SET @chk = 30064771176;
		END
		ELSE IF (@ID = 4) BEGIN
			SET @name = 'Sender_Email_Address';
			SET @type_id = 3;
			SET @value = '';
			SET @chk = 201863463033;
		END
		ELSE IF (@ID = 5) BEGIN
			SET @name = 'SMTP_Server';
			SET @type_id = 3;
			SET @value = '';
			SET @chk = 330712481866;
		END
		ELSE IF (@ID = 6) BEGIN
			SET @name = 'SMTP_Server_Port';
			SET @type_id = 1;
			SET @value = '25';
			SET @chk = 34359738476;
		END
		ELSE IF (@ID = 7) BEGIN
			SET @name = 'SMTP_Server_Use_SSL';
			SET @type_id = 0;
			SET @value = 'False';
			SET @chk = 532575944746;
		END
		ELSE IF (@ID = 8) BEGIN
			SET @name = 'SMTP_Server_Authentication_Required';
			SET @type_id = 0;
			SET @value = 'False';
			SET @chk = 343597383680;
		END
		ELSE IF (@ID = 9) BEGIN
			SET @name = 'SMTP_Server_Username';
			SET @type_id = 3;
			SET @value = '';
			SET @chk = 154618822730;
		END
		ELSE IF (@ID = 10) BEGIN
			SET @name = 'SMTP_Server_Password';
			SET @type_id = 3;
			SET @value = '';
			SET @chk = 240518168671;
		END
		ELSE IF (@ID = 11) BEGIN
			SET @name = 'Email_Signature';
			SET @type_id = 3;
			SET @value = '';
			SET @chk = 335007449214;
		END
		ELSE IF (@ID = 12) BEGIN
			SET @name = 'Soundfile';
			SET @type_id = 3;
			SET @value = '';
			SET @chk = 133143986237;
		END
		ELSE IF (@ID = 13) BEGIN
			SET @name = 'Soundfile_Repetion';
			SET @type_id = 1;
			SET @value = '3';
			SET @chk = 304942678069;
		END
		ELSE IF (@ID = 14) BEGIN
			SET @name = 'Language_ID';
			SET @type_id = 3;
			SET @value = 'English_British';
			SET @chk = 17179869265;
		END
		ELSE IF (@ID = 15) BEGIN
			SET @name = 'CheckVideoServersCPUUsage';
			SET @type_id = 0;
			SET @value = 'True';
			SET @chk = 227633266725;
		END
		ELSE IF (@ID = 16) BEGIN
			SET @name = 'CheckServersAndCamerasSyncronization';
			SET @type_id = 0;
			SET @value = 'False';
			SET @chk = 476741369981;
		END
		ELSE IF (@ID = 17) BEGIN
			SET @name = 'TimeServerID';
			SET @type_id = 2;
			SET @value = '-1';
			SET @chk = 150323855428;
		END
		ELSE IF (@ID = 18) BEGIN
			SET @name = 'AllowedDifference';
			SET @type_id = 1;
			SET @value = '10';
			SET @chk = 4294967306;
		END
		ELSE IF (@ID = 19) BEGIN
			SET @name = 'AutomaticWakeOnLAN';
			SET @type_id = 0;
			SET @value = 'True';
			SET @chk = 433791696944;
		END
		ELSE IF (@ID = 20) BEGIN
			SET @name = 'System_Identifier';
			SET @type_id = 3;
			SET @value = '';
			SET @chk = 201863462929;
		END
		ELSE IF (@ID = 21) BEGIN
			SET @name = 'CheckStorageCapacity';
			SET @type_id = 0;
			SET @value = 'True';
			SET @chk = 158913790044;
		END
		ELSE IF (@ID = 22) BEGIN
			SET @name = 'AlertWhenACameraStorageCapacityLessThan';
			SET @type_id = 1;
			SET @value = '30';
			SET @chk = 416611827826;
		END
		ELSE IF (@ID = 23) BEGIN
			SET @name = 'AlertWhenACameraStorageCapacityMoreThan';
			SET @type_id = 1;
			SET @value = '90';
			SET @chk = 416611827812;
		END
		ELSE IF (@ID = 24) BEGIN
			SET @name = 'CheckLightValue';
			SET @type_id = 0;
			SET @value = 'True';
			SET @chk = 274877907009;
		END
		ELSE IF (@ID = 25) BEGIN
			SET @name = 'MinimumLight';
			SET @type_id = 1;
			SET @value = '55';
			SET @chk = 240518168661;
		END
		ELSE IF (@ID = 26) BEGIN
			SET @name = 'MaximumLight';
			SET @type_id = 1;
			SET @value = '200';
			SET @chk = 30064771142;
		END
		ELSE IF (@ID = 27) BEGIN
			SET @name = 'CheckMotionValue';
			SET @type_id = 0;
			SET @value = 'True';
			SET @chk = 17179869285;
		END
		ELSE IF (@ID = 28) BEGIN
			SET @name = 'MinimumMotion';
			SET @type_id = 1;
			SET @value = '0';
			SET @chk = 227633266696;
		END
		ELSE IF (@ID = 29) BEGIN
			SET @name = 'MaximumMotion';
			SET @type_id = 1;
			SET @value = '200';
			SET @chk = 55834574892;
		END
		ELSE IF (@ID = 30) BEGIN
			SET @name = 'MainForm_Width';
			SET @type_id = 1;
			SET @value = '884';
			SET @chk = 536870912040;
		END
		ELSE IF (@ID = 31) BEGIN
			SET @name = 'MainForm_Height';
			SET @type_id = 1;
			SET @value = '884';
			SET @chk = 455266533446;
		END
		ELSE IF (@ID = 32) BEGIN
			SET @name = 'MainForm_Location_X';
			SET @type_id = 1;
			SET @value = '73';
			SET @chk = 287762808922;
		END
		ELSE IF (@ID = 33) BEGIN
			SET @name = 'MainForm_Location_Y';
			SET @type_id = 1;
			SET @value = '71';
			SET @chk = 279172874331;
		END
		ELSE IF (@ID = 34) BEGIN
			SET @name = 'MainForm_Left_Panel_Width';
			SET @type_id = 1;
			SET @value = '200';
			SET @chk = 103079215142;
		END
		ELSE IF (@ID = 35) BEGIN
			SET @name = 'MainForm_LatestEventsToAllObjects_Panel_Height';
			SET @type_id = 1;
			SET @value = '175';
			SET @chk = 313532612620;
		END
		/*ELSE IF (@ID = ) BEGIN
			SET @name = '';
			SET @type_id = ;
			SET @value = '';
			SET @chk = 0;
		END*/
		BEGIN TRANSACTION;
		IF EXISTS (SELECT name FROM [Options] WHERE name = @name) BEGIN
			UPDATE [Options] SET type_id = @type_id, value = @value, chk = @chk WHERE name = @name;
		END
		ELSE BEGIN
			INSERT INTO [Options] (name, type_id, value, chk) VALUES (@name, @type_id, @value, @chk);
		END
		COMMIT;

		SET @ID = @ID + 1;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOperationsToOperations]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--@chk = PublicMembers.SqlCreateCheckSum("Operations", @ID, @operation, @languange_element_id);

CREATE PROCEDURE [dbo].[InsertOperationsToOperations]
AS
BEGIN
	SET NOCOUNT ON;
	SET IDENTITY_INSERT [Operations] ON;

	IF OBJECT_ID('Operations') IS NOT NULL
		DELETE FROM [Operations];

	DECLARE @languange_element_id INT
	DECLARE @operation NVARCHAR(50)
	DECLARE @chk BIGINT

	DECLARE @ID INT
	SET @ID = 1
	WHILE @ID < 38 BEGIN
		-- Video Server permissions
		IF (@ID = 1) BEGIN
			SET @operation = 'AddNewVideoServer'
			SET @languange_element_id = 1
			SET @chk = 382252089362
		END
		ELSE IF (@ID = 2) BEGIN
			SET @operation = 'EditVideoServer'
			SET @languange_element_id = 2
			SET @chk = 85899346046
		END
		ELSE IF (@ID = 3) BEGIN
			SET @operation = 'DeleteVideoServer'
			SET @languange_element_id = 3
			SET @chk = 416611827726
		END
		ELSE IF (@ID = 4) BEGIN
			SET @operation = 'ServerProperties'
			SET @languange_element_id = 4
			SET @chk = 493921239125
		END
		ELSE IF (@ID = 21) BEGIN
			SET @operation = 'ExportVideoServers'
			SET @languange_element_id = 21
			SET @chk = 236223201334
		END
		ELSE IF (@ID = 22) BEGIN
			SET @operation = 'ImportVideoServers'
			SET @languange_element_id = 22
			SET @chk = 253403070499
		END
		-- Group permissions
		ELSE IF (@ID = 5) BEGIN
			SET @operation = 'AddNewGroup'
			SET @languange_element_id = 5
			SET @chk = 94489280630
		END
		ELSE IF (@ID = 6) BEGIN
			SET @operation = 'EditGroup'
			SET @languange_element_id = 6
			SET @chk = 390842023962
		END
		ELSE IF (@ID = 7) BEGIN
			SET @operation = 'DeleteGroup'
			SET @languange_element_id = 7
			SET @chk = 197568495722
		END
		ELSE IF (@ID = 8) BEGIN
			SET @operation = 'OpenGroupAndUserManagement'
			SET @languange_element_id = 8
			SET @chk = 261993005117
		END
		-- User permissions
		ELSE IF (@ID = 9) BEGIN
			SET @operation = 'AddNewUser'
			SET @languange_element_id = 9
			SET @chk = 176093659175
		END
		ELSE IF (@ID = 10) BEGIN
			SET @operation = 'EditUser'
			SET @languange_element_id = 10
			SET @chk = 343597383807
		END
		ELSE IF (@ID = 11) BEGIN
			SET @operation = 'DeleteUser'
			SET @languange_element_id = 11
			SET @chk = 137438953482
		END
		ELSE IF (@ID = 12) BEGIN
			SET @operation = 'OpenProfile'
			SET @languange_element_id = 12
			SET @chk = 369367187467
		END
		ELSE IF (@ID = 13) BEGIN
			SET @operation = 'SaveProfile'
			SET @languange_element_id = 13
			SET @chk = 377957122064
		END
		ELSE IF (@ID = 14) BEGIN
			SET @operation = 'AddOrRemoveAddress'
			SET @languange_element_id = 14
			SET @chk = 73014444095
		END
		ELSE IF (@ID = 15) BEGIN
			SET @operation = 'AddOrRemoveEmail'
			SET @languange_element_id = 15
			SET @chk = 481036337220
		END
		ELSE IF (@ID = 16) BEGIN
			SET @operation = 'AddOrRemovePhoneNumber'
			SET @languange_element_id = 16
			SET @chk = 223338299443
		END
		ELSE IF (@ID = 17) BEGIN
			SET @operation = 'AddOrRemovePicture'
			SET @languange_element_id = 17
			SET @chk = 115964117039
		END
		ELSE IF (@ID = 18) BEGIN
			SET @operation = 'AddOrRemoveLicensePlateNumber'
			SET @languange_element_id = 18
			SET @chk = 219043332223
		END
		ELSE IF (@ID = 19) BEGIN
			SET @operation = 'TestEmailAddress'
			SET @languange_element_id = 19
			SET @chk = 300647710792
		END
		-- Other permissions
		ELSE IF (@ID = 20) BEGIN
			SET @operation = 'Exit'
			SET @languange_element_id = 20
			SET @chk = 412316860514
		END
		ELSE IF (@ID = 23) BEGIN
			SET @operation = 'ShowCamera'
			SET @languange_element_id = 23
			SET @chk = 188978561044
		END
		ELSE IF (@ID = 24) BEGIN
			SET @operation = 'CheckingProperties'
			SET @languange_element_id = 24
			SET @chk = 154618822657
		END
		ELSE IF (@ID = 25) BEGIN
			SET @operation = 'EmailSettings'
			SET @languange_element_id = 25
			SET @chk = 64424509508
		END
		ELSE IF (@ID = 26) BEGIN
			SET @operation = 'AudioAlarmSettings'
			SET @languange_element_id = 26
			SET @chk = 210453397555
		END
		ELSE IF (@ID = 27) BEGIN
			SET @operation = 'VideoServerRemoteControl'
			SET @languange_element_id = 27
			SET @chk = 459561500766
		END
		ELSE IF (@ID = 28) BEGIN
			SET @operation = 'ChangeLanguage'
			SET @languange_element_id = 28
			SET @chk = 244813135887
		END
		ELSE IF (@ID = 29) BEGIN
			SET @operation = 'EmailValidationCheck'
			SET @languange_element_id = 29
			SET @chk = 416611827810
		END
		ELSE IF (@ID = 30) BEGIN
			SET @operation = 'SearchEmail'
			SET @languange_element_id = 30
			SET @chk = 369367187478
		END
		ELSE IF (@ID = 31) BEGIN
			SET @operation = 'SearchEvent'
			SET @languange_element_id = 31
			SET @chk = 322122547211
		END
		ELSE IF (@ID = 32) BEGIN
			SET @operation = 'NetworkDiagnostic'
			SET @languange_element_id = 32
			SET @chk = 21474836574
		END
		ELSE IF (@ID = 33) BEGIN
			SET @operation = 'ExportDatabase'
			SET @languange_element_id = 33
			SET @chk = 180388626441
		END
		ELSE IF (@ID = 34) BEGIN
			SET @operation = 'ImportDatabase'
			SET @languange_element_id = 34
			SET @chk = 163208757276
		END
		ELSE IF (@ID = 35) BEGIN
			SET @operation = 'DatabaseCheck'
			SET @languange_element_id = 35
			SET @chk = 163208757351
		END
		ELSE IF (@ID = 36) BEGIN
			SET @operation = 'DailyReport'
			SET @languange_element_id = 36
			SET @chk = 425201762358
		END
		ELSE IF (@ID = 37) BEGIN
			SET @operation = 'CreateUpdateList'
			SET @languange_element_id = 37
			SET @chk = 429496729713
		END
		/*ELSE IF (@ID = 38) BEGIN
			SET @operation = ''
			SET @languange_element_id = 38
			SET @chk = 
		END*/

		BEGIN TRANSACTION;
		IF EXISTS (SELECT ID FROM [Operations] WHERE ID = @ID) BEGIN
			UPDATE [Operations] SET operation = @operation, language_element_id = @languange_element_id, chk = @chk WHERE ID = @ID;
		END
		ELSE BEGIN
			INSERT INTO [Operations] (ID, operation, language_element_id, chk) VALUES (@ID, @operation, @languange_element_id, @chk);
		END
		COMMIT;

		SET @ID = @ID + 1
	END
	
	SET IDENTITY_INSERT [Operations] OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAddressToAddresses]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAddressToAddresses]
	@user_id BIGINT,
	@is_default BIT = NULL,
	@address NVARCHAR(200) = NULL,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Addresses] (user_id, is_default, address, chk) VALUES (@user_id, @is_default, @address, @chk)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertLicensePlateNumberToLicensePlateNumbers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertLicensePlateNumberToLicensePlateNumbers]
	@user_id BIGINT,
	@license_plate_number NVARCHAR(50) = NULL,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [LicensePlateNumbers] (user_id, license_plate_number, chk) VALUES (@user_id, @license_plate_number, @chk)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCameraWithIDInCameras]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCameraWithIDInCameras]
	@camera_name NVARCHAR(50) = NULL,
	@camera_guid NVARCHAR(50) = NULL,
	@rvs_user_name NVARCHAR(50) = NULL,
	@rvs_password NVARCHAR(200) = NULL,
	@server_id BIGINT = NULL,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Cameras] SET camera_name = @camera_name, camera_guid = @camera_guid, rvs_user_name = @rvs_user_name, rvs_password = @rvs_password, server_id = @server_id, chk = @chk WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCameraNameWithIDInCameras]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCameraNameWithIDInCameras]
	@camera_name NVARCHAR(50) = NULL,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Cameras] SET camera_name = @camera_name, chk = @chk WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCameraGUIDWithIDInCameras]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCameraGUIDWithIDInCameras]
	@camera_guid NVARCHAR(50) = NULL,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Cameras] SET camera_guid = @camera_guid, chk = @chk WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCameraFullWithIDInCameras]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCameraFullWithIDInCameras]
	@server_id BIGINT = NULL,
	@recorder_index BIGINT = NULL,
	@camera_name NVARCHAR(50) = NULL,
	@camera_guid NVARCHAR(50) = NULL,
	@rvs_user_name NVARCHAR(50) = NULL,
	@rvs_password NVARCHAR(200) = NULL,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Cameras] SET server_id = @server_id, recorder_index = @recorder_index, camera_name = @camera_name, camera_guid = @camera_guid, rvs_user_name = @rvs_user_name, rvs_password = @rvs_password, chk = @chk WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPictureToPictures]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPictureToPictures]
	@user_id BIGINT,
	@is_default BIT = NULL,
	@label NVARCHAR(50) = NULL,
	@picture IMAGE = NULL,
	@size_mode INT = NULL,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Pictures] (user_id, is_default, label, picture, size_mode, chk) VALUES (@user_id, @is_default, @label, @picture, @size_mode, @chk)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPermissionToPermissions]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPermissionToPermissions]
	@group_id BIGINT,
	@operation_id BIGINT,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Permissions] (group_id, operation_id, chk) VALUES (@group_id, @operation_id, @chk)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUserGroupPairToUsersInGroups]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserGroupPairToUsersInGroups]
	@user_id BIGINT,
	@group_id BIGINT,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [UsersInGroups] (user_id, group_id, chk) VALUES (@user_id, @group_id, @chk)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTelephoneNumberToTelephoneNumbers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTelephoneNumberToTelephoneNumbers]
	@user_id BIGINT,
	@is_default BIT = NULL,
	@tel NVARCHAR(50) = NULL,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [TelephoneNumbers] (user_id, is_default, tel, chk) VALUES (@user_id, @is_default, @tel, @chk)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmailAddressToEmailAddresses]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmailAddressToEmailAddresses]
	@user_id BIGINT,
	@is_default BIT = NULL,
	@e_mail NVARCHAR(50) = NULL,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [EmailAddresses] (user_id, is_default, e_mail, chk) VALUES (@user_id, @is_default, @e_mail, @chk)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCameraToCamerasFull]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCameraToCamerasFull]
	@server_id BIGINT = NULL,
	@recorder_index BIGINT = NULL,
	@camera_name NVARCHAR(50) = NULL,
	@camera_guid NVARCHAR(50) = NULL,
	@rvs_user_name NVARCHAR(50) = NULL,
	@rvs_password NVARCHAR(50) = NULL,
	@x INT = NULL,
	@y INT = NULL,
	@width INT = NULL,
	@height INT = NULL,
	@chk BIGINT,
	@result BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Cameras] (server_id, recorder_index, camera_name, camera_guid, rvs_user_name, rvs_password, x, y, width, height, chk) VALUES (@server_id, @recorder_index, @camera_name, @camera_guid, @rvs_user_name, @rvs_password, @x, @y, @width, @height, @chk)
	SET @result = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCameraToCameras]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCameraToCameras]
	@server_id BIGINT = NULL,
	@recorder_index BIGINT = NULL,
	@camera_name NVARCHAR(50) = NULL,
	@camera_guid NVARCHAR(50) = NULL,
	@rvs_user_name NVARCHAR(50) = NULL,
	@rvs_password NVARCHAR(50) = NULL,
	@chk BIGINT,
	@result BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Cameras] (server_id, recorder_index, camera_name, camera_guid, rvs_user_name, rvs_password, chk) VALUES (@server_id, @recorder_index, @camera_name, @camera_guid, @rvs_user_name, @rvs_password, @chk)
	SET @result = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersInGroups]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsersInGroups]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [UsersInGroups]
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserIdentifiersWithGroupID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserIdentifiersWithGroupID]
	@group_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@group_id IS NULL)
		SELECT * FROM [UsersInGroups]
	ELSE
		SELECT * FROM [UsersInGroups] WHERE group_id = @group_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetPicturesWithUserID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPicturesWithUserID]
	@user_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @user_id IS NULL
		SELECT * FROM [Pictures]
	ELSE
		SELECT * FROM [Pictures] WHERE user_id = @user_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetPermissionsWithUserIDOrderByOperationID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPermissionsWithUserIDOrderByOperationID]
	@user_id BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Permissions] WHERE group_id = (SELECT group_id FROM [UsersInGroups] WHERE user_id = @user_id) ORDER BY operation_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetPermissionsOrderByID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mortens
-- Create date: 2011.09.05
-- Description:	Get permissions from Permissions table order by IDs
-- =============================================
CREATE PROCEDURE [dbo].[GetPermissionsOrderByID]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Permissions] ORDER BY ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetTelephoneNumbersWithUserID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTelephoneNumbersWithUserID]
	@user_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @user_id IS NULL
		SELECT * FROM [TelephoneNumbers]
	ELSE
		SELECT * FROM [TelephoneNumbers] WHERE user_id = @user_id ORDER BY tel
END
GO
/****** Object:  StoredProcedure [dbo].[GetOperationIdentifiersWithGroupID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOperationIdentifiersWithGroupID]
	@group_id BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [Permissions] WHERE group_id = @group_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetLicensePlateNumbersWithUserID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLicensePlateNumbersWithUserID]
	@user_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @user_id IS NULL
		SELECT * FROM [LicensePlateNumbers]
	ELSE
		SELECT * FROM [LicensePlateNumbers] WHERE user_id = @user_id ORDER BY license_plate_number
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupIdentifiersWithUserID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupIdentifiersWithUserID]
	@user_id BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [UsersInGroups] WHERE user_id = @user_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmailAddressWithID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmailAddressWithID]
	@id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [EmailAddresses] WHERE ID = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmailAddressesWithUserID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmailAddressesWithUserID]
	@user_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @user_id IS NULL
		SELECT * FROM [EmailAddresses] ORDER BY user_id
	ELSE
		SELECT * FROM [EmailAddresses] WHERE user_id = @user_id ORDER BY e_mail
END
GO
/****** Object:  StoredProcedure [dbo].[GetCamerasOrderByRecorderIndex]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCamerasOrderByRecorderIndex]
	@server_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @server_id IS NULL
		SELECT * FROM [Cameras] ORDER BY recorder_index
	ELSE
		SELECT * FROM [Cameras] WHERE server_id = @server_id ORDER BY recorder_index
END
GO
/****** Object:  StoredProcedure [dbo].[GetCamerasOrderByCameraName]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCamerasOrderByCameraName]
	@server_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @server_id IS NULL
		SELECT * FROM [Cameras] ORDER BY camera_name
	ELSE
		SELECT * FROM [Cameras] WHERE server_id = @server_id ORDER BY camera_name
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserWithIDFromUsers]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUserWithIDFromUsers]
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [UsersInGroups] WHERE user_id = @ID
	DELETE FROM [Users] WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTelephoneNumberWithUserIDAndTelephoneNumber]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTelephoneNumberWithUserIDAndTelephoneNumber]
	@user_id BIGINT,
	@tel NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [TelephoneNumbers] WHERE user_id = @user_id AND tel = @tel
END
GO
/****** Object:  StoredProcedure [dbo].[GetAddressesWithUserID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAddressesWithUserID]
	@user_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @user_id IS NULL
		SELECT * FROM [Addresses]
	ELSE
		SELECT * FROM [Addresses] WHERE user_id = @user_id ORDER BY address
END
GO
/****** Object:  Table [dbo].[Events]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[computer_device_id] [bigint] NULL,
	[camera_device_id] [bigint] NULL,
	[event_type_id] [bigint] NOT NULL,
	[event_time] [datetimeoffset](7) NOT NULL,
	[other_information] [nvarchar](max) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AudioAlarmSettings]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AudioAlarmSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [bigint] NULL,
	[camera_id] [bigint] NULL,
	[event_type_id] [bigint] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_AudioAlarmSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeletePictureWithUserIDAndPictureID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePictureWithUserIDAndPictureID]
	@user_id BIGINT,
	@picture_id BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Pictures] WHERE user_id = @user_id AND ID = @picture_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePermissionsWithGroupIDFromPermissions]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePermissionsWithGroupIDFromPermissions]
	@group_id BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Permissions] WHERE group_id = @group_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteLicensePlateNumberWithUserIDAndLicensePlateNumber]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteLicensePlateNumberWithUserIDAndLicensePlateNumber]
	@user_id BIGINT,
	@license_plate_number NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [LicensePlateNumbers] WHERE user_id = @user_id AND license_plate_number = @license_plate_number
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteGroupAndPermissionsWithGroupID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGroupAndPermissionsWithGroupID]
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Permissions] WHERE group_id = @ID
	DELETE FROM [Groups] WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAddressWithUserIDAndAddress]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAddressWithUserIDAndAddress]
	@user_id BIGINT,
	@address NVARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Addresses] WHERE user_id = @user_id AND address = @address
END
GO
/****** Object:  StoredProcedure [dbo].[CreateDefaultUsersAndGroups]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateDefaultUsersAndGroups]
AS
BEGIN
	SET NOCOUNT ON;

	SET IDENTITY_INSERT [Users] ON;
	-- Sziltech, 72svpi (SHA512)
	INSERT INTO [Users] (ID, username, [password], full_name, other_information, logon_priority_level, needed_logon_priority_level, active, chk) VALUES (1, 'Sziltech', '1565dba021640aca010dff5a72c92f250addc303bf12510903a3700199033a356555338ea7697a50f193d51629343f2a09d8b6455a4327e96b8cfa819e21aaa5', 'Sziltech Electronic Kft.', '', 2147483647, 0, 'True', 210453397617);

	-- admin, HdK8+3nfo$ (SHA512)
	INSERT INTO [Users] (ID, username, [password], full_name, other_information, logon_priority_level, needed_logon_priority_level, active, chk) VALUES (2, 'admin', '4aa892db6623e16e586bf233c8fd5436ee579717e764f34bf48348ec16b559d351e5c4612e8d182e8190b28afd1e981902509561c4836fcc7e63c69152d67180', 'Rendszer adminisztrátor', '', 2147483647, 0, 'True', 442381631693);
	SET IDENTITY_INSERT [Users] OFF;

	SET IDENTITY_INSERT [Groups] ON;
	-- Built-In Developers
	INSERT INTO [Groups] (ID, parent_group_id, group_name, other_information, chk) VALUES (1, 0, 'Built-In Developers', 'Beépített csoport a rendszerfejlesztők számára', 1382979469317);

	-- Built-In Administrators
	INSERT INTO [Groups] (ID, parent_group_id, group_name, other_information, chk) VALUES (2, 1, 'Built-In Administrators', 'Beépített csoport a rendszerfelügyelők számára', 1378684502163);
	SET IDENTITY_INSERT [Groups] OFF;

	-- Insert 'Sziltech' user into 'Built-In Developers' group
	INSERT INTO [UsersInGroups] (user_id, group_id, chk) VALUES (1, 1, 446676598818);

	-- Insert 'admin' user into 'Built-In Administrators' group
	INSERT INTO [UsersInGroups] (user_id, group_id, chk) VALUES (2, 2, 459561500705);
	
	EXEC InsertEmailAddressToEmailAddresses 1, true, 'info@sziltech.hu', 244813135965;
END
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[event_id] [bigint] NOT NULL,
	[email_address_id] [bigint] NOT NULL,
	[sent_date] [datetimeoffset](7) NULL,
	[mail_identifier] [nvarchar](50) NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Emails_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypeSettings]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypeSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [bigint] NULL,
	[camera_id] [bigint] NULL,
	[event_type_id] [bigint] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_EventTypeSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetAudioAlarmSettings]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAudioAlarmSettings]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [AudioAlarmSettings];
END
GO
/****** Object:  StoredProcedure [dbo].[GetEventsFromDevice]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEventsFromDevice]
	@count BIGINT = NULL,
	@computer_device_id BIGINT,
	@camera_device_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@count IS NULL)
	BEGIN
		IF (@camera_device_id IS NULL)
			SELECT * FROM [Events] WHERE computer_device_id = @computer_device_id ORDER BY ID DESC;
		ELSE
			SELECT * FROM [Events] WHERE computer_device_id = @computer_device_id AND camera_device_id = @camera_device_id ORDER BY ID DESC;
	END
	ELSE
	BEGIN
		IF (@camera_device_id IS NULL)
			SELECT TOP (@count) * FROM [Events] WHERE computer_device_id = @computer_device_id ORDER BY ID DESC;
		ELSE
			SELECT TOP (@count) * FROM [Events] WHERE computer_device_id = @computer_device_id AND camera_device_id = @camera_device_id ORDER BY ID DESC;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetEventsFromComputer]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEventsFromComputer]
	@count BIGINT = NULL,
	@computer_device_id BIGINT,
	@id_must_less_then_this_value BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	IF (@count IS NULL)
	BEGIN
		IF (@id_must_less_then_this_value IS NULL)
			SELECT * FROM [Events] WHERE computer_device_id = @computer_device_id AND camera_device_id IS NULL ORDER BY ID DESC;
		ELSE
			SELECT * FROM [Events] WHERE computer_device_id = @computer_device_id AND camera_device_id IS NULL AND ID < @id_must_less_then_this_value ORDER BY ID DESC;
	END
	ELSE
	BEGIN
		IF (@id_must_less_then_this_value IS NULL)
			SELECT TOP (@count) * FROM [Events] WHERE computer_device_id = @computer_device_id AND camera_device_id IS NULL ORDER BY ID DESC;
		ELSE
			SELECT TOP (@count) * FROM [Events] WHERE computer_device_id = @computer_device_id AND camera_device_id IS NULL AND ID < @id_must_less_then_this_value ORDER BY ID DESC;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetEvents]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEvents]
	@count BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@count IS NULL)
		SELECT * FROM [Events] ORDER BY ID DESC
	ELSE
		SELECT TOP (@count) * FROM [Events] ORDER BY ID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAudioAlarmSettingsWithServerID_or_CameraID]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAudioAlarmSettingsWithServerID_or_CameraID]
	@server_id BIGINT = NULL,
	@camera_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @server_id IS NULL
		IF @camera_id IS NULL
			DELETE FROM [AudioAlarmSettings];
		ELSE
			DELETE FROM [AudioAlarmSettings] WHERE camera_id = @camera_id;
	ELSE
		IF @camera_id IS NULL
			DELETE FROM [AudioAlarmSettings] WHERE server_id = @server_id;
		ELSE
			DELETE FROM [AudioAlarmSettings] WHERE server_id = @server_id OR camera_id = @camera_id;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAudioAlarmSettingToAudioAlarmSettings]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAudioAlarmSettingToAudioAlarmSettings]
	@server_id BIGINT = NULL,
	@camera_id BIGINT = NULL,
	@event_type_id BIGINT,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [AudioAlarmSettings] (server_id, camera_id, event_type_id, chk) VALUES (@server_id, @camera_id, @event_type_id, @chk);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEventToEvents]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEventToEvents]
	@computer_device_id BIGINT = NULL,
	@camera_device_id BIGINT = NULL,
	@event_type_id BIGINT,
	@event_time DATETIMEOFFSET(7),
	@other_information NVARCHAR(MAX) = NULL,
	@chk BIGINT,
	@result BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Events] (computer_device_id, camera_device_id, event_type_id, event_time, other_information, chk) VALUES (@computer_device_id, @camera_device_id, @event_type_id, @event_time, @other_information, @chk);
	SET @result = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SearchEvents]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchEvents]
	@minimum_id BIGINT = NULL,
	@maximum_id BIGINT = NULL,
	@from_date DATETIMEOFFSET = NULL,
	@to_date DATETIMEOFFSET = NULL,
	@event_code NVARCHAR(50) = NULL,
	@other_information NVARCHAR(MAX) = NULL,
	@computer_displayed_name NVARCHAR(50) = NULL,
	@camera_name NVARCHAR(50) = NULL,
	@computer_ip_or_hostname NVARCHAR(50) = NULL,
	@count BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@count IS NULL)
		IF (@minimum_id IS NULL)
			IF (@maximum_id IS NULL)
				IF (@from_date IS NULL)
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
				ELSE -- @from_date
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
			ELSE -- @maximum_id
				IF (@from_date IS NULL)
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
				ELSE -- @from_date
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
		ELSE -- @minimum_id
			IF (@maximum_id IS NULL)
				IF (@from_date IS NULL)
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
				ELSE -- @from_date
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
			ELSE -- @maximum_id
				IF (@from_date IS NULL)
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
				ELSE -- @from_date
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
	ELSE
		IF (@minimum_id IS NULL)
			IF (@maximum_id IS NULL)
				IF (@from_date IS NULL)
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
				ELSE -- @from_date
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
			ELSE -- @maximum_id
				IF (@from_date IS NULL)
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
				ELSE -- @from_date
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
		ELSE -- @minimum_id
			IF (@maximum_id IS NULL)
				IF (@from_date IS NULL)
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
				ELSE -- @from_date
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
			ELSE -- @maximum_id
				IF (@from_date IS NULL)
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
				ELSE -- @from_date
					IF (@event_code IS NULL)
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
					ELSE -- @event_code
						IF (@other_information IS NULL)
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
						ELSE -- @other_information
							IF (@computer_displayed_name IS NULL)
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
							ELSE -- @computer_displayed_name
								IF (@camera_name IS NULL)
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) ORDER BY ID DESC;
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
								ELSE -- @camera_name
									IF (@computer_ip_or_hostname IS NULL)
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) ORDER BY ID DESC; 
									ELSE -- @computer_ip_or_hostname
										SELECT TOP (@count) * FROM [Events] WHERE (ID >= @minimum_id) AND (ID <= @maximum_id) AND (event_time BETWEEN @from_date AND @to_date) AND (event_type_id IN (SELECT ID FROM [EventTypes] WHERE (event_code LIKE @event_code))) AND (other_information LIKE @other_information) AND (camera_device_id IN (SELECT ID FROM [Cameras] WHERE (computer_device_id IN (SELECT ID FROM [Servers] WHERE (displayed_name LIKE @computer_displayed_name))) AND (camera_name LIKE @camera_name))) AND (computer_device_id IN (SELECT ID FROM [Servers] WHERE (ip_or_hostname LIKE @computer_ip_or_hostname))) ORDER BY ID DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSentDateInEmail]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSentDateInEmail]
	@sent_date DATETIMEOFFSET(7) = NULL,
	@chk BIGINT,
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Emails] SET sent_date = @sent_date, chk = @chk WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEventTypeSettingToEventTypeSettings]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEventTypeSettingToEventTypeSettings]
	@server_id BIGINT = NULL,
	@camera_id BIGINT = NULL,
	@event_type_id BIGINT,
	@chk BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [EventTypeSettings] (server_id, camera_id, event_type_id, chk) VALUES (@server_id, @camera_id, @event_type_id, @chk);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmailToEmails]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmailToEmails]
	@event_id BIGINT,
	@email_address_id BIGINT,
	@sent_date DATETIMEOFFSET(7) = NULL,
	@mail_identifier NVARCHAR(50),
	@chk BIGINT,
	@result BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Emails] (event_id, email_address_id, sent_date, mail_identifier, chk) VALUES (@event_id, @email_address_id, @sent_date, @mail_identifier, @chk);
	SET @result = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[GetUnsentEmails]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUnsentEmails]
	@event_id BIGINT = NULL,
	@email_address_id BIGINT = NULL,
	@mail_identifier NVARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@event_id IS NULL)
		IF (@email_address_id IS NULL)
			IF (@mail_identifier IS NULL)
				SELECT * FROM [Emails] WHERE (sent_date IS NULL) ORDER BY ID DESC;
			ELSE -- @mail_identifier
				SELECT * FROM [Emails] WHERE (mail_identifier LIKE @mail_identifier) AND (sent_date IS NULL) ORDER BY ID DESC;
		ELSE -- @email_address_id
			IF (@mail_identifier IS NULL)
				SELECT * FROM [Emails] WHERE (email_address_id = @email_address_id) AND (sent_date IS NULL) ORDER BY ID DESC;
			ELSE -- @mail_identifier
				SELECT * FROM [Emails] WHERE (email_address_id = @email_address_id) AND (mail_identifier LIKE @mail_identifier) AND (sent_date IS NULL) ORDER BY ID DESC;
	ELSE -- @event_id
		IF (@email_address_id IS NULL)
			IF (@mail_identifier IS NULL)
				SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (sent_date IS NULL) ORDER BY ID DESC;
			ELSE -- @mail_identifier
				SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (mail_identifier LIKE @mail_identifier) AND (sent_date IS NULL) ORDER BY ID DESC;
		ELSE -- @email_address_id
			IF (@mail_identifier IS NULL)
				SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (email_address_id = @email_address_id) AND (sent_date IS NULL) ORDER BY ID DESC;
			ELSE -- @mail_identifier
				SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (email_address_id = @email_address_id) AND (mail_identifier LIKE @mail_identifier) AND (sent_date IS NULL) ORDER BY ID DESC;
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetEveryUnsentEmails]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEveryUnsentEmails]
	@count BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@count IS NULL)
		SELECT * FROM [Emails] WHERE sent_date IS NULL ORDER BY ID DESC;
	ELSE
		SELECT TOP (@count) * FROM [Emails] WHERE sent_date IS NULL ORDER BY ID DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEventTypeSettings]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEventTypeSettings]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [EventTypeSettings];
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmails]    Script Date: 11/16/2011 08:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmails]
	@event_id BIGINT = NULL,
	@email_address_id BIGINT = NULL,
	@from_date DATETIMEOFFSET(7) = NULL,
	@to_date DATETIMEOFFSET(7) = NULL,
	@mail_identifier NVARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@event_id IS NULL)
		IF (@email_address_id IS NULL)
			IF (@mail_identifier IS NULL)
				IF (@from_date IS NULL)
					SELECT * FROM [Emails] ORDER BY ID DESC;
				ELSE -- @from_date
					SELECT * FROM [Emails] WHERE (sent_date BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
			ELSE -- @mail_identifier
				IF (@from_date IS NULL)
					SELECT * FROM [Emails] WHERE (mail_identifier LIKE @mail_identifier) ORDER BY ID DESC;
				ELSE -- @from_date
					SELECT * FROM [Emails] WHERE (mail_identifier LIKE @mail_identifier) AND (sent_date BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
		ELSE -- @email_address_id
			IF (@mail_identifier IS NULL)
				IF (@from_date IS NULL)
					SELECT * FROM [Emails] WHERE (email_address_id = @email_address_id) ORDER BY ID DESC;
				ELSE -- @from_date
					SELECT * FROM [Emails] WHERE (email_address_id = @email_address_id) AND (sent_date BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
			ELSE -- @mail_identifier
				IF (@from_date IS NULL)
					SELECT * FROM [Emails] WHERE (email_address_id = @email_address_id) AND (mail_identifier LIKE @mail_identifier) ORDER BY ID DESC;
				ELSE -- @from_date
					SELECT * FROM [Emails] WHERE (email_address_id = @email_address_id) AND (mail_identifier LIKE @mail_identifier) AND (sent_date BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
	ELSE -- @event_id
		IF (@email_address_id IS NULL)
			IF (@mail_identifier IS NULL)
				IF (@from_date IS NULL)
					SELECT * FROM [Emails] WHERE (event_id = @event_id) ORDER BY ID DESC;
				ELSE -- @from_date
					SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (sent_date BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
			ELSE -- @mail_identifier
				IF (@from_date IS NULL)
					SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (mail_identifier LIKE @mail_identifier) ORDER BY ID DESC;
				ELSE -- @from_date
					SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (mail_identifier LIKE @mail_identifier) AND (sent_date BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
		ELSE -- @email_address_id
			IF (@mail_identifier IS NULL)
				IF (@from_date IS NULL)
					SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (email_address_id = @email_address_id) ORDER BY ID DESC;
				ELSE -- @from_date
					SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (email_address_id = @email_address_id) AND (sent_date BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
			ELSE -- @mail_identifier
				IF (@from_date IS NULL)
					SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (email_address_id = @email_address_id) AND (mail_identifier LIKE @mail_identifier) ORDER BY ID DESC;
				ELSE -- @from_date
					SELECT * FROM [Emails] WHERE (event_id = @event_id) AND (email_address_id = @email_address_id) AND (mail_identifier LIKE @mail_identifier) AND (sent_date BETWEEN @from_date AND @to_date) ORDER BY ID DESC;
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetEmailCountWithEmailAddressID]    Script Date: 11/16/2011 08:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetEmailCountWithEmailAddressID] 
(
	@email_address_id BIGINT = NULL
)
RETURNS BIGINT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result BIGINT;

	IF @email_address_id IS NULL
		SET @result = (SELECT COUNT_BIG(ID) FROM [Emails]);
	ELSE
		SET @result = (SELECT COUNT_BIG(ID) FROM [Emails] WHERE email_address_id = @email_address_id);

	-- Return the result of the function
	RETURN @result;

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteServerWithIDFromServers]    Script Date: 11/16/2011 08:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteServerWithIDFromServers]
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [AudioAlarmSettings] WHERE (server_id = @ID) OR (camera_id IN (SELECT ID FROM [Cameras] WHERE server_id = @ID));
	DELETE FROM [EventTypeSettings] WHERE (server_id = @ID) OR (camera_id IN (SELECT ID FROM [Cameras] WHERE server_id = @ID)); 
	DELETE FROM [Emails] WHERE event_id IN (SELECT ID FROM [Events] WHERE (camera_device_id IN (SELECT ID FROM [Cameras] WHERE server_id = @ID)) OR (computer_device_id = @ID));
	DELETE FROM [Events] WHERE camera_device_id IN (SELECT ID FROM [Cameras] WHERE server_id = @ID);
	DELETE FROM [Cameras] WHERE server_id = @ID;
	DELETE FROM [Events] WHERE computer_device_id = @ID;
	DELETE FROM [Servers] WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEventTypeSettingsWithServerID_or_CameraID]    Script Date: 11/16/2011 08:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEventTypeSettingsWithServerID_or_CameraID]
	@server_id BIGINT = NULL,
	@camera_id BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @server_id IS NULL
		IF @camera_id IS NULL
			DELETE FROM [EventTypeSettings];
		ELSE
			DELETE FROM [EventTypeSettings] WHERE camera_id = @camera_id;
	ELSE
		IF @camera_id IS NULL
			DELETE FROM [EventTypeSettings] WHERE server_id = @server_id;
		ELSE
			DELETE FROM [EventTypeSettings] WHERE server_id = @server_id OR camera_id = @camera_id;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmailAddressWithUserIDAndEmailAddress]    Script Date: 11/16/2011 08:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmailAddressWithUserIDAndEmailAddress]
	@user_id BIGINT,
	@e_mail_address NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Emails] WHERE email_address_id IN (SELECT ID FROM [EmailAddresses] WHERE user_id = @user_id AND e_mail = @e_mail_address);
	DELETE FROM [EmailAddresses] WHERE user_id = @user_id AND e_mail = @e_mail_address;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCameraWithIDFromCameras]    Script Date: 11/16/2011 08:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCameraWithIDFromCameras]
	@ID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [AudioAlarmSettings] WHERE camera_id = @ID;
	DELETE FROM [EventTypeSettings] WHERE camera_id = @ID; 

	DELETE FROM [Emails] WHERE event_id IN (SELECT ID FROM [Events] WHERE camera_device_id = @ID);
	DELETE FROM [Events] WHERE camera_device_id = @ID;
	DELETE FROM [Cameras] WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCamerasWithServerIDFromCameras]    Script Date: 11/16/2011 08:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCamerasWithServerIDFromCameras]
	@server_id BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [AudioAlarmSettings] WHERE (server_id = @server_id) OR (camera_id IN (SELECT ID FROM [Cameras] WHERE server_id = @server_id));
	DELETE FROM [EventTypeSettings] WHERE (server_id = @server_id) OR (camera_id IN (SELECT ID FROM [Cameras] WHERE server_id = @server_id)); 
	DELETE FROM [Emails] WHERE event_id IN (SELECT ID FROM [Events] WHERE computer_device_id = @server_id AND camera_device_id IS NOT NULL);
	DELETE FROM [Events] WHERE computer_device_id = @server_id AND camera_device_id IS NOT NULL;
	DELETE FROM [Cameras] WHERE server_id = @server_id;
END
GO
/****** Object:  StoredProcedure [dbo].[Clear_Events_Cameras_Emails]    Script Date: 11/16/2011 08:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Clear_Events_Cameras_Emails]
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM [Emails];
	DELETE FROM [Events];
	DELETE FROM [Cameras];
END
GO
/****** Object:  ForeignKey [FK_Addresses_Users]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Users]
GO
/****** Object:  ForeignKey [FK_Cameras_Servers]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Cameras]  WITH CHECK ADD  CONSTRAINT [FK_Cameras_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO
ALTER TABLE [dbo].[Cameras] CHECK CONSTRAINT [FK_Cameras_Servers]
GO
/****** Object:  ForeignKey [FK_EmailAdresses_Users]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[EmailAddresses]  WITH CHECK ADD  CONSTRAINT [FK_EmailAdresses_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[EmailAddresses] CHECK CONSTRAINT [FK_EmailAdresses_Users]
GO
/****** Object:  ForeignKey [FK_Pictures_Users]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Users]
GO
/****** Object:  ForeignKey [FK_Permissions_Groups]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([ID])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Groups]
GO
/****** Object:  ForeignKey [FK_Permissions_Operations]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Operations] FOREIGN KEY([operation_id])
REFERENCES [dbo].[Operations] ([ID])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Operations]
GO
/****** Object:  ForeignKey [FK_LicensePlateNumbers_Users]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[LicensePlateNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LicensePlateNumbers_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[LicensePlateNumbers] CHECK CONSTRAINT [FK_LicensePlateNumbers_Users]
GO
/****** Object:  ForeignKey [FK_TelephoneNumbers_Users]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[TelephoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_TelephoneNumbers_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TelephoneNumbers] CHECK CONSTRAINT [FK_TelephoneNumbers_Users]
GO
/****** Object:  ForeignKey [FK_UsersInGroups_Groups]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[UsersInGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersInGroups_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([ID])
GO
ALTER TABLE [dbo].[UsersInGroups] CHECK CONSTRAINT [FK_UsersInGroups_Groups]
GO
/****** Object:  ForeignKey [FK_UsersInGroups_Users]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[UsersInGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersInGroups_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UsersInGroups] CHECK CONSTRAINT [FK_UsersInGroups_Users]
GO
/****** Object:  ForeignKey [FK_Events_Cameras]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Cameras] FOREIGN KEY([camera_device_id])
REFERENCES [dbo].[Cameras] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Cameras]
GO
/****** Object:  ForeignKey [FK_Events_EventTypes]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventTypes] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[EventTypes] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventTypes]
GO
/****** Object:  ForeignKey [FK_Events_Servers]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Servers] FOREIGN KEY([computer_device_id])
REFERENCES [dbo].[Servers] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Servers]
GO
/****** Object:  ForeignKey [FK_AudioAlarmSettings_Cameras]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_Cameras] FOREIGN KEY([camera_id])
REFERENCES [dbo].[Cameras] ([ID])
GO
ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_Cameras]
GO
/****** Object:  ForeignKey [FK_AudioAlarmSettings_EventTypes]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_EventTypes] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[EventTypes] ([ID])
GO
ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_EventTypes]
GO
/****** Object:  ForeignKey [FK_AudioAlarmSettings_Servers]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO
ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_Servers]
GO
/****** Object:  ForeignKey [FK_Emails_EmailAddresses]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_EmailAddresses] FOREIGN KEY([email_address_id])
REFERENCES [dbo].[EmailAddresses] ([ID])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_EmailAddresses]
GO
/****** Object:  ForeignKey [FK_Emails_Events]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_Events] FOREIGN KEY([event_id])
REFERENCES [dbo].[Events] ([ID])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_Events]
GO
/****** Object:  ForeignKey [FK_EventTypeSettings_Cameras]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Cameras] FOREIGN KEY([camera_id])
REFERENCES [dbo].[Cameras] ([ID])
GO
ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Cameras]
GO
/****** Object:  ForeignKey [FK_EventTypeSettings_Events]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Events] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[Events] ([ID])
GO
ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Events]
GO
/****** Object:  ForeignKey [FK_EventTypeSettings_Servers]    Script Date: 11/16/2011 08:14:32 ******/
ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO
ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Servers]
GO
