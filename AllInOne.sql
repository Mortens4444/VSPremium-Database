USE [master]
GO

/****** Object:  Database [VSPremium]    Script Date: 10/04/2011 13:32:32 ******/
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

/****** Object:  Table [dbo].[Users]    Script Date: 10/04/2011 13:41:30 ******/
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

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Groups]    Script Date: 10/04/2011 13:43:31 ******/
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

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Servers]    Script Date: 10/04/2011 13:43:02 ******/
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

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Options]    Script Date: 10/04/2011 13:44:20 ******/
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

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Operations]    Script Date: 10/04/2011 13:44:51 ******/
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

USE [VSPremium]
GO

/****** Object:  Table [dbo].[EventTypes]    Script Date: 10/04/2011 13:45:26 ******/
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

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Cameras]    Script Date: 10/04/2011 13:45:58 ******/
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

ALTER TABLE [dbo].[Cameras]  WITH CHECK ADD  CONSTRAINT [FK_Cameras_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[Cameras] CHECK CONSTRAINT [FK_Cameras_Servers]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Addresses]    Script Date: 10/04/2011 13:46:19 ******/
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

ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Users]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[AudioAlarmSettings]    Script Date: 10/04/2011 13:47:00 ******/
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

ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_Cameras] FOREIGN KEY([camera_id])
REFERENCES [dbo].[Cameras] ([ID])
GO

ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_Cameras]
GO

ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_EventTypes] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[EventTypes] ([ID])
GO

ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_EventTypes]
GO

ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_Servers]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[EmailAddresses]    Script Date: 10/04/2011 13:47:25 ******/
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

ALTER TABLE [dbo].[EmailAddresses]  WITH CHECK ADD  CONSTRAINT [FK_EmailAdresses_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[EmailAddresses] CHECK CONSTRAINT [FK_EmailAdresses_Users]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Emails]    Script Date: 10/04/2011 13:47:45 ******/
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

ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_EmailAddresses] FOREIGN KEY([email_address_id])
REFERENCES [dbo].[EmailAddresses] ([ID])
GO

ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_EmailAddresses]
GO

ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_Events] FOREIGN KEY([event_id])
REFERENCES [dbo].[Events] ([ID])
GO

ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_Events]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Events]    Script Date: 10/04/2011 13:48:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Cameras] FOREIGN KEY([camera_device_id])
REFERENCES [dbo].[Cameras] ([ID])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Cameras]
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventTypes] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[EventTypes] ([ID])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventTypes]
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Servers] FOREIGN KEY([computer_device_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Servers]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[EventTypeSettings]    Script Date: 10/04/2011 13:48:45 ******/
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

ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Cameras] FOREIGN KEY([camera_id])
REFERENCES [dbo].[Cameras] ([ID])
GO

ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Cameras]
GO

ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Events] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[Events] ([ID])
GO

ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Events]
GO

ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Servers]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[LicensePlateNumbers]    Script Date: 10/04/2011 13:49:24 ******/
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

ALTER TABLE [dbo].[LicensePlateNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LicensePlateNumbers_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[LicensePlateNumbers] CHECK CONSTRAINT [FK_LicensePlateNumbers_Users]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Permissions]    Script Date: 10/04/2011 13:49:46 ******/
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

ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([ID])
GO

ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Groups]
GO

ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Operations] FOREIGN KEY([operation_id])
REFERENCES [dbo].[Operations] ([ID])
GO

ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Operations]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[Pictures]    Script Date: 10/04/2011 13:50:05 ******/
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

ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Users]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[TelephoneNumbers]    Script Date: 10/04/2011 13:50:29 ******/
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

ALTER TABLE [dbo].[TelephoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_TelephoneNumbers_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[TelephoneNumbers] CHECK CONSTRAINT [FK_TelephoneNumbers_Users]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[UsersInGroups]    Script Date: 10/04/2011 13:51:07 ******/
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

ALTER TABLE [dbo].[UsersInGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersInGroups_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([ID])
GO

ALTER TABLE [dbo].[UsersInGroups] CHECK CONSTRAINT [FK_UsersInGroups_Groups]
GO

ALTER TABLE [dbo].[UsersInGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersInGroups_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[UsersInGroups] CHECK CONSTRAINT [FK_UsersInGroups_Users]
GO

USE [VSPremium]
GO

/****** Object:  Table [dbo].[RaidEnclosures]    Script Date: 05/30/2012 09:12:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RaidEnclosures](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [bigint] NOT NULL,
	[enclosure_type] [tinyint] NOT NULL,
	[location_x] [int] NOT NULL,
	[location_y] [int] NOT NULL,
	[width] [int] NOT NULL,
	[height] [int] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_RaidEnclosures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RaidEnclosures]  WITH CHECK ADD  CONSTRAINT [FK_RaidEnclosures_Servers1] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[RaidEnclosures] CHECK CONSTRAINT [FK_RaidEnclosures_Servers1]
GO

