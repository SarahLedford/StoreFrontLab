/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Studios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Statuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_MusicGenres]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_MovieGenres]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Categories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Artists]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Studios]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Studios]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Statuses]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[MusicGenres]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[MusicGenres]
GO
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[MovieGenres]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Artists]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/25/2021 10:56:37 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artists]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Artists](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovieGenres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MovieGenres](
	[MovieGenreID] [int] IDENTITY(1,1) NOT NULL,
	[MovieGenreName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_MovieGenres] PRIMARY KEY CLUSTERED 
(
	[MovieGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MusicGenres]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MusicGenres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MusicGenres](
	[MusicGenreID] [int] IDENTITY(1,1) NOT NULL,
	[MusicGenreName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_MusicGenres] PRIMARY KEY CLUSTERED 
(
	[MusicGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProdID] [int] IDENTITY(1,1) NOT NULL,
	[ProdName] [varchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[ArtistID] [int] NULL,
	[Description] [varchar](max) NULL,
	[StudioID] [int] NULL,
	[MovieGenreID] [int] NULL,
	[MusicGenreID] [int] NULL,
	[ProductImage] [varchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Statuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](25) NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Studios]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Studios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Studios](
	[StudioID] [int] IDENTITY(1,1) NOT NULL,
	[StudioName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Studios] PRIMARY KEY CLUSTERED 
(
	[StudioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 3/25/2021 10:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](75) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202103082231205_InitialCreate', N'StoreFrontLab.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD85BA44ED206CD0DEB64D1B7052DD18EB012A54A549AA0E897F5A19FD45FE850A26EBCE8622BB653142862717866389C2187C3E1FEFBF73FE31F9F7CCF78C451EC0664621E8CF64D03133B705CB29C98095DBC796FFEF8E1EBAFC6678EFF647CCAE98E181DF424F1C47CA0343CB6ACD87EC03E8A47BE6B47411C2CE8C80E7C0B398175B8BFFF8375706061803001CB30C61F13425D1FA73FE0E73420360E6982BCABC0C15ECCBF43CB2C4535AE918FE310D97862CE6810E1F32820F412CD47F717A3AB4FD351D6CD344E3C17814833EC2D4C031112504441E0E3FB18CF28F459CE42F880BCBBE71003DD027931E603392EC9BB8E69FF908DC92A3BE6507612D3C0EF097870C4956489DD5752B5592811D47806EAA6CF6CD4A92A27E68583D34F1F030F1420323C9E7A11239E9857058B9338BCC67494771C6590E711C0FD11445F4655C43DA373BFBDC2A80E47FBECBF3D639A783489F084E08446C8DB336E93B9E7DABFE2E7BBE00B2693A383F9E2E8FDDB77C8397AF73D3E7A5B1D298C15E86A1FE0D36D14843802D9F0A218BF6958F57E96D8B1E856E99369056C09FCC334AED0D325264BFA009E73F8DE34CEDD27ECE45FB871DD1317DC093AD128819FD789E7A1B9878B76AB9127FB7F03D7C3B7EF06E17A8D1EDD653AF5027F709C08FCEA23F6D2D6F8C10D33F7AACDF7674E066EE9B3DF75FBCA5A3FCF8224B2D960022DC91D8A9698D6A51B5BA5F17632690635BC59E7A8BB6FDA4C52D9BC95A46C40AB7842CE62D3DE90CBFBB27C3B5BDC4918C2E4A5A6C534D264700DBBD64880D93354C4A5311D7435260283FC3FAF8D673E72BD0116C70E5C204059B8918F8B51FE14802922D25BE65B14C7B03638BFA0F8A14174F87300D167D84E2230D919457EF8E2DC6E1F0282AF137FCE3C6173BC069B9ABB3F82736483EB9D11D66B6DBCCBC0FE1224F48C38A788E27B6AE780ECE79DEB770718449C13DBC6717C0EC68C9D6900F1770E7841E8D1616F38B6526D3B38997AC8F5D5D189B0A67ECE49CB08454D2145291A3255A4D224EA65B0744937517352BDA81945ABA89CACAFA80CAC9BA49C522F684AD02A67463558EC97CED0F0C15F0ABBFBD1DF7A9BB76E2DA8A8310D4E7EC60447B08C39B788521C917206BAAC1BDB0816D2E9634C5F7C6F4A397D425E3234AB95BC215D0486F7861476F7BD2115133E3FBA0E8B4A3A1C89726280EF44AF3E6DB5FB9C20D9A6DDA136CC4D33DFCC1AA0739793380E6C37F50245328CA732EAF2430C67B4E735B2D188B911181818BACBB63CF802633345A3BA21A7D8C3141B2776962C9CA2D8468EAC461890D343B07C47550856E648EAC27D27F1044BC711EB84D82128064F750995DDC225B61B22AF554B42CF8E5B181B7BC1436C39C521268C61AB26BA3057A7449800051F6152DA3434B62A16D76C889AA85537E76D216C39EF52A6622336D9123B6BEC92C76F2F6298CD1ADB807136ABA48B00DAF4DE360C949F55BA1A807870D93503154E4C1A03E521D5460CB4AEB12D18685D25AFCE40B3236AD7F917CEABBB669EF583F2E6B7F546756DC1366BFAD831D3CC624FE843A1078E64F33C9DB346FC4415873390939FCF621EEA8A26C2C06798D6533665BCAB8C43AD6610D1889A004B436B01E517831290E4503D84CB73798DD2F128A2076C9E776B84E56BBF005BB10119BB7A415A21D45FA38AC6D9E9F4518CACB006C9C83B1D162A380A831017AFFAC03B284597979515D32516EE130D5706C627A341412D91AB4649F96006D7526E9AED5A5205647D42B2B5B424844F1A2DE583195C4BDC46DB95A4080A7A84056BA9A8BE850FE46C79A6A3D86D8AB6B1951550F10F634B536935BE4261E89265A5F28A7F316659D9D5F4CDAC7F19929F615876ACA8462AA42D38D120424B2CB4026B90F4DC8D627A8A289A2396E7993ABE44A6DC5B35CB7FCEB2BA7DCA9398EF033935FB9BDFAC365CE7D7365D392AE160E730549F85362994C210D4DD0D5612873C142952F8D3C04B7CA28FB4F4BDB38BBC6AFFEC8B8C30B604F9A5484A529B14EFD6E7A0D30CC9DE31F46C1511CDEA33A687D0E93D8F47AB9AD7C5A87A943C655545D1A5B1B63683BAD066B55913C3C7FE93D68AF0329EC66B56AA00FC534F8C4AD983045669EB8E5AAF4CA962D65BBA230AE5275548A1A98794D522939A90D58695F0341A555374E720979554D1E5D6EEC88A02932AB4A279056C85CC625B7754450D4A1558D1DC1DBB2C481157D31DDECBB4879AF537B3EC00BCDE6EA6C17899A57198CDB072CF5F05AA7CEE89C56FF22530FE7D27CD4A7B0A5CDFACB204C87A66A5C1D0AF45B5ABF2FA52D478BFAFC7ACDD7FD796FBA6FB7F3D5E3FE37D5113914E832249C1BD38150AA7BF313F89B53FC6918E66198969E46A04C37A8E29F6478C6034FBDD9B7A2E660B7B4E708588BBC031CD6A3ECCC3FD8343E119CFEE3CA9B1E2D8F1142759DDBB9AFA9C6DA07C8B3CA2C87E40915C4CB1C6B3931254CA535F10073F4DCC3FD35EC769CA83FD957EDE332EE27BE2FE9E40C35D9460E32FB938749832FC0E0F3F0A41FF7A152F2ABAABFCE2B7CF59D73DE32602773A36F60545AF32FDF57716BDA4C9BAAE21CDCAAF2F5EAFB7D51E322851056F59FDDDC2DCA583BC59C8A5FCC6474FDFF6154DF92E612D44C5DB83A1F00651A1EE6DC12A58DA77050EFCA4E9BB827E8355BF33584534ED1B0397F407135F18745F86F29E5BDC871427A74D2C49A99E5B2BB4D72AD7DCF6DE241572AFE5E872B1760FB8410BB2D70B515E59A1F3605BA7A28E7930EC6DDAFD8B172FEF4ABD7219B46FB74C799395C90D774DFFAB82E41D28A15394046DBFEC78D3B6A64B05EF78ED66BFE2E21D3336BECD6FBF8478D3C6A64B10EFB8B1F52A14DE315BDBD6FEB9654BEBBC856EBDEC57AE60D25CE9A8B2C86D65BD59CA1D8EFFF3008C208B28B3D798EA3AB2A61AD8168625899EA9BE804D642C398EC457A26866DB6FAC7CC36F1C2CA76966AB29FB6CE2CDD7FF46DE9CA699B7A698721B05C9CA7246559178CB3AD65459F59A0A906B2369A9776F8B591BEFE75F53BDF1204AA9798FE676F9F594170FA292215DA74739B17C510C7B67E5DF7684FD3B76972504FB971E09B66BBB664173411641BE790B12E5244286E60A53E4C0967A125177816C0ACD2C019D3E274F937AEC1A648E9D0B7293D030A13064ECCFBD5AC28B05014DFCD39AE9BACCE39B90FD8A87180288E9B2C4FD0DF929713DA790FB5C9113D240B0E882A77BD95C5296F65D3E1748D701E908C4D557044577D80F3D008B6FC80C3DE2556403F3BBC44B643F9719401D48FB44D4D53E3E75D132427ECC31CAFEF0136CD8F19F3EFC0709FBDBDFE2540000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (1, N'Britney Spears')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (2, N'Jay-Z')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (3, N'NSYNC')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (4, N'The Backstreet Boys')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (5, N'LL Cool J')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (6, N'Frank Sinatra')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (7, N'AC/DC')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (8, N'Chuck Berry')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (9, N'Simon and Garfunkel')
INSERT [dbo].[Artists] ([ArtistID], [ArtistName]) VALUES (10, N'Alicia Keys')
SET IDENTITY_INSERT [dbo].[Artists] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b3e52b53-af5a-4656-9d63-37b8862ba944', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'eeb18db2-06ad-4068-925b-f5bf97ab6272', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'757e0656-b892-492c-9454-2297b9b2bd29', N'Employee')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3df3fdae-a67e-436e-b337-c91196809337', N'757e0656-b892-492c-9454-2297b9b2bd29')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00d9deec-5b2b-4f0c-9a45-27d9983d4e14', N'b3e52b53-af5a-4656-9d63-37b8862ba944')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'57683cde-6be2-48ff-ac48-ddbe06650d19', N'eeb18db2-06ad-4068-925b-f5bf97ab6272')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a7ebfc74-ee63-40b0-bf26-744c42983e3a', N'eeb18db2-06ad-4068-925b-f5bf97ab6272')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00d9deec-5b2b-4f0c-9a45-27d9983d4e14', N'example@example.com', 0, N'ADZgKBfhSpuNsM/WWxkwRNo8m4jWRnsL0Nh2aABG75wTwhFnlNK6XHHD1JT0AY3h/A==', N'5541d108-1d5b-478a-a6cb-c189d69ec2f0', NULL, 0, 0, NULL, 1, 0, N'example@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3df3fdae-a67e-436e-b337-c91196809337', N'joe@example.com', 0, N'AIn9xbhZiKgeAmkhvWB0dR48Lq66Cq5/dX5wK1VukeMGhyf3qIVPV4ghyCi4d6INcA==', N'e38f4dd3-1a48-4200-8537-cade43ef2771', NULL, 0, 0, NULL, 1, 0, N'joe@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'57683cde-6be2-48ff-ac48-ddbe06650d19', N'jimmy@example.com', 0, N'AH/CL12M18ktW8hRINE6z3b0gJZhPdbOpykL+LI9mKIvOMaujSSiLLhnAhs/8ByYog==', N'bee217f9-e883-412a-92c9-01def12b862e', NULL, 0, 0, NULL, 1, 0, N'jimmy@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a7ebfc74-ee63-40b0-bf26-744c42983e3a', N'dean@example.com', 0, N'AJFpGPBvhRJBgvJMlQm4rO5SaYs3qsBB2s6OEE8uK66nM+tB48nbDNEECx8Me+fhJw==', N'70964c20-2315-4e56-bda2-161a2689d499', NULL, 0, 0, NULL, 1, 0, N'dean@example.com')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'VHS')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Cassette Tape')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Record')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'LaserDisc')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[MovieGenres] ON 

INSERT [dbo].[MovieGenres] ([MovieGenreID], [MovieGenreName]) VALUES (1, N'Horror')
INSERT [dbo].[MovieGenres] ([MovieGenreID], [MovieGenreName]) VALUES (2, N'Comedy')
INSERT [dbo].[MovieGenres] ([MovieGenreID], [MovieGenreName]) VALUES (3, N'Action')
INSERT [dbo].[MovieGenres] ([MovieGenreID], [MovieGenreName]) VALUES (4, N'Family/Kids')
INSERT [dbo].[MovieGenres] ([MovieGenreID], [MovieGenreName]) VALUES (5, N'Musicals')
INSERT [dbo].[MovieGenres] ([MovieGenreID], [MovieGenreName]) VALUES (6, N'Sci-Fi')
SET IDENTITY_INSERT [dbo].[MovieGenres] OFF
SET IDENTITY_INSERT [dbo].[MusicGenres] ON 

INSERT [dbo].[MusicGenres] ([MusicGenreID], [MusicGenreName]) VALUES (1, N'Pop')
INSERT [dbo].[MusicGenres] ([MusicGenreID], [MusicGenreName]) VALUES (2, N'Rock')
INSERT [dbo].[MusicGenres] ([MusicGenreID], [MusicGenreName]) VALUES (3, N'Blues/Jazz')
INSERT [dbo].[MusicGenres] ([MusicGenreID], [MusicGenreName]) VALUES (4, N'Rap')
INSERT [dbo].[MusicGenres] ([MusicGenreID], [MusicGenreName]) VALUES (5, N'Classics')
INSERT [dbo].[MusicGenres] ([MusicGenreID], [MusicGenreName]) VALUES (6, N'R&B/Soul')
SET IDENTITY_INSERT [dbo].[MusicGenres] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (2, N'The Great Mouse Detective', 1, 1, 5.9900, NULL, N'Basil embarks on the greatest case of his career when London''s master toymaker is kidnapped. He ends up pitting his wits against his old adversary, Professor Ratigan, who wants to become `supreme ruler of all mousedom.', 4, 4, NULL, N'ec7ea0f8-c04f-47e8-b744-1c9ae70543b1.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (3, N'Monsters Inc.', 1, 2, 5.9900, NULL, N'Monsters go on an adventure with a not-so-dangerous little girl.', 4, 4, NULL, N'430a67f2-4800-4976-b370-22df6eb5404e.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (4, N'Young Frankenstein', 4, 3, 9.9900, NULL, N'Respected medical lecturer Dr. Frederick Frankenstein (Gene Wilder) learns that he has inherited his infamous grandfather''s estate in Transylvania. Arriving at the castle, Dr. Frankenstein soon begins to recreate his grandfather''s experiments with the help of servants Igor (Marty Feldman), Inga (Teri Garr) and the fearsome Frau Blücher (Cloris Leachman). After he creates his own monster (Peter Boyle), new complications ensue with the arrival of the doctor''s fiancée, Elizabeth (Madeline Kahn).', 6, 2, NULL, N'dc64c018-5cbd-4033-8096-aa2c3e32f582.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (5, N'Misery', 1, 1, 4.9900, NULL, N'After a serious car crash, novelist Paul Sheldon (James Caan) is rescued by former nurse Annie Wilkes (Kathy Bates), who claims to be his biggest fan. Annie brings him to her remote cabin to recover, where her obsession takes a dark turn when she discovers Sheldon is killing off her favorite character from his novels. As Sheldon devises plans for escape, Annie grows increasingly controlling, even violent, as she forces the author to shape his writing to suit her twisted fantasies.', 7, 1, NULL, N'8f58d9e3-84d2-4693-a679-64dd47791eb1.png')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (6, N'Die Hard', 1, 2, 4.9900, NULL, N'New York City policeman John McClane (Bruce Willis) is visiting his estranged wife (Bonnie Bedelia) and two daughters on Christmas Eve. He joins her at a holiday party in the headquarters of the Japanese-owned business she works for. But the festivities are interrupted by a group of terrorists who take over the exclusive high-rise, and everyone in it. Very soon McClane realizes that there''s no one to save the hostages -- but him.', 6, 3, NULL, N'd71ea2e9-cd57-487c-a004-8160e6cc3208.gif')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (7, N'Pitch Black', 1, 1, 3.9900, NULL, N'A deep space transporter crash-lands on a desolate planet circled by three suns. Among the survivors are pilot Carolyn Fry, mystic Abu `Imam'' al-Walid, cop William J Johns and convicted criminal Richard B Riddick, and their first thoughts are of survival and escape. Then Fry finds out that the planet suffers a total eclipse every 22 years, which is when the hibernating, flesh-eating inhabitants awake and hunt.', 8, 6, NULL, N'6b1755fa-6718-495f-8b06-957751c6edc9.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (8, N'Scream', 4, 1, 24.9800, NULL, N'Scream is an American meta horror media franchise that comprises four slasher films, a television series, merchandise, and a video game for the fourth film. The film series was created by Kevin Williamson. The first four films were directed by Wes Craven.', 9, 1, NULL, N'b42229ed-530d-465f-90b8-fb0ee5bf23f4.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (9, N'The Last Starfighter', 4, 2, 22.9800, NULL, N'After finally achieving the high score on Starfighter, his favorite arcade game, everyday teenager Alex Rogan (Lance Guest) meets the game''s designer, Centauri (Robert Preston) -- who reveals that he created Starfighter as a training ground for developing and recruiting actual pilots to help fight a war in space. Whisked away from the banality of his trailer park life to a distant alien planet, Alex struggles to use his video game-playing skills to pilot a real ship, with real lives at stake.', 10, 6, NULL, N'79408cd0-3473-498b-a89a-395f0effa4b5.png')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (10, N'Sleepy Hollow', 4, 1, 17.9800, NULL, N'Set in 1799, "Sleepy Hollow" is based on Washington Irving''s classic tale "The Legend of Sleepy Hollow." Faithful to the dreamy custom-bound world that Irving paints in his story, the film mixes horror, fantasy and romance and features an extraordinary cast of characters that dabble in the supernatural.', 1, 1, NULL, N'7d4348e9-fcee-46ef-a113-82206f07eba0.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (11, N'Killer Klowns from Outer Space', 4, 1, 29.9800, NULL, N'Killer Klowns from Outer Space is a 1988 American science fiction horror comedy film written, directed and produced by the Chiodo Brothers, and starring Grant Cramer, Suzanne Snyder, John Allen Nelson and John Vernon.', 11, 1, NULL, N'61bd20f1-cae1-4ba0-9366-65efcc2ee793.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (12, N'Bigger And Deffer', 3, 1, 9.9900, 5, N'Bigger and Deffer is the second studio album by American rapper LL Cool J, released on May 29, 1987 by Def Jam Recordings and Columbia Records. It features the first commercially successful "rap ballad", "I Need Love".', NULL, NULL, 4, N'74788138-ffd7-4f92-924e-c9d785161eec.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (13, N'In The Wee Small Hours', 3, 2, 9.9900, 6, N'In the Wee Small Hours is the ninth studio album by American vocalist Frank Sinatra. It was released in April 1955 by Capitol and produced by Voyle Gilmore with arrangements by Nelson Riddle.', NULL, NULL, 5, N'b675dbb0-cd6e-4642-9ae1-7727e6457b4d.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (14, N'Simon and Garfunkel''s Greatest Hits', 3, 2, 10.9800, 9, N'Simon and Garfunkel''s Greatest Hits is the first compilation album from Simon & Garfunkel, released on June 14, 1972, two years after the duo had split.', NULL, NULL, 5, N'b366cd6f-b014-4ad4-96e1-67c3d936122e.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (15, N'Back in Black', 3, 3, 7.9900, 7, N'Back in Black is the seventh studio album by Australian rock band AC/DC. It was released on 25 July 1980 by Albert Productions and Atlantic Records. It is the band''s first album to feature lead singer Brian Johnson, following the death of previous lead singer Bon Scott.', NULL, NULL, 2, N'7ea7ec84-340f-4115-a4aa-0589ab41b716.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (16, N'The Great Twenty-Eight', 3, 2, 12.9800, 8, N'This 2LP is being reissued on vinyl for the first time since its release in 1982. Packed with hits & classic B-sides including Maybellene, Rock & Roll Music, Sweet Little Sixteen, School Day, Johnny B. Goode & more, from the Grammy(R) Hall of Fame that''s launched a thousand careers, Roll Over Beethoven to Wee Wee Hours, Little Queenie & Let It Rock. It includes the original liner notes by author & rock historian Michael Lydon', NULL, NULL, 2, N'1e765af5-e19a-413a-a4ee-13adccc7e652.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (17, N'In the Zone', 2, 1, 3.9900, 1, N'In the Zone is the fourth studio album by American singer Britney Spears. It was released on November 12, 2003, through Jive Records.', NULL, NULL, 1, N'defefd8b-674b-4bec-a007-c1a8354e43dd.png')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (18, N'NSYNC', 2, 2, 4.9900, 3, N'''N Sync is the debut studio album by American boy band NSYNC. ', NULL, NULL, 1, N'0d45798a-acaf-4c94-aac7-139b0578ea4b.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (19, N'The Blueprint', 2, 1, 2.9900, 2, N'The Blueprint is the sixth studio album by American rapper Jay-Z. It was released on September 11, 2001, by Roc-A-Fella Records and Def Jam Recordings. Its release was set a week earlier than initially planned in order to combat bootlegging.', NULL, NULL, 6, N'ffad46e6-e46e-4702-85f9-447ef2128a97.png')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (20, N'Backstreet''s Back', 2, 3, 4.9900, 4, N'Backstreet''s Back is the second studio album by the Backstreet Boys, released internationally August 11, 1997 by Jive Records and Trans Continental Records, with the exception of United States. It was a follow-up to their successful Backstreet Boys (1996 album). Some songs from this album and the debut album were compiled into a second self-titled album, Backstreet Boys (1997) released only in the US.', NULL, NULL, 1, N'47d3b595-c34e-4deb-95f6-9911a7647406.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (21, N'Songs in A Minor', 2, 1, 5.9900, 10, N'Songs in A Minor is the debut studio album by American singer and songwriter Alicia Keys. It was released on June 5, 2001, by J Records. ', NULL, NULL, 6, N'6da29b34-11c1-4fc4-93de-a5d16fdb4b54.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (22, N'Decoys', 1, 1, 4.9900, 1, N'Luke and Roger are just another couple of college guys trying to have fun. But when Luke sees something unusual, he begins to suspect that the girls on campus aren''t exactly human.', 1, 6, 1, N'34be5c05-2cc0-470d-95bd-59e516447ba6.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1023, N'The Goonies', 4, 2, 19.9800, NULL, N'Old-fashioned yarn about a band of adventurous kids who take on the might of a property developing company which plans to destroy their home to build a country club. When the children discover an old pirate map in the attic, they follow it into an underground cavern in search of lost treasure but come up against plenty of dangerous obstacles along the way.', 12, 4, NULL, N'98f26f9e-bd1b-4dda-9b70-73a539966f20.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1025, N'The Princess Bride', 4, 1, 24.9800, NULL, N'A fairy tale adventure about a beautiful young woman and her one true love. He must find her after a long separation and save her. They must battle the evils of the mythical kingdom of Florin to be reunited with each other. Based on the William Goldman novel "The Princess Bride" which earned its own loyal audience.', 2, 4, NULL, N'2150cd94-49e8-40a5-9410-5f0b653d4c0d.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1026, N'Spy Kids', 1, 1, 4.9900, NULL, N'Spy Kids is an American spy adventure comedy family film series created by Robert Rodriguez. The main series follows the adventures of Carmen and Juni Cortez, two children who become involved in their parents'' espionage.', 9, 4, NULL, N'e2df6e76-782d-43de-af7c-d100bc0a335d.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1027, N'Oops!...I Did It Again', 3, 2, 9.9900, 1, N'The Britney Spears album Oops!...I Did It Again, pressed to clear vinyl with purple and gold splatter. The second studio album from Spears was an instant pop sensation with the mega-hits we’re still singing, including the title track, “Lucky” and “Stronger.”', NULL, NULL, 1, N'b9ba247b-8c8e-42e0-ab5f-0b8f63fb929a.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1028, N'Chicken Run', 1, 1, 4.9900, NULL, N'Award-winning DreamWorks animation from the Aardman team, telling the story of a band of chickens doomed to a life of egg-laying on a Yorkshire chicken farm. When a flamboyant American rooster arrives on the scene, the hens hope he can teach them to fly to freedom. However, when a chicken-pie making machine is installed, their need becomes urgent and they must devise other means of escape.', 4, 4, NULL, N'e55edfa2-ca32-41f6-8ff7-07344d83de72.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1029, N'Space Jam', 4, 1, 12.9900, NULL, N'Swackhammer (Danny DeVito), an evil alien theme park owner, needs a new attraction at Moron Mountain. When his gang, the Nerdlucks, heads to Earth to kidnap Bugs Bunny (Billy West) and the Looney Tunes, Bugs challenges them to a basketball game to determine their fate. The aliens agree, but they steal the powers of NBA basketball players, including Larry Bird (Larry Bird) and Charles Barkley (Charles Barkley) -- so Bugs gets some help from superstar Michael Jordan (Michael Jordan).', 12, 4, NULL, N'f442b8ae-a983-4213-ae17-de585e29c375.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1030, N'Moulin Rouge!', 1, 1, 7.9900, NULL, N'A young Englishman in the Paris of 1899, becomes infatuated with Satine, a singer at the Moulin Rouge. However, she has been promised by the manager to a Duke in return for funding his next production. As the young lovers meet in secret, Satine''s wedding day draws closer but she hides a fatal secret from both Christian and the Duke.', 1, 5, NULL, N'57c19f31-46b5-4fd0-abc9-96ae032c7660.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1042, N'Kull', 1, 2, 0.9900, NULL, N'After five years as a slave, warrior Kull (Kevin Sorbo) travels to the shores of the fantastical kingdom of Valusia, where he slays mad King Borna (Terry O''Neill). Inheriting the crown, Kull begins an ambitious program of bringing freedom and tolerance to Valusia, which displeases Gen. Taligaro (Thomas Ian Griffith) and the royal court''s advisers. Determined to unseat Kull, Taligaro has a wizard resurrect the witch Akivasha (Tia Carrere) to seduce and destroy the new monarch.', NULL, 3, NULL, N'27eb277d-5253-43bb-8b7f-a035a797a219.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1043, N'asdf', 1, 1, 0.9900, NULL, NULL, NULL, NULL, NULL, N'NoImage.png')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1044, N'asd', 1, 2, 0.9900, NULL, N'asd', 10, 5, NULL, N'ccbf3d77-2ca0-438b-89ec-6d72d8ae05f8.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1045, N'halp', 2, 2, 19.9800, NULL, N'sdfsdf', 3, 3, NULL, N'afeaee3c-7864-4d5d-a35a-bcece1383aed.jpg')
INSERT [dbo].[Products] ([ProdID], [ProdName], [CategoryID], [StatusID], [Price], [ArtistID], [Description], [StudioID], [MovieGenreID], [MusicGenreID], [ProductImage]) VALUES (1046, N'fsdf', 2, 1, 7.9900, NULL, N'sdfdsf', 9, 4, NULL, N'd3a0b9a7-41fe-4025-ba73-9d50d5e9e056.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([StatusID], [StatusName]) VALUES (1, N'In stock')
INSERT [dbo].[Statuses] ([StatusID], [StatusName]) VALUES (2, N'Out of stock')
INSERT [dbo].[Statuses] ([StatusID], [StatusName]) VALUES (3, N'On order')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
SET IDENTITY_INSERT [dbo].[Studios] ON 

INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (1, N'Paramount')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (2, N'MGM')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (3, N'Lionsgate')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (4, N'Disney')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (5, N'View Askew Studios')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (6, N'20th Century Fox')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (7, N'Columbia Pictures')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (8, N'USA Films')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (9, N'Dimension Films')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (10, N'Universal Pictures')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (11, N'Trans World Entertainment')
INSERT [dbo].[Studios] ([StudioID], [StudioName]) VALUES (12, N'Warner Bros')
SET IDENTITY_INSERT [dbo].[Studios] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'00d9deec-5b2b-4f0c-9a45-27d9983d4e14', N'Sarah', N'Ledford')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'3df3fdae-a67e-436e-b337-c91196809337', N'Joe', N'Jones')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'57683cde-6be2-48ff-ac48-ddbe06650d19', N'James', N'Miller')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'a7ebfc74-ee63-40b0-bf26-744c42983e3a', N'Jimmy', N'Dean')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Artists]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Artists] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artists] ([ArtistID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Artists]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Artists]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_MovieGenres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_MovieGenres] FOREIGN KEY([MovieGenreID])
REFERENCES [dbo].[MovieGenres] ([MovieGenreID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_MovieGenres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_MovieGenres]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_MusicGenres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_MusicGenres] FOREIGN KEY([MusicGenreID])
REFERENCES [dbo].[MusicGenres] ([MusicGenreID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_MusicGenres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_MusicGenres]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Statuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Statuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Statuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Studios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Studios] FOREIGN KEY([StudioID])
REFERENCES [dbo].[Studios] ([StudioID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Studios]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Studios]
GO
