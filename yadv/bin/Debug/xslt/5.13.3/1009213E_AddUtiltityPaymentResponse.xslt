<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:sq_clt="urn:customs.ru:Information:SQDocuments:SQCommonLeafTypesCust:5.0.10" xmlns:aupr="urn:customs.ru:Information:SQDocuments:AddUtiltityPaymentResponse:5.13.3">
	<!-- Шаблон для типа AddUtiltityPaymentResponseType -->
	<xsl:template match="aupr:AddUtiltityPaymentResponse">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: normal;*/
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
										<b>Ответ на запрос о внесении сведений об утилизационном сборе</b>
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
					<xsl:if test="aupr:UtilityPaymentInfoByItem">
						<div class="title marg-top">Результат обработки заявления</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered" width="10%">UID</td>
									<td class="graphMain bordered" width="10%">Идентификаторы</td>
									<td class="graphMain bordered" width="10%">Код статуса</td>
									<td class="graphMain bordered" width="10%">Дата присвоения статуса</td>
									<td class="graphMain bordered" width="10%">Дата оформления электронного паспорта</td>
									<td class="graphMain bordered" width="10%">Рег. номер заявления в СЭП</td>
									<td class="graphMain bordered" width="10%">Статус рассмотрения</td>
									<td class="graphMain bordered">Ошибки</td>
								</tr>
								<xsl:for-each select="aupr:UtilityPaymentInfoByItem">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа aupr:ErrorDataType -->
	<xsl:template match="aupr:ErrorData">
		<!--tr>
			<td class="graphMain bordered"-->
				<xsl:if test="aupr:ErrorCode">
					<xsl:text>код: </xsl:text>
					<xsl:value-of select="aupr:ErrorCode"/>
				</xsl:if>
			<!--/td>
			<td class="graphMain bordered"-->
				<xsl:if test="aupr:ErrorText">
					<br/>
					<xsl:text> текст: </xsl:text>
					<xsl:value-of select="aupr:ErrorText"/>
				</xsl:if>
			<!--/td>
			<td class="graphMain bordered"-->
				<xsl:if test="aupr:ErrorDetails">
					<br/>
					<xsl:text> детали: </xsl:text>
					<xsl:value-of select="aupr:ErrorDetails"/>
				</xsl:if>
			<!--/td>
		</tr-->
	</xsl:template>
	<!-- Шаблон для типа aupr:UtilityPaymentInfoByItemType -->
	<xsl:template match="aupr:UtilityPaymentInfoByItem">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="aupr:VehicleEPassportId"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="aupr:VehicleIdInfoDetails"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="aupr:VehicleEPassportStatusCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="aupr:EventDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="aupr:DocCreationDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="aupr:StatementNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="aupr:StatementStatus=4">
						<xsl:text>Исполнено</xsl:text>
					</xsl:when>
					<xsl:when test="aupr:StatementStatus=9">
						<xsl:text>Отказано</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="aupr:StatementStatus"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="aupr:ErrorData">
					<!--div class="title marg-top">Ошибки возникшие при обработке заявления</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Код результата обработки заявления</td>
									<td class="graphMain bordered">Текст результата обработки заявления</td>
									<td class="graphMain bordered">Детальное описание результата обработки заявления</td>
								</tr>
							</tr-->
							<xsl:for-each select="aupr:ErrorData">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()"><br/><br/></xsl:if>
							</xsl:for-each>
						<!--/tbody>
					</table-->
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа aupr:VehicleIdInfoDetailsType -->
	<xsl:template match="aupr:VehicleIdInfoDetails">
		<xsl:if test="aupr:VehicleIdDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ID
                    </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="aupr:VehicleIdDetails"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="aupr:VehicleEngineIdDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Двигатель
                    </td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="aupr:VehicleEngineIdDetails">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="aupr:VehicleFrameIdDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Шасси
                    </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="aupr:VehicleFrameIdDetails"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="aupr:VehicleBodyIdDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кабина
                    </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="aupr:VehicleBodyIdDetails"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="aupr:MachineBodyIdDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кузов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="aupr:MachineBodyIdDetails"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="aupr:GearboxIdDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="aupr:GearboxIdDetails"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="aupr:MainPoweredAxleIdDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Моста</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="aupr:MainPoweredAxleIdDetails">
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
