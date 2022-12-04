Use learnmysql;
Select * from planning;
Select State_Date, min(End_Date)
From
	(Select b.State_Date
	From planning as a
    Right Join planning as b
    On b.State_Date = a.End_Date
    Where a.State_Date is Null
    ) sd,
    (Select a.End_Date
    From planning as a
    Left Join planning as b
    on b.State_Date = a.End_Date
    Where b.End_Date is Null
    ) ed
Where State_Date < End_Date
Group By State_Date
Order by datediff(Min(End_Date), State_Date), State_Date
    

