using System;
using System.Data;
using System.Configuration;
using System.Collections;
using Master;

namespace PDO.PersonalBusiness
{
     // 卡账户有效性检验
     public class SP_CashGiftAccCheckPDO : PDOBase
     {
         public SP_CashGiftAccCheckPDO()
          {
          }

          protected override void Init()
          {
              InitBegin("SP_CashGiftAccCheck", 6);

               AddField("@CARDNO", "string", "16", "input");

               InitEnd();
          }

          // 卡号
          public string CARDNO
          {
              get { return  Getstring("CARDNO"); }
              set { Setstring("CARDNO",value); }
          }

     }
}


