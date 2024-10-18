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

