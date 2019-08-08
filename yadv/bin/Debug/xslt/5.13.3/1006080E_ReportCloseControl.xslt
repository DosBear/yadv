<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_ru="urn:customs.ru:RUCommonLeafTypes:5.4.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rcc="urn:customs.ru:Information:CustomsDocuments:ReportCloseControl:5.13.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ReportCloseControlType -->
	<xsl:template match="rcc:ReportCloseControl">
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
					margin: 5px auto;
					margin-top: 5pt;
					margin-bottom: 6pt;
					padding: 5mm;
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
										<b>Протокол завершения контроля декларации на товары</b>
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
					<xsl:if test="rcc:CheckDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата проведения проверки</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rcc:CheckDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Время проведения проверки</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="substring(rcc:CheckTime, 1,8)"/></td>
						</tr>
						<xsl:if test="rcc:EndCheckDate">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата, на которую выполнена проверка</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rcc:EndCheckDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="rcc:DBFVersion">
							<tr>
								<td class="annot graphMain" style="width:50%">Версия структуры внутреннего формата электронной копии ДТ (формат DBF)</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="rcc:DBFVersion"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Общее количество ошибок ПЗК</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rcc:ErrorCount"/></td>
						</tr>
					</table>
					<xsl:if test="rcc:ReasonCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код причины повторной передачи электронной копии ДТ после ее возврата с вышестоящего уровня системы</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="rcc:ReasonCode"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rcc:Explanation">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Объяснение инспектора о несвоевременности или неполноте представления информации по результатам ФЛК</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="rcc:Explanation"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rcc:ExplanationDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата внесения объяснения инспектором о несвоевременности или неполноте представления информации по результатам ФЛК</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rcc:ExplanationDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rcc:Document">
						<div class="title marg-top">Проверенный электронный таможенный документ</div>
						<xsl:apply-templates select="rcc:Document"/>
					</xsl:if>
					<xsl:if test="rcc:PSCheck">
						<div class="title marg-top">Программное средство, выполнившее проверку</div>
						<xsl:apply-templates select="rcc:PSCheck"/>
					</xsl:if>
					<xsl:if test="rcc:PZKErrors">
						<div class="title marg-top">Ошибки</div>
						<table class="bordered w190">
								<!--tr class="title">
									<td class="graphMain bordered">Номер товара по ДТ</td>
									<td class="graphMain bordered">Информация в таблице внутреннего формата электронной копии ДТ (формат DBF)</td>
									<td class="graphMain bordered">Ошибка ПЗК</td>
									<td class="graphMain bordered">Нормативный документ, в соответствии с которым выполняется контроль</td>
									<td class="graphMain bordered">Причина закрытия</td>
								</tr-->
							<xsl:for-each select="rcc:PZKErrors">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rcc:CheckNormativeDocumentType -->
	<xsl:template match="rcc:CheckNormativeDoc| rcc:CloseNormativeDoc">
		<xsl:if test="rcc:DocumentType">
			<xsl:value-of select="rcc:DocumentType"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="rcc:OrganizationName"><xsl:value-of select="rcc:OrganizationName"/></xsl:if>
		<xsl:text> № </xsl:text>
		<xsl:value-of select="rcc:DocumentNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="rcc:DocumentDate"/>
		</xsl:call-template>
		<xsl:if test="rcc:BeginDate or rcc:EndDate">
			<br/>
			<xsl:text> Период действия: </xsl:text>
			<xsl:if test="rcc:BeginDate">
				<xsl:text>с </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rcc:BeginDate"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="rcc:EndDate">
				<xsl:text>по </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rcc:EndDate"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rcc:NormativeDocumentType >
	<xsl:template match="rcc:CloseNormativeDoc">
		<xsl:if test="rcc:DocumentType">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Ссылка на тип нормативного документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rcc:DocumentType"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Орган, принявший нормативный документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rcc:OrganizationName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата принятия нормативного документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="rcc:DocumentDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер нормативного документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rcc:DocumentNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template-->
	<!-- Шаблон для типа rcc:CloseReasonType -->
	<xsl:template match="rcc:CloseReason">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rcc:ReasonCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rcc:InspectorNotice"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rcc:LNP"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rcc:CloseDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rcc:CloseNormativeDoc">
					<xsl:apply-templates select="rcc:CloseNormativeDoc"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rcc:DocumentType -->
	<xsl:template match="rcc:Document">
		<xsl:if test="rcc:Kind">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Способ указания проверяемого документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rcc:Kind"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код типа электронного таможенного документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="rcc:EDCode='1'">ДТ</xsl:when>
						<xsl:otherwise><xsl:value-of select="rcc:EDCode"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="rcc:EDType">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип электронного таможенного документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rcc:EDType"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rcc:EDRef">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Ссылка на документ: GUID | валовый номер | таможенный номер</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="rcc:EDRef"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rcc:ErrorType -->
	<xsl:template match="rcc:Error">
		<xsl:choose>
			<xsl:when test="rcc:ErrorLevel='1'"><span style="color: red">критическая ошибка:</span></xsl:when>
			<xsl:when test="rcc:ErrorLevel='2'"><span style="color: orange">ошибка:</span></xsl:when>
			<xsl:when test="rcc:ErrorLevel='3'"><span style="color: green">рекомендация:</span></xsl:when>
			<xsl:otherwise><xsl:value-of select="rcc:ErrorLevel"/>:</xsl:otherwise>
		</xsl:choose>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="rcc:ErrorCode"/>
		<xsl:text>) </xsl:text>
		<xsl:value-of select="rcc:ErrorText"/>
		<xsl:if test="rcc:ErrorDescription">
			<br/>
			<i><xsl:value-of select="rcc:ErrorDescription"/></i>
		</xsl:if>
		<xsl:if test="rcc:TrueValue">
			<br/>
			<xsl:text>Правильное значение: </xsl:text>
			<xsl:value-of select="rcc:TrueValue"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rcc:GTDinTableType -->
	<xsl:template match="rcc:GTDinTable">
		<xsl:if test="rcc:TableName">
			<xsl:text>Имя таблицы (формат DBF): </xsl:text>
			<xsl:value-of select="rcc:TableName"/>
			<br/>
		</xsl:if>
		<xsl:if test="rcc:AttributeName">
			<xsl:text>Атрибут таблицы: </xsl:text>
			<xsl:value-of select="rcc:AttributeName"/>
			<br/>
		</xsl:if>
		<xsl:if test="rcc:RecordNumber">
			<xsl:text>Номер записи, соответствующий значению поля NZP: </xsl:text>
			<xsl:value-of select="rcc:RecordNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rcc:PSCheckType -->
	<xsl:template match="rcc:PSCheck">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор ПС, выполнившего проверку</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rcc:PSID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Версия ПС, выполнившего проверку</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rcc:PSVersion"/>
				</td>
			</tr>
		</table>
		<xsl:if test="rcc:PSName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование ПС, выполнившего проверку</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rcc:PSName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rcc:PZKErrorsType -->
	<xsl:template match="rcc:PZKErrors">
		<tr bgcolor="#e3e3e3">
			<td class="annot graphMain" style="width:50%; border-top: 1px solid gray">Номер товара по ДТ</td>
			<td class="value graphMain" style="width:50%; border-top: 1px solid gray"><xsl:value-of select="rcc:GTDGoodsNumber"/></td>
		</tr>
		<xsl:if test="rcc:GTDinTable">
			<tr>
				<td class="annot graphMain" style="width:50%">Информация в таблице внутреннего формата электронной копии ДТ (формат DBF)</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rcc:GTDinTable"/></td>
			</tr>
		</xsl:if>	
		<tr>
			<td class="annot graphMain" style="width:50%">Ошибка ПЗК</td>
			<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rcc:Error"/></td>
		</tr>
		<xsl:if test="rcc:CheckNormativeDoc">
			<tr>
				<td class="annot graphMain" style="width:50%">Нормативный документ, в соответствии с которым выполняется контроль</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rcc:CheckNormativeDoc"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="rcc:CloseReason">
			<tr>
				<td class="annot graphMain" colspan="2">
					<div class="title marg-top">Причина закрытия</div>
					<table class="bordered w190">
						<tr class="title">
							<td class="graphMain bordered">Код причины закрытия</td>
							<td class="graphMain bordered">Примечания инспектора</td>
							<td class="graphMain bordered">ЛНП инспектора, закрывшего ПЗК</td>
							<td class="graphMain bordered">Дата закрытия ошибки по ПЗК</td>
							<td class="graphMain bordered">Нормативный документ, в соответствии с которым выполняется закрытие</td>
						</tr>
						<xsl:for-each select="rcc:CloseReason">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
					<br/>
				</td>
			</tr>
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
