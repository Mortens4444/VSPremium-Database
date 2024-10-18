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

