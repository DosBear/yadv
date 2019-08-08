<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:apzk="urn:customs.ru:Information:CustomsDocuments:ATDCloseControl:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ATDCloseControlType -->
	<xsl:template match="apzk:ATDCloseControl">
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
					width: 270mm;
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
					font-size: 10pt;
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
										<b>Протокол завершения контроля к АТД</b>
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
					<xsl:if test="apzk:CheckDate or apzk:CheckTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время проведения проверки</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="apzk:CheckDate"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(apzk:CheckTime, 1,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="apzk:EndCheckDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата, на которую выполнена проверка</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="apzk:EndCheckDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="apzk:DBVersion">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Версия структуры внутреннего формата электронной копии</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="apzk:DBVersion"/></td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Общее количество ошибок ПЗК</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="apzk:ErrorCount"/></td>
						</tr>
					</table>
					<xsl:if test="apzk:ReasonCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код причины повторной передачи электронной копии декларации после ее возврата с вышестоящего уровня системы</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="apzk:ReasonCode"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="apzk:Explanation">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Объяснение инспектора о несвоевременности или неполноте представления информации по результатам ФЛК</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="apzk:Explanation"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="apzk:ExplanationDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата внесения объяснения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="apzk:ExplanationDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор акта таможенного досмотра</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="apzk:ATDGlobalID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="apzk:ATDRegNumder">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер АТД</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="apzk:ATDRegNumder"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="apzk:Document">
						<div class="title marg-top">Проверенный электронный таможенный документ</div>
						<xsl:apply-templates select="apzk:Document"/>
					</xsl:if>
					<xsl:if test="apzk:PSCheck">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Программное средство, выполнившее проверку</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="apzk:PSCheck"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="apzk:PZKErrors">
						<div class="title marg-top">Ошибки</div>
						<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered" rowspan="2">Номер товара</td>
								<td class="graphMain bordered" rowspan="2">Информация в таблице внутреннего формата электронной копии </td>
								<td class="graphMain bordered" rowspan="2">Описание ошибки</td>
								<td class="graphMain bordered" rowspan="2">Нормативный документ, в соответствии с которым выполняется контроль</td>
								<td class="graphMain bordered" colspan="5" align="center">Причины закрытия</td>
							</tr>
							<tr class="title">
								<td class="graphMain bordered">Код причины закрытия</td>
								<td class="graphMain bordered">Примечания инспектора</td>
								<td class="graphMain bordered">ЛНП инспектора</td>
								<td class="graphMain bordered">Дата закрытия ошибки по ПЗК</td>
								<td class="graphMain bordered">Нормативный документ, в соответствии с которым выполняется закрытие</td>
							</tr>
							<xsl:for-each select="apzk:PZKErrors">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа apzk:ATDinTableType -->
	<xsl:template match="apzk:ATDinTable">
		<xsl:if test="apzk:TableName">
			<xsl:text>таблица: </xsl:text>
			<xsl:value-of select="apzk:TableName"/>
			<br/>
		</xsl:if>
		<xsl:if test="apzk:AttributeName">
			<xsl:text>атрибут таблицы: </xsl:text>
			<xsl:value-of select="apzk:AttributeName"/>
			<br/>
		</xsl:if>
		<xsl:if test="apzk:RecordNumber">
			<xsl:text>запись № </xsl:text>
			<xsl:value-of select="apzk:RecordNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDID6Type -->
	<xsl:template match="apzk:ATDRegNumder">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:SerialNumber"/>
	</xsl:template>
	<!-- Шаблон для типа apzk:CheckNormativeDocumentType -->
	<xsl:template match="apzk:CheckNormativeDocument">
		<xsl:if test="apzk:DocumentType">
			<xsl:value-of select="apzk:DocumentType"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:text>№ </xsl:text>
		<xsl:value-of select="apzk:DocumentNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="apzk:DocumentDate"/>
		</xsl:call-template>
		<xsl:text> принят:  </xsl:text>
		<xsl:value-of select="apzk:OrganizationName"/>
		<xsl:if test="apzk:BeginDate or apzk:EndDate">
			<br/><xsl:text> период действия:  </xsl:text>
			<xsl:if test="apzk:BeginDate">
				c 
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="apzk:BeginDate"/>
				</xsl:call-template>
			</xsl:if>			
			<xsl:if test="apzk:EndDate">
				по 
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="apzk:EndDate"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apzk:CloseReasonType -->
	<xsl:template match="apzk:CloseReason">
		<td class="graphMain bordered"><xsl:value-of select="apzk:ReasonCode"/></td>
		<td class="graphMain bordered"><xsl:value-of select="apzk:InspectorNotice"/></td>
		<td class="graphMain bordered"><xsl:value-of select="apzk:LNP"/></td>
		<td class="graphMain bordered">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="apzk:CloseDate"/>
			</xsl:call-template>
		</td>
		<td class="graphMain bordered"><xsl:apply-templates select="apzk:CheckNormativeDocument"/></td>
	</xsl:template>
	<!-- Шаблон для типа apzk:DocumentType -->
	<xsl:template match="apzk:Document">
		<xsl:if test="apzk:Kind">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Способ указания проверяемого документа</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="apzk:Kind"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код типа электронного таможенного документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="apzk:EDCode=2">АТД</xsl:when>
						<xsl:otherwise><xsl:value-of select="apzk:EDCode"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="apzk:EDRef">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Ссылка на документ</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="apzk:EDRef"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apzk:ErrorType -->
	<xsl:template match="apzk:Error">
		<xsl:value-of select="apzk:ErrorCode"/>
		<xsl:choose>
			<xsl:when test="apzk:ErrorLevel=3"><span style="color:maroon"> критическая ошибка </span></xsl:when>
			<xsl:when test="apzk:ErrorLevel=2"><span style="color:red"> ошибка </span></xsl:when>
			<xsl:when test="apzk:ErrorLevel=1"><span style="color:orange">  рекомендация </span></xsl:when>
			<xsl:otherwise> <xsl:value-of select="apzk:ErrorLevel"/> </xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="apzk:ErrorText"/>
		<xsl:if test="apzk:ErrorDescription">
			<br/>
			<i><xsl:value-of select="apzk:ErrorDescription"/></i>
		</xsl:if>
		<xsl:if test="apzk:TrueValue">
			<br/>
			<xsl:text>правильное значение: </xsl:text>
			<xsl:value-of select="apzk:TrueValue"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apzk:PSCheckType -->
	<xsl:template match="apzk:PSCheck">
		<xsl:value-of select="apzk:PSID"/>
		<xsl:text> версия: </xsl:text>
		<xsl:value-of select="apzk:PSVersion"/>
	</xsl:template>
	<!-- Шаблон для типа apzk:PZKErrorsType -->
	<xsl:template match="apzk:PZKErrors">
		<tr>
			<td class="graphMain bordered" rowspan="{count(apzk:CloseReason)}"><xsl:value-of select="apzk:ATDGoodsNumber"/></td>
			<td class="graphMain bordered" rowspan="{count(apzk:CloseReason)}"><xsl:apply-templates select="apzk:ATDinTable"/></td>
			<td class="graphMain bordered" rowspan="{count(apzk:CloseReason)}"><xsl:apply-templates select="apzk:Error"/></td>
			<td class="graphMain bordered" rowspan="{count(apzk:CloseReason)}"><xsl:apply-templates select="apzk:CheckNormativeDocument"/></td>
			<xsl:choose>
				<xsl:when test="apzk:CloseReason"><xsl:apply-templates select="apzk:CloseReason[1]"/></xsl:when>
				<xsl:otherwise>
					<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
					<td class="graphMain bordered"/><td class="graphMain bordered"/>
				</xsl:otherwise>
			</xsl:choose>
		</tr>
		<xsl:for-each select="apzk:CloseReason[position() &gt; 1]">
			<tr><xsl:apply-templates select="."/></tr>
		</xsl:for-each>
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
