using System;
using System.Data;
using System.Configuration;
using System.Collections;
using Master;

namespace TDO.ConsumeBalance
{
     // �������ѽ����ʵ��س������
     public class TP_TAXI_BALANCE_REBUILDTDO : DDOBase
     {
          public TP_TAXI_BALANCE_REBUILDTDO()
          {
          }

          protected override void Init()
          {
               tableName = "TP_TAXI_BALANCE_REBUILD";

               columns = new String[19][];
               columns[0] = new String[]{"ID", "Decimal"};
               columns[1] = new String[]{"BALUNITNO", "string"};
               columns[2] = new String[]{"CALLINGNO", "string"};
               columns[3] = new String[]{"CORPNO", "string"};
               columns[4] = new String[]{"DEPARTNO", "string"};
               columns[5] = new String[]{"CALLINGSTAFFNO", "string"};
               columns[6] = new String[]{"FEETYPECODE", "string"};
               columns[7] = new String[]{"BILLTYPECODE", "string"};
               columns[8] = new String[]{"ERRORREASONCODE", "string"};
               columns[9] = new String[]{"TOTALTIMES", "Int32"};
               columns[10] = new String[]{"TOTALBALFEE", "Int32"};
               columns[11] = new String[]{"SINCOMADDFEE", "Int32"};
               columns[12] = new String[]{"BEGINTIME", "DateTime"};
               columns[13] = new String[]{"ENDTIME", "DateTime"};
               columns[14] = new String[]{"BALANCETIME", "DateTime"};
               columns[15] = new String[]{"DEALSTATECODE", "string"};
               columns[16] = new String[]{"REBUILDSTATECODE", "string"};
               columns[17] = new String[]{"RSRVCHAR", "string"};
               columns[18] = new String[]{"REMARK", "String"};

               columnKeys = new String[]{
                   "ID",
               };


               array = new String[19];
               hash.Add("ID", 0);
               hash.Add("BALUNITNO", 1);
               hash.Add("CALLINGNO", 2);
               hash.Add("CORPNO", 3);
               hash.Add("DEPARTNO", 4);
               hash.Add("CALLINGSTAFFNO", 5);
               hash.Add("FEETYPECODE", 6);
               hash.Add("BILLTYPECODE", 7);
               hash.Add("ERRORREASONCODE", 8);
               hash.Add("TOTALTIMES", 9);
               hash.Add("TOTALBALFEE", 10);
               hash.Add("SINCOMADDFEE", 11);
               hash.Add("BEGINTIME", 12);
               hash.Add("ENDTIME", 13);
               hash.Add("BALANCETIME", 14);
               hash.Add("DEALSTATECODE", 15);
               hash.Add("REBUILDSTATECODE", 16);
               hash.Add("RSRVCHAR", 17);
               hash.Add("REMARK", 18);
          }

          // ������ˮ��
          public Decimal ID
          {
              get { return  GetDecimal("ID"); }
              set { SetDecimal("ID",value); }
          }

          // ���㵥Ԫ���
          public string BALUNITNO
          {
              get { return  Getstring("BALUNITNO"); }
              set { Setstring("BALUNITNO",value); }
          }

          // ��ҵ����
          public string CALLINGNO
          {
              get { return  Getstring("CALLINGNO"); }
              set { Setstring("CALLINGNO",value); }
          }

          // ��λ����
          public string CORPNO
          {
              get { return  Getstring("CORPNO"); }
              set { Setstring("CORPNO",value); }
          }

          // ���ű���
          public string DEPARTNO
          {
              get { return  Getstring("DEPARTNO"); }
              set { Setstring("DEPARTNO",value); }
          }

          // ��ҵԱ������
          public string CALLINGSTAFFNO
          {
              get { return  Getstring("CALLINGSTAFFNO"); }
              set { Setstring("CALLINGSTAFFNO",value); }
          }

          // �������ͱ���
          public string FEETYPECODE
          {
              get { return  Getstring("FEETYPECODE"); }
              set { Setstring("FEETYPECODE",value); }
          }

          // �˵����ͱ���
          public string BILLTYPECODE
          {
              get { return  Getstring("BILLTYPECODE"); }
              set { Setstring("BILLTYPECODE",value); }
          }

          // �쳣ԭ�����
          public string ERRORREASONCODE
          {
              get { return  Getstring("ERRORREASONCODE"); }
              set { Setstring("ERRORREASONCODE",value); }
          }

          // �����ܱ���
          public Int32 TOTALTIMES
          {
              get { return  GetInt32("TOTALTIMES"); }
              set { SetInt32("TOTALTIMES",value); }
          }

          // �����ܽ��
          public Int32 TOTALBALFEE
          {
              get { return  GetInt32("TOTALBALFEE"); }
              set { SetInt32("TOTALBALFEE",value); }
          }

          // �����ۼ�Ӷ��
          public Int32 SINCOMADDFEE
          {
              get { return  GetInt32("SINCOMADDFEE"); }
              set { SetInt32("SINCOMADDFEE",value); }
          }

          // ��ʼʱ��
          public DateTime BEGINTIME
          {
              get { return  GetDateTime("BEGINTIME"); }
              set { SetDateTime("BEGINTIME",value); }
          }

          // ����ʱ��
          public DateTime ENDTIME
          {
              get { return  GetDateTime("ENDTIME"); }
              set { SetDateTime("ENDTIME",value); }
          }

          // �����ʵ�ʱ��
          public DateTime BALANCETIME
          {
              get { return  GetDateTime("BALANCETIME"); }
              set { SetDateTime("BALANCETIME",value); }
          }

          // ����״̬����
          public string DEALSTATECODE
          {
              get { return  Getstring("DEALSTATECODE"); }
              set { Setstring("DEALSTATECODE",value); }
          }

          // �س�״̬����
          public string REBUILDSTATECODE
          {
              get { return  Getstring("REBUILDSTATECODE"); }
              set { Setstring("REBUILDSTATECODE",value); }
          }

          // ������־
          public string RSRVCHAR
          {
              get { return  Getstring("RSRVCHAR"); }
              set { Setstring("RSRVCHAR",value); }
          }

          // ��ע
          public String REMARK
          {
              get { return  GetString("REMARK"); }
              set { SetString("REMARK",value); }
          }

     }
}

