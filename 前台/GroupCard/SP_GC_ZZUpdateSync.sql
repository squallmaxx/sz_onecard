CREATE OR REPLACE PROCEDURE SP_GC_ZZUpdateSync
(
		P_TRADEID			VARCHAR2,		--交易流水号
		P_ORDERNO			VARCHAR2,
		P_DETAILNO			VARCHAR2,
		P_CARDNO			CHAR,
		P_SYNCTYPE			CHAR,			--同步状态
		P_SYNCMSG			CHAR,			--同步信息
		P_OPERATETYPE		CHAR,			--操作类型	01新增 02修改
		P_TRADETYPE			CHAR,			--业务类型	01售卡 02充值 03配送
		
		P_CURROPER			CHAR,
		P_CURRDEPT			CHAR,
		P_RETCODE	        OUT CHAR, 		-- RETURN CODE
		P_RETMSG     	    OUT VARCHAR2	-- RETURN MESSAGE
)
AS
    V_EX          		EXCEPTION;
	V_ORDERCOUNT		INT;
	V_TODAY				DATE := SYSDATE;
    V_SEQNO				CHAR(16);			--流水号
BEGIN
	
	IF P_OPERATETYPE  = '01' THEN
		--记录订单台帐表
		BEGIN
			INSERT INTO TF_F_ZZOL_SYNC(
		  TRADEID		, ORDERNO		,DETAILNO	,CARDNO		, TRADETYPECODE	,SYNCTYPE	,
		  UPDATEDEPARTID, UPDATESTAFFNO	,OPERATETIME )
		VALUES(
		  P_TRADEID		,P_ORDERNO	,P_DETAILNO		,P_CARDNO	, P_TRADETYPE	, '01'		,
		  P_CURRDEPT    , P_CURROPER    ,V_TODAY);
		IF SQL%ROWCOUNT != 1 THEN RAISE V_EX; END IF;
		EXCEPTION
		WHEN OTHERS THEN
				P_RETCODE := 'S094780092';
				P_RETMSG  := '记录订单台帐表失败'||SQLERRM;
				ROLLBACK; RETURN;
		END;
	ELSIF P_OPERATETYPE  = '02' THEN
		--更新同步信息表失败
		BEGIN
			UPDATE TF_F_ZZOL_SYNC 
				SET SYNCTYPE	= P_SYNCTYPE,
					SYNCMSG		= P_SYNCMSG
			WHERE	TRADEID	= P_TRADEID;
		   EXCEPTION
			  WHEN OTHERS THEN
				P_RETCODE := 'S094540109';
				P_RETMSG := '更新同步信息表失败' || SQLERRM;
			  ROLLBACK;RETURN;
		END;
	END IF;
   
	P_RETCODE := '0000000000';
	P_RETMSG  := '';
	COMMIT; RETURN;
END;

/

SHOW ERRORS

 