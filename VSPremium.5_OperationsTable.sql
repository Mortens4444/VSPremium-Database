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

