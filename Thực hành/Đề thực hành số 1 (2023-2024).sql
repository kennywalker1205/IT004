--1
Create Database DETHI
Go

Use DETHI
Go

Create Table KHACHHANG
(
	MAKH varchar(4) PRIMARY KEY,
	TENKH varchar(40),
	DIACHI varchar(40),
	LOAIKH varchar(40),
)

Create Table LOAICAY
(
	MALC varchar(4) PRIMARY KEY,
	TENLC varchar(40),
	XUATXU varchar(40),
	GIA money,
)

Create Table HOADON
(
	SOHD varchar(5) PRIMARY KEY,
	NGHD smalldatetime,
	MAKH varchar(4) FOREIGN KEY references KHACHHANG(MAKH),
	KHUYENMAI int,
)

Create Table CTHD
(
	SOHD varchar(5),
	MALC varchar(4),
	SOLUONG int,
	PRIMARY KEY (SOHD, MALC),
	FOREIGN KEY (SOHD) references HOADON(SOHD),
	FOREIGN KEY (MALC) references LOAICAY(MALC),
)
Go
--2
set dateformat dmy;

Insert into KHACHHANG (MAKH, TENKH, DIACHI, LOAIKH) values
('KH01', 'Liz Kim Cuong', 'Ha Noi', 'Vang lai'),
('KH02', 'Ivone Dieu Linh', 'Da Nang', 'Thuong xuyen'),
('KH03', 'Emma Nhat Khanh', 'TP.HCM', 'Vang lai')
Go

Insert into LOAICAY (MALC, TENLC, XUATXU, GIA) values
('LC01', 'Xuong rong tai tho', 'Mexico', '180.000'),
('LC02', 'Sen thach ngoc', 'Anh', '300.000'),
('LC03', 'Ba mau rau', 'Nam Phi', '270.000')
Go

Insert into HOADON (SOHD, NGHD, MAKH, KHUYENMAI) values
('00001', '22/11/2017', 'KH01', 5),
('00002', '04/12/2017', 'KH03', 5),
('00003', '10/12/2017', 'KH02', 10)
Go

Insert into CTHD (SOHD, MALC, SOLUONG) values
('00001', 'LC01', 1),
('00001', 'LC02', 2),
('00003', 'LC03', 5)
Go

Select * from CTHD
--3 T?t c? m?t hàng xu?t x? t? Anh ph?i có giá l?n h?n 250k
/*
         ins   del  upd
LOAICAY   +     -    +(XUATXU,GIA)
*/
Create Trigger R1_in_up on LOAICAY for insert, update as
begin
	if exists (Select * from inserted h where h.GIA <= 250.000 and h.XUATXU = 'Anh')
		begin
		raiserror('Gia phai lon hon 250.000', 16, 5)
		rollback tran
		end
end
Go

/*check*/
Insert into LOAICAY(MALC, TENLC, XUATXU, GIA) values ('LC04', 'LmaoCay', 'Anh', '240.000')

Select * from HOADON
--4 Hóa ??n mua v?i s? l??ng t?ng c?ng >= 5 ??u ?c gi?m giá 10%
/*      ins     del      upd
HD       -       -        +(KHUYENMAI)
CTHD     +       -        +(SOLUONG)
*/
Create Trigger R2_up on HOADON for update as
if update(KHUYENMAI)
	Declare @i int
	Select @i = (Select sum(SOLUONG)
				from inserted h, CTHD c
				where c.SOHD = h.SOHD
				group by c.SOHD)
		if exists (Select * from inserted h, CTHD c where c.SOHD = h.SOHD and @i >= 5 and KHUYENMAI < 10)
			begin
			raiserror('Hoa don so luong >= 5 duoc khuyen mai 10%', 16, 5)
			rollback tran
			end
Go

Create Trigger R2_up_in on CTHD for insert, update as
	Declare @i int
	Select @i = (Select sum(SOLUONG) 
	            from inserted h, HOADON c
				where c.SOHD = h.SOHD
				group by h.SOHD)
		if exists (Select * from inserted h, HOADON c where c.SOHD = h.SOHD and @i >= 5 and KHUYENMAI < 10)
			begin
			raiserror('Hoa don so luong >= 5 duoc giam gia 10%', 16, 6)
			rollback tran
			end
Go

/*check*/
Insert into CTHD (SOHD, MALC, SOLUONG) values 
('00001', 'LC03', 5);
go
Insert into CTHD (SOHD, MALC, SOLUONG) values 
('00002', 'LC01', 15)
Insert into CTHD (SOHD, MALC, SOLUONG) values 
('00003', 'LC01', 15)

Select * from CTHD
Drop Trigger R2_up

--5 Tìm t?t c? hóa ??n có ngày l?p hóa ??n trong quý 4/2017, s?p k?t qu? t?ng d?n theo ph?n tr?m gi?m giá
Select * 
From HOADON
Where (Month(NGHD) in (10,11,12)) and YEAR(NGHD) = 2017
Order by KHUYENMAI ASC;

--6 Tìm lo?i cây có s? l??ng mua ít nh?t trong tháng 12
Select LC.MALC, LC.TENLC
From LOAICAY LC 
	LEFT join CTHD on  LC.MALC = CTHD.MALC
	Join HOADON on HOADON.SOHD = CTHD.SOHD
Where SOLUONG in (
	Select Min(SOLUONG)
	From CTHD join HOADON on HOADON.SOHD = CTHD.SOHD
	Where Month(NGHD) = 12 )

--7 Tìm lo?i cây mà c? khách hàng th??ng xuyên và khách hàng vãng lai ??u mua
Select LC.MALC, LC.TENLC
From LOAICAY LC 
	Inner join CTHD on LC.MALC = CTHD.MALC
	Inner join HOADON on CTHD.SOHD = HOADON.SOHD
	Inner join KHACHHANG on KHACHHANG.MAKH = HOADON.MAKH
Where LOAIKH = 'Vang lai'
Intersect (
Select LC.MALC, LC.TENLC
From LOAICAY LC 
	Inner join CTHD on LC.MALC = CTHD.MALC
	Inner join HOADON on CTHD.SOHD = HOADON.SOHD
	Inner join KHACHHANG on KHACHHANG.MAKH = HOADON.MAKH
Where LOAIKH = 'Thuong xuyen')

--8 Tìm khách hàng ?ã t?ng mua t?t c? các lo?i cây
SELECT KH.TENKH
From KHACHHANG KH
Join HOADON HD on HD.MAKH = KH.MAKH
Join CTHD on CTHD.SOHD = HD.SOHD
Join LOAICAY LC on LC.MALC = CTHD.MALC
Group by KH.MAKH, KH.TENKH
Having count(distinct LC.MALC) = (Select count(MALC) from LOAICAY);


