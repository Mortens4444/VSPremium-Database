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

