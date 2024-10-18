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

