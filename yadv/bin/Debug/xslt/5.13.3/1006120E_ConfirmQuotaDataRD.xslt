<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cqdrd="urn:customs.ru:Information:CustomsDocuments:ConfirmQuotaDataRD:5.13.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="cqdrd:ConfirmQuotaDataRD">
      <html>
         <head>
            <title>Информация о списании по квоте</title>
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
				background: #ffffff;
				border: solid 1pt #000000;
			}
			
			h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
			}
			
			.header {
					font-weight: bold;
					margin-top:20px;
				}
		</style>
         </head>
         <body>
            <div class="page">
               <h2>Информация о списании по квоте № <xsl:value-of select="cqdrd:BDRDID"/>
               </h2>
               <span>Дата использования и время </span>
               <span style="text-decoration:underline">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:call-template name="date_time">
                     <xsl:with-param name="dateTimeIn" select="cqdrd:UseDateTime"/>
                  </xsl:call-template>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </span>
               <br/>
               <span>Таможенный документ: </span>
               <span style="text-decoration:underline">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="cqdrd:CustDocType = 'ДТ'">декларация на товары</xsl:when>
                     <xsl:when test="cqdrd:CustDocType = 'ПР'"> сообщение о прибытии</xsl:when>
                     <xsl:when test="cqdrd:CustDocType = 'УБ'"> сообщение об убытии</xsl:when>
                     <xsl:when test="cqdrd:CustDocType = 'ТД'"> транзитная декларация</xsl:when>
                  </xsl:choose>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				№<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:apply-templates select="cqdrd:GTDID"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </span>
               <br/>
				<xsl:if test="cqdrd:RDDocument">
				   <span>Разрешительный документ: </span>
				   <span style="text-decoration:underline">
					  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					  <xsl:value-of select="cqdrd:RDDocument/cat_ru:PrDocumentName"/>
					  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					  <xsl:if test="cqdrd:RDDocument/cat_ru:PrDocumentNumber">
						   № <xsl:value-of select="cqdrd:RDDocument/cat_ru:PrDocumentNumber"/>
					   </xsl:if>
					  <xsl:if test="cqdrd:RDDocument/cat_ru:PrDocumentDate">
					    от 
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cqdrd:RDDocument/cat_ru:PrDocumentDate"/>
						 </xsl:call-template>
					  </xsl:if>
					  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				   </span>
				   <br/>
               </xsl:if>
               <xsl:if test="cqdrd:AnnulComment">
				   <span>Причины аннулирования списания квот: </span>
				   <span style="text-decoration:underline">
					  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					  <xsl:value-of select="cqdrd:AnnulComment"/>
					  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				   </span>
				   <br/>
               </xsl:if>
               <xsl:if test="cqdrd:CustomsPerson">
				   <span>Должностное лицо таможенного органа: </span>
				   <span style="text-decoration:underline">
					  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					  <xsl:value-of select="cqdrd:CustomsPerson/cat_ru:PersonName"/>
					  <xsl:if test="cqdrd:CustomsPerson/cat_ru:LNP"> ЛНП: <xsl:value-of select="cqdrd:CustomsPerson/cat_ru:LNP"/></xsl:if>
					  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				   </span>
				   <br/>
               </xsl:if>
               <br/>
               <span>Сведения о товарах: </span>
               <br/>
               <table border="2" cellpadding="0" cellspacing="0" style="border-collapse:collapse; margin-top:1mm">
				 <tr>
					<th rowspan="2">Номер предшествующей ДТ</th>
					<th rowspan="2">№ товара</th>
					<th colspan="2">Сведения о товаре по приложению разрешительного документа</th>
					<th rowspan="2">Количество</th>
				 </tr>
				 <tr>
					<th style="width:35mm">Номер приложения / перечня</th>
					<th style="width:35mm">Порядковый номер товара</th>
				 </tr>
				 <xsl:for-each select="cqdrd:Goods">
					<tr>
					   <td style="padding-left:2mm; vertical-align: top">
						  <xsl:apply-templates select="cqdrd:GTDID"/>
					   </td>
					   <td style="padding-left:2mm; vertical-align: top">
						  <xsl:value-of select="cqdrd:GoodsNumber"/>
					   </td>
					   <td style="padding-left:2mm; vertical-align: top">
						  <xsl:if test="cqdrd:LicenseGoods/catESAD_cu:AppNumber">
							 <xsl:value-of select="cqdrd:LicenseGoods/catESAD_cu:AppNumber"/>
						  </xsl:if>
					   </td>
					   <td style="padding-left:2mm; vertical-align: top">
						  <xsl:value-of select="cqdrd:LicenseGoods/catESAD_cu:GoodsNumericLic"/>
					   </td>
					   <td style="padding-left:2mm; vertical-align: top">
						  <xsl:for-each select="cqdrd:SupplementaryQuantity">
							 <xsl:value-of select="cat_ru:GoodsQuantity"/>
							 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							 <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
							 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							 <xsl:if test="cat_ru:MeasureUnitQualifierCode">
									(код - <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
								</xsl:if>
								<xsl:if test="position()!=last()">; </xsl:if>
							 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						  </xsl:for-each>
					   </td>
					</tr>
				 </xsl:for-each>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cqdrd:GTDID">
	   <xsl:value-of select="cat_ru:CustomsCode"/>
	   <xsl:text>/</xsl:text>
	   <xsl:call-template name="gtd_date">
		   <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
	   </xsl:call-template>
	   <xsl:text>/</xsl:text>
	   <xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
