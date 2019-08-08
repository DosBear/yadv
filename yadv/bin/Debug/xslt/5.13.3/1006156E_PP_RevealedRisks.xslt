<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:pprr="urn:customs.ru:Information:CustomsDocuments:PP_RevealedRisks:5.12.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PP_RevealedRisksType -->
	<xsl:template match="pprr:PP_RevealedRisks">
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
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:6mm;
									}

									.marg-t1
									{
									margin-top:12mm;
									margin-bottom:3mm;
									font-family: Arial;
									font-size: 12pt;
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
									<font size="5">
										<b>Результат выявления рисков по уведомлению о прибытии ТС</b>
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
					<xsl:if test="pprr:TransportID">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор сообщения о прибытии транспорта, по которому выявлялись риски</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pprr:TransportID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pprr:TDTSRegNumber">
						<div class="title marg-t1">Регистрационный номер ТДТС</div>
						<xsl:apply-templates select="pprr:TDTSRegNumber"/>
					</xsl:if>
					<xsl:if test="pprr:Profiles">
						<div class="title marg-t1">Выявленные ПР/ЦПР</div>
						<table class="w190">
							<xsl:for-each select="pprr:Profiles">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="pprr:Consignments">
						<div class="title marg-t1">Партии товаров, на которых были выявлены риски</div>
						<xsl:apply-templates select="pprr:Consignments"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа pprr:ConsignmentsType -->
	<xsl:template match="pprr:Consignments">
		<table class="w190">
			<tr class="title">
				<td style="width:15%" colspan="3"/>
				<td class="graphMain bordered" style="width:85%" colspan="3">Ссылки на ПР/ЦПР</td>
			</tr>
			<tr bgcolor="#e3e3e3">
				<td style="border-top: 1px solid grey" colspan="4">на ТС в целом (т.е. на все партии товаров)</td>
			</tr>
			<xsl:if test="not(pprr:ProfileRef)">
				<tr>
					<td colspan="3"/>
					<td class="graphMain bordered"> - </td>
				</tr>
			</xsl:if>
			<xsl:if test="pprr:ProfileRef">
				<xsl:for-each select="pprr:ProfileRef">
					<tr>
						<td colspan="3"/>
						<td class="graphMain bordered"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="pprr:Consignment">
				<xsl:for-each select="pprr:Consignment">
					<tr>
						<td style="width:5%"/>
						<td style="border-top: 1px solid grey" bgcolor="#e3e3e3" colspan="3">
							<xsl:text>на партию товара (идентификатор сообщения о прибытии конкретной партии товаров: </xsl:text>
							<xsl:value-of select="pprr:LotID"/>
							<xsl:text>)</xsl:text>
						</td>
					</tr>
					<xsl:if test="not(pprr:ProfileRef)">
						<tr>
							<td colspan="3"/>
							<td class="graphMain bordered"> - </td>
						</tr>
					</xsl:if>
					<xsl:if test="pprr:ProfileRef">
						<xsl:for-each select="pprr:ProfileRef">
							<tr>
								<td colspan="3"/>
								<td class="graphMain bordered"><xsl:apply-templates select="."/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="pprr:Goods">
						<xsl:for-each select="pprr:Goods">
							<tr >
								<td style="width:10%" colspan="2"/>
								<td style="border-top: 1px solid grey" bgcolor="#e3e3e3" colspan="2">
									<xsl:text>на товар № </xsl:text>
									<xsl:value-of select="pprr:GoodsNumber"/>
								</td>
							</tr>
							<xsl:if test="not(pprr:ProfileRef)">
								<tr>
									<td colspan="3"/>
									<td class="graphMain bordered"> - </td>
								</tr>
							</xsl:if>
							<xsl:if test="pprr:ProfileRef">
								<xsl:for-each select="pprr:ProfileRef">
									<tr>
										<td colspan="3"/>
										<td class="graphMain bordered"><xsl:apply-templates select="."/></td>
									</tr>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>	
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pprr:CriterionCodeInfoType -->
	<xsl:template match="pprr:CriterionCodeInfo">
		<xsl:text>(</xsl:text>
		<xsl:value-of select="pprr:CriterionCode"/>
		<xsl:text>) </xsl:text>
		<xsl:value-of select="pprr:CriterionDescription"/>
	</xsl:template>
	<!-- Шаблон для типа pprr:MeasureAttributeType -->
	<xsl:template match="pprr:MeasureAttribute">
		<xsl:text>(код: </xsl:text>
		<xsl:value-of select="pprr:MeasureAttributeCode"/>
		<xsl:text>) </xsl:text>
		<xsl:for-each select="pprr:MeasureAttributeValue">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
		</xsl:for-each>
		<xsl:choose>
			<xsl:when test="pprr:MeasureAttributeNecessary='0'">
				<xsl:text> - возможно выбирать значения характеристик таможенного досмотра</xsl:text>
			</xsl:when>
			<xsl:when test="pprr:MeasureAttributeNecessary='1'">
				<xsl:text> - возможность выбора отсутствует (досмотр применяется в соответствии со значениями характеристик, установленных профилем риска)</xsl:text>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="pprr:MeasureAttributeNecessary"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа pprr:MinimizeMeasuresType -->
	<xsl:template match="pprr:MinimizeMeasures">
		<div class="title marg-top">Меры по минимизации риска</div>
		<xsl:if test="pprr:MinimizeMeasuresNote">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Примечание к мерам</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pprr:MinimizeMeasuresNote"/></td>
				</tr>
			</table>
		</xsl:if>
		<br/>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered" style="width:12.5%; vertical-align: middle">Код мер по минимизации рисков (rsk_mera.dbf)</td>
				<td class="graphMain bordered" style="width:12.5%; vertical-align: middle">Обязательность применения меры</td>
				<td class="graphMain bordered" style="width:12.5%; vertical-align: middle">Признак применения мер по минимизации рисков (уровень системы)</td>
				<td class="graphMain bordered" style="width:25%; vertical-align: middle">Примечание к досмотру/осмотру</td>
				<td class="graphMain bordered" style="width:12.5%; vertical-align: middle">Код главной меры по минимизации рисков</td>
				<td class="graphMain bordered" style="width:25%; vertical-align: middle">Характеристики досмотра/осмотра</td>
			</tr>
			<xsl:for-each select="pprr:MinimizeMeasuresInfo">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pprr:MinimizeMeasuresInfoType -->
	<xsl:template match="pprr:MinimizeMeasuresInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="pprr:MinimizeMeasureCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="pprr:MinimizeMeasureNecessary='0'">необязательное применение меры</xsl:when>
					<xsl:when test="pprr:MinimizeMeasureNecessary='1'">обязательное применение меры</xsl:when>
					<xsl:otherwise><xsl:value-of select="pprr:MinimizeMeasureNecessary"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="pprr:TakeMeasuresSign=' '">поле не заполняется</xsl:when>
					<xsl:when test="pprr:TakeMeasuresSign='0'">мера не применяется согласно результатам случайной выборки</xsl:when>
					<xsl:when test="pprr:TakeMeasuresSign='1'">мера должна быть применена согласно профилю риска</xsl:when>
					<xsl:when test="pprr:TakeMeasuresSign='2'">мера не применяется из-за несоответствия этапа применения меры и этапа выявления ПР</xsl:when>
					<xsl:when test="pprr:TakeMeasuresSign='3'">резерв</xsl:when>
					<xsl:when test="pprr:TakeMeasuresSign='4'">мера не применяется в связи с включением субъекта ВЭД в Перечень лиц, в отношении которых принято решение об идентификации категории уровня риска применения мер по минимизации рисков</xsl:when>
					<xsl:when test="pprr:TakeMeasuresSign='5'">мера не применяется в связи с неприменением главной меры (проставляется АИС «АИСТ-М» в автоматическом режиме)</xsl:when>
					<xsl:when test="pprr:TakeMeasuresSign='6'">мера не применялась по причине упрощенного контроля таможенной стоимости идентичных товаров</xsl:when>
					<xsl:otherwise><xsl:value-of select="pprr:TakeMeasuresSign"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pprr:MeasureDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pprr:MainActionCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="pprr:MeasureAttribute">
					<xsl:for-each select="pprr:MeasureAttribute">
						<xsl:apply-templates select="."/><br/>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pprr:ProfileRefType -->
	<xsl:template match="pprr:ProfileRef">
		<xsl:value-of select="@URI"/>
	</xsl:template>
	<!-- Шаблон для типа pprr:ProfilesType -->
	<xsl:template match="pprr:Profiles">
		<tr bgcolor="#e3e3e3">
			<td class="annot graphMain" style="width:50%; border-top: 1px solid grey">Код вида профиля риска</td>
			<td class="value graphMain" style="width:50%; border-top: 1px solid grey">
				<xsl:choose>
					<xsl:when test="pprr:DocumentSignCode='11'">общероссийский профиль риска</xsl:when>
					<xsl:when test="pprr:DocumentSignCode='12'">региональный профиль риска</xsl:when>
					<xsl:when test="pprr:DocumentSignCode='13'">зональный профиль риска</xsl:when>
					<xsl:when test="pprr:DocumentSignCode='20'">целевой профиль риска</xsl:when>
					<xsl:when test="pprr:DocumentSignCode='21'">целевой правоохранительный профиль риска</xsl:when>
					<xsl:when test="pprr:DocumentSignCode='32'">профиль риска на основе моделей</xsl:when>
					<xsl:when test="pprr:DocumentSignCode='55'">профиль риска, обязательный к применению</xsl:when>
					<xsl:when test="pprr:DocumentSignCode='77'">профиль риска для идентификации категории уровня риска</xsl:when>
					<xsl:when test="pprr:DocumentSignCode='88'">зависимый профиль риска</xsl:when>
					<xsl:otherwise><xsl:value-of select="pprr:DocumentSignCode"/></xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>	
		<tr>
			<td class="annot graphMain" style="width:50%">Код таможенного органа, разработавшего ПР/ЦПР</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="pprr:DivisionCode"/></td>
		</tr>	
		<tr>
			<td class="annot graphMain" style="width:50%">Дата регистрации ПР/ЦПР</td>
			<td class="value graphMain" style="width:50%">
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pprr:RegistryDate"/></xsl:call-template>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Порядковый номер ПР/ЦПР</td>
			<td class="value graphMain" style="width:50%">
				<xsl:value-of select="pprr:SequenceNumber"/>
				<xsl:text> (версия: </xsl:text>
				<xsl:value-of select="pprr:VersionNumber"/>
				<xsl:text>)</xsl:text>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Дата начала действия версии ПР/ЦПР</td>
			<td class="value graphMain" style="width:50%">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="pprr:BeginDate"/>
				</xsl:call-template>
			</td>
		</tr>
		<xsl:if test="pprr:DocumentDescription">
			<tr>
				<td class="annot graphMain" style="width:50%">Описание риска</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pprr:DocumentDescription"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pprr:PRNote">
			<tr>
				<td class="annot graphMain" style="width:50%">Примечание к ПР/ЦПР</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pprr:PRNote"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pprr:ActivityCode">
			<tr>
				<td class="annot graphMain" style="width:50%">Код направления деятельности подразделения, по направлению которого выявлен риск</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pprr:ActivityCode"/></td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Информация о типовом критерии</td>
			<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pprr:CriterionCodeInfo"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<xsl:apply-templates select="pprr:MinimizeMeasures"/>
				<br/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pprr:TDTSType -->
	<xsl:template match="pprr:TDTSRegNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер ТДТС</td>
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
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код вида транспорта</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pprr:TransportModeCode"/>
				</td>
			</tr>
		</table>
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
