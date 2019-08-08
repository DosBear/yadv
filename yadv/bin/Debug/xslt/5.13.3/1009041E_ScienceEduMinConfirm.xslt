<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:scdfmc="urn:customs.ru:Information:SQDocuments:ScienceEduMinConfirm:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="scdfmc:ScienceEduMinConfirm">
      <html>
         <head>
            <title>Подтверждение Минобрнауки России</title>
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
					/*border: 1px solid gray;
					font-family: Courier, serif;*/
					vertical-align:top;
				}

				td.bordered {
					border: 1px solid gray;
				}
				.low {
				font: 10pt sanf-serif;
				font-style: oblique;
			}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Подтверждение характера товара<br/><xsl:apply-templates select="scdfmc:ConfirmationInfo"/></h2>
               <br/>
               <xsl:for-each select="scdfmc:ConfirmationInfo">
					<xsl:if test="scdfmc:ModificationDateTime">
						<br/>Дата и время последнего изменения: 
						<xsl:call-template name="date_time">
							<xsl:with-param name="dateTimeIn" select="scdfmc:ModificationDateTime"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="scdfmc:Status or scdfmc:StatusInfo">
						<br/>Статус: 
						<xsl:if test="scdfmc:Status">
							<xsl:choose>
							   <xsl:when test="scdfmc:Status=1 or scdfmc:Status='true'">Не подтверждено</xsl:when>
							   <xsl:otherwise>Подтверждено</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="scdfmc:StatusInfo"> (<xsl:value-of select="scdfmc:StatusInfo"/>)</xsl:if>
					</xsl:if> 
					<xsl:if test="scdfmc:ExpirationDate">
						<br/>Срок действия:
						<xsl:call-template name="date_time">
						   <xsl:with-param name="dateTimeIn" select="scdfmc:ExpirationDate"/>
						</xsl:call-template>
					 </xsl:if>
               </xsl:for-each>
               <br/><br/>
               <table>
					<tr>
						<td>Настоящим письмом подтверждается, что ввозимые в Российскую Федерацию импортером:</td>
					</tr>
					<tr>
						<td style="border-bottom: 1px solid gray"><xsl:apply-templates select="scdfmc:ConfirmationPerson"/></td>
					</tr>
					<tr>
						<td class="low" align="center">(Наименование/ФИО импортера, адрес, документ, удостоверяющий личность)</td>
					</tr>
					<tr>
						<td><br/>следующие товары:</td>
					</tr>
					<tr>
						<td>
							<table>
								<tr valign="top">
									<td class="bordered">Описание</td>
									<xsl:if test="//scdfmc:OriginCountry">
										<td class="bordered">Страна<br/>происхождения</td>
									</xsl:if>
									<xsl:if test="//scdfmc:Manufacturer">
										<td class="bordered">Производитель</td>
									</xsl:if>
									<xsl:if test="//scdfmc:ManufacturerCountry">
										<td class="bordered">Код страны<br/>производителя</td>
									</xsl:if>
									<td class="bordered">Количество<br/>товара</td>
									<xsl:if test="//scdfmc:SupplementaryGoodsQuantity">
										<td class="bordered">Количество<br/>товара в ДЕИ</td>
									</xsl:if>
								</tr>
								<xsl:apply-templates select="scdfmc:Goods"/>
							</table>
						</td>
					</tr>
					<tr>
						<td><br/>относятся к материалам образовательного (или научного) характера и попадают под действие Соглашения о ввозе материалов образовательного, научного и культурного характера от 22 ноября 1950 г. и Протокола к нему от 26 ноября 1976 г., 
						<xsl:if test="scdfmc:DocumentAttachment">пункт (подпункт) приложения к Соглашению и (или) Протоколу 
							<u><xsl:value-of select="scdfmc:DocumentAttachment"/></u>
						</xsl:if>
						, Постановления Правительства Российской Федерации от 6 июля 1994 г. №795 "О присоединении Российской Федерации к Соглашению о ввозе материалов образовательного, научного и культурного характера и Протокола к нему", а также статьи 164 части 2 Налогового кодекса Российской Федерации. 
						</td>
					</tr>
				</table>
				<br/>
				<xsl:if test="scdfmc:Contract">
					<table>
						<tr>
							<td style="width: 40%">Реквизиты контракта:</td>
							<td style="border-bottom: 1px solid gray"><xsl:apply-templates select="scdfmc:Contract"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="scdfmc:Consignee">
					<table>
						<tr>
							<td style="width: 40%">Получатель товара:</td>
							<td style="border-bottom: 1px solid gray"><xsl:apply-templates select="scdfmc:Consignee"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="scdfmc:AdditionalInfo">
					<table>
						<tr>
							<td style="width: 40%">Дополнительная информация:</td>
							<td style="border-bottom: 1px solid gray">
								<xsl:for-each select="scdfmc:AdditionalInfo"><xsl:value-of select="."/></xsl:for-each>
							</td>
						</tr>
					</table>
				</xsl:if>
               <xsl:if test="scdfmc:AuthorizedPerson">
                  <xsl:apply-templates select="scdfmc:AuthorizedPerson"/>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="scdfmc:ConfirmationInfo | scdfmc:Contract">
      <span>
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate"> от 
				<xsl:call-template name="russian_date">
				   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</xsl:if>
		</span>
      <br/>
   </xsl:template>
   <xsl:template match="scdfmc:AuthorizedPerson">
      <!--ФИО - отдельные поля-->
      <table border="0" style="margin-top:50px; width:100%">
         <tbody>
            <tr>
               <td align="center" style="border-bottom: 1px solid gray" width="55%">
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
               </td>
               <td/>
               <td align="center" style="border-bottom: 1px solid gray" width="35%">
                  <xsl:value-of select="cat_ru:PersonPost"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="low">(Ф.И.О. лица, подписавшего заключение/разрешение)</td>
               <td style="border:0;"/>
               <td align="center" class="low">(Должность)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="scdfmc:ConfirmationPerson | scdfmc:Consignee">
      <xsl:if test="scdfmc:ParticipantSign">
         <xsl:choose>
            <xsl:when test="scdfmc:ParticipantSign = '1'">юр. лицо </xsl:when>
            <xsl:otherwise>физ. лицо </xsl:otherwise>
         </xsl:choose>
      </xsl:if>  
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <xsl:text>, </xsl:text>
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
         <xsl:when test="cat_ru:KGOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RAOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
     <!--xsl:if test="scdfmc:Address"><br/><xsl:value-of select="scdfmc:Address"/></xsl:if>
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if-->
		<xsl:choose>
			<xsl:when test="cat_ru:Address"><xsl:apply-templates select="cat_ru:Address"/></xsl:when>
			<xsl:when test="scdfmc:Address"><xsl:text>  Адрес: </xsl:text><xsl:value-of select="scdfmc:Address"/></xsl:when>
		</xsl:choose>
      <xsl:if test="cat_ru:IdentityCard"><xsl:apply-templates select="cat_ru:IdentityCard"/></xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">ОГРН: <xsl:value-of select="cat_ru:OGRN"/> </xsl:if>
		<xsl:if test="cat_ru:INN"> ИНН: <xsl:value-of select="cat_ru:INN"/> </xsl:if>
		<xsl:if test="cat_ru:KPP"> КПП: <xsl:value-of select="cat_ru:KPP"/></xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">УНП: <xsl:value-of select="cat_ru:UNP"/> </xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber"> Идентификационный номер: 
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
  </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">БИН: <xsl:value-of select="cat_ru:BIN"/> </xsl:if>
		<xsl:if test="cat_ru:IIN"> ИИН: <xsl:value-of select="cat_ru:IIN"/> </xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			 ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/
			<xsl:value-of select="cat_ru:KATOCode"/>/
			<xsl:value-of select="cat_ru:RNN"/>
			<xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/></xsl:if>
		</xsl:for-each>
   </xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">ИНН/ПИН: <xsl:value-of select="cat_ru:KGINN"/> </xsl:if>
		<xsl:if test="cat_ru:KGOKPO"> ОКПО: <xsl:value-of select="cat_ru:KGOKPO"/></xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">УНН: <xsl:value-of select="cat_ru:UNN"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber"> НЗОУ: <xsl:value-of select="cat_ru:SocialServiceNumber"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate"> Номер справки об НЗОУ: 
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:text>  Адрес: </xsl:text>
      <xsl:if test="cat_ru:PostalCode"><xsl:value-of select="cat_ru:PostalCode"/>, </xsl:if>
      <xsl:if test="cat_ru:CounryName"><xsl:value-of select="cat_ru:CounryName"/></xsl:if>
      <xsl:if test="cat_ru:CountryCode"> (<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
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
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <xsl:text>  Документ удостоверяющий личность: </xsl:text>
      <xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
		 серия номер:
		<xsl:value-of select="cat_ru:IdentityCardSeries"/>
        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
        <xsl:value-of select="cat_ru:IdentityCardNumber"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		 выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="scdfmc:Goods">
      <tr>
        <td class="bordered"><xsl:value-of select="scdfmc:GoodsDescription"/></td>
        <xsl:if test="//scdfmc:OriginCountry">
			<td class="bordered" align="center"><xsl:value-of select="scdfmc:OriginCountry"/></td>
        </xsl:if>
        <xsl:if test="//scdfmc:Manufacturer">
			<td class="bordered"><xsl:value-of select="scdfmc:Manufacturer"/></td>
        </xsl:if>
        <xsl:if test="//scdfmc:ManufacturerCountry">
			<td class="bordered" align="center"><xsl:value-of select="scdfmc:ManufacturerCountry"/></td>
		</xsl:if>
        <td class="bordered"><xsl:apply-templates select="scdfmc:GoodsQuantity"/></td>
        <xsl:if test="//scdfmc:SupplementaryGoodsQuantity">
			<td class="bordered"><xsl:apply-templates select="scdfmc:SupplementaryGoodsQuantity"/></td>
        </xsl:if>
      </tr>
   </xsl:template>
   <xsl:template match="scdfmc:GoodsQuantity | scdfmc:SupplementaryGoodsQuantity">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
</xsl:stylesheet>
