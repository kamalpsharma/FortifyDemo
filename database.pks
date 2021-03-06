
CREATE OR REPLACE PACKAGE TEST IS
	
	TYPE CURSORTYPE IS REF CURSOR;

	FUNCTION SampleFn(
		NAME VARCHAR2
	)
		RETURN CURSORTYPE;
		
	PROCEDURE SampleProc(
		NAME VARCHAR2,
		PWD VARCHAR2
	);
END;
/

-- Package body TEST
CREATE OR REPLACE PACKAGE BODY TEST IS

	FUNCTION SampleFn(
		NAME VARCHAR2
	) RETURN CURSORTYPE IS
        CURSORRET CURSORTYPE;
        N1 VARCHAR2;
	BEGIN
	    N1 := NAME;
		OPEN CURSORRET FOR
			SELECT *
			FROM   T_USER
			WHERE  (LOGIN = N1);
		RETURN CURSORRET;
	END;

	PROCEDURE SampleProc
	IS
	    INPUT1 VARCHAR2;
	BEGIN
	    INPUT1 := SYSTEM.GETINPUT();
	    SampleFn(INPUT1);
	END;

END;
/
commit;
show errors;

exit;

