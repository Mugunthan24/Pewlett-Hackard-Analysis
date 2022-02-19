# Pewlett-Hackard-Analysis
Doing analysis on organizations aging workforce

## Overview of the Analysis
Pewlett Hackard (PH) is a large company with several thousand employees that has been around for a long time. With many baby boomers at the organization who are soon going to retire, PH is planning ahead by trying to determine:
-	which employees are eligible for retirement packages
-	which employees who are eligible to participate in the mentorship program
-	the number of individuals needed to fill the various positions

## Results

![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/retirement_titles.PNG)


![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/unique_titles.PNG)


![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/retiring_titles.PNG)


![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/mentorship_eligibilty.PNG)

Based on the results from the four queries it can be notes that:
-	the majority of employees retiring are in senior positions (Senior Engineer, Senior Staff)
-	Managerial roles require significant less replacements
-	A lot of employees underwent promotions
-   Many employees have been with the organization for a long time, some since the 80s. 

## Summary
The summary below will elaborate on:
-	The number of roles that will need to be filled as the “silver tsumani” begins to make an impact
-	Determine if there are enough qualified, retirement-ready employees in the departments to mentor the next generation of PK employees

### Number of Roles Needed to be Filled

![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/retiring_titles.PNG)

![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/retiring_titles_count.PNG)

72,458 roles will need to be filled as the “silver tsunami” begins to make an impact. Using the retiring_titles table, the image of the query above has summed the number of employees in each role.

### Retirement Ready Employees to Mentor the Next Generation

![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/mentorship_eligibility_titles_and_department.PNG)

![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/mentorship_eligibility_titles.PNG)

![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/mentorship_eligibility_departments.PNG)

![image_name](https://github.com/Mugunthan24/Pewlett-Hackard-Analysis/blob/main/Images/mentorship_eligibilty_count.PNG)

Based on the tables above, 1,549 employees are eligible for the mentorship program, and there are 72,458 roles will need to be filled. If the organization is planning to do 1:1 training then it will not be possible to train everyone. If there are group training sessions then it will be possible. Additionally, 2 manager positions will need to be filled but currently there are no managers eligible for the mentorship program.

