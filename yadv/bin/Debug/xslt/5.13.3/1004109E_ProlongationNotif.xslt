<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pn="urn:customs.ru:Information:ExchangeDocuments:ProlongationNotif:5.13.3" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="pn:ProlongationNotif">
	   <xsl:variable name="docSign">
		   <xsl:choose>
				<xsl:when test="pn:DocSign='0'">Уведомление о запрете продления срока выпуска товаров</xsl:when>
				<xsl:when test="pn:DocSign='1'">Уведомление о разрешении продления срока выпуска товаров</xsl:when>
				<xsl:when test="pn:DocSign='2'">Решение о продлении срока приостановления выпуска товаров</xsl:when>
				<xsl:when test="pn:DocSign='3'">Решение об отказе в продлении срока приостановления выпуска товаров</xsl:when>
				<xsl:when test="pn:DocSign='4'">Уведомление о продлении сроков выдачи МПО</xsl:when>
				<xsl:when test="pn:DocSign='5'">Решение о продлении срока выпуска товаров ДТ</xsl:when>
				<xsl:otherwise>Неизвестный тип документа [ <xsl:value-of select="pn:DocSign"/> ]</xsl:otherwise>
			</xsl:choose>
	   </xsl:variable>
      <html>
         <head>
            <title><xsl:value-of select="$docSign"/></title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
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
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Arial, serif;
					font-size: 11pt;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Arial;
				}
				.graph {
							font-family: Arial;
							font-size: 11pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>
								<i><xsl:value-of select="$docSign"/><br/>
									<xsl:text>от </xsl:text> 
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pn:NotifDate"/></xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:if test="pn:NotifTime">(<xsl:value-of select="substring(pn:NotifTime, 1, 8)"/>)</xsl:if>
								</i>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Регистрационный номер ДТ: <xsl:apply-templates select="pn:RegNumberDT"/>
                     </td>
                  </tr>
                  <xsl:if test="pn:DocSign='0' or pn:DocSign='1'">
					  <xsl:if test="pn:ProlongDate">
						  <tr>
							 <td class="graph" style="border:solid 0pt">Дата и время, до которых продлевается срок: 
								 <xsl:call-template name="russian_datetime">
								   <xsl:with-param name="dateIn" select="pn:ProlongDate"/>
								</xsl:call-template>
							 </td>
						  </tr>
					  </xsl:if>
                  </xsl:if>
                  <xsl:if test="pn:DocSign='2' or pn:DocSign='3'">
					  <xsl:if test="pn:Period">
						  <tr>
							 <td class="graph" style="border:solid 0pt">Количество рабочих дней, на которые продлевается срок приостановления выпуска товаров: 
								   <xsl:value-of select="pn:Period"/>
							 </td>
						  </tr>
					  </xsl:if>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
						<xsl:text>Основание решения: </xsl:text>
						<xsl:if test="pn:ReasonsCode">(<xsl:value-of select="pn:ReasonsCode"/>)</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:value-of select="pn:Reasons"/>
                     </td>
                  </tr>
                  <xsl:if test="pn:Comments">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Комментарии: <xsl:value-of select="pn:Comments"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="pn:MPO_Registration">
					  <tr>
						 <td class="graph" style="border:solid 0pt">Рег.номер МПО: 
							 <xsl:for-each select="pn:MPO_Registration">
								<xsl:value-of select="mpco:CustomsCode"/>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="substring(mpco:RegistrationDate,9,2)"/><xsl:value-of select="substring(mpco:RegistrationDate,6,2)"/><xsl:value-of select="substring(mpco:RegistrationDate,3,2)"/>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="mpco:MPO_Number"/>
							</xsl:for-each>
						 </td>
					  </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Должностное лицо таможенного органа: <xsl:value-of select="pn:CustomsPerson/cat_ru:PersonName"/>
                        <xsl:if test="pn:CustomsPerson/cat_ru:LNP">(<xsl:value-of select="pn:CustomsPerson/cat_ru:LNP"/>)</xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Сведения о таможенном органе: <xsl:if test="pn:Customs/cat_ru:OfficeName">
                           <xsl:value-of select="pn:Customs/cat_ru:OfficeName"/>, </xsl:if>
						код <xsl:value-of select="pn:Customs/cat_ru:Code"/>
                     </td>
                  </tr>
                  <xsl:if test="pn:Goods">
					  <tr>
						 <td class="graph" style="border:solid 0pt">Сведения о товарах ДТ: </td>
					  </tr>
                  </xsl:if>
               </table>
               <xsl:if test="pn:Goods">
				   <table>
						<tr>
							<td>№ п/п декларируемого товара</td>
							<td>Код товара по<br/>ТН ВЭД ЕАЭС</td>
							<td>Наименование товара</td>
							<td>Дата и время, до которых продлевается срок выпуска товара ДТ</td>
						</tr>
						<xsl:for-each select="pn:Goods">
							<tr>
								<td><xsl:value-of select="pn:GoodsNumeric"/></td>
								<td><xsl:value-of select="pn:GoodsTNVEDCode"/></td>
								<td><xsl:apply-templates select="pn:GoodsDescription"/></td>
								<td>
									<xsl:call-template name="russian_datetime">
										<xsl:with-param name="dateIn" select="pn:ProlongDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
				   </table>
               </xsl:if>
            </div>
         </body>
      </html>
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
   <xsl:template match="pn:RegNumberDT">
      <xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>
		<xsl:text>/</xsl:text>
      <xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   
	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text>   </xsl:text>
				<xsl:value-of select="substring($dateIn,12,string-length($dateIn))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   
</xsl:stylesheet>
