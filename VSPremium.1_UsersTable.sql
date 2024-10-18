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

