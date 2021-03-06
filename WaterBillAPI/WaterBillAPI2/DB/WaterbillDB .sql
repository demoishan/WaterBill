USE [WaterbillDB]
GO
/****** Object:  Schema [HangFire]    Script Date: 14-Jun-20 2:32:48 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[AdvanceMaster]    Script Date: 14-Jun-20 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvanceMaster](
	[AdvanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[OwnerId] [bigint] NULL,
	[Amount] [numeric](18, 0) NULL,
	[RemainAmount] [numeric](18, 0) NULL,
	[ChequeNo] [varchar](50) NULL,
	[ChequeDate] [date] NULL,
	[BankName] [varchar](50) NULL,
	[BranchName] [varchar](50) NULL,
	[ChequeCleared] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_AdvanceMaster] PRIMARY KEY CLUSTERED 
(
	[AdvanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillTransaction]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillTransaction](
	[BillId] [bigint] IDENTITY(1,1) NOT NULL,
	[OwnerId] [bigint] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[BillDate] [datetime] NULL,
	[LastUnit] [bigint] NULL,
	[ReceiptNo] [varchar](50) NULL,
	[ReceiptURL] [varchar](100) NULL,
	[CurrentUnit] [bigint] NULL,
	[WaterBillAmount] [bigint] NULL,
	[Maintenance] [bigint] NULL,
	[OtherCharge] [bigint] NULL,
	[Penalty] [bigint] NULL,
	[Total] [bigint] NULL,
	[BillDueDate] [datetime] NULL,
	[BillStatus] [varchar](50) NULL,
	[PaymentType] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[BankName] [varchar](50) NULL,
	[BranchName] [varchar](50) NULL,
	[ChequeDate] [date] NULL,
	[ChequeNo] [nchar](10) NULL,
	[AdvanceId] [bigint] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_BillTransaction] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigurationMaster]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigurationMaster](
	[UnitId] [bigint] IDENTITY(1,1) NOT NULL,
	[UnitRate] [numeric](18, 0) NULL,
	[Penalty] [bigint] NULL,
	[BillDueDays] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_UnitMaster] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExcelFiles]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExcelFiles](
	[UploloadId] [bigint] IDENTITY(1,1) NOT NULL,
	[UploadFileName] [varchar](100) NULL,
	[UploadURL] [varchar](100) NULL,
	[DownloadURL] [varchar](100) NULL,
	[Pass] [int] NULL,
	[Fail] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ExcelFiles] PRIMARY KEY CLUSTERED 
(
	[UploloadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialYearMaster]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialYearMaster](
	[YearId] [bigint] IDENTITY(1,1) NOT NULL,
	[YearName] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[Updatedby] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_FinancialYearMaster] PRIMARY KEY CLUSTERED 
(
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMaster]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMaster](
	[GroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_GroupMaster] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceMaster]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceMaster](
	[MaintenanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[MaintenanceName] [varchar](50) NULL,
	[Amount] [bigint] NULL,
	[GroupId] [bigint] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MaintenanceMaster] PRIMARY KEY CLUSTERED 
(
	[MaintenanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthMaster]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthMaster](
	[MonthId] [int] IDENTITY(1,1) NOT NULL,
	[Month] [varchar](50) NULL,
 CONSTRAINT [PK_MonthMaster] PRIMARY KEY CLUSTERED 
(
	[MonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnerMaster]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnerMaster](
	[OwnerId] [bigint] IDENTITY(1,1) NOT NULL,
	[OwnerName] [varchar](50) NULL,
	[BunglowNo] [varchar](50) NULL,
	[AnotherAddress] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[LastUnit] [float] NULL,
	[GroupId] [bigint] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_OwnerMaster] PRIMARY KEY CLUSTERED 
(
	[OwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptMonthCodeMaster]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptMonthCodeMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrentMonth] [int] NULL,
	[CurrentMonthCode] [nvarchar](1) NULL,
 CONSTRAINT [PK_PNRMonthCodeMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentMaster]    Script Date: 14-Jun-20 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentMaster](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](50) NULL,
	[StudentEmail] [varchar](50) NULL,
 CONSTRAINT [PK_StudentMaster] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[OwnerId] [bigint] NULL,
	[EmailId] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [int] NULL,
	[Roles] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YearMaster]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YearMaster](
	[YearID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [bigint] NULL,
 CONSTRAINT [PK_YearMaster] PRIMARY KEY CLUSTERED 
(
	[YearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 14-Jun-20 2:32:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdvanceMaster] ON 
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (5, 33, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'000001', CAST(N'2020-07-20' AS Date), N'ABC', N'RTO', 2, CAST(N'2020-06-03T13:46:33.280' AS DateTime), CAST(N'2020-06-03T13:46:33.280' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (6, 34, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'000001', CAST(N'2020-06-25' AS Date), N'ABC', N'RTO', 2, CAST(N'2020-06-04T09:31:25.140' AS DateTime), CAST(N'2020-06-04T09:31:25.140' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (7, 53, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'000001', CAST(N'2020-06-25' AS Date), N'ABC', N'RTO', 2, CAST(N'2020-06-04T09:31:58.293' AS DateTime), CAST(N'2020-06-04T09:31:58.293' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (8, 54, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'000001', CAST(N'2020-06-25' AS Date), N'ABC', N'RTO', 2, CAST(N'2020-06-04T09:32:29.177' AS DateTime), CAST(N'2020-06-04T09:32:29.177' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (9, 73, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'000001', CAST(N'2020-06-25' AS Date), N'ABC', N'RTO', 2, CAST(N'2020-06-04T09:33:11.023' AS DateTime), CAST(N'2020-06-04T09:33:11.023' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (10, 74, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'000001', CAST(N'2020-06-25' AS Date), N'ABC', N'RTO', 2, CAST(N'2020-06-04T09:33:47.387' AS DateTime), CAST(N'2020-06-04T09:33:47.387' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (11, 93, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'000001', CAST(N'2020-06-25' AS Date), N'ABC', N'RTO', 2, CAST(N'2020-06-04T09:34:37.370' AS DateTime), CAST(N'2020-06-04T09:34:37.370' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (12, 94, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'000001', CAST(N'2020-06-25' AS Date), N'ABC', N'RTO', 2, CAST(N'2020-06-04T09:35:47.810' AS DateTime), CAST(N'2020-06-04T09:35:47.810' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[AdvanceMaster] ([AdvanceId], [OwnerId], [Amount], [RemainAmount], [ChequeNo], [ChequeDate], [BankName], [BranchName], [ChequeCleared], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (13, 95, CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), N'00001', CAST(N'2020-06-25' AS Date), N'HDFC', N'RTO', 2, CAST(N'2020-06-13T13:35:55.757' AS DateTime), CAST(N'2020-06-13T13:38:10.837' AS DateTime), 9, 9, 1)
GO
SET IDENTITY_INSERT [dbo].[AdvanceMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[BillTransaction] ON 
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (11, 15, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00002', N'\Upload\ReceiptPDF\ReceiptPDF_8886.pdf', 1100, 800, 100, 0, 0, 900, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:10:16.253' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:45:55.940' AS DateTime), CAST(N'2020-06-07T19:10:16.253' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (12, 16, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00003', N'\Upload\ReceiptPDF\ReceiptPDF_4bf8.pdf', 1200, 1600, 100, 0, 0, 1700, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:20:08.843' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:47:25.643' AS DateTime), CAST(N'2020-06-07T19:20:08.843' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (13, 17, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00004', N'\Upload\ReceiptPDF\ReceiptPDF_06c7.pdf', 1125, 1000, 100, 0, 0, 1100, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:20:21.637' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:48:22.630' AS DateTime), CAST(N'2020-06-07T19:20:21.637' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (14, 18, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00005', N'\Upload\ReceiptPDF\ReceiptPDF_94f9.pdf', 1351, 2808, 100, 0, 0, 2908, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:20:28.213' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:49:38.920' AS DateTime), CAST(N'2020-06-07T19:20:28.213' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (15, 19, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00006', N'\Upload\ReceiptPDF\ReceiptPDF_af27.pdf', 1777, 6216, 100, 0, 0, 6316, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:20:36.180' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:50:47.963' AS DateTime), CAST(N'2020-06-07T19:20:36.180' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (16, 20, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00007', N'\Upload\ReceiptPDF\ReceiptPDF_1c51.pdf', 1766, 6128, 100, 0, 0, 6228, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:20:44.997' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:51:22.063' AS DateTime), CAST(N'2020-06-07T19:20:44.997' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (17, 21, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00008', N'\Upload\ReceiptPDF\ReceiptPDF_167c.pdf', 1354, 2832, 100, 0, 0, 2932, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:20:51.153' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:52:01.743' AS DateTime), CAST(N'2020-06-07T19:20:51.153' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (18, 22, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00009', N'\Upload\ReceiptPDF\ReceiptPDF_a5c9.pdf', 1797, 6376, 100, 0, 0, 6476, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:20:56.847' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:53:01.513' AS DateTime), CAST(N'2020-06-07T19:20:56.847' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (19, 23, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00010', N'\Upload\ReceiptPDF\ReceiptPDF_011d.pdf', 1684, 5472, 100, 0, 0, 5572, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:21:11.273' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:53:27.977' AS DateTime), CAST(N'2020-06-07T19:21:11.273' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (20, 24, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00011', N'\Upload\ReceiptPDF\ReceiptPDF_edc3.pdf', 1768, 6144, 100, 0, 0, 6244, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:21:19.217' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T18:53:52.183' AS DateTime), CAST(N'2020-06-07T19:21:19.217' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (21, 25, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00012', N'\Upload\ReceiptPDF\ReceiptPDF_e4bd.pdf', 1656, 5248, 100, 0, 0, 5348, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 2, CAST(N'2020-06-07T19:38:49.190' AS DateTime), N'HDFC', N'RTO', CAST(N'2020-06-08' AS Date), N'00001     ', NULL, CAST(N'2020-06-06T18:59:44.280' AS DateTime), CAST(N'2020-06-07T19:38:49.190' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (22, 26, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00013', N'\Upload\ReceiptPDF\ReceiptPDF_9c1d.pdf', 1646, 5168, 100, 0, 0, 5268, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 2, CAST(N'2020-06-07T19:39:23.290' AS DateTime), N'HDFC', N'RTO', CAST(N'2020-06-08' AS Date), N'00001     ', NULL, CAST(N'2020-06-06T19:00:08.243' AS DateTime), CAST(N'2020-06-07T19:39:23.290' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (23, 27, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00014', N'\Upload\ReceiptPDF\ReceiptPDF_4216.pdf', 1799, 6392, 100, 0, 0, 6492, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:00:38.980' AS DateTime), CAST(N'2020-06-06T19:00:38.980' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (24, 28, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00015', N'\Upload\ReceiptPDF\ReceiptPDF_61be.pdf', 1179, 1432, 100, 0, 0, 1532, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:01:03.453' AS DateTime), CAST(N'2020-06-06T19:01:03.453' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (25, 29, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00016', N'\Upload\ReceiptPDF\ReceiptPDF_2a0e.pdf', 1864, 6912, 100, 0, 0, 7012, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:01:52.833' AS DateTime), CAST(N'2020-06-06T19:01:52.833' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (26, 30, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00017', N'\Upload\ReceiptPDF\ReceiptPDF_d56a.pdf', 1546, 4368, 100, 0, 0, 4468, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:02:16.513' AS DateTime), CAST(N'2020-06-06T19:02:16.513' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (27, 31, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00018', N'\Upload\ReceiptPDF\ReceiptPDF_eb59.pdf', 1646, 5168, 100, 0, 0, 5268, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:03:03.563' AS DateTime), CAST(N'2020-06-06T19:03:03.563' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (28, 32, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00019', N'\Upload\ReceiptPDF\ReceiptPDF_b20a.pdf', 1354, 2832, 100, 0, 0, 2932, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:03:39.507' AS DateTime), CAST(N'2020-06-06T19:03:39.507' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (29, 35, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00020', N'\Upload\ReceiptPDF\ReceiptPDF_a585.pdf', 1646, 5168, 100, 0, 0, 5268, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:22:55.803' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:04:03.290' AS DateTime), CAST(N'2020-06-07T19:22:55.803' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (30, 36, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00021', N'\Upload\ReceiptPDF\ReceiptPDF_e163.pdf', 1546, 4368, 100, 0, 0, 4468, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:23:27.077' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:04:27.420' AS DateTime), CAST(N'2020-06-07T19:23:27.077' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (31, 37, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00022', N'\Upload\ReceiptPDF\ReceiptPDF_34cc.pdf', 1646, 5168, 100, 0, 0, 5268, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:23:38.517' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:04:52.573' AS DateTime), CAST(N'2020-06-07T19:23:38.517' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (32, 38, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00023', N'\Upload\ReceiptPDF\ReceiptPDF_0586.pdf', 1677, 5416, 100, 0, 0, 5516, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:23:49.843' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:05:24.697' AS DateTime), CAST(N'2020-06-07T19:23:49.843' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (33, 39, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00024', N'\Upload\ReceiptPDF\ReceiptPDF_c331.pdf', 1846, 6768, 100, 0, 0, 6868, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:24:07.580' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:06:23.967' AS DateTime), CAST(N'2020-06-07T19:24:07.580' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (34, 40, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00025', N'\Upload\ReceiptPDF\ReceiptPDF_3610.pdf', 1846, 6768, 100, 0, 0, 6868, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:24:27.037' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:06:48.580' AS DateTime), CAST(N'2020-06-07T19:24:27.037' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (35, 41, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00026', N'\Upload\ReceiptPDF\ReceiptPDF_0486.pdf', 1876, 7008, 100, 0, 0, 7108, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:24:44.403' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:07:11.533' AS DateTime), CAST(N'2020-06-07T19:24:44.403' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (36, 42, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00027', N'\Upload\ReceiptPDF\ReceiptPDF_1a40.pdf', 1354, 2832, 100, 0, 0, 2932, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:24:55.373' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:07:35.300' AS DateTime), CAST(N'2020-06-07T19:24:55.373' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (37, 43, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00028', N'\Upload\ReceiptPDF\ReceiptPDF_94c2.pdf', 1564, 4512, 100, 0, 0, 4612, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:25:05.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:08:01.647' AS DateTime), CAST(N'2020-06-07T19:25:05.893' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (38, 44, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00029', N'\Upload\ReceiptPDF\ReceiptPDF_c367.pdf', 1464, 3712, 100, 0, 0, 3812, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:25:16.833' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:08:30.307' AS DateTime), CAST(N'2020-06-07T19:25:16.833' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (39, 45, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00030', N'\Upload\ReceiptPDF\ReceiptPDF_1403.pdf', 1879, 7032, 100, 0, 0, 7132, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 2, CAST(N'2020-06-07T19:39:52.467' AS DateTime), N'HDFC', N'RTO', CAST(N'2020-06-08' AS Date), N'00001     ', NULL, CAST(N'2020-06-06T19:09:03.890' AS DateTime), CAST(N'2020-06-07T19:39:52.467' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (40, 46, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00031', N'\Upload\ReceiptPDF\ReceiptPDF_c277.pdf', 1546, 4368, 100, 0, 0, 4468, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 2, CAST(N'2020-06-07T19:40:19.417' AS DateTime), N'HDFC', N'RTO', CAST(N'2020-06-08' AS Date), N'00001     ', NULL, CAST(N'2020-06-06T19:09:41.083' AS DateTime), CAST(N'2020-06-07T19:40:19.417' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (41, 47, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00032', N'\Upload\ReceiptPDF\ReceiptPDF_2303.pdf', 1897, 7176, 100, 0, 0, 7276, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:10:06.013' AS DateTime), CAST(N'2020-06-06T19:10:06.013' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (42, 48, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00033', N'\Upload\ReceiptPDF\ReceiptPDF_8eef.pdf', 1776, 6208, 100, 0, 0, 6308, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:10:48.117' AS DateTime), CAST(N'2020-06-06T19:10:48.117' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (43, 49, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00034', N'\Upload\ReceiptPDF\ReceiptPDF_a6ff.pdf', 1676, 5408, 100, 0, 0, 5508, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:11:16.857' AS DateTime), CAST(N'2020-06-06T19:11:16.857' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (44, 50, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00035', N'\Upload\ReceiptPDF\ReceiptPDF_c6af.pdf', 1672, 5376, 100, 0, 0, 5476, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:11:43.880' AS DateTime), CAST(N'2020-06-06T19:11:43.880' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (45, 51, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00036', N'\Upload\ReceiptPDF\ReceiptPDF_0f85.pdf', 1767, 6136, 100, 0, 0, 6236, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:12:19.370' AS DateTime), CAST(N'2020-06-06T19:12:19.370' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (46, 52, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00037', N'\Upload\ReceiptPDF\ReceiptPDF_56f2.pdf', 1678, 5424, 100, 0, 0, 5524, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:13:01.007' AS DateTime), CAST(N'2020-06-06T19:13:01.007' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (47, 55, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00038', N'\Upload\ReceiptPDF\ReceiptPDF_4a12.pdf', 1576, 4608, 100, 0, 0, 4708, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:25:38.073' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:17:18.200' AS DateTime), CAST(N'2020-06-07T19:25:38.073' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (48, 56, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00039', N'\Upload\ReceiptPDF\ReceiptPDF_e6d1.pdf', 1757, 6056, 100, 0, 0, 6156, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:25:48.667' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:17:57.237' AS DateTime), CAST(N'2020-06-07T19:25:48.667' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (49, 57, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00040', N'\Upload\ReceiptPDF\ReceiptPDF_d4ae.pdf', 1646, 5168, 100, 0, 0, 5268, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:25:57.277' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:18:37.253' AS DateTime), CAST(N'2020-06-07T19:25:57.277' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (50, 58, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00041', N'\Upload\ReceiptPDF\ReceiptPDF_e2b7.pdf', 1446, 3568, 100, 0, 0, 3668, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:26:06.600' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:19:03.940' AS DateTime), CAST(N'2020-06-07T19:26:06.600' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (51, 59, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00042', N'\Upload\ReceiptPDF\ReceiptPDF_4bd7.pdf', 1767, 6136, 100, 0, 0, 6236, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:26:17.467' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:20:15.210' AS DateTime), CAST(N'2020-06-07T19:26:17.467' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (52, 60, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00043', N'\Upload\ReceiptPDF\ReceiptPDF_d857.pdf', 1767, 6136, 100, 0, 0, 6236, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:26:33.690' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:23:26.670' AS DateTime), CAST(N'2020-06-07T19:26:33.690' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (53, 61, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00044', N'\Upload\ReceiptPDF\ReceiptPDF_69c7.pdf', 1737, 5896, 100, 0, 0, 5996, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:26:46.413' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:24:04.950' AS DateTime), CAST(N'2020-06-07T19:26:46.413' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (54, 62, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00045', N'\Upload\ReceiptPDF\ReceiptPDF_756e.pdf', 1668, 5344, 100, 0, 0, 5444, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:27:00.090' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:24:32.530' AS DateTime), CAST(N'2020-06-07T19:27:00.090' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (55, 63, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00046', N'\Upload\ReceiptPDF\ReceiptPDF_7bb9.pdf', 1767, 6136, 100, 0, 0, 6236, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:27:10.473' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:25:00.043' AS DateTime), CAST(N'2020-06-07T19:27:10.473' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (56, 64, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00047', N'\Upload\ReceiptPDF\ReceiptPDF_f5b3.pdf', 1467, 3736, 100, 0, 0, 3836, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:27:21.040' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:25:25.937' AS DateTime), CAST(N'2020-06-07T19:27:21.040' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (57, 65, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00048', N'\Upload\ReceiptPDF\ReceiptPDF_f225.pdf', 1866, 6928, 100, 0, 0, 7028, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 2, CAST(N'2020-06-07T19:40:47.197' AS DateTime), N'HDFC', N'RTO', CAST(N'2020-06-08' AS Date), N'00001     ', NULL, CAST(N'2020-06-06T19:25:51.173' AS DateTime), CAST(N'2020-06-07T19:40:47.197' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (58, 66, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00049', N'\Upload\ReceiptPDF\ReceiptPDF_91d5.pdf', 1846, 6768, 100, 0, 0, 6868, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 2, CAST(N'2020-06-07T19:41:10.977' AS DateTime), N'HDFC', N'RTO', CAST(N'2020-06-08' AS Date), N'00001     ', NULL, CAST(N'2020-06-06T19:26:13.643' AS DateTime), CAST(N'2020-06-07T19:41:10.977' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (59, 67, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00050', N'\Upload\ReceiptPDF\ReceiptPDF_dbaa.pdf', 1343, 2744, 100, 0, 0, 2844, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:26:43.100' AS DateTime), CAST(N'2020-06-06T19:26:43.100' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (60, 68, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00051', N'\Upload\ReceiptPDF\ReceiptPDF_e655.pdf', 1235, 1880, 100, 0, 0, 1980, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:27:08.343' AS DateTime), CAST(N'2020-06-06T19:27:08.343' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (61, 69, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00052', N'\Upload\ReceiptPDF\ReceiptPDF_4a00.pdf', 1646, 5168, 100, 0, 0, 5268, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:27:35.183' AS DateTime), CAST(N'2020-06-06T19:27:35.183' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (62, 70, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00053', N'\Upload\ReceiptPDF\ReceiptPDF_c87f.pdf', 1534, 4272, 100, 0, 0, 4372, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:28:03.853' AS DateTime), CAST(N'2020-06-06T19:28:03.853' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (63, 71, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00054', N'\Upload\ReceiptPDF\ReceiptPDF_1dc1.pdf', 1354, 2832, 100, 0, 0, 2932, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:28:31.973' AS DateTime), CAST(N'2020-06-06T19:28:31.973' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (64, 72, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00055', N'\Upload\ReceiptPDF\ReceiptPDF_1078.pdf', 1387, 3096, 100, 0, 0, 3196, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:29:07.093' AS DateTime), CAST(N'2020-06-06T19:29:07.093' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (65, 75, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00056', N'\Upload\ReceiptPDF\ReceiptPDF_27d9.pdf', 1764, 6112, 100, 0, 0, 6212, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:27:34.317' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:32:46.027' AS DateTime), CAST(N'2020-06-07T19:27:34.317' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (66, 76, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00057', N'\Upload\ReceiptPDF\ReceiptPDF_bbbc.pdf', 1648, 5184, 100, 0, 0, 5284, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:27:45.840' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:33:11.543' AS DateTime), CAST(N'2020-06-07T19:27:45.840' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (67, 77, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00058', N'\Upload\ReceiptPDF\ReceiptPDF_89df.pdf', 1568, 4544, 100, 0, 0, 4644, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:29:45.150' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:34:22.193' AS DateTime), CAST(N'2020-06-07T19:29:45.150' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (68, 78, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00059', N'\Upload\ReceiptPDF\ReceiptPDF_5f9e.pdf', 1677, 5416, 100, 0, 0, 5516, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:30:00.657' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:35:48.527' AS DateTime), CAST(N'2020-06-07T19:30:00.657' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (69, 79, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00060', N'\Upload\ReceiptPDF\ReceiptPDF_8dc3.pdf', 1767, 6136, 100, 0, 0, 6236, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:30:12.583' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:36:18.680' AS DateTime), CAST(N'2020-06-07T19:30:12.583' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (70, 80, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00061', N'\Upload\ReceiptPDF\ReceiptPDF_4486.pdf', 1342, 2736, 100, 0, 0, 2836, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:30:21.697' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:36:45.257' AS DateTime), CAST(N'2020-06-07T19:30:21.697' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (71, 81, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00062', N'\Upload\ReceiptPDF\ReceiptPDF_b025.pdf', 1376, 3008, 100, 0, 0, 3108, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:30:31.007' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:37:13.033' AS DateTime), CAST(N'2020-06-07T19:30:31.007' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (72, 82, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00063', N'\Upload\ReceiptPDF\ReceiptPDF_2c74.pdf', 1763, 6104, 100, 0, 0, 6204, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:30:41.303' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:37:48.660' AS DateTime), CAST(N'2020-06-07T19:30:41.303' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (73, 83, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00064', N'\Upload\ReceiptPDF\ReceiptPDF_1135.pdf', 1676, 5408, 100, 0, 0, 5508, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:30:53.947' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:38:17.377' AS DateTime), CAST(N'2020-06-07T19:30:53.947' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (74, 84, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00065', N'\Upload\ReceiptPDF\ReceiptPDF_3e69.pdf', 1768, 6144, 100, 0, 0, 6244, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 1, CAST(N'2020-06-07T19:31:07.853' AS DateTime), NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:38:49.070' AS DateTime), CAST(N'2020-06-07T19:31:07.853' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (75, 85, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00066', N'\Upload\ReceiptPDF\ReceiptPDF_6d40.pdf', 1377, 3016, 100, 0, 0, 3116, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 2, CAST(N'2020-06-07T19:41:40.187' AS DateTime), N'HDFC', N'RTO', CAST(N'2020-06-08' AS Date), N'00001     ', NULL, CAST(N'2020-06-06T19:40:32.217' AS DateTime), CAST(N'2020-06-07T19:41:40.187' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (76, 86, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00067', N'\Upload\ReceiptPDF\ReceiptPDF_cc69.pdf', 1676, 5408, 100, 0, 0, 5508, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'2', 2, CAST(N'2020-06-07T19:42:03.153' AS DateTime), N'HDFC', N'RTO', CAST(N'2020-06-08' AS Date), N'00001     ', NULL, CAST(N'2020-06-06T19:40:58.347' AS DateTime), CAST(N'2020-06-07T19:42:03.153' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (77, 87, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00068', N'\Upload\ReceiptPDF\ReceiptPDF_4ee9.pdf', 1668, 5344, 100, 0, 0, 5444, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:41:28.493' AS DateTime), CAST(N'2020-06-06T19:41:28.493' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (78, 88, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00069', N'\Upload\ReceiptPDF\ReceiptPDF_8939.pdf', 1648, 5184, 100, 0, 0, 5284, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:41:57.327' AS DateTime), CAST(N'2020-06-06T19:41:57.327' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (79, 89, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00070', N'\Upload\ReceiptPDF\ReceiptPDF_5c25.pdf', 1674, 5392, 100, 0, 0, 5492, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:42:23.333' AS DateTime), CAST(N'2020-06-06T19:42:23.333' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (80, 90, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00071', N'\Upload\ReceiptPDF\ReceiptPDF_80e2.pdf', 1576, 4608, 100, 0, 0, 4708, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:43:03.920' AS DateTime), CAST(N'2020-06-06T19:43:03.920' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (81, 91, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00072', N'\Upload\ReceiptPDF\ReceiptPDF_15dc.pdf', 1684, 5472, 100, 0, 0, 5572, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:43:36.260' AS DateTime), CAST(N'2020-06-06T19:43:36.260' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (82, 92, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1000, N'F00073', N'\Upload\ReceiptPDF\ReceiptPDF_ce04.pdf', 1987, 7896, 100, 0, 0, 7996, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-06T19:44:01.173' AS DateTime), CAST(N'2020-06-06T19:44:01.173' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (89, 33, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1100, N'F00074', N'\Upload\ReceiptPDF\ReceiptPDF_3ed4.pdf', 1200, 800, 100, 0, 0, 900, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-12T12:09:46.173' AS DateTime), CAST(N'2020-06-12T12:09:46.173' AS DateTime), 1, NULL, 1)
GO
INSERT [dbo].[BillTransaction] ([BillId], [OwnerId], [Month], [Year], [BillDate], [LastUnit], [ReceiptNo], [ReceiptURL], [CurrentUnit], [WaterBillAmount], [Maintenance], [OtherCharge], [Penalty], [Total], [BillDueDate], [BillStatus], [PaymentType], [PaymentDate], [BankName], [BranchName], [ChequeDate], [ChequeNo], [AdvanceId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (90, 95, 5, 2020, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 20, N'F00075', N'\Upload\ReceiptPDF\ReceiptPDF_8013.pdf', 30, 80, 100, 50, 0, 230, CAST(N'2020-05-20T00:00:00.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-13T13:40:35.297' AS DateTime), CAST(N'2020-06-13T13:40:35.297' AS DateTime), 9, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[BillTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[ConfigurationMaster] ON 
GO
INSERT [dbo].[ConfigurationMaster] ([UnitId], [UnitRate], [Penalty], [BillDueDays], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (1, CAST(8 AS Numeric(18, 0)), 100, 20, CAST(N'2020-04-28T22:33:57.933' AS DateTime), CAST(N'2020-04-28T22:33:57.933' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[ConfigurationMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ExcelFiles] ON 
GO
INSERT [dbo].[ExcelFiles] ([UploloadId], [UploadFileName], [UploadURL], [DownloadURL], [Pass], [Fail], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (1, N'WaterBill2_2d24.xlsx', N'\Upload\UserUpload\WaterBill2_2d24.xlsx', N'\Upload\UserDownload\WaterBill2_2d24.xlsx', 8, 1, CAST(N'2020-05-15T00:22:49.933' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[ExcelFiles] ([UploloadId], [UploadFileName], [UploadURL], [DownloadURL], [Pass], [Fail], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (3, N'WaterBill_6399.xlsx', N'\Upload\UserUpload\WaterBill_6399.xlsx', N'\Upload\UserDownload\WaterBill_6399.xlsx', 72, 0, CAST(N'2020-06-05T12:33:21.297' AS DateTime), NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[ExcelFiles] OFF
GO
SET IDENTITY_INSERT [dbo].[FinancialYearMaster] ON 
GO
INSERT [dbo].[FinancialYearMaster] ([YearId], [YearName], [CreatedAt], [UpdatedAt], [CreatedBy], [Updatedby], [IsActive]) VALUES (1, N'2018-2019', CAST(N'2020-04-03T14:36:18.933' AS DateTime), CAST(N'2020-04-03T14:36:18.933' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[FinancialYearMaster] ([YearId], [YearName], [CreatedAt], [UpdatedAt], [CreatedBy], [Updatedby], [IsActive]) VALUES (2, N'2019-2020', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[FinancialYearMaster] ([YearId], [YearName], [CreatedAt], [UpdatedAt], [CreatedBy], [Updatedby], [IsActive]) VALUES (3, N'2020-2021', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[FinancialYearMaster] ([YearId], [YearName], [CreatedAt], [UpdatedAt], [CreatedBy], [Updatedby], [IsActive]) VALUES (4, N'2021-2022', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[FinancialYearMaster] ([YearId], [YearName], [CreatedAt], [UpdatedAt], [CreatedBy], [Updatedby], [IsActive]) VALUES (5, N'2022-2023', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[FinancialYearMaster] ([YearId], [YearName], [CreatedAt], [UpdatedAt], [CreatedBy], [Updatedby], [IsActive]) VALUES (6, N'2023-2024', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[FinancialYearMaster] ([YearId], [YearName], [CreatedAt], [UpdatedAt], [CreatedBy], [Updatedby], [IsActive]) VALUES (7, N'2024-2025', NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[FinancialYearMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupMaster] ON 
GO
INSERT [dbo].[GroupMaster] ([GroupId], [GroupName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (1, N'A', CAST(N'2020-04-02T23:38:58.690' AS DateTime), CAST(N'2020-04-11T16:13:26.460' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[GroupMaster] ([GroupId], [GroupName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (2, N'B', CAST(N'2020-04-02T23:40:24.160' AS DateTime), CAST(N'2020-05-17T14:46:55.103' AS DateTime), NULL, 3, 1)
GO
INSERT [dbo].[GroupMaster] ([GroupId], [GroupName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (3, N'C', CAST(N'2020-04-02T23:40:24.160' AS DateTime), CAST(N'2020-05-17T14:06:07.263' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[GroupMaster] ([GroupId], [GroupName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (16, N'D', CAST(N'2020-05-17T14:45:31.627' AS DateTime), CAST(N'2020-05-17T19:22:24.243' AS DateTime), 3, NULL, 1)
GO
INSERT [dbo].[GroupMaster] ([GroupId], [GroupName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (17, N'E', CAST(N'2020-06-13T13:27:39.430' AS DateTime), CAST(N'2020-06-13T13:27:39.430' AS DateTime), 9, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[GroupMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[MaintenanceMaster] ON 
GO
INSERT [dbo].[MaintenanceMaster] ([MaintenanceId], [MaintenanceName], [Amount], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (4, N'pipeline Cleaning', 500, 1, CAST(N'2020-04-12T22:04:30.553' AS DateTime), CAST(N'2020-06-13T13:24:57.167' AS DateTime), NULL, 9, 1)
GO
INSERT [dbo].[MaintenanceMaster] ([MaintenanceId], [MaintenanceName], [Amount], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (6, N'moter cleaning', 100, 2, CAST(N'2020-04-13T10:50:56.317' AS DateTime), CAST(N'2020-06-13T13:25:32.107' AS DateTime), NULL, 9, 1)
GO
INSERT [dbo].[MaintenanceMaster] ([MaintenanceId], [MaintenanceName], [Amount], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (8, N'taps services', 50, 3, CAST(N'2020-04-13T10:55:54.563' AS DateTime), CAST(N'2020-06-13T13:26:22.193' AS DateTime), NULL, 9, 1)
GO
INSERT [dbo].[MaintenanceMaster] ([MaintenanceId], [MaintenanceName], [Amount], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (9, N'Cleaning', 100, 16, NULL, CAST(N'2020-06-13T13:26:39.160' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[MaintenanceMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[MonthMaster] ON 
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (1, N'Jan')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (2, N'Feb')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (3, N'Mar')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (4, N'Apr')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (5, N'May')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (6, N'Jun')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (7, N'Jul')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (8, N'Aug')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (9, N'Sep')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (10, N'Oct')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (11, N'Nov')
GO
INSERT [dbo].[MonthMaster] ([MonthId], [Month]) VALUES (12, N'Dec')
GO
SET IDENTITY_INSERT [dbo].[MonthMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OwnerMaster] ON 
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (15, N'ronit panchal', N'A-101', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1100, 1, NULL, CAST(N'2020-06-13T13:34:07.263' AS DateTime), NULL, 9, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (16, N'Yassin Santos', N'A-102', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1200, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (17, N'Mehak Harrington', N'A-103', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1125, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (18, N'Bushra Woods', N'A-104', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1351, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (19, N'Khadija Gallagher', N'A-105', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1777, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (20, N'Efa Shaw', N'A-106', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1766, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (21, N'Hollie Guzman', N'A-107', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1354, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (22, N'Maxine Larson', N'A-108', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1797, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (23, N'Conner Carter', N'A-109', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1684, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (24, N'Zane Sadler', N'A-110', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1768, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (25, N'Kyra Maguire', N'A-111', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1656, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (26, N'Priya Hodge', N'A-112', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1646, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (27, N'Gabrielius Dyer', N'A-113', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1799, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (28, N'Abiha Clayton', N'A-114', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1179, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (29, N'Talha Cooper', N'A-115', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1864, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (30, N'Corbin Becker', N'A-116', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1546, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (31, N'Jo Garrison', N'A-117', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1646, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (32, N'Lukasz Lucas', N'A-118', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1354, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (33, N'Amba Hamilton', N'A-119', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1200, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (34, N'Zakk Heaton', N'A-120', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1100, 1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (35, N'Arran Hensley', N'B-101', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1646, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (36, N'Anisha Mcarthur', N'B-102', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1546, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (37, N'Darla Cairns', N'B-103', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1646, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (38, N'Patrik Yoder', N'B-104', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1677, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (39, N'Chase Aguilar', N'B-105', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1846, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (40, N'Amanda Fenton', N'B-106', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1846, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (41, N'Rianna Betts', N'B-107', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1876, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (42, N'Sohaib Cox', N'B-108', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1354, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (43, N'Kole Davies', N'B-109', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1564, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (44, N'Mared Hollis', N'B-110', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1464, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (45, N'Paul Tapia', N'B-111', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1879, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (46, N'Rayhaan Osborne', N'B-112', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1546, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (47, N'Kayleigh Hartman', N'B-113', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1897, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (48, N'Gracey Stuart', N'B-114', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1776, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (49, N'Star Beard', N'B-115', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1676, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (50, N'Raveena Cherry', N'B-116', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1672, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (51, N'Regina Rayner', N'B-117', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1767, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (52, N'Ashton Burch', N'B-118', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1678, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (53, N'Ritchie Hayden', N'B-119', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1100, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (54, N'Jordyn Payne', N'B-120', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1100, 2, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (55, N'Myles Bernal', N'C-101', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1576, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (56, N'Russell Hester', N'C-102', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1757, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (57, N'Kamal Briggs', N'C-103', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1646, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (58, N'Nuala Redman', N'C-104', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1446, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (59, N'Jarod Salazar', N'C-105', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1767, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (60, N'Hawwa Churchill', N'C-106', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1767, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (61, N'Akshay Couch', N'C-107', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1737, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (62, N'Saffa Manning', N'C-108', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1668, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (63, N'Sonny Ratliff', N'C-109', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1767, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (64, N'Maryam Ballard', N'C-110', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1467, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (65, N'Mali Suarez', N'C-111', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1866, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (66, N'Linda Duarte', N'C-112', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1846, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (67, N'Zakariyya Humphreys', N'C-113', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1343, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (68, N'Tanner Gross', N'C-114', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1235, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (69, N'Jonas Horne', N'C-115', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1646, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (70, N'Gus Kavanagh', N'C-116', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1534, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (71, N'Craig Ortega', N'C-117', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1354, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (72, N'Emile Poole', N'C-118', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1387, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (73, N'Jayde Joyner', N'C-119', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1100, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (74, N'Taiba Bowler', N'C-120', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1100, 3, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (75, N'Marni Cruz', N'D-101', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1764, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (76, N'Daniaal Sanford', N'D-102', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1648, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (77, N'Samiyah Boone', N'D-103', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1568, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (78, N'Kacey Day', N'D-104', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1677, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (79, N'Ayse Andrew', N'D-105', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1767, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (80, N'Shanaya Legge', N'D-106', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1342, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (81, N'Kobi Spencer', N'D-107', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1376, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (82, N'Georga Ahmad', N'D-108', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1763, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (83, N'Connor Calderon', N'D-109', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1676, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (84, N'Frankie West', N'D-110', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1768, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (85, N'Eric Hudson', N'D-111', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1377, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (86, N'Valentina Chung', N'D-112', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1676, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (87, N'Casey Mays', N'D-113', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1668, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (88, N'Noah Haney', N'D-114', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1648, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (89, N'Nigel Frye', N'D-115', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1674, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (90, N'Jaydan Wall', N'D-116', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1576, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (91, N'Paula Hail', N'D-117', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1684, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (92, N'Belle Schaefer', N'D-118', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1987, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (93, N'Lorena Albert', N'D-119', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1000, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (94, N'Martine Ingram', N'D-120', N'Vastrapur', N'123456789', N'roni.panchal.009@gmail.com', 1000, 16, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[OwnerMaster] ([OwnerId], [OwnerName], [BunglowNo], [AnotherAddress], [Mobile], [EmailId], [LastUnit], [GroupId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsActive]) VALUES (95, N'pooja shah', N'E-105', N'sabarmati', N'123', N'p@gmail.com', 30, 17, CAST(N'2020-06-13T13:30:03.473' AS DateTime), CAST(N'2020-06-13T13:30:03.473' AS DateTime), 9, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[OwnerMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ReceiptMonthCodeMaster] ON 
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (1, 1, N'A')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (2, 2, N'B')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (3, 3, N'C')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (4, 4, N'D')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (5, 5, N'E')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (6, 6, N'F')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (7, 7, N'G')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (8, 8, N'H')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (9, 9, N'I')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (10, 10, N'J')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (11, 11, N'K')
GO
INSERT [dbo].[ReceiptMonthCodeMaster] ([Id], [CurrentMonth], [CurrentMonthCode]) VALUES (12, 12, N'L')
GO
SET IDENTITY_INSERT [dbo].[ReceiptMonthCodeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentMaster] ON 
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (1, N'112', N'adsad@asd')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (2, N'1ishan12', N'ishan@asd')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (3, N'123', N'aaa@asd.sad')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (4, N'Anybody', N'anybody@gmail.com')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (5, N'Anybody', N'anybody@gmail.com')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (6, N'somebody', N'somebody@gmail.com')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (7, N'1ishan12', N'ishan@asd')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (8, N'abc', N'abc1@abc1.com')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (9, N'def', N'def@def.com')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (10, N'asasff', N'assf@df.com')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (11, N'kbc', N'kbc@kbc.com')
GO
INSERT [dbo].[StudentMaster] ([StudentId], [StudentName], [StudentEmail]) VALUES (12, N'asd', N'aa')
GO
SET IDENTITY_INSERT [dbo].[StudentMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON 
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (1, N'Ishan', N'Joshi', 0, N'Ishan@gmail.com', N'123', 1, N'SuperAdmin2')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (7, N'Admin', N'Admin', 0, N'Ishan1@gmail.com', N'123', 1, N'AdminOnly')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (8, N'User', N'uSER', 16, N'Ishan2@gmail.com', N'123', 2, N'UserOnly')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (9, N'Ronit', N'Panchal', 0, N'roni@gmail.com', N'123', 1, N'AdminOnly')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (10, N'GD', N'GD', 27, N'gd@gmail.com', N'123', 2, N'UserOnly')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (11, N'KH', N'KH', 47, N'kh@gmail.com', N'123', 2, N'UserOnly')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (12, N'ZH', N'ZH', 67, N'zh@gmail.com', N'123', 2, N'UserOnly')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (13, N'CM', N'CM', 87, N'cm@gmail.com', N'123', 2, N'UserOnly')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [OwnerId], [EmailId], [Password], [Role], [Roles]) VALUES (14, N'pooja', N'shah', 95, N'pooja@gmail.com', N'pooja@123', 2, N'UserOnly')
GO
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[YearMaster] ON 
GO
INSERT [dbo].[YearMaster] ([YearID], [Year]) VALUES (1, 2019)
GO
INSERT [dbo].[YearMaster] ([YearID], [Year]) VALUES (2, 2020)
GO
INSERT [dbo].[YearMaster] ([YearID], [Year]) VALUES (3, 2021)
GO
INSERT [dbo].[YearMaster] ([YearID], [Year]) VALUES (4, 2022)
GO
INSERT [dbo].[YearMaster] ([YearID], [Year]) VALUES (5, 2023)
GO
SET IDENTITY_INSERT [dbo].[YearMaster] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:deleted', 12, NULL)
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 4680, NULL)
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-05-14', 44, CAST(N'2020-06-14T19:02:26.753' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-05-15', 60, CAST(N'2020-06-15T18:41:05.387' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-05-16', 357, CAST(N'2020-06-16T20:52:04.120' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-05-17', 321, CAST(N'2020-06-17T17:04:00.197' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-05-20', 69, CAST(N'2020-06-20T13:23:09.197' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-05-21', 44, CAST(N'2020-06-21T06:18:03.247' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-05-31', 215, CAST(N'2020-06-30T17:48:13.187' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-02', 52, CAST(N'2020-07-02T08:49:00.667' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-03', 288, CAST(N'2020-07-03T17:13:02.860' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-04', 208, CAST(N'2020-07-04T17:33:11.130' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-05', 324, CAST(N'2020-07-05T12:35:10.170' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-06', 218, CAST(N'2020-07-06T19:25:08.890' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-07', 394, CAST(N'2020-07-07T17:23:09.910' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-08', 10, CAST(N'2020-07-08T05:28:10.610' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-12', 206, CAST(N'2020-07-12T14:16:00.373' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-13', 70, CAST(N'2020-07-13T09:02:33.373' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-13-09', 2, CAST(N'2020-06-14T09:02:33.373' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-14', 8, CAST(N'2020-07-14T09:00:04.687' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-14-08', 6, CAST(N'2020-06-15T08:59:04.433' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-14-09', 2, CAST(N'2020-06-15T09:00:04.687' AS DateTime))
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 1, NULL)
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 1, NULL)
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-14', 1, CAST(N'2020-07-14T09:01:04.787' AS DateTime))
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-14', 1, CAST(N'2020-07-14T09:02:05.063' AS DateTime))
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-14-09', 1, CAST(N'2020-06-15T09:01:04.787' AS DateTime))
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2020-06-14-09', 1, CAST(N'2020-06-15T09:02:05.063' AS DateTime))
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'CreatedAt', N'1588442272378', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'Cron', N'* * * * *', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'Job', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"],"a":["\"Easy!\""]}', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'LastExecution', N'1592125324889', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'LastJobId', N'14687', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'NextExecution', N'1592125380000', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'Queue', N'default', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'TimeZoneId', N'UTC', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Console.Write', N'V', N'2', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'CreatedAt', N'1588444626682', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'Cron', N'0 * * * *', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'Job', N'{"t":"WebApi.Interface.IBillTransactionService, WebApi","m":"BillService"}', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'LastExecution', N'1592125204498', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'LastJobId', N'14685', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'NextExecution', N'1592128800000', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'Queue', N'default', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'TimeZoneId', N'UTC', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IBillTransactionService.BillService', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14676, 24457, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-13T09:02:31.410' AS DateTime), CAST(N'2020-06-14T09:02:31.863' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14677, 24459, N'Succeeded', N'{"t":"WebApi.Interface.IBillTransactionService, WebApi","m":"BillService"}', N'[]', CAST(N'2020-06-13T09:02:31.713' AS DateTime), CAST(N'2020-06-14T09:02:33.393' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14678, 24464, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-14T08:55:18.710' AS DateTime), CAST(N'2020-06-15T08:55:19.143' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14679, 24465, N'Succeeded', N'{"t":"WebApi.Interface.IBillTransactionService, WebApi","m":"BillService"}', N'[]', CAST(N'2020-06-14T08:55:18.913' AS DateTime), CAST(N'2020-06-15T08:55:20.747' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14680, 24468, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-14T08:56:04.013' AS DateTime), CAST(N'2020-06-15T08:56:04.060' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14681, 24471, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-14T08:57:04.097' AS DateTime), CAST(N'2020-06-15T08:57:04.150' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14682, 24474, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-14T08:58:04.190' AS DateTime), CAST(N'2020-06-15T08:58:04.300' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14683, 24477, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-14T08:59:04.357' AS DateTime), CAST(N'2020-06-15T08:59:04.433' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14684, 24482, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-14T09:00:04.503' AS DateTime), CAST(N'2020-06-15T09:00:04.617' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14685, 24483, N'Succeeded', N'{"t":"WebApi.Interface.IBillTransactionService, WebApi","m":"BillService"}', N'[]', CAST(N'2020-06-14T09:00:04.550' AS DateTime), CAST(N'2020-06-15T09:00:04.690' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14686, 24486, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-14T09:01:04.663' AS DateTime), CAST(N'2020-06-15T09:01:04.787' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14687, 24489, N'Succeeded', N'{"t":"System.Console, mscorlib","m":"Write","p":["System.String"]}', N'["\"Easy!\""]', CAST(N'2020-06-14T09:02:04.930' AS DateTime), CAST(N'2020-06-15T09:02:05.063' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14676, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14676, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14676, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14676, N'Time', N'1592038951')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14677, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14677, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14677, N'RecurringJobId', N'"IBillTransactionService.BillService"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14677, N'Time', N'1592038951')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14678, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14678, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14678, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14678, N'Time', N'1592124918')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14679, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14679, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14679, N'RecurringJobId', N'"IBillTransactionService.BillService"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14679, N'Time', N'1592124918')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14680, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14680, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14680, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14680, N'Time', N'1592124964')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14681, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14681, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14681, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14681, N'Time', N'1592125024')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14682, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14682, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14682, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14682, N'Time', N'1592125084')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14683, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14683, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14683, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14683, N'Time', N'1592125144')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14684, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14684, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14684, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14684, N'Time', N'1592125204')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14685, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14685, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14685, N'RecurringJobId', N'"IBillTransactionService.BillService"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14685, N'Time', N'1592125204')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14686, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14686, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14686, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14686, N'Time', N'1592125264')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14687, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14687, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14687, N'RecurringJobId', N'"Console.Write"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14687, N'Time', N'1592125324')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (7)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2020-06-14T08:55:16.2602289Z"}', CAST(N'2020-06-14T09:02:48.737' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1592125380, N'Console.Write', NULL)
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1592128800, N'IBillTransactionService.BillService', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24454, 14676, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-13T09:02:31.643' AS DateTime), N'{"EnqueuedAt":"1592038951641","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24456, 14676, N'Processing', NULL, CAST(N'2020-06-13T09:02:31.777' AS DateTime), N'{"StartedAt":"1592038951772","ServerId":"desktop-ud3j3tp:16220:97d8ab3a-40bc-41ac-b47e-91459f2eabc9","WorkerId":"22d252b7-dcfa-476c-ac16-d1c65880ac16"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24457, 14676, N'Succeeded', NULL, CAST(N'2020-06-13T09:02:31.863' AS DateTime), N'{"SucceededAt":"1592038951861","PerformanceDuration":"3","Latency":"448"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24455, 14677, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-13T09:02:31.773' AS DateTime), N'{"EnqueuedAt":"1592038951772","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24458, 14677, N'Processing', NULL, CAST(N'2020-06-13T09:02:31.953' AS DateTime), N'{"StartedAt":"1592038951950","ServerId":"desktop-ud3j3tp:16220:97d8ab3a-40bc-41ac-b47e-91459f2eabc9","WorkerId":"0fc17565-6330-4030-8b51-2f4bc510f40d"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24459, 14677, N'Succeeded', NULL, CAST(N'2020-06-13T09:02:33.393' AS DateTime), N'{"SucceededAt":"1592038953314","PerformanceDuration":"795","Latency":"806","Result":"false"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24460, 14678, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T08:55:18.813' AS DateTime), N'{"EnqueuedAt":"1592124918797","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24463, 14678, N'Processing', NULL, CAST(N'2020-06-14T08:55:19.010' AS DateTime), N'{"StartedAt":"1592124918967","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"1cdd2619-798a-4406-bd0a-cbcd7c375e91"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24464, 14678, N'Succeeded', NULL, CAST(N'2020-06-14T08:55:19.140' AS DateTime), N'{"SucceededAt":"1592124919081","PerformanceDuration":"32","Latency":"338"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24461, 14679, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T08:55:18.913' AS DateTime), N'{"EnqueuedAt":"1592124918914","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24462, 14679, N'Processing', NULL, CAST(N'2020-06-14T08:55:19.010' AS DateTime), N'{"StartedAt":"1592124918970","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"265b6af2-4c41-4579-8f40-b1dbdd85b6f5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24465, 14679, N'Succeeded', NULL, CAST(N'2020-06-14T08:55:20.737' AS DateTime), N'{"SucceededAt":"1592124920612","PerformanceDuration":"1564","Latency":"135","Result":"false"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24466, 14680, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T08:56:04.020' AS DateTime), N'{"EnqueuedAt":"1592124964018","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24467, 14680, N'Processing', NULL, CAST(N'2020-06-14T08:56:04.047' AS DateTime), N'{"StartedAt":"1592124964042","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"0472726a-6ac4-4d2a-b981-5b01c2535f6f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24468, 14680, N'Succeeded', NULL, CAST(N'2020-06-14T08:56:04.060' AS DateTime), N'{"SucceededAt":"1592124964054","PerformanceDuration":"2","Latency":"39"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24469, 14681, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T08:57:04.103' AS DateTime), N'{"EnqueuedAt":"1592125024102","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24470, 14681, N'Processing', NULL, CAST(N'2020-06-14T08:57:04.140' AS DateTime), N'{"StartedAt":"1592125024138","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"36b51a38-dab5-4fc1-a725-3b3945c79411"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24471, 14681, N'Succeeded', NULL, CAST(N'2020-06-14T08:57:04.150' AS DateTime), N'{"SucceededAt":"1592125024145","PerformanceDuration":"1","Latency":"47"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24472, 14682, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T08:58:04.203' AS DateTime), N'{"EnqueuedAt":"1592125084203","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24473, 14682, N'Processing', NULL, CAST(N'2020-06-14T08:58:04.290' AS DateTime), N'{"StartedAt":"1592125084286","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"cdf51e1b-ab76-47ec-ad4c-2c7724ca35e1"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24474, 14682, N'Succeeded', NULL, CAST(N'2020-06-14T08:58:04.300' AS DateTime), N'{"SucceededAt":"1592125084296","PerformanceDuration":"4","Latency":"102"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24475, 14683, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T08:59:04.360' AS DateTime), N'{"EnqueuedAt":"1592125144361","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24476, 14683, N'Processing', NULL, CAST(N'2020-06-14T08:59:04.410' AS DateTime), N'{"StartedAt":"1592125144406","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"d31ff049-f368-477f-9f54-e87bfc7bd9fd"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24477, 14683, N'Succeeded', NULL, CAST(N'2020-06-14T08:59:04.433' AS DateTime), N'{"SucceededAt":"1592125144426","PerformanceDuration":"9","Latency":"59"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24478, 14684, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T09:00:04.517' AS DateTime), N'{"EnqueuedAt":"1592125204514","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24481, 14684, N'Processing', NULL, CAST(N'2020-06-14T09:00:04.597' AS DateTime), N'{"StartedAt":"1592125204594","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"ed6ed31a-73eb-42c4-9898-8e02794c4ba6"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24482, 14684, N'Succeeded', NULL, CAST(N'2020-06-14T09:00:04.617' AS DateTime), N'{"SucceededAt":"1592125204614","PerformanceDuration":"1","Latency":"110"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24479, 14685, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T09:00:04.553' AS DateTime), N'{"EnqueuedAt":"1592125204551","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24480, 14685, N'Processing', NULL, CAST(N'2020-06-14T09:00:04.597' AS DateTime), N'{"StartedAt":"1592125204595","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"d3c46ec0-96f3-4563-90d2-e7543c066e68"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24483, 14685, N'Succeeded', NULL, CAST(N'2020-06-14T09:00:04.690' AS DateTime), N'{"SucceededAt":"1592125204679","PerformanceDuration":"80","Latency":"49","Result":"false"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24484, 14686, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T09:01:04.673' AS DateTime), N'{"EnqueuedAt":"1592125264672","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24485, 14686, N'Processing', NULL, CAST(N'2020-06-14T09:01:04.777' AS DateTime), N'{"StartedAt":"1592125264775","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"f4ba3880-f45a-4bc7-bda0-a43a9bf974c2"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24486, 14686, N'Succeeded', NULL, CAST(N'2020-06-14T09:01:04.787' AS DateTime), N'{"SucceededAt":"1592125264785","PerformanceDuration":"3","Latency":"119"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24487, 14687, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2020-06-14T09:02:04.950' AS DateTime), N'{"EnqueuedAt":"1592125324948","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24488, 14687, N'Processing', NULL, CAST(N'2020-06-14T09:02:05.020' AS DateTime), N'{"StartedAt":"1592125325008","ServerId":"desktop-ud3j3tp:4772:c036da61-4936-4031-8020-a0366d4b9b4a","WorkerId":"46341853-6f29-4e56-9e75-825fd349a6b7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24489, 14687, N'Succeeded', NULL, CAST(N'2020-06-14T09:02:05.063' AS DateTime), N'{"SucceededAt":"1592125325055","PerformanceDuration":"3","Latency":"121"}')
GO
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
/****** Object:  StoredProcedure [dbo].[SP_AdminDashboard]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_AdminDashboard] 
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode VARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0

	IF @Mode='GetTotalOwner'
		BEGIN
			SELECT COUNT(OwnerId) AS TotalOwner FROM [dbo].[OwnerMaster]
		END

	IF @Mode='GetTotalAdvance'
		BEGIN
			SELECT COUNT(AdvanceId) AS TotalAdvance FROM [dbo].[AdvanceMaster] WHERE RemainAmount>0
		END

	IF @Mode='GetOverallUnPaid'
		BEGIN
			SELECT COUNT(BillId) as OverallUnPaid FROM [dbo].[BillTransaction] WHERE BillStatus=1
		END
	
	IF @Mode='GetOverallUnPaidBillStatusBlockWise'
		BEGIN
			SELECT COUNT(BM.BillId) as Total, GM.GroupName FROM [dbo].[BillTransaction] AS BM INNER JOIN [dbo].[OwnerMaster] AS OM
			ON OM.OwnerId=BM.OwnerId INNER JOIN [dbo].[GroupMaster] AS GM 
			ON OM.GroupId=GM.GroupId  WHERE BM.BillStatus=1 GROUP BY GM.GroupName
		END

	
	IF @Mode='GetMonthYear'
		BEGIN
			SELECT Month,Year(GETDATE()) as Year FROM [dbo].[MonthMaster] WHERE MonthId=((Month(GETDATE()))-1)
		END

	IF @Mode='GetCurrentPaid'
		BEGIN
			SELECT COUNT(BillId) FROM [dbo].[BillTransaction] WHERE Month=((Month(GETDATE()))-1) AND BillStatus=2
		END

	IF @Mode='GetCurrentUnPaid'
		BEGIN
			SELECT COUNT(BillId) FROM [dbo].[BillTransaction] WHERE Month=((Month(GETDATE()))-1) AND BillStatus=1
		END
	
	IF @Mode='GetMonthUnPaid'
		BEGIN
			SELECT COUNT(BM.BillId) as Total, GM.GroupName FROM [dbo].[BillTransaction] AS BM INNER JOIN [dbo].[OwnerMaster] AS OM
			ON OM.OwnerId=BM.OwnerId INNER JOIN [dbo].[GroupMaster] AS GM 
			ON OM.GroupId=GM.GroupId  WHERE BM.BillStatus=1 AND BM.Month=((Month(GETDATE()))-1) GROUP BY GM.GroupName
		END

	IF @Mode='GetMonthPaid'
		BEGIN
			SELECT COUNT(BM.BillId) as Total, GM.GroupName FROM [dbo].[BillTransaction] AS BM INNER JOIN [dbo].[OwnerMaster] AS OM
			ON OM.OwnerId=BM.OwnerId INNER JOIN [dbo].[GroupMaster] AS GM 
			ON OM.GroupId=GM.GroupId  WHERE BM.BillStatus=2 AND BM.Month=((Month(GETDATE()))-1) GROUP BY GM.GroupName
		END

	IF @Mode='GetMonthReceived'
		BEGIN
			SELECT SUM(Total) as TotalAmt FROM [dbo].[BillTransaction] WHERE BillStatus=2 AND Month=((Month(GETDATE()))-1)
		END

	IF @Mode='GetMonthCash'
		BEGIN
			SELECT COUNT(BM.BillId) as Total, GM.GroupName FROM [dbo].[BillTransaction] AS BM INNER JOIN [dbo].[OwnerMaster] AS OM
			ON OM.OwnerId=BM.OwnerId INNER JOIN [dbo].[GroupMaster] AS GM 
			ON OM.GroupId=GM.GroupId  WHERE BM.BillStatus=2 AND BM.Month=((Month(GETDATE()))-1) AND PaymentType=1 GROUP BY GM.GroupName
		END

	IF @Mode='GetMonthCheque'
		BEGIN
			SELECT COUNT(BM.BillId) as Total, GM.GroupName FROM [dbo].[BillTransaction] AS BM INNER JOIN [dbo].[OwnerMaster] AS OM
			ON OM.OwnerId=BM.OwnerId INNER JOIN [dbo].[GroupMaster] AS GM 
			ON OM.GroupId=GM.GroupId  WHERE BM.BillStatus=2 AND BM.Month=((Month(GETDATE()))-1) AND PaymentType=2 GROUP BY GM.GroupName
		END

	IF @Mode='GetMonthAdvance'
		BEGIN
			SELECT COUNT(BM.BillId) as Total, GM.GroupName FROM [dbo].[BillTransaction] AS BM INNER JOIN [dbo].[OwnerMaster] AS OM
			ON OM.OwnerId=BM.OwnerId INNER JOIN [dbo].[GroupMaster] AS GM 
			ON OM.GroupId=GM.GroupId  WHERE BM.BillStatus=2 AND BM.Month=((Month(GETDATE()))-1) AND PaymentType=3 GROUP BY GM.GroupName
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AdvanceMaster]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_AdvanceMaster] 
		@AdvanceId	BIGINT =NULL,
		@OwnerId	BIGINT =NULL,
		@Amount	NUMERIC(18,0) =NULL,
		@RemainAmount	NUMERIC(18,0) =NULL,
		@ChequeNo	VARCHAR(50) =NULL,
		@ChequeDate	DATE =NULL,
		@BankName VARCHAR(50) =NULL,
		@BranchName VARCHAR(50) =NULL,
		@ChequeCleared INT =NULL,
		@CreatedAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode NVARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0  

	IF @Mode='Insert'
		BEGIN
			IF NOT EXISTS (SELECT OwnerId FROM [dbo].[AdvanceMaster] WHERE OwnerId=@OwnerId and ChequeNo=@ChequeNo)
			BEGIN

			DECLARE @RAmount NUMERIC(18,0)

			SET @RAmount = (SELECT RemainAmount FROM [dbo].[AdvanceMaster] WHERE OwnerId=@OwnerId AND RemainAmount>0)

			SET @RemainAmount = @RemainAmount+@RAmount

			 INSERT INTO [dbo].[AdvanceMaster] (OwnerId, Amount, RemainAmount, ChequeNo, BankName, BranchName, ChequeCleared,ChequeDate, CreatedAt, UpdatedAt, CreatedBy, UpdatedBy, IsActive) VALUES
								(@OwnerId, @Amount, @Amount, @ChequeNo, @BankName, @BranchName, @ChequeCleared, @ChequeDate, CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), @CreatedBy, @UpdatedBy,@IsActive)
			SET @NewRowsInsert =  @@identity
			END
		END

	IF @Mode='Update'
		BEGIN
			UPDATE [dbo].[AdvanceMaster] 
			SET OwnerId=@OwnerId, Amount=@Amount, RemainAmount=@RemainAmount, ChequeNo=@ChequeNo, BankName=@BankName, ChequeDate=@ChequeDate,
			BranchName=@BranchName, ChequeCleared=@ChequeCleared, UpdatedBy=@UpdatedBy, 
			UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
			WHERE AdvanceId=@AdvanceId
			SET @NewRowsInsert =  @@ROWCOUNT	
		END

	IF @Mode ='SelectById'
	BEGIN
	SELECT * FROM [dbo].[AdvanceMaster] WHERE AdvanceId=@AdvanceId
	END
		
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT am.*,om.OwnerName,om.BunglowNo,gm.GroupName FROM [dbo].[AdvanceMaster] as am 
		 INNER JOIN [dbo].[OwnerMaster] as om ON am.OwnerId=om.OwnerId 
		 INNER JOIN [dbo].[GroupMaster] as gm ON om.GroupId = gm.GroupId ORDER BY RemainAmount 
	END

	IF @Mode ='SelectFlag'
	BEGIN
		 SELECT * FROM [dbo].[AdvanceMaster] WHERE IsActive=@IsActive ORDER BY RemainAmount 
	END

	IF @Mode='Delete'
		BEGIN
				SET @IsActive = (SELECT IsActive FROM [dbo].[AdvanceMaster] WHERE AdvanceId=@AdvanceId)

				IF @IsActive = '1'
					SET @IsActive = '0'
				ELSE 
				SET @IsActive = '1'

			 	UPDATE [dbo].[AdvanceMaster] SET IsActive=@IsActive,UpdatedBy=@UpdatedBy, 
				UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
				WHERE AdvanceId=@AdvanceId
				SET @NewRowsInsert =  @@ROWCOUNT
		END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_BillTransaction]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_BillTransaction] 
		@BillId    BIGINT =NULL,
		@OwnerId	BIGINT =NULL,
		@GroupId INT  =NULL,
		@Month	INT  =NULL,
		@Year	INT =NULL,
		@LastUnit	BIGINT =NULL,
		@ReceiptNo	varchar(50)	=NULL,
		@ReceiptURL	varchar(100)	=NULL,
		@CurrentUnit	BIGINT =NULL,
		@Maintenance	BIGINT =NULL,
		@OtherCharge	BIGINT =NULL,
		@Penalty	BIGINT =NULL,
		@BillDueDate	DATETIME =NULL,
		@BillDate	DATETIME =NULL,
		@Startdate	DATETIME =NULL,
		@Endate	DATETIME =NULL,
		@BillStatus	VARCHAR(50) =NULL,
		@PaymentType	INT =NULL,
		@BankName	VARCHAR(50) =NULL,
		@BranchName	VARCHAR(50) =NULL,
		@ChequeDate	DATE =NULL,
		@ChequeNo	NCHAR(10) =NULL,
		@AdvanceId	BIGINT =NULL,
		@Total	BIGINT =NULL,
		@CreatedAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode VARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0 

	IF @Mode='Insert'
		BEGIN
			IF NOT EXISTS (SELECT BillId FROM [dbo].[BillTransaction] WHERE OwnerId=@OwnerId AND Month=@Month AND Year=@Year )
			--and LastUnit=@LastUnit
			BEGIN

				DECLARE @billDueDays int
				DECLARE @diff BIGINT
				DECLARE @unitRate NUMERIC(18,0)
				DECLARE @WaterBillAmount NUMERIC(18,0)
				DECLARE @totalSub NUMERIC(18,0)
			

				SET @diff = @CurrentUnit - @LastUnit
				SET @unitRate = ( SELECT TOP 1 UnitRate from [dbo].[ConfigurationMaster] )
				SET @WaterBillAmount = (@diff * @unitRate)
				SET @totalSub =  @WaterBillAmount + @Maintenance + @OtherCharge
				SET @billDueDays =  ( SELECT TOP 1 BillDueDays from [dbo].[ConfigurationMaster] )

				SET @BillDueDate = DATEADD(DAY, @billDueDays -1 , @BillDueDate)

				EXEC SP_GetNewReceiptNumber @ReceiptNo OUT

				INSERT INTO [dbo].[BillTransaction] (OwnerId, Month, Year, LastUnit, CurrentUnit, Maintenance, OtherCharge, Penalty,WaterBillAmount, Total,BillDueDate,BillStatus, CreatedAt, UpdatedAt, CreatedBy, UpdatedBy, IsActive,ReceiptNo ,BillDate) VALUES
									(@OwnerId, @Month, @Year, @LastUnit, @CurrentUnit, @Maintenance, @OtherCharge, @Penalty,@WaterBillAmount, @totalSub,@BillDueDate,@BillStatus, CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), @CreatedBy, @UpdatedBy,@IsActive,@ReceiptNo,@BillDate)
				SET @NewRowsInsert =  @@identity

				UPDATE [dbo].[OwnerMaster] SET LastUnit=@CurrentUnit WHERE OwnerId = @OwnerId

				IF EXISTS (SELECT AdvanceId FROM [dbo].[AdvanceMaster] WHERE OwnerId=@OwnerId AND RemainAmount>=@Total )
				BEGIN

					DECLARE @RemainAmount NUMERIC(18,0)

					SET @RemainAmount = (SELECT RemainAmount from [dbo].[AdvanceMaster] WHERE OwnerId=@OwnerId AND ChequeCleared=2 AND RemainAmount>=@Total)
					SET @AdvanceId = (SELECT AdvanceId from [dbo].[AdvanceMaster] WHERE OwnerId=@OwnerId AND ChequeCleared=2 AND RemainAmount>=@Total)

					SET @RemainAmount = @RemainAmount-@Total

					UPDATE [dbo].[BillTransaction] SET AdvanceId=@AdvanceId,BillStatus=2,PaymentType=3 WHERE BillId=@@identity
					UPDATE [dbo].[AdvanceMaster] SET RemainAmount=@RemainAmount, 
						UpdatedAt= CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) WHERE AdvanceId=@AdvanceId
				END
			END
		END

	IF @Mode='Update'
		BEGIN
		UPDATE [dbo].[BillTransaction] SET BillStatus=@BillStatus, BankName=@BankName, BranchName=@BranchName, ChequeNo=@ChequeNo,
				PaymentType = @PaymentType, ChequeDate=@ChequeDate, UpdatedBy=@UpdatedBy,
				PaymentDate = CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) ,
				UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
				WHERE OwnerId=@OwnerId AND BillStatus=1
				SET @NewRowsInsert =  @@ROWCOUNT
				 
		END


	IF @Mode='UpdatePDFURL'
	BEGIN
	UPDATE [dbo].[BillTransaction] SET ReceiptURL = @ReceiptURL
			Where BillId = @BillId
			SET @NewRowsInsert =  @@ROWCOUNT
	END

	IF @Mode ='SelectById'
	BEGIN
		SELECT bm.*,om.OwnerName,om.BunglowNo,gm.GroupName FROM [dbo].[BillTransaction] as bm
		INNER JOIN [dbo].[OwnerMaster] as om ON bm.OwnerId=om.OwnerId 
		INNER JOIN [dbo].[GroupMaster] as gm ON om.GroupId=gm.GroupId WHERE BillId=@BillId
	END
		
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT bm.*,om.OwnerName,om.BunglowNo,gm.GroupName FROM [dbo].[BillTransaction] as bm
		 INNER JOIN [dbo].[OwnerMaster] as om ON bm.OwnerId=om.OwnerId 
		 INNER JOIN [dbo].[GroupMaster] as gm ON om.GroupId=gm.GroupId  ORDER BY BillId
	END

	IF @Mode ='SelectFlag'
	BEGIN
		 SELECT * FROM [dbo].[BillTransaction] WHERE IsActive=@IsActive ORDER BY BillId 
	END

	IF @Mode='Delete'
		BEGIN
				SET @IsActive = (SELECT IsActive FROM [dbo].[BillTransaction] WHERE BillId=@BillId)

				IF @IsActive = '1'
					SET @IsActive = '0'
				ELSE 
				SET @IsActive = '1'

			 	UPDATE [dbo].[BillTransaction] SET IsActive=@IsActive,UpdatedBy=@UpdatedBy, 
				UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
				WHERE BillId=@BillId
				SET @NewRowsInsert =  @@ROWCOUNT
		END

	IF @Mode = 'BillAUto'
	BEGIN
		DECLARE @penaltyAmount BIGINT
		SET @penaltyAmount =  ( SELECT TOP 1 Penalty from [dbo].[ConfigurationMaster] )
			UPDATE  BillTransaction 
			SET Penalty = @penaltyAmount , Total = Total + @PenaltyAmount
			WHERE BillStatus=0 AND CONVERT(VARCHAR(10),BillDueDate,101) < CONVERT(VARCHAR(10), GETDATE(),101)
			SET @NewRowsInsert =  @@ROWCOUNT
	END

	
	IF @Mode = 'BillReport'
	BEGIN
		 SELECT bm.*,om.OwnerName,om.BunglowNo,gm.GroupName FROM [dbo].[BillTransaction] as bm
		 INNER JOIN [dbo].[OwnerMaster] as om ON bm.OwnerId=om.OwnerId 
		 INNER JOIN [dbo].[GroupMaster] as gm ON om.GroupId=gm.GroupId 
		 Where
		(bm.OwnerId = ISNULL(@OwnerId, bm.OwnerId) OR bm.OwnerId IS NULL)
		AND (bm.PaymentType = ISNULL(@PaymentType, bm.PaymentType) OR bm.PaymentType IS NULL)
		AND (bm.BillStatus = ISNULL(@BillStatus, bm.BillStatus) OR bm.BillStatus IS NULL)
		AND (bm.BillDate >= ISNULL(@Startdate, bm.BillDate) OR bm.BillDate IS NULL)
		AND (bm.BillDate <= ISNULL(@Endate, bm.BillDate) OR bm.BillDate IS NULL)
		AND (om.GroupId = ISNULL(@GroupId, om.GroupId) OR om.GroupId IS NULL)

	END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConfigurationMaster]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE [dbo].[SP_ConfigurationMaster] 
		@UnitId	BIGINT =NULL,
		@UnitRate NUMERIC(18,0) =NULL,
		@Penalty	BIGINT =NULL,
		@CreatedAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode NVARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0  

	IF @Mode='Insert'
		BEGIN
			TRUNCATE TABLE [dbo].[ConfigurationMaster]
			 INSERT INTO [dbo].[ConfigurationMaster] (UnitRate, Penalty, CreatedAt, UpdatedAt, CreatedBy, UpdatedBy, IsActive) VALUES
								(@UnitRate, @Penalty, CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), @CreatedBy, @UpdatedBy,@IsActive)
			SET @NewRowsInsert =  @@identity
		END

	IF @Mode='Update'
		BEGIN
			IF NOT EXISTS (SELECT UnitRate FROM [dbo].[ConfigurationMaster] WHERE UnitRate=@UnitRate)
				BEGIN
					UPDATE [dbo].[ConfigurationMaster] SET UnitRate=@UnitRate, Penalty=@Penalty, UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE UnitId=@UnitId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
			ELSE
			BEGIN 
				IF  EXISTS ( SELECT UnitRate FROM [dbo].[ConfigurationMaster] WHERE UnitRate=@UnitRate AND UnitId=@UnitId )
				BEGIN
					UPDATE [dbo].[ConfigurationMaster] SET UnitRate=@UnitRate, Penalty=@Penalty, UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE UnitId=@UnitId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
				 
			END
			END

	IF @Mode ='SelectById'
	BEGIN
	SELECT * FROM [dbo].[ConfigurationMaster] WHERE UnitId=@UnitId
	END
		
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT * FROM [dbo].[ConfigurationMaster] ORDER BY UnitRate 
	END

	IF @Mode ='SelectFlag'
	BEGIN
		 SELECT * FROM [dbo].[ConfigurationMaster] WHERE IsActive=@IsActive ORDER BY UnitRate 
	END

	IF @Mode='Delete'
		BEGIN
				SET @IsActive = (SELECT IsActive FROM [dbo].[ConfigurationMaster] WHERE UnitId=@UnitId)

				IF @IsActive = '1'
					SET @IsActive = '0'
				ELSE 
				SET @IsActive = '1'

			 	UPDATE [dbo].[ConfigurationMaster] SET IsActive=@IsActive,UpdatedBy=@UpdatedBy, 
				UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
				WHERE UnitId=@UnitId
				SET @NewRowsInsert =  @@ROWCOUNT
		END


	IF @Mode='GetYear'
	BEGIN
			SELECT * FROM [dbo].[YearMaster]
	END

	IF @Mode='GetMonth'
	BEGIN
			SELECT * FROM [dbo].[MonthMaster]
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ExcelFiles]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ExcelFiles] 
		@UploloadId	bigint =NULL,
		@UploadFileName	varchar(100) =NULL,
		@UploadURL	varchar(100) =NULL,
		@DownloadURL	varchar(100) =NULL,
		@Pass	int =NULL,
		@Fail	int =NULL,
		@CreatedAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode NVARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0  

	IF @Mode='Insert'
		BEGIN
		--Note Ishan : BunglowNo = 101  => A-101

			 
			 INSERT INTO [dbo].[ExcelFiles] ( UploadFileName, UploadURL, DownloadURL, Pass, Fail, CreatedAt, CreatedBy, IsActive) VALUES
										(@UploadFileName, @UploadURL, @DownloadURL, @Pass,@Fail,CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')),@CreatedBy,@IsActive)
			SET @NewRowsInsert =  @@identity
		END

	  
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT * FROM [dbo].[ExcelFiles] ORDER BY CreatedAt 
	END


END
GO
/****** Object:  StoredProcedure [dbo].[SP_FinancialYearMaster]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_FinancialYearMaster] 
		@YearId	BIGINT =NULL,
		@YearName VARCHAR(50) =NULL,
		@CreatedAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode NVARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0  

	IF @Mode='Insert'
		BEGIN
			IF NOT EXISTS (SELECT YearName FROM [dbo].[FinancialYearMaster] WHERE YearName=@YearName)
			BEGIN
			 INSERT INTO [dbo].[FinancialYearMaster] (YearName, CreatedAt, UpdatedAt, CreatedBy, UpdatedBy, IsActive) VALUES
								(@YearName, CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), @CreatedBy, @UpdatedBy,@IsActive)
			SET @NewRowsInsert =  @@identity
			END
		END

	IF @Mode='Update'
		BEGIN
			IF NOT EXISTS (SELECT YearName FROM [dbo].[FinancialYearMaster] WHERE YearName=@YearName )
				BEGIN
					UPDATE [dbo].[FinancialYearMaster] SET YearName=@YearName,UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE YearId=@YearId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
			ELSE
			BEGIN 
				IF  EXISTS ( SELECT YearName FROM [dbo].[FinancialYearMaster] WHERE YearName=@YearName AND YearId=@YearId )
				BEGIN
					UPDATE [dbo].[FinancialYearMaster] SET YearName=@YearName,UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE YearId=@YearId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
				 
			END
			END

	IF @Mode ='SelectById'
	BEGIN
	SELECT * FROM [dbo].[FinancialYearMaster] WHERE YearId=@YearId
	END
		
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT * FROM [dbo].[FinancialYearMaster] ORDER BY YearName 
	END

	IF @Mode ='SelectFlag'
	BEGIN
		 SELECT * FROM [dbo].[FinancialYearMaster] WHERE IsActive=@IsActive ORDER BY YearName 
	END

	IF @Mode='Delete'
		BEGIN
				SET @IsActive = (SELECT IsActive FROM [dbo].[FinancialYearMaster] WHERE YearId=@YearId)

				IF @IsActive = '1'
					SET @IsActive = '0'
				ELSE 
				SET @IsActive = '1'

			 	UPDATE [dbo].[FinancialYearMaster] SET IsActive=@IsActive,UpdatedBy=@UpdatedBy, 
				UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
				WHERE YearId=@YearId
				SET @NewRowsInsert =  @@ROWCOUNT
		END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetNewReceiptNumber]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_GetNewReceiptNumber
CREATE PROCEDURE [dbo].[SP_GetNewReceiptNumber]
@PNR NVARCHAR(10)= NULL OUTPUT
AS
BEGIN

BEGIN TRY        
BEGIN TRANSACTION 

DECLARE @oldcode VARCHAR(10)= NULL  
DECLARE @CurrentMonth INT= NULL         
SELECT @CurrentMonth= MONTH(GETDATE())
DECLARE @CurrentMonthCode VARCHAR(1)= NULL       
SELECT @CurrentMonthCode = CurrentMonthCode FROM dbo.ReceiptMonthCodeMaster WHERE  CurrentMonth = @CurrentMonth

  SET @PNR = @CurrentMonthCode + '00001'        
  IF EXISTS (SELECT TOP 1 ReceiptNo FROM dbo.BillTransaction WHERE ReceiptNo IS NOT NULL AND ReceiptNo LIKE @CurrentMonthCode+'%'  ORDER BY BillId DESC)
  BEGIN     
	   SELECT TOP 1 @oldcode= ReceiptNo FROM dbo.BillTransaction 
	   WHERE ReceiptNo IS NOT NULL AND ReceiptNo LIKE @CurrentMonthCode+'%'  ORDER BY BillId DESC        
	   SELECT @PNR = CAST( CAST(SUBSTRING(@oldcode,2,6) AS INT) + 1 AS VARCHAR)    
	   
	   PRINT @PNR    
	   SELECT @PNR = STUFF( @CurrentMonthCode+'00000',6-LEN(@PNR)+1,LEN(@PNR),@PNR)       

  END  
	SELECT @PNR  AS PNR     
      
COMMIT TRANSACTION        
END TRY        
BEGIN CATCH        
ROLLBACK TRANSACTION        
END CATCH        

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GroupMaster]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_GroupMaster] 
		@GroupId	BIGINT =NULL,
		@GroupName VARCHAR(50) =NULL,
		@CreatedAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode VARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0 

	IF @Mode='Insert'
		BEGIN
			IF NOT EXISTS (SELECT GroupName FROM [dbo].[GroupMaster] WHERE GroupName=@GroupName)
			BEGIN
			 INSERT INTO [dbo].[GroupMaster] (GroupName, CreatedAt, UpdatedAt, CreatedBy, UpdatedBy, IsActive) VALUES
								(@GroupName, CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), @CreatedBy, @UpdatedBy,@IsActive)
			SET @NewRowsInsert =  @@identity
			END
		END

	IF @Mode='Update'
		BEGIN
			IF NOT EXISTS (SELECT GroupName FROM [dbo].[GroupMaster] WHERE GroupName=@GroupName )
				BEGIN
					UPDATE [dbo].[GroupMaster] SET GroupName=@GroupName,UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE GroupId=@GroupId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
			ELSE
			BEGIN 
				IF  EXISTS ( SELECT GroupName FROM [dbo].[GroupMaster] WHERE GroupName=@GroupName AND GroupId=@GroupId )
				BEGIN
					UPDATE [dbo].[GroupMaster] SET GroupName=@GroupName,UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE GroupId=@GroupId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
				 
			END
			END

	IF @Mode ='SelectById'
	BEGIN
	SELECT * FROM [dbo].[GroupMaster] WHERE GroupId=@GroupId
	END
		
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT * FROM [dbo].[GroupMaster] ORDER BY GroupName 
	END

	IF @Mode ='SelectFlag'
	BEGIN
		 SELECT * FROM [dbo].[GroupMaster] WHERE IsActive=@IsActive ORDER BY GroupName 
	END

	IF @Mode='Delete'
		BEGIN
				SET @IsActive = (SELECT IsActive FROM [dbo].[GroupMaster] WHERE GroupId=@GroupId)

				IF @IsActive = '1'
					SET @IsActive = '0'
				ELSE 
				SET @IsActive = '1'

			 	UPDATE [dbo].[GroupMaster] SET IsActive=@IsActive,UpdatedBy=@UpdatedBy, 
				UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
				WHERE GroupId=@GroupId
				SET @NewRowsInsert =  @@ROWCOUNT
		END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_MaintenanceMaster]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_MaintenanceMaster] 
		@MaintenanceId	BIGINT =NULL,
		@MaintenanceName VARCHAR(50)=NULL,
		@Amount BIGINT =NULL,
		@GroupId BIGINT =NULL,
		@CreatededAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode NVARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0  

	IF @Mode='Insert'
		BEGIN
			IF NOT EXISTS (SELECT Amount FROM [dbo].[MaintenanceMaster] WHERE Amount=@Amount and GroupId=@GroupId)
			BEGIN
			 INSERT INTO [dbo].[MaintenanceMaster] (MaintenanceName, Amount, GroupId, CreatedAt, UpdatedAt, CreatedBy, UpdatedBy, IsActive) VALUES
								(@MaintenanceName, @Amount, @GroupId, CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), @CreatedBy, @UpdatedBy,@IsActive)
			SET @NewRowsInsert =  @@identity
			END
		END

	IF @Mode='Update'
		BEGIN
			IF NOT EXISTS (SELECT MaintenanceName FROM [dbo].[MaintenanceMaster] WHERE Amount=@Amount and GroupId=@GroupId )
				BEGIN
					UPDATE [dbo].[MaintenanceMaster] SET MaintenanceName=@MaintenanceName, Amount=@Amount, GroupId=@GroupId, UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE MaintenanceId=@MaintenanceId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
			ELSE
			BEGIN 
				IF  EXISTS ( SELECT MaintenanceName FROM [dbo].[MaintenanceMaster] WHERE Amount=@Amount and MaintenanceId=@MaintenanceId )
				BEGIN
					UPDATE [dbo].[MaintenanceMaster] SET MaintenanceName=@MaintenanceName, Amount=@Amount, GroupId=@GroupId, UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE MaintenanceId=@MaintenanceId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
				 
			END
			END

	IF @Mode ='SelectById'
	BEGIN
	SELECT * FROM [dbo].[MaintenanceMaster] WHERE MaintenanceId=@MaintenanceId
	END
		
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT mm.*,gm.GroupName FROM [dbo].[MaintenanceMaster] AS mm
		 INNER JOIN  [dbo].[GroupMaster] gm ON mm.GroupId = gm.GroupId
		 ORDER BY Amount 
	END

	IF @Mode ='SelectFlag'
	BEGIN
		 SELECT * FROM [dbo].[MaintenanceMaster] WHERE IsActive=@IsActive ORDER BY Amount 
	END

	IF @Mode ='SelectByGroupId'
	BEGIN
		 SELECT Amount FROM [dbo].[MaintenanceMaster]  WHERE GroupId = @GroupId ORDER BY Amount

	END

	IF @Mode='Delete'
		BEGIN
				SET @IsActive = (SELECT IsActive FROM [dbo].[MaintenanceMaster] WHERE MaintenanceId=@MaintenanceId)

				IF @IsActive = '1'
					SET @IsActive = '0'
				ELSE 
				SET @IsActive = '1'

			 	UPDATE [dbo].[MaintenanceMaster] SET IsActive=@IsActive,UpdatedBy=@UpdatedBy, 
				UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
				WHERE MaintenanceId=@MaintenanceId
				SET @NewRowsInsert =  @@ROWCOUNT
		END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_OwnerMaster]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_OwnerMaster] 
		@OwnerId	BIGINT =NULL,
		@OwnerName	VARCHAR(50) =NULL,
		@BunglowNo	VARCHAR(50) =NULL,
		@AnotherAddress	VARCHAR(50) =NULL,
		@Mobile	VARCHAR(50) =NULL,
		@EmailId	VARCHAR(50) =NULL,
		@LastUnit FLOAT =NULL,
		@GroupId BIGINT =NULL,
		@CreatedAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode NVARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0  

	IF @Mode='Insert'
		BEGIN
		--Note Ishan : BunglowNo = 101  => A-101

			IF NOT EXISTS (SELECT BunglowNo FROM [dbo].[OwnerMaster] WHERE BunglowNo=@BunglowNo)
			BEGIN
			DECLARE @GroupName VARCHAR(50)
			SET @GroupName = (SELECT GroupName FROM [dbo].[GroupMaster] WHERE GroupId=@GroupId)
			SET @BunglowNo = @GroupName+'-'+@BunglowNo

			 INSERT INTO [dbo].[OwnerMaster] (OwnerName, BunglowNo, AnotherAddress, Mobile, EmailId, LastUnit, GroupId, CreatedAt, UpdatedAt, CreatedBy, UpdatedBy, IsActive) VALUES
								(@OwnerName, @BunglowNo, @AnotherAddress, @Mobile, @EmailId, @LastUnit, @GroupId, 
								CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')), 
								@CreatedBy, @UpdatedBy,@IsActive)
			SET @NewRowsInsert =  @@identity
			END
		END

	IF @Mode='Update'
		BEGIN
			IF NOT EXISTS (SELECT OwnerName FROM [dbo].[OwnerMaster] WHERE OwnerName=@OwnerName and Mobile=@Mobile)
				BEGIN
					UPDATE [dbo].[OwnerMaster] 
					SET OwnerName=@OwnerName, BunglowNo=@BunglowNo, AnotherAddress=@AnotherAddress, Mobile=@Mobile, EmailId=@EmailId, 
					LastUnit=@LastUnit, GroupId=@GroupId, UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE OwnerId=@OwnerId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
			ELSE
			BEGIN 
				IF  EXISTS (SELECT OwnerName FROM [dbo].[OwnerMaster] WHERE OwnerName=@OwnerName and Mobile=@Mobile and OwnerId=@OwnerId)
				BEGIN
					UPDATE [dbo].[OwnerMaster] 
					SET OwnerName=@OwnerName, BunglowNo=@BunglowNo, AnotherAddress=@AnotherAddress, Mobile=@Mobile, EmailId=@EmailId, 
					LastUnit=@LastUnit, GroupId=@GroupId, UpdatedBy=@UpdatedBy, 
					UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
					WHERE OwnerId=@OwnerId
					SET @NewRowsInsert =  @@ROWCOUNT
				END
				 
			END
			END

	IF @Mode ='SelectById'
	BEGIN
	SELECT * FROM [dbo].[OwnerMaster] WHERE OwnerId=@OwnerId
	END
		
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT om.*,gm.GroupName FROM [dbo].[OwnerMaster] AS om  
		 INNER JOIN  [dbo].[GroupMaster] gm ON om.GroupId=gm.GroupId ORDER BY OwnerName
	END


	IF @Mode ='SelectByGroupId'
	BEGIN
		 SELECT OwnerId,OwnerName,BunglowNo,LastUnit FROM [dbo].[OwnerMaster]  WHERE GroupId = @GroupId ORDER BY BunglowNo
	END

	IF @Mode ='SelectByBunglowNo'
	BEGIN
		 SELECT OwnerId,OwnerName,BunglowNo,LastUnit FROM [dbo].[OwnerMaster]  WHERE BunglowNo = @BunglowNo 
	END

	IF @Mode ='SelectFlag'
	BEGIN
		 SELECT * FROM [dbo].[OwnerMaster] WHERE IsActive=@IsActive ORDER BY OwnerName
	END

	IF @Mode='Delete'
		BEGIN
				SET @IsActive = (SELECT IsActive FROM [dbo].[OwnerMaster] WHERE OwnerId=@OwnerId)

				IF @IsActive = '1'
					SET @IsActive = '0'
				ELSE 
				SET @IsActive = '1'

			 	UPDATE [dbo].[OwnerMaster] SET IsActive=@IsActive,UpdatedBy=@UpdatedBy, 
				UpdatedAt =CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) 
				WHERE OwnerId=@OwnerId
				SET @NewRowsInsert =  @@ROWCOUNT
		END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_StudentMaster]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_StudentMaster] 
		
		@StudentId	int =null,
		@StudentEmail	varchar(50) =null,
		@StudentName	varchar(50) =null,
		@NewRowsInsert bigint=null OUTPUT,
		@RowsInsert bit=null OUTPUT,
		@Mode nvarchar(50)=null
		AS
BEGIN
	SET NOCOUNT OFF;  
	DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0  

	IF @Mode='Insert'
		BEGIN
			 
			 INSERT INTO [dbo].[StudentMaster] (StudentName, [StudentEmail]) VALUES
								(@StudentName, @StudentEmail)
			SET @NewRowsInsert =  @@identity
			 
		END

		IF @Mode='SelectALL'
		BEGIN
			 
			SELECT * FROM StudentMaster 
			 
		END
		 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserMaster]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_UserMaster] 
		@UserId	BIGINT =NULL,
		@FirstName NVARCHAR(50) =NULL,
		@LastName NVARCHAR(50) =NULL,
		@OwnerId BIGINT =NULL,
		@EmailId NVARCHAR(50) =NULL,
		@Password NVARCHAR(50) =NULL,
		@Role INT = NULL,
		@Roles NVARCHAR(50) =NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode VARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0 

	IF @Mode='Insert'
		BEGIN
			IF NOT EXISTS (SELECT UserId FROM [dbo].[UserMaster] WHERE OwnerId=@OwnerId AND EmailId=@EmailId)
			BEGIN
			 INSERT INTO [dbo].[UserMaster] (FirstName, LastName, OwnerId, EmailId, Password, Role, Roles) VALUES
								(@FirstName, @LastName, @OwnerId, @EmailId, @Password, @Role, @Roles)
			SET @NewRowsInsert =  @@identity
			END
		END

	
	IF @Mode ='SelectById'
	BEGIN
	SELECT UM.*,OM.OwnerName as OwnerName, OM.EmailId as OwnerEmail FROM [dbo].[UserMaster] AS UM INNER JOIN OwnerMaster AS OM ON UM.OwnerId=OM.OwnerId WHERE UM.UserId=@UserId
	END
		
	IF @Mode ='SelectAll'
	BEGIN
		 SELECT UM.*,OM.OwnerName as OwnerName, OM.EmailId as OwnerEmail FROM [dbo].[UserMaster] AS UM 
		 LEFT JOIN OwnerMaster AS OM ON UM.OwnerId=OM.OwnerId ORDER BY UserId 
	END

	IF @Mode ='Login'
	BEGIN
		 SELECT UM.UserId,UM.EmailId,UM.FirstName,UM.LastName,UM.Role,UM.Roles,UM.OwnerId
		 FROM [dbo].[UserMaster] AS UM 
		-- LEFT JOIN OwnerMaster AS OM ON UM.OwnerId=OM.OwnerId 
		 WHERE UM.EmailId = @EmailId AND UM.Password = @Password
		 ORDER BY UserId 
	END


END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserPanel]    Script Date: 14-Jun-20 2:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_UserPanel] 
		@UserId	BIGINT =NULL,
		@OwnerId	BIGINT =NULL,
		@CreatedAt DATETIME =NULL,
		@UpdatedAt DATETIME =NULL,
		@CreatedBy	BIGINT =NULL,
		@UpdatedBy BIGINT =NULL,
		@IsActive BIT=NULL,
		@count INT = NULL,
		@NewRowsInsert BIGINT=NULL OUTPUT,
		@RowsInsert BIT=NULL OUTPUT,
		@Mode VARCHAR(50)=NULL
		AS
BEGIN
	SET NOCOUNT OFF;  
	--DECLARE @RowCount1 INTEGER

	SET @NewRowsInsert = 0 

	IF @Mode='GetUnitDetails'
		BEGIN
			SELECT UnitRate,Penalty FROM [dbo].[ConfigurationMaster]
		END

	IF @Mode='GetCurrent'
		BEGIN
			SELECT TOP 1 Month,Total FROM [dbo].[BillTransaction] WHERE OwnerId=@OwnerId ORDER BY BillId DESC
		END

	IF @Mode='GetUnitUsed'
		BEGIN 
			SELECT TOP 12 Month,(CurrentUnit-LastUnit) AS UnitUsed FROM [dbo].[BillTransaction] WHERE OwnerId=@OwnerId ORDER BY BillId DESC
		END
	
	IF @Mode='GetUnpaid'
		BEGIN 
			SELECT * FROM [dbo].[BillTransaction] WHERE OwnerId=@OwnerId AND BillStatus=1 ORDER BY BillId DESC
		END
	
	IF @Mode='GetPaid'
		BEGIN 
			SELECT * FROM [dbo].[BillTransaction] WHERE OwnerId=@OwnerId AND BillStatus=2 ORDER BY BillId DESC
		END
	
	IF @Mode='Pay'
		BEGIN 
			UPDATE [dbo].[BillTransaction] SET BillStatus=2, PaymentType=4, UpdatedAt=CONVERT(DATETIME,SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) WHERE OwnerId=@OwnerId 
		END

	IF @Mode='Total'
		BEGIN 
			SELECT COUNT(BillId) as TotalMonth, SUM(WaterBillAmount) as TotalBillAmount, SUM(Maintenance) as TotalMaintenance, SUM(Penalty) as TotalPenalty,
				SUM(Total) as GrandTotal FROM [dbo].[BillTransaction] WHERE OwnerId=@OwnerId AND BillStatus=1
		END

	IF @Mode='GetOwnerId'
		BEGIN 
			SELECT OwnerId from [dbo].[UserMaster] WHERE UserId=@UserId
		END
	
END
GO
