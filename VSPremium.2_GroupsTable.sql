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

