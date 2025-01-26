/*If u lazy to change database from "master" :) 
	Use QLBH_1
	Go
*/


--create a new database 
	Create database QLBH_1new2
	Go


--create a table
Create table KHACHHANG
(
	MAKH char(4) NOT NULL, /*Key must have "NOT NULL" or this one*/
	HOTEN varchar(40),
	DCHI varchar(50),
	SODT varchar(20),
	NGSINH smalldatetime,
	NGDK smalldatetime,
	DOANHSO money
	/*Second way to create key if "Not null" in first line   (remember comma above)
		constraint PK_KH PRIMARY KEY (MAKH)
	*/
)
Go
	/*Third way to create key if u forget to key when create table*/
Alter table KHACHHANG ADD constraint PK_KH PRIMARY KEY (MAKH)
Go
	/*Change date type of attribute*/
Alter table KHACHHANG ALTER column HOTEN varchar(100)
Go
	/*Add new attribute*/
Alter table KHACHHANG ADD GHICHU varchar(200)
Go

--3
Alter table KHACHHANG ADD LOAIKH tinyint
Go

--6
Alter table KHACHHANG ALTER column LOAIKH varchar(20)
Go

--done tutorial--

Create table NHANVIEN
(
	MANV char(4) PRIMARY KEY,
	HOTEN varchar(40),
	SODT varchar(20),
	NGVL smalldatetime
)
Go


Create table SANPHAM
(
	MASP char(4) PRIMARY KEY,
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money
)
Go

--2
Alter table SANPHAM ADD GHICHU varchar(20)
Go
--4
Alter table SANPHAM ALTER column GHICHU varchar(100)
Go
--5 
Alter table SANPHAM DROP column GHICHU
Go
--7. DVT only Cay, Hop, Cai, Quyen, Chuc
Alter table SANPHAM ADD constraint CK_DVT
		Check (DVT IN ('Cay', 'Hop', 'Cai', 'Quyen', 'Chuc'))
Go
--8. Price must above 500 dong
Alter table SANPHAM ADD constraint CK_GIA
		Check (GIA >= 500)
Go
--9. Buy at least 1 product
Alter table SANPHAM ADD constraint CK_SL 
		Check (SL >= 1)
Go
--10. Date regist must later than date born of guests
Alter table SANPHAM ADD constraint CK_NGSINH_NGDK
		Check (NGSINH < NGDK)
Go


Create table HOADON
(
	SOHD int PRIMARY KEY,
	NGHD smalldatetime,
	MAKH char(4) FOREIGN KEY REFERENCES KHACHHANG(MAKH), /*Create foreign key point to the first place*/
	MANV char(4) FOREIGN KEY REFERENCES NHANVIEN(MANV), 
	TRIGIA money
)
Go

Create table CTHD
(
	SOHD int FOREIGN KEY REFERENCES HOADON(SOHD),
	MASP char(4) FOREIGN KEY REFERENCES SANPHAM(MASP),
	SL int,
	constraint PK_CTHD PRIMARY KEY (SOHD, MASP) /*For table that has many foreign key but no primary key yet*/
)
Go

SP_TABLES /*Check how many tables*/
Go

SP_COLUMNS KHACHHANG 
Go

SP_PKEYS HOADON
Go

SP_FKEYS HOADON
Go

/*delete database
	Use master
	DROP database QLBH_1
	Go
*/

--Insert data to tables

Set dateformat dmy /*Change format day month year*/
/*Table KHACHHANG*/
Insert into KHACHHANG values ('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451', '22/10/1960', 13060000, '22/07/2006')
Insert into KHACHHANG values ('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '3/4/1974', 280000, '30/7/2006')
Insert into KHACHHANG values ('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '12/6/1980', 3860000, '05/08/2006')
Insert into KHACHHANG values ('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '9/3/1965', 250000, '02/10/2006')
Insert into KHACHHANG values ('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '10/3/1950', 21000, '28/10/2006')
Insert into KHACHHANG values ('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '31/12/1981', 915000, '24/11/2006')
Insert into KHACHHANG values ('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '6/4/1971', 12500, '01/12/2006')
Insert into KHACHHANG values ('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '10/1/1971', 365000, '13/12/2006')
Insert into KHACHHANG values ('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '3/9/1979', 70000, '14/01/2007')
Insert into KHACHHANG values ('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '2/5/1983', 67500, '16/01/2007')
/*Table SANPHAM*/
Insert into SANPHAM values ('BC01', 'But chi', 'cay', 'Singapore', 3000)
Insert into SANPHAM values ('BC02', 'But chi', 'cay', 'Singapore' 5000)
Insert into SANPHAM values ('BC03', 'But chi', 'cay', 'Viet Nam', 3500)
Insert into SANPHAM values ('BC04', 'But chi', 'hop', 'Viet Nam', 30000)
Insert into SANPHAM values ('BB01', 'But bi', 'cay', 'Viet Nam', 5000)
Insert into SANPHAM values ('BB02', 'But bi', 'cay', 'Trung Quoc', 7000)
Insert into SANPHAM values ('BB03', 'But bi', 'hop', 'Thai Lan', 100000)
Insert into SANPHAM values ('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500)
Insert into SANPHAM values ('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500)
Insert into SANPHAM values ('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000)
Insert into SANPHAM values ('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500)
Insert into SANPHAM values ('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000)
Insert into SANPHAM values ('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000)
Insert into SANPHAM values ('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000)
Insert into SANPHAM values ('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000)
Insert into SANPHAM values ('ST02', 'So tay loai 1 quyen', 'Viet Nam', 55000)
Insert into SANPHAM values ('ST03', 'So tay loai 2 quyen', 'Viet Nam', 51000)
Insert into SANPHAM values ('ST04', 'So tay', 'quyen', 'Thai Lan', 55000)
Insert into SANPHAM values ('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000)
Insert into SANPHAM values ('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000)
Insert into SANPHAM values ('ST07', 'Phan khong bui', 'hop', 'Viet Nam' , 7000)
Insert into SANPHAM values ('ST08', 'Bong bang cai', 'Viet Nam', 1000)
Insert into SANPHAM values ('ST09', 'But long', 'cay', 'Viet Nam', 5000)
Insert into SANPHAM values ('ST10', 'But long', 'cay', 'Trung Quoc', 7000)
/*Table NHANVIEN*/
Insert into NHANVIEN values ('NV01', 'Nguyen Nhu Nhut' , '0927345678', '13/4/2006')
Insert into NHANVIEN values ('NV02', 'Le Thi Phi Yen', '0987567390', '21/4/2006')
Insert into NHANVIEN values ('NV03', 'Nguyen Van B', '0997047382', '27/4/2006')
Insert into NHANVIEN values ('NV04', 'Ngo Thanh Tuan', '0913758498', '24/6/2006')
Insert into NHANVIEN values ('NV05', 'Nguyen Thi Truc Thanh' ,'0918590387', '20/7/2006')
/*Table HOADON*/
Insert into HOADON values(1001, '23/07/2006', 'KH01', 'NV01', 320000)
Insert into HOADON values(1002, '12/08/2006', 'KH01', 'NV02', 840000)
Insert into HOADON values(1003, '23/08/2006', 'KH02', 'NV01', 100000)
Insert into HOADON values(1004, '01/09/2006', 'KH02', 'NV01', 180000)
Insert into HOADON values(1005, '20/10/2006', 'KH01', 'NV02', 3800000)
Insert into HOADON values(1006, '16/10/2006', 'KH01', 'NV03', 2430000)
Insert into HOADON values(1007, '28/10/2006', 'KH03', 'NV03', 510000)
Insert into HOADON values(1008, '28/10/2006', 'KH01', 'NV03', 440000)
Insert into HOADON values(1009, '28/10/2006', 'KH03', 'NV04', 200000)
Insert into HOADON values(1010, '01/11/2006', 'KH01', 'NV01', 5200000)
Insert into HOADON values(1011, '04/11/2006', 'KH04', 'NV03', 250000)
Insert into HOADON values(1012, '30/11/2006', 'KH05', 'NV03', 21000)
Insert into HOADON values(1013, '12/12/2006', 'KH06', 'NV01', 5000)
Insert into HOADON values(1014, '31/12/2006', 'KH03', 'NV02', 3150000)
Insert into HOADON values(1015, '01/01/2007', 'KH06', 'NV01', 910000)
Insert into HOADON values(1016, '01/01/2007', 'KH07', 'NV02', 12500)
Insert into HOADON values(1017, '02/01/2007', 'KH08', 'NV03', 35000)
Insert into HOADON values(1018, '13/01/2007', 'KH08', 'NV03', 330000)
Insert into HOADON values(1019, '13/01/2007', 'KH01', 'NV03', 30000)
Insert into HOADON values(1020, '14/01/2007', 'KH09', 'NV04', 70000)
Insert into HOADON values(1021, '16/01/2007', 'KH10', 'NV03', 67500)
Insert into HOADON values(1022, '16/01/2007', Null, 'NV03', 7000)
Insert into HOADON values(1023, '17/01/2007', Null, 'NV01', 330000)
/*Table CTHD*/
Insert into CTHD values(1001, 'TV02', 10)
Insert into CTHD values(1001, 'ST01', 5)
Insert into CTHD values(1001, 'BC01', 5)
Insert into CTHD values(1001, 'BC02', 10)
Insert into CTHD values(1001, 'ST08', 10)
Insert into CTHD values(1002, 'BC04', 20)
Insert into CTHD values(1002, 'BB01', 20)
Insert into CTHD values(1002, 'BB02', 20)
Insert into CTHD values(1003, 'BB03', 10)
Insert into CTHD values(1004, 'TV01', 20)
Insert into CTHD values(1004, 'TV02', 10)
Insert into CTHD values(1004, 'TV03', 10)
Insert into CTHD values(1004, 'TV04', 10)
Insert into CTHD values(1005, 'TV05', 50)
Insert into CTHD values(1005, 'TV06', 50)
Insert into CTHD values(1006, 'TV07', 20)
Insert into CTHD values(1006, 'ST01', 30)
Insert into CTHD values(1006, 'ST02', 10)
Insert into CTHD values(1007, 'ST03', 10)
Insert into CTHD values(1008, 'ST04', 8)
Insert into CTHD values(1009, 'ST05', 10)
Insert into CTHD values(1010, 'TV07', 50)
Insert into CTHD values(1010, 'ST07', 50)
Insert into CTHD values(1010, 'ST08', 100)
Insert into CTHD values(1010, 'ST04', 50)
Insert into CTHD values(1010, 'TV03', 100)
Insert into CTHD values(1011, 'ST06', 50)
Insert into CTHD values(1012, 'ST07', 3)
Insert into CTHD values(1013, 'ST08', 5)
Insert into CTHD values(1014, 'BC02', 80)
Insert into CTHD values(1014, 'BB02', 100)
Insert into CTHD values(1014, 'BC04', 60)
Insert into CTHD values(1014, 'BB01', 50)
Insert into CTHD values(1015, 'BB02', 30)
Insert into CTHD values(1015, 'BB03', 7)
Insert into CTHD values(1016, 'TV01', 5)
Insert into CTHD values(1017, 'TV02', 1)
Insert into CTHD values(1017, 'TV03', 1)
Insert into CTHD values(1017, 'TV04', 5)
Insert into CTHD values(1018, 'ST04', 6)
Insert into CTHD values(1019, 'ST05', 1)
Insert into CTHD values(1019, 'ST06', 2)
Insert into CTHD values(1020, 'ST07', 10)
Insert into CTHD values(1021, 'ST08', 5)
Insert into CTHD values(1021, 'TV01', 7)
Insert into CTHD values(1021, 'TV02', 10)
Insert into CTHD values(1022, 'ST07', 1)
Insert into CTHD values(1023, 'ST04', 6)


--Create new table from a recent table

Select * into SANPHAM1 from SANPHAM
Select * into KHACHHANG1 from KHACHHANG
Go
/*if u want to take only VN products
	Select * into SANPHAMVN from SANPHAM where NUOCSX = 'Viet Nam'
or */
	Select MASP,TENSP,DVT,GIA into SANPHAMVN
	from SANPHAM where NUOCSX = 'Viet Nam'

--Update data for tables

Update SANPHAM1
Set GIA = GIA * 1.05
Where NUOCSX = 'Thai Lan'

Update SANPHAM1
Set GIA = GIA * 0.95
Where (NUOCSX = 'Trung Quoc') and (GIA <= 10000)

Update KHACHHANG1
Set LOAIKH = 'Vip'
Where ((NGDK < '1/1/2007') and (DOANHSO >= 10000000)) or ((NGDK >= '1/1/2007') and (DOANHSO >= 2000000))

/*Print list with requirement*/
--1
Select MASP, TENSP
From SANPHAM
Where NUOCSX = 'TRUNG QUOC';
--2 "Where ... in ('...', '...');
Select MASP, TENSP
From SANPHAM
Where DVT in ('cay', 'quyen');
--3 "_" for a missing char, "%" for more than one
Select MASP, TENSP
From SANPHAM
Where MASP like 'B%01';
--4 "between <min value> and <max value>"
Select MASP, TENSP
From SANPHAM
Where (NUOCSX = 'TRUNG QUOC') and (GIA between 30000 and 40000);
--5
Select MASP, TENSP
From SANPHAM
Where (NUOCSX = 'TRUNG QUOC' or NUOCSX = 'THAI LAN') and (GIA between 30000 and 40000);
--6
Select SHD, TRIGIA 
From HOADON
Where NGHD in ('1/1/2007', '2/1/2007');
--7 Order by ... ASC (tang dan), ... DESC (giam dan)
Select SHD, NGHD, TRIGIA
Where (month(NGHD) = 1) and (year(NGHD) = 2007)
Order by NGHD ASC, TRIGIA DESC;

