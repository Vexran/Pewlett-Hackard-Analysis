-- Deliverable #1
Select e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
Into retirement_titles
From employees as e
Inner Join titles As t
On(e.emp_no = t.emp_no)
Where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Order by emp_no Asc;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title

INTO unique_titles
FROM retirement_titles as rt
WHERE (to_date='9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;
select * from retiring_titles
--- Deliverable #2
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;
select * from mentorship_eligibilty