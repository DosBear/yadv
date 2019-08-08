<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:natr="urn:customs.ru:Information:TransportDocuments:Railway:NotifArrivalTransit:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <!-- Шаблон для типа NotifArrivalTransitType -->
<xsl:template match="natr:NotifArrivalTransit">
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
									width: 277mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 10mm;
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
							<td align="center" class="graphMain" colspan="2">
								<font size="4"><b>Подтверждение о прибытии</b></font>
								<br/><br/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата/время подачи уведомления о прибытии</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="natr:NotifDate" />
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(natr:NotifTime, 1,8)" />
							</td>
						</tr>
						<xsl:if test="natr:Comment">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарий</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="natr:Comment" /></td>
							</tr>
						</xsl:if>
						<xsl:if test="natr:Customs">											
							<xsl:apply-templates select="natr:Customs" />
						</xsl:if>
						<xsl:if test="natr:TD">
							<xsl:apply-templates select="natr:TD" />
						</xsl:if>
						<xsl:if test="natr:TIRID">
							<xsl:apply-templates select="natr:TIRID" />
						</xsl:if>
					</tbody>
				</table>
				<xsl:if test="natr:Carrier">
					<div class="title marg-top">Информация о перевозчике</div>
					<xsl:apply-templates select="natr:Carrier" />
				</xsl:if>
				<xsl:if test="natr:TransportMeanArrive">
					<div class="title marg-top">Сведения о транспортных средствах</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title" align="center">
								<td class="graphMain bordered">Номер шасси (VIN)</td>
								<td class="graphMain bordered">Код типа транспортного средства</td>
								<td class="graphMain bordered">Код марки транспортного средства</td>
								<td class="graphMain bordered">Идентификатор. Номер транспортного средства, наименование судна, номер авиарейса, номер поезда, номер железнодорожного вагона (платформ, цистерн и т.п.)</td>
								<td class="graphMain bordered">Буквенный код страны принадлежности транспортного средства по классификатору стран мира</td>
								<td class="graphMain bordered">Идентификатор активного транспортного средства для прицепов, полуприцепов и др.</td>
								<td class="graphMain bordered">Номер свидетельства о регистрации транспортного средства для РБ</td>
							</tr>
							<xsl:for-each select="natr:TransportMeanArrive">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</div>
		</body>
	</html>
</xsl:template>
<!-- Шаблон для типа cat_ru:ITNKZType -->
<xsl:template match="cat_ru:ITN">
	<xsl:text> (Код категория лица: </xsl:text>
	<xsl:value-of select="cat_ru:CategoryCode" />
	<xsl:text> Код КАТО: </xsl:text>
	<xsl:value-of select="cat_ru:KATOCode" />
	<xsl:if test="cat_ru:RNN">
		<xsl:text> РНН: </xsl:text>
		<xsl:value-of select="cat_ru:RNN" />
	</xsl:if>
	<xsl:if test="cat_ru:ITNReserv">
		<xsl:text> Резерв: </xsl:text>
		<xsl:value-of select="cat_ru:ITNReserv" />
	</xsl:if>
	<xsl:text>)</xsl:text>
</xsl:template>
<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
<xsl:template match="cat_ru:KGOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Кыргызской Республики</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:KGINN">
				<xsl:text>ИНН/ПИН: </xsl:text>
				<xsl:value-of select="cat_ru:KGINN" />
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<xsl:text> ОКПО: </xsl:text>
				<xsl:value-of select="cat_ru:KGOKPO" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
<xsl:template match="cat_ru:RAOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Армения</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:UNN">
				<xsl:text>УНН: </xsl:text>
				<xsl:value-of select="cat_ru:UNN" />
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<xsl:text> НЗОУ: </xsl:text>
				<xsl:value-of select="cat_ru:SocialServiceNumber" />
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<xsl:text> Номер справки об отсутствии НЗОУ: </xsl:text>
				<xsl:value-of select="cat_ru:SocialServiceCertificate" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
<xsl:template match="cat_ru:RBOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Беларусь</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:UNP">
				<xsl:text>УНП: </xsl:text>
				<xsl:value-of select="cat_ru:UNP" />
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<xsl:text> Идентификационный номер физического лица: </xsl:text>
				<xsl:value-of select="cat_ru:RBIdentificationNumber" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
<xsl:template match="cat_ru:RFOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Российской Федерации</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:OGRN">
				<xsl:text>ОГРН/ОГРНИП: </xsl:text>
				<xsl:value-of select="cat_ru:OGRN" />
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<xsl:text> ИНН: </xsl:text>
				<xsl:value-of select="cat_ru:INN" />
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<xsl:text> КПП: </xsl:text>
				<xsl:value-of select="cat_ru:KPP" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
<xsl:template match="cat_ru:RKOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Казахстан</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:BIN">
				<xsl:text>БИН: </xsl:text>
				<xsl:value-of select="cat_ru:BIN" />
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<xsl:text> ИИН: </xsl:text>
				<xsl:value-of select="cat_ru:IIN" />
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<xsl:text> Идентификационный таможенный номер: </xsl:text>
				<xsl:apply-templates select="cat_ru:ITN" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
<xsl:template match="natr:Carrier">
	<table class="w190">
		<xsl:if test="cat_ru:OrganizationName">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationName" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<tr>
				<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:ShortName" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<tr>
				<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures" />
		</xsl:if>
	</table>		
</xsl:template>
<!-- Шаблон для типа cat_ru:CUCustomsType -->
<xsl:template match="natr:Customs">
	<tr>
		<td class="annot graphMain" style="width:50%">Таможенный орган прибытия</td>
		<td class="value graphMain" style="width:50%">
			<xsl:value-of select="cat_ru:Code" />
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> - </xsl:text>
				<xsl:value-of select="cat_ru:OfficeName" />
			</xsl:if>
		</td>
	</tr>
	<xsl:if test="cat_ru:CustomsCountryCode">
		<tr>
			<td class="annot graphMain" style="width:50%">Код государства - члена Евразийского экономического союза</td>
			<td class="value graphMain" style="width:50%">
				<!--xsl:choose>
					<xsl:when test="cat_ru:CustomsCountryCode=государства"><xsl:text>члена Евразийского экономического союза</xsl:text></xsl:when>
					<xsl:otherwise-->
				<xsl:value-of select="cat_ru:CustomsCountryCode" />
					<!--/xsl:otherwise>
				</xsl:choose-->
			</td>
		</tr>
	</xsl:if>
</xsl:template>
<!-- Шаблон для типа cat_ru:GTDIDType -->
<xsl:template match="natr:TD">
	<tr>
		<td class="annot graphMain" style="width:50%">Номер транзитной декларации</td>
		<td class="value graphMain" style="width:50%">
			<xsl:value-of select="cat_ru:CustomsCode" />
			<xsl:text>/</xsl:text>
			<xsl:call-template name="date_gtd">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate" />
			</xsl:call-template>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:GTDNumber" />
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для преобразовании даты для регистрационного номера -->
<xsl:template name="date_gtd">
	  <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
<!-- Шаблон для типа natr:TIRIDType -->
<xsl:template match="natr:TIRID">
	<tr>
		<td class="annot graphMain" style="width:50%">Книжка МДП</td>
		<td class="value graphMain" style="width:50%">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="natr:TIRID" />
			<xsl:text> серия: </xsl:text>
			<xsl:value-of select="natr:TIRSeries" />
			<xsl:if test="natr:TIRPageNumber">
				<xsl:text>, номер листа: </xsl:text>
				<xsl:value-of select="natr:TIRPageNumber" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:TransportMeansBaseType -->
<xsl:template match="natr:TransportMeanArrive">
	<tr>
		<td class="graphMain bordered"><xsl:value-of select="cat_ru:VIN" /></td>
		<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportKindCode" /></td>
		<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportMarkCode" /></td>
		<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportIdentifier" /></td>
		<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportMeansNationalityCode" /></td>
		<td class="graphMain bordered"><xsl:value-of select="cat_ru:ActiveTransportIdentifier" /></td>
		<td class="graphMain bordered"><xsl:value-of select="cat_ru:TransportRegNumber" /></td>
	</tr>
</xsl:template>
<!-- Шаблон для формирования даты -->
<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>