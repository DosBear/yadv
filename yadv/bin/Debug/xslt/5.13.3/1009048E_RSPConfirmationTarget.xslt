<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rspctg="urn:customs.ru:Information:SQDocuments:RSPConfirmationTarget:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3">
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
   <xsl:template match="rspctg:RSPConfirmationTarget">
      <html>
         <head>
            <title>Подтверждение о целевом назначении товаров ввозимых в рамках международного сотрудничества РФ в области исследования и использования космического пространства, в том числе оказания услуг по запуску космических аппаратов</title>
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
					/*padding-left: 20mm;*/
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
					/*padding-left: 20mm;*/
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
					/*margin-top:20px;*/
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
					font: 10;
					font-style: oblique;
					/*font-family: Arial, serif;*/
				}
			</style>
         </head>
         <body>
            <div class="page">
				<h2>Подтверждение о целевом назначении товаров ввозимых в рамках международного сотрудничества РФ в области исследования и использования космического пространства, в том числе оказания услуг по запуску космических аппаратов
					<br/>
					<xsl:apply-templates select="rspctg:Confirmation"/>
				</h2>
				<br/>Дата и время последнего изменения 
				<xsl:call-template name="date_time">
					<xsl:with-param name="dateTimeIn" select="rspctg:Confirmation/rspctg:LastChangeDate"/>
				</xsl:call-template>
               <br/><br/>
               <table>
				   <tr>
						<td>Федеральное космическое агентство подтверждает, что товары:</td>
					</tr>
					<tr>
						<td>
							<xsl:if test="rspctg:GoodsDescription">
								<table>
									<tr class="header" style="vertical-align: middle">
										<td class="bordered">№</td>
										<td class="bordered">Наименование</td>
										<td class="bordered">Стоимость товара</td>
										<td class="bordered">Статистическая стоимость</td>
										<td class="bordered">Марка товара</td>
										<td class="bordered">Количество товара</td>
										<td class="bordered">Количество в ДЕИ</td>
									</tr>
									<xsl:for-each select="rspctg:GoodsDescription">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</table>
							</xsl:if>	
							<br/>
						</td>
					</tr>
					<tr>
						<td>поступающие в адрес получателя:</td>
					</tr>
					<tr>
						<td style="border-bottom: 1px solid gray"><xsl:apply-templates select="rspctg:Recipinet"/></td>
					</tr>
					<tr>
						<td class="low" align="center">Наименование/ФИО, ИНН, адрес получателя (декларанта)</td>
					</tr>
					<tr>
						<td>от отправителя:</td>
					</tr>
					<tr>
						<td style="border-bottom: 1px solid gray"><xsl:apply-templates select="rspctg:Seller"/></td>
					</tr>
					<tr>
						<td class="low" align="center">Наименование/ФИО, ИНН, адрес продавца</td>
					</tr>
					<tr>
						<td><br/>по контракту <u><xsl:apply-templates select="rspctg:Contract"/></u>, ввозятся в Российскую Федерацию в рамках международного сотрудничества в области исследовани и использования космического пространства, в том числе услуг по запуску космических аппаратов, соответствуют Перечню товаров, утвержденному Решением Комиссии Таможенного союза от 22 июня 2011 г. № 727, п. 5 Порядка применения освобождения от уплаты таможенных пошлин при ввозе отдельных категорий товаров на единую таможенную территорию Таможенного союза, утвержденного Решением Комиссии Таможенного союза от 15 июля 2011 г. № 728, и попадают под действие подпункта 7.1.17 пункта 7 Решения Комиссии Таможенного союза от 27 ноября 2009 г. № 130 "О едином таможенно-тарифном регулировании Таможенного союза Республики Беларусь, Республики Казахстан и Российской Федерации" и подпункта 13 статьи 150 Налогового кодекса Российской Федерации.</td>
					</tr>
				</table>
				<br/>
				<table>
					<xsl:if test="rspctg:Agreement">
                        <tr>
                           <td style="width:40%">Международное соглашение (договор), в рамках которого ввозятся товары</td>
                           <td style="border-bottom: 1px solid gray"><xsl:apply-templates select="rspctg:Agreement"/></td>
                        </tr>
					</xsl:if>
					<xsl:if test="rspctg:DepartureCountry">
						<tr>
							<td style="width:40%">Страна отправления</td>
							<td style="border-bottom: 1px solid gray"><xsl:value-of select="rspctg:DepartureCountry"/></td>
                        </tr>
					</xsl:if>
					<xsl:if test="rspctg:OriginCountry">
                        <tr>
                           <td style="width:40%">Страна происхождения</td>
                           <td style="border-bottom: 1px solid gray"><xsl:value-of select="rspctg:OriginCountry"/></td>
                        </tr>
					</xsl:if>
					<xsl:if test="rspctg:GoodsValue">
                        <tr>
							<td style="width:40%">Стоимость товара в валюте контракта</td>
							<td style="border-bottom: 1px solid gray">
								<xsl:value-of select="rspctg:GoodsValue"/>
								<xsl:if test="rspctg:ContractCurrency">  <xsl:value-of select="rspctg:ContractCurrency"/></xsl:if>
                           </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="rspctg:StatisticalGoodsValue">
                        <tr>
							<td style="width:40%">Статистическая стоимость товара (USD)</td>
							<td style="border-bottom: 1px solid gray"><xsl:value-of select="rspctg:StatisticalGoodsValue"/></td>
                        </tr>
                    </xsl:if>
                     <xsl:if test="rspctg:AdditionalInfo">
                        <tr>
							<td style="width:40%">Дополнительная информация</td>
							<td style="border-bottom: 1px solid gray">
								<xsl:for-each select="rspctg:AdditionalInfo"><xsl:value-of select="."/></xsl:for-each>
							</td>
                        </tr>
                    </xsl:if>
					<xsl:if test="rspctg:BDRDID">
                        <tr>
							<td style="width:40%">Идентификатор документа по БД РД</td>
							<td style="border-bottom: 1px solid gray"><xsl:value-of select="rspctg:BDRDID"/></td>
                        </tr>
					</xsl:if>
                </table>
               <xsl:if test="rspctg:AuthorizedPerson">
                  <xsl:apply-templates select="rspctg:AuthorizedPerson"/>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--шаблоны-->
   <xsl:template match="rspctg:Confirmation | rspctg:Agreement | rspctg:Contract">
      <span>
         <xsl:if test="rspctg:PrDocumentName">
            <xsl:value-of select="rspctg:PrDocumentName"/>
         </xsl:if>
         <xsl:if test="rspctg:PrDocumentNumber">
			 № <xsl:value-of select="rspctg:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="rspctg:PrDocumentDate">
			 от 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="rspctg:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <xsl:if test="rspctg:Status">
		<xsl:choose>
            <xsl:when test="rspctg:Status='2'"> (приостановленное)</xsl:when>
            <xsl:when test="rspctg:Status='3'"> (аннулированное</xsl:when>
            <xsl:when test="rspctg:Status='4'"> (находится на оформлении)</xsl:when>
         </xsl:choose>
      </xsl:if>
      <!--xsl:if test="rspctg:LastChangeDate">
		Дата и время последнего изменения 
		<xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="rspctg:LastChangeDate"/>
         </xsl:call-template>
      </xsl:if-->
   </xsl:template>
   <xsl:template match="rspctg:Recipinet | rspctg:Seller">
      <!--xsl:if test="RUScat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="RUScat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if-->
      <xsl:if test="rspctg:Status">
         <xsl:choose>
            <xsl:when test="rspctg:Status = 1">юр.лицо </xsl:when>
            <xsl:when test="rspctg:Status = 2">ИП </xsl:when>
         </xsl:choose>
      </xsl:if>
      <xsl:for-each select="RUScat_ru:OrganizationName">
		  <xsl:value-of select="."/>
      </xsl:for-each>
      <xsl:if test="RUScat_ru:ShortName">
         <xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
         <xsl:value-of select="RUScat_ru:ShortName"/>
         <xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <xsl:text> </xsl:text>
      <xsl:choose>
        <xsl:when test="RUScat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
        </xsl:when>
        <xsl:when test="RUScat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
        </xsl:when>
        <xsl:when test="RUScat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
        </xsl:when>
		<xsl:when test="RUScat_ru:KGOrganizationFeatures">
			<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
		</xsl:when>
		<xsl:when test="RUScat_ru:RAOrganizationFeatures">
			<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
		</xsl:when>
     </xsl:choose>
	<xsl:if test="rspctg:Address"> Адрес: <xsl:value-of select="rspctg:Address"/></xsl:if>
    <xsl:if test="rspctg:IdentityCard"> Документ удостоверяющий личность: <xsl:apply-templates select="rspctg:IdentityCard"/></xsl:if>
   </xsl:template>
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">ОГРН: <xsl:value-of select="cat_ru:OGRN"/> </xsl:if>
		<xsl:if test="cat_ru:INN"> ИНН: <xsl:value-of select="cat_ru:INN"/> </xsl:if>
		<xsl:if test="cat_ru:KPP">	КПП: <xsl:value-of select="cat_ru:KPP"/></xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">УНП: <xsl:value-of select="cat_ru:UNP"/> </xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber"> Идентификационный номер: 
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">УНН: <xsl:value-of select="cat_ru:UNN"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber"> НЗОУ: <xsl:value-of select="cat_ru:SocialServiceNumber"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate"> Номер справки об НЗОУ: 
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
   <!--<xsl:template match="cat_ru:Address">
	<span class="header">Адрес:</span><br/>
	<xsl:if test="cat_ru:CounryName"><xsl:value-of select="cat_ru:CounryName" /></xsl:if>
	<xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
	<xsl:if test="cat_ru:Region">
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
		<xsl:value-of select="cat_ru:Region" />
	</xsl:if>
	<xsl:if test="cat_ru:City">
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
		<xsl:value-of select="cat_ru:City" />
	</xsl:if>
	<xsl:if test="cat_ru:StreetHouse">
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
		<xsl:value-of select="cat_ru:StreetHouse"/>
	</xsl:if>
	<xsl:if test="cat_ru:PostalCode"><br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/></xsl:if>
	<br/>
</xsl:template>-->
   <xsl:template match="rspctg:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardCode"> (код <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries"> серия <xsl:value-of select="cat_ru:IdentityCardSeries"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">, выдан 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			 </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="rspctg:Quantity | rspctg:SupplementaryQuantity">
	<xsl:value-of select="cat_ru:GoodsQuantity"/>
	<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
	<xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
</xsl:template>
	<xsl:template match="rspctg:GoodsDescription">
        <tr>
			<td class="bordered"><xsl:value-of select="rspctg:GoodNumber"/></td>
			<td class="bordered"><xsl:for-each select="rspctg:GoodsDescription"><xsl:value-of select="."/></xsl:for-each></td>
			<td class="bordered">
				<xsl:value-of select="rspctg:ContractCost"/>
				<xsl:if test="rspctg:ContractCurrency"> <xsl:value-of select="rspctg:ContractCurrency"/></xsl:if>
			</td>
			<td class="bordered"><xsl:value-of select="rspctg:StatisticalCost"/></td>
			<td class="bordered"><xsl:for-each select="rspctg:GoodMark"><xsl:value-of select="."/></xsl:for-each></td>
			<td class="bordered"><xsl:apply-templates select="rspctg:Quantity"/></td>
			<td class="bordered"><xsl:apply-templates select="rspctg:SupplementaryQuantity"/></td>
		</tr>	
	</xsl:template>
  <xsl:template match="rspctg:AuthorizedPerson">
    <table border="0" style="margin-top:50px; width:100%">
		<tr>
            <td align="center" style="border-bottom:1px solid gray" width="55%"><xsl:value-of select="rspctg:PersonName"/></td>
            <td/>
            <td align="center" style="border-bottom:1px solid gray" width="35%">
                <xsl:if test="rspctg:PersonPost"><xsl:value-of select="rspctg:PersonPost"/></xsl:if>
            </td>
        </tr>
        <tr>
            <td align="center" class="low">(Ф.И.О.)</td>
            <td/>
            <td align="center" class="low">(Должность)</td>
        </tr>
	</table>
  </xsl:template>
</xsl:stylesheet>
