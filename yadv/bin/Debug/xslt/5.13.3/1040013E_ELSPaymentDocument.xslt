<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:els_agr="urn:customs.ru:Information:ELSDocuments:ELSAggregateTypes:5.13.2" xmlns:els_leaf="urn:customs.ru:Information:ELSDocuments:ELSLeafTypes:5.13.2" xmlns:elspd="urn:customs.ru:Information:ELSDocuments:ELSPaymentDocument:5.13.2">
	<!-- Шаблон для типа ELSPaymentDocumentType -->
	<xsl:template match="elspd:ELSPaymentDocument">
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
										<b>Состояние расчетов по ДТ</b>
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
					<xsl:if test="elspd:RegistrationNumber">
						<div class="title marg-top">Регистрационный номер ДТ/справочный номер ТПО/справочный номер ТР / номер МПО</div>
					</xsl:if>
					<xsl:apply-templates select="elspd:RegistrationNumber"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Состояние ДН</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="elspd:DocumentStatus"/>
							</td>
						</tr>
					</table>
					<xsl:if test="elspd:ProccessStatus">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Статус выполнения запроса</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="elspd:ProccessStatus=0">
											<xsl:text>выполнен полностью</xsl:text>
										</xsl:when>
										<xsl:when test="elspd:ProccessStatus=1">
											<xsl:text>не выполнен</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="elspd:ProccessStatus"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="elspd:DclPaymentInfo">
						<div class="title marg-top">Сведения о платежах по ДН</div>
					</xsl:if>
					<xsl:apply-templates select="elspd:DclPaymentInfo"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа els_agr:AccPaymentAmountType -->
	<xsl:template match="els_agr:AmountInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:BCC"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(els_agr:Amount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:AdjustDocNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="els_agr:IsWorked='true'">
						<xsl:text>есть</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>нет</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:CustomsReceipt"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="els_agr:PayerType=0 or els_agr:PayerType='false'">
						<xsl:text>Декларант</xsl:text>
					</xsl:when>
					<xsl:when test="els_agr:PayerType=1 or els_agr:PayerType='true'">
						<xsl:text>Таможенный представитель</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="els_agr:PayerType"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа els_agr:DelayPaymentInfoType -->
	<xsl:template match="els_agr:DelayPaymentInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:BCC"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(els_agr:Amount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:StageNumb"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="els_agr:PayDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа els_agr:ReqPayableAmountType -->
	<xsl:template match="els_agr:PayableAmount">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:BCC"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(els_agr:Amount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:AdjustDocNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="els_agr:IsWorked='true'">
						<xsl:text>есть</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>нет</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа els_agr:RegistrationNumberType -->
	<xsl:template match="els_agr:PrecedingDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:CustomsCode"/>
				<xsl:text>/</xsl:text>
			<!--/td>
			<td class="graphMain bordered"-->
				<xsl:call-template name="num_date">
					<xsl:with-param name="dateIn" select="els_agr:RegistrationDate"/>
				</xsl:call-template>
				<xsl:text>/</xsl:text>
			<!--/td>
			<td class="graphMain bordered"-->
				<xsl:value-of select="els_agr:DocNumber"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа els_agr:DclPaymentInfoType -->
	<xsl:template match="elspd:DclPaymentInfo">
		<xsl:if test="els_agr:PrecedingDocument">
			<div class="title marg-top">Предшествующие ДН</div>
			<table class="bordered w190">
				<tbody>
					<!--tr class="title">
						<td class="graphMain bordered">Код таможенного органа</td>
						<td class="graphMain bordered">Дата регистрации документа.</td>
						<td class="graphMain bordered">Порядковый (регистрационный) номер ДТ/ регистрационный номер (серия, типографский номер) ТПО/ типографский номер ТР / номер МПО</td>
					</tr-->
					<xsl:for-each select="els_agr:PrecedingDocument">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:PayableAmount">
			<div class="title marg-top">Суммы, подлежащие уплате</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">КБК</td>
						<td class="graphMain bordered">Код вида платежа</td>
						<td class="graphMain bordered">Сумма</td>
						<td class="graphMain bordered">Номер КДТ</td>
						<td class="graphMain bordered">Признак отработки в предыдущих запросах</td>
					</tr>
					<xsl:for-each select="els_agr:PayableAmount">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:AmountInfo">
			<div class="title marg-top">Суммы, списываемые с лицевого счета</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">КБК</td>
						<td class="graphMain bordered">Код вида</td>
						<td class="graphMain bordered">Сумма</td>
						<td class="graphMain bordered">Номер КДТ</td>
						<td class="graphMain bordered">Признак отработки в предыдущих запросах</td>
						<td class="graphMain bordered">Номер таможенной расписки</td>
						<td class="graphMain bordered">Сведения о плательщике</td>
					</tr>
					<xsl:for-each select="els_agr:AmountInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:DelayPaymentInfo">
			<div class="title marg-top">График начислений</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">КБК</td>
						<td class="graphMain bordered">Код вида платежа</td>
						<td class="graphMain bordered">Сумма</td>
						<td class="graphMain bordered">Порядковый номер начисления</td>
						<td class="graphMain bordered">Дата начисления</td>
					</tr>
					<xsl:for-each select="els_agr:DelayPaymentInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа els_agr:RegistrationNumberType -->
	<xsl:template match="elspd:RegistrationNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Рег. номер</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="els_agr:CustomsCode"/>
					<xsl:text>/</xsl:text>
				<!--/td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа.</td>
				<td class="value graphMain" style="width:50%"-->
					<xsl:call-template name="num_date">
						<xsl:with-param name="dateIn" select="els_agr:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
				<!--/td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый (регистрационный) номер ДТ/ регистрационный номер (серия, типографский номер) ТПО/ типографский номер ТР / номер МПО</td>
				<td class="value graphMain" style="width:50%"-->
					<xsl:value-of select="els_agr:DocNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
