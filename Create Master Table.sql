Create Table Master_set_data AS
SELECT ol.line_id,ol.schedule_ship_date,ol.quantity, ol.discount,ol.product_id,ol.net_price,oh.order_number,oh.po_id,
c.customer_name,c.city,sp.state_name,ct.country_name,
p.product_number,p.product_name,p.description,p.uom,ps.product_subfamily_name,pf.product_family_name 
FROM order_lines ol 
INNER JOIN order_headers oh on ol.header_id = oh.header_id 
INNER JOIN customers c on oh.sold_to_id = c.customer_id
INNER JOIN countries ct on c.country_id = ct.country_id 
INNER JOIN states_provs sp on c.state_prov_id = sp.state_prov_id 
INNER JOIN products p on ol.product_id = p.product_id 
INNER JOIN products prod on ol.product_id = prod.product_id 
INNER JOIN product_subfamily ps on p.subfamily_id = ps.subfamily_id
inner join product_family pf on p.family_id = pf.family_id;

Select count(*) from master_set_data;
