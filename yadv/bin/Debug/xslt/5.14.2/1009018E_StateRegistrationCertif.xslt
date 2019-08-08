<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru srcer" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:srcer="urn:customs.ru:Information:SertifDocuments:StateRegistrationCertif:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="Date">
      <xsl:value-of select="substring (., 9, 2)"/>
      <xsl:value-of select="substring (., 6, 2)"/>
      <xsl:value-of select="substring (., 1, 4)"/>
   </xsl:template>
   <xsl:template name="Address">
	   <xsl:for-each select="*">
		   <xsl:value-of select="."/>
		   <xsl:if test="position()!=last()">, </xsl:if>
	   </xsl:for-each>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="srcer:StateRegistrationCertif">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <head>
			<title>Свидетельство о государственной регистрации</title>
			<style type="text/css">
				body {
				background: #cccccc;
				}
				div.page {
					width: 210mm;
					background: #ffffff;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					border: solid 1pt #000000;
				}

				@media print {
					div.page {
						border: none;
						padding: 0;
					}
				}

				 .head16 {
					font-family: Times New Roman, serif;
					font-weight: bold;
					font-size: 16pt;
					text-shadow: 0.5px 0.5px 3px silver;
					color:gray;}

				 .head13 {
					font-family: Times New Roman, serif;
					font-weight: bold;
					font-size: 13pt;
					color:gray;}

				 .head12 {
					font-family: Times New Roman, serif;
					font-weight: normal;
					font-size: 12pt;
					color:gray;}

				 .blank12 {
					font-family: Times New Roman, serif;
					font-weight: normal;
					font-size: 14pt;
					color:maroon;}
										
				 .graph11 {
					font-family: Arial, serif, bold;
					font-size: 10pt;}
					
				.graph8 {
					ont-family: Times New Roman, serif;
					font-size: 8pt;
					color:gray;}

				   td {border: 0px solid gray;
					font-family: Arial, serif;
				}
				 .underlined {
					border-bottom: solid 1pt #000000;
				}
				graphBold {
						font-family: Arial;
						font-size: 7pt;
						font-weight: bold;
						}
			</style>
		</head>    
        <body>
			<div class="page">
				<table style="width:200mm">
					<tr>
					   <td align="center" class="head13">ТАМОЖЕННЫЙ СОЮЗ</td>
					</tr>
					<tr>
					   <td align="center" class="head13">РЕСПУБЛИКИ БЕЛАРУСЬ, РЕСПУБЛИКИ КАЗАХСТАН</td>
					</tr>
					<tr>
					   <td align="center" class="head13">И РОССИЙСКОЙ ФЕДЕРАЦИИ<br/><br/></td>
					</tr>
					<tr>
					   <td align="center" class="graph11" colspan="2" style="border-bottom:solid 0.8pt #000000;">
						  <xsl:value-of select="srcer:AutorizedAgency"/>
					   </td>
					</tr>
					<tr>
					   <td align="center" class="graph8">(уполномоченный орган Стороны)</td>
					</tr>
					<tr>
					   <td align="center" class="graph11" style="border-bottom:solid 0.8pt #000000;">
						  <xsl:value-of select="srcer:AgencyHead"/>
					   </td>
					</tr>
					<tr>
					   <td align="center" class="graph8">(руководитель уполномоченного органа)</td>
					</tr>
					<tr>
					   <td align="center" class="graph11" style="border-bottom:solid 0.8pt #000000;">
						  <xsl:value-of select="srcer:TerritorialUnit"/>
					   </td>
					</tr>
					<tr>
					   <td align="center" class="graph8">(наименование административно-территориального образования)</td>
					</tr>
					<tr>
					   <td align="center" class="head16"><br/>СВИДЕТЕЛЬСТВО</td>
					</tr>
					<tr>
					   <td align="center" class="head13">о государственной регистрации</td>
					</tr>
				</table>
				<br/>
				<table style="width:200mm">	
					<tr>
					   <td class="head13" style="width:3%">№</td>
					   <td class="graph11" style="width:67%">
						   <xsl:value-of select="srcer:CertificateNumber"/>
						   <span style="color: red">
							   <xsl:choose>
									<xsl:when test="srcer:CertStatus='2'">&#160;(приостановлен)</xsl:when>
									<xsl:when test="srcer:CertStatus='3'">&#160;(аннулирован / отозван)</xsl:when>
									<xsl:when test="srcer:CertStatus='4'">&#160;(удален из-за технической ошибки при оформлении)</xsl:when>
									<xsl:when test="srcer:CertStatus='5'">&#160;(удален в связи с переоформлением)</xsl:when>
								</xsl:choose>
							</span>
					   </td>
					   <td class="head13" style="width:3%">от</td>
					   <td class="graph11" style="width:27%">
						   <xsl:value-of select="substring(srcer:CertDate,9,2)"/>
							 <xsl:choose>
								<xsl:when test="(substring(srcer:CertDate,6,2))='01'"> января </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='02'"> февраля </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='03'"> марта </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='04'"> апреля </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='05'"> мая </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='06'"> июня </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='07'"> июля </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='08'"> августа </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='09'"> сентября </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='10'"> октября </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='11'"> ноября </xsl:when>
								<xsl:when test="(substring(srcer:CertDate,6,2))='12'"> декабря </xsl:when>
							 </xsl:choose>
							<xsl:value-of select="substring(srcer:CertDate,1,4)"/>&#32;г.
					   </td>
					</tr>
				</table>
				<br/>
				<table style="width:200mm">	
					<tr>
					   <td class="head12">Продукция:</td>
					</tr>
					<tr>
					   <td class="graph11" style="border-bottom:solid 0.8pt #000000;">
						   <xsl:for-each select="srcer:Goods">
							   <xsl:apply-templates select="srcer:GoodsDescription"/>
								<xsl:if test="srcer:LabelInf">
									<xsl:text>: </xsl:text>
									<xsl:value-of select="srcer:LabelInf"/>
								</xsl:if>
							   <xsl:text>. </xsl:text>
								<xsl:if test="srcer:NormTechDocs">
									<i>Изготовлена в соответствии с документами: </i>
									<xsl:for-each select="srcer:NormTechDocs">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<xsl:text>. </xsl:text>
								</xsl:if>
								<xsl:if test=" srcer:SanitaryCharachter">
									<i>Гигиеническая характеристика: </i>
									<xsl:for-each select="srcer:SanitaryCharachter">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<xsl:text>. </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="srcer:ManufacturerInf">
								<i>Изготовитель (производитель): </i>
								<xsl:apply-templates select="srcer:ManufacturerInf"><xsl:with-param name="mode" select="0"/></xsl:apply-templates> 
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="srcer:GoodsRecipient">
								<i>Получатель: </i>
								<xsl:apply-templates select="srcer:GoodsRecipient"><xsl:with-param name="mode" select="0"/></xsl:apply-templates> 
								<xsl:text> </xsl:text>
							</xsl:if>
					   </td>
					</tr>
					<tr>
					   <td align="center" class="graph8">
							(наименование продукции, нормативные и (или) технические документы, в соответствии с которыми изготовлена продукция, наименование и место нахождения изготовителя (производителя), получателя)
					   </td>
					</tr>
					<tr>
					   <td class="head12"><br/>соответствует</td>
					</tr>
					<tr>
						<td class="graph11">
							<xsl:for-each select="srcer:Goods/srcer:SanitaryRegulations">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
					   </td>
					</tr>
					<tr>
					   <td class="head12" align="justify">
						   <br/>прошла государственную регистрацию, внесена в Реестр свидетельств о государственной регистрации и разрешена для производства, реализации и использования
					   </td>
					</tr>
					<tr>
					   <td class="graph11"><xsl:value-of select="srcer:Goods/srcer:UsageArea"/></td>
					</tr>
					<tr>
					   <td  class="head12" align="justify">
						   <br/>Настоящее свидетельство выдано на основании (перечислить рассмотренные протоколы исследований, наименование организации (испытательной лаборатории, центра), проводившей исследования, другие рассмотренные документы):
					   </td>
					</tr>
					<tr>
						<td class="graph11">
							<xsl:for-each select="srcer:Goods/srcer:InvestigProtocols">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
							<xsl:if test="srcer:TestingOrg">
								<i> Организация(ии) проводившая(ие) исследования: </i>
								<xsl:for-each select="srcer:TestingOrg">
									<xsl:apply-templates select="."><xsl:with-param name="mode" select="0"/></xsl:apply-templates> 
								</xsl:for-each>
							</xsl:if>
					   </td>
					</tr>
					<tr>
					   <td  class="head12" align="justify">
							<br/>Срок действия свидетельства о государственной регистрации устанавливается на весь период изготовления продукции или поставок подконтрольных товаров на территорию таможенного союза</td>
					</tr>
				</table>
				<br/><br/>
				<table style="width:200mm">		
					<tr>
						<td  class="head12" style="width:50%">Подпись, ФИО, должность уполномоченного лица, выдавшего документ и печать органа (учреждения), выдавшего документ</td>
						<td style="width:25%; border-bottom:solid 0.8pt #000000;"><br/></td>
						<td align="center" class="graph11" style="width:25%; border-bottom:solid 0.8pt #000000; valign: bottom">
							<xsl:value-of select="srcer:AutorizedPerson/cat_ru:PersonSurname"/> 
							<xsl:value-of select="srcer:AutorizedPerson/cat_ru:PersonName"/> 
							<xsl:value-of select="srcer:AutorizedPerson/cat_ru:PersonMiddleName"/> 
							<xsl:value-of select="srcer:AutorizedPerson/cat_ru:PersonPost"/> 
						</td>
					</tr>
					<tr>
						<td/>
						<td align="center" class="graph8" colspan="2">(Ф.И.О./подпись)</td>
					</tr>
					<tr>
						<td colspan="2"/>
						<td align="center" class="head13">М. П.</td>
					</tr>
					<tr>
						<td align="right" class="blank12">
							<xsl:if test="srcer:BlankSeries">серия <xsl:value-of select="srcer:BlankSeries"/>&#160;</xsl:if>
							<xsl:if test="srcer:BlankTypographNum"> № <xsl:value-of select="srcer:BlankTypographNum"/></xsl:if>
						</td>
						<td colspan="2"/>
					</tr>
				 </table>
			</div>
			<xsl:if test="srcer:BDRDID or srcer:BlankTypeID or srcer:CertStatus or //RUScat_ru:IdentityCard or //RUScat_ru:Contact">
				<div class="page">
					<h3 align="center">ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</h3>
					<table style="width:200mm; border-collapse: collapse;">		
						<xsl:if test="srcer:BDRDID">
							<tr>
								<td  class="head12" style="width:50%; border:solid 1pt silver;">Идентификатор документа по БД РД</td>
								<td  class="graph11" style="width:50%; border:solid 1pt silver;"><xsl:value-of select="srcer:BDRDID"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="srcer:BlankTypeID">
							<tr>
								<td  class="head12" style="width:50%; border:solid 1pt silver;">Идентификатор типа бланка</td>
								<td  class="graph11" style="width:50%; border:solid 1pt silver;"><xsl:value-of select="srcer:BlankTypeID"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="srcer:CertStatus">
							<tr>
								<td  class="head12" style="width:50%; border:solid 1pt silver;">Статус документа</td>
								<td  class="graph11" style="width:50%; border:solid 1pt silver;">
								   <xsl:choose>
										<xsl:when test="srcer:CertStatus='1'">подписан и действует</xsl:when>
										<xsl:when test="srcer:CertStatus='2'">приостановлен</xsl:when>
										<xsl:when test="srcer:CertStatus='3'">аннулирован / отозван</xsl:when>
										<xsl:when test="srcer:CertStatus='4'">удален из-за технической ошибки при оформлении</xsl:when>
										<xsl:when test="srcer:CertStatus='5'">удален в связи с переоформлением</xsl:when>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="srcer:ManufacturerInf/RUScat_ru:IdentityCard or srcer:ManufacturerInf/RUScat_ru:Contact">
							<tr>
								<td  class="head12" style="width:50%; border:solid 1pt silver;">Информация об изготовителе (производителе)</td>
								<td  class="graph11" style="width:50%; border:solid 1pt silver;">
									<xsl:apply-templates select="srcer:ManufacturerInf"><xsl:with-param name="mode" select="1"/></xsl:apply-templates> 
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="srcer:GoodsRecipient/RUScat_ru:IdentityCard or srcer:GoodsRecipient/RUScat_ru:Contact">
							<tr>
								<td  class="head12" style="width:50%; border:solid 1pt silver;">Информация о получателе товаров</td>
								<td  class="graph11" style="width:50%; border:solid 1pt silver;">
									<xsl:apply-templates select="srcer:GoodsRecipient"><xsl:with-param name="mode" select="1"/></xsl:apply-templates> 
								</td>
							</tr>
						</xsl:if>
					</table>		
				</div>
			</xsl:if>
        </body>
      </html>
   </xsl:template>
   <!-- Шаблон для организации -->
   <xsl:template match="srcer:GoodsRecipient | srcer:ManufacturerInf | srcer:SubdivisionInfo | srcer:TestingOrg">
	   <xsl:param name="mode"/>
	   <xsl:if test="$mode='1' and RUScat_ru:OrganizationLanguage">
		   Код языка: <xsl:value-of select="RUScat_ru:OrganizationLanguage"/>,&#160;
	   </xsl:if>
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:choose>
			<xsl:when test="$mode='1' and RUScat_ru:ShortName">
				<xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
				<xsl:value-of select="RUScat_ru:ShortName"/>
				<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
			</xsl:when>
			<xsl:when test="$mode='0' and not(RUScat_ru:OrganizationName)"><xsl:value-of select="RUScat_ru:ShortName"/></xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:OrganizationFullDatas">
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:OrganizationFullDatas"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="RUScat_ru:RFOrganizationFeatures"><xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/></xsl:when>
			<xsl:when test="RUScat_ru:RKOrganizationFeatures"><xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/></xsl:when>
			<xsl:when test="RUScat_ru:RBOrganizationFeatures"><xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/></xsl:when>
			<xsl:when test="RUScat_ru:RAOrganizationFeatures"><xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/></xsl:when>
			<xsl:when test="RUScat_ru:KGOrganizationFeatures"><xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/></xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:Address">
			<xsl:choose>
				<xsl:when test="$mode='1'"><br/></xsl:when>
				<xsl:when test="$mode='0'">, </xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="RUScat_ru:Address"/>
		</xsl:if>
		<xsl:if test="srcer:Address">, адрес: <xsl:for-each select="srcer:Address"><xsl:call-template name="Address"/></xsl:for-each></xsl:if>
		<xsl:text>. </xsl:text>
		<xsl:if test="$mode='1' and RUScat_ru:IdentityCard">
			<br/>Документ, удостоверяющий личность: <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
			<xsl:text>. </xsl:text>
		</xsl:if>
		<xsl:if test="$mode='1' and RUScat_ru:Contact">
			<br/>Контактная информация: <xsl:apply-templates select="RUScat_ru:Contact"/>
			<xsl:text>. </xsl:text>
		</xsl:if>
		<xsl:if test="srcer:SubdivisionInfo">
			<xsl:if test="$mode='1'"><br/></xsl:if>
			&#160;<i>Филиал(ы): </i>
			<xsl:for-each select="srcer:SubdivisionInfo">
				<xsl:apply-templates select="."><xsl:with-param name="mode" select="0"/></xsl:apply-templates>&#160;
			</xsl:for-each>
		</xsl:if>
   </xsl:template>
   <!-- Шаблон для типа RUScat_ru:AddressType -->
   <xsl:template match="RUScat_ru:Address">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
   </xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>				
		<xsl:if test="cat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName or RUScat_ru:IssuerCode">выдан </xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName"><xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
   <xsl:template match="RUScat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>, ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>, ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>, КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="RUScat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>, УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>, Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="RUScat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>, БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>, ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>, ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
      </xsl:for-each>
   </xsl:template>
   	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span>, ИНН/ПИН: <xsl:value-of select="cat_ru:KGINN"/></span>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span>, ОКПО: <xsl:value-of select="cat_ru:KGOKPO"/></span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span>, УНН: <xsl:value-of select="cat_ru:UNN"/></span>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span>, НЗОУ: <xsl:value-of select="cat_ru:SocialServiceNumber"/></span>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span>, НCОУ: <xsl:value-of select="cat_ru:SocialServiceCertificate"/></span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
