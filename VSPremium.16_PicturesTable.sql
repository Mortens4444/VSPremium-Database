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

