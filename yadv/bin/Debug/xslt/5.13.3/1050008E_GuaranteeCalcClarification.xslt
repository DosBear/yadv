<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:gclc_cla="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCalcClarification:5.12.0" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.13.1" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/gclc_cla:GuaranteeCalcClarification">
	   <xsl:variable name="docType">
		   <xsl:if test="gclc_cla:DocType='0'">Запрос на уточнение параметров расчета Обеспечения</xsl:if>
		   <xsl:if test="gclc_cla:DocType='1'">Сведения об уточненных параметрах расчета Обеспечения</xsl:if>
	   </xsl:variable>
      <html xmlns="http://www.w3.org/1999/xhtml">
         <head>
            <title>
				<xsl:value-of select="$docType"/>
            </title>
            <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					text-align: left;
						background: #ffffff
               <!--#F8F8FF-->;
						}
						   
						div.page {
                    border: solid 1pt #000000;
                    margin-top: 6pt;
                    margin-bottom: 6pt;
                    padding: 10mm;
                    padding-left: 15mm;
                    background: #ffffff;
                    }

						table { 
						width:180mm 
						border: solid  2pt #ffffff;
						border-collapse: collapse; 
						cellspacing:0;
						}
							
						.bheader {
						border: solid 1pt #bbbbbb;
						padding-left:	5pt;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 11pt;
						font-weight: bold;
						background: #CAE1FF
               <!--#fff0f5-->;
						}			
						
					    .b0 {
						border: solid 1pt #bbbbbb;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						background: #ffffff;
   					    }
					    
					    .b1 {
						border: solid 1pt #bbbbbb;
					    text-indent: 20pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
					    .b1h {
						border: solid 1pt #bbbbbb;
					    text-indent: 20pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						background: #ffffff;
						}
						
						.b2 {
						border: solid 1pt #bbbbbb;
					    text-indent: 40pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
						
						.b3 {
						border: solid 1pt #bbbbbb;
					    text-indent: 60pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;					
						}
						
						.b4 {
						border: solid 1pt #bbbbbb;
					    text-indent: 80pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;						
						}
						
						.btext {
						border: solid 1pt #bbbbbb;
					    padding-left:	5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
				</style>
         </head>
         <body>
            <div class="page">
               <h2><xsl:value-of select="$docType"/></h2>
               <table class="table" style="width:180mm">
                  <tr>
                     <th class="bheader" style="width:100mm;">Поле</th>
                     <th class="bheader" style="width:50mm;">Значение</th>
                  </tr>
                  <tr>
                     <td class="b1" style="width:80mm;">Дата и время формирования электронного документа</td>
                     <td class="btext" style="width:100mm;">
                        <xsl:call-template name="date_time">
                           <xsl:with-param name="dateTimeIn" select="gclc_cla:DocumentDateTime"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <!--Ставки платежей-->
                     <xsl:for-each select="gclc_cla:GoodsAmount">
                        <tr>
                           <tr>
                              <td class="b0" style="width:80mm;">Ставки платежей</td>
                              <td class="btext" style="width:100mm;">
                                 <xsl:value-of select="gclc_cla:Numeric"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="b1" style="width:80mm;">Код товара ТН ВЭД</td>
                              <td class="btext" style="width:100mm;">
                                 <xsl:value-of select="gclc_cla:TNVEDCode"/>
                              </td>
                           </tr>
                           <!--Ставки платежей по товару-->
                           <tr>
                              <tr>
                                 <td class="b1" style="width:80mm;">Ставки платежей по товару</td>
                                 <td class="btext" style="width:100mm;">
                                    <br/>
                                 </td>
                              </tr>
                              <xsl:if test="gclc_cla:RateGood/gclc_cla:Duties">
								  <xsl:for-each select="gclc_cla:RateGood/gclc_cla:Duties">
									  <tr>
										 <td class="b2" style="width:80mm;">Таможенные пошлины</td>
										 <td class="btext" style="width:100mm;">
											<br/>
										 </td>
									  </tr>
									  <xsl:apply-templates select="."/>
								  </xsl:for-each>
                              </xsl:if>
                              <xsl:if test="gclc_cla:RateGood/gclc_cla:Excises">
								  <xsl:for-each select="gclc_cla:RateGood/gclc_cla:Excises">
									  <tr>
										 <td class="b2" style="width:80mm;">Акцизы</td>
										 <td class="btext" style="width:100mm;">
											<br/>
										 </td>
									  </tr>
									  <xsl:apply-templates select="."/>
								  </xsl:for-each>
                              </xsl:if>
                              <xsl:if test="gclc_cla:RateGood/gclc_cla:Taxes">
								  <xsl:for-each select="gclc_cla:RateGood/gclc_cla:Taxes">
									  <tr>
										 <td class="b2" style="width:80mm;">Налоги</td>
										 <td class="btext" style="width:100mm;">
											<br/>
										 </td>
									  </tr>
									  <xsl:apply-templates select="."/>
								  </xsl:for-each>
                              </xsl:if>
                           </tr>
                        </tr>
                     </xsl:for-each>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="gclc_cla:Duties|gclc_cla:Excises|gclc_cla:Taxes">
	   <xsl:if test="gclc_cla:GoodsDescription">
		  <tr>
			 <td class="b3" style="width:80mm;">Наименование товаров</td>
			 <td class="btext" style="width:100mm;">
				<xsl:for-each select="gclc_cla:GoodsDescription">
					<xsl:value-of select="."/>
				</xsl:for-each>
			 </td>
		  </tr>
	   </xsl:if>
	   <xsl:if test="gclc_cla:Rate">
		  <tr>
			 <td class="b3" style="width:80mm;">Ставка</td>
			 <td class="btext" style="width:100mm;">
				<xsl:value-of select="gclc_cla:Rate"/>
			 </td>
		  </tr>
	   </xsl:if>
	   <xsl:if test="gclc_cla:RateTypeCode">
		  <tr>
			 <td class="b3" style="width:80mm;">Вид ставки</td>
			 <td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_cla:RateTypeCode"/>
			 </td>
		  </tr>
	   </xsl:if>
   </xsl:template>
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
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
</xsl:stylesheet>
