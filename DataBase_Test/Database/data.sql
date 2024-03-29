USE [QuanLySinhVien]
GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 10/27/2023 9:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaSo] [int] NOT NULL,
	[MaMH] [varchar](6) NOT NULL,
	[Diem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSo] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 10/27/2023 9:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [varchar](6) NOT NULL,
	[TenKhoa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mon]    Script Date: 10/27/2023 9:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mon](
	[MaMH] [varchar](6) NOT NULL,
	[TenMH] [nvarchar](max) NULL,
	[SoTiet] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 10/27/2023 9:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSo] [int] NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [bit] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [int] NULL,
	[MaKhoa] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'KHOA01', N'Công nghệ thông tin')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'KHOA02', N'Kỹ thuật phần mềm')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'KHOA03', N'Toán ứng dụng')
GO
INSERT [dbo].[Mon] ([MaMH], [TenMH], [SoTiet]) VALUES (N'MHOC01', N'Lập trình C#', 45)
INSERT [dbo].[Mon] ([MaMH], [TenMH], [SoTiet]) VALUES (N'MHOC02', N'Lập trình Java', 45)
INSERT [dbo].[Mon] ([MaMH], [TenMH], [SoTiet]) VALUES (N'MHOC03', N'Phân tích thiết kế System', 46)
GO
INSERT [dbo].[SinhVien] ([MaSo], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [MaKhoa]) VALUES (1, N'Lê Tấn Tài', CAST(N'2000-01-01T00:00:00.000' AS DateTime), 1, N'Địa chỉ 1', 123456789, N'KHOA01')
INSERT [dbo].[SinhVien] ([MaSo], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [MaKhoa]) VALUES (2, N'Trọng Chiến', CAST(N'2001-02-02T00:00:00.000' AS DateTime), 0, N'Địa chỉ 2', 987654321, N'KHOA02')
INSERT [dbo].[SinhVien] ([MaSo], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [MaKhoa]) VALUES (3, N'Hoàng Tiến', CAST(N'1999-03-03T00:00:00.000' AS DateTime), 1, N'Địa chỉ 3', 555555555, N'KHOA03')
INSERT [dbo].[SinhVien] ([MaSo], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [MaKhoa]) VALUES (4, N'Phúc', CAST(N'2000-04-04T00:00:00.000' AS DateTime), 0, N'Địa chỉ 4', 444444444, N'KHOA01')
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[Mon] ([MaMH])
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD FOREIGN KEY([MaSo])
REFERENCES [dbo].[SinhVien] ([MaSo])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
