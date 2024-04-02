create database project;
use project;
show databases;
select * from bank_loan;

-- total_application
select count(id) as total_application from bank_loan;

-- total_amount_funded
select sum(loan_amount) as total_amount_funded from bank_loan;

-- total_amount_recieved
select sum(total_payment)as total_amount_recieved from bank_loan;

-- avg_int_rate
select avg(int_rate)*100 as avg_int_rate from bank_loan;
select round(avg(int_rate),2)*100 as avg_int_rate from bank_loan;

-- avg_dti
select avg(dti)*100 as avg_dti from bank_loan;
select round(avg(dti),2)*100 as avg_dti from bank_loan;

# good loan
-- Good loan percent
select loan_status from bank_loan;

select (count(case when loan_status = 'Fully paid' or loan_status = 'Current' then id end)*100)/count(id) 
as good_loan_percent from bank_loan;

-- count of application
select (count(case when loan_status = 'Fully paid' or loan_status = 'Current' then id end)) 
as good_loan_application from bank_loan;

-- good loan funded amount
select sum(loan_amount)  as good_loan_fundedamount from bank_loan where loan_status in ('Fully paid','Current');

-- good loan recieved amount
select sum(total_payment)  as good_loan_recieved_amount from bank_loan where loan_status in ('Fully paid','Current');


# Bad loan %
select (count(case when loan_status = 'Charged Off' then id end)*100)/count(id) 
as bad_loan_percent from bank_loan;

-- Total bank Loan count
select (count(case when loan_status = 'Charged Off' then id end))
as bad_loan_count from bank_loan;

-- bad loan funded Amoount
select sum(loan_amount)  as bad_loan_fundedamount from bank_loan where loan_status = 'Charged Off';

-- Bad loan_recieved
select sum(total_payment)  as bad_loan_recieved_amount from bank_loan where loan_status in ('charged off');

