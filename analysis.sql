-- Original Table
SELECT *
FROM item_sales;

-- Most & Least Sold Items
SELECT Item,
	SUM(Qty) AS items_sold
FROM item_sales
GROUP BY Item
ORDER BY items_sold DESC;

-- Ranked Sold Items
SELECT Item,
	SUM(Qty) AS items_sold,
    RANK() OVER (
		ORDER BY SUM(Qty) DESC
	) AS rnk
FROM item_sales
GROUP BY Item;

-- Net Sales from Items
SELECT Item,
	SUM(Qty) AS items_sold,
	SUM(`Net Sales`) AS net_sales
FROM item_sales
WHERE Item = 'Chicken Teriyaki'
	OR Item = 'Bottled Water'
GROUP BY Item;

-- Busiest and Slowest Hour of the Day
SELECT HOUR(Time) AS hour_of_day,
    SUM(Qty) AS items_sold
FROM item_sales
GROUP BY hour_of_day
ORDER BY items_sold DESC;
