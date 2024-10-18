USE [VSPremium]
GO

/****** Object:  Table [dbo].[LicensePlateNumbers]    Script Date: 10/04/2011 13:49:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LicensePlateNumbers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[license_plate_number] [nvarchar](50) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_LicensePlateNumbers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LicensePlateNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LicensePlateNumbers_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[LicensePlateNumbers] CHECK CONSTRAINT [FK_LicensePlateNumbers_Users]
GO

