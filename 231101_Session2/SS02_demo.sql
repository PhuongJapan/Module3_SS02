create database testQLBH;
use testQLBH;

-- 4.Lập bảng loại sản phẩm
create table loai_sanpham(
ma_loaisp varchar(4) primary key,
ten_loaisp varchar(30) not null,
ghichu varchar(100) not null
);
-- 5.Lập bảng sản phẩm
create table sanpham(
ma_sp varchar(4) primary key,
-- ma_loaisp nvarchar(4),
-- foreign key(ma_loaisp) references loai_sanpham(ma_loaisp),
ten_sp varchar(50) not null,
donvitinh_sp varchar(10) not null,
ghichu_sp varchar(100)
);
alter table sanpham
  add column ma_loaisp nvarchar(4);
alter table sanpham
  add constraint foreign key(ma_loaisp) references loai_sanpham(ma_loaisp);
alter table sanpham
modify column ma_sp varchar(4);
