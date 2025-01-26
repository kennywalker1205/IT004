-- Tao CSDL
USE MASTER
CREATE DATABASE QLBHnew1
go
-- Tao quan he, khoa chinh cua quan he
USE QLBHnew1
go
CREATE TABLE KHACHHANG
(
	MAKH 	CHAR(4) PRIMARY KEY,
	HOTEN	VARCHAR(40),
	DCHI	VARCHAR(50),
	SODT	VARCHAR(20),
	NGSINH	SMALLDATETIME,
	DOANHSO	MONEY,
	NGDK	SMALLDATETIME
)
go
CREATE TABLE NHANVIEN
(
	MANV	CHAR(4) PRIMARY KEY,
	HOTEN	VARCHAR(40),
	SODT	VARCHAR(20),
	NGVL	SMALLDATETIME
)
go
CREATE TABLE SANPHAM
(
	MASP	CHAR(4) PRIMARY KEY,
	TENSP	VARCHAR(40),
	DVT	VARCHAR(20),
	NUOCSX	VARCHAR(40),
	GIA	MONEY
)
go
CREATE TABLE HOADON
(
	SOHD	INT PRIMARY KEY,
	NGHD	SMALLDATETIME,
	MAKH	CHAR(4)FOREIGN KEY REFERENCES KHACHHANG(MAKH),
	MANV	CHAR(4)FOREIGN KEY REFERENCES NHANVIEN(MANV),
	TRIGIA	MONEY
)
go
CREATE TABLE CTHD
(
	SOHD	INT FOREIGN KEY REFERENCES HOADON(SOHD),
	MASP	CHAR(4)FOREIGN KEY REFERENCES SANPHAM(MASP),
	SL	INT,
	CONSTRAINT PK_CTHD PRIMARY KEY (SOHD,MASP)
)
go
-- Nhap lieu

Set dateformat dmy
go

insert into KHACHHANG values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','22/10/1960',13060000,'22/07/2006')
insert into KHACHHANG values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478','3/4/1974',280000,'30/07/2006')
insert into KHACHHANG values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266','12/6/1980',3860000,'05/08/2006')
insert into KHACHHANG values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476','9/3/1965',250000,'02/10/2006')
insert into KHACHHANG values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108','10/3/1950',21000,'28/10/2006')
insert into KHACHHANG values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738','31/12/1981',915000,'24/11/2006')
insert into KHACHHANG values('KH07','Nguyen Manh Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565','6/4/1971',12500,'01/12/2006')
insert into KHACHHANG values('KH08','Phan Thi Thanh Tam','45/2 An Duong Vuong, Q5, TpHCM','0938435756','10/1/1971',365000,'13/12/2006')
insert into KHACHHANG values('KH09','Le Ha Vinh','873 Cach Mang Thang Tam, QTB, TpHCM','08654763','3/9/1979',70000,'14/01/2007')
insert into KHACHHANG values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904','2/5/1983',67500,'16/01/2007')
go
insert into NHANVIEN values('NV01','Nguyen Nhu Nhut','0927345678','13/4/2006')
insert into NHANVIEN values('NV02','Le Thi Phi Yen','0987567390','21/4/2006')
insert into NHANVIEN values('NV03','Nguyen Van B','0997047382','27/4/2006')
insert into NHANVIEN values('NV04','Ngo Thanh Tuan','0913758498','24/6/2006')
insert into NHANVIEN values('NV05','Nguyen Thi Truc Thanh','0918590387','20/7/2006')
go
insert into SANPHAM values('BC01','But chi','cay','Singapore',3000)
insert into SANPHAM values('BC02','But chi','cay','Singapore',5000)
insert into SANPHAM values('BC03','But chi','cay','Viet Nam',3500)
insert into SANPHAM values('BC04','But chi','hop','Viet Nam',30000)
insert into SANPHAM values('BB01','But bi','cay','Viet Nam',5000)
insert into SANPHAM values('BB02','But bi','cay','Trung Quoc',7000)
insert into SANPHAM values('BB03','But bi','hop','Thai Lan',100000)
insert into SANPHAM values('TV01','Tap 100 trang giay mong','quyen','Trung Quoc',2500)
insert into SANPHAM values('TV02','Tap 200 trang giay mong','quyen','Trung Quoc',4500)
insert into SANPHAM values('TV03','Tap 100 trang giay tot','quyen','Viet Nam',3000)
insert into SANPHAM values('TV04','Tap 200 trang giay tot','quyen','Viet Nam',5500)
insert into SANPHAM values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into SANPHAM values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into SANPHAM values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into SANPHAM values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into SANPHAM values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into SANPHAM values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into SANPHAM values('ST04','So tay','quyen','Thai Lan',55000)
insert into SANPHAM values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into SANPHAM values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into SANPHAM values('ST07','Phan viet bang khong bui','hop','Viet Nam',7000)
insert into SANPHAM values('ST08','Bong bang','cai','Viet Nam',1000)
insert into SANPHAM values('ST09','But long','cay','Viet Nam',5000)
insert into SANPHAM values('ST10','But long mau','cay','Trung Quoc',7000)
go
insert into HOADON values(1001,'23/07/2006','KH01','NV01',320000)
insert into HOADON values(1002,'12/8/2006','KH01','NV02',840000)
insert into HOADON values(1003,'23/08/2006','KH02','NV01',100000)
insert into HOADON values(1004,'1/9/2006','KH02','NV01',180000)
insert into HOADON values(1005,'20/10/2006','KH01','NV02',3800000)
insert into HOADON values(1006,'16/10/2006','KH01','NV03',2430000)
insert into HOADON values(1007,'28/10/2006','KH03','NV03',510000)
insert into HOADON values(1008,'28/10/2006','KH01','NV03',440000)
insert into HOADON values(1009,'28/10/2006','KH03','NV04',200000)
insert into HOADON values(1010,'1/11/2006','KH01','NV01',5200000)
insert into HOADON values(1011,'4/11/2006','KH04','NV03',250000)
insert into HOADON values(1012,'30/11/2006','KH05','NV03',21000)
insert into HOADON values(1013,'12/12/2006','KH06','NV01',5000)
insert into HOADON values(1014,'31/12/2006','KH03','NV02',3150000)
insert into HOADON values(1015,'1/1/2007','KH06','NV01',910000)
insert into HOADON values(1016,'1/1/2007','KH07','NV02',12500)
insert into HOADON values(1017,'2/1/2007','KH08','NV03',35000)
insert into HOADON values(1018,'13/01/2007','KH08','NV03',330000)
insert into HOADON values(1019,'13/01/2007','KH01','NV03',30000)
insert into HOADON values(1020,'14/01/2007','KH09','NV04',70000)
insert into HOADON values(1021,'16/01/2007','KH10','NV03',67500)
insert into HOADON values(1022,'16/01/2007',Null,'NV03',7000)
insert into HOADON values(1023,'17/01/2007',Null,'NV01',330000)
go
insert into CTHD values(1001,'TV02',10)
insert into CTHD values(1001,'ST01',5)
insert into CTHD values(1001,'BC01',5)
insert into CTHD values(1001,'BC02',10)
insert into CTHD values(1001,'ST08',10)
insert into CTHD values(1002,'BC04',20)
insert into CTHD values(1002,'BB01',20)
insert into CTHD values(1002,'BB02',20)
insert into CTHD values(1003,'BB03',10)
insert into CTHD values(1004,'TV01',20)
insert into CTHD values(1004,'TV02',10)
insert into CTHD values(1004,'TV03',10)
insert into CTHD values(1004,'TV04',10)
insert into CTHD values(1005,'TV05',50)
insert into CTHD values(1005,'TV06',50)
insert into CTHD values(1006,'TV07',20)
insert into CTHD values(1006,'ST01',30)
insert into CTHD values(1006,'ST02',10)
insert into CTHD values(1007,'ST03',10)
insert into CTHD values(1008,'ST04',8)
insert into CTHD values(1009,'ST05',10)
insert into CTHD values(1010,'TV07',50)
insert into CTHD values(1010,'ST07',50)
insert into CTHD values(1010,'ST08',100)
insert into CTHD values(1010,'ST04',50)
insert into CTHD values(1010,'TV03',100)
insert into CTHD values(1011,'ST06',50)
insert into CTHD values(1012,'ST07',3)
insert into CTHD values(1013,'ST08',5)
insert into CTHD values(1014,'BC02',80)
insert into CTHD values(1014,'BB02',100)
insert into CTHD values(1014,'BC04',60)
insert into CTHD values(1014,'BB01',50)
insert into CTHD values(1015,'BB02',30)
insert into CTHD values(1015,'BB03',7)
insert into CTHD values(1016,'TV01',5)
insert into CTHD values(1017,'TV02',1)
insert into CTHD values(1017,'TV03',1)
insert into CTHD values(1017,'TV04',5)
insert into CTHD values(1018,'ST04',6)
insert into CTHD values(1019,'ST05',1)
insert into CTHD values(1019,'ST06',2)
insert into CTHD values(1020,'ST07',10)
insert into CTHD values(1021,'ST08',5)
insert into CTHD values(1021,'TV01',7)
insert into CTHD values(1021,'TV02',10)
insert into CTHD values(1022,'ST07',1)
insert into CTHD values(1023,'ST04',6)
go

-- CAU TRUY VAN
select * from KHACHHANG
select * from NHANVIEN
select * from SANPHAM
select * from HOADON
select * from CTHD

--I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
-- 1.	Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của quan hệ.
-- 2.	Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20)

-- 3.	Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG ADD LOAIKH TINYINT

-- 4.	Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100)

-- 5.	Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE SANPHAM DROP COLUMN GHICHU

-- 6.	Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, …
ALTER TABLE KHACHHANG DROP COLUMN LOAIKH
ALTER TABLE KHACHHANG ADD LOAIKH VARCHAR(20)

-- 7.	Đơn vị tính của sản phẩm chỉ có thể là (“cây”,”hộp”,”cái”,”quyển”,”chục”)
ALTER TABLE SANPHAM ADD CONSTRAINT CK_DVT CHECK (DVT IN ('Cay','Hop','Cai','Quyen','Chuc'))

-- 8.	Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM ADD CONSTRAINT CK_GIA CHECK (GIA >=500)

-- 9.	Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
ALTER TABLE CTHD ADD CONSTRAINT CK_SL CHECK (SL>=1)

-- 10.	Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE KHACHHANG ADD CONSTRAINT CK_NGSINH_NGDK CHECK (NGSINH < NGDK)

-- II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):	
-- 1.	Nhập dữ liệu cho các quan hệ trên.
-- 2.   Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG
select * into SANPHAM1 from SANPHAM
select * into KHACHHANG1 from KHACHHANG

-- 3.	Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (SANPHAM1).
update SANPHAM1
set gia=gia*1.05
where nuocsx='Thai Lan'

-- 4.	Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (SANPHAM1).
update SANPHAM1
set gia=gia*9.95
where nuocsx='Trung Quoc' and gia<=10000

-- 5.	Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 
--có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên.(KHACHHANG1)
--update KHACHHANG1
--set loaikh='Vip'
--where (ngdk<'1/1/2007' and doanhso>=10000000) or (ngdk>='1/1/2007' and doanhso>=2000000)

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
Select SOHD, TRIGIA 
From HOADON
Where NGHD in ('1/1/2007', '2/1/2007');
--7 Order by ... ASC (tang dan), ... DESC (giam dan)
Select SOHD, NGHD, TRIGIA
From HOADON
Where (month(NGHD) = 1) and (year(NGHD) = 2007)
Order by NGHD ASC, TRIGIA DESC;
--8 inner join
Select KHACHHANG.MAKH,HOTEN
From KHACHHANG inner join HOADON on KHACHHANG.MAKH=HOADON.MAKH
Where NGHD = '1/1/2007'
--9 
Select SOHD, TRIGIA
From HOADON inner join NHANVIEN on HOADON.MANV=NHANVIEN.MANV
Where HOTEN = 'Nguyen Van B' and NGHD = '28/10/2006';
--10
Select CTHD.MASP, TENSP
From SANPHAM inner join CTHD on SANPHAM.MASP=CTHD.MASP 
	Inner join HOADON on CTHD.SOHD=HOADON.SOHD
	Inner join KHACHHANG on HOADON.MAKH=KHACHHANG.MAKH
Where HOTEN = 'Nguyen Van A' and month(NGHD) = 10 and year(NGHD) = 2006; 
--11
Select SOHD
From CTHD 
Where MASP in ('BB01', 'BB02');
--12
Select Distinct SOHD
From CTHD 
Where MASP in ('BB01', 'BB02') and (SL between 10 and 20);
--13 Intersection (A + B)
/*
C1: Intersect
....
Where MASP='BB01'....
INTERSECT  --> this one
....
Where MASP='BB02'....
C2: In => Not In if (A - B)
Select Distinct SOHD
From CTHD
Where MASP='BB01' and ...... and SOHD IN 
								(Select Distinct SOHD From CTHD
								Where MASP='BB02' and .....)
C3: Exists
Select Distinct SOHD      as <Name column> (optional)
From CTHD 
Where MASP='BB01' and ...... and EXISTS 
								(Select * From CTHD <name>
								Where MASP='BB02' and ..... and <name>.SOHD=CTHD.SOHD)

C4:
Select Distinct C1.SOHD
From CTHD C1, CTHD C2
Where C1.MASP='BB01' and C1.SL between 10 and 20
	and C2.MASP='BB02' and C2.SL between 10 and 20
	and C1.SOHD=C2.SOHD
*/
Select SOHD
From CTHD 
Where MASP='BB01' and (SL between 10 and 20) and SOHD IN (
Select SOHD
From CTHD 
Where MASP='BB02' and (SL between 10 and 20))

--14
Select SANPHAM.MASP, TENSP
From SANPHAM inner join CTHD on SANPHAM.MASP=CTHD.MASP
	Inner join HOADON on HOADON.SOHD=CTHD.SOHD
Where NUOCSX = 'TRUNG QUOC' or NGHD = '1/1/2007';

--<another way>
Select MASP, TENSP 
From SANPHAM
Where NUOCSX = 'TRUNG QUOC'	or MASP IN (
Select MASP 
From CTHD inner join HOADON on CTHD.SOHD=HOADON.SOHD
Where NGHD = '1/1/2007')

--15
Select MASP, TENSP
From SANPHAM 
Where MASP not in (
Select distinct MASP
From CTHD);
--16
Select MASP, TENSP
From SANPHAM 
Where MASP not in (
Select distinct MASP
From CTHD inner join HOADON on CTHD.SOHD=HOADON.SOHD
Where year(NGHD) = 2006);
--17
Select MASP, TENSP
From SANPHAM 
Where NUOCSX = 'TRUNG QUOC' and MASP not in (
Select distinct MASP
From CTHD inner join HOADON on CTHD.SOHD=HOADON.SOHD
Where year(NGHD) = 2006);

/* các phép toán trên tập hợp
- HỘI: UNION/ ...OR...IN ()/ ...OR EXISTS ()
- GIAO: INTERSECT/ ...AND...IN ()/...AND EXISTS()
- TRỪ: EXCEPT/ ...AND ...NOT IN ()/...AND NOT EXISTS()
- CHIA: sử dụng NOT EXISTS và sử dụng hàm tính toán
*/
--18: tìm số hóa đơn: không có sản phẩm nào do Sing sản xuất, 
--mà hóa đơn đó không mua

SELECT SOHD
FROM HOADON
WHERE YEAR(NGHD)=2006 AND 
NOT EXISTS (SELECT * FROM SANPHAM WHERE NUOCSX='SINGAPORE' AND 
		NOT EXISTS (SELECT * FROM CTHD WHERE CTHD.SOHD=HOADON.SOHD AND 
										CTHD.MASP=SANPHAM.MASP))
--24
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD)=2006

--24.1: doanh thu bán hàng mỗi tháng trong năm 2006
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD)=2006
GROUP BY MONTH(NGHD)

--20
SELECT COUNT(*) AS SLHD FROM HOADON WHERE MAKH IS NULL

--22
SELECT MIN(TRIGIA) AS TN, MAX(TRIGIA) AS CN FROM HOADON

--25
SELECT SOHD FROM HOADON WHERE YEAR(NGHD)=2006 AND TRIGIA=
			(SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD)=2006)

--26
SELECT KHACHHANG.* FROM HOADON INNER JOIN KHACHHANG 
		ON HOADON.MAKH=KHACHHANG.MAKH
WHERE YEAR(NGHD)=2006 AND TRIGIA=
			(SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD)=2006)

--27
SELECT TOP 3 MAKH,HOTEN,DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC

--28
SELECT * FROM SANPHAM WHERE GIA IN
		(SELECT DISTINCT TOP 3 GIA
		FROM SANPHAM
		ORDER BY GIA DESC
		)
--38
SELECT SOHD, COUNT(DISTINCT MASP), SUM(SL) AS TONGSLSP FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP)>=4

--39
SELECT SOHD, COUNT(DISTINCT CTHD.MASP) 
FROM CTHD INNER JOIN SANPHAM ON CTHD.MASP=SANPHAM.MASP
WHERE NUOCSX='VIET NAM'
GROUP BY SOHD
HAVING COUNT(DISTINCT CTHD.MASP)=3

--40
--C1:
SELECT TOP 1 KHACHHANG.MAKH, HOTEN, COUNT(*) AS SLMH
FROM KHACHHANG INNER JOIN HOADON ON KHACHHANG.MAKH=HOADON.MAKH
GROUP BY KHACHHANG.MAKH, HOTEN
ORDER BY COUNT(*) DESC

--C2:
SELECT kHACHHANG.MAKH, HOTEN, COUNT(*) AS SLMH
FROM KHACHHANG INNER JOIN HOADON ON KHACHHANG.MAKH=HOADON.MAKH
GROUP BY KHACHHANG.MAKH, HOTEN
HAVING COUNT(*)=(
		SELECT TOP 1 COUNT(*) AS SLMH
		FROM HOADON
		GROUP BY MAKH
		ORDER BY COUNT(*) DESC)
--C3:
SELECT kHACHHANG.MAKH, HOTEN, COUNT(*) AS SLMH
FROM KHACHHANG INNER JOIN HOADON ON KHACHHANG.MAKH=HOADON.MAKH
GROUP BY KHACHHANG.MAKH, HOTEN
HAVING COUNT(*)>=ALL(
		SELECT COUNT(*) AS SLMH
		FROM HOADON
		GROUP BY MAKH)


----------------------------------
--TÌM SỐ HÓA ĐƠN CÓ TRỊ GIÁ CAO NHẤT
--C1:
SELECT SOHD FROM HOADON WHERE TRIGIA= (SELECT MAX(TRIGIA) FROM HOADON)

--C2:
SELECT SOHD FROM HOADON 
	WHERE TRIGIA= (SELECT TOP 1 TRIGIA FROM HOADON ORDER BY TRIGIA DESC)

--C3:
SELECT SOHD FROM HOADON 
	WHERE TRIGIA >= ALL(SELECT TRIGIA FROM HOADON)