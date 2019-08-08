<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ir="urn:customs.ru:Information:SQDocuments:InfoRequest:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="ir:InfoRequest">
      <html>
         <head>
            <title>Запрос сведений из удостоверения допуска к осуществлению международных автомобильных перевозок/из реестра лицензий на деятельность по перевозкам внутренним водным транспортом, морским транспортом опасных грузов/о юр. лице/о наличии судимости у сотрудников юр. лица/об учете организации в налоговом органе по месту нахождения ее обособленного подразделения/из реестра свидетельств на право вывоза культурных ценностей с территории РФ/из лицензии на обслуживание и ремонт авиационной техники</title>
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
                     <td align="center" class="graph" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Запрос сведений
						<xsl:if test="ir:DocSign=1"> из удостоверения допуска к осуществлению международных автомобильных перевозок</xsl:if>
                              <xsl:if test="ir:DocSign=2"> из реестра лицензий на деятельность по перевозкам внутренним водным транспортом, морским транспортом опасных грузов</xsl:if>
                              <xsl:if test="ir:DocSign=3">  о юр. лице</xsl:if>
                              <xsl:if test="ir:DocSign=4"> о наличии судимости у сотрудников юр. лица</xsl:if>
                              <xsl:if test="ir:DocSign=5"> об учете организации в налоговом органе по месту нахождения ее обособленного подразделения</xsl:if>
                              <xsl:if test="ir:DocSign=6"> из реестра свидетельств на право вывоза культурных ценностей с территории РФ</xsl:if>
                              <xsl:if test="ir:DocSign=7"> из лицензии на обслуживание и ремонт авиационной техники</xsl:if>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="ir:DocumentDetails">
                     <tr>
                        <td align="center" class="graph" style="border:solid 0pt">
                           <xsl:apply-templates select="ir:DocumentDetails"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Сведения об организации, выдавшей документ</u>:
						<xsl:apply-templates select="ir:DocumentDetails/ir:IssueOrg"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ir:Organization">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Сведения об организации
						<xsl:if test="ir:Organization/ir:OrgSign='1'"> (юридическое лицо):</xsl:if>
                              <xsl:if test="ir:Organization/ir:OrgSign='0'"> (физическое лицо):</xsl:if>
                           </u>
                           <xsl:apply-templates select="ir:Organization"/>
                           <xsl:if test="ir:Organization/ir:InsuranceNumber">Страховой номер индивидуального лицевого счёта (СНИЛС)<xsl:value-of select="ir:Organization/ir:InsuranceNumber"/>
                              <br/>
                           </xsl:if>
                           <xsl:if test="ir:Organization/ir:BirthDate">Дата рождения <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ir:Organization/ir:BirthDate"/>
                              </xsl:call-template>
                              <br/>
                           </xsl:if>
                           <xsl:if test="ir:Organization/ir:AddressSign">Тип регистрации:
						<xsl:if test="ir:Organization/ir:AddressSign='1'"> МЖ (место проживания)<br/>
                              </xsl:if>
                              <xsl:if test="ir:Organization/ir:AddressSign='0'"> МП (место пребывания)<br/>
                              </xsl:if>
                              <xsl:if test="ir:Organization/ir:BirthPlace">Место рождения: <xsl:apply-templates select="ir:Organization/ir:BirthPlace"/>
                              </xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ir:RequestOrg">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Сведения об организации, осуществляющей запрос</u>:<br/>
                           <xsl:apply-templates select="ir:RequestOrg"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ir:RequestPerson">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>ФИО лица, заполнившего запрос</u>:
						<xsl:apply-templates select="ir:RequestPerson"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ir:AdditionalInfo">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Дополнительная информация</u>:
						<xsl:value-of select="ir:AdditionalInfo"/>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ir:DocumentDetails">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if> 
		<xsl:if test="cat_ru:PrDocumentDate">
			от 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
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
   <xsl:template match="ir:IssueOrg | ir:Organization | ir:RequestOrg">
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
   <xsl:template match="cat_ru:Address | ir:BirthPlace">
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
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="ir:BirthPlace">
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
   <xsl:template match="ir:RequestPerson">
      <xsl:value-of select="cat_ru:PersonSurname"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonMiddleName"/>
      <xsl:if test="cat_ru:PersonPost">, должность - <xsl:value-of select="cat_ru:PersonPost"/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
