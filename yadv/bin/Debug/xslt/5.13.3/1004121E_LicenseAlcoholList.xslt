<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:lst_alclic="urn:customs.ru:Information:CustomsDocuments:LicenseAlcoholList:5.10.0">
	<!-- Шаблон для типа LicenseAlcoholListType -->
	<xsl:template match="lst_alclic:LicenseAlcoholList">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
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
				<xsl:for-each select="lst_alclic:Licence">
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td>Серия <xsl:value-of select="lst_alclic:FormNumber/lst_alclic:Series"/> № <xsl:value-of select="lst_alclic:FormNumber/lst_alclic:Number"/><br/><br/></td>
								</tr>								
								<tr>
									<td style="border-bottom:1px solid" align="center"><xsl:value-of select="lst_alclic:OrganizationName"/></td>
								</tr>
								<tr>
									<td align="center" style="font-size:8">(наименование лицензирующего органа)</td>
								</tr>
								<tr>
									<td style="font-size:40" align="center"><br/>ЛИЦЕНЗИЯ</td>
								</tr>
								<tr>
									<td align="center">№ <u><i><xsl:value-of select="lst_alclic:RegNumber/lst_alclic:DocumentNumber"/></i></u> от <u><i><xsl:call-template name="date_month"><xsl:with-param name="dateIn" select="lst_alclic:RegNumber/lst_alclic:DocumentDate"/></xsl:call-template></i></u> г.</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid"><br/>На осуществление <i><xsl:value-of select="lst_alclic:Permissions"/></i></td>
								</tr>
								<tr>
									<td align="center" style="font-size:8">(лицензируемый вид деятельности, вид продукции в соответствии с пунктами 3 и 4 статьи 18<br/>Федерального закона от 22 ноября 1995 г.№ 171-ФЗ)</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid">Настоящая лицензия выдана <i>
										<xsl:choose>
											<xsl:when test="lst_alclic:Organization/cat_ru:OrganizationName">
												<xsl:value-of select="lst_alclic:Organization/cat_ru:OrganizationName"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="lst_alclic:Organization/cat_ru:ShortName"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="lst_alclic:Organization/cat_ru:ShortName"><xsl:value-of select="lst_alclic:Organization/cat_ru:ShortName"/></xsl:if>
											</xsl:otherwise>
										</xsl:choose>
										</i>
									</td>
								</tr>
								<tr>
									<td align="center" style="font-size:8">(указывается полное и (или) сокращенное наименование, организационно-правовая форма организации)</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid"><br/><xsl:apply-templates select="lst_alclic:Organization/cat_ru:Address"/></td>
								</tr>
								<tr>
									<td align="center" style="font-size:8">(место нахождения организации)</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid" align="center"><br/>
										<xsl:for-each select="lst_alclic:Organization/cat_ru:Contact/cat_ru:E_mail">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>									
									</td>
								</tr>
								<tr>
									<td align="center" style="font-size:8">(адрес электронной почты)</td>
								</tr>
								<tr>
									<td>
										<br/><br/>
										<xsl:text>Срок действия лицензии с </xsl:text><u><i>
										<xsl:call-template name="date_month">
											<xsl:with-param name="dateIn" select="lst_alclic:BeginDate"/>
										</xsl:call-template></i></u>
										<xsl:text>г. по </xsl:text><u><i>
										<xsl:call-template name="date_month">
											<xsl:with-param name="dateIn" select="lst_alclic:EndDate"/>
										</xsl:call-template></i></u>
										<xsl:text>г.</xsl:text>
									</td>
								</tr>
								<xsl:if test="lst_alclic:ChangesDate">
									<tr>
										<td align="right">
											<br/>
											<br/>
											<br/>
											<u><i>
											<xsl:call-template name="date_month">
												<xsl:with-param name="dateIn" select="lst_alclic:ChangesDate"/>
											</xsl:call-template>
											</i></u>г.*
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<br/><br/><br/><br/>
										<table>
											<tbody>
												<tr>
													<td width="20%">Место для печати</td>
													<td width="10%"></td>
													<td width="25%">Подпись ____________</td>
													<td width="5%"></td>
													<td style="border-bottom:1px solid" align="center">
														<xsl:value-of select="concat(substring(lst_alclic:Signer/cat_ru:PersonName,1,1),'.',substring(lst_alclic:Signer/cat_ru:PersonMiddleName,1,1),'. ',lst_alclic:Signer/cat_ru:PersonSurname)"/>
													</td>
												</tr>
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td style="font-size:8" align="center">(ф.и.о.)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<xsl:if test="lst_alclic:ChangesDate">
									<tr>
										<td style="font-size:10"><br/><br/>* Отметка о продлении срока действия лицензии</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:if test="cat_ru:CounryName">
						<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>	
		<xsl:if test="cat_ru:PostalCode">
						, <xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
						, <xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
						, <xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
						, <xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телефона</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:Phone">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер факса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Fax"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телекса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Telex"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:E_mail">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
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
		<xsl:if test="cat_ru:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный  номер</td>
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
						<xsl:choose>
							<xsl:when test="cat_ru:INN=ИНН">
								<xsl:text>Индивидуальный номер налогоплательщика</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_ru:INN"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="cat_ru:KPP=КПП">
								<xsl:text>Код причины постановки на учет</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_ru:KPP"/>
							</xsl:otherwise>
						</xsl:choose>
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
	<!-- Шаблон для типа cat_ru:CUBranchDescriptionType -->
	<xsl:template match="lst_alclic:BranchDescription">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:OrganizationName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cat_ru:Address">
					<xsl:apply-templates select="cat_ru:Address"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа lst_alclic:FormNumberType -->
	<xsl:template match="lst_alclic:FormNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Серия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="lst_alclic:Series"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="lst_alclic:Number"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа lst_alclic:LicenceAlcoholType -->
	<xsl:template match="lst_alclic:Licence">
		<xsl:if test="lst_alclic:FormNumber">
			<div class="title marg-top">Номер бланка</div>
		</xsl:if>
		<xsl:apply-templates select="lst_alclic:FormNumber"/>
		<xsl:if test="lst_alclic:RegNumber">
			<div class="title marg-top">Номер лицензии</div>
		</xsl:if>
		<xsl:apply-templates select="lst_alclic:RegNumber"/>
		<xsl:if test="lst_alclic:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей лицензию</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="lst_alclic:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="lst_alclic:PrevLicense"/>
		<xsl:if test="lst_alclic:PrevLicense">
			<div class="title marg-top">Номер предыдущей лицензии</div>
		</xsl:if>
		<xsl:apply-templates select="lst_alclic:PrevLicense"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Вид лицензируемой деятельности</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="lst_alclic:Permissions"/>
				</td>
			</tr>
		</table>
		<xsl:if test="lst_alclic:Organization">
			<div class="title marg-top">Информация об организации, получившей лицензию</div>
		</xsl:if>
		<xsl:apply-templates select="lst_alclic:Organization"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата начала действия лицензии</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="lst_alclic:BeginDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата окончания действия лицензии</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="lst_alclic:EndDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="lst_alclic:Signer"/>
		<xsl:if test="lst_alclic:Signer">
			<div class="title marg-top">Информация о лице, подписавшем лицензию</div>
		</xsl:if>
		<xsl:apply-templates select="lst_alclic:Signer"/>
		<xsl:if test="lst_alclic:ChangesDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата изменения сведений о лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="lst_alclic:ChangesDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="lst_alclic:ChangesReason">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Основания для внесения изменений</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="lst_alclic:ChangesReason"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа lst_alclic:OrganizationType -->
	<xsl:template match="lst_alclic:Organization">
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
			<div class="title marg-top">Сведения об организации. Особенности республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:if test="cat_ru:OKPOID">
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
		</xsl:if>
		<xsl:if test="cat_ru:Address"/>
		<xsl:if test="cat_ru:Address">
			<div class="title marg-top">Адрес </div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:if test="cat_ru:Contact"/>
		<xsl:if test="cat_ru:Contact">
			<div class="title marg-top">Контактная информация</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Contact"/>
		<xsl:if test="lst_alclic:BranchDescription">
			<div class="title marg-top">Сведения об обособленном подразделении (складе)</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Краткое наименование обособленного подразделения</td>
						<td class="graphMain bordered">Адрес обособленного подразделения</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Российской Федерации</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Республики Казахстан</td>
						<td class="graphMain bordered">Сведения об организации. Особенности Республики Беларусь</td>
						<td class="graphMain bordered">Сведения об организации. Особенности республики Армения</td>
					</tr>
					<xsl:for-each select="lst_alclic:BranchDescription">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа lst_alclic:LicenseNumberType -->
	<xsl:template match="lst_alclic:PrevLicense">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер лицении</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="lst_alclic:DocumentNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата выдачи лицензии</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="lst_alclic:DocumentDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа lst_alclic:LicenseNumberType -->
	<xsl:template match="lst_alclic:RegNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер лицении</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="lst_alclic:DocumentNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата выдачи лицензии</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="lst_alclic:DocumentDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="lst_alclic:Signer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
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
		<xsl:if test="cat_ru:IssueDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата подписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:variable name="day" select="substring($dateIn,9,2)"/>
				<xsl:variable name="month" select="substring($dateIn,6,2)"/>
				<xsl:variable name="month_word">
					<xsl:choose>
						<xsl:when test="$month='01'">января</xsl:when>
						<xsl:when test="$month='02'">февраля</xsl:when>
						<xsl:when test="$month='03'">марта</xsl:when>
						<xsl:when test="$month='04'">апреля</xsl:when>
						<xsl:when test="$month='05'">мая</xsl:when>
						<xsl:when test="$month='06'">июня</xsl:when>
						<xsl:when test="$month='07'">июля</xsl:when>
						<xsl:when test="$month='08'">августа</xsl:when>
						<xsl:when test="$month='09'">сентября</xsl:when>
						<xsl:when test="$month='10'">октября</xsl:when>
						<xsl:when test="$month='11'">ноября</xsl:when>
						<xsl:when test="$month='12'">декабря</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="year" select="substring($dateIn,1,4)"/>
				<xsl:text>"</xsl:text><xsl:value-of select="$day"/><xsl:text>" </xsl:text><xsl:value-of select="$month_word"/><xsl:text> </xsl:text><xsl:value-of select="$year"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
