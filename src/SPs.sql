delimiter //
create procedure  getSuppliesQuantity(supCode varchar(50))
begin
select (i.quantity + i.totalImport + rd.receivedQuantity)-
       (i.totalExport + dd.deliveryQuantity) as total_supplies,
       s.suppliesCode
from inventory i
    join received_detail rd on i.supplies_id = rd.supplies_id
    join delivery_detail dd on i.supplies_id = dd.supplies_id
    join supplies s on s.id = dd.supplies_id and s.suppliesCode = supCode;
end //
// delimiter ;
call getSuppliesQuantity('s01');
delimiter //
create procedure getTotalMoneyExport(supCode varchar(50))
begin
    select (i.totalExport + dd.deliveryQuantity) * dd.delivery_unitPrice as total_money_export
    , s.suppliesCode
    from  inventory i
    join supplies s on s.id = i.supplies_id and s.suppliesCode= supCode
    join delivery_detail dd on s.id = dd.supplies_id;
end //
 //delimiter ;
call getTotalMoneyExport('s01');
 delimiter //
 create procedure getTotalOrderQuantity(orderCode varchar(50))
 begin
     select sum(od.orderQuantity), so.supplies_orderCode
     from supplies_order so
     join order_detail od on so.id = od.supplies_order_id and so.supplies_orderCode = orderCode
     group by so.supplies_orderCode;
 end //
 // delimiter ;
 call getTotalOrderQuantity('so01');
delimiter //
create procedure addNewOrder(newId int, newOrderCode varchar(10),newOrderDate datetime,newProducerId int)
begin
    insert into supplies_order
        values (newId,newOrderCode,newOrderDate,newProducerId);
end //
 // delimiter ;
 call addNewOrder(4,'so04','2022-3-27',3);

delimiter //
create procedure addNewOrderDetail(newId int,newSupOrderCode int,newSupId int,newOrderQuantity int)
begin
    insert into order_detail
        values(newId,newSupOrderCode,newSupId,newOrderQuantity);
end //
// delimiter ;
call addNewOrderDetail(7,4,2,20);



