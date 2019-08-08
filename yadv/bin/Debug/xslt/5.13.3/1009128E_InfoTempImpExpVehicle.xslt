<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:tv="urn:customs.ru:Information:SQDocuments:InfoTempImpExpVehicle:5.13.3">
	<!-- Шаблон для типа InfoTempImpExpVehicleType -->
	<xsl:template match="tv:InfoTempImpExpVehicle">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
									}

									div.page {
									width: 287mm;
									max-width: 287mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:3mm;
									}

									.marg-t1
									{
									margin-top:8mm;
									margin-bottom:3mm;
									font-size: 12pt;
									font-family: Arial;
									font-variant: small-caps;
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
										<b>Сведения о временном ввозе транспортного средства</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
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
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код страны, представившей сведения</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="tv:CountryA2Code"/></td>
						</tr>
					</table>
					<xsl:if test="tv:EECEDocHeaderAddInfo">
						<div class="title marg-t1">Дополнительные технологические реквизиты электронного документа (сведений)</div>
						<xsl:apply-templates select="tv:EECEDocHeaderAddInfo"/>
					</xsl:if>
					<div class="title marg-t1">Детальная информация об оформлении временного ввоза (вывоза) транспортного средства</div>
					<table class="bordered w190">
						<xsl:for-each select="tv:TIEProcedureDetails">
							<tr class="title">
								<td class="graphMain bordered" colspan="2" bgcolor="silver"> # <xsl:value-of select="position()"/></td>
							</tr>
							<xsl:apply-templates select="."/>
							<tr>
								<td class="annot graphMain" colspan="2" style="border-bottom: 1px solid black"><br/></td>
							</tr>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
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
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Документ, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Серия и номер документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
						<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата выдачи документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Организация, выдавшая документ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование вида документа</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:FullIdentityCardName"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:AuthorityId"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:CountryCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails| tv:CASubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<b><xsl:text> Вид адреса: </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/></b>
			<xsl:text>  </xsl:text>
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
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode">
			<br/>
			<xsl:text>(</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
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
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
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
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
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
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
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
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
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
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:CustomsPersonDetails -->
	<xsl:template match="tv:ClOpCustomsPersonDetails| tv:CustomsPersonDetails| tv:ExtOpCustomsPersonDetails| tv:RemCustomsPersonDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonMiddleName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:LNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:LNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CustomsCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа номеров ДТ -->
	<xsl:template match="tv:ClOpDTMDocDetails| tv:ClOpPassengerDeclarationDetails| tv:CloseOperationDetails| tv:CustomsOperationDetails| tv:ExtensionOperationDetails| tv:DTMDocDetails| tv:PassengerDeclarationDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер декларации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="gtd_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="tv:TransportModeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="tv:TransportModeCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:CountryA2Code">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код государства-члена, зарегистрировавшего пассажирскую декларацию</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="tv:CountryA2Code"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:RBSignCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак журнала регистрации для Республики Беларусь</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="tv:RBSignCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:OperationCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение таможенной операции временного ввоза</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="tv:OperationCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECCustomsType -->
	<xsl:template match="tv:ClOpUnifiedCustomsOfficeDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код страны</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="RUScat_ru:CountryCode"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа tv:TransportMeansIdDetailsType -->
	<xsl:template match="tv:DependTransportMeansIdDetails">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:VIN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportKindCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportMarkCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransportRegNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="tv:ChassisID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="tv:BodyID"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа tv:DriverDetailsType -->
	<xsl:template match="tv:DriverDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonMiddleName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:UnifiedIdentityDocDetails">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
			<xsl:apply-templates select="tv:UnifiedIdentityDocDetails"/>
		</xsl:if>
		<xsl:if test="tv:CASubjectAddressDetails">
			<div class="title marg-top">Сведения об адресе</div>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:10%"/>
					<td class="value graphMain" style="width:90%"><xsl:apply-templates select="tv:CASubjectAddressDetails"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:UnifiedCountryCode">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Гражданство</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="tv:UnifiedCountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECEDocHeaderAddInfoType -->
	<xsl:template match="tv:EECEDocHeaderAddInfo">
		<xsl:if test="RUScat_ru:InfEnvelopeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение сообщения общего процесса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:InfEnvelopeCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Кодовое обозначение электронного документа (сведений) в соответствии с реестром структур электронных документов и сведений</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="RUScat_ru:EDocCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время создания электронного документа (сведений)</td>
				<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUScat_ru:EDocDateTime"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
					<xsl:value-of select="substring(RUScat_ru:EDocDateTime,12,8)"/>
				</td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:LanguageCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение языка</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:LanguageCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECCustomsType -->
	<xsl:template match="tv:ExtOpUnifiedCustomsOfficeDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код страны</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="RUScat_ru:CountryCode"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECCustomsType -->
	<xsl:template match="tv:RemUnifiedCustomsOfficeDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код страны</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="RUScat_ru:CountryCode"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="tv:TIECarrierDetails">
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения об организации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:CountryA2Code"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
						<xsl:if test="RUScat_ru:BusinessEntityTypeName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:UITN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<div class="title marg-top">Адрес</div>
			<table class="w190">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<tr>
						<td class="annot graphMain" style="width:10%"/>
						<td class="value graphMain" style="width:90%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Контактный реквизит субъекта</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:CommunicationDetails"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tv:TIECloseDetailsType -->
	<xsl:template match="tv:TIECloseDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время совершения таможенной операции по завершению временного ввоза (вывоза) транспортного средства</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="tv:ClOpEventDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="tv:ClOpDTMDocDetails">
			<div class="title marg-top">Сведения о регистрационном номере таможенной декларации на транспортное средство при завершении<br/> временного ввоза (вывоза) транспортного средства</div>
		</xsl:if>
		<xsl:apply-templates select="tv:ClOpDTMDocDetails"/>
		<xsl:if test="tv:ClOpPassengerDeclarationDetails">
			<div class="title marg-top">Сведения о регистрационном номере пассажирской декларации (для Республики Казахстан), номере разрешения на убытие<br/>(для Республики Беларусь) при завершении временного ввоза (вывоза) транспорного средства</div>
		</xsl:if>
		<xsl:apply-templates select="tv:ClOpPassengerDeclarationDetails"/>
		<xsl:if test="tv:CloseOperationDetails">
			<div class="title marg-top">Сведения о таможенной операции завершения временного ввоза</div>
		</xsl:if>
		<xsl:apply-templates select="tv:CloseOperationDetails"/>
		<xsl:if test="tv:ClOpUnifiedCustomsOfficeDetails">
			<div class="title marg-top">Сведения о таможенном органе завершения временного ввоза (вывоза) транспортного средства</div>
		</xsl:if>
		<xsl:apply-templates select="tv:ClOpUnifiedCustomsOfficeDetails"/>
		<xsl:if test="tv:ClOpCustomsPersonDetails">
			<div class="title marg-top">Сведения о должностном лице, оформившем завершение временного ввоза (вывоза) транспортного средства</div>
		</xsl:if>
		<xsl:apply-templates select="tv:ClOpCustomsPersonDetails"/>
	</xsl:template>
	<!-- Шаблон для типа tv:TIEExtensionDetailsType -->
	<xsl:template match="tv:TIEExtensionDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время совершения операции по продлению срока временного ввоза транспортного средства</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="tv:ExtOpEventDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="tv:ExtensionOperationDetails">
			<div class="title marg-top">Регистрационный (учетный) номер таможенной операции продления временного ввоза</div>
		</xsl:if>
		<xsl:apply-templates select="tv:ExtensionOperationDetails"/>
		<xsl:if test="tv:ExtOpUnifiedCustomsOfficeDetails">
			<div class="title marg-top">Сведения о таможенном органе, продлившем срок временного ввоза транспортного средства</div>
		</xsl:if>
		<xsl:apply-templates select="tv:ExtOpUnifiedCustomsOfficeDetails"/>
		<xsl:if test="tv:ExtOpCustomsPersonDetails">
			<div class="title marg-top">Сведения о должностном лице таможенного органа, продлившем срок временного ввоза транспортного средства</div>
		</xsl:if>
		<xsl:apply-templates select="tv:ExtOpCustomsPersonDetails"/>
		<xsl:if test="tv:TempImportLimitDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата окончания срока временного ввоза транспортного средства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="tv:TempImportLimitDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tv:TIEOperationsDetailsType -->
	<xsl:template match="tv:TIEOperationsDetails">
		<xsl:if test="tv:TIEExtensionDetails">
			<u><div class="title marg-top">Сведения об операции продления срока временного ввоза ТСЛП (ТСМП)</div></u>
			<xsl:apply-templates select="tv:TIEExtensionDetails"/>
		</xsl:if>
		<xsl:if test="tv:TIECloseDetails">
			<u><div class="title marg-top">Сведения о завершении временного ввоза (вывоза) ТСЛП (ТСМП)</div></u>
			<xsl:apply-templates select="tv:TIECloseDetails"/>
		</xsl:if>
		<xsl:if test="tv:TIERemovalInfoDetails">
			<u><div class="title marg-top">Сведения о наступлении обстоятельств, допускающих признание ТСЛП (ТСМП)<br/>не находящимися под таможенным контролем</div></u>
			<xsl:apply-templates select="tv:TIERemovalInfoDetails"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tv:TIEProcedureDetailsType -->
	<xsl:template match="tv:TIEProcedureDetails">
		<xsl:if test="tv:TIEStatusCode or tv:TempImportLimitDate">
			<tr>
				<td class="annot graphMain" colspan="2">
					<table class="w190">
						<xsl:if test="tv:TIEStatusCode">
							<tr>
								<td class="annot graphMain" style="width:50%">Статус</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="tv:TIEStatusCode='IM_OPEN'">оформление временного  ввоза</xsl:when>
										<xsl:when test="tv:TIEStatusCode='IM_CLOSE'">завершение   временного  ввоза</xsl:when>
										<xsl:when test="tv:TIEStatusCode='IN_EXTENTION'">продление  временного  ввоза</xsl:when>
										<xsl:when test="tv:TIEStatusCode='IM_REMOVAL'">сведения о наступлении обстоятельств, допускающих признание ТСЛП (ТСМП) не находящимися под таможенным контролем</xsl:when>
										<xsl:otherwise>кодовое обозначение: <xsl:value-of select="tv:TIEStatusCode"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="tv:TempImportLimitDate">
							<tr>
								<td class="annot graphMain" style="width:50%">Срок временного ввоза транспортного средства</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="tv:TempImportLimitDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>
					<br/>
				</td>
			</tr>	
		</xsl:if>
		<tr class="title">
			<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
			<td class="annot graphMain" bgcolor="#e3e3e3">Сведения о временно ввозимых (вывозимых) транспортных средствах</td>
		</tr>
		<tr>	
			<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
			<td class="annot graphMain"><xsl:apply-templates select="tv:TITransportDetails"/><br/></td>
		</tr>
		<tr class="title">
			<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
			<td class="annot graphMain" bgcolor="#e3e3e3">Детальная информация о регистрации временного ввоза (вывоза) транспортного средства</td>
		</tr>
		<tr>	
			<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
			<td class="annot graphMain"><xsl:apply-templates select="tv:TIERegistrationDetals"/><br/></td>
		</tr>
		<xsl:if test="tv:TIECarrierDetails">
			<tr class="title">
				<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
				<td class="annot graphMain" bgcolor="#e3e3e3">Сведения о перевозчике, осуществляющем временный ввоз (вывоз) транспорного средства</td>
			</tr>
			<tr>	
				<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
				<td class="annot graphMain"><xsl:apply-templates select="tv:TIECarrierDetails"/><br/></td>
			</tr>
		</xsl:if>
		<xsl:if test="tv:DriverDetails">
			<tr class="title">
				<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
				<td class="annot graphMain" bgcolor="#e3e3e3">Детализированная информация о водителе транспортного средства</td>
			</tr>
			<tr>	
				<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
				<td class="annot graphMain"><xsl:apply-templates select="tv:DriverDetails"/><br/></td>
			</tr>
		</xsl:if>
		<xsl:if test="tv:TIEOperationsDetails">
			<tr class="title">
				<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
				<td class="annot graphMain" bgcolor="#e3e3e3">Сведения о таможенных операциях при временном ввозе (вывозе) транспортного средства</td>
			</tr>
			<xsl:for-each select="tv:TIEOperationsDetails">
				<tr>	
					<td class="annot graphMain" style="width:2%; border-right: 3px solid #e3e3e3"/>
					<td class="annot graphMain" style="border-bottom: 3px solid #e3e3e3"><xsl:apply-templates select="."/><br/></td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tv:TIERegistrationDetalsType -->
	<xsl:template match="tv:TIERegistrationDetals">
		<xsl:if test="tv:DTMDocDetails">
			<div class="title marg-top">Сведения о регистрационном номере таможенной декларации на транспортное средство</div>
		</xsl:if>
		<xsl:apply-templates select="tv:DTMDocDetails"/>
		<xsl:if test="tv:PassengerDeclarationDetails">
			<div class="title marg-top">Сведения о регистрационном номере пассажирской декларации</div>
		</xsl:if>
		<xsl:apply-templates select="tv:PassengerDeclarationDetails"/>
		<xsl:if test="tv:CustomsOperationDetails">
			<div class="title marg-top">Сведения о регистрационном номере заявления о временном ввозе ТС</div>
		</xsl:if>
		<xsl:apply-templates select="tv:CustomsOperationDetails"/>
		<xsl:if test="tv:UnifiedCustomsOfficeDetails">
			<div class="title marg-top">Сведения о таможенном органе регистрации (оформления) временного ввоза (вывоза) ТСЛП (ТСМП)</div>
		</xsl:if>
		<xsl:apply-templates select="tv:UnifiedCustomsOfficeDetails"/>
		<xsl:if test="tv:CustomsPersonDetails">
			<div class="title marg-top">Сведения о должностном лице таможенного органа, оформившем временный ввоз (вывоз) транспортного средства</div>
		</xsl:if>
		<xsl:apply-templates select="tv:CustomsPersonDetails"/>
	</xsl:template>
	<!-- Шаблон для типа tv:TIERemovalDocDetailsType -->
	<xsl:template match="tv:TIERemovalDocDetails">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:DocKindCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение вида документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="tv:DocKindCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="tv:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Строка символов, идентифицирующая государственный или межгосударственный орган (организацию), выдавший или утвердивший документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="tv:AuthorityId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tv:TIERemovalInfoDetailsType -->
	<xsl:template match="tv:TIERemovalInfoDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время совершения операции по признанию транспортного средства не находящимся под таможенным контролем</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="tv:RemEventDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="tv:RemUnifiedCustomsOfficeDetails">
			<div class="title marg-top">Сведения о таможенном органе, совершившем операцию</div>
		</xsl:if>
		<xsl:apply-templates select="tv:RemUnifiedCustomsOfficeDetails"/>
		<xsl:if test="tv:RemCustomsPersonDetails">
			<div class="title marg-top">Сведения о должностном лице таможенного органа, совершившего операцию</div>
		</xsl:if>
		<xsl:apply-templates select="tv:RemCustomsPersonDetails"/>
		<xsl:if test="tv:TIERemovalDocDetails">
			<div class="title marg-top">Сведения о документе, подтверждающем наступление обстоятельств, допускающих признание транспортного средства<br/>не находящимся под таможенным контролем</div>
		</xsl:if>
		<xsl:apply-templates select="tv:TIERemovalDocDetails"/>
	</xsl:template>
	<!-- Шаблон для типа tv:TITransportDetailsType -->
	<xsl:template match="tv:TITransportDetails">
		<xsl:if test="tv:TransportMeansIdDetails">
			<div class="title marg-top">Сведения об идентификационных номерах транспортного средства</div>
		</xsl:if>
		<xsl:apply-templates select="tv:TransportMeansIdDetails"/>
		<xsl:if test="tv:DependTransportMeansIdDetails">
			<div class="title marg-top">Сведения об идентификационных и регистрационных номерах прицепного транспортного средства</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Номер шасси (VIN)</td>
						<td class="graphMain bordered">Код типа ТС</td>
						<td class="graphMain bordered">Код марки ТС</td>
						<td class="graphMain bordered">Идентификатор</td>
						<td class="graphMain bordered">Буквенный код страны принадлежности ТС</td>
						<td class="graphMain bordered">Идентификатор активного ТС для прицепов, полуприцепов и др.</td>
						<td class="graphMain bordered">Номер свидетельства о регистрации ТС для РБ</td>
						<td class="graphMain bordered">Идентификационный номер шасси (рамы) ТС, присвоенный изготовителем</td>
						<td class="graphMain bordered">Идентификационный номер кузова (кабины) ТС, присвоенный изготовителем</td>
					</tr>
					<xsl:for-each select="tv:DependTransportMeansIdDetails">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tv:TransportMeansIdDetailsType -->
	<xsl:template match="tv:TransportMeansIdDetails">
		<xsl:if test="cat_ru:VIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер шасси (VIN)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:VIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportKindCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код типа транспортного средства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TransportKindCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMarkCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код марки транспортного средства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TransportMarkCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportIdentifier">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TransportIdentifier"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMeansNationalityCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны принадлежности транспортного средства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ActiveTransportIdentifier">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор активного транспортного средства для прицепов, полуприцепов и др.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportRegNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер свидетельства о регистрации транспортного средства для РБ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TransportRegNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:ChassisID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер шасси (рамы) транспортного средства, присвоенный изготовителем</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="tv:ChassisID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tv:BodyID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер кузова (кабины) транспортного средства (шасси транспортного средства, самоходной машины), присвоенный изготовителем</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="tv:BodyID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECCustomsType -->
	<xsl:template match="tv:UnifiedCustomsOfficeDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код страны</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="RUScat_ru:CountryCode"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="tv:UnifiedIdentityDocDetails">
		<xsl:if test="cat_ru:IdentityCardCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:IssuerCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование вида документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AuthorityId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
