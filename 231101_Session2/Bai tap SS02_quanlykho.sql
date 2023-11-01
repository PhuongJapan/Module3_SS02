create database QLKHo;
use QLKHo;
-- 1. Lập bảng phiếu xuất
create table phieuxuat(
soPx char(4) primary key,
ngayXuat date
);
-- 2. Lập bảng vật tư
create table vattu(
mavtu char(4) primary key,
tenvtu varchar(50)
);

-- 3. Lập bảng chi tiết phiếu xuất
create table ctphieuxuat(
sopx char(4),
foreign key(sopx) references phieuxuat(sopx),
mavtu char(4),
foreign key(mavtu) references vattu(mavtu),
primary key(sopx,mavtu),
slxuat int,
dgxuat float
);

-- 4. Lập bảng phiếu nhập
create table phieunhap(
sopn char(4) primary key,
ngaynhap date
);
-- 5. Lập bảng chi tiết phiếu nhập
create table chitietphieunhap(
mavtu char(4),
foreign key(mavtu) references vattu(mavtu),
sopn char(4),
foreign key(sopn) references phieunhap(sopn),
primary key(mavtu,sopn),
dgnhap float,
slnhap int
);
 -- 6. Lập bảng nhà cung cấp
 create table nhacungcap(
  ma_ncc char(4) primary key,
  ten_ncc char(15),
  diachi_ncc char(40),
  sdt_ncc char(10)
 );
-- 7. Lập bảng đơn đặt hàng
create table dondathang(
 sodh char(4) primary key,
 ngaydh date,
 ma_ncc char(4),
 foreign key(ma_ncc) references nhacungcap(ma_ncc) 
 );
 
 -- 8. Lập bảng chi tiết đơn đặt hàng
 create table chitietdondathang(
 mavtu char(4),
 foreign key(mavtu) references vattu(mavtu),
 sodh char(4),
 foreign key(sodh) references dondathang(sodh),
 primary key(mavtu,sodh)
 );
 


