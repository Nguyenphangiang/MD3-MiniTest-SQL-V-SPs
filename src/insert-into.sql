insert into supplies values
    (1,'s01','Chảo đá hoa cương','Cái',500),
    (2,'s02','Nồi đá hoa cương','Cái',420),
    (3,'s03','Dao bếp','Con',200),
    (4,'s04','Thớt gỗ nghiến','Cái',180),
    (5,'s05','Bếp hồng ngoại','Chiếc',800);
insert into inventory values
    (1,1,30,15,10),(2,2,30,12,14),(3,3,50,20,25),(4,4,20,5,7),(5,5,15,5,8);
insert into producer values
    (1,'pd01','Cook Cu','Hà Nội','0911111111'),
    (2,'pd02','Bếp Việt','Hà Nội','0922222222'),
    (3,'pd03','Sweet Home','Đức','0933333333');
insert into supplies_order values
    (1,'so01','2022-3-25',3),(2,'so02','2022-3-27',2),(3,'so03','2022-4-1',1);
insert into goods_received values
    (1,'r01','2022-3-30',3),(2,'r02','2022-3-28',2),(3,'r03','2022-3-26',1);
insert into goods_delivery values
    (1,'d01','2022-4-1','Jacky Chen'),(2,'d02','2022-3-29','Dejavu'),
                                  (3,'d03','2022-3-28','Nguyễn Cao Kỳ');
insert into order_detail values
    (1,1,5,5),(2,1,4,3),(3,2,3,10),(4,2,2,4),(5,3,1,5),(6,3,1,10);
insert into received_detail values
    (1,3,1,10,500,'ko đè lên nhau'),(2,3,2,8,420,'ko đè lên nhau'),
    (3,2,3,10,200,'cẩn thận'),(4,2,4,5,180,'tránh nước'),
    (5,1,5,5,800,'dễ vỡ'),(6,1,3,7,200,'cẩn thận');
insert into delivery_detail values
    (1,3,1,15,550,'ko đề lên nhau'),(2,3,2,10,450,'ko đè lên nhau'),
    (3,2,3,12,250,'cẩn thận'),(4,2,4,8,220,'tránh nước'),
    (5,1,5,8,850,'dễ vỡ'),(6,1,3,10,250,'cẩn thận');
