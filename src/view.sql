create view vw_CTPNHAP as
    select receivedCode,s.suppliesCode,rd.receivedQuantity,rd.received_unitPrice,
           rd.received_unitPrice*rd.receivedQuantity as total_import_price
    from goods_received
join received_detail rd on goods_received.id = rd.goods_received_id
join supplies s on s.id = rd.supplies_id;

create view vw_CTPNHAP_VT as
select receivedCode,s.suppliesCode,s.suppliesName,rd.receivedQuantity,
       rd.received_unitPrice,rd.received_unitPrice*rd.receivedQuantity
from goods_received
         join received_detail rd on goods_received.id = rd.goods_received_id
         join supplies s on s.id = rd.supplies_id;

create view vw_CTPNHAP_VT_PN as
select receivedCode,receivedDate,count(so.id),s.suppliesCode,s.suppliesName,rd.receivedQuantity,
       received_unitPrice,rd.received_unitPrice * rd.receivedQuantity as total_received_price
from goods_received
join supplies_order so on goods_received.supplies_order_id = so.id
join received_detail rd on goods_received.id = rd.goods_received_id
join supplies s on s.id = rd.supplies_id
group by receivedCode,receivedDate,s.suppliesCode,suppliesName;
create view vw_CTPNHAP_VT_PN_DH as
select receivedCode,receivedDate,count(so.id),p.producerCode,s.suppliesCode,s.suppliesName,
       rd.receivedQuantity,rd.received_unitPrice,rd.receivedQuantity * rd.received_unitPrice as total_received_price
from goods_received
join supplies_order so on so.id = goods_received.supplies_order_id
join producer p on p.id = so.producer_id
join received_detail rd on goods_received.id = rd.goods_received_id
join supplies s on s.id = rd.supplies_id
group by receivedCode,receivedDate,s.suppliesCode,s.suppliesName;
create view vw_CTPNHAP_loc as
select gr.receivedCode,s.suppliesCode,rd.receivedQuantity,rd.received_unitPrice,
       rd.receivedQuantity * rd.received_unitPrice as total_received_price
from goods_received gr
join received_detail rd on gr.id = rd.goods_received_id and receivedQuantity > 5
join supplies s on s.id = rd.supplies_id;
create view vw_CTPNHAP_VT_loc as
select gr.receivedCode,s.suppliesCode,s.suppliesName,rd.receivedQuantity,rd.received_unitPrice,
       rd.received_unitPrice * rd.receivedQuantity
from goods_received gr
join received_detail rd on gr.id = rd.goods_received_id
join supplies s on s.id = rd.supplies_id and s.suppliesUnit = 'Con';
create view vw_CTPXUAT as
select  gd.deliveryCode,s.suppliesCode,dd.deliveryQuantity,dd.delivery_unitPrice,
       dd.deliveryQuantity * dd.delivery_unitPrice as total_delivery_price
from goods_delivery gd
join delivery_detail dd on gd.id = dd.goods_delivery_id
join supplies s on s.id = dd.supplies_id;
create view vw_CTPXUAT_VT as
select gd.deliveryCode,s.suppliesCode,s.suppliesName,dd.deliveryQuantity,dd.delivery_unitPrice
from goods_delivery gd
join delivery_detail dd on gd.id = dd.goods_delivery_id
join supplies s on s.id = dd.supplies_id;
create view vw_CTPXUAT_VT_PX as
select gd.deliveryCode, gd.delivery_customerName,s.suppliesCode,s.suppliesName,
       dd.deliveryQuantity,dd.delivery_unitPrice
from goods_delivery gd
join delivery_detail dd on gd.id = dd.goods_delivery_id
join supplies s on s.id = dd.supplies_id;









