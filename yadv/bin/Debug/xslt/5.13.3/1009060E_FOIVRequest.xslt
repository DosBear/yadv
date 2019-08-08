<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:foivrq="urn:customs.ru:Information:SQDocuments:FOIVRequest:5.11.0">
	<!-- Шаблон для типа FOIVRequestType -->
	<xsl:template match="foivrq:FOIVRequest">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: nowrap;*/
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
										<b>Запрос (ФОИВ)</b>
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
					<xsl:if test="foivrq:ID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор запроса/записи</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="foivrq:ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="foivrq:StartDateTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата/время начала периода поиска</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_datetime">
										<xsl:with-param name="dateIn" select="foivrq:StartDateTime"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="foivrq:EndDateTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата/время окончания периода поиска</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_datetime">
										<xsl:with-param name="dateIn" select="foivrq:EndDateTime"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="foivrq:Period">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Период поиска</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="foivrq:Period=1">
											<xsl:text>Весь период</xsl:text>
										</xsl:when>
										<xsl:when test="foivrq:Period=2">
											<xsl:text>Полгода</xsl:text>
										</xsl:when>
										<xsl:when test="foivrq:Period=3">
											<xsl:text>3 месяца</xsl:text>
										</xsl:when>
										<xsl:when test="foivrq:Period=4">
											<xsl:text>2 месяца</xsl:text>
										</xsl:when>
										<xsl:when test="foivrq:Period=5">
											<xsl:text>1 месяц</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="foivrq:Period"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="foivrq:PermitCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Признак</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="foivrq:PermitCode=1">
											<xsl:text>разрешение</xsl:text>
										</xsl:when>
										<xsl:when test="foivrq:PermitCode=2">
											<xsl:text>спецразрешение (карточка)</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="foivrq:PermitCode"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="foivrq:Permission"/>
					<xsl:if test="foivrq:Permission">
						<div class="title marg-top">Разрешение РСХН на транспортировку подконтрольной продукции</div>
					</xsl:if>
					<xsl:apply-templates select="foivrq:Permission"/>
					<xsl:if test="foivrq:ResponseStatus">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Признак получения ответа на запрос</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="foivrq:ResponseStatus='true'">
											<xsl:text>есть</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>нет</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="foivrq:ResponseInfo">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Текст ошибки, выявленной при обработке данных, полученных по запросу</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="foivrq:ResponseInfo"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="foivrq:Transport">
						<div class="title marg-top">Сведения о транспортном средстве</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Номер шасси (VIN)</td>
									<td class="graphMain bordered">Код типа</td>
									<td class="graphMain bordered">Код марки</td>
									<td class="graphMain bordered">Идентификатор.</td>
									<td class="graphMain bordered">Буквенный код страны</td>
									<td class="graphMain bordered">Идентификатор активного ТС</td>
									<td class="graphMain bordered">№ свидетельства о регистрации</td>
									<td class="graphMain bordered">Вид</td>
								</tr>
								<xsl:for-each select="foivrq:Transport">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="foivrq:Document"/>
					<xsl:if test="foivrq:Document">
						<div class="title marg-top">Сведения о документе</div>
					</xsl:if>
					<xsl:apply-templates select="foivrq:Document"/>
					<xsl:if test="foivrq:InspectionInfo">
						<div class="title marg-top">Запрос о необходимости предоставления дополнительных сведений и о возможности принятия решения</div>
					</xsl:if>
					<xsl:apply-templates select="foivrq:InspectionInfo"/>
					<xsl:if test="foivrq:CheckRequestData">
						<div class="title marg-top">Данные запроса на поиск информации о разрешении</div>
					</xsl:if>
					<xsl:apply-templates select="foivrq:CheckRequestData"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:for-each select="./*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
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
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cat_ru:IdentityCard">
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
					<td class="annot graphMain" style="width:50%">ИНН / ПИН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGINN"/>
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
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="foivrq:Address">
		<xsl:for-each select="./*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="foivrq:Adress">
		<xsl:for-each select="./*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа foivrq:AutoTrainType -->
	<xsl:template match="foivrq:AutoTrain">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Общий вес автопоезда с грузом</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(foivrq:TotalWeight, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Длина автопоезда (в метрах)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(foivrq:Length, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Ширина автопоезда (в метрах)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(foivrq:Width, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Высота автопоезда (в метрах)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(foivrq:Height, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Массив нагрузок на оси (в тоннах)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:for-each select="foivrq:AxisLoads">
						<xsl:value-of select="translate(., '.', ',')"/>
						<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
		<xsl:if test="foivrq:AxisInvervals">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Массив интервалов между осями (в метрах)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="foivrq:AxisInvervals">
							<xsl:value-of select="translate(., '.', ',')"/>
							<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа foivrq:BusinessEntityType -->
	<xsl:template match="foivrq:BusinessEntity">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование предприятия получателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="foivrq:Name"/>
				</td>
			</tr>
		</table>
		<xsl:if test="foivrq:UUID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер предприятия получателя </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:UUID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:RFOrganizationFeatures"/>
		<xsl:if test="foivrq:RFOrganizationFeatures">
			<div class="title marg-top">Сведения о предприятии получателе</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:RFOrganizationFeatures"/>
		<xsl:if test="foivrq:Address"/>
		<xsl:if test="foivrq:Address">
			<div class="title marg-top">Адрес предприятия получателя в случае отсутствия сведений в Реестре хоз.субъектов РСХН</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:Address"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUOrganizationType -->
	<xsl:template match="foivrq:Carrier">
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
		<xsl:if test="cat_ru:Address"/>
		<xsl:if test="cat_ru:Address">
			<div class="title marg-top">Адрес организации</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:if test="cat_ru:IdentityCard"/>
		<xsl:if test="cat_ru:IdentityCard">
			<div class="title marg-top">Документ, удостоверяющий личность</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:IdentityCard"/>
		<xsl:if test="cat_ru:Contact"/>
		<xsl:if test="cat_ru:Contact">
			<div class="title marg-top">Контактная информация</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Contact"/>
	</xsl:template>
	<!-- Шаблон для типа foivrq:CheckRequestDataType -->
	<xsl:template match="foivrq:CheckRequestData">
		<xsl:if test="foivrq:Post">
			<div class="title marg-top">Пост</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:Post"/>
		<xsl:if test="foivrq:Carrier"/>
		<xsl:if test="foivrq:Carrier">
			<div class="title marg-top">Перевозчик</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:Carrier"/>
		<xsl:if test="foivrq:AutoTrain">
			<div class="title marg-top">Сведения о транспортном средстве (автопоезд)</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:AutoTrain"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUOrganizationType -->
	<xsl:template match="foivrq:Consignor">
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
		<xsl:if test="cat_ru:Address"/>
		<xsl:if test="cat_ru:Address">
			<div class="title marg-top">Адрес организации</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:if test="cat_ru:IdentityCard"/>
		<xsl:if test="cat_ru:IdentityCard">
			<div class="title marg-top">Документ, удостоверяющий личность</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:IdentityCard"/>
		<xsl:if test="cat_ru:Contact"/>
		<xsl:if test="cat_ru:Contact">
			<div class="title marg-top">Контактная информация</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Contact"/>
	</xsl:template>
	<!-- Шаблон для типа foivrq:DestinationPointType -->
	<xsl:template match="foivrq:DestinationPoint">
		<xsl:if test="foivrq:UUID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид места назначения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:UUID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование места доставки товара</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="foivrq:Name"/>
				</td>
			</tr>
		</table>
		<xsl:if test="foivrq:Address"/>
		<xsl:if test="foivrq:Address">
			<div class="title marg-top">адрес места доставки товара в случае отсутствия сведений в Реестре предприятий РСХН</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:Address"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="foivrq:Document">
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
	</xsl:template>
	<!-- Шаблон для типа foivrq:EnterpriseType -->
	<xsl:template match="foivrq:Enterprise">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="foivrq:Type=1">
						<xsl:text>Холодильник</xsl:text>
					</xsl:when>
					<xsl:when test="foivrq:Type=3">
						<xsl:text>Перерабатывающее предприятие</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="foivrq:Type"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="foivrq:UUID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="foivrq:Name"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="foivrq:Adress">
					<xsl:apply-templates select="foivrq:Adress"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа foivrq:GoodsInfoType -->
	<xsl:template match="foivrq:GoodsInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер товара по порядку</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:GoodsNumeric"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:GoodsTNVEDCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код товара по ТН ВЭД ЕАЭС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Описание товара</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="cat_ru:GoodsDescription">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:GrossWeightQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вес товара брутто (кг)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(cat_ru:GrossWeightQuantity, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:NetWeightQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вес товара нетто (кг)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(cat_ru:NetWeightQuantity, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:NameENG">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование товара на английском языке</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:NameENG"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:ProductGuid">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Глобальный идентификатор продукции, которому относится данный вид продукции</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:ProductGuid"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="foivrq:UUID"/>
				</td>
			</tr>
		</table>
		<xsl:if test="foivrq:Quantity">
			<div class="title marg-top">Количество</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:Quantity"/>
		<xsl:if test="foivrq:PackingInfo">
			<div class="title marg-top">Сведения об упаковке товаров.</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Идентификатор</td>
						<td class="graphMain bordered">Код вида</td>
						<td class="graphMain bordered">Количество</td>
					</tr>
					<xsl:for-each select="foivrq:PackingInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:Mark">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о маркировке товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:Mark"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа foivrq:InspectionInfoType -->
	<xsl:template match="foivrq:InspectionInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип операции</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="foivrq:TransferKind=1">
							<xsl:text>Ввоз (импорт в ТС)</xsl:text>
						</xsl:when>
						<xsl:when test="foivrq:TransferKind=2">
							<xsl:text>Транзит через территорию ТС</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="foivrq:TransferKind"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время начала досмотра</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_datetime">
						<xsl:with-param name="dateIn" select="foivrq:StartDateTime"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<div class="title marg-top">Зарубежное предприятие-изготовитель</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Тип</td>
					<td class="graphMain bordered">Номер</td>
					<td class="graphMain bordered">Наименование</td>
					<td class="graphMain bordered">Адрес</td>
				</tr>
				<xsl:for-each select="foivrq:Enterprise">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
		<xsl:if test="foivrq:Consignor"/>
		<xsl:if test="foivrq:Consignor">
			<div class="title marg-top">Грузоотправитель</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:Consignor"/>
		<xsl:if test="foivrq:BusinessEntity">
			<div class="title marg-top">Хозяйствующий субъект-получатель продукции или заявитель.</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:BusinessEntity"/>
		<xsl:if test="foivrq:DestinationPoint"/>
		<xsl:if test="foivrq:DestinationPoint">
			<div class="title marg-top">Место назначения (склад временного хранения и т.п.)</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:DestinationPoint"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Пограничный ветеринарный пункт пропуска</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="foivrq:BorderInspectionPoint"/>
				</td>
			</tr>
		</table>
		<xsl:if test="foivrq:ShipmentType">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип партии для морского транспорта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="foivrq:ShipmentType=0">
								<xsl:text>Контейнерная партия</xsl:text>
							</xsl:when>
							<xsl:when test="foivrq:ShipmentType=1">
								<xsl:text>Трюмная партия</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="foivrq:ShipmentType"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:ImporterCountry">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны-импортёра </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:ImporterCountry"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:ExporterCountry">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны экспортёра </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:ExporterCountry"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:OriginCountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны происхождения товара (по сведениям из импортного ветеринарного сертификата)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:OriginCountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:GoodsInfo">
			<div class="title marg-top">Сведения о товаре</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:GoodsInfo"/>
		<xsl:if test="foivrq:VetCertificate">
			<div class="title marg-top">Ветеринарный сопроводительный документ</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
					</tr>
					<xsl:for-each select="foivrq:VetCertificate">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="foivrq:Waybill"/>
		<xsl:if test="foivrq:Waybill">
			<div class="title marg-top">Товарно-транспортная накладная (ТТН)</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:Waybill"/>
		<xsl:if test="foivrq:Inspector">
			<div class="title marg-top">Таможенный инспектор</div>
		</xsl:if>
		<xsl:apply-templates select="foivrq:Inspector"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="foivrq:Inspector">
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
	</xsl:template>
	<!-- Шаблон для типа foivrq:PackingInfoType -->
	<xsl:template match="foivrq:PackingInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="foivrq:UUID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="foivrq:PackingCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="foivrq:PakingQuantity"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа foivrq:PermissionType -->
	<xsl:template match="foivrq:Permission">
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
		<xsl:if test="foivrq:NumberGoods">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Шифр груза в Разрешении</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="foivrq:NumberGoods"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="foivrq:Post">
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
		<xsl:if test="cat_ru:CustomsCountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код государства - члена Евразийского экономического союза. Трехзначный цифровой код</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа foivrq:QuantityType -->
	<xsl:template match="foivrq:Quantity">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Количество товара в единице измерения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Условное обозначение единицы измерения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор единицы измерения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="foivrq:UUID"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="foivrq:RFOrganizationFeatures">
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
	<!-- Шаблон для типа foivrq:TransportType -->
	<xsl:template match="foivrq:Transport">
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
				<xsl:value-of select="foivrq:TransportModeCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="foivrq:VetCertificate">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="foivrq:Waybill">
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
	</xsl:template>
	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="$dateIn"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateIn, 12, 8)"/>
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
