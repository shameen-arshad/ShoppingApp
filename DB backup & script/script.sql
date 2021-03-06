USE [aspnet-MvcApplication1-20170703211856]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/9/2017 9:38:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [numeric](18, 0) NULL,
	[Image] [varchar](50) NULL,
	[UserId] [int] NOT NULL,
	[PId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonInfo]    Script Date: 7/9/2017 9:38:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonInfo](
	[PIId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL DEFAULT ('Pakistan'),
	[PostalCode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/9/2017 9:38:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[PId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [numeric](18, 0) NOT NULL,
	[PName] [varchar](50) NULL,
	[PImage] [varchar](max) NULL,
	[PCategory] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 7/9/2017 9:38:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 7/9/2017 9:38:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 7/9/2017 9:38:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 7/9/2017 9:38:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 7/9/2017 9:38:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CId], [Name], [Price], [Image], [UserId], [PId], [IsActive]) VALUES (13, N'p9', CAST(3000 AS Numeric(18, 0)), N'/Images/men8.jpg', 2, 12, 0)
INSERT [dbo].[Cart] ([CId], [Name], [Price], [Image], [UserId], [PId], [IsActive]) VALUES (14, N'p5', CAST(1500 AS Numeric(18, 0)), N'/Images/w6.jpg', 2, 17, 0)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[PersonInfo] ON 

INSERT [dbo].[PersonInfo] ([PIId], [UserId], [FirstName], [LastName], [Address], [MobileNo], [City], [Country], [PostalCode]) VALUES (1, 2, N'rameesha', N'ibrar', N'xcbxvvcncv', N'123456789', N'Karachi', N'Pakistan', N'634')
SET IDENTITY_INSERT [dbo].[PersonInfo] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (1, CAST(2500 AS Numeric(18, 0)), N'black heels', N'/Images/w3.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (2, CAST(1500 AS Numeric(18, 0)), N'shoes', N'/Images/men6.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (3, CAST(1200 AS Numeric(18, 0)), N'kids shoes', N'/Images/kids2.jpg', N'Kids')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (4, CAST(2300 AS Numeric(18, 0)), N'product1', N'/Images/w1.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (5, CAST(1400 AS Numeric(18, 0)), N'p1', N'/Images/men.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (6, CAST(1400 AS Numeric(18, 0)), N'p2', N'/Images/men1.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (7, CAST(2000 AS Numeric(18, 0)), N'p3', N'/Images/men2.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (8, CAST(2100 AS Numeric(18, 0)), N'p5', N'/Images/men3.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (9, CAST(1600 AS Numeric(18, 0)), N'p6', N'/Images/men4.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (10, CAST(2000 AS Numeric(18, 0)), N'p7', N'/Images/men5.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (11, CAST(2000 AS Numeric(18, 0)), N'p8', N'/Images/men7.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (12, CAST(3000 AS Numeric(18, 0)), N'p9', N'/Images/men8.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (13, CAST(2600 AS Numeric(18, 0)), N'p10', N'/Images/men9.jpg', N'Men')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (14, CAST(2400 AS Numeric(18, 0)), N'p2', N'/Images/w2.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (15, CAST(2200 AS Numeric(18, 0)), N'p4', N'/Images/w4.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (16, CAST(2000 AS Numeric(18, 0)), N'p5', N'/Images/w5.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (17, CAST(1500 AS Numeric(18, 0)), N'p5', N'/Images/w6.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (18, CAST(1800 AS Numeric(18, 0)), N'p7', N'/Images/w7.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (19, CAST(3000 AS Numeric(18, 0)), N'p8', N'/Images/w8.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (20, CAST(1800 AS Numeric(18, 0)), N'p9', N'/Images/w9.jpg', N'Women')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (21, CAST(1200 AS Numeric(18, 0)), N'k1', N'/Images/kids1.jpg', N'Kids')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (22, CAST(1000 AS Numeric(18, 0)), N'k2', N'/Images/kids3.jpg', N'Kids')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (23, CAST(1500 AS Numeric(18, 0)), N'k3', N'/Images/kids4.jpg', N'Kids')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (24, CAST(1200 AS Numeric(18, 0)), N'k4', N'/Images/kids5.jpg', N'Kids')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (25, CAST(900 AS Numeric(18, 0)), N'k5', N'/Images/kids6.jpg', N'Kids')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (26, CAST(1300 AS Numeric(18, 0)), N'k6', N'/Images/kids7.jpg', N'Kids')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (27, CAST(1000 AS Numeric(18, 0)), N'k7', N'/Images/kids8.jpg', N'Kids')
INSERT [dbo].[Product] ([PId], [Price], [PName], [PImage], [PCategory]) VALUES (28, CAST(1400 AS Numeric(18, 0)), N'k8', N'/Images/kids9.jpg', N'Kids')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (1, N'Shameen')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (2, N'rameesha')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2017-07-03 16:22:48.527' AS DateTime), NULL, 1, NULL, 0, N'ALtJU4yv8DbusKga+saURHUhRu9nUu1EtSlT23YqvUFlgzH684IXRgx6LFjn2dFjMg==', CAST(N'2017-07-03 16:22:48.527' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(N'2017-07-08 18:13:56.523' AS DateTime), NULL, 1, NULL, 0, N'AFERM0HluQwM2ehClWXdp4VyrbZfK9g5Ym2tR0YGpUy0eqDm4VBoJMdyzZ6+mkogBw==', CAST(N'2017-07-09 11:38:20.873' AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 2)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B6160F13F2991]    Script Date: 7/9/2017 9:38:34 PM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[PersonInfo]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
