<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:clmg="urn:customs.ru:Information:SQDocuments:CooperationListMovedGoods:5.13.3">
	<!-- Шаблон для типа CooperationListMovedGoodsType -->
	<xsl:template match="clmg:CooperationListMovedGoods">
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
									max-width:100%;
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
										<b>Отчеты о количестве и номенклатуре товаров, перемещенных в рамках перечней (списков) кооперации</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--div class="title marg-top">Отчет о количестве и номенклатуре товаров, перемещенных в рамках перечней (списков) кооперации</div-->
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Тип документа</td>
								<td class="graphMain bordered">Рег.номер ФТС</td>
								<td class="graphMain bordered">Внутр.номер Минпромторга</td>
								<td class="graphMain bordered">Дата формирования</td>
								<td class="graphMain bordered">Дата начала действия</td>
								<td class="graphMain bordered">Дата окончания действия</td>
								<td class="graphMain bordered">Направление перемещения товаров</td>
								<td class="graphMain bordered">Сведения о международном соглашении(договоре)</td>
								<td class="graphMain bordered">Сведения о таможенном органе</td>
								<td class="graphMain bordered">Отправитель</td>
								<td class="graphMain bordered">Получатель</td>
								<!--td class="graphMain bordered">Сведения о товаре</td-->
								<td class="graphMain bordered">Уполномоч. лицо со стороны Минпромторга</td>
								<td class="graphMain bordered">Статус подтверждения</td>
								<td class="graphMain bordered">Доп.информация о статусе</td>
								<td class="graphMain bordered">Дата аннулирования подтверждения</td>
								<td class="graphMain bordered">Информация о дате и времени последнего изменения</td>
								<td class="graphMain bordered">Уполномоч. лицо со стороны ФТС</td>
								<td class="graphMain bordered">Номер декларации на товары</td>
								<td class="graphMain bordered">Доп.информация о текущем статусе подтверждения</td>
								<td class="graphMain bordered">Доп.информация о дате и времени последнего изменения</td>
							</tr>
							<xsl:for-each select="clmg:Report">
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
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
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
	<!-- Шаблон для типа clmg:AgreementType -->
	<xsl:template match="clmg:Agreement">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:text> </xsl:text>		
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="clmg:CountryName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="clmg:CountryCode">
			<xsl:value-of select="clmg:CountryCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="clmg:CustomsOffice">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:OfficeName"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="clmg:DeclaredQuantity|clmg:DeclaredSupplementaryQuantity|clmg:ListQuantity|clmg:ListSupplementaryQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
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
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="clmg:FTSAuthorizedPerson|clmg:MinpromtorgAuthorizedPerson">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа clmg:GoodsInfoType -->
	<xsl:template match="clmg:GoodsInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:Number"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:GoodName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:TNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="clmg:ListQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="clmg:ListSupplementaryQuantity">
					<xsl:apply-templates select="clmg:ListSupplementaryQuantity"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="clmg:DeclaredQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="clmg:DeclaredSupplementaryQuantity">
					<xsl:apply-templates select="clmg:DeclaredSupplementaryQuantity"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа clmg:OrganizationWithOtherInfo -->
	<xsl:template match="clmg:Receiver|clmg:Sender">
		<xsl:if test="RUScat_ru:OrganizationName">
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="not(RUScat_ru:OrganizationName) and RUScat_ru:ShortName">
			<xsl:value-of select="RUScat_ru:ShortName"/>
		</xsl:if>

		<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		<!--xsl:if test="RUScat_ru:RKOrganizationFeatures">
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
		<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/-->
		<xsl:if test="RUScat_ru:Address">
			<xsl:text>; адрес: </xsl:text>
			<xsl:value-of select="RUScat_ru:Address"/>
		</xsl:if>
		<xsl:if test="clmg:OtherInfo">
			<xsl:text>; иные сведения: </xsl:text>
			<xsl:value-of select="clmg:OtherInfo"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа clmg:ReportType -->
	<xsl:template match="clmg:Report">
		<tr>
			<td class="graphMain bordered" rowspan="2">
				<xsl:choose>
					<xsl:when test="clmg:DocumentType=1">
						<xsl:text>перечень кооперации</xsl:text>
					</xsl:when>
					<xsl:when test="clmg:DocumentType=2">
						<xsl:text>список кооперации</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="clmg:DocumentType"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:FTSRegNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:MinpromtorgRegNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="clmg:Date"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="clmg:DateBegin"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="clmg:DateEnd"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:MovingDirection"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="clmg:Agreement"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="clmg:CustomsOffice"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="clmg:Sender"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="clmg:Receiver"/>
			</td>
			<!--td class="graphMain bordered">
				<div class="title marg-top">Сведения о товаре</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<tr>
								<td class="graphMain bordered">Номер позиции товара в перечне (списке)</td>
								<td class="graphMain bordered">Краткое наименование товара</td>
								<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Количество товара по перечню в основной единице измерения</td>
								<td class="graphMain bordered">Количество товара по перечню в дополнительной единице измерения</td>
								<td class="graphMain bordered">Количество товара, задекларированного на основании перечня в основной единице измерения</td>
								<td class="graphMain bordered">Количество товара, задекларированного на основании перечня в дополнительной единице измерения</td>
							</tr>
						</tr>
						<xsl:for-each select="clmg:GoodsInfo">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
			</td-->
			<td class="graphMain bordered">
				<xsl:apply-templates select="clmg:MinpromtorgAuthorizedPerson"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="clmg:Status=1">
						<xsl:text>подтверждение действует</xsl:text>
					</xsl:when>
					<xsl:when test="clmg:Status=2">
						<xsl:text>подтверждение аннулировано</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="clmg:Status"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:StatusInfo"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="clmg:AnnulmentDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="clmg:LastChangeDateTime"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(clmg:LastChangeDateTime, 12, 8)"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="clmg:FTSAuthorizedPerson"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:DeclarationNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="clmg:AdditionalStatusInfo"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="clmg:AdditionalLastChangeDateTime"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(clmg:AdditionalLastChangeDateTime, 12, 8)"/>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="19">
				<div class="title marg-top">Сведения о товаре</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<tr>
								<td class="graphMain bordered">Номер позиции товара в перечне (списке)</td>
								<td class="graphMain bordered">Краткое наименование товара</td>
								<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Кол-во товара по перечню</td>
								<td class="graphMain bordered">Кол-во товара по перечню в ДЕИ</td>
								<td class="graphMain bordered">Кол-во товара, задекларированного на основании перечня</td>
								<td class="graphMain bordered">Кол-во товара, задекларированного на основании перечня в ДЕИ</td>
							</tr>
						</tr>
						<xsl:for-each select="clmg:GoodsInfo">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
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
