<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rt_res="urn:customs.ru:Information:SQDocuments:MvdRoadTrafficAPInfoRes:5.13.1">
	<!-- Шаблон для типа MvdRoadTrafficAPInfoResType -->
	<xsl:template match="rt_res:MvdRoadTrafficAPInfoRes">
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
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:3mm;
									}

									.marg-t1
									{
									margin-top:8mm;
									margin-bottom:3mm;
									font-size: 12pt;
									font-variant: small-caps;
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
										<b>Ответ на запрос сведений об административных правонарушениях в области дорожного движения</b>
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
					<br/>
					<xsl:if test="rt_res:DateTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Время формирования запроса или ответа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rt_res:DateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(rt_res:DateTime, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Количество записей в результате</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rt_res:CountResult"/></td>
						</tr>
					</table>
					<div class="title marg-t1">Результат по отдельному правонарушению</div>
					<table class="bordered w190">
						<xsl:for-each select="rt_res:Result">
							<tr class="title" bgcolor="#e3e3e3">
								<td class="graphMain bordered">№ <xsl:value-of select="position()"/></td>
							</tr>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rt_res:RequestedPersonType -->
	<xsl:template match="rt_res:RequestedPerson">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text> - </xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="rt_res:BirthDate">
			<xsl:text> дата рождения: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="rt_res:BirthDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rt_res:ResultType -->
	<xsl:template match="rt_res:Result">
		<tr>	
			<td class="annot graphMain">
				<table class="w190">
					<xsl:if test="rt_res:RequestID">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор запроса</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rt_res:RequestID"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:UnicNumber">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный номер дела</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rt_res:UnicNumber"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DocType">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип первичного материала</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rt_res:DocType"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DocNumber">
						<tr>
							<td class="annot graphMain" style="width:50%">Серия и номер первичного материала</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rt_res:DocNumber"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:RequestedPerson">
						<tr>
							<td class="annot graphMain" style="width:50%">Сведения о лице, в отношении которого совершается запрос</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rt_res:RequestedPerson"/></td>
						</tr>
					</xsl:if>
				</table>
				<xsl:if test="rt_res:BreachDateTime or rt_res:BreachPlace or rt_res:KOAP or rt_res:ExecDepartment or rt_res:RegionWhere">
					<div class="title marg-top">Сведения о правонарушении</div>
					<table class="w190">
						<xsl:if test="rt_res:BreachDateTime">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время нарушения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rt_res:BreachDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(rt_res:BreachDateTime, 12,8)"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="rt_res:BreachPlace">
							<tr>
								<td class="annot graphMain" style="width:50%">Место нарушения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:for-each select="rt_res:BreachPlace"><xsl:value-of select="."/></xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="rt_res:KOAP">
							<tr>
								<td class="annot graphMain" style="width:50%">Статья КоАП и состав правонарушения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:for-each select="rt_res:KOAP"><xsl:value-of select="."/></xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="rt_res:ExecDepartment">
							<tr>
								<td class="annot graphMain" style="width:50%">Подразделение, выявившее нарушение</td>
								<td class="value graphMain" style="width:50%">
									<xsl:for-each select="rt_res:ExecDepartment"><xsl:value-of select="."/></xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="rt_res:RegionWhere">
							<tr>
								<td class="annot graphMain" style="width:50%">Регион, куда отправлен протокол</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="rt_res:RegionWhere"/></td>
							</tr>
						</xsl:if>
					</table>	
				</xsl:if>
				<div class="title marg-top">Сведения о наказании</div>
				<table class="w190">
					<xsl:if test="rt_res:ExecutionState">
						<tr>
							<td class="annot graphMain" style="width:50%">Состояние делопроизводства по нарушению</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="rt_res:ExecutionState"><xsl:value-of select="."/></xsl:for-each>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DecisionNumber">
						<tr>
							<td class="annot graphMain" style="width:50%">Серия и номер постановления</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rt_res:DecisionNumber"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DecisionDate">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата вынесения постановления</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:DecisionDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:Penalty">
						<tr>
							<td class="annot graphMain" style="width:50%">Вид административного наказания</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rt_res:Penalty"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DecisionSumma">
						<tr>
							<td class="annot graphMain" style="width:50%">Размер штрафа</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rt_res:DecisionSumma"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DecisionTerm">
						<tr>
							<td class="annot graphMain" style="width:50%">Срок лишения права управления в мес</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rt_res:DecisionTerm"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:PostNum">
						<tr>
							<td class="annot graphMain" style="width:50%">Серия и номер постановления</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rt_res:PostNum"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:LicenseWithdrawalDate">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата изъятия водительского удостоверения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:LicenseWithdrawalDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DriveLicenseOutDate">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата возврата водительского удостоверения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:DriveLicenseOutDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DateSSP">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата направления судебным приставам</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:DateSSP"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:WhoDecided">
						<tr>
							<td class="annot graphMain" style="width:50%">Кем вынесено постановление</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rt_res:WhoDecided"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DepartmentDecided">
						<tr>
							<td class="annot graphMain" style="width:50%">Подразделение, где вынесено постановление</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="rt_res:DepartmentDecided"><xsl:value-of select="."/></xsl:for-each>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:SupplierBillID or rt_res:RoskaznaIn">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор платежа в казначействе</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rt_res:SupplierBillID"/>
								<xsl:choose>
									<xsl:when test="rt_res:RoskaznaIn='true' or rt_res:RoskaznaIn='1'"> (подтверждение оплаты из казначейства получено)</xsl:when>
									<xsl:when test="rt_res:RoskaznaIn='false' or rt_res:RoskaznaIn='0'"> (подтверждение оплаты из казначейства отсутствует)</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</xsl:if>
				</table>
				<xsl:if test="rt_res:VehicleInfo">
					<div class="title marg-top">Сведения о транспортном средстве</div>
					<xsl:apply-templates select="rt_res:VehicleInfo"/>
				</xsl:if>
				<br/>
				<table class="w190">
					<xsl:if test="rt_res:StateName">
						<tr>
							<td class="annot graphMain" style="width:50%">Текущее состояние дела</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="rt_res:StateName"><xsl:value-of select="."/></xsl:for-each>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:WaitDate">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата отсрочки</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:WaitDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:RWaitDate">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата отсрочки исполнения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:RWaitDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:DriveLicenseEndDate">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата окончания срока лишения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:DriveLicenseEndDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:EndDate">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата исполнения или закрытия дела</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:EndDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:LicenseStartDate">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата начала исчисления срока</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rt_res:LicenseStartDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="rt_res:ExtensionData">
						<tr>
							<td class="annot graphMain" style="width:50%">Дополнительные сведения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="rt_res:ExtensionData"><xsl:value-of select="."/></xsl:for-each>
							</td>
						</tr>
					</xsl:if>
				</table>
		</td>
	</tr>
	<tr class="title">
		<td class="annot graphMain" style="border-bottom: 1px solid black"><br/></td>
	</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="rt_res:UnicNumber| rt_res:DecisionNumber| rt_res:DocNumber| rt_res:PostNum">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rt_res:VehicleInfoType -->
	<xsl:template match="rt_res:VehicleInfo">
		<xsl:if test="rt_res:VehicleCategory">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Категория ТС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rt_res:VehicleCategory"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rt_res:VehicleModel">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Марка ТС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rt_res:VehicleModel"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rt_res:VehicleOwnerCategory">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Категория владельца ТС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rt_res:VehicleOwnerCategory"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rt_res:VehicleRegPoint">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Гос.рег. знак ТС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rt_res:VehicleRegPoint"/>
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
