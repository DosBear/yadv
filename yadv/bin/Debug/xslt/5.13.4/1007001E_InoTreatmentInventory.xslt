<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:iti="urn:customs.ru:Information:TreatmentDocuments:InoTreatmentInventory:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа InoTreatmentInventoryType -->
	<xsl:template match="iti:InoTreatmentInventory">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 190mm;
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
										<b>Опись, прилагаемая к заявлению<br/>на переработку товаров вне таможенной территории.</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td>
								Заявитель:<br/>
								<xsl:apply-templates select="iti:Applicant"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td class="graphMain bordered" width="45%">Документ</td>
								<td class="graphMain bordered">Количество листов</td>
								<td class="graphMain bordered">Количество экземпляров</td>
								<td class="graphMain bordered" width="20%">Примечание</td>
								<td class="graphMain bordered">Дата документа</td>
							</tr>
							<xsl:for-each select="iti:InventDocument">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>,
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<xsl:value-of select="cat_ru:CountryCode"/>,
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>,
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/>,
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/>,
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			Тел.: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
						факс: <xsl:value-of select="cat_ru:Fax"/>
						<xsl:text disable-output-escaping="yes">, </xsl:text>
		</xsl:if>
		<!--xsl:if test="cat_ru:Telex">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телекса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Telex"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:if test="cat_ru:E_mail">
						email: <xsl:for-each select="cat_ru:E_mail">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
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
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный  код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="cat_ru:KATOCode=административно">
							<xsl:text>территориальных объектов</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="cat_ru:KATOCode"/>
						</xsl:otherwise>
					</xsl:choose>
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
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
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
		<!--xsl:if test="cat_ru:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный  номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:if test="cat_ru:INN">
							ИНН	<xsl:value-of select="cat_ru:INN"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
								КПП <xsl:value-of select="cat_ru:KPP"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="cat_ru:BIN=Бизнес">
								<xsl:text>идентификационный номер (БИН)</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_ru:BIN"/>
							</xsl:otherwise>
						</xsl:choose>
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
	<!-- Шаблон для типа cat_ru:OrganizationType -->
	<xsl:template match="iti:Applicant">
		<xsl:if test="cat_ru:OrganizationName">
						<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
						<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<br/>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/><br/>
		<!--xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/-->
		<!--xsl:if test="cat_ru:OKPOID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код организации по ОКПО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OKPOID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКАТО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OKATOCode"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
		<xsl:apply-templates select="cat_ru:Address"/><br/>
		<xsl:apply-templates select="cat_ru:Contact"/><br/>
	</xsl:template>
	<!-- Шаблон для типа iti:InventDocumentType -->
	<xsl:template match="iti:InventDocument">
		<tr>
			<!--td class="graphMain bordered">
				<xsl:value-of select="iti:InvDocCode"/>
			</td-->
			<td class="graphMain bordered">
				<xsl:value-of select="iti:InvDocName"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
				<xsl:value-of select="iti:InvDocNumber"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
				<xsl:if test="iti:InvDocPresentation">
					<xsl:if test="iti:InvDocPresentation='О'">
						<xsl:text>оригинал</xsl:text>
					</xsl:if>
					<xsl:if test="iti:InvDocPresentation='К'">
						<xsl:text>копия</xsl:text>
					</xsl:if>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="iti:InvDocLists"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="iti:InvDocCopies"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="iti:Note"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="iti:DocDate"/>
				</xsl:call-template>
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
