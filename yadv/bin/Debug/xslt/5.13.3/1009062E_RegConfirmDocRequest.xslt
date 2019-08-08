<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rcdr="urn:customs.ru:Information:SQDocuments:RegConfirmDocRequest:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="rcdr:RegConfirmDocRequest">
      <html>
         <head>
            <title>Запрос сведений из лицензии на осуществление перевозок воздушным транспортом грузов и пассажиров для юр. лица/о регистрационных удостоверениях на изделия медицинского назначения, выданных Росздравнадзором/о наличии лицензии на право осуществления страховой деятельности/из Государственного реестра наименований мест происхождений товаров РФ/о регистрации лекарственных средств/о целевом назначении для медицины/из Перечня общеизвестных в Российской Федерации товарных знаков</title>
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
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Запрос сведений
					<xsl:choose>
                                 <xsl:when test="rcdr:DocSign=1">  из лицензии на осуществление перевозок воздушным транспортом грузов и пассажиров для юр. лица</xsl:when>
                                 <xsl:when test="rcdr:DocSign=2">   о регистрационных удостоверениях на изделия медицинского назначения, выданных Росздравнадзором</xsl:when>
                                 <xsl:when test="rcdr:DocSign=3">  о наличии лицензии на право осуществления страховой деятельности</xsl:when>
                                 <xsl:when test="rcdr:DocSign=4">  из Государственного реестра наименований мест происхождений товаров РФ</xsl:when>
                                 <xsl:when test="rcdr:DocSign=5">  о регистрации лекарственных средств</xsl:when>
                                 <xsl:when test="rcdr:DocSign=6">  о целевом назначении для медицины</xsl:when>
                                 <xsl:when test="rcdr:DocSign=7">  из Перечня общеизвестных в РФ товарных знаков</xsl:when>
                              </xsl:choose>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="rcdr:Organization">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Сведения об организации 
					<xsl:if test="rcdr:Organization/rcdr:OrgSign='1'">(юридическое лицо):</xsl:if>
                              <xsl:if test="rcdr:Organization/rcdr:OrgSign='0'">(физическое лицо):</xsl:if>
                           </u>
                           <br/>
                           <xsl:apply-templates select="rcdr:Organization"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="rcdr:ObjectDescription">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Описание деятельности/товара/объекта:</u>
                           <br/>
                           <table>
                              <tr>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:KindCode">
                                    <td align="center" class="graph" style="border:solid 1pt">Код вида деятельности/Тип объекта</td>
                                 </xsl:if>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:ObjectName">
                                    <td align="center" class="graph" style="border:solid 1pt">Описание вида деятельности/объекта/изделия и т.п.</td>
                                 </xsl:if>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:MovementType">
                                    <td align="center" class="graph" style="border:solid 1pt">Тип перевозок (ПП/ПГ)</td>
                                 </xsl:if>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:ObjectNumber">
                                    <td align="center" class="graph" style="border:solid 1pt">Номер объекта</td>
                                 </xsl:if>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:Manufacturer">
                                    <td align="center" class="graph" style="border:solid 1pt">Производитель</td>
                                 </xsl:if>
                              </tr>
                              <tr>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:KindCode">
                                    <td align="center" class="graph" style="border:solid 1pt">
                                       <xsl:value-of select="rcdr:ObjectDescription/rcdr:KindCode"/>
                                    </td>
                                 </xsl:if>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:ObjectName">
                                    <td align="center" class="graph" style="border:solid 1pt">
                                       <xsl:value-of select="rcdr:ObjectDescription/rcdr:ObjectName"/>
                                    </td>
                                 </xsl:if>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:MovementType">
                                    <td align="center" class="graph" style="border:solid 1pt">
                                       <xsl:value-of select="rcdr:ObjectDescription/rcdr:MovementType"/>
                                    </td>
                                 </xsl:if>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:ObjectNumber">
                                    <td align="center" class="graph" style="border:solid 1pt">
                                       <xsl:value-of select="rcdr:ObjectDescription/rcdr:ObjectNumber"/>
                                    </td>
                                 </xsl:if>
                                 <xsl:if test="rcdr:ObjectDescription/rcdr:Manufacturer">
                                    <td align="center" class="graph" style="border:solid 1pt">
                                       <xsl:value-of select="rcdr:ObjectDescription/rcdr:Manufacturer"/>
                                    </td>
                                 </xsl:if>
                              </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="rcdr:DocumentDetails">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Сведения о документе</u>: <xsl:apply-templates select="rcdr:DocumentDetails"/>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="rcdr:Organization">
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
      <xsl:if test="cat_ru:Contact/cat_ru:Phone">Номер телефона:<xsl:value-of select="cat_ru:Contact/cat_ru:Phone"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact/cat_ru:Fax">Номер факса:<xsl:value-of select="cat_ru:Contact/cat_ru:Fax"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact/cat_ru:Telex">Номер телекса:<xsl:value-of select="cat_ru:Contact/cat_ru:Telex"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:OKPOID">Код организации по ОКПО:<xsl:value-of select="cat_ru:OKPOID"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:OKATOCode">Код ОКАТО:<xsl:value-of select="cat_ru:OKATOCode"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <!--xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if-->
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
         <br/>
      </xsl:if>
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
   <xsl:template match="rcdr:DocumentDetails">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if> 
		<xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
   </xsl:template>
</xsl:stylesheet>
