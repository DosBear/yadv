<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:bdr="urn:customs.ru:Information:CustomsDocuments:BDRD_Report:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="bdr:BDRD_Report">
      <html>
         <head>
            <title>Запрос сведений разрешительных документов</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
				background: #cccccc;
			}

			div.page {
				width: 210mm;
				height: 297mm;
				margin: auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				padding-left: 20mm;
				background: #ffffff;
				border: solid 1pt #000000;
			}
			
			div.album_page {
				width: 297mm;
				height: 210mm;
				margin: auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				padding-left: 20mm;
				background: #ffffff;
				border: solid 1pt #000000;
			}

			h2 {
				text-align:center;
				font: 20 ;
				font-family: Arial, serif;
			}
			
			.remark {
				text-align:right;
				font: 15;
				font-family: Arial, serif;
				text-decoration: underline;
			}
			
			.header {
				
				margin-top:20px;
				font: bold;
				
			}
			
			 table {
				width: 100%;
				border: 0;
				empty-cells: show;
				border-collapse: collapse;
				margin-top: 1px;
			}
			table2 {
				width: 80%;
				border: 0;
				empty-cells: show;
				border-collapse: collapse;
				margin-top: 1px;
			}
			td {
				border: 1px solid gray;
				font-family: Courier, serif;

				vertical-align:top;
			}
			
			.auxiliary tbody tr td {
				border: 0;
			}
			.graph {
							font-family: Arial;
							font-size: 12pt;
							}
							
						.graphBold {
							font-family: Arial;
							font-size: 7pt;
							font-weight: bold;
							}
							
						td {
							font-family:Courier;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 12pt;
							
							}
.graphLow {
							font-family: Arial;
							font-size: 11pt;
							
							}
							
						
		</style>
         </head>
         <body>
            <div class="page">
               <h2>Отчет по результатам сопоставления сведений из разрешительного документа и ДТ</h2>
               <table class="table">
                  <tbody>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="border:0;">
                           <u>Позиция РД в запросе: </u>
                           <xsl:value-of select="bdr:RequestPositionID"/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="border:0;">
                           <span>
                              <u>Результаты сверки сведений:</u>
                              <br/>
                              <xsl:for-each select="bdr:CheckResult">
                                 <xsl:if test="bdr:DataSource">Источник получения сведений: <xsl:value-of select="bdr:DataSource"/>
                                 </xsl:if>
                                 <br/>
											Возможность списания квоты: <xsl:choose>
                                    <xsl:when test="bdr:QuotaPosibilitySign='1' or bdr:QuotaPosibilitySign='t' or bdr:QuotaPosibilitySign='true'">Да</xsl:when>
                                    <xsl:otherwise>Нет</xsl:otherwise>
                                 </xsl:choose>
                                 <br/>
                                 <br/>
                                 <table class="table2">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graphMain" style="width: 5%">Номер товара по ДТ</td>
                                          <td align="center" class="graphMain" style="width: 5%">Номер позиции товара по приложению разрешительного документа</td>
                                          <td align="center" class="graphMain" style="width: 30%">Наименование товара по ДТ</td>
                                          <td align="center" class="graphMain" style="width: 30%">Наименование товара по РД</td>
                                          <td align="center" class="graphMain" style="width: 5%">Код товара по ТН ВЭД ЕАЭС по ДТ</td>
                                          <td align="center" class="graphMain" style="width: 5%">Код товара по ТН ВЭД ЕАЭС по РД</td>
                                          <td align="center" class="graphMain" style="width: 10%">Количество товара по ДТ</td>
                                          <td align="center" class="graphMain" style="width: 10%">Количество товара по РД</td>
                                       </tr>
                                       <tr>
                                          <td align="center" class="graphLow" style="width: 5%">
                                             <xsl:value-of select="bdr:GoodsNumber"/>
                                          </td>
                                          <td align="center" class="graphLow" style="width: 5%">
                                             <xsl:value-of select="bdr:Numeric"/>
                                          </td>
                                          <td class="graphLow" style="width: 30%">
                                             <xsl:for-each select="bdr:DT_GoodsDescription">
                                                <xsl:if test="position()>1"> </xsl:if>
                                                <xsl:value-of select="."/>
                                             </xsl:for-each>
                                          </td>
                                          <td class="graphLow" style="width: 30%">
                                             <xsl:for-each select="bdr:RD_GoodsDescription">
                                                <xsl:if test="position()>1"> </xsl:if>
                                                <xsl:value-of select="."/>
                                             </xsl:for-each>
                                          </td>
                                          <td align="center" class="graphLow" style="width: 5%">
                                             <xsl:value-of select="bdr:DT_GoodsTNVEDCode"/>
                                          </td>
                                          <td align="center" class="graphLow" style="width: 5%">
                                             <xsl:value-of select="bdr:RD_GoodsTNVEDCode"/>
                                          </td>
                                          <td class="graphLow" style="width: 10%">
                                             <xsl:for-each select="bdr:DT_SupplementaryQuantity">
                                                <xsl:apply-templates select="."/>
                                                <br/>
                                             </xsl:for-each>
                                          </td>
                                          <td class="graphLow" style="width: 10%">
                                             <xsl:for-each select="bdr:RD_SupplementaryQuantity">
                                                <xsl:apply-templates select="."/>
                                                <br/>
                                             </xsl:for-each>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                                 <br/>
                              </xsl:for-each>
                           </span>
                        </td>
                        <td align="center" class="graph" style="border:0;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="bdr:RD_SupplementaryQuantity | bdr:DT_SupplementaryQuantity">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
</xsl:stylesheet>
