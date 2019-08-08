<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:rrmsp="urn:customs.ru:Information:SQDocuments:FnsRRMSPResponse:5.13.3">
	<!-- Шаблон для типа FnsRRMSPResponseType -->
	<xsl:template match="rrmsp:FnsRRMSPResponse">
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
									width: 270mm;
									max-width: 270mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
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
									max-width: 100%;
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
										<b>Предоставление сведений из реестра малого и среднего предпринимательства (Ответ)</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">По состоянию реестра на дату</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rrmsp:ReestrDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата включения ЮЛ/ИП в реестр МСП</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rrmsp:ReestrInclusionDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Вид субъекта МСП</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="translate(rrmsp:MSPSubjectType, '.', ',')"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Категория субъекта МСП</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="translate(rrmsp:MSPSubjectCategory, '.', ',')"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Признак сведений о вновь созданном ЮЛ/вновь зарегистрированном ИП</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="translate(rrmsp:NewCreated, '.', ',')"/>
							</td>
						</tr>
					</table>
					<xsl:if test="rrmsp:Organization">
						<div class="title marg-top">Сведения о юридическом лице/индивидуальном предпринимателе, включенном в реестр МСП</div>
					</xsl:if>
					<xsl:apply-templates select="rrmsp:Organization"/>
					<xsl:if test="rrmsp:PlaceInfo">
						<div class="title marg-top">Сведения о месте нахождения ЮЛ/месте жительства ИП</div>
					</xsl:if>
					<xsl:apply-templates select="rrmsp:PlaceInfo"/>
					<xsl:if test="rrmsp:OKVEDMain"/>
					<xsl:if test="rrmsp:OKVEDMain">
						<div class="title marg-top">Сведения об основном виде деятельности</div>
					</xsl:if>
					<xsl:apply-templates select="rrmsp:OKVEDMain"/>
					<xsl:if test="rrmsp:OKVEDAdditional">
						<div class="title marg-top">Сведения о дополнительных видах деятельности</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Код вида деятельности по ОКВЭД</td>
									<td class="graphMain bordered">Наименование вида деятельности по ОКВЭД</td>
									<td class="graphMain bordered">Признак версии ОКВЭД</td>
								</tr>
								<xsl:for-each select="rrmsp:OKVEDAdditional">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rrmsp:License">
						<div class="title marg-top" style="word-break: break-all;">Сведения о лицензиях, выданных субъекту МСП</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Серия<br/>лицен-<br/>зии</td>
									<td class="graphMain bordered">Номер<br/>лицен-<br/>зии</td>
									<td class="graphMain bordered">Вид<br/>лицен-<br/>зии</td>
									<td class="graphMain bordered">Дата<br/>лицен-<br/>зии</td>
									<td class="graphMain bordered">Дата<br/>начала<br/>действия<br/>лицензии</td>
									<td class="graphMain bordered">Дата<br/>окончания<br/>действия<br/>лицензии</td>
									<td class="graphMain bordered">Наименование<br/>лицензирующего<br/>органа,<br/>выдавшего или переоформившего лицензию</td>
									<td class="graphMain bordered">Дата приостанов-<br/>ления действия<br/>лицензии</td>
									<td class="graphMain bordered">Наименование<br/>лицензи-<br/>рующего<br/>органа,<br/>приостано-<br/>вившего<br/>действие<br/>лицензии</td>
									<td class="graphMain bordered">Наименование<br/>лицензи-<br/>руемого вида<br/>деятельности,<br/>на который<br/>выдана<br/>лицензия</td>
									<td class="graphMain bordered">Сведения<br/>об адресе<br/>места<br/>осуществления<br/>лицензи-<br/>руемого вида<br/>деятельности</td>
								</tr>
								<xsl:for-each select="rrmsp:License">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rrmsp:ProductionInfo">
						<div class="title marg-top">Сведения о производимой субъектом МСП продукции</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Код вида продукции</td>
									<td class="graphMain bordered">Наименование вида продукции</td>
									<td class="graphMain bordered">Признак отнесения продукции к инновационной, высокотехнологичной</td>
								</tr>
								<xsl:for-each select="rrmsp:ProductionInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rrmsp:PartnershipProgram">
						<div class="title marg-top">Сведения о включении субъекта МСП в реестры программ партнерства</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование заказчика, реализующего программу партнерства</td>
									<td class="graphMain bordered">ИНН заказчика, реализующего программу партнерства</td>
									<td class="graphMain bordered">Номер договора о присоединении к выбранной программе партнерства</td>
									<td class="graphMain bordered">Дата договора о присоединении к выбранной программе партнерства</td>
								</tr>
								<xsl:for-each select="rrmsp:PartnershipProgram">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rrmsp:ContractInfo">
						<div class="title marg-top">Сведения о наличии у субъекта МСП в предшествующем календарном году контрактов, </div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование заказчика по контракту</td>
									<td class="graphMain bordered">ИНН заказчика по контракту</td>
									<td class="graphMain bordered">Предмет договора</td>
									<td class="graphMain bordered">Реестровый номер контракта</td>
									<td class="graphMain bordered">Дата заключения контракта</td>
								</tr>
								<xsl:for-each select="rrmsp:ContractInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rrmsp:AgreementInfo">
						<div class="title marg-top">Сведения о наличии у субъекта МСП в предшествующем календарном году договоров, </div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование заказчика по договору</td>
									<td class="graphMain bordered">ИНН заказчика по договору</td>
									<td class="graphMain bordered">Предмет договора</td>
									<td class="graphMain bordered">Реестровый номер договора</td>
									<td class="graphMain bordered">Дата заключения договора</td>
								</tr>
								<xsl:for-each select="rrmsp:AgreementInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код объекта в соответсвии со справочником (классификатором) </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="RUScat_ru:UnifiedCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:CodeListId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение справочника (классификатора), в соответствии с которым указан код</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CodeListId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код. Универсальный идентификационный таможенный номер. Строка не более 40 символов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="RUScat_ru:UITNCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны, по правилам которой сформирован указанный идентификатор</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ITNReserv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="cat_ru:KGINN=ИНН">
								<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
							</xsl:when>
							<xsl:when test="cat_ru:KGINN=ПИН">
								<xsl:text>персональный идентификационный номер</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_ru:KGINN"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGOKPO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN"/>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
	</xsl:template>
	<!-- Шаблон для типа rrmsp:AgreementInfoType -->
	<xsl:template match="rrmsp:AgreementInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:CustomerName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:CustomerINN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:AgreementSubject"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:ReestrNum"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rrmsp:AgreementDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rrmsp:ContractInfoType -->
	<xsl:template match="rrmsp:ContractInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:CustomerName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:CustomerINN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:ContractSubject"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:ReestrNum"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rrmsp:ContractDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rrmsp:LicenseType -->
	<xsl:template match="rrmsp:License">
		<tr style="word-break: break-all;">
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:Series"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:Number"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:Type"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rrmsp:LicenseDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rrmsp:LicenseBeginDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rrmsp:LicenseEndDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:IssueOrg"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rrmsp:LicenseSuspension"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:SuspensionOrg"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:LicenseName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:LicenseAddress"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rrmsp:OKVEDType -->
	<xsl:template match="rrmsp:OKVEDAdditional">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:Code"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:Name"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:Version"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rrmsp:OKVEDType -->
	<xsl:template match="rrmsp:OKVEDMain">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код вида деятельности по ОКВЭД</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rrmsp:Code"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование вида деятельности по ОКВЭД</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="rrmsp:Name">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак версии ОКВЭД</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rrmsp:Version"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа rrmsp:OrganizationType -->
	<xsl:template match="rrmsp:Organization">
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryA2Code"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode"/>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN"/>
		<xsl:if test="RUScat_ru:UITN">
			<div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:UITN"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип данных организации: 1 юридическое лицо, 2 - ИП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="rrmsp:OrgKind='true'">
							<xsl:text>есть</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>нет</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа rrmsp:PartnershipProgramType -->
	<xsl:template match="rrmsp:PartnershipProgram">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:PartnerName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:PartnerINN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:AgreementNum"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rrmsp:AgreementDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="rrmsp:PlaceInfo">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение вида адреса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AddressKindCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:District"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Город</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Town"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:House"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Room"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AddressText"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OKTMO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OKATO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:KLADR"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AOGUID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AOID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rrmsp:ProductionInfoType -->
	<xsl:template match="rrmsp:ProductionInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:Code"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rrmsp:Name"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rrmsp:Innovative, '.', ',')"/>
			</td>
		</tr>
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
