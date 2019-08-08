<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:acat_ru="urn:customs.ru:ArriveCommonAggregateTypes:5.13.3" xmlns:ATDcat="urn:customs.ru:Information:CustomsDocuments:ATDCommon:5.13.1" xmlns:idks="urn:customs.ru:Information:CustomsDocuments:IDKPrevRes:5.13.3">
	<!-- Шаблон для типа IDKPrevResType -->
	<xsl:template match="idks:IDKPrevRes">
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
										<b>Информация о ранее проведенном осмотре с ИДК и наличии технических возможностей</b>
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
					<xsl:if test="idks:CustomsOfficer">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<xsl:apply-templates select="idks:CustomsOfficer"/>
					</xsl:if>
					<xsl:if test="idks:PrevIDK">
						<div class="title marg-top">Ранее проведенные осмотры с ИДК</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Тип документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Признак наличия ранее проведенных осмотров с ИДК</td>
									<td class="graphMain bordered">Номер направления на осмотр с ИДК</td>
									<td class="graphMain bordered">Регистрационный номер акта осмотра с ИДК</td>
								</tr>
								<xsl:for-each select="idks:PrevIDK">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="idks:IDKCustoms">
						<div class="title marg-top">Таможенные  органы, приближенные к объекту осмотра</div>
						<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered" rowspan="2" style="width:20%; vertical-align: middle">
									Таможенный орган / признак наличия ИДК
								</td>
								<td class="graphMain bordered" rowspan="2" style="width:15%; vertical-align: middle">
									ИДК, которому назначается осмотр
								</td>
								<td class="graphMain bordered" colspan="4" style="width:65%" align="center">
									Режим работы подразделения таможенного органа
								</td>
							</tr>
							<tr class="title">
								<td class="graphMain bordered">Время работы организации</td>
								<td class="graphMain bordered">График работы</td>
								<td class="graphMain bordered">Период действия события / документа</td>
								<td class="graphMain bordered">Подробная информация о времени работы</td>
							</tr>
							<xsl:for-each select="idks:IDKCustoms">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ATDcat:DocNumberType -->
	<xsl:template match="ATDcat:DocNumber">
		<xsl:text>№ </xsl:text>
		<xsl:value-of select="ATDcat:DocNumber"/>
		<xsl:if test="ATDcat:DocDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="ATDcat:DocDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:PeriodDetailsType -->
	<xsl:template match="acat_ru:PeriodDetails">
		<xsl:if test="RUScat_ru:StartDateTime">
			<xsl:text>с </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:StartDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(RUScat_ru:StartDateTime, 12, 5)"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:EndDateTime">
			<xsl:text>по </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:EndDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(RUScat_ru:EndDateTime, 12, 5)"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:WorkScheduleDetailsType -->
	<xsl:template match="acat_ru:WorkScheduleDetails">
		<td class="graphMain bordered">
			<xsl:text>(код: </xsl:text>
			<xsl:value-of select="acat_ru:WorkSheduleCode"/>
			<xsl:text>) </xsl:text>
			<xsl:value-of select="acat_ru:WorkSheduleDescriptionText"/>
		</td>
		<td class="graphMain bordered">
			<xsl:apply-templates select="acat_ru:PeriodDetails"/>
		</td>
		<td class="graphMain bordered">
			<table class="bordered w190">
				<xsl:for-each select="acat_ru:WorkTimeDetails">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</td>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:WorkTimeDetailsType -->
	<xsl:template match="acat_ru:WorkTimeDetails">
		<tr>
			<td class="annot graphMain" style="font-size: 10pt;">
				<xsl:choose>
					<xsl:when test="acat_ru:WeekDayCode=1">понедельник</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=2">вторник</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=3">среда</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=4">четверг</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=5">пятница</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=6">суббота</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=7">воскресенье</xsl:when>
				</xsl:choose>
			</td>
			<td class="annot graphMain" style="font-size: 10pt;"><xsl:apply-templates select="acat_ru:WorkTimeHourDetails"/></td>
			<td class="annot graphMain" style="font-size: 10pt;"><xsl:for-each select="acat_ru:WorkTimeHourDescriptionText"><xsl:value-of select="."/></xsl:for-each></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:WorkTimeHourDetailsType -->
	<xsl:template match="acat_ru:WorkTimeHourDetails">
		<xsl:value-of select="substring(acat_ru:StartingTime, 1,5)"/>
		<xsl:text> - </xsl:text>
		<xsl:value-of select="substring(acat_ru:EndingTime, 1,5)"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:CustomsPersonDetails -->
	<xsl:template match="idks:CustomsOfficer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonMiddleName"/>
				</td>
			</tr>
		</table>
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
		<xsl:if test="RUScat_ru:LNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:LNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CustomsCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа idks:IDKCustomsType -->
	<xsl:template match="idks:IDKCustoms">
		<xsl:variable name="kol_schedule" select="count(idks:WorkSchedule/acat_ru:WorkScheduleDetails)"/>
		<tr>
			<td class="graphMain bordered" rowspan="{$kol_schedule}">
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:OfficeName"/>
				<xsl:text> / </xsl:text>
				<xsl:choose>
					<xsl:when test="idks:IDKAvailability='true' or idks:IDKAvailability='1'">ИДК в наличии</xsl:when>
					<xsl:otherwise><span style="color: red; font-weight: bold;">ИДК отсутствует</span></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered" rowspan="{$kol_schedule}">
				<xsl:choose>
					<xsl:when test="idks:IDKpossibility='true' or idks:IDKpossibility='1'">присутствует возможность осмотра с помощью ИДК </xsl:when>
					<xsl:otherwise><span style="color: red; font-weight: bold;">нет возможности осмотра с помощью ИДК </span></xsl:otherwise>
				</xsl:choose>
				<xsl:if test="idks:IDK_id"> № <xsl:value-of select="idks:IDK_id"/> </xsl:if>
				<xsl:choose>
					<xsl:when test="idks:IDKKind=1"> (автомобильный ПП)</xsl:when>
					<xsl:when test="idks:IDKKind=2"> (морской порт)</xsl:when>
					<xsl:when test="idks:IDKKind=3"> (ЖДПП)</xsl:when>
					<xsl:when test="idks:IDKKind=4"> (воздушный ПП)</xsl:when>
					<xsl:when test="idks:IDKKind=5"> (вне ПП)</xsl:when>
					<xsl:otherwise> (вид дислокации: <xsl:value-of select="idks:IDKKind"/>)</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered" rowspan="{$kol_schedule}">
				<xsl:if test="acat_ru:WorkTimeDescriptionText or idks:WorkSchedule/acat_ru:WorkScheduleDetails/acat_ru:WorkSheduleCode">
					<xsl:text>(код: </xsl:text>
					<xsl:value-of select="idks:WorkSchedule/acat_ru:WorkTimeCode"/>
					<xsl:text>) </xsl:text>
				</xsl:if>
				<xsl:value-of select="idks:WorkSchedule/acat_ru:WorkTimeDescriptionText"/>
			</td>
			<xsl:choose>
				<xsl:when test="idks:WorkSchedule/acat_ru:WorkScheduleDetails">
					<xsl:apply-templates select="idks:WorkSchedule/acat_ru:WorkScheduleDetails[1]"/>
				</xsl:when>
				<xsl:otherwise>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
				</xsl:otherwise>
			</xsl:choose>
		</tr>
		<xsl:for-each select="idks:WorkSchedule/acat_ru:WorkScheduleDetails[position() &gt; 1]">
			<tr>
				<xsl:apply-templates select="."/>
			</tr>
		</xsl:for-each>	
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="idks:InstrNumber| ATDcat:GTDID| idks:VOIActNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа idks:PrevIDKType -->
	<xsl:template match="idks:PrevIDK">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ATDcat:DocKind=0">уведомление о прибытии на таможенную территорию</xsl:when>
					<xsl:when test="ATDcat:DocKind=1">транзитная декларация</xsl:when>
					<xsl:when test="ATDcat:DocKind=2">книжка МДП</xsl:when>
					<xsl:when test="ATDcat:DocKind=3">номер ДО-1/описи</xsl:when>
					<xsl:when test="ATDcat:DocKind=4">ДТ</xsl:when>
					<xsl:when test="ATDcat:DocKind=5">уведомление об убытии</xsl:when>
					<xsl:when test="ATDcat:DocKind=6">иностранная транзитная декларация</xsl:when>
					<xsl:when test="ATDcat:DocKind=7">коносамент</xsl:when>
					<xsl:when test="ATDcat:DocKind=8">документ физического лица</xsl:when>
					<xsl:when test="ATDcat:DocKind=9">иное</xsl:when>
					<xsl:otherwise><xsl:value-of select="ATDcat:DocKind"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="ATDcat:GTDID"><xsl:apply-templates select="ATDcat:GTDID"/></xsl:if>
				<xsl:if test="ATDcat:DocNumber"><xsl:apply-templates select="ATDcat:DocNumber"/></xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="idks:IndPrevIDK='true' or idks:IndPrevIDK='1'">есть</xsl:when>
					<xsl:otherwise>нет</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered"><xsl:apply-templates select="idks:InstrNumber"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="idks:VOIActNumber"/></td>
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
