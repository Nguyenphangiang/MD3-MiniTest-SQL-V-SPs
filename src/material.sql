create database material;
use material;

create table supplies (
                          id int primary key ,
                          suppliesCode nvarchar(10),
                          suppliesName nvarchar(50),
                          suppliesUnit nvarchar(10),
                          suppliesPrice int
);
create table inventory (
                           id int primary key ,
                           supplies_id int,
                           quantity int,
                           totalImport int,
                           totalExport int,
                           foreign key (supplies_id) references supplies(id)
);
create table producer (
    id int primary key ,
    producerCode nvarchar(10),
    producerName nvarchar(50),
    producerAddress nvarchar(100),
    producerPhone nvarchar(10)
);
create table supplies_order(
    id int primary key ,
    supplies_orderCode nvarchar(10),
    supplies_orderDate datetime,
    producer_id int,
    foreign key (producer_id) references producer(id)
);
create table goods_received(
    id int primary key ,
    receivedCode nvarchar(10),
    receivedDate datetime,
    supplies_order_id int,
    foreign key (supplies_order_id) references supplies_order(id)
);
create table goods_delivery(
    id int primary key ,
    deliveryCode nvarchar(10),
    deliveryDate datetime,
    delivery_customerName nvarchar(50)
);
create table order_detail(
    id int primary key ,
    supplies_order_id int,
    supplies_id int,
    orderQuantity int,
    foreign key (supplies_order_id)references supplies_order(id),
    foreign key (supplies_id) references supplies(id)
);
create table received_detail(
    id int primary key ,
    goods_received_id int,
    supplies_id int,
    receivedQuantity int,
    received_unitPrice int,
    receivedNote nvarchar(50),
    foreign key (goods_received_id)references goods_delivery(id),
    foreign key (supplies_id) references supplies(id)
);
create table delivery_detail(
    id int primary key ,
    goods_delivery_id int,
    supplies_id int,
    deliveryQuantity int,
    delivery_unitPrice int,
    deliveryNot nvarchar(50),
    foreign key (goods_delivery_id) references goods_delivery(id),
    foreign key (supplies_id) references supplies(id)
);


