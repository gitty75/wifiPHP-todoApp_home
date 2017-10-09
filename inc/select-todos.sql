/* 
    GROUP_CONCAT kann aus gruppierten Werten einen einzelnen String bilden.
    Für jede Zeile Text wird jeder unterschiedliche Wert c.name per GROUP_CONCAT
    zu einem String zusammen geführt
    Die Kategorien werden in einer Zeile ausgegeben.
*/
SELECT t.text, t.active, u.name, GROUP_CONCAT(c.name ORDER BY c.name DESC SEPARATOR ', ') AS catname 
FROM todos as t
/* Lookup Table */
LEFT JOIN todos_categories AS tc ON t.todos_id = tc.todos_id
/* Categories name auslesen */
LEFT JOIN categories AS c ON tc.categories_id = c.categories_id
/* User Name auslesen, verknüft mit todos! */
INNER JOIN user AS u ON t.user_id = u.user_id
GROUP BY text

/*


*/

CREATE VIEW custormersOrders AS 
    SELECT d.orderNumber,
           d.orderName,
           SUM(quantityOrdered * priceEach) As total
    From 
        orderDeteils As d 
    INNER JOIN orders As o ON o.orderNumber = d.orderNumber
    INNER JOIN 
        custormers As c ON c.custormerNumber = o.sustormerNumber
    GROUP BY d.orderNumber
    ORDER BY total DESC;