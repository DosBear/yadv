<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:ainin="urn:customs.ru:Information:CustomsDocuments:ActInspectionIn:5.13.2">
	<!-- Шаблон для типа ActInspectionInType -->
	<xsl:template match="ainin:ActInspectionIn">
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
										<b>Акт таможенного досмотра (внутренний формат)</b>
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
							<td class="annot graphMain" style="width:50%">Дата / время начала таможенного досмотра (осмотра)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ainin:BeginInspectionDate"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(ainin:BeginInspectionTime, 1,8)"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата / время окончания таможенного досмотра (осмотра)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ainin:EndInspectionDate"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(ainin:EndInspectionTime, 1,8)"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Признак досмотра</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="ainin:ActType=1">
										<xsl:text>досмотр всех товаров, заявленных в ДТ</xsl:text>
									</xsl:when>
									<xsl:when test="ainin:ActType=2">
										<xsl:text>досмотр части товаров, заявленных в ДТ</xsl:text>
									</xsl:when>
									<xsl:when test="ainin:ActType=3">
										<xsl:text>досмотр товаров, заявленных в нескольких ДТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="ainin:ActType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор акта таможенного досмотра</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ainin:ATDGlobalID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ainin:ATDKind">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Признак досмотра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="ainin:ATDKind=0">
											<xsl:text>досмотр</xsl:text>
										</xsl:when>
										<xsl:when test="ainin:ATDKind=1">
											<xsl:text>осмотр</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="ainin:ATDKind"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата / время модификации </td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ainin:ModificationDate"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(ainin:ModificationTime, 1,8)"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код  проставленной технологической отметки</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="ainin:TechMarkCode=001">
										<xsl:text>ошибочно переданный АТД</xsl:text>
									</xsl:when>
									<xsl:when test="ainin:TechMarkCode=002">
										<xsl:text>АТД, содержащий ошибку в регистрационном номере</xsl:text>
									</xsl:when>
									<xsl:when test="ainin:TechMarkCode=000">
										<xsl:text>прочие случаи</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="ainin:TechMarkCode"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="ainin:CustomsMark">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Служебные отметки </td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ainin:CustomsMark"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Признак составления АТДО в сокращенной форме</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="ainin:ShortFormSign='1' or ainin:ShortFormSign='true'">
										<xsl:text>да</xsl:text>
									</xsl:when>
									<xsl:when test="ainin:ShortFormSign='0' or ainin:ShortFormSign='false'">
										<xsl:text>нет</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="ainin:ShortFormSign"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="ainin:EndComposeDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата / время завершения составления АТДО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ainin:EndComposeDate"/>
									</xsl:call-template>
									<xsl:if test="ainin:EndComposeTime">
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(ainin:EndComposeTime, 1,8)"/>
									</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ainin:ATDRegNumber">
						<div class="title marg-top">Регистрационный номер акта таможенного досмотра</div>
					</xsl:if>
					<xsl:apply-templates select="ainin:ATDRegNumber"/>
					<xsl:if test="ainin:InstructionNumber"/>
					<xsl:if test="ainin:InstructionNumber">
						<div class="title marg-top">Сведения  о поручении на досмотр</div>
					</xsl:if>
					<xsl:apply-templates select="ainin:InstructionNumber"/>
					<xsl:if test="ainin:InspectionPlace">
						<div class="title marg-top">Описание места проведения досмотра. Иная информация о месте досмотра</div>
					</xsl:if>
					<xsl:apply-templates select="ainin:InspectionPlace"/>
					<xsl:if test="ainin:InspPerson">
						<div class="title marg-top">Присутствующие лица</div>
						<xsl:apply-templates select="ainin:InspPerson"/>
					</xsl:if>
					<xsl:if test="ainin:InspTransport">
						<div class="title marg-top">Сведения о транспортных  средствах</div>
						<xsl:apply-templates select="ainin:InspTransport"/>
					</xsl:if>
					<xsl:if test="ainin:InspectionInfo">
						<div class="title marg-top">Информация о проведенном досмотре</div>
					</xsl:if>
					<xsl:apply-templates select="ainin:InspectionInfo"/>
					<xsl:if test="ainin:ATDTechOperation">
						<div class="title marg-top">Информация о технологической операции</div>
						<xsl:apply-templates select="ainin:ATDTechOperation"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="ainin:Address">
		<xsl:if test="cat_ru:CountryCode">
			<xsl:text>(</xsl:text>
				<xsl:value-of select="cat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<xsl:text>Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики): </xsl:text>
			<xsl:value-of select="cat_ru:TerritoryCode"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
				<xsl:if test="cat_ru:PostalCode">
			<xsl:text>Почтовый индекс: </xsl:text>
			<xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_ru:ATDCustomPersonType -->
	<xsl:template match="ainin:ATDCustomPerson">
		<tr bgcolor="#e3e3e3">
			<td class="value graphMain" style="width:50%"><b>ФИО</b></td>
			<td class="value graphMain" style="width:50%">
				<b>
				<xsl:value-of select="cat_ru:PersonSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonMiddleName"/>
				</b>
			</td>
		</tr>
		<xsl:if test="cat_ru:PersonPost">
			<tr>
				<td class="annot graphMain" style="width:50%">Должность</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost"/></td>	
			</tr>		
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Признак, подтверждающий факт подписи АТД</td>
			<td class="value graphMain" style="width:50%">			
				<xsl:choose>
					<xsl:when test="catESAD_ru:SignatureFlag='true'">есть</xsl:when>
					<xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<xsl:if test="catESAD_ru:LNP">
			<tr>
				<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="catESAD_ru:LNP"/></td>	
			</tr>		
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Статус должностного лица при проведении таможенного досмотра</td>
			<td class="value graphMain" style="width:50%">			
				<xsl:choose>
					<xsl:when test="catESAD_ru:OfficialStatus='1'">
						<xsl:text>проведение досмотра</xsl:text>
					</xsl:when>
					<xsl:when test="catESAD_ru:OfficialStatus='2'">
						<xsl:text>присутствовало при досмотре</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="catESAD_ru:OfficialStatus"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Тип присутствующего лица</td>
			<td class="value graphMain" style="width:50%">			
				<xsl:choose>
					<xsl:when test="catESAD_ru:OTOFlag=1">
						<xsl:text>должностное лицо, не являющееся должностным лицом таможенного поста(ОТОиТК)</xsl:text>
					</xsl:when>
					<xsl:when test="catESAD_ru:OTOFlag=2">
						<xsl:text>уполномоченное должностное лицо таможенного поста (ОТОиТК)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="catESAD_ru:OTOFlag"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<xsl:if test="catESAD_ru:LawAct">
			<tr>
				<td class="annot graphMain" style="width:50%">Основание для присутствия при таможенном досмотре должностных лиц, не являющихся должностными лицами таможенного поста (ОТОиТК)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="catESAD_ru:LawAct"/></td>	
			</tr>		
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Порядковый номер записи в таблице БД</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="catESAD_ru:RecordNumber"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ainin:OperationInfoType -->
	<xsl:template match="ainin:ATDOperationInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:LNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:LNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип документа </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ainin:OperationDocCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ainin:OperationDocNum"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ainin:OperationDocDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDID6Type -->
	<xsl:template match="ainin:ATDRegNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:SerialNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ainin:TechOperationType -->
	<xsl:template match="ainin:ATDTechOperation">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата внесения информации о технологической операции</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ainin:TechOperationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:ATDOperationInfo">
			<div class="title marg-top">Информация об операции (номер документа, должностное лицо ТО)</div>
		</xsl:if>
		<xsl:apply-templates select="ainin:ATDOperationInfo"/>
		<xsl:if test="ainin:ModifiedATDNum"/>
		<xsl:if test="ainin:ModifiedATDNum">
			<div class="title marg-top">Исправленное значение номера АТД</div>
		</xsl:if>
		<xsl:apply-templates select="ainin:ModifiedATDNum"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AuthoritesDocumentType -->
	<xsl:template match="ainin:AuthoritesDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> выдан: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:ComplationAuthorityDate">
			<xsl:text> Дата окончания полномочий: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:ComplationAuthorityDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:ContainerType -->
	<xsl:template match="ainin:Container">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Количество контейнеров. </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ainin:ContainerQuantity"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер (идентификатор) контейнера.</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="ainin:ContainerIdentificator">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ainin:FactWeightInfoType -->
	<xsl:template match="ainin:FactWeightInfo">
		<xsl:if test="ainin:WeightNettoFact">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Фактический вес товара нетто, кг</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(ainin:WeightNettoFact, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ainin:WeightBruttoFact">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Фактический вес товара брутто, кг</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(ainin:WeightBruttoFact, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Способ определения фактического веса товаров</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:WeightMethodKind=1">
							<xsl:text>фактическое взвешивание</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:WeightMethodKind=2">
							<xsl:text>определение среднего веса одного места взвешиванием нескольких мест</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:WeightMethodKind=3">
							<xsl:text>расчетный метод</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:WeightMethodKind=4">
							<xsl:text>прочее</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ainin:WeightMethodKind"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:WeightMetodDesc">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Примечание к способу взвешивания: количество взвешенных мест, способов расчетов, описание прочего способа взвешивания.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ainin:WeightMetodDesc"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:IdentifyMeanType -->
	<xsl:template match="ainin:IdentifyMean">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ainin:IdentMeanState=1">средство идентификации до начала проведения таможенного досмотра</xsl:when>
					<xsl:when test="ainin:IdentMeanState=2">средство идентификации после проведения таможенного досмотра (наложенные)</xsl:when>
					<xsl:otherwise><xsl:value-of select="ainin:IdentMeanState"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:IdentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ainin:IdentBreakFlag=0 or ainin:IdentBreakFlag='false'"><xsl:text>не нарушено</xsl:text></xsl:when>
					<xsl:when test="ainin:IdentBreakFlag=1 or ainin:IdentBreakFlag='true'"><xsl:text>нарушено</xsl:text></xsl:when>
					<xsl:otherwise><xsl:value-of select="ainin:IdentBreakFlag"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ainin:IdentKind=1"><xsl:text>пломба</xsl:text></xsl:when>
					<xsl:when test="ainin:IdentKind=2"><xsl:text>печать</xsl:text></xsl:when>
					<xsl:when test="ainin:IdentKind=3"><xsl:text>иное</xsl:text></xsl:when>
					<xsl:otherwise><xsl:value-of select="ainin:IdentKind"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:IdentDesc"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:RecordNumber"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="ainin:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<xsl:text>(код вида документа: </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:text>) </xsl:text>		
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<xsl:text>серия: </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:text>выдан </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:IdentityMeansInfoType -->
	<xsl:template match="ainin:IdentityMeansInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Кол-во средств идентификации до начала проведения досмотра</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:IdentBeforeNum=0">без средств идентификации</xsl:when>
						<xsl:otherwise><xsl:value-of select="ainin:IdentBeforeNum"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:IdentCrashFlag">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак нарушения средств идентификации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="ainin:IdentCrashFlag='0' or ainin:IdentCrashFlag='false'">
								<xsl:text>не нарушены</xsl:text>
							</xsl:when>
							<xsl:when test="ainin:IdentCrashFlag='1' or ainin:IdentCrashFlag='true'">
								<xsl:text>нарушены</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="ainin:IdentCrashFlag"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Кол-во наложенных средств идентификации после проведения таможенного досмотра</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:IdentEndNum=0">без средств идентификации</xsl:when>
						<xsl:otherwise><xsl:value-of select="ainin:IdentEndNum"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:IdentMeansDesc">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общие примечания по средствам идентификации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ainin:IdentMeansDesc"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ainin:IdentifyMean">
			<div class="title marg-top">Cредство идентификации</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Статус средства идентификации </td>
						<td class="graphMain bordered">Номер наложенного средства идентификации</td>
						<td class="graphMain bordered">Признак нарушения средств идентификации</td>
						<td class="graphMain bordered">Вид средств идентификации</td>
						<td class="graphMain bordered">Примечание по средству идентификации</td>
						<td class="graphMain bordered">Порядковый номер записи в таблице БД</td>
					</tr>
					<xsl:for-each select="ainin:IdentifyMean">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="ainin:InspAddress">
		<xsl:if test="cat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspectionDocumentType -->
	<xsl:template match="ainin:InspectionDocument">
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
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:PresentedDocumentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:CustWaybillNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:RecordNumber"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspectionInfoType -->
	<xsl:template match="ainin:InspectionInfo">
		<xsl:if test="ainin:InspItemNum">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество мест товара (партий товара), предъявленных к таможенному досмотру (по документам)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ainin:InspItemNum"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ainin:GrossWeightDocs">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общий вес брутто товаров по документам (кг.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(ainin:GrossWeightDocs, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ainin:ViolationSign">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак нарушения таможенного законодательства при пересылке товаров в МПО в адрес физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="ainin:ViolationSign='0' or ainin:ViolationSign='false'">
								<xsl:text>не выявлено</xsl:text>
							</xsl:when>
							<xsl:when test="ainin:ViolationSign='1' or ainin:ViolationSign='true'">
								<xsl:text>выявлено</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="ainin:ViolationSign"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ainin:InspGTDNum">
			<div class="title marg-top">Номер ДТ в которой заявлены сведения о досматриваемых  товарах</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Номер ДТ</td>
						<!--td class="graphMain bordered">Код таможенного органа, зарегистрировавшего документ</td>
						<td class="graphMain bordered">Дата регистрации документа</td>
						<td class="graphMain bordered">Порядковый номер документа по журналу регистрации</td-->
						<td class="graphMain bordered">Порядковый номер записи в таблице БД</td>
					</tr>
					<xsl:for-each select="ainin:InspGTDNum">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="ainin:FactWeightInfo">
			<div class="title marg-top">Сведения об общем фактическом весе товаров</div>
		</xsl:if>
		<xsl:apply-templates select="ainin:FactWeightInfo"/>
		<xsl:if test="ainin:InspRadiationInfo">
			<div class="title marg-top">Измерение уровня радиационного излучения</div>
		</xsl:if>
		<xsl:apply-templates select="ainin:InspRadiationInfo"/>
		<xsl:if test="ainin:IdentityMeansInfo">
			<div class="title marg-top">Средства идентификации</div>
			<xsl:apply-templates select="ainin:IdentityMeansInfo"/>
		</xsl:if>
		<xsl:if test="ainin:InspectionResult">
			<div class="title marg-top">Результаты таможенного досмотра</div>
		</xsl:if>
		<xsl:apply-templates select="ainin:InspectionResult"/>
		<div class="title marg-top">АТД - документ по которому проведен таможенный досмотр</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Наименование документа</td>
					<td class="graphMain bordered">Номер документа</td>
					<td class="graphMain bordered">Дата документа</td>
					<td class="graphMain bordered">Код вида документа</td>
					<td class="graphMain bordered">Таможенный номер накладной</td>
					<td class="graphMain bordered">Порядковый номер записи в таблице БД</td>
				</tr>
				<xsl:for-each select="ainin:InspectionDocument">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
		<xsl:if test="ainin:InspGoods">
			<div class="title marg-top">Сведения о товаре</div>
			<table class="bordered w190">
				<xsl:for-each select="ainin:InspGoods">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
		<xsl:if test="ainin:UseTMCC">
			<div class="title marg-top">Применяемые технические средства таможенного контроля</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Код применяемых ТСТК</td>
						<td class="graphMain bordered">Комментарии</td>
					</tr>
					<xsl:for-each select="ainin:UseTMCC">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="ainin:MPO">
			<div class="title marg-top">Сведения о предъявленном МПО</div>
			<xsl:apply-templates select="ainin:MPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspectionParticipantType -->
	<xsl:template match="ainin:InspectionParticipant">
		<tr bgcolor="#e3e3e3">
			<td class="value graphMain" style="width:50%"><b>ФИО</b></td>
			<td class="value graphMain" style="width:50%">
				<b>
				<xsl:value-of select="cat_ru:PersonSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonMiddleName"/>
				</b>
			</td>
		</tr>
		<xsl:if test="cat_ru:PersonPost">
			<tr>
				<td class="annot graphMain" style="width:50%">Должность</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost"/></td>	
			</tr>		
		</xsl:if>
		<xsl:if test="ainin:Job">
			<tr>
				<td class="annot graphMain" style="width:50%">Место работы</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ainin:Job"/></td>	
			</tr>		
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Признак, подтверждающий факт подписи АТД</td>
			<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="ainin:SignatureFlag='true' or ainin:SignatureFlag='1'"> 
						<xsl:text>подписано</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>не подписано</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>	
		</tr>		
		<tr>
			<td class="annot graphMain" style="width:50%">Статус или должность лица, присутствующего при досмотре (осмотре)</td>
			<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="ainin:Status=3">
						<xsl:text>декларант (иное лицо</xsl:text>
					</xsl:when>
					<xsl:when test="ainin:Status=4">
						<xsl:text>понятой</xsl:text>
					</xsl:when>
					<xsl:when test="ainin:Status=5">
						<xsl:text>эксперт</xsl:text>
					</xsl:when>
					<xsl:when test="ainin:Status=6">
						<xsl:text>оператор почтовой связи</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ainin:Status"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>	
		</tr>		
		<xsl:if test="ainin:ATDRecriveDate or ainin:ATDReceiveTime">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата / время получения второго экземпляра на руки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ainin:ATDRecriveDate"/>
					</xsl:call-template>
					<xsl:if test="ainin:ATDReceiveTime"><br/><xsl:value-of select="substring(ainin:ATDReceiveTime, 1,8)"/></xsl:if>
				</td>
			</tr>		
		</xsl:if>
		<xsl:if test="ainin:Reason">
			<tr>
				<td class="annot graphMain" style="width:50%">Причина проведения таможенного досмотра в отсутствие декларанта</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ainin:Reason"/></td>	
			</tr>		
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Признак, подтверждающий факт получения второго экземпляра АТД представителем декларанта</td>
			<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="ainin:ATDReceiveCopy='true' or ainin:ATDReceiveCopy='1'">получено</xsl:when>
					<xsl:otherwise>не получено</xsl:otherwise>
				</xsl:choose>
			</td>	
		</tr>		
		<xsl:if test="ainin:AddresseeMPO">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер МПО, с которым направлен второй АТД</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ainin:AddresseeMPO"/></td>	
			</tr>		
		</xsl:if>
		<xsl:if test="ainin:IdentityCard">
			<tr>
				<td class="annot graphMain" style="width:50%">Документ, удостоверяющий личность</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="ainin:IdentityCard"/></td>	
			</tr>		
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Адрес</td>
			<td class="value graphMain" style="width:50%"><xsl:apply-templates select="ainin:Address"/></td>	
		</tr>		
		<xsl:if test="ainin:AuthoritesDocument">
			<tr>
				<td class="annot graphMain" style="width:50%">Документ, подтверждающий полномочия</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="ainin:AuthoritesDocument"/></td>	
			</tr>		
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Порядковый номер записи в таблице БД</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="ainin:RecordNumber"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspectionPlaceType -->
	<xsl:template match="ainin:InspectionPlace">
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
				<td class="annot graphMain" style="width:50%">Тип информации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:InformationTypeCode='11'"><xsl:text>СВХ</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='21'"><xsl:text>ТС</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='25'"><xsl:text>Свободный склад</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='31'"><xsl:text>Склад получателя</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='41'"><xsl:text>Склад хранения собственных товаров (для РК)</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='52'"><xsl:text>Транспортное средство (для РК)</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='60'"><xsl:text>Помещение (площадки) УЭО</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='72'"><xsl:text>ЗТК (для РБ)</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='91'"><xsl:text>Адрес места хранения  (для РБ)</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='99'"><xsl:text>Иное место ВХ</xsl:text></xsl:when>
						<xsl:when test="ainin:InformationTypeCode='80'"><xsl:text>ОЭЗ</xsl:text></xsl:when>
						<xsl:otherwise><xsl:value-of select="ainin:InformationTypeCode"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование места досмотра, СВХ, ж/д станции</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ainin:InspPlaceName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:InspPlaceDesc">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание места проведения досмотра. Иная информация о месте досмотра</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="ainin:InspPlaceDesc">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ainin:InspAddress">
			<div class="title marg-top">Адрес места досмотра (заполняется, в случае досмотра вне СВХ)</div>
			<xsl:apply-templates select="ainin:InspAddress"/>
		</xsl:if>
		<xsl:if test="ainin:WarehousePlace">
			<div class="title marg-top">Сведения об СВХ/ЗТК</div>
			<xsl:apply-templates select="ainin:WarehousePlace"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspectionResultType -->
	<xsl:template match="ainin:InspectionResult">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак взятия проб и образцов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:SeizureFlag='0'">пробы и образцы не отбирались</xsl:when>
						<xsl:when test="ainin:SeizureFlag='1'">пробы и образцы отбирались</xsl:when>
						<xsl:otherwise><xsl:value-of select="ainin:SeizureFlag"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак наличия административного правонарушения, отнесенного к компетенции таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:ViolationFlag='0' or ainin:ViolationFlag='false'">
							<xsl:text>нет признаков административного правонарушения</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:ViolationFlag='1' or ainin:ViolationFlag='true'">
							<xsl:text>есть признаки административного правонарушения</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ainin:ViolationFlag"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:ATDAdditions">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание приложений к Акту досмотра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ainin:ATDAdditions"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ainin:LawDecision">
			<div class="title marg-top">Статьи КОАП по которым выявлены признаки АП. <br/>Общая описательная часть акта досмотра, относящаяся ко всем товарам</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Номер статьи КоАП РФ, предусматривающей ответственность за совершение административного правонарушения</td>
						<td class="graphMain bordered">Номер части статьи КоАП РФ</td>
						<td class="graphMain bordered">Примечание по принятым решениям / Общая описательная часть акта досмотра</td>
						<td class="graphMain bordered">Порядковый номер записи</td>
						<td class="graphMain bordered">Признак информации</td>
					</tr>
					<xsl:for-each select="ainin:LawDecision">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="ainin:InspTestAct">
			<div class="title marg-top">Акт взятия проб и образцов</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
						<td class="graphMain bordered">Дата взятия проб и образцов</td>
						<td class="graphMain bordered">Примечание к акту взятия проб и образцов</td>
						<td class="graphMain bordered">Порядковый номер записи в таблице БД</td>
					</tr>
					<xsl:for-each select="ainin:InspTestAct">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspGoodsType -->
	<xsl:template match="ainin:InspGoods">
		<tr bgcolor="#e3e3e3">
			<td class="value graphMain" style="width:50%"><b>Товар № <xsl:value-of select="cat_ru:GoodsNumeric"/></b></td>
			<td class="value graphMain" style="width:50%">
				<b>
				<xsl:if test="cat_ru:GoodsTNVEDCode">(код по ТН ВЭД ЕАЭС: <xsl:value-of select="cat_ru:GoodsTNVEDCode"/>) </xsl:if>
				<xsl:for-each select="cat_ru:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
				</b>
			</td>
		</tr>
		<xsl:if test="cat_ru:GrossWeightQuantity">
			<tr>
				<td class="annot graphMain" style="width:50%">Вес товара брутто (кг)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(cat_ru:GrossWeightQuantity, '.', ',')"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:NetWeightQuantity">
			<tr>
				<td class="annot graphMain" style="width:50%">Вес товара нетто (кг)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(cat_ru:NetWeightQuantity, '.', ',')"/></td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Вес брутто товаров по документам (кг)</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(ainin:DocBruttoWeight, '.', ',')"/></td>
		</tr>
		<xsl:if test="ainin:CountryCode or ainin:CountryName">
			<tr>
				<td class="annot graphMain" style="width:50%">Cтрана изготовления (производства) товара (согласно маркировке)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:if test="ainin:CountryCode">(<xsl:value-of select="ainin:CountryCode"/>) </xsl:if>
					<xsl:value-of select="ainin:CountryName"/>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Источник информации о стране изготовления (производства) товара</td>
			<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="ainin:CountrySrcFlag = '1'">маркировка на товаре </xsl:when>
					<xsl:when test="ainin:CountrySrcFlag = '2'">маркировка на упаковке </xsl:when>
					<xsl:when test="ainin:CountrySrcFlag = '3'">сведения из документов </xsl:when>
					<xsl:when test="ainin:CountrySrcFlag = '4'">другие источники: <xsl:value-of select="ainin:CountrySrcDesc"/></xsl:when>
					<xsl:otherwise><xsl:value-of select="ainin:CountrySrcFlag"/> </xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Наличие повреждения товаров и упаковки</td>
			<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="ainin:GoodsDamageFlag='0' or ainin:GoodsDamageFlag='false'">повреждения отсутствуют</xsl:when>
					<xsl:when test="ainin:GoodsDamageFlag='1' or ainin:GoodsDamageFlag='true'">товар поврежден: <xsl:value-of select="ainin:DamageDesc"/></xsl:when>
					<xsl:otherwise><xsl:value-of select="ainin:GoodsDamageFlag"/></xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<xsl:if test="ainin:GoodsViolationFlag">
			<tr>
				<td class="annot graphMain" style="width:50%">Выявленные несоответствия относительно имеющихся у инспектора документов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:GoodsViolationFlag='1'">по весу нетто</xsl:when>
						<xsl:when test="ainin:GoodsViolationFlag='2'">по количеству товаров</xsl:when>
						<xsl:when test="ainin:GoodsViolationFlag='3'">по описанию</xsl:when>
						<xsl:when test="ainin:GoodsViolationFlag='4'">по иным признакам: <xsl:value-of select="ainin:GoodsViolationDesc"/></xsl:when>
						<xsl:otherwise><xsl:value-of select="ainin:GoodsViolationFlag"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Признак взятия проб и образцов</td>
			<td class="value graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="ainin:GoodsTestFlag='0'">пробы и образцы товара не отбирались</xsl:when>
					<xsl:when test="ainin:GoodsTestFlag='1'">пробы и образцы товара отбирались</xsl:when>
					<xsl:otherwise><xsl:value-of select="ainin:GoodsTestFlag"/></xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Номер товара по ДТ</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="ainin:GoodsNumericDT"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Порядковый номер записи в таблице БД</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="ainin:RecordNumber"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<xsl:if test="ainin:PackageInfo">
					<div class="title marg-top">АТД - сведения об упаковках</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Код вида упаковки товаров в соответствии с классификатором видов груза, упаковки и упаковочных материалов</td>
									<td class="graphMain bordered">Количество упаковок</td>
									<td class="graphMain bordered">Описание упаковки и расфасовки товара</td>
									<td class="graphMain bordered">Признак наличия повреждений товаров и упаковки</td>
									<td class="graphMain bordered">Описание повреждений упаковки</td>
									<td class="graphMain bordered">Порядковый номер записи в таблице БД</td>
								</tr>
							</tr>
							<xsl:for-each select="ainin:PackageInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<xsl:if test="ainin:SupplementaryQuantity">
					<xsl:apply-templates select="ainin:SupplementaryQuantity"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<xsl:if test="ainin:CargoInfo">
					<div class="title marg-top">Сведения о виде груза</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Код вида упаковки товаров в соответствии с классификатором видов груза, упаковки и упаковочных материалов</td>
									<td class="graphMain bordered">Количество упаковок</td>
									<td class="graphMain bordered">Описание упаковки и расфасовки товара</td>
									<td class="graphMain bordered">Признак наличия повреждений товаров и упаковки</td>
									<td class="graphMain bordered">Описание повреждений упаковки</td>
									<td class="graphMain bordered">Порядковый номер записи в таблице БД</td>
								</tr>
							</tr>
							<xsl:for-each select="ainin:CargoInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<xsl:if test="ainin:PlaceInfo">
					<div class="title marg-top">Сведения о таре (потребительской / индивидуальной)</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Код вида упаковки товаров в соответствии с классификатором видов груза, упаковки и упаковочных материалов</td>
									<td class="graphMain bordered">Количество упаковок</td>
									<td class="graphMain bordered">Описание упаковки и расфасовки товара</td>
									<td class="graphMain bordered">Признак наличия повреждений товаров и упаковки</td>
									<td class="graphMain bordered">Описание повреждений упаковки</td>
									<td class="graphMain bordered">Порядковый номер записи в таблице БД</td>
								</tr>
							</tr>
							<xsl:for-each select="ainin:PlaceInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<xsl:if test="ainin:PalleteInfo">
					<div class="title marg-top">Сведения о поддонах / палетах</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Код вида упаковки товаров в соответствии с классификатором видов груза, упаковки и упаковочных материалов</td>
									<td class="graphMain bordered">Количество упаковок</td>
									<td class="graphMain bordered">Описание упаковки и расфасовки товара</td>
									<td class="graphMain bordered">Признак наличия повреждений товаров и упаковки</td>
									<td class="graphMain bordered">Описание повреждений упаковки</td>
									<td class="graphMain bordered">Порядковый номер записи в таблице БД</td>
								</tr>
							</tr>
							<xsl:for-each select="ainin:PalleteInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<br/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspGTDType -->
	<xsl:template match="ainin:InspGTDNum">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:CustomsCode"/>
				<xsl:text>/</xsl:text>
				<xsl:call-template name="gtd_date">
					<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
				</xsl:call-template>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="cat_ru:GTDNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:RecordNumber"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspPersonType -->
	<xsl:template match="ainin:InspPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак присутствия заинтересованных лиц при проведении досмотра</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:PersonFlag='true'">
							<xsl:text>есть</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>нет</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<div class="title marg-top">Должностное лицо ТО, присутствовавшее при досмотре</div>
		<table class="w190">
			<xsl:for-each select="ainin:ATDCustomPerson">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
		<xsl:if test="ainin:InspectionParticipant">
			<div class="title marg-top">Лицо, присутствующее при досмотре (осмотре)</div>
			<table class="w190">
				<xsl:for-each select="ainin:InspectionParticipant">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspRadiationInfoType -->
	<xsl:template match="ainin:InspRadiationInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уровень радиационного фона </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(ainin:RadValue, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование прибора, которым проводились измерения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ainin:RadDeviceName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:DeviceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Свидетельство о поверке используемого оборудования</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ainin:DeviceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspTestActType -->
	<xsl:template match="ainin:InspTestAct">
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
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ainin:SeizureDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:SeizureActDesc"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:RecordNumber"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspTransportType -->
	<xsl:template match="ainin:InspTransport">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Транспортное средство (транспортные средства) прибыло (и) в качестве товара</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:ArriveMode=1">
							<xsl:text>на транспортном средстве</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:ArriveMode=2">
							<xsl:text>в контейнере(ах)</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:ArriveMode=3">
							<xsl:text>своим ходом</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ainin:ArriveMode"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:InspTransportMean">
			<div class="title marg-top">Описание транспортного средства</div>
			<xsl:apply-templates select="ainin:InspTransportMean"/>
		</xsl:if>
		<xsl:if test="ainin:Container">
			<div class="title marg-top">Сведения о контейнерах.</div>
			<xsl:apply-templates select="ainin:Container"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspTransportMeanType -->
	<xsl:template match="ainin:InspTransportMean">
		<xsl:if test="cat_ru:TransportModeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TransportModeCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TransportNationalityCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны принадлежности (регистрации) транспортных средств по классификатору стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="cat_ru:TransportNationalityCode=99">
								<xsl:text>разные</xsl:text>
							</xsl:when>
							<xsl:when test="cat_ru:TransportNationalityCode=00">
								<xsl:text>неизвестна</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_ru:TransportNationalityCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ainin:TransportMeans">
			<div class="title marg-top">Транспортные средства</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Номер шасси (VIN)</td>
						<td class="graphMain bordered">Код типа транспортного средства</td>
						<td class="graphMain bordered">Код марки транспортного средства</td>
						<td class="graphMain bordered">Идентификатор</td>
						<td class="graphMain bordered">Буквенный код страны принадлежности транспортного средства</td>
						<td class="graphMain bordered">Идентификатор активного транспортного средства для прицепов, полуприцепов и др.</td>
						<td class="graphMain bordered">Номер свидетельства о регистрации транспортного средства для РБ</td>
					</tr>
					<xsl:for-each select="ainin:TransportMeans">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspInstructionType -->
	<xsl:template match="ainin:InstructionNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Время выдачи поручения на досмотр</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="substring(ainin:Time, 1,8)"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер поручения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ainin:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="gtd_date">
						<xsl:with-param name="dateIn" select="ainin:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="ainin:PTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ainin:LawDecisionType -->
	<xsl:template match="ainin:LawDecision">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:ArticleNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:ArticlePartNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:DecisionDesc"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:RecordNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ainin:PriznInfo='false' or ainin:PriznInfo='0'">
						<xsl:text>примечания по принятым решениям</xsl:text>
					</xsl:when>
					<xsl:when test="ainin:PriznInfo='true' or ainin:PriznInfo='1'">
						<xsl:text>общая описательная часть акта досмотра, относящаяся ко всем товарам</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ainin:PriznInfo"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDID6Type -->
	<xsl:template match="ainin:ModifiedATDNum">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:SerialNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ainin:MPOType -->
	<xsl:template match="ainin:MPO">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ainin:MPO_Number"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:MPO_Name=1">
							<xsl:text>почтовая карточка</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_Name=2">
							<xsl:text>письмо</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_Name=3">
							<xsl:text>бандероль</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_Name=4">
							<xsl:text>мелкий пакет</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_Name=5">
							<xsl:text>секограмма</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_Name=6">
							<xsl:text>посылка</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_Name=7">
							<xsl:text>мешок «М»</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_Name=8">
							<xsl:text>отправление EMS</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_Name=9">
							<xsl:text>аэрограмма</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ainin:MPO_Name"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак повреждения МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ainin:MPO_DamageFlag='0' or ainin:MPO_DamageFlag='false'">
							<xsl:text>повреждения отсутствуют</xsl:text>
						</xsl:when>
						<xsl:when test="ainin:MPO_DamageFlag='1' or ainin:MPO_DamageFlag='true'">
							<xsl:text>повреждено</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ainin:MPO_DamageFlag"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="ainin:DamageDesc">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание повреждения МПО</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="ainin:DamageDesc">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ainin:InspPackageType -->
	<xsl:template match="ainin:PackageInfo| ainin:PalleteInfo| ainin:PlaceInfo| ainin:CargoInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:PackingCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:PakingQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:PackageDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ainin:PackDestructFlag='0'">повреждений нет</xsl:when>
					<xsl:when test="ainin:PackDestructFlag='1'">повреждения есть</xsl:when>
					<xsl:otherwise><xsl:value-of select="ainin:PackDestructFlag"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:PackDestructDesc"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:RecordNumber"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="ainin:SupplementaryQuantity">
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
	<!-- Шаблон для типа cat_ru:TransportMeansBaseType -->
	<xsl:template match="ainin:TransportMeans">
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
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ainin:UseTMCCType -->
	<xsl:template match="ainin:UseTMCC">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:TSTKCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ainin:Comments"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ainin:WarehousePlaceType -->
	<xsl:template match="ainin:WarehousePlace">
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
		<xsl:if test="ainin:DocumentModeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="ainin:DocumentModeCode=0">Лицензия</xsl:when>
							<xsl:when test="ainin:DocumentModeCode=1">Свидетельство</xsl:when>
							<xsl:otherwise><xsl:value-of select="ainin:DocumentModeCode"/></xsl:otherwise>
						</xsl:choose>
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
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
