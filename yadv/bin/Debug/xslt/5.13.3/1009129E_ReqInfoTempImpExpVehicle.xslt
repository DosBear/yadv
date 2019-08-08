<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:req_tv="urn:customs.ru:Information:SQDocuments:ReqInfoTempImpExpVehicle:5.13.3">
	<!-- Шаблон для типа ReqInfoTempImpExpVehicleType -->
	<xsl:template match="req_tv:ReqInfoTempImpExpVehicle">
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
										<b>Запрос сведений о временном ввозе (вывозе) транспортного средства</b>
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
					<xsl:if test="req_tv:EECEDocHeaderAddInfo">
						<div class="title marg-top">Дополнительные технологические реквизиты электронного документа (сведений)</div>
						<xsl:apply-templates select="req_tv:EECEDocHeaderAddInfo"/>
					</xsl:if>
					<xsl:if test="req_tv:DTMDocDetails">
						<div class="title marg-top">Сведения о регистрационном номере таможенной декларации на транспортное средство</div>
						<xsl:apply-templates select="req_tv:DTMDocDetails"/>
					</xsl:if>
					<xsl:if test="req_tv:PassengerDeclarationDetails">
						<div class="title marg-top">Сведения о регистрационном номере пассажирской декларации</div>
						<xsl:apply-templates select="req_tv:PassengerDeclarationDetails"/>
					</xsl:if>
					<xsl:if test="req_tv:CustomsOperationDetails">
						<div class="title marg-top">Сведения о регистрационном номере заявления о временном ввозе ТС</div>
						<xsl:apply-templates select="req_tv:CustomsOperationDetails"/>
					</xsl:if>
					<xsl:if test="req_tv:UnifiedCustomsOfficeDetails">
						<div class="title marg-top">Сведения о таможенном органе регистрации (оформления) временного ввоза (вывоза) ТСЛП (ТСМП)</div>
						<xsl:apply-templates select="req_tv:UnifiedCustomsOfficeDetails"/>
					</xsl:if>
					<xsl:if test="req_tv:TITransportDetails">
						<div class="title marg-top">Сведения о временно ввозимых (вывозимых) транспортных средствах</div>
						<xsl:apply-templates select="req_tv:TITransportDetails"/>
					</xsl:if>
					<xsl:if test="req_tv:PeriodDetails">
						<div class="title marg-top">Период оформления временного ввоза (вывоза) транспортного средства</div>
					</xsl:if>
					<xsl:apply-templates select="req_tv:PeriodDetails"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа деклараций -->
	<xsl:template match="req_tv:CustomsOperationDetails| req_tv:DTMDocDetails| req_tv:PassengerDeclarationDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер документа</td>
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
		<xsl:if test="req_tv:OperationCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение таможенной операции временного ввоза</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="req_tv:OperationCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="req_tv:TransportModeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="req_tv:TransportModeCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="req_tv:CountryA2Code">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код государства-члена, зарегистрировавшего пассажирскую декларацию</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="req_tv:CountryA2Code"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="req_tv:RBSignCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак журнала регистрации для Республики Беларусь</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="req_tv:RBSignCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа req_tv:TransportMeansIdDetailsType -->
	<xsl:template match="req_tv:DependTransportMeansIdDetails| req_tv:TransportMeansIdDetails">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:VIN"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportKindCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportMarkCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportIdentifier"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportMeansNationalityCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:ActiveTransportIdentifier"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportRegNumber"/></td>
			<td class="graphMain bordered"><xsl:value-of select="req_tv:ChassisID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="req_tv:BodyID"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECEDocHeaderAddInfoType -->
	<xsl:template match="req_tv:EECEDocHeaderAddInfo">
		<xsl:if test="RUScat_ru:InfEnvelopeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение сообщения общего процесса</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:InfEnvelopeCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Кодовое обозначение электронного документа (сведений) в соответствии с реестром структур электронных документов и сведений</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:EDocCode"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время создания электронного документа (сведений)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUScat_ru:EDocDateTime"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(RUScat_ru:EDocDateTime, 12,8)"/>
				</td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:LanguageCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение языка</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:LanguageCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:PeriodDetailsType -->
	<xsl:template match="req_tv:PeriodDetails">
		<xsl:if test="RUScat_ru:StartDateTime">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время начала действия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUScat_ru:StartDateTime"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(RUScat_ru:StartDateTime, 12,8)"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:EndDateTime">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время окончания действия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUScat_ru:EndDateTime"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(RUScat_ru:EndDateTime, 12,8)"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа req_tv:TITransportDetailsType -->
	<xsl:template match="req_tv:TITransportDetails">
		<xsl:if test="req_tv:DependTransportMeansIdDetails or req_tv:TransportMeansIdDetails">
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered">Номер шасси (VIN)</td>
					<td class="graphMain bordered">Код типа ТС</td>
					<td class="graphMain bordered">Код марки ТС</td>
					<td class="graphMain bordered">Идентификатор</td>
					<td class="graphMain bordered">Буквенный код страны принадлежности ТС</td>
					<td class="graphMain bordered">Идентификатор активного ТС для прицепов, полуприцепов и др.</td>
					<td class="graphMain bordered">Номер свидетельства о регистрации ТС для РБ</td>
					<td class="graphMain bordered">ИД номер шасси (рамы) ТС, присвоенный изготовителем</td>
					<td class="graphMain bordered">ИД номер кузова (кабины) ТС, присвоенный изготовителем</td>
				</tr>
				<xsl:if test="req_tv:TransportMeansIdDetails">
					<tr bgcolor="#e3e3e3">
						<td class="graphMain bordered" colspan="9" align="center"><b>Сведения об идентификационных номерах транспортного средства</b></td>
					</tr>
					<xsl:apply-templates select="req_tv:TransportMeansIdDetails"/>
				</xsl:if>
				<xsl:if test="req_tv:DependTransportMeansIdDetails">
					<tr bgcolor="#e3e3e3">
						<td class="graphMain bordered" colspan="9" align="center"><b>Сведения об идентификационных и регистрационных номерах прицепного транспортного средства</b></td>
					</tr>
					<xsl:for-each select="req_tv:DependTransportMeansIdDetails">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</xsl:if>	
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECCustomsType -->
	<xsl:template match="req_tv:UnifiedCustomsOfficeDetails">
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
				<td class="annot graphMain" style="width:50%">Код страны</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="RUScat_ru:CountryCode"/>
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
