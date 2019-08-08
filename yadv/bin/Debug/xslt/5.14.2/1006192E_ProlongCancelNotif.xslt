<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:prcn="urn:customs.ru:Information:CustomsDocuments:ProlongCancelNotif:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="prcn:ProlongCancelNotif">
      <html>
         <head>
            <title>
               <xsl:choose>
                  <xsl:when test="prcn:DocSign='2'">Обращение на аннулирование разрешения</xsl:when>
                  <xsl:when test="prcn:DocSign='1'">Обращение на продление срока</xsl:when>
                  <xsl:otherwise>Решение о продлении срока проверки</xsl:otherwise>
               </xsl:choose>
            </title>
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
				.graph1 {
							font-family: Arial;
							font-size: 10pt;
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
                     <td align="right" class="graph" style="border:solid 0pt" width="50%">     </td>
                     <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
                        <xsl:if test="prcn:Customs/cat_ru:OfficeName">
                           <xsl:value-of select="prcn:Customs/cat_ru:OfficeName"/>,</xsl:if>
                        <xsl:value-of select="prcn:Customs/cat_ru:Code"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"/>
                     <td align="center" class="graph" style="border:solid 0pt">(наименование таможенного органа)</td>
                  </tr>
                  <xsl:if test="prcn:Applicant">
                     <tr>
                        <td align="right" class="graph" style="border:solid 0pt" width="50%">  </td>
                        <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #000000;">
                           <xsl:if test="prcn:Applicant/cat_ru:OrganizationName">
                              <xsl:value-of select="prcn:Applicant/cat_ru:OrganizationName"/>
                           </xsl:if>
                           <xsl:if test="prcn:Applicant/cat_ru:ShortName">(<xsl:value-of select="prcn:Applicant/cat_ru:ShortName"/>)</xsl:if> 
				<xsl:if test="prcn:Applicant/prcn:PersonPost">Должность:<xsl:value-of select="prcn:Applicant/prcn:PersonPost"/> </xsl:if>
                           <xsl:if test="prcn:Applicant/prcn:OEZ_ResidentCertif">Свидетельство:
				<xsl:if test="prcn:Applicant/prcn:OEZ_ResidentCertif/cat_ru:PrDocumentName">
                                 <xsl:value-of select="prcn:Applicant/prcn:OEZ_ResidentCertif/cat_ru:PrDocumentName"/> </xsl:if>
                              <xsl:if test="prcn:Applicant/prcn:OEZ_ResidentCertif/cat_ru:PrDocumentNumber">№<xsl:value-of select="prcn:Applicant/prcn:OEZ_ResidentCertif/cat_ru:PrDocumentNumber"/> </xsl:if>
                              <xsl:if test="prcn:Applicant/prcn:OEZ_ResidentCertif/cat_ru:PrDocumentDate">Дата:
				<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="prcn:Applicant/prcn:OEZ_ResidentCertif/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template> </xsl:if>
                           </xsl:if>
                           <xsl:choose>
                              <xsl:when test="prcn:Applicant/cat_ru:RFOrganizationFeatures">
                                 <xsl:apply-templates select="prcn:Applicant/cat_ru:RFOrganizationFeatures"/>
                              </xsl:when>
                              <xsl:when test="prcn:Applicant/cat_ru:RKOrganizationFeatures">
                                 <xsl:apply-templates select="prcn:Applicant/cat_ru:RKOrganizationFeatures"/>
                              </xsl:when>
                              <xsl:when test="prcn:Applicant/cat_ru:RBOrganizationFeatures">
                                 <xsl:apply-templates select="prcn:Applicant/cat_ru:RBOrganizationFeatures"/>
                              </xsl:when>
                           </xsl:choose> 
                <xsl:if test="prcn:Applicant/cat_ru:Address">
                              <xsl:apply-templates select="prcn:Applicant/cat_ru:Address"/>
                           </xsl:if>
                           <xsl:if test="prcn:Applicant/cat_ru:IdentityCard"> <xsl:apply-templates select="prcn:Applicant/cat_ru:IdentityCard"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td style="border:solid 0pt"/>
                        <td align="center" class="graph" style="border:solid 0pt">(заявитель)</td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph" colspan="2" style="border:solid 0pt">
                        <font face=" Arial" size="3">
                           <b>
                              <i>
                                 <xsl:choose>
                                    <xsl:when test="prcn:DocSign='2'">Обращение на аннулирование разрешения</xsl:when>
                                    <xsl:when test="prcn:DocSign='1'">Обращение на продление срока</xsl:when>
                                    <xsl:otherwise>Решение о продлении срока проверки</xsl:otherwise>
                                 </xsl:choose>
                              </i>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="prcn:DocSign='1' or prcn:DocSign='2'">
                     <tr>
                        <td class="graph1" colspan="2" style="border:solid 0pt">         
				<xsl:for-each select="prcn:Reasons">
                              <xsl:value-of select="."/>
                              <xsl:if test="position()!=last()"> </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="prcn:DocSign='3'">
                     <tr>
                        <td class="graph1" colspan="2" style="border:solid 0pt">Обоснование: 
				<xsl:for-each select="prcn:Reasons">
                              <xsl:value-of select="."/>
                              <xsl:if test="position()!=last()"> </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph1" colspan="2" style="border:solid 0pt">Регистрационный номер документа:
				<xsl:value-of select="prcn:ApplicationRegNumber/prcn:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                           <xsl:with-param name="dateIn" select="prcn:ApplicationRegNumber/prcn:RegistrationDate"/>
                        </xsl:call-template>/<xsl:value-of select="prcn:ApplicationRegNumber/prcn:SerialNumber"/>
                     </td>
                  </tr>
                  <xsl:if test="prcn:ProlongDate">
                     <tr>
                        <td class="graph1" colspan="2" style="border:solid 0pt">Новый срок:
				<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="prcn:ProlongDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="prcn:CustomsPerson">
                     <tr>
                        <td class="graph1" style="border:solid 0pt; width:70mm;">Должностное лицо таможенного органа:</td>
                        <td class="graph1" style="border:solid 0pt">
                           <xsl:value-of select="prcn:CustomsPerson/cat_ru:PersonName"/> <xsl:if test="prcn:CustomsPerson/cat_ru:LNP">(<xsl:value-of select="prcn:CustomsPerson/cat_ru:LNP"/>)</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph1" style="border:solid 0pt; width:70mm;"> </td>
                        <td class="graph" style="border-top:solid 1pt;border-right:solid 0pt;border-left:solid 0pt;border-bottom:solid 0pt;">ФИО <xsl:if test="prcn:CustomsPerson/cat_ru:LNP">(ЛНП)</xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
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
   <xsl:template match="cat_ru:IdentityCard">
	Документ удостоверяющий личность:
	<xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"/>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber"> 
		<span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName"> 
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
