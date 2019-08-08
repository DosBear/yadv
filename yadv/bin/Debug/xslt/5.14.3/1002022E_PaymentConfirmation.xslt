<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="pcnf cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pcnf="urn:customs.ru:Information:CommercialFinanceDocuments:PaymentConfirmation:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
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
   <xsl:template name="russian_date_gtd">
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
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="pcnf:PaymentConfirmation">
      <html>
         <head>
            <title>Чек подтверждения оплаты</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
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
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}
						
					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
					.underlined {
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table border="0" cellpadding="3" cellspacing="0" style="width:100mm; border-top: solid 1pt #000000; border-left: solid 1pt #000000;border-right: solid 1pt #000000;border-bottom:solid 1pt #000000 ;  ">
                  <tbody>
                     <tr>
                        <td align="center">ИНКАССАЦИЯ</td>
                     </tr>
                     <tr>
                        <td align="center">** 
								<xsl:value-of select="substring(pcnf:DocDate,9,2)"/>/
								<xsl:value-of select="substring(pcnf:DocDate,6,2)"/>/
								<xsl:value-of select="substring(pcnf:DocDate,1,4)"/>
								   
								<xsl:value-of select="pcnf:DocTime"/>**
								
								</td>
                     </tr>
                     <tr>
                        <td align="center">
                           <!--ОПЕРАТОР ТАМОЖЕННЫХ ПЛАТЕЖЕЙ <br/>-->
                           <xsl:value-of select="pcnf:NameOperator"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <!--БАНК ОПЕРАТОРА ТП<br/>-->
                           <xsl:value-of select="pcnf:OwnerEquipment"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
                           <!--ТАМОЖНЯ<br/>-->
                           <xsl:value-of select="pcnf:CustomsInfo/pcnf:CustomsName"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
                           <!--ТАМОЖЕННЫЙ ПОСТ&#160;-->
                           <xsl:value-of select="pcnf:CustomsInfo/pcnf:PostName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
                           <xsl:for-each select="pcnf:CustomsInfo/pcnf:Address">
                              <xsl:call-template name="Address"/> 
									</xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table style="width:100mm;">
                              <tbody>
                                 <tr>
                                    <td align="left" style="width:50mm;">
                                       <xsl:value-of select="pcnf:TerminalInfo/pcnf:TermenalNumber"/>
                                    </td>
                                    <td align="right" style="width:50mm;">
													в:
													<xsl:value-of select="pcnf:ReportNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="left" style="width:50mm;">
                                       <xsl:value-of select="pcnf:TerminalInfo/pcnf:PostNumer"/>
                                    </td>
                                    <td align="right" style="width:50mm;">ЧЕК:
													<xsl:value-of select="pcnf:CheckNumber"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
								ОПЛАТА 
								<xsl:choose>
                              <xsl:when test="pcnf:Payment/pcnf:PaymentKind='1' ">
									&lt;КАРТА &gt;<br/>
                                 <xsl:value-of select="pcnf:Payment/pcnf:CardNumber"/>
                              </xsl:when>
                              <xsl:otherwise>
									&lt;НАЛИЧНЫЕ&gt;
									</xsl:otherwise>
                           </xsl:choose>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
									ПЛАТЕЛЬЩИК
									<br/>
                           <xsl:if test="pcnf:PayerInfo/pcnf:INN">
										ИНН:<xsl:value-of select="pcnf:PayerInfo/pcnf:INN"/>
                              <br/>
                           </xsl:if>
                           <xsl:if test="pcnf:PayerInfo/pcnf:KPP">
									КПП:<xsl:value-of select="pcnf:PayerInfo/pcnf:KPP"/>
                              <br/>
                           </xsl:if>
									&lt;<xsl:value-of select="pcnf:PayerInfo/pcnf:OrganizationName"/>&gt;<br/>
                           <xsl:if test="pcnf:PayerInfo/pcnf:IdentityCard">
                              <xsl:value-of select="pcnf:PayerInfo/pcnf:IdentityCard/RUScat_ru:IdentityCardName"/>: <xsl:value-of select="pcnf:PayerInfo/pcnf:IdentityCard/RUScat_ru:IdentityCardSeries"/> № <xsl:value-of select="pcnf:PayerInfo/pcnf:IdentityCard/RUScat_ru:IdentityCardSeries"/>
                              <br/>
                              <xsl:value-of select="pcnf:PayerInfo/pcnf:IdentityCard/RUScat_ru:IdentityCardNumber"/>
                              <br/>
									ВЫДАН <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pcnf:PayerInfo/pcnf:IdentityCard/RUScat_ru:IdentityCardDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <br/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
									ОСНОВАНИЕ ПЛАТЕЖА<br/>
									ДЕ:<xsl:value-of select="pcnf:BasePayment/cat_ru:PrDocumentNumber"/>
                           <br/>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pcnf:BasePayment/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:for-each select="pcnf:Paying">
                              <table>
                                 <tbody>
                                    <tr>
                                       <td align="left" style="width:50mm;">ВИД ПЛАТЕЖА:</td>
                                       <td align="right" style="width:50mm;">
                                          <xsl:value-of select="pcnf:PaymentModeCode"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="left" style="width:50mm;">КБК:</td>
                                       <td align="right" style="width:50mm;">
                                          <xsl:value-of select="pcnf:CBC"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="left" style="width:50mm;">СУММА:<br/>
									РУБ.</td>
                                       <td align="right" style="width:50mm;">
                                          <xsl:value-of select="pcnf:Amount"/>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                              <br/>
                           </xsl:for-each>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table>
                              <tbody>
                                 <tr>
                                    <td style="width:50mm;">
											ИТОГО
											</td>
                                    <td style="width:50mm;">
											ОБЩАЯ СУММА
											</td>
                                 </tr>
                                 <tr>
                                    <td style="width:50mm;">
                                       <xsl:value-of select="count(pcnf:Paying)"/>
                                    </td>
                                    <td style="width:50mm;">
                                       <xsl:value-of select="pcnf:TotalAmount"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="center">
                           <xsl:value-of select="pcnf:Completion"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
