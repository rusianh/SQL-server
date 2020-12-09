create database demoLab4BaiVeNha
GO
use demoLab4BaiVeNha
GO

create table SANPHAM (
	MaSP int primary key identity, 
	TenSP nvarchar(100) NOT NULL, 
	LoaiSP nvarchar(50), 
	SoLuong int NOT NULL DEFAULT(1) CHECK(SoLuong>=0), 
	DonGia int NOT NULL DEFAULT(5000) CHECK(DonGia>=0)
)
;
create table DAILY (
	MaDL int primary key identity, 
	TenDL nvarchar(100) NOT NULL, 
	DiaChi nvarchar(200), 
	DienThoai varchar(50), 
	SoTienNo int NOT NULL DEFAULT(0)
)
;
create table PHIEUXUAT (
	SoHieuPhieu int primary key identity,
	NgayPhatHanh date,
	TenDL nvarchar(100) NOT NULL,
	DiaChi nvarchar(200), 
	TenNguoiNhan nvarchar(100), 
	NgayXuat date,
	ThanhTien int NOT NULL DEFAULT(0),
	MaDL int NOT NULL FOREIGN KEY REFERENCES DAILY(MaDL)
)
;
create table HOADON (
	SoHieuPhieu int NOT NULL FOREIGN KEY REFERENCES PHIEUXUAT(SoHieuPhieu), 
	MaSP int NOT NULL FOREIGN KEY REFERENCES SANPHAM(MaSP), 
	DonGia int NOT NULL DEFAULT(5000) CHECK(DonGia>=0), 
	SoLuongXuat int NOT NULL DEFAULT(1) CHECK(SoLuongXuat>=0), 
	TongSoTien int NOT NULL DEFAULT(0) CHECK(TongSoTien>=0), 
	ChuKi nvarchar(100),
	ThuTruong nvarchar(100),
	PRIMARY KEY (SoHieuPhieu,MaSP)
)
;