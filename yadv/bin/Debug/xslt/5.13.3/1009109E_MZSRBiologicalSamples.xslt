<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mzsrbs="urn:customs.ru:Information:SQDocuments:MZSRBiologicalSamples:5.13.3">
	<!-- Шаблон для типа MZSRBiologicalSamplesType -->
	<xsl:template match="mzsrbs:MZSRBiologicalSamples">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Заключение (разрешительный документ) на ввоз и (или) вывоз органов и тканей человека, крови и ее компонентов, образцов биологических материалов человека</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<table class="w190">
						<xsl:if test="mzsrbs:BDRDID">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор документа по БД РД</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="mzsrbs:BDRDID"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:Conclusion">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер и дата заключения (разрешительного документа)</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="mzsrbs:Conclusion"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:ValidUntil">
							<tr>
								<td class="annot graphMain" style="width:50%">Заключение действительно по</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mzsrbs:ValidUntil"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:Status or mzsrbs:CancellationDate">
							<tr>
								<td class="annot graphMain" style="width:50%">Статус</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mzsrbs:Status"/>
									<xsl:if test="mzsrbs:CancellationDate"> аннулирован: </xsl:if>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mzsrbs:CancellationDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:MovementDirection">
							<tr>
								<td class="annot graphMain" style="width:50%">Вид перемещения</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="mzsrbs:MovementDirection"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:ProductName">
							<tr>
								<td class="annot graphMain" style="width:50%">Наименование товара</td>
								<td class="graphMain value" style="width:50%"><xsl:apply-templates select="mzsrbs:ProductName"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:Measure">
							<tr>
								<td class="annot graphMain" style="width:50%">Кол-во товара в основной единице измерения</td>
								<td class="graphMain value" style="width:50%"><xsl:apply-templates select="mzsrbs:Measure"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:Country">
							<tr>
								<td class="annot graphMain" style="width:50%">Страна назначения/отправления</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="mzsrbs:Country"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:Purpose">
							<tr>
								<td class="annot graphMain" style="width:50%">Цель ввоза/вывоза</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="mzsrbs:Purpose"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="mzsrbs:Base">
							<tr>
								<td class="annot graphMain" style="width:50%">Основание</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="mzsrbs:Base"/></td>
							</tr>
						</xsl:if>					
						<xsl:if test="mzsrbs:AdditionalInfo">
							<tr>
								<td class="annot graphMain" style="width:50%">Дополнительная информация</td>
								<td class="graphMain value" style="width:50%"><xsl:apply-templates select="mzsrbs:AdditionalInfo"/></td>
							</tr>
						</xsl:if>
					</table>
					<xsl:if test="mzsrbs:Organization">
						<div class="title marg-top">Сведения об организации</div>
						<xsl:apply-templates select="mzsrbs:Organization"/>
					</xsl:if>
					<xsl:if test="mzsrbs:Sender">
						<div class="title marg-top">Получатель/Отправитель</div>
						<xsl:apply-templates select="mzsrbs:Sender"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="mzsrbs:Conclusion">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="mzsrbs:Measure">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>&#160;
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode"> (код: <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUOrganizationNameType -->
	<xsl:template match="mzsrbs:Organization | mzsrbs:Sender">
		<table class="w190">
			<xsl:if test="RUScat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физ. лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
						<xsl:if test="RUScat_ru:ShortName">
							<xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="RUScat_ru:ShortName"/>
							<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:RFOrganizationFeatures or RUScat_ru:RKOrganizationFeatures or RUScat_ru:RBOrganizationFeatures or RUScat_ru:RAOrganizationFeatures or RUScat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationFullDatas">
				<tr>
					<td class="annot graphMain" style="width:50%">Полные данные по организации одной строкой</td>
					<td class="graphMain value" style="width:50%"><xsl:apply-templates select="RUScat_ru:OrganizationFullDatas"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="name(.)='mzsrbs:Organization'"><xsl:value-of select="RUScat_ru:Address"/></xsl:when>
							<xsl:otherwise><xsl:apply-templates select="RUScat_ru:Address"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<tr>
					<td class="annot graphMain" style="width:50%">Документ, удостоверяющий личность</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:IdentityCard"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:Contact">
				<tr>
					<td class="annot graphMain" style="width:50%">Контактная информация</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:Contact"/></td>
				</tr>
			</xsl:if>
		</table>	
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:Address">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode"><xsl:value-of select="RUScat_ru:PostalCode"/>, </xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
		<xsl:if test="RUScat_ru:CounryName"><xsl:value-of select="RUScat_ru:CounryName"/></xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text>номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text> (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:Contact">
		<xsl:if test="cat_ru:Phone or cat_ru:Telex">
			<span>тел. / телекс: 
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
			<xsl:if test="cat_ru:Telex"> / <xsl:value-of select="cat_ru:Telex"/></xsl:if>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span> факс: <xsl:value-of select="cat_ru:Fax"/></span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span> эл.почта: 
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</span>
		</xsl:if>  
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or RUScat_ru:FullIdentityCardName">
			(<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:if test="RUScat_ru:FullIdentityCardName">&#160;<xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>)
		</xsl:if>		
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:text> </xsl:text>	
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
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
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">&#160;ID органа гос.власти: <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">&#160;код страны: <xsl:value-of select="RUScat_ru:CountryCode"/></xsl:if>
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
