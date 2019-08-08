<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:znci_res="urn:customs.ru:Information:SQDocuments:ZAGSNameChangeInfoRes:5.13.3">
	<!-- Шаблон для типа ZAGSNameChangeInfoResType -->
	<xsl:template match="znci_res:ZAGSNameChangeInfoRes">
		<html>
			<head>
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
										<b>Ответ на запрос на поиск актовой записи о перемене имени для получения сведений в объеме свидетельства о перемене имени</b>
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
						<tr>
							<td class="annot graphMain" style="width:50%">Статус обработки запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="znci_res:RequestStatus=1">Обработано</xsl:when>
									<xsl:when test="znci_res:RequestStatus=2">Обработано с ошибкой</xsl:when>
									<xsl:when test="znci_res:RequestStatus=3">Не обработано</xsl:when>
									<xsl:otherwise><xsl:value-of select="znci_res:RequestStatus"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Результат поиска актовой записи</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="znci_res:SearchResult=1">Актовая запись найдена</xsl:when>
									<xsl:when test="znci_res:SearchResult=2">Актовая запись не найдена</xsl:when>
									<xsl:when test="znci_res:SearchResult=3">Поиск не завершен</xsl:when>
									<xsl:when test="znci_res:SearchResult=4">Уточните параметры поиска, найдено более одной актовой записи</xsl:when>
									<xsl:when test="znci_res:SearchResult=5">Ошибка при поиске</xsl:when>
									<xsl:when test="znci_res:SearchResult=6">Сведения не могут быть предоставлены</xsl:when>
									<xsl:otherwise><xsl:value-of select="znci_res:SearchResult"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="znci_res:RetentionArchivalFund">
						<div class="title marg-top">Информация о сохранности архивного фонда</div>
						<xsl:apply-templates select="znci_res:RetentionArchivalFund"/>
					</xsl:if>
					<xsl:if test="znci_res:AktInfo">
						<div class="title marg-top">Информация о записи акта</div>
						<xsl:apply-templates select="znci_res:AktInfo"/>
					</xsl:if>
					<xsl:if test="znci_res:PersonInfo">
						<div class="title marg-top">Информация о лице</div>
						<xsl:apply-templates select="znci_res:PersonInfo"/>
					</xsl:if>
					<xsl:if test="znci_res:CertificateRequisites">
						<table class="bordered w190">
							<xsl:for-each select="znci_res:CertificateRequisites">
								<tr>
									<td class="annot graphMain" style="width:50%">
										<xsl:if test="position()=1"><div class="title marg-top">Реквизиты сертификата</div></xsl:if>
									</td>
									<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа znci_res:AktInfoType -->
	<xsl:template match="znci_res:AktInfo">
		<table class="w190">
			<xsl:if test="znci_res:ActRecordStatus or znci_res:IsRecovered">
				<tr>
					<td class="annot graphMain" style="width:50%">Текущее состояние актовой записи</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="znci_res:ActRecordStatus=1">Актовая запись актуальна </xsl:when>
							<xsl:when test="znci_res:ActRecordStatus=2">Актовая запись аннулирована </xsl:when>
							<xsl:when test="znci_res:ActRecordStatus=3">Составлена новая запись акта </xsl:when>
							<xsl:otherwise><xsl:value-of select="znci_res:ActRecordStatus"/></xsl:otherwise>
						</xsl:choose>
						<xsl:if test="znci_res:IsRecovered and (znci_res:IsRecovered='true' or znci_res:IsRecovered=1)"> (восстановлена)</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Номер записи акта</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="znci_res:ActRecordNumber"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации записи акта</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="znci_res:ActRecordDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование органа ЗАГС</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="znci_res:ZAGSAuthorityName"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="znci_res:BirthPlace">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
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
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode">
			<xsl:text> (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="znci_res:CertificateRequisites">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа znci_res:PersonInfoType -->
	<xsl:template match="znci_res:PersonInfo">
		<table class="w190">
			<xsl:if test="znci_res:PersonNameBeforeChange">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о лице до перемены имени</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="znci_res:PersonNameBeforeChange"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="znci_res:PersonNameAfterChange">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о лице после перемены имени</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="znci_res:PersonNameAfterChange"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="znci_res:PersonCitizenship">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование государства гражданства лица, в отношении которого зарегистрирована перемена имени, до перемены имени</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="znci_res:PersonCitizenship"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="znci_res:PersonNationality">
				<tr>
					<td class="annot graphMain" style="width:50%">Национальность лица, в отношении которого зарегистрирована перемена имени, до перемены имени</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="znci_res:PersonNationality"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата рождения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="znci_res:PersonBirthDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:if test="znci_res:BirthPlace">
				<tr>
					<td class="annot graphMain" style="width:50%">Место рождения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="znci_res:BirthPlace"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа znci_res:FIOType -->
	<xsl:template match="znci_res:PersonNameAfterChange| znci_res:PersonNameBeforeChange">
		<xsl:value-of select="znci_res:Surname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="znci_res:PersonName"/>
		<xsl:if test="znci_res:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="znci_res:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа znci_res:RetentionArchivalFundType -->
	<xsl:template match="znci_res:RetentionArchivalFund">
		<xsl:if test="znci_res:IsFullyStored">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:95%">Признак полного сохранения архивного фонда</td>
					<td class="graphMain bordered" style="width:5%" align="center">
						<xsl:if test="znci_res:IsFullyStored='true' or znci_res:IsFullyStored=1">V</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="znci_res:StartDate or znci_res:EndDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Период сохранности архивного фонда</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="znci_res:StartDate">
							<xsl:text>c </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="znci_res:StartDate"/>
							</xsl:call-template>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="znci_res:EndDate">
							<xsl:text>по </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="znci_res:EndDate"/>
							</xsl:call-template>
						</xsl:if>
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
</xsl:stylesheet>
