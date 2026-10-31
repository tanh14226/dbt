SELECT o.orderid, o.orderdate, o.shipdate, o.shipmode,
       o.ordersellingprice - o.ordercostprice AS orderprofit,
       o.ordercostprice, o.ordersellingprice,
       c.customerid, c.customername, c.segment, c.country,
       p.productid, p.category, p.productname, p.subcategory
FROM {{ ref('raw_orders') }} o
LEFT JOIN {{ ref('raw_customers') }} c ON o.customerid = c.customerid
LEFT JOIN {{ ref('raw_products') }} p ON o.productid = p.productid