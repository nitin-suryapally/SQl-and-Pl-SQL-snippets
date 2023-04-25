
--  VARIBALES DECLARATION 

-- it needs to declare the variable first in the declaration section of a PL/SQL block before using it.
--  By default, variable names are not case sensitive. A reserved PL/SQL keyword cannot be used as a variable name

--  variable declaration

variable_name [CONSTANT] datatype [NOT NULL] [:= | DEFAULT initial_value]  

    -- example 
    
    Radius Number := 5;

    Date_of_birth date; 
    counter binary_integer := 0;  
    greetings varchar2(20) DEFAULT 'Hello JavaTpoint'; 


    -- example of execution and initialization , the variable takes the value of null if not initialized


    DECLARE  
    a integer := 30;  
    b integer := 40;  
    c integer;  
    f real;  
    BEGIN  
    c := a + b;  
    dbms_output.put_line('Value of c: ' || c);  
    f := 100.0/3.0;  
    dbms_output.put_line('Value of f: ' || f);  
    END;  
    


    -- scope
    --  PL/SQL allows nesting of blocks. A program block can contain another inner block. If you declare a variable within an inner block, it is not accessible to an outer block. There are two types of variable scope:

    -- Local Variable: Local variables are the inner block variables which are not accessible to outer blocks.
    -- Global Variable: Global variables are declared in outermost block.

        DECLARE  
    -- Global variables   
    num1 number := 95;   
    num2 number := 85;   
    BEGIN   
    dbms_output.put_line('Outer Variable num1: ' || num1);  
    dbms_output.put_line('Outer Variable num2: ' || num2);  
    DECLARE   
        -- Local variables  
        num1 number := 195;   
        num2 number := 185;   
    BEGIN   
        dbms_output.put_line('Inner Variable num1: ' || num1);  
        dbms_output.put_line('Inner Variable num2: ' || num2);  
    END;   
    END;  
    /  


    -- declare with %type

    -- The syntax for declaring a variable with %TYPE is
    <var_name> <tab_name>.<column_name>%TYPE;  

    DECLARE    
    SALARY EMP.SAL % TYPE;  
    ECODE EMP.empno % TYPE;   
    BEGIN     
    Ecode :=&Ecode;  
    Select SAL into SALARY from EMP where EMPNO = ECODE;  
    dbms_output.put_line('Salary of ' || ECODE || 'is = || salary');    
    END;  


    -- The syntax for declaring a variable with %ROWTYPE is:
    <var_name> <tab_name>.ROW%TYPE;  

    -- example

    -- EMPLOYEE EMP. % ROW TYPE;

    -- This declaration will declare a record named EMPLOYEE having fields with the same name and data types as that of columns in the EMP table. You can access the elements of EMPLOYEE record as


    DECLARE    
    EMPLOYEE EMP. % ROW TYPE;  
    BEGIN     
    EMPLOYEE.EMPNO := 2092;  
    5   EMPLOYEE.ENAME := 'Sanju';  
    Insert into EMP where (EMPNO, ENAME) Values (employee.empno, employee.ename);  
    dbms_output.put_line('Row Inserted');    
    END;  



-- CONST DECLARATION

    -- Syntax to declare a constant:

    constant_name CONSTANT datatype := VALUE;  

    -- example

    DECLARE  
    -- constant declaration  
    pi constant number := 3.141592654;  
    -- other declarations  
    radius number(5,2);   
    dia number(5,2);   
    circumference number(7, 2);  
    area number (10, 2);  
    BEGIN   
    -- processing  
    radius := 9.5;   
    dia := radius * 2;   
    circumference := 2.0 * pi * radius;  
    area := pi * radius * radius;  
    -- output  
    dbms_output.put_line('Radius: ' || radius);  
    dbms_output.put_line('Diameter: ' || dia);  
    dbms_output.put_line('Circumference: ' || circumference);  
    dbms_output.put_line('Area: ' || area);  
    END;  
    /  




--  conditional statements 

--   if-else

    --  Syntax: (IF-THEN statement):

    IF condition   
    THEN   
    Statement: {It is executed when condition is true}  
    END IF;  


    -- Syntax: (IF-THEN-ELSE statement):

    IF condition   
    THEN  
    {...statements to execute when condition is TRUE...}  
    ELSE  
    {...statements to execute when condition is FALSE...}  
    END IF;    

    -- Syntax: (IF-THEN-ELSIF statement):

    IF condition1   
    THEN  
    {...statements to execute when condition1 is TRUE...}  
    ELSIF condition2   
    THEN  
    {...statements to execute when condition2 is TRUE...}  
    END IF; 


    -- Syntax: (IF-THEN-ELSIF-ELSE statement):

    IF condition1   
    THEN  
    {...statements to execute when condition1 is TRUE...}  
    ELSIF condition2   
    THEN  
    {...statements to execute when condition2 is TRUE...}  
    ELSE  
    {...statements to execute when both condition1 and condition2 are FALSE...}  
    END IF;  

    -- example

    DECLARE  
    a number(3) := 500;  
    BEGIN  
    -- check the boolean condition using if statement   
    IF( a < 20 ) THEN  
        -- if condition is true then print the following    
        dbms_output.put_line('a is less than 20 ' );  
    ELSE  
        dbms_output.put_line('a is not less than 20 ' );  
    END IF;  
    dbms_output.put_line('value of a is : ' || a);  
    END;  




-- case statements


    -- Syntax for the CASE Statement:

    CASE [ expression ]  
    WHEN condition_1 THEN result_1  
    WHEN condition_2 THEN result_2  
    ...  
    WHEN condition_n THEN result_n  
    ELSE result  
    END   

    -- example

    DECLARE  
    grade char(1) := 'A';  
    BEGIN  
    CASE grade  
        when 'A' then dbms_output.put_line('Excellent');  
        when 'B' then dbms_output.put_line('Very good');  
        when 'C' then dbms_output.put_line('Good');  
        when 'D' then dbms_output.put_line('Average');  
        when 'F' then dbms_output.put_line('Passed with Grace');  
        else dbms_output.put_line('Failed');  
    END CASE;  
    END;  


-- loop 

    -- Syntax of basic loop:

    LOOP  
    Sequence of statements;  
    END LOOP; 


    -- Syntax of exit loop:

     LOOP   
    statements;   
    EXIT;   
    {or EXIT WHEN condition;}  
    END LOOP;  

    -- examples

    DECLARE  
    i NUMBER := 1;  
    BEGIN  
    LOOP  
    EXIT WHEN i>10;  
    DBMS_OUTPUT.PUT_LINE(i);  
    i := i+1;  
    END LOOP;  
    END;  


    -- while loop

    -- Syntax of while loop:

    WHILE <condition>   
    LOOP statements;   
    END LOOP;  


    -- example

    DECLARE  
    i INTEGER := 1;  
    BEGIN  
    WHILE i <= 10 LOOP  
    DBMS_OUTPUT.PUT_LINE(i);  
    i := i+1;  
    END LOOP;  
    END;  

    -- example 2

    DECLARE   
    VAR1 NUMBER;  
    VAR2 NUMBER;  
    BEGIN   
    VAR1:=200;  
    VAR2:=1;  
    WHILE (VAR2<=10)  
    LOOP  
    DBMS_OUTPUT.PUT_LINE (VAR1*VAR2);  
    VAR2:=VAR2+1;  
    END LOOP;  
    END;  


    -- for loop 

    -- Syntax of for loop:

    FOR counter IN initial_value .. final_value LOOP  
    LOOP statements;   
    END LOOP;  


    -- example 1

    BEGIN  
    FOR k IN 1..10 LOOP  
    -- note that k was not declared  
    DBMS_OUTPUT.PUT_LINE(k);  
    END LOOP;  
    END;   


    -- example 2

    DECLARE   
    VAR1 NUMBER;  
    BEGIN   
    VAR1:=10;  
    FOR VAR2 IN 1..10  
    LOOP  
    DBMS_OUTPUT.PUT_LINE (VAR1*VAR2);  
    END LOOP;  
    END;  

    -- example 3 for in reverse that is the varaiable is decremeted

    DECLARE   
    VAR1 NUMBER;  
    BEGIN   
    VAR1:=10;  
    FOR VAR2 IN REVERSE 1..10  
    LOOP  
    DBMS_OUTPUT.PUT_LINE (VAR1*VAR2);  
    END LOOP;  
    END; 


    -- continue

    -- example

    DECLARE  
    x NUMBER := 0;  
    BEGIN  
    LOOP -- After CONTINUE statement, control resumes here  
        DBMS_OUTPUT.PUT_LINE ('Inside loop:  x = ' || TO_CHAR(x));  
        x := x + 1;  
        IF x < 3 THEN  
        CONTINUE;  
        END IF;  
        DBMS_OUTPUT.PUT_LINE  
        ('Inside loop, after CONTINUE:  x = ' || TO_CHAR(x));  
        EXIT WHEN x = 5;  
    END LOOP;  
    
    DBMS_OUTPUT.PUT_LINE (' After loop:  x = ' || TO_CHAR(x));  
    END;  
    /  

    -- GOTO statement

    -- example

    DECLARE  
    a number(2) := 30;  
    BEGIN  
    <<loopstart>>  
    -- while loop execution   
    WHILE a < 50 LOOP  
        dbms_output.put_line ('value of a: ' || a);  
        a := a + 1;  
        IF a = 35 THEN  
            a := a + 1;  
            GOTO loopstart;  
        END IF;  
    END LOOP;  
    END;  

        
    
-- Procedure

--   Syntax for creating procedure:

    CREATE [OR REPLACE] PROCEDURE procedure_name  
    [ (parameter [,parameter]) ]  
    IS  
        [declaration_section]  
    BEGIN  
        executable_section  
    [EXCEPTION  
        exception_section]  
    END [procedure_name];  

    -- example

    create or replace procedure "INSERTUSER"    
    (id IN NUMBER,    
    name IN VARCHAR2)    
    is    
    begin    
    insert into user values(id,name);    
    end;    
    /       

    -- Call a procedure

    BEGIN    
    insertuser(101,'Rahul');  
    dbms_output.put_line('record inserted successfully');    
    END;    
    /    


    -- drop a procedure

    DROP PROCEDURE procedure_name;   

-- fucntion 

    -- example

    create or replace function adder(n1 in number, n2 in number)    
    return number    
    is     
    n3 number(8);    
    begin    
    n3 :=n1+n2;    
    return n3;    
    end;    
    /    

    -- call the function

    DECLARE    
    n3 number(2);    
    BEGIN    
    n3 := adder(11,22);    
    dbms_output.put_line('Addition is: ' || n3);    
    END;    
    /    


    -- example

    DECLARE  
    a number;  
    b number;  
    c number;  
    FUNCTION findMax(x IN number, y IN number)   
    RETURN number  
    IS  
        z number;  
    BEGIN  
    IF x > y THEN  
        z:= x;  
    ELSE  
        Z:= y;  
    END IF;  
    
    RETURN z;  
    END;   
    BEGIN  
    a:= 23;  
    b:= 45;  

    c := findMax(a, b);  
    dbms_output.put_line(' Maximum of (23,45): ' || c);  
    END;  
    /  

    -- example 3

    CREATE OR REPLACE FUNCTION totalCustomers  
    RETURN number IS  
    total number(2) := 0;  
    BEGIN  
    SELECT count(*) into total  
    FROM customers;  
        RETURN total;  
    END;  
    /  

    DECLARE  
    c number(2);  
    BEGIN  
    c := totalCustomers();  
    dbms_output.put_line('Total no. of Customers: ' || c);  
    END;  
    /  

