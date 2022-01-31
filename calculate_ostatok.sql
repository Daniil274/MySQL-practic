use shop;
select department_name, product.product_name, balance
from department INNER JOIN storage ON department.id_department = storage.id_department 
INNER JOIN product ON storage.id_product = product.id_product;