<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:mpcl="urn:customs.ru:Information:SQDocuments:MinpromCooperationList:5.13.3">
	<!-- Шаблон для типа MinpromCooperationListType -->
	<xsl:template match="mpcl:MinpromCooperationList">
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
										<b>Сведения о перечнях и списках кооперации</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
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
					</xsl:if>
					<div class="title marg-top">Сведения о перечне/списке кооперации</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Идентификатор документа по БД РД</td>
								<td class="graphMain bordered">Наименование документа: 1 - перечень кооперации; 2 - список кооперации</td>
								<td class="graphMain bordered">Внутренний номер Минпромторга</td>
								<td class="graphMain bordered">Дата формирования</td>
								<td class="graphMain bordered">Дата начала действия</td>
								<td class="graphMain bordered">Дата окончания действия</td>
								<td class="graphMain bordered">Направление перемещения товаров</td>
								<td class="graphMain bordered">Сведения о международном соглашении(договоре)</td>
								<td class="graphMain bordered">Сведения о таможенном органе, уполномоченном на совершение операций</td>
								<td class="graphMain bordered">Отправитель</td>
								<td class="graphMain bordered">Получатель</td>
								<td class="graphMain bordered">Сведения о товаре</td>
								<td class="graphMain bordered">Уполномоченное лицо со стороны Минпромторга</td>
								<td class="graphMain bordered">Статус подтверждения: 1 - подтверждение действует; 2 - подтверждение аннулировано</td>
								<td class="graphMain bordered">Дополнительная информация о статусе</td>
								<td class="graphMain bordered">Дата аннулирования подтверждения</td>
								<td class="graphMain bordered">Информация о дате и времени последнего изменения</td>
							</tr>
							<xsl:for-each select="mpcl:MinpromCooperationSingleList">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
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
	<!-- Шаблон для типа mpcl:AgreementType -->
	<xsl:template match="mpcl:Agreement">
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
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование страны, с которой заключено соглашение</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpcl:CountryName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="mpcl:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны, с которой заключено соглашение</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="mpcl:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="mpcl:AuthorizedPerson">
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
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="mpcl:CustomsOffice">
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
	<!-- Шаблон для типа mpcl:GoodsInfoType -->
	<xsl:template match="mpcl:GoodsInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="mpcl:Number"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpcl:GoodName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpcl:TNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mpcl:Quantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="mpcl:SupplementaryQuantity">
					<xsl:apply-templates select="mpcl:SupplementaryQuantity"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа mpcl:MinpromCooperationSingleListType -->
	<xsl:template match="mpcl:MinpromCooperationSingleList">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="mpcl:BDRDID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="mpcl:DocumentType=1">
						<xsl:text>перечень кооперации</xsl:text>
					</xsl:when>
					<xsl:when test="mpcl:DocumentType=2">
						<xsl:text>список кооперации</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="mpcl:DocumentType"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpcl:RegNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="mpcl:Date"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="mpcl:DateBegin"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="mpcl:DateEnd"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpcl:MovingDirection"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mpcl:Agreement"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mpcl:CustomsOffice"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mpcl:Sender"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mpcl:Receiver"/>
			</td>
			<td class="graphMain bordered">
				<div class="title marg-top">Сведения о товаре</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<tr>
								<td class="graphMain bordered">Номер позиции товара в перечне (списке)</td>
								<td class="graphMain bordered">Краткое наименование товара</td>
								<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Количество товара в основной единице измерения</td>
								<td class="graphMain bordered">Количество товара в дополнительной единице измерения</td>
							</tr>
						</tr>
						<xsl:for-each select="mpcl:GoodsInfo">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mpcl:AuthorizedPerson"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="mpcl:Status=1">
						<xsl:text>подтверждение действует</xsl:text>
					</xsl:when>
					<xsl:when test="mpcl:Status=2">
						<xsl:text>подтверждение аннулировано</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="mpcl:Status"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpcl:StatusInfo"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="mpcl:AnnulmentDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="mpcl:LastChangeDateTime"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(mpcl:LastChangeDateTime, 12, 8)"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="mpcl:Quantity">
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
	</xsl:template>
	<!-- Шаблон для типа mpcl:OrganizationWithOtherInfo -->
	<xsl:template match="mpcl:Receiver">
		<xsl:if test="RUScat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="RUScat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:Address">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Address"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpcl:OtherInfo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Иные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="mpcl:OtherInfo"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа mpcl:OrganizationWithOtherInfo -->
	<xsl:template match="mpcl:Sender">
		<xsl:if test="RUScat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="RUScat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:Address">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Address"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpcl:OtherInfo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Иные сведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="mpcl:OtherInfo"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="mpcl:SupplementaryQuantity">
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
