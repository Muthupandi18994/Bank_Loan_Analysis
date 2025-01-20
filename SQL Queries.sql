use bank_loan;
select*from bank_loan_data;

-- Q1
select COUNT(id) as'Total Applications'
from bank_loan_data
where MONTH(issue_date)=12;

-- Q2
select SUM(loan_amount) from bank_loan_data;

select SUM(loan_amount) from bank_loan_data
where MONTH(issue_date)=12;

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- Q3
select SUM(total_payment) from bank_loan_data;

select SUM(total_payment)from bank_loan_data
where MONTH(issue_date)=12;

SELECT SUM(total_payment) AS Total_Received_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- Q4
select AVG(int_rate) from bank_loan_data;

select AVG(int_rate) from bank_loan_data
where MONTH(issue_date)=12;

select AVG(int_rate) from bank_loan_data
where MONTH(issue_date)=11;

-- Q5
select AVG(dti) from bank_loan_data;

select  MONTH(issue_date),AVG(dti) as 'avg_dti',
LAG(AVG(dti)) over(order by  MONTH(issue_date)) as 'previous_month_avg_dti',
(LAG(AVG(dti)) over(order by  MONTH(issue_date))-AVG(dti) )as 'fluctuation'
from bank_loan_data
group by  MONTH(issue_date);

--  Q6
select (COUNT(case when loan_status='Fully Paid' or loan_status='Current' then id end) *100/ count(id) ) as 'Good loan %' 
from bank_loan_data;

-- Q7 
select COUNT(id) from bank_loan_data
 where loan_status='Fully Paid' or loan_status='Current';

 -- Q8
 select SUM(loan_amount)  from bank_loan_data
 where loan_status='Fully Paid' or loan_status='Current';

 -- Q9
 select SUM(total_payment) from bank_loan_data
  where loan_status='Fully Paid' or loan_status='Current';


 -- Q10
select (COUNT(case when loan_status='Charged Off'then id end) *100/ count(id)) as 'Good loan %' 
from bank_loan_data;

-- Q11
select COUNT(id) from bank_loan_data
 where  loan_status='Charged Off';

 -- Q12
 select SUM(loan_amount)  from bank_loan_data
 where  loan_status='Charged Off';

 -- Q13
 select SUM(total_payment) from bank_loan_data
 where  loan_status='Charged Off';

 -- Loan Status Grid View

select loan_status,
COUNT(id) as Total_applications,
SUM(loan_amount) as Total_funded,
SUM(total_payment)as Total_Received,
AVG(int_rate)as Avg_int_rate,
AVG(dti) as Avg_dti
from bank_loan_data
group by loan_status;

-- Good Loan

select 
COUNT(id) as Total_applications,
SUM(loan_amount) as Total_funded,
SUM(total_payment)as Total_Received,
AVG(int_rate)as Avg_int_rate,
AVG(dti) as Avg_dti
from bank_loan_data
where loan_status = 'Fully Paid' or  loan_status = 'Current';



select loan_status,
COUNT(id) as MTD_Total_applications,
SUM(total_payment)as MTD_Total_Received,
SUM(loan_amount) as MTD_Total_funded
from bank_loan_data
where MONTH(issue_date)=12
group by  loan_status;

-- B.	BANK LOAN REPORT | OVERVIEW

select MONTH(issue_date) as Month,
DATENAME(MONTH,issue_date) as Month_name,
COUNT(id) as Total_applications,
SUM(loan_amount) as Total_funded,
SUM(total_payment)as Total_Received
from bank_loan_data
group by MONTH(issue_date),DATENAME(MONTH,issue_date) 
order by MONTH(issue_date);

-- State
select address_state,
COUNT(id) as Total_applications,
SUM(loan_amount) as Total_funded,
SUM(total_payment)as Total_Received
from bank_loan_data
group by address_state
order by address_state;

-- Term
select term,
COUNT(id) as Total_applications,
SUM(loan_amount) as Total_funded,
SUM(total_payment)as Total_Received
from bank_loan_data
group by term
order by term;

-- EMPLOYEE LENGTH
select emp_length,
COUNT(id) as Total_applications,
SUM(loan_amount) as Total_funded,
SUM(total_payment)as Total_Received
from bank_loan_data
group by emp_length
order by emp_length;

-- purpose
select purpose,
COUNT(id) as Total_applications,
SUM(loan_amount) as Total_funded,
SUM(total_payment)as Total_Received
from bank_loan_data
group by purpose
order by purpose;

-- HOME OWNERSHIP
select home_ownership,
COUNT(id) as Total_applications,
SUM(loan_amount) as Total_funded,
SUM(total_payment)as Total_Received
from bank_loan_data
group by home_ownership
order by home_ownership;
