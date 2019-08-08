<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gicm="urn:customs.ru:Information:CustomsDocuments:GTDInCustomsMark:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date2">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="gicm:GTDInCustomsMark">
      <html>
         <head>
            <title>Служебные отметки ДТ</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    div.page {
                        width: 210mm;
                        height: 297mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    div.goods {
                        background: #ffffff;
                    }

                    .bordered {
                        border: solid 1pt #000000;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }

                    .underlined {
                        border-bottom: solid 0.5pt #000000;
                    }

                    p.NumberDate {
                        font-weight: bold;
                    }

                    .graph {
                        font-family: Arial;
                        font-size: 7pt;
                    }

                    .graphBold {
                        font-family: Arial;
                        font-size: 7pt;
                        font-weight: bold;
                    }

                    td {
                        font-family: Courier;
                    }

                    .graphBody {
                        font-family: Arial;
                        font-size: 8pt;
                    }

                    .graphGTD {
                        font-family: Arial;
                        font-size: 9pt;
                    }

                    .graphTable {
                        font-family: Arial;
                        font-size: 7pt;
                    }

                    .graphHead {
                        font-family: Arial;
                        font-size: 10pt;
                    }

                    .graphMain {
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }

                    .graphNo {
                        font-size: 10pt;
                        font-weight: bold;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" height="36">
                           <span style="font-size:20; font-weight:bold; text-decoration:underline; ">Служебные
                                        отметки ДТ
                                    </span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <p align="left">
                  <span style="font-size:16; font-weight:bold;">Регистрационный номер ДТ</span>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <span class="graphGTD">
                     <xsl:value-of select="gicm:GTDID/cat_ru:CustomsCode"/>
                     <xsl:text>/</xsl:text>
                     <xsl:call-template name="russian_date2">
                        <xsl:with-param name="dateIn" select="gicm:GTDID/cat_ru:RegistrationDate"/>
                     </xsl:call-template>
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="gicm:GTDID/cat_ru:GTDNumber"/>
                  </span>
               </p>
               <br/>
               <p align="left">
                  <span style="font-size:16;  font-weight:bold; ">Служебные отметки ДТ (Графы A, C, D)</span>
               </p>
               <table border="1" cellspacing="0">
                  <thead class="graphTable">
                     <tr>
                        <td align="center" width="50">Номер графы (A, C, D)</td>
                        <td align="center" width="100">Иденти- фикатор простав- ленной тех. отметки - 1. Номер
                                    этапа
                                </td>
                        <td align="center">Описание этапа</td>
                        <td align="center" width="100">Иденти- фикатор простав- ленной тех. отметки - 2. Тип
                                    примечания. (Код)
                                </td>
                        <td align="center">Описание типа примечания</td>
                        <td align="center" width="100">Порядковый номер записи по идентифи- катору тех. отметки
                                </td>
                        <td align="center" width="100">Код типа инфор- мации</td>
                        <td align="center">Служебная запись / номер документа</td>
                        <td align="center" width="100">Дата / Дата принятия решения о продлении срока проверки
                                </td>
                        <td align="center">Время</td>
                        <td align="center">Сумма денежных средств / Суммарный объем отделений транспортных
                                    средств
                                </td>
                        <td align="center">Код вида платежа (пени, штрафы)</td>
                        <td align="center" width="100">Процент за предос- тавление отсрочки / рассрочки</td>
                        <td align="center">Код валюты денежных средст / Код еденицы измерения / код валюты
                                    денежных средств / Код единицы измерения / Код страны / Код основания продления срока выпуска товаров
                                </td>
                        <td align="center">Наименование валюты денежных средств / Краткое наименование единицы
                                    измерения
                                </td>
                        <td align="center">ФИО инспектора, заверивше- го запись</td>
                        <td align="center">ЛНП инспектора, заверивше- го запись</td>
                        <td align="center">Дата завершения разделения товаоной партии на отдельные товары</td>
                        <td align="center">Время</td>
                        <td align="center">Код способа обеспечения уплаты</td>
                        <td align="center">Основание предоставления обеспечения уплаты таможенных  пошлин</td>
                     </tr>
                  </thead>
                  <tbody>
                     <xsl:for-each select="gicm:GTDInCommonMark">
                        <tr class="graphBody">
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:GRNumber">
                                    <xsl:value-of select="catESAD_ru:GRNumber"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:StageMarkIdentifier">
                                    <xsl:value-of select="catESAD_ru:StageMarkIdentifier"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="gicm:StageDescription">
                                    <xsl:value-of select="gicm:StageDescription"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:NoteMarkIdentifier">
                                    <xsl:value-of select="catESAD_ru:NoteMarkIdentifier"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="gicm:IdentifierDescription">
                                    <xsl:value-of select="gicm:IdentifierDescription"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <!-- ??? Куда делся -->
                              <!-- 10.12.2010: я тоже не нашла :) -->
                              <!-- 20.02.2015: отсутствует в схеме-->
                              <!--xsl:choose>
                                 <xsl:when test="catESAD_ru:RecordNumber">
                                    <xsl:value-of select="catESAD_ru:RecordNumber"/>
                                 </xsl:when>
                                 <xsl:otherwise-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <!--/xsl:otherwise>
                              </xsl:choose-->
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:InformationTypeCode">
                                    <xsl:value-of select="catESAD_ru:InformationTypeCode"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:MarkDescription">
                                    <xsl:value-of select="catESAD_ru:MarkDescription"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center" width="100">
                              <!--span style="background-color:#C0C0C0; width:2 cm; "-->
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:DateInf">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="catESAD_ru:DateInf"/>
                                    </xsl:call-template>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:TimeInf">
                                    <xsl:value-of select="catESAD_ru:TimeInf"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:Amount">
                                    <xsl:value-of select="catESAD_ru:Amount"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:PaymentTypeCode">
                                    <xsl:value-of select="catESAD_ru:PaymentTypeCode"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:PostponementProcent">
                                    <xsl:value-of select="catESAD_ru:PostponementProcent"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:Code">
                                    <xsl:value-of select="catESAD_ru:Code"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:CurrencyName">
                                    <xsl:value-of select="catESAD_ru:CurrencyName"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:PersonName">
                                    <xsl:value-of select="catESAD_ru:PersonName"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:LNP">
                                    <xsl:value-of select="catESAD_ru:LNP"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:GoodsDevisionDate">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="catESAD_ru:GoodsDevisionDate"/>
                                    </xsl:call-template>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="catESAD_ru:GoodsDevisionTime">
                                    <xsl:value-of select="catESAD_ru:GoodsDevisionTime"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                                <xsl:choose>
                                 <xsl:when test="gicm:PaymentWayCode">
                                    <xsl:value-of select="gicm:PaymentWayCode"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                            </td>
                           <td>         
                                <xsl:choose>
                                 <xsl:when test="gicm:GuaranteeFoundation">
                                    <xsl:value-of select="gicm:GuaranteeFoundation"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <br/>
               <xsl:if test="gicm:Comments">
                  <p align="left">
                     <span style="font-size:14;  font-weight:normal; ">Комментарии:
						<xsl:for-each select="gicm:Comments">
							<xsl:value-of select="normalize-space(.)"/>
							<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
						</xsl:for-each>
                     </span>
                  </p>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
