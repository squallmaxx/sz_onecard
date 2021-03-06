CREATE OR REPLACE PROCEDURE SP_PS_PrepayManger
(
    P_FUNCCODE        VARCHAR2 ,  --功能编码
    P_MONEY           INT      ,  --操作金额
    P_CHMONEY         VARCHAR2 ,  --大写金额
    P_REMARK          VARCHAR2 ,  --备注
    P_DBALUNITNO      VARCHAR2 ,  --网点结算单元编码
    P_CURROPER        CHAR     ,
    P_CURRDEPT        CHAR     ,
    P_RETCODE     OUT CHAR     ,
    P_RETMSG      OUT VARCHAR2
)
AS
    V_FUNCCODE        VARCHAR2(16) := P_FUNCCODE ;
    V_TODAY           DATE         := SYSDATE    ;
    V_SEQ             VARCHAR2(16)               ;
    V_EX              EXCEPTION                  ;
    V_PREPAY          INT                        ;
    
BEGIN
	--收入
	IF V_FUNCCODE = 'INCOME' THEN  
	BEGIN
		SP_GETSEQ(SEQ => V_SEQ); --获取业务流水号
		--记录预付款保证金业务台账审核表
		INSERT INTO TF_B_DEPTACC_EXAM(
		    ID              , TRADETYPECODE    , DBALUNITNO   , CURRENTMONEY   ,
		    CHINESEMONEY    ,
		    OPERATESTAFFNO  , OPERATEDEPARTID  , OPERATETIME  , STATECODE      ,
		    REMARK
	 )VALUES(
	      V_SEQ           , '11'             , P_DBALUNITNO , P_MONEY        ,
	      P_CHMONEY       ,
	      P_CURROPER      , P_CURRDEPT       , V_TODAY      , '1'            ,
	      P_REMARK
	      );
    EXCEPTION WHEN OTHERS THEN
        P_RETCODE := 'S008905011';
        P_RETMSG  := '记录预付款保证金业务台账审核表'||SQLERRM;
        ROLLBACK;RETURN;
  END;			
  END IF;
  
	--支出
	IF V_FUNCCODE = 'PAY' THEN  
    SELECT PREPAY INTO V_PREPAY FROM TF_F_DEPTBAL_PREPAY WHERE DBALUNITNO = P_DBALUNITNO;
    --如果支出金额大于预付款余额则提示错误
    IF P_MONEY > V_PREPAY THEN
        P_RETCODE := 'S008905002';
        P_RETMSG  := '支出金额不能大于预付款余额';
        ROLLBACK;RETURN; 
    ELSE--如果支出金额不大于预付款余额则执行		
    BEGIN
		SP_GETSEQ(SEQ => V_SEQ); --获取业务流水号
		--记录预付款保证金业务台账审核表
		INSERT INTO TF_B_DEPTACC_EXAM(
		    ID              , TRADETYPECODE    , DBALUNITNO   , CURRENTMONEY   ,
		    CHINESEMONEY    ,
		    OPERATESTAFFNO  , OPERATEDEPARTID  , OPERATETIME  , STATECODE      ,
		    REMARK
	 )VALUES(
	      V_SEQ           , '12'             , P_DBALUNITNO , P_MONEY        ,
	      P_CHMONEY       ,
	      P_CURROPER      , P_CURRDEPT       , V_TODAY      , '1'            ,
	      P_REMARK
	      );
    EXCEPTION WHEN OTHERS THEN
        P_RETCODE := 'S008905011';
        P_RETMSG  := '记录预付款保证金业务台账审核表'||SQLERRM;
        ROLLBACK;RETURN;
    END;	
    END IF;
  END IF;  
     p_retCode := '0000000000'; p_retMsg  := '成功';
     commit; return;
END;   

/
show errors 