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

