<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:lqcm="urn:customs.ru:Information:CustomsDocuments:LiquidationCustomsMark:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="lqcm:LiquidationCustomsMark">
      <html>
         <head>
            <title>Отметки таможенного органа на Заявлении об уничтожении товаров и (или) упаковки, пришедших в негодность</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
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
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
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
							font-size: pt;
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
                     <td align="right" class="graph" style="border:solid 0pt" width="50%"> </td>
                     <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
                        <xsl:if test="lqcm:Customs/cat_ru:OfficeName">
                           <xsl:value-of select="lqcm:Customs/cat_ru:OfficeName"/>, </xsl:if>
                        <xsl:value-of select="lqcm:Customs/cat_ru:Code"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"/>
                     <td class="graph" style="border:solid 0pt">(наименование таможенного органа (с указанием кода таможенного органа))</td>
                  </tr>
               </table>
               <table>
					  <tr>
						 <td class="graph" style="border:solid 0pt" width="50%">№<u>
							   <xsl:value-of select="lqcm:ApplicationRegNumber/lqcm:CustomsCode"/>
							</u>/<u>
							   <xsl:call-template name="russian_date_gtd">
								  <xsl:with-param name="dateIn" select="lqcm:ApplicationRegNumber/lqcm:RegistrationDate"/>
							   </xsl:call-template>
							</u>/<u>
							   <xsl:value-of select="lqcm:ApplicationRegNumber/lqcm:SerialNumber"/>
							</u> ЗУН</td>
						 <td style="border:solid 0pt"/>
					  </tr>
			   </table>
               <xsl:for-each select="lqcm:CustomsMark">
				   <table>
					  <tr>
						 <td class="graph" width="42%">Отметка таможенного органа<br/>
							<table>
							   <tr>
								  <td class="graph" style="border:solid 0pt" width="50%">
									 <xsl:choose>
										<xsl:when test="lqcm:CustomsDecision=1">Уничтожение разрешено</xsl:when>
										<xsl:when test="lqcm:CustomsDecision=2">Уничтожение разрешено</xsl:when>
										<xsl:when test="lqcm:CustomsDecision=3">Уничтожение не разрешено</xsl:when>
										<xsl:otherwise>в продлении срока отказано</xsl:otherwise>
									 </xsl:choose>
								  </td>
								  <td class="graph" style="border:solid 0pt">
									 <xsl:if test="lqcm:CustomsDecision=1">Срок:
										<xsl:call-template name="russian_date_gtd1">
										   <xsl:with-param name="dateIn" select="lqcm:FinalLiquidationDate"/>
										</xsl:call-template>
										<br/>
									 </xsl:if>
								  </td>
							   </tr>
							   <tr>
								  <td align="center" class="graph" style="border:solid 0pt">
									 <u>
										<xsl:call-template name="russian_date_gtd1">
										   <xsl:with-param name="dateIn" select="lqcm:ComposeDate"/>
										</xsl:call-template>
									 </u>
								  </td>
								  <td align="center" class="graph" style="border:solid 0pt">
									 <u>
										<xsl:value-of select="lqcm:CustomsPerson/cat_ru:PersonName"/>
										<xsl:if test="lqcm:CustomsPerson/cat_ru:LNP">(<xsl:value-of select="lqcm:CustomsPerson/cat_ru:LNP"/>)</xsl:if>
									 </u>
								  </td>
							   </tr>
							   <tr>
								  <td align="center" class="graph" style="border:solid 0pt">(дата)</td>
								  <td align="center" class="graph" style="border:solid 0pt">(подпись)</td>
							   </tr>
							</table>
						 </td>
						 <td style="border:solid 0pt"/>
					  </tr>
				   </table>
				   <table>
					  <xsl:if test="lqcm:CustomsControl">
						 <tr>
							<td class="graph" colspan="3" style="border:solid 0pt">
							   <br/>Таможенный контроль:<br/>
							   <table cellspacing="5">
								  <tr>
									 <td class="graph" style="border:solid 0pt" width="12%">С применением</td>
									 <td align="center" style="border:solid 0.8pt; width:5mm">
										<span class="graph">
										   <xsl:if test="lqcm:CustomsControl='1' or lqcm:CustomsControl='t' or lqcm:CustomsControl='true'">x</xsl:if>
										   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</span>
									 </td>
									 <td class="graph" style="border:solid 0pt" width="12%"> /без применения</td>
									 <td align="center" style="border:solid 0.8pt; width:5mm">
										<span class="graph">
										   <xsl:if test="lqcm:CustomsControl='0' or lqcm:CustomsControl='f' or lqcm:CustomsControl='false'">x</xsl:if>
										   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</span>
									 </td>
									 <td class="graph" style="border:solid 0pt"> таможенного наблюдения.</td>
								  </tr>
							   </table>
							</td>
						 </tr>
					  </xsl:if>
					  <tr>
						 <td class="graph" colspan="3" style="border:solid 0pt">
							<table>
							   <tr>
								  <td class="graph" style="border:solid 0pt" width="38%">Акт об уничтожении должен быть представлен в срок до</td>
								  <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
									 <xsl:if test="lqcm:CustomsDecision=1">
										<xsl:if test="lqcm:FinalLiquidationDate">
										   <xsl:call-template name="russian_date">
											  <xsl:with-param name="dateIn" select="lqcm:FinalLiquidationDate"/>
										   </xsl:call-template>
										</xsl:if>
									 </xsl:if>
								  </td>
							   </tr>
							</table>
						 </td>
					  </tr>
					  <tr>
						 <td class="graph" colspan="3" style="border:solid 0pt">
							<table>
							   <tr>
								  <td class="graph" style="border:solid 0pt" width="20%">Срок уничтожения продлен до</td>
								  <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;" width="17%">
									 <xsl:if test="lqcm:CustomsDecision=2">
										<xsl:if test="lqcm:FinalLiquidationDate">
										   <xsl:call-template name="russian_date">
											  <xsl:with-param name="dateIn" select="lqcm:FinalLiquidationDate"/>
										   </xsl:call-template>
										</xsl:if>
									 </xsl:if>
								  </td>
								  <td class="graph" style="border:solid 0pt" width="10%">на основании</td>
								  <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
									 <xsl:if test="lqcm:CustomsDecision=2">
										<!--<xsl:value-of select="lqcm:ApplicationRegNumber/lqcm:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
														<xsl:with-param name="dateIn" select="lqcm:ApplicationRegNumber/lqcm:RegistrationDate"/>
													</xsl:call-template>/<xsl:value-of select="lqcm:ApplicationRegNumber/lqcm:SerialNumber"/>-->
										<xsl:apply-templates select="lqcm:ProlongFoundation"/>
									 </xsl:if>
								  </td>
							   </tr>
							</table>
						 </td>
					  </tr>
					  <tr>
						 <td class="graph" colspan="3" style="border:solid 0pt">
							<xsl:choose>
							   <xsl:when test="lqcm:CustomsDecision=4">Причины отказа в продлении срока уничтожения:</xsl:when>
							   <xsl:otherwise>Причины невозможности выдачи разрешения на уничтожение:</xsl:otherwise>
							</xsl:choose>
						 </td>
					  </tr>
					  <tr>
						 <td class="graph" colspan="3">
							<xsl:for-each select="lqcm:RefusalReasons">
							   <xsl:value-of select="."/>
							   <xsl:if test="position()!=last()"> </xsl:if>
							</xsl:for-each>
						 </td>
					  </tr>
					  <tr>
						 <td align="center" class="graph" colspan="3" style="border:solid 0pt">
							<xsl:choose>
							   <xsl:when test="lqcm:CustomsDecision=4">(указываются причины, по которым принято решение о невозможности продления срока уничтожения)</xsl:when>
							   <xsl:otherwise>(указываются причины, по которым принято решение о невозможности выдачи разрешения на уничтожение)</xsl:otherwise>
							</xsl:choose>
						 </td>
					  </tr>
				   </table>
               </xsl:for-each>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>,
	</xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>,
	</xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>,
	</xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>,
	</xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>,
	</xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>,
	</xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
	Адрес:
	<xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if> 
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
   <xsl:template name="russian_date_gtd1">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>/
				<xsl:value-of select="substring($dateIn,6,2)"/>/
				<xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
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
   <xsl:template match="lqcm:ProlongFoundation">
      <xsl:value-of select="cat_ru:PrDocumentName"/>
      <xsl:if test="cat_ru:PrDocumentNumber">
			 № <xsl:value-of select="cat_ru:PrDocumentNumber"/>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
			от <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
