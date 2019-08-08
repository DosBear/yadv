<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pe_req="urn:customs.ru:Information:SQDocuments:GisGmpPaymentExportRequest:5.12.0">
	<!-- Шаблон для типа GisGmpPaymentExportRequestType -->
	<xsl:template match="pe_req:GisGmpPaymentExportRequest">
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
										<b>Запрос на экспорт платежей</b>
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
							<td class="annot graphMain" style="width:50%">Тип запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'PAYMENT'">все активные (неаннулированные) платежи</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'PAYMENTMODIFIED'">все платежи, имеющие статус уточнения (ChangeStatus@meaning имеет значение «2») или статус аннулирования (ChangeStatus@meaning имеет значение «3»)</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'PAYMENTUNMATCHED'">все активные (неаннулированные) платежи, которым в системе не поставлена в соответствие (не создана) ни одна квитанция</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'PAYMENTCANCELLED'">аннулированные платежи (ChangeStatus@meaning имеет значение «3»)</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'PAYMENTMAINCHARGE'">запрос платежей по связанным начислениям (используется только ФССП)</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'CHARGE'">запрос неоплаченных начислений</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'CHARGENOTFULLMATCHED'">все начисления в статусе, отличном от "сквитировано" и "сквитировано с отсутствующим платежом"</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'QUITTANCE'">последний результата квитирования</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'ALLQUITTANCE'">все результаты квитирования, включая аннулированные</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'CHARGESTATUS'">начисления и статусы квитирования</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'CHARGE-PRIOR'">неоплаченные предварительные начисления, загруженные участником</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'CHARGE-PRIOR-NOTFULLMATCHED'">предварительные начисления, загруженные участником, в статусе, отличном от "сквитировано" и "сквитировано с отсутствующим платежом"</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'CHARGE-PRIOR-STATUS'">предварительные начисления и их статусы</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'TEMP-CHARGING'">неоплаченные предварительные начисления, сформированные ГИС ГМП</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'TEMP-CHARGING-STATUS'">предварительные начисления, сформированные ГИС ГМП, со статусами квитирования</xsl:when>
									<xsl:when test="pe_req:GisGmpEPRequestKind = 'TEMP-CHARGING-NOTFULLMATCHED'">предварительные начисления, сформированнные ГИС ГМП, в статусе, отличном от "сквитировано" и "сквитировано с отсутствующим платежом</xsl:when>
									<xsl:otherwise><xsl:value-of select="pe_req:GisGmpEPRequestKind"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="pe_req:OriginatorID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">УРН участника косвенного взаимодействия, сформировавшего запрос</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="pe_req:OriginatorID"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pe_req:ReqFilter">
						<div class="title marg-top">Фильтр для получения сущностей ГИС ГМП</div>
						<xsl:apply-templates select="pe_req:ReqFilter"/>
					</xsl:if>
					<xsl:if test="pe_req:ReqPaging">
						<div class="title marg-top">Параметры постраничной выдачи</div>
						<xsl:apply-templates select="pe_req:ReqPaging"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа pe_req:AdditionRestrictionsType -->
	<xsl:template match="pe_req:AdditionRestrictions">
		<xsl:if test="pe_req:SubordinateIdList">
			<table class="w190">
				<xsl:if test="count(pe_req:SubordinateIdList/pe_req:TaxpayerIdentification) &gt; 0">
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификация получателя средств</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="pe_req:SubordinateIdList/pe_req:TaxpayerIdentification">
								<xsl:text>ИНН </xsl:text>
								<xsl:value-of select="pe_req:INN"/>
								<xsl:if test="pe_req:KPP"> КПП <xsl:value-of select="pe_req:KPP"/></xsl:if>						
								<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
							</xsl:for-each>
						</td>
					</tr>		
				</xsl:if>
				<xsl:if test="count(pe_req:SubordinateIdList/pe_req:PayeeID) &gt; 0">
					<tr>
						<td class="annot graphMain" style="width:50%">УРН получателя средств, указанный в возвращаемой сущности</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="pe_req:SubordinateIdList/pe_req:PayeeID">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
							</xsl:for-each>
						</td>
					</tr>		
				</xsl:if>
			</table>		
		</xsl:if>
		<xsl:if test="pe_req:KBKClassifier">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Перечень КБК</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="pe_req:KBKClassifier">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pe_req:OKTMOClassifier">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Коды ОКТМО</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="pe_req:OKTMOClassifier">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pe_req:Exclude">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Исключения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="pe_req:Exclude='ZERO-UIN'">При запросе платежей возвращается информация о платежах, в которых указан УИН, отличный от 0)</xsl:when>
							<xsl:otherwise><xsl:value-of select="pe_req:Exclude"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pe_req:ConditionsType -->
	<xsl:template match="pe_req:Conditions">
		<table class="w190">
			<xsl:if test="pe_req:ChargesIdentifiers">
				<tr>
					<td class="annot graphMain" style="width:50%">УИН, по которым запрашиваются сущности</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="pe_req:ChargesIdentifiers">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="pe_req:Payers">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификаторы плательщиков, по которым запрашиваются сущности</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="pe_req:Payers">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="pe_req:Timeslot">
				<tr>
					<td class="annot graphMain" style="width:50%">Временной интервал, за который запрашиваются сущности</td>
					<td class="graphMain value" style="width:50%"><xsl:apply-templates select="pe_req:Timeslot"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pe_req:ReqFilterType -->
	<xsl:template match="pe_req:ReqFilter">
		<xsl:if test="pe_req:Conditions">
			<div class="title marg-top">Условие для получения сущностей из ГИС ГМП</div>
			<xsl:apply-templates select="pe_req:Conditions"/>
		</xsl:if>
		<xsl:if test="pe_req:AdditionRestrictions">
			<div class="title marg-top">Дополнительные ограничения</div>
			<xsl:apply-templates select="pe_req:AdditionRestrictions"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pe_req:ReqPagingType -->
	<xsl:template match="pe_req:ReqPaging">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер страницы выдачи</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pe_req:PageNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Количество элементов на странице выдачи</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pe_req:PageLength"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pe_req:TimeslotType -->
	<xsl:template match="pe_req:Timeslot">
		<xsl:text>c </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="pe_req:StartDate"/>
		</xsl:call-template>
		<xsl:text> по </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="pe_req:EndDate"/>
		</xsl:call-template>
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
