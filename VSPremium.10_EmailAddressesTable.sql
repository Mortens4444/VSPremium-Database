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

