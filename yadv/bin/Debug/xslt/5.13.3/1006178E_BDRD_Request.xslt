<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:bdrd="urn:customs.ru:Information:CustomsDocuments:BDRD_Request:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="bdrd:BDRD_Request">
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
               <h2>Запрос сведений разрешительных документов</h2>
               <table class="table">
                  <tbody>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="border:0;">
                           <u>Таможенный документ, при оформлении которого использован разрешительный документ:</u>
                           <br/>
                           <xsl:if test="bdrd:CustomsDocument/bdrd:DocKind">
                              <xsl:choose>
                                 <xsl:when test="bdrd:CustomsDocument/bdrd:DocKind='1'">Декларация на товары</xsl:when>
                                 <xsl:when test="bdrd:CustomsDocument/bdrd:DocKind='2'">Транзитная декларация</xsl:when>
                                 <xsl:when test="bdrd:CustomsDocument/bdrd:DocKind='3'">Сообщение о прибытии</xsl:when>
                                 <xsl:otherwise>Сообщение об убытии</xsl:otherwise>
                              </xsl:choose>
									 № </xsl:if>
                           <xsl:apply-templates select="bdrd:CustomsDocument"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="border:0;">
                           <span>
                              <u>Запрашиваемые сведения:</u>
                              <br/>
                              <xsl:for-each select="bdrd:RequestedData">
                                 <xsl:value-of select="bdrd:RequestPositionID"/>. <xsl:apply-templates select="."/> (код вида документа <xsl:value-of select="bdrd:DocCode"/>)<br/>
                                 <br/>
                                 <table class="table2">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graphMain" style="width: 40%">Наименование</td>
                                          <td align="center" class="graphMain" style="width: 10%">Номер товара по ДТ</td>
                                          <td align="center" class="graphMain" style="width: 10%">Номер позиции товара по приложению разрешительного документа</td>
                                          <td align="center" class="graphMain">Код товара по ТН ВЭД ЕАЭС</td>
                                          <td align="center" class="graphMain">Количество товара по ДТ</td>
                                       </tr>
                                       <xsl:for-each select="bdrd:GoodInfo">
                                          <tr>
                                             <td class="graphLow">
                                                <xsl:for-each select="bdrd:GoodsDescription">
                                                   <xsl:if test="position()>1"> </xsl:if>
                                                   <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                             <td align="center" class="graphLow">
                                                <xsl:value-of select="bdrd:GoodsNumber"/>
                                             </td>
                                             <td align="center" class="graphLow">
                                                <xsl:value-of select="bdrd:Numeric"/>
                                             </td>
                                             <td align="center" class="graphLow">
                                                <xsl:apply-templates select="bdrd:GoodsTNVEDCode"/>
                                             </td>
                                             <td class="graphLow">
                                                <xsl:for-each select="bdrd:SupplementaryQuantity">
                                                   <xsl:apply-templates select="."/>
                                                   <br/>
                                                </xsl:for-each>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
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
                     <tr>
                        <td align="left" class="graph" colspan="2" style="border:0;">
                           <br/>
                           <xsl:apply-templates select="bdrd:Customs"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="border:0;">
                           <br/>
                           <xsl:apply-templates select="bdrd:CustomsPerson"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="bdrd:SupplementaryQuantity">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="bdrd:CustomsPerson">
      <table border="0" style="margin-top:50px; width:100%">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0; width:55%">
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td style="border:0;"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="30%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graphLow" style="border:0;">(Ф.И.О.)</td>
               <td style="border:0;"/>
               <td align="center" class="graphLow" style="border:0;">(ЛНП)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="bdrd:CustomsDocument">
      <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template match="bdrd:RequestedData">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
         № <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate"> от <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
   </xsl:template>
   <xsl:template match="bdrd:Customs">
      <!-- Таможенный орган - облегченный вариант -->
   Таможенный орган: 
   <xsl:value-of select="cat_ru:Code"/>
      <xsl:if test="cat_ru:OfficeName">
      (<xsl:value-of select="cat_ru:OfficeName"/>)
   </xsl:if>
   </xsl:template>
</xsl:stylesheet>
