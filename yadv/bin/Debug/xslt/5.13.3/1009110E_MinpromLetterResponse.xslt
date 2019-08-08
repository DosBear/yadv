<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ml_res="urn:customs.ru:Information:SQDocuments:MinpromLetterResponse:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа MinpromLetterResponseType -->
	<xsl:template match="ml_res:MinpromLetterResponse">
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
									width: 210mm;
									max-width: 210mm;
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
										<b>Cведения о подтверждении целевого назначения ввозимого товара (Минпромторг)</b>
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
					<xsl:if test="ml_res:BDRDID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор документа по БД РД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ml_res:BDRDID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ml_res:Letter">
						<div class="title marg-top">Письмо</div>
						<xsl:apply-templates select="ml_res:Letter"/>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Кому выдано</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ml_res:Receiver"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ml_res:LegalPersonINN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН юридического лица</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ml_res:LegalPersonINN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ml_res:PhysicalPersonINN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН физического лица</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ml_res:PhysicalPersonINN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Статус письма</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="ml_res:Active='true'">
										<xsl:text>действующий</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>недействующий</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ml_res:Title"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ml_res:Address">
						<div class="title marg-top">Адрес</div>
					</xsl:if>
					<xsl:apply-templates select="ml_res:Address"/>
					<xsl:if test="ml_res:Custom">
						<div class="title marg-top">Таможенный пост</div>
					</xsl:if>
					<xsl:apply-templates select="ml_res:Custom"/>
					<xsl:if test="ml_res:Agreement">
						<div class="title marg-top">Соглашение с минэкономразвития России</div>
						<xsl:apply-templates select="ml_res:Agreement"/>
					</xsl:if>
					
					<xsl:if test="ml_res:Transports">
						<div class="title marg-top">Сведения о ТС</div>
						<table>
							<tr class="title">
								<td class="bordered">Модель</td>
								<td class="bordered">Кол-во кузовов</td>
								<td class="bordered">Марка</td>
								<td class="bordered">Код ТНВЭД</td>
							</tr>
							<xsl:for-each select="ml_res:Transports">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="ml_res:Contracts">
						<div class="title marg-top">Контракты</div>
						<table class="w190">
							<xsl:for-each select="ml_res:Contracts">
								<tr>
									<td class="annot graphMain" style="width:50%"></td>
									<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="ml_res:Products">
						<div class="title marg-top">Товары</div>
						<table>
							<tr class="title">
								<td class="bordered">Описание</td>
								<td class="bordered">Марка</td>
								<td class="bordered">Модель</td>
								<td class="bordered">Кол-во</td>
							</tr>
							<xsl:for-each select="ml_res:Products">
								<xsl:apply-templates select="."/>
							</xsl:for-each>	
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ml_res:Products">
		<tr>
			<td class="bordered"><xsl:value-of select="ml_res:Description"/></td>
			<td class="bordered"><xsl:value-of select="ml_res:Brend"/></td>
			<td class="bordered"><xsl:value-of select="ml_res:Model"/></td>
			<td class="bordered"><xsl:apply-templates select="ml_res:Quantity"/></td>
		</tr>
	</xsl:template>
	<xsl:template match="ml_res:Transports">
		<tr>
			<td class="bordered"><xsl:value-of select="ml_res:Model"/></td>
			<td class="bordered"><xsl:value-of select="ml_res:QuantityBody"/></td>
			<td class="bordered"><xsl:value-of select="ml_res:Brand"/></td>
			<td class="bordered"><xsl:value-of select="ml_res:TNVEDCode"/></td>
		</tr>
	</xsl:template>
	<xsl:template match="ml_res:Quantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ml_res:Agreement">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Описание</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ml_res:Description"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ml_res:AgreementData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Соглашение</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ml_res:AgreementData"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ml_res:AgreementAttached">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Доп.соглашение</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ml_res:AgreementAttached"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ml_res:Report">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Протокол к соглашению</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ml_res:Report"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ml_res:AgreementData| ml_res:AgreementAttached| ml_res:Report">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Begin')">начало действия </xsl:when>
				<xsl:when test="contains(local-name(.),'End')">окончание действия </xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ml_res:Contracts">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="ml_res:Address">
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
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="ml_res:Custom">
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
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="ml_res:Letter">
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
