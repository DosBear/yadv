<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:crc="urn:customs.ru:Information:CustomsDocuments:CustomsRepresContract:5.13.2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="crc:CustomsRepresContract">
      <html>
         <head>
            <title>Договор таможенного представителя с декларантом</title>
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
							font-size: 6pt;
							}
				.g{
							font-family: Times new roman;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Договор таможенного представителя с декларантом</b>
                        </font>
                     </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td align="center" class="g" colspan="2" style="border:solid 0pt">
                        <!--	Реквизиты договора: 
						<xsl:if test="crc:ContractDetails/cat_ru:PrDocumentName"><xsl:value-of select="crc:ContractDetails/cat_ru:PrDocumentName"/></xsl:if>-->
                        <xsl:if test="crc:ContractDetails/cat_ru:PrDocumentNumber"> №<xsl:value-of select="crc:ContractDetails/cat_ru:PrDocumentNumber"/>
                        </xsl:if>
                        <xsl:if test="crc:ContractDetails/cat_ru:PrDocumentDate"> от
						<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="crc:ContractDetails/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
                  </tr>
                  <tr>
						<td class="g" colspan="2" style="border:solid 0pt">
						Дата начала срока действия контракта:
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="crc:ContractDetails/crc:StartDate"/>
						</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td class="g" colspan="2" style="border:solid 0pt">
						Дата окончания срока действия контракта:
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="crc:ContractDetails/crc:ExpiryDate"/>
						</xsl:call-template>
						</td>
					</tr>
                  <tr>
                     <td class="g" colspan="2" style="border:solid 0pt">
						Признак факта уплаты таможенных платежей таможенным представителем за декларанта:
						<xsl:if test="crc:PaymentFactSign='1' or crc:PaymentFactSign='t' or crc:PaymentFactSign='true'">да</xsl:if>
                        <xsl:if test="crc:PaymentFactSign='0' or crc:PaymentFactSign='f' or crc:PaymentFactSign='false'">нет</xsl:if>
                     </td>
                  </tr>
					<tr>
						<td class="g" colspan="2" style="border:solid 0pt">Полномочия таможенного представителя:
							<xsl:if test="crc:RepresentativeDetails/crc:RepresentativeIndicator='1'">все товары</xsl:if>
							<xsl:if test="crc:RepresentativeDetails/crc:RepresentativeIndicator='0'">
								в отношении товаров, поступающих по документам 
								<xsl:for-each select="crc:RepresentativeDetails/crc:PresentedDocuments">
									<xsl:value-of select="cat_ru:PrDocumentName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="cat_ru:PrDocumentNumber"/>
									<xsl:text disable-output-escaping="yes"> &amp;nbsp;</xsl:text>
									<xsl:if test="cat_ru:PrDocumentDate">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="crc:PresentedDocumentModeCode"/>
									<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
								</xsl:for-each>
							</xsl:if>
							
						</td>
					</tr>						
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="g" style="border:solid 0pt" width="50%">Таможенный представитель:<br/>
                        <xsl:apply-templates select="crc:CustomsRepresentative"/>
                        <span class="header">Свидетельство о включении в реестр таможенных представителей:</span>
                        <br/>
                        <xsl:if test="crc:CustomsRepresentative/crc:CustomsRepresCertificate/cat_ru:PrDocumentName">
                           <xsl:value-of select="crc:CustomsRepresentative/crc:CustomsRepresCertificate/cat_ru:PrDocumentName"/>
                        </xsl:if>
                        <xsl:if test="crc:CustomsRepresentative/crc:CustomsRepresCertificate/cat_ru:PrDocumentNumber"> №<xsl:value-of select="crc:CustomsRepresentative/crc:CustomsRepresCertificate/cat_ru:PrDocumentNumber"/>
                        </xsl:if>
                        <xsl:if test="crc:CustomsRepresentative/crc:CustomsRepresCertificate/cat_ru:PrDocumentDate"> Дата:
						<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="crc:CustomsRepresentative/crc:CustomsRepresCertificate/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                     <td class="g" style="border:solid 0pt" width="50%">Декларант:<br/>
                        <xsl:apply-templates select="crc:Declarant"/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="crc:AdditionalInformation">
                     <tr>
                        <td class="g" colspan="2" style="border:solid 0pt">Дополнительная информация: 
						<xsl:value-of select="crc:AdditionalInformation"/>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
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
   <xsl:template match="crc:CustomsRepresentative | crc:Declarant">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
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
      <span class="header">Адрес:</span>
      <br/>
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
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
      <br/>
   </xsl:template>
</xsl:stylesheet>
