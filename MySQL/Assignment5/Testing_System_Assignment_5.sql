     USE TestingSystem3;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
     create View danh_sach_nhan_vien as
     SELECT DepartmentID, DepartmentName
     FROM 	department
     WHERE DepartmentName LIKE 'Sale';
     
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW Thong_tin as
SELECT A.*,COUNT(B.AccountID)AS'SO GR THAM GIA'
FROM `account` A
JOIN groupaccount B ON A.AccountID=B.AccountID
GROUP BY B.AccountID 
HAVING COUNT(B.AccountID) = (SELECT MAX(info_max) FROM (SELECT COUNT(1) AS'info_max'
							FROM `account` A 
							JOIN groupaccount B ON A.AccountID=B.AccountID
							GROUP BY B.AccountID) AS count1)
   ;                                       
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
-- được coi là quá dài) và xóa nó đi
		Create VIEW Tra_loi as
        SELECT * FROM Question
        WHERE  char_length(Content >300);
 -- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

CREATE VIEW ds_nv AS
    SELECT 
        B.DepartmentName, COUNT(A.DepartmentID) AS 'Sonhanvien'
    FROM
        `account` A
            JOIN
        department B ON A.departmentID = B.departmentID
    GROUP BY (B.DepartmentName)
    HAVING COUNT(A.DepartmentID) = (SELECT 
            MAX(max_nv)
        FROM
            (SELECT 
                COUNT(1) AS 'max_nv'
            FROM
                `account` A
            JOIN department B ON A.DepartmentID = B.departmentID
            GROUP BY (A.departmentID)) AS count2);
 -- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo

CREATE VIEW Ho_Nguyen as 
	SELECT b.QuestionID, b.Content,a.UserName, a.AccountID
    FROM `Account` a
    JOIN	Question b ON 	a.AccountID = b.CreatorID
    WHERE 	a.UserName LIKE 'Nguyễn%';
    SELECT * FROM `Account`;