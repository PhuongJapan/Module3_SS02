create database quanlyBanhang;
use quanlyBanhang;
-- 1.Lập bảng khách hàng
create table khachhang(
ma_kh varchar(4) primary key,
ten_kh varchar(30) not null,
diachi_kh varchar(50),
ngaysinh_kh datetime,
dienthoai_kh varchar(15) unique
);
-- 2.Lập bảng nhân viên
create table nhanvien(
ma_nv varchar(4) primary key,
hoten_nv varchar(30) not null,
gioitinh_nv bit not null,
diachi_nv varchar(50) not null,
ngaysinh_nv datetime not null,
dienthoai_nv varchar(15),
email_nv text,
noisinh_nv varchar(20) not null,
ngayvaolam datetime,
maNQL_nv varchar(4)
);
-- 3.Lập bảng nhà cung cấp
create table nhacungcap(
ma_ncc varchar(5) primary key,
ten_ncc varchar(50) not null,
diachi_ncc varchar(50) not null,
dienthoai_ncc char(15) not null,
email varchar(30) not null,
website_ncc varchar(30)
);
-- 4.Lập bảng loại sản phẩm
create table loai_sanpham(
ma_loaisp varchar(4) primary key,
ten_loaisp varchar(30) not null,
ghichu varchar(100) not null
);

-- 5.Lập bảng sản phẩm
create table sanpham(
ma_sp varchar(4) primary key,
ma_loaisp varchar(4),
foreign key(ma_loaisp) references loai_sanpham(ma_loaisp),
ten_sp varchar(50) not null,
donvitinh_sp varchar(10) not null,
ghichu_sp varchar(100)
);
-- 6.Lập bảng phiếu nhập
create table phieunhap(
soPN varchar(5) primary key,
ma_nv varchar(4) not null,
foreign key(ma_nv) references nhanvien(ma_nv),
ma_ncc varchar(5) not null,
foreign key(ma_ncc) references nhacungcap(ma_ncc),
ngaynhap datetime default(current_date()),
ghichu varchar(100)
);

-- 7. Lập bảng Chi tiết phiếu nhập
create table chitietphieunhap(
ma_sp varchar(4) not null,
foreign key(ma_sp) references sanpham(ma_sp),
soPN varchar(5) not null,
foreign key(soPN) references phieunhap(soPN),
primary key(ma_sp,soPN),
soluong smallint not null default(0),
gianhap real check(gianhap>=0)
);

-- 8. Lập bảng phiếu xuất
create table phieuxuat(
soPX varchar(5) primary key,
ma_nv varchar(4) not null,
foreign key(ma_nv) references nhanvien(ma_nv),
ma_kh varchar(5) not null,
foreign key(ma_kh) references khachhang(ma_kh),
ngayban datetime,
ghichu varchar(100)
);

-- 9.Lập chi tiết phiếu xuat
create table chitietphieuxuat(
ma_sp varchar(4),
foreign key(ma_sp) references sanpham(ma_sp),
soPX varchar(5),
foreign key(soPX) references phieuxuat(soPX),
primary key(ma_sp,soPX),
soluong smallint check(soluong>0),
giaban real check(giaban>0)
);

-- 10. Dùng câu lệnh alter để thêm ràng buộc khóa ngoại cho các bảng
