<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:desprs="urn:customs.ru:Information:SQDocuments:RZNDesignatedPurpose:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="desprs:RZNDesignatedPurpose">
      <html>
         <head>
            <title>Подтверждение целевого назначения материалов, ввозимых в рамках Соглашения о ввозе материалов образовательного, научного и культурного характера от 22 ноября 1950 г.</title>
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
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-family: Arial, serif;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <xsl:if test="desprs:DocSign=1">
                  <h2>Подтверждение целевого назначения материалов, ввозимых в рамках Соглашения о ввозе материалов образовательного, научного и культурного характера от 22 ноября 1950 г.</h2>
               </xsl:if>
               <xsl:if test="desprs:DocSign=2">
                  <h2>Cведения о целевом назначении для медицины</h2>
               </xsl:if>
               <xsl:if test="desprs:DocSign=3">
                  <h2> Cведения о подтверждении целевого назначения ввозимого товара (Минтранс)</h2>
               </xsl:if>
               <xsl:if test="desprs:DocSign=4">
                  <h2> Cведения о подтверждении целевого назначения ввозимого товара (Минпромторг)</h2>
               </xsl:if>
               <table>
                  <tbody>
                     <xsl:if test="desprs:BDRDID">
                        <tr>
                           <td class="graph" colspan="2" style="border:solid 0pt">Идентификатор документа по БД РД: <xsl:value-of select="desprs:BDRDID"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="desprs:Confirmation">
                        <tr>
                           <td>Подтверждение</td>
                           <td>
                              <xsl:apply-templates select="desprs:Confirmation"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="desprs:Holder">
                        <tr>
                           <td>Держатель подтверждения</td>
                           <td>
                              <xsl:apply-templates select="desprs:Holder"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="desprs:Consignee">
                        <tr>
                           <td>Грузополучатель</td>
                           <td>
                              <xsl:apply-templates select="desprs:Consignee"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td>Контракт</td>
                        <td>
                           <xsl:apply-templates select="desprs:Contract"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Описание товара</td>
                        <td>
                           <xsl:apply-templates select="desprs:GoodsDescription"/>
                        </td>
                     </tr>
                     <xsl:if test="desprs:TargetMedOrg">
                        <tr>
                           <td>Медицинская организация (объект), для которой предназначен ввозимый товар</td>
                           <td>
                              <xsl:for-each select="desprs:TargetMedOrg">
                                 <xsl:apply-templates select="."/>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="desprs:ConfirmationLetter">
                        <td>Письмо о подтверждении целевого назначения товара для медицинских целей</td>
                        <td>
                           <xsl:apply-templates select="desprs:ConfirmationLetter"/>
                        </td>
                     </xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="desprs:Confirmation | desprs:Contract | desprs:ConfirmationLetter">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:if test="desprs:Duration"> Срок действия:
		<xsl:value-of select="desprs:Duration"/>
         </xsl:if>
      </span>
      <br/>
   </xsl:template>
   <xsl:template match="desprs:Holder | desprs:Consignee | desprs:TargetMedOrg">
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if>
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
      <xsl:if test="desprs:OrgSign='0'">Физическое лицо<br/>
      </xsl:if>
      <xsl:if test="desprs:OrgSign='1'">Юридическое лицо<br/>
      </xsl:if>
      <xsl:if test="desprs:AuthorizedPerson">
         <xsl:value-of select="desprs:AuthorizedPerson/cat_ru:PersonSurname"/> 
	<xsl:value-of select="desprs:AuthorizedPerson/cat_ru:PersonName"/>
         <xsl:if test="desprs:AuthorizedPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="desprs:AuthorizedPerson/cat_ru:PersonMiddleName"/>
         </xsl:if>
         <xsl:if test="desprs:AuthorizedPerson/cat_ru:PersonPost"> (<xsl:value-of select="desprs:AuthorizedPerson/cat_ru:PersonPost"/>)</xsl:if>
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
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
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
   <xsl:template match="desprs:GoodsDescription">
      <xsl:for-each select="desprs:GoodsName">
         <xsl:value-of select="."/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:for-each>
      <br/>
      <xsl:if test="desprs:OriginCountry">
         <span>
		Страна происхождения 
		<xsl:value-of select="desprs:OriginCountry"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="desprs:Manufacturer">
         <span>
		Производитель 
		<xsl:value-of select="desprs:Manufacturer"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="desprs:GoodsPurpose">
         <span>
		Целевое назначение товара 
		<xsl:value-of select="desprs:GoodsPurpose"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="desprs:ModelMark">
         <span>
		Модель (марка) товара 
		<xsl:value-of select="desprs:ModelMark"/>
         </span>
         <br/>
      </xsl:if>
      <span>
		Количество 
		<xsl:apply-templates select="desprs:Quantity"/>
      </span>
   </xsl:template>
   <xsl:template match="desprs:Quantity">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
</xsl:stylesheet>
